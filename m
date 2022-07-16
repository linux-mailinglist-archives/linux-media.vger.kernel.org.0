Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8887D576C1D
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 07:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiGPF45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 01:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiGPF4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 01:56:55 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39342481C8
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 22:56:54 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 99E255C0097;
        Sat, 16 Jul 2022 01:56:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 16 Jul 2022 01:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657951013; x=1658037413; bh=PW3mJzmicw
        8UB2/rc8VrHQMws6ZIHtm00kQkfxdM83s=; b=o35o5HEJXvPFydQEOL0aXXJbt3
        GSF7fTWckdhU9EZh8k2/5F94J6NfOBrThQ+kBAYNc58Iwn3N50iNlF5DsIpLH+Ug
        qHrwp+1QdvKGnQWeG4Wb5Xp7bHx4wXGhJQ7TXEH60kOuL8whaFHi9OeuhG4DQvNW
        zEJWYrfIluRfJiFYyGrSWw5WpglxQl5BJ4Je3rdIAgjd5bj0Ejo0n1lguULlJQu9
        szpDyYt4NKZJr+czCR+AVXgpDtZEKFSR+OuTPjheOFwIYdHapngaKQ9KxdMTT3xz
        yL3wrrHvLOZtqUb7TCjNFIT01iHthBPC5qpPbVa4bv9KIBY1ZGf/iMvzQAWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657951013; x=1658037413; bh=PW3mJzmicw8UB2/rc8VrHQMws6ZI
        Htm00kQkfxdM83s=; b=NmsbD88DQ5/6OSg8WzP7JGOUxVDtFyybM3qG7xiY7lii
        jR3qJKCaEOP+g3Z8Uk37FTyrKu0AbuKI+OAKVFi8qEQky8Le1WILetNpR0FWAfPB
        2yD9GDFCZvI3ymoXqe83//V8i8USjbU5tsBAZ5W77KeaOGWqDSqdBscUB1CLqEIB
        UxtZ17t8RkXMtCypQPLKiFme55KbBUe1/w60iNfoe/DobSPUsJHMnGMNVYYlzqZc
        3SYSDF6zh+HDOxufSGcBph3dm+gd8nO3pa589GUiK3qRkM/eGnx7QnHKr2/EknKK
        9Y8G/iruyTiin7TMflsn8Xo3wQUEOx7U0yYPd67vrw==
X-ME-Sender: <xms:JVPSYuJvm1Mm3x3ELmIt3tl4xgqEyew07qBYFmchvZ1Jf1TB-wNGpw>
    <xme:JVPSYmLLAahy9S88P2erkHv2wCyns2dHpZdrTFU8RpJCee-n7D3z8hqG7y98vA9YE
    D9k7WG08AYYaTonXa8>
X-ME-Received: <xmr:JVPSYuv8NZfZJ-PGkVOLF2jPPoT0sLOsi-LsP76OViyOeM-KuKj9Iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekvddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:JVPSYjY-vxraZ1QZUz5Q1Lu7ZbG9AB4BmlZ7b4I0W8PcwKop14PZgg>
    <xmx:JVPSYlbFXZ-tmVU3PpyKZYw0q5xI_hV1PLX5oyu2F4gpNGSvQZIttA>
    <xmx:JVPSYvDlZho0nnZ5BsUc2dE0-QL04zi-nE4E6geGwepW-HLZm7WFIQ>
    <xmx:JVPSYpEZbIE1I3dduHJ6MvPxfd8m5Sgs2o_w8UQ9KO7nogD1vNWT9A>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Jul 2022 01:56:51 -0400 (EDT)
Date:   Sat, 16 Jul 2022 08:56:48 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH 2/3] media: rockchip: rkisp1: Mask invalid bits in DPCC
 parameters
Message-ID: <20220716055648.unpih6bsy6cpj5ld@guri>
References: <20220616160456.21549-1-laurent.pinchart@ideasonboard.com>
 <20220616160456.21549-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220616160456.21549-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16.06.2022 19:04, Laurent Pinchart wrote:
>Restrict the DPCC configuration that can be set by userspace to valid
>register bits. To do so, reorganize the related register macros to
>define valid bitmasks, as well as bits of the DPCC mode register.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-params.c  | 44 ++++++++++++-------
> .../platform/rockchip/rkisp1/rkisp1-regs.h    | 26 +++++------
> 2 files changed, 41 insertions(+), 29 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>index 140012fa18f0..94e834cd2a21 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
>@@ -58,35 +58,47 @@ static void rkisp1_dpcc_config(struct rkisp1_params *params,
> 	unsigned int i;
> 	u32 mode;
>
>-	/* avoid to override the old enable value */
>+	/*
>+	 * The enable bit is controlled in rkisp1_isp_isr_other_config() and
>+	 * must be preserved. The grayscale mode should be configured
>+	 * automatically based on the media bus code on the ISP sink pad, so
>+	 * only the STAGE1_ENABLE bit can be set by userspace.
>+	 */
> 	mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_DPCC_MODE);
>-	mode &= RKISP1_CIF_ISP_DPCC_ENA;
>-	mode |= arg->mode & ~RKISP1_CIF_ISP_DPCC_ENA;
>+	mode &= RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE;
>+	mode |= arg->mode & RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;
> 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_MODE, mode);
>+
> 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_OUTPUT_MODE,
>-		     arg->output_mode);
>+		     arg->output_mode & RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_MASK);
> 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_SET_USE,
>-		     arg->set_use);
>+		     arg->set_use & RKISP1_CIF_ISP_DPCC_SET_USE_MASK);
>
> 	for (i = 0; i < RKISP1_CIF_ISP_DPCC_METHODS_MAX; i++) {
> 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_METHODS_SET(i),
>-			     arg->methods[i].method);
>+			     arg->methods[i].method &
>+			     RKISP1_CIF_ISP_DPCC_METHODS_SET_MASK);
> 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_THRESH(i),
>-			     arg->methods[i].line_thresh);
>+			     arg->methods[i].line_thresh &
>+			     RKISP1_CIF_ISP_DPCC_LINE_THRESH_MASK);
> 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_LINE_MAD_FAC(i),
>-			     arg->methods[i].line_mad_fac);
>+			     arg->methods[i].line_mad_fac &
>+			     RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_MASK);
> 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_PG_FAC(i),
>-			     arg->methods[i].pg_fac);
>+			     arg->methods[i].pg_fac &
>+			     RKISP1_CIF_ISP_DPCC_PG_FAC_MASK);
> 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_RND_THRESH(i),
>-			     arg->methods[i].rnd_thresh);
>+			     arg->methods[i].rnd_thresh &
>+			     RKISP1_CIF_ISP_DPCC_RND_THRESH_MASK);
> 		rkisp1_write(params->rkisp1, RKISP1_ISP_DPCC_RG_FAC(i),
>-			     arg->methods[i].rg_fac);
>+			     arg->methods[i].rg_fac &
>+			     RKISP1_CIF_ISP_DPCC_RG_FAC_MASK);
> 	}
>
> 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_RND_OFFS,
>-		     arg->rnd_offs);
>+		     arg->rnd_offs & RKISP1_CIF_ISP_DPCC_RND_OFFS_MASK);
> 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPCC_RO_LIMITS,
>-		     arg->ro_limits);
>+		     arg->ro_limits & RKISP1_CIF_ISP_DPCC_RO_LIMIT_MASK);
> }
>
> /* ISP black level subtraction interface function */
>@@ -1214,11 +1226,11 @@ rkisp1_isp_isr_other_config(struct rkisp1_params *params,
> 		if (module_ens & RKISP1_CIF_ISP_MODULE_DPCC)
> 			rkisp1_param_set_bits(params,
> 					      RKISP1_CIF_ISP_DPCC_MODE,
>-					      RKISP1_CIF_ISP_DPCC_ENA);
>+					      RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> 		else
> 			rkisp1_param_clear_bits(params,
> 						RKISP1_CIF_ISP_DPCC_MODE,
>-						RKISP1_CIF_ISP_DPCC_ENA);
>+						RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> 	}
>
> 	/* update bls config */
>@@ -1580,7 +1592,7 @@ void rkisp1_params_configure(struct rkisp1_params *params,
> void rkisp1_params_disable(struct rkisp1_params *params)
> {
> 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPCC_MODE,
>-				RKISP1_CIF_ISP_DPCC_ENA);
>+				RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE);
> 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_LSC_CTRL,
> 				RKISP1_CIF_ISP_LSC_CTRL_ENA);
> 	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_BLS_CTRL,
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>index dd3e6c38be67..dc01f968c19d 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>@@ -618,19 +618,19 @@
> #define RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA_READ(x)	(((x) >> 11) & 1)
>
> /* DPCC */
>-/* ISP_DPCC_MODE */
>-#define RKISP1_CIF_ISP_DPCC_ENA				BIT(0)
>-#define RKISP1_CIF_ISP_DPCC_MODE_MAX			0x07
>-#define RKISP1_CIF_ISP_DPCC_OUTPUTMODE_MAX		0x0F
>-#define RKISP1_CIF_ISP_DPCC_SETUSE_MAX			0x0F
>-#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RESERVED	0xFFFFE000
>-#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_RESERVED	0xFFFF0000
>-#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_RESERVED	0xFFFFC0C0
>-#define RKISP1_CIF_ISP_DPCC_PG_FAC_RESERVED		0xFFFFC0C0
>-#define RKISP1_CIF_ISP_DPCC_RND_THRESH_RESERVED		0xFFFF0000
>-#define RKISP1_CIF_ISP_DPCC_RG_FAC_RESERVED		0xFFFFC0C0
>-#define RKISP1_CIF_ISP_DPCC_RO_LIMIT_RESERVED		0xFFFFF000
>-#define RKISP1_CIF_ISP_DPCC_RND_OFFS_RESERVED		0xFFFFF000
>+#define RKISP1_CIF_ISP_DPCC_MODE_DPCC_ENABLE		BIT(0)
>+#define RKISP1_CIF_ISP_DPCC_MODE_GRAYSCALE_MODE		BIT(1)
>+#define RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE		BIT(2)
>+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_MASK		GENMASK(3, 0)
>+#define RKISP1_CIF_ISP_DPCC_SET_USE_MASK		GENMASK(3, 0)

Why are these two masks use GENMASK and other don't?


Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_MASK		0x00001f1f
>+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_MASK		0x0000ffff
>+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_MASK		0x00003f3f
>+#define RKISP1_CIF_ISP_DPCC_PG_FAC_MASK			0x00003f3f
>+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_MASK		0x0000ffff
>+#define RKISP1_CIF_ISP_DPCC_RG_FAC_MASK			0x00003f3f
>+#define RKISP1_CIF_ISP_DPCC_RO_LIMIT_MASK		0x00000fff
>+#define RKISP1_CIF_ISP_DPCC_RND_OFFS_MASK		0x00000fff
>
> /* BLS */
> /* ISP_BLS_CTRL */
>-- 
>Regards,
>
>Laurent Pinchart
>
