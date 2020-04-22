Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78B11B35D8
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 06:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgDVEA3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 00:00:29 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43577 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725308AbgDVEA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 00:00:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 86FFA58046D;
        Wed, 22 Apr 2020 00:00:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 22 Apr 2020 00:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm2; bh=NGhpjRaVKhvDj8NJZcE5WLuEq1
        CNGnmve/laehgEwX4=; b=B8+Om/cERAJzqqSD/dkvjzXMAGZb1DhcwnfESTrNOP
        CRV2gFEXTkK1cMoziqFgjIq0iGbyicb4lXnoBlzi04YmL0BrkzcyuXsdDiHADt7P
        wo9hQBeahsMIxZGLPaJydswh11yaBxZE2nA0WwPBimU21JtGnud9Fxbzt+ydJSJt
        Tt30wPAn/NEl0mnsnlnUyxSW4uc2/Bv3g5wTUZhhZPXqRrLEXkuzSLlhvIvLFHfR
        QOAXSwipzqUV3cnwyC+MmKZw8gTuHG3XMojx3M2ZpngrVU573GD5pgpyGhufwNED
        77U8Axy6MtneVod4B2R5phRISgxLqcsdCwfoXLzbZl1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NGhpjR
        aVKhvDj8NJZcE5WLuEq1CNGnmve/laehgEwX4=; b=fSiy5rqDHNA3ycHI+1ZqJ/
        pT9NNV85dzLzo9HV0cXKr6b8m7Xr6/SSBpheGQRl7fA2OfvKWJy+fqCAs9lyfcFS
        AN4B8+Ru5xLe5VyK9s9pHCWyalllHKY4//H5LQxrTdzXe9kNC77Kfromd4Ckh/LS
        2saMLN1J+wTh984/BI3R4DMYJJf6WnnMxIx+B4+l2fWeIElBAozT0OzKi6ZSGcuM
        7mLCpfvmdztHTkuCc1wFVpB8WPgS6iAfxyls2qzplTOyYarKhgkHJcTpCzwPkWRK
        nYTqvxMDVNth8UeXZT3bl0i9i+nE+q7RDLfB9RQnyGSqE3ufL42Z36KpXMkpICBg
        ==
X-ME-Sender: <xms:WsGfXqGX_M0RQvr7pOxgpIBrH6Z7SZcUBp2EVHQ8RFIQptrzL-aBzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeeigdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkphepje
    dtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:WsGfXgXTWFEZF7yZxo43sFpt7mrJyKD8_xg5O-VmC-Ie3SwnNOsE5w>
    <xmx:WsGfXlAecWoKoBHEEx6XCaVpS2onHarBEczGZjH3xLiZs0hQLi6wiQ>
    <xmx:WsGfXp0L5BmC1OyMuOIzppbsFna3mIjMFej7wclpQCxQfE6p9hNgig>
    <xmx:W8GfXhs2Qf3ZIDWqqsY2NEcAtNCudKR9pSDuuAN_bYjqIa_ITXkKRQ>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id BC8803065CBF;
        Wed, 22 Apr 2020 00:00:25 -0400 (EDT)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/2] media: cedrus: Program output format during each run
Date:   Tue, 21 Apr 2020 23:04:09 -0500
Message-Id: <20200422040410.6251-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previously, the output format was programmed as part of the ioctl()
handler. However, this has two problems:

  1) If there are multiple active streams with different output
     formats, the hardware will use whichever format was set last
     for both streams. Similary, an ioctl() done in an inactive
     context will wrongly affect other active contexts.
  2) The registers are written while the device is not actively
     streaming. To enable runtime PM tied to the streaming state,
     all hardware access needs to be moved inside cedrus_device_run().

The call to cedrus_dst_format_set() is now placed just before the
codec-specific callback that programs the hardware.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Suggested-by: Jernej Škrabec <jernej.skrabec@gmail.com>
Suggested-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

v2: added patch

---
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c   | 2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 4a2fc33a1d79..58c48e4fdfe9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -74,6 +74,8 @@ void cedrus_device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(run.src, run.dst, true);
 
+	cedrus_dst_format_set(dev, &ctx->dst_fmt);
+
 	dev->dec_ops[ctx->current_codec]->setup(ctx, &run);
 
 	/* Complete request(s) controls if needed. */
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 15cf1f10221b..ed3f511f066f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -273,7 +273,6 @@ static int cedrus_s_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
-	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
 	int ret;
 
@@ -287,8 +286,6 @@ static int cedrus_s_fmt_vid_cap(struct file *file, void *priv,
 
 	ctx->dst_fmt = f->fmt.pix;
 
-	cedrus_dst_format_set(dev, &ctx->dst_fmt);
-
 	return 0;
 }
 
-- 
2.24.1

