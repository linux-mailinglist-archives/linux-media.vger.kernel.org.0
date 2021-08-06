Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C673E2264
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242746AbhHFEQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242733AbhHFEQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:34 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D06C061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:18 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id g2-20020a0cdf020000b029033bc8be6d4aso5550656qvl.9
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bMfQaW0c9ygmG1HL2EBTMMtbC3gy/zuhRkysjbbwDZE=;
        b=G1r/Vt4JTwmVH0RLEgrPMC8VD0S1dv6qzknA/Uc6JdUSqR1ESUvfIeYHS1cvTUocQ/
         zvh70XMr/AblVO79lUgyf2hiyqUyd9AaInQBQvOj1b2E4Zn+2KrbfRgVr3JEt2MMm33O
         4ydZHWMziHIqb4uLYUhiZ9FpUdfF32djs1uG8+x6KMY9mxD/lTxRYMOpykUeKTRrkStI
         zB47jlZL8VDA2blAo/T7JUdYUzJ05ygJutiss9dF6AeKD3khEbwMi1VDMDVr1PnYbRdI
         1xwgN96gzjLyv35fUBnBwGvfCu1HwTkXR6rlg3E9AtSzpPYLbdjGUFenjPZwsSuxvlyq
         hHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bMfQaW0c9ygmG1HL2EBTMMtbC3gy/zuhRkysjbbwDZE=;
        b=scwvXmrLNJj71Jb+X0wARrY+XBQtn/z0Fzor0DvRhApCf/3riRwHRzEMwPEh3aYGcv
         VeFBY06K+uq7TzE95Wr5SOc5daP2LQvma+M7j9O5irS0QC5DghC/20xKcoPSQgEHEyGC
         rRSaVbmQWRwP+MAt0BoLpP9BsemsXYnLbKxCcotptzLW0OBWmt3zrIlkwmWMo77FWTUM
         0k+4mtJW6FsIFITKw9G+s38GP3m+lcvg1gtfLqSLjHgscNfq61mRie9V2OyNh8oAKCtf
         LlJwX6pK3i0puMU12aBt8fCrkvvbIe+tsIsEEbfC+xLqU6Nqhj8CnD0zO1QR9ha2CByM
         ZIfw==
X-Gm-Message-State: AOAM533IpP0JoFYXaAmwRHenmC2rb1RLAPKrGwlw80gHYrC+4wxtI2ks
        0Msw5y7vqERxb2uS7p97NCqgtOENZQ91
X-Google-Smtp-Source: ABdhPJzyAq+5cZNvcxvEmI7f+b9UDpMUVJDyph4f6xOIx0BzT20sitCWaYTHY+MakssHRt9b2cHXwTWaKjxK
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:1585:: with SMTP id
 m5mr9060205qvw.48.1628223377884; Thu, 05 Aug 2021 21:16:17 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:23 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-8-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 07/14] media: mtk-vcodec: vdec: handle firmware version field
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

Firmwares for decoders newer than MT8173 will include an ABI version
number in their initialization ack message. Add the capacity to manage
it and make initialization fail if the firmware ABI is of a version that
we don't support.

For MT8173, this ABI version field does not exist ; thus ignore it on
this chip. There should only be one firmware version available for it
anyway.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  4 ++++
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  5 +++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 21 +++++++++++++++++--
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index d77a7688688a..bef49244e61b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -613,6 +613,7 @@ static struct vb2_ops mtk_vdec_frame_vb2_ops = {
 };
 
 const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
+	.chip = MTK_MT8173,
 	.init_vdec_params = mtk_init_vdec_params,
 	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
 	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index a3c401022567..17c960aa5262 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -327,6 +327,8 @@ enum mtk_chip {
  * @vdec_framesizes: supported video decoder frame sizes
  * @num_framesizes: count of video decoder frame sizes
  *
+ * @chip: chip this decoder is compatible with
+ *
  * @uses_stateless_api: whether the decoder uses the stateless API with requests
  */
 
@@ -346,6 +348,8 @@ struct mtk_vcodec_dec_pdata {
 	const struct mtk_codec_framesizes *vdec_framesizes;
 	const int num_framesizes;
 
+	enum mtk_chip chip;
+
 	bool uses_stateless_api;
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
index 68e8d5cb16d7..236bd32dcacc 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h
@@ -83,12 +83,17 @@ struct vdec_ap_ipi_dec_start {
  * @status	: VPU exeuction result
  * @ap_inst_addr	: AP vcodec_vpu_inst instance address
  * @vpu_inst_addr	: VPU decoder instance address
+ * @vdec_abi_version:	ABI version of the firmware. Kernel can use it to
+ *			ensure that it is compatible with the firmware.
+ *			This field is not valid for MT8173 and must not be
+ *			accessed for this chip.
  */
 struct vdec_vpu_ipi_init_ack {
 	uint32_t msg_id;
 	int32_t status;
 	uint64_t ap_inst_addr;
 	uint32_t vpu_inst_addr;
+	uint32_t vdec_abi_version;
 };
 
 #endif
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 58b0e6fa8fd2..203089213e67 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -24,6 +24,22 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	vpu->inst_addr = msg->vpu_inst_addr;
 
 	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
+
+	/* Firmware version field does not exist on MT8173. */
+	if (vpu->ctx->dev->vdec_pdata->chip == MTK_MT8173)
+		return;
+
+	/* Check firmware version. */
+	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", msg->vdec_abi_version);
+	switch (msg->vdec_abi_version) {
+	case 1:
+		break;
+	default:
+		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
+			       msg->vdec_abi_version);
+		vpu->failure = 1;
+		break;
+	}
 }
 
 /*
@@ -44,6 +60,9 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 
 	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
 
+	vpu->failure = msg->status;
+	vpu->signaled = 1;
+
 	if (msg->status == 0) {
 		switch (msg->msg_id) {
 		case VPU_IPIMSG_DEC_INIT_ACK:
@@ -63,8 +82,6 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 	}
 
 	mtk_vcodec_debug(vpu, "- id=%X", msg->msg_id);
-	vpu->failure = msg->status;
-	vpu->signaled = 1;
 }
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
-- 
2.32.0.605.g8dce9f2422-goog

