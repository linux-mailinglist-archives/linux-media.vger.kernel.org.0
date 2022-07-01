Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF839562AE4
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 07:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbiGAFhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 01:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbiGAFhd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 01:37:33 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9C768A22
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 22:37:32 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 275795C0079;
        Fri,  1 Jul 2022 01:37:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 01 Jul 2022 01:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656653852; x=1656740252; bh=+WVVLsXU76
        7LpEdxwnNzp3rz1zyoNiRy+eziD/WD7Wo=; b=JS0InuZ+IUrOj1tSnvG3Vtt7He
        tKZGFa2IS1IOvfb3vkQU2ILEmN37Ih+pCVZdht4doEMrudcPvOV0VXFlmalaBTsC
        Xx6zRy3orlL00H+BmZ6IVG4JzPcnv5lqlWAMj+7EqhpPEzsEm9FcoChOf+xKSp8v
        Zfr1tECiLWI5wpZc25zQeK0XUezLlqss1O2nYmD8nWV4ZntVZJx4k7jdJ5fHIUKR
        D8TS2/MRwbhlGcfXHMI/AmNlq16Z7+K3mLLTXiHv2Bci5UHDL9zb4o2t433ApX0m
        oqvVyn9w3IsxNuUzyyCASTWQXLS21GinEdcwM+RAM9J9LbrShk3Uj2JUmaxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656653852; x=1656740252; bh=+WVVLsXU767LpEdxwnNzp3rz1zyo
        NiRy+eziD/WD7Wo=; b=ok00iKYyMUN99aTwqhjQLVS5YDT6tWWlJI9bHNlYBJ0y
        smmUEudbG3YPioEjcnltNYk3gtqdTUTXJpiaA0MFy65GKikluxaX6EJOF0g/MmIE
        J0nquDicOPiuA+vLatCt7INkxS0eoVS6mh8pYy63AR0DRV9hofya9ZAwpccJpliZ
        hggqcnu6lSjj+i9nVIw8rQGNxF1RkorXr1YQNPoPjGhsXo0ZWqDur8/VWxPNSc2s
        xUOArXXBKuRHPvnoqb+HnPIhdXChwKkLrae3M8tdsL7eCq9lvJKuMxIEtmNK7360
        QS0giiQ0cm0l67V8emSc1RkNHhAMqSvrMvuugzhfTg==
X-ME-Sender: <xms:G4i-YgLNqaXYCCeBXp6OX9NfNryRuw4WGgzRkDnAeq2EutpUeG_afA>
    <xme:G4i-YgIyShkv1fUu7R1aE2069v3Ev1EQMvnTlT0LMUZrKjRGitosfRQIf9YRr5PwJ
    1q-F7lmTFaerl7BbDc>
X-ME-Received: <xmr:G4i-YgtvvTp8xP2e9HpDqBzmdsRpybm8lojyJIdr5SN_hMXqY6F3gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:G4i-YtaVc2HrTYuENV8nvNba6TSg7rZCKJkqG9YTGRxptJ1_8MS3Lw>
    <xmx:G4i-YnbUYEiNT75AVfhxKhFuCxXRu2Msxl7XrbemhWzaBhyskiXHLg>
    <xmx:G4i-YpAWy4GRYBhcgh6oIiPmSXV4jEZ9u4UhPnYq-dZNZi89JAO-OA>
    <xmx:HIi-Yr5AjFtGNiDMkxS-NLMsOA9S-4cNuyVp_716mTZRdO4s5d2ydA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 01:37:28 -0400 (EDT)
Date:   Fri, 1 Jul 2022 08:37:25 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, heiko@sntech.de,
        laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 50/55] media: rkisp1: Add and set registers for crop for
 i.MX8MP
Message-ID: <20220701053725.zvf2277d7yukmpxq@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-51-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-51-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.06.2022 04:11, Paul Elder wrote:
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
>index 667fca0fef95..e4f422bed09a 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -110,6 +110,8 @@ enum rkisp1_isp_pad {
>  */
> enum rkisp1_feature {
> 	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
>+	RKISP1_FEATURE_DUAL_CROP = BIT(1),
>+	RKISP1_FEATURE_RSZ_CROP = BIT(2),

Missing documentation for these new features

thanks,
Dafna

> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
>index 02854e8ea1a4..753abd024ce7 100644
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
>index a4496ee2e9b4..5abe33f5fed4 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -465,7 +465,8 @@ static const struct rkisp1_info px30_isp_info = {
> 	.isrs = px30_isp_isrs,
> 	.isr_size = ARRAY_SIZE(px30_isp_isrs),
> 	.isp_ver = RKISP1_V12,
>-	.features = RKISP1_FEATURE_MIPI_CSI2,
>+	.features = RKISP1_FEATURE_MIPI_CSI2
>+		  | RKISP1_FEATURE_DUAL_CROP,
> };
>
> static const char * const rk3399_isp_clks[] = {
>@@ -484,7 +485,8 @@ static const struct rkisp1_info rk3399_isp_info = {
> 	.isrs = rk3399_isp_isrs,
> 	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
> 	.isp_ver = RKISP1_V10,
>-	.features = RKISP1_FEATURE_MIPI_CSI2,
>+	.features = RKISP1_FEATURE_MIPI_CSI2
>+		  | RKISP1_FEATURE_DUAL_CROP,
> };
>
> static const char * const imx8mp_isp_clks[] = {
>@@ -503,6 +505,7 @@ static const struct rkisp1_info imx8mp_isp_info = {
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
>2.30.2
>
