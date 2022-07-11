Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E0F56D320
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 04:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiGKC5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 22:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGKC5u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 22:57:50 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C81F183B2
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 19:57:49 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 3B4CB3200302;
        Sun, 10 Jul 2022 22:57:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 10 Jul 2022 22:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657508267; x=1657594667; bh=qhpAkA+Pb0
        zLcaOyclJ0S6+4MguNOE2v1JbBK+O/yy4=; b=bcAXVX50brcdJ9V6HYBXOENM9D
        Nzx5qB1PkfHrkixIM8q9y5KeTIlIUiYdXocmgyca0LMFnS51dn0cLsWIEv+5rPF6
        dUGbdcifCXyKcRjKVBPdKKquClxYc/QvK6x0pJJk7SrCCd+t+Ijhz4qjKdVxwgjB
        zbSeMm47gSbOLiNi7Pfh3aMuKpZcQEV+oItoWhwTNtBsdus9BZYo5uDhJmRHSh3j
        VfrnCR1jgh8zjH0KT2h4NTl9jwUFhkUaiYayAzScUWSZ4uxQu2qirqpXtiDe1Arc
        awuRLUlq6cjNuqhF0qjErkxe4x2bgRDO2GqoegrpMhOG4h48r6xNWyygIMoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657508267; x=1657594667; bh=qhpAkA+Pb0zLcaOyclJ0S6+4MguN
        OE2v1JbBK+O/yy4=; b=KfHcfu7vN7YLM0nfVrmevvzYIAq8M1u7kaNOIoEougDo
        T7fQn1eYwvz1kvMSo/u/Poll9Y00IH4VrjwYL9WmvYzk3mOE69SERbRXjwOw6l4m
        wICaM0vsAQYZSa/M2s7Uk++SF3R8VQ2K02EQ7YDcFQgB43i9O2NPf9QRq6V/tO8X
        NxvLvIcgongoQM4o5RzEqvIw62kumOTT+veIPra6l8WVhLjm26Gkb49xzYHPVFNq
        pBW8D9VbvDDr0QpLor6RAhS7PNe109fwAIt78IcRLd+6EffdCW0kpEVCqGqvqiUy
        6O0MgMCOJ07tNSoisdQ6f+J+biNhD333AdafjGdA0A==
X-ME-Sender: <xms:q5HLYikdJ_kWRKz79WKHPYaMMSlYomHvmu-drPZfl9dUdlI8ZsLZBA>
    <xme:q5HLYp1cnPHyrWbE9yVze4b3LXEDAkPK-BxqLjkuI8zbTLSkm8ZgjarVe3pdpXvcK
    E_njq_NnbD0nxaA47U>
X-ME-Received: <xmr:q5HLYgrV5NhTBXSnkY_kxXho3oOGmBspqJWfYmGOoq-_L1gp52XUdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:q5HLYmkd8Ub9X4VhJ05D1s5FWx3XPBRsP7z1APg-HVGrz_XP8za3jw>
    <xmx:q5HLYg2gJTwQfUiiUFpCzV5EBEpGTby4z_-WV2SJJJj1CTDKbcnNRA>
    <xmx:q5HLYttvs7x1fcgPfbA3VIIhJdzHoC2XoLpaQFbat069Jz-3TZrROA>
    <xmx:q5HLYjRWFxM0O8EurKoh0zZhzu1vdKqrm6x4jjXeIUHmE-hmLeViOA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 22:57:45 -0400 (EDT)
Date:   Mon, 11 Jul 2022 05:57:42 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 50/55] media: rkisp1: Add and set registers for crop
 for i.MX8MP
Message-ID: <20220711025742.2a2pn5lvr7mwxufu@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-51-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-51-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:07, Laurent Pinchart wrote:
>From: Paul Elder <paul.elder@ideasonboard.com>
>
>The ISP version in the i.MX8MP has a separate set of registers for crop
>that is currently not handled. Add a feature flag to determine which
>type of crop the ISP supports and set the crop registers based on that.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 ++
> .../platform/rockchip/rkisp1/rkisp1-debug.c   | 14 +++++++++++++-
> .../platform/rockchip/rkisp1/rkisp1-dev.c     |  7 +++++--
> .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 +++++++++
> .../platform/rockchip/rkisp1/rkisp1-resizer.c | 19 +++++++++++++++++--
> 5 files changed, 46 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index 7e2aa0a2b86d..18a48ecda173 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -110,6 +110,8 @@ enum rkisp1_isp_pad {
>  */
> enum rkisp1_feature {
> 	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
>+	RKISP1_FEATURE_DUAL_CROP = BIT(1),
>+	RKISP1_FEATURE_RSZ_CROP = BIT(2),

missing doc for the new features

thanks,
Dafna

> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>index 1a59c00fabdd..2d4e1d3f8adb 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>@@ -115,9 +115,21 @@ static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
> 		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_VC),
> 		{ /* Sentinel */ },
> 	};
>+	static const struct rkisp1_debug_register crop_registers[] = {
>+		RKISP1_DEBUG_SHD_REG(RSZ_CROP_X_DIR),
>+		RKISP1_DEBUG_SHD_REG(RSZ_CROP_Y_DIR),
>+		RKISP1_DEBUG_REG(RSZ_FRAME_RATE),
>+		RKISP1_DEBUG_REG(RSZ_FORMAT_CONV_CTRL),
>+		{ /* Sentinel */ },
>+	};
> 	struct rkisp1_resizer *rsz = m->private;
>
>-	return rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base, registers);
>+	rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base, registers);
>+	if (rsz->rkisp1->info->features & RKISP1_FEATURE_RSZ_CROP)
>+		rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base,
>+				       crop_registers);
>+
>+	return 0;
> }
> DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index b6643020b831..003bd7db54b9 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -475,7 +475,8 @@ static const struct rkisp1_info px30_isp_info = {
> 	.isrs = px30_isp_isrs,
> 	.isr_size = ARRAY_SIZE(px30_isp_isrs),
> 	.isp_ver = RKISP1_V12,
>-	.features = RKISP1_FEATURE_MIPI_CSI2,
>+	.features = RKISP1_FEATURE_MIPI_CSI2
>+		  | RKISP1_FEATURE_DUAL_CROP,
> };
>
> static const char * const rk3399_isp_clks[] = {
>@@ -494,7 +495,8 @@ static const struct rkisp1_info rk3399_isp_info = {
> 	.isrs = rk3399_isp_isrs,
> 	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
> 	.isp_ver = RKISP1_V10,
>-	.features = RKISP1_FEATURE_MIPI_CSI2,
>+	.features = RKISP1_FEATURE_MIPI_CSI2
>+		  | RKISP1_FEATURE_DUAL_CROP,
> };
>
> static const char * const imx8mp_isp_clks[] = {
>@@ -513,6 +515,7 @@ static const struct rkisp1_info imx8mp_isp_info = {
> 	.isrs = imx8mp_isp_isrs,
> 	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> 	.isp_ver = IMX8MP_V10,
>+	.features = RKISP1_FEATURE_RSZ_CROP,
> };
>
> static const struct of_device_id rkisp1_of_match[] = {
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>index dd3e6c38be67..1fc54ab22b6d 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>@@ -168,6 +168,9 @@
> #define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO		BIT(9)
> #define RKISP1_CIF_RSZ_SCALER_FACTOR			BIT(16)
>
>+/* RSZ_CROP_[XY]_DIR */
>+#define RKISP1_CIF_RSZ_CROP_XY_DIR(start, end)		((end) << 16 | (start) << 0)
>+
> /* MI_IMSC - MI_MIS - MI_RIS - MI_ICR - MI_ISR */
> #define RKISP1_CIF_MI_FRAME(stream)			BIT((stream)->id)
> #define RKISP1_CIF_MI_MBLK_LINE				BIT(2)
>@@ -926,6 +929,12 @@
> #define RKISP1_CIF_RSZ_PHASE_HC_SHD		0x004C
> #define RKISP1_CIF_RSZ_PHASE_VY_SHD		0x0050
> #define RKISP1_CIF_RSZ_PHASE_VC_SHD		0x0054
>+#define RKISP1_CIF_RSZ_CROP_X_DIR		0x0058
>+#define RKISP1_CIF_RSZ_CROP_Y_DIR		0x005C
>+#define RKISP1_CIF_RSZ_CROP_X_DIR_SHD		0x0060
>+#define RKISP1_CIF_RSZ_CROP_Y_DIR_SHD		0x0064
>+#define RKISP1_CIF_RSZ_FRAME_RATE		0x0068
>+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL		0x006C
>
> #define RKISP1_CIF_MI_BASE			0x00001400
> #define RKISP1_CIF_MI_CTRL			(RKISP1_CIF_MI_BASE + 0x00000000)
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>index f4caa8f684aa..08bf3aa8088f 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>@@ -244,6 +244,7 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
> {
> 	u32 ratio, rsz_ctrl = 0;
> 	unsigned int i;
>+	u32 val;
>
> 	/* No phase offset */
> 	rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_PHASE_HY, 0);
>@@ -292,6 +293,18 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
>
> 	rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CTRL, rsz_ctrl);
>
>+	if (rsz->rkisp1->info->features & RKISP1_FEATURE_RSZ_CROP) {
>+		val = RKISP1_CIF_RSZ_CROP_XY_DIR(src_y->left, src_y->left + src_y->width - 1);
>+		rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CROP_X_DIR, val);
>+		val = RKISP1_CIF_RSZ_CROP_XY_DIR(src_y->top, src_y->top + src_y->height - 1);
>+		rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_CROP_Y_DIR, val);
>+
>+		val = RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_INPUT_FORMAT_YCBCR_422
>+		    | RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_OUTPUT_FORMAT_YCBCR_420
>+		    | RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_PACK_FORMAT_SEMI_PLANAR;
>+		rkisp1_rsz_write(rsz, RKISP1_CIF_RSZ_FORMAT_CONV_CTRL, val);
>+	}
>+
> 	rkisp1_rsz_update_shadow(rsz, when);
> }
>
>@@ -656,7 +669,8 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
> 	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
>
> 	if (!enable) {
>-		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
>+		if (rkisp1->info->features & RKISP1_FEATURE_DUAL_CROP)
>+			rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
> 		rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
> 		return 0;
> 	}
>@@ -666,7 +680,8 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
>
> 	mutex_lock(&rsz->ops_lock);
> 	rkisp1_rsz_config(rsz, when);
>-	rkisp1_dcrop_config(rsz);
>+	if (rkisp1->info->features & RKISP1_FEATURE_DUAL_CROP)
>+		rkisp1_dcrop_config(rsz);
>
> 	mutex_unlock(&rsz->ops_lock);
> 	return 0;
>-- 
>Regards,
>
>Laurent Pinchart
>
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
