Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA0955CFEC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236560AbiF0RmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 13:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiF0RmF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 13:42:05 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5EF11828
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 10:42:02 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id ED46783D52;
        Mon, 27 Jun 2022 19:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656351720;
        bh=DFt6xrCK8qpkFWykXpHB/DsnJHdzQY9zBpnpvIlxm24=;
        h=From:To:Cc:Subject:Date:From;
        b=dx8EvBPtnQw0ZULPxTLaTXAmkrNxK3gNBlVx5nEEOvWokt6M0xfLRhRPfgafhKN5q
         zf7KIZehIhDmKIrSorLpkOaOjy1zql2ei0qpVvdb6kUhMkJIufrJKF37cRrooAmLCg
         bC8e/92qyVmRsHOsjh26lcGm4frfeDvriXm3EMcRHxHoWA2cWvVe2WHFaZwQHgflfX
         GM+VhOjGvAB4aG8gykYetV4RqGcpUWPGyK4Aw/EBTnQvvvG/MRyozklHpEmzgy9eoX
         hhHs7ljmifu1TrWlRaV2y+C+rnTfHL8Rsi6QxAd5s8hTAURLDv0RI7XMAdWu8BahLF
         CndMwCzXGI/iA==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Date:   Mon, 27 Jun 2022 19:41:56 +0200
Message-Id: <20220627174156.66919-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Any local subdev state should be allocated and free'd using
__v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
takes care of calling .init_cfg() subdev op. Without this,
subdev internal state might be uninitialized by the time
any other subdev op is called.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
V2: Add FIXME comment above __v4l2_subdev_state_alloc() calls
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 59 ++++++++++++--------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index c604d672c2156..c68d32931b277 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -996,22 +996,30 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 			struct dcmi_framesize *sd_framesize)
 {
 	const struct dcmi_format *sd_fmt;
+	static struct lock_class_key key;
 	struct dcmi_framesize sd_fsize;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
+	struct v4l2_subdev_state *sd_state;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
 	bool do_crop;
 	int ret;
 
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
+	if (IS_ERR(sd_state))
+		return PTR_ERR(sd_state);
+
 	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
 	if (!sd_fmt) {
-		if (!dcmi->num_of_sd_formats)
-			return -ENODATA;
+		if (!dcmi->num_of_sd_formats) {
+			ret = -ENODATA;
+			goto done;
+		}
 
 		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
 		pix->pixelformat = sd_fmt->fourcc;
@@ -1036,10 +1044,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
+	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
 	if (ret < 0)
-		return ret;
+		goto done;
 
 	/* Update pix regarding to what sensor can do */
 	v4l2_fill_pix_format(pix, &format.format);
@@ -1079,7 +1086,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
 	if (sd_framesize)
 		*sd_framesize = sd_fsize;
 
-	return 0;
+done:
+	__v4l2_subdev_state_free(sd_state);
+	return ret;
 }
 
 static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
@@ -1183,31 +1192,37 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
 				  struct v4l2_pix_format *pix)
 {
 	const struct dcmi_format *sd_fmt;
+	static struct lock_class_key key;
+	struct v4l2_subdev_state *sd_state;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
-	struct v4l2_subdev_pad_config pad_cfg;
-	struct v4l2_subdev_state pad_state = {
-		.pads = &pad_cfg
-		};
 	int ret;
 
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
+	if (IS_ERR(sd_state))
+		return PTR_ERR(sd_state);
+
 	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
 	if (!sd_fmt) {
-		if (!dcmi->num_of_sd_formats)
-			return -ENODATA;
+		if (!dcmi->num_of_sd_formats) {
+			ret = -ENODATA;
+			goto done;
+		}
 
 		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
 		pix->pixelformat = sd_fmt->fourcc;
 	}
 
 	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
-	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
-			       &pad_state, &format);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
+done:
+	__v4l2_subdev_state_free(sd_state);
+	return ret;
 }
 
 static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,
-- 
2.35.1

