Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05AD1754636
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjGOCQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjGOCQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:29 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129B22D68
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:26 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 45FF2660705F;
        Sat, 15 Jul 2023 03:16:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387383;
        bh=cz58yacjV5pcpC0Nx8f0U1VGEZtVdV1fXq3JnRj4+o0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z+Uy6wNvEfu3tiRMQdLPGH40pvJDXeyWEF80YeT7W5IrSglA9g3SR6u0YhewgMhXq
         xYG9mykXgFtgLrbqRnletEFfv0ffc3Tn67QxRauAW7uWILEaDk6Y2Q2lbNetr2z6tK
         T7HRNjWhFNb1UqxhkzNyVUmVEYKUo1iE8Gqb34kPSmj/LDHoHpxIi4B/Zauz3D+zRu
         MQi08gSJSn6jv1rWdlq7mr7rK3Ie8DUORPiTSWyszqhLRSC6cEPtJIFLi+89yEtWLc
         mo5QpRgSX1cWUZqJE7dt2kKekfoVm9WNZXB497LeIpd/epdDg5jgMoVolY6BvmqJKC
         0A0XbWvF76Row==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 01/13] media: bttv: use video_drvdata to get bttv
Date:   Fri, 14 Jul 2023 19:15:57 -0700
Message-Id: <684ddbb4d56662cfd23e31e0cb55cef0b85473f4.1689379982.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1689379982.git.deborah.brouwer@collabora.com>
References: <cover.1689379982.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use video_drvdata(file) instead of fh->btv to get the bttv pointer
wherever the bttv pointer will still be needed after the vb2 conversion.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 77 ++++++++++-----------------
 drivers/media/pci/bt8xx/bttv-vbi.c    |  8 +--
 2 files changed, 32 insertions(+), 53 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 734f02b91aa3..0d5fdb8479d5 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1654,8 +1654,7 @@ static void radio_enable(struct bttv *btv)
 
 static int bttv_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
-	struct bttv_fh *fh  = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	unsigned int i;
 
 	for (i = 0; i < BTTV_TVNORMS; i++)
@@ -1670,8 +1669,7 @@ static int bttv_s_std(struct file *file, void *priv, v4l2_std_id id)
 
 static int bttv_g_std(struct file *file, void *priv, v4l2_std_id *id)
 {
-	struct bttv_fh *fh  = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	*id = btv->std;
 	return 0;
@@ -1679,8 +1677,7 @@ static int bttv_g_std(struct file *file, void *priv, v4l2_std_id *id)
 
 static int bttv_querystd(struct file *file, void *f, v4l2_std_id *id)
 {
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (btread(BT848_DSTATUS) & BT848_DSTATUS_NUML)
 		*id &= V4L2_STD_625_50;
@@ -1692,8 +1689,7 @@ static int bttv_querystd(struct file *file, void *f, v4l2_std_id *id)
 static int bttv_enum_input(struct file *file, void *priv,
 					struct v4l2_input *i)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (i->index >= bttv_tvcards[btv->c.type].video_inputs)
 		return -EINVAL;
@@ -1725,8 +1721,7 @@ static int bttv_enum_input(struct file *file, void *priv,
 
 static int bttv_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	*i = btv->input;
 
@@ -1735,8 +1730,7 @@ static int bttv_g_input(struct file *file, void *priv, unsigned int *i)
 
 static int bttv_s_input(struct file *file, void *priv, unsigned int i)
 {
-	struct bttv_fh *fh  = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (i >= bttv_tvcards[btv->c.type].video_inputs)
 		return -EINVAL;
@@ -1748,8 +1742,7 @@ static int bttv_s_input(struct file *file, void *priv, unsigned int i)
 static int bttv_s_tuner(struct file *file, void *priv,
 					const struct v4l2_tuner *t)
 {
-	struct bttv_fh *fh  = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (t->index)
 		return -EINVAL;
@@ -1767,8 +1760,7 @@ static int bttv_s_tuner(struct file *file, void *priv,
 static int bttv_g_frequency(struct file *file, void *priv,
 					struct v4l2_frequency *f)
 {
-	struct bttv_fh *fh  = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (f->tuner)
 		return -EINVAL;
@@ -1804,8 +1796,7 @@ static void bttv_set_frequency(struct bttv *btv, const struct v4l2_frequency *f)
 static int bttv_s_frequency(struct file *file, void *priv,
 					const struct v4l2_frequency *f)
 {
-	struct bttv_fh *fh  = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (f->tuner)
 		return -EINVAL;
@@ -1817,8 +1808,7 @@ static int bttv_s_frequency(struct file *file, void *priv,
 static int bttv_log_status(struct file *file, void *f)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct bttv_fh *fh  = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	v4l2_ctrl_handler_log_status(vdev->ctrl_handler, btv->c.v4l2_dev.name);
 	bttv_call_all(btv, core, log_status);
@@ -1829,8 +1819,7 @@ static int bttv_log_status(struct file *file, void *f)
 static int bttv_g_register(struct file *file, void *f,
 					struct v4l2_dbg_register *reg)
 {
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	/* bt848 has a 12-bit register space */
 	reg->reg &= 0xfff;
@@ -1843,8 +1832,7 @@ static int bttv_g_register(struct file *file, void *f,
 static int bttv_s_register(struct file *file, void *f,
 					const struct v4l2_dbg_register *reg)
 {
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	/* bt848 has a 12-bit register space */
 	btwrite(reg->val, reg->reg & 0xfff);
@@ -2106,7 +2094,7 @@ static int bttv_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	const struct bttv_format *fmt;
 	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	enum v4l2_field field;
 	__s32 width, height;
 	__s32 height2;
@@ -2165,7 +2153,7 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 	int retval;
 	const struct bttv_format *fmt;
 	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	__s32 width, height;
 	unsigned int width_mask, width_bias;
 	enum v4l2_field field;
@@ -2209,8 +2197,7 @@ static int bttv_s_fmt_vid_cap(struct file *file, void *priv,
 static int bttv_querycap(struct file *file, void  *priv,
 				struct v4l2_capability *cap)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (0 == v4l2)
 		return -EINVAL;
@@ -2274,7 +2261,7 @@ static int bttv_querybuf(struct file *file, void *priv,
 static int bttv_qbuf(struct file *file, void *priv, struct v4l2_buffer *b)
 {
 	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	int res = bttv_resource(fh);
 
 	if (!check_alloc_btres_lock(btv, fh, res))
@@ -2322,8 +2309,7 @@ static int bttv_streamoff(struct file *file, void *priv,
 static int bttv_g_parm(struct file *file, void *f,
 				struct v4l2_streamparm *parm)
 {
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -2337,8 +2323,7 @@ static int bttv_g_parm(struct file *file, void *f,
 static int bttv_g_tuner(struct file *file, void *priv,
 				struct v4l2_tuner *t)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (0 != t->index)
 		return -EINVAL;
@@ -2360,8 +2345,7 @@ static int bttv_g_tuner(struct file *file, void *priv,
 static int bttv_g_pixelaspect(struct file *file, void *priv,
 			      int type, struct v4l2_fract *f)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -2374,7 +2358,7 @@ static int bttv_g_pixelaspect(struct file *file, void *priv,
 static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *sel)
 {
 	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -2404,7 +2388,7 @@ static int bttv_g_selection(struct file *file, void *f, struct v4l2_selection *s
 static int bttv_s_selection(struct file *file, void *f, struct v4l2_selection *sel)
 {
 	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	const struct v4l2_rect *b;
 	int retval;
 	struct bttv_crop c;
@@ -2781,7 +2765,7 @@ static int radio_open(struct file *file)
 static int radio_release(struct file *file)
 {
 	struct bttv_fh *fh = file->private_data;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	struct saa6588_command cmd;
 
 	file->private_data = NULL;
@@ -2800,8 +2784,7 @@ static int radio_release(struct file *file)
 
 static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (0 != t->index)
 		return -EINVAL;
@@ -2823,8 +2806,7 @@ static int radio_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 static int radio_s_tuner(struct file *file, void *priv,
 					const struct v4l2_tuner *t)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (0 != t->index)
 		return -EINVAL;
@@ -2837,8 +2819,7 @@ static int radio_s_tuner(struct file *file, void *priv,
 static int radio_s_hw_freq_seek(struct file *file, void *priv,
 					const struct v4l2_hw_freq_seek *a)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (btv->has_tea575x)
 		return snd_tea575x_s_hw_freq_seek(file, &btv->tea, a);
@@ -2849,8 +2830,7 @@ static int radio_s_hw_freq_seek(struct file *file, void *priv,
 static int radio_enum_freq_bands(struct file *file, void *priv,
 					 struct v4l2_frequency_band *band)
 {
-	struct bttv_fh *fh = priv;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 
 	if (btv->has_tea575x)
 		return snd_tea575x_enum_freq_bands(&btv->tea, band);
@@ -2861,8 +2841,7 @@ static int radio_enum_freq_bands(struct file *file, void *priv,
 static ssize_t radio_read(struct file *file, char __user *data,
 			 size_t count, loff_t *ppos)
 {
-	struct bttv_fh *fh = file->private_data;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	struct saa6588_command cmd;
 
 	cmd.block_count = count / 3;
@@ -2880,7 +2859,7 @@ static ssize_t radio_read(struct file *file, char __user *data,
 static __poll_t radio_poll(struct file *file, poll_table *wait)
 {
 	struct bttv_fh *fh = file->private_data;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	__poll_t req_events = poll_requested_events(wait);
 	struct saa6588_command cmd;
 	__poll_t res = 0;
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index ce36a2c0f60b..24b28a05bfd9 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -299,8 +299,7 @@ static int try_fmt(struct v4l2_vbi_format *f, const struct bttv_tvnorm *tvnorm,
 
 int bttv_try_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 {
-	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	const struct bttv_tvnorm *tvnorm;
 	__s32 crop_start;
 
@@ -318,7 +317,7 @@ int bttv_try_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 int bttv_s_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 {
 	struct bttv_fh *fh = f;
-	struct bttv *btv = fh->btv;
+	struct bttv *btv = video_drvdata(file);
 	const struct bttv_tvnorm *tvnorm;
 	__s32 start1, end;
 	int rc;
@@ -367,10 +366,11 @@ int bttv_g_fmt_vbi_cap(struct file *file, void *f, struct v4l2_format *frt)
 {
 	struct bttv_fh *fh = f;
 	const struct bttv_tvnorm *tvnorm;
+	struct bttv *btv = video_drvdata(file);
 
 	frt->fmt.vbi = fh->vbi_fmt.fmt;
 
-	tvnorm = &bttv_tvnorms[fh->btv->tvnorm];
+	tvnorm = &bttv_tvnorms[btv->tvnorm];
 
 	if (tvnorm != fh->vbi_fmt.tvnorm) {
 		__s32 max_end;
-- 
2.40.1

