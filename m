Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39BF562AF3
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 07:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234094AbiGAFlC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jul 2022 01:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiGAFky (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jul 2022 01:40:54 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AA16B265
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 22:40:53 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 562B45C007E;
        Fri,  1 Jul 2022 01:40:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 01 Jul 2022 01:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656654053; x=1656740453; bh=w81GzruENk
        dAKKdL/TeijMSnlRh+iUy6KMWkwx9+zyE=; b=G42nZ35tQ0rvdcH/0sw5toWOjU
        8kdXGsuDE79EQesC0DShPIyrK1TOZUqc9ZZ6esUNZ0gLBJm394uEDi2Jvs+l8SvN
        QdQWQvnRNOlDLPn0TBncAlc2+YUVJGjKdDLIeF07MT9g7Q8ZcGKwIrNcsFYiaAPE
        KMkLeuarJ9HJUICYSwwsqQfbv96c3TJ8hREB3KCxz/1EEr0NbZ/rMt06p8mcNgRj
        YAAapIM/u0VLfGZdAHay8XlIV/BQ1aEK1NvWuVDP1C3SXFFa9qqS4GrG1JfI3+3U
        fsYbeTdYUtCI8/jcu51nOZiFXZzeTc/GML38ng4razqyeemMdlk1gmnu8GyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656654053; x=1656740453; bh=w81GzruENkdAKKdL/TeijMSnlRh+
        iUy6KMWkwx9+zyE=; b=YBcZEpccqNHcHqMvl7W+lT6zHSOUSBF8j8TU17ATae6g
        JLlavNYM+yOS8GWH6J3H/z//yIsQnvQWHRNLQqTFsOAMXkYII0/ouj4cY2/9GNkU
        YONz3thDrVhYR8rWc7riihUU1iCC8++mVrozUkQeN+aFYPxYpMzA9yl7BmWHpmQS
        XAE1XgMEPy3rykH3xOwJpHiCz3vU2tKNR1KCYha1aEpp5eFVJh6wLetxOKQ59ab8
        6saHpp7pFszeK0cL8Wd13yNGBCxJOSosvmaQD/N5QPvbwDosUUAn0D45DB5wfOi3
        mobo4xbs4BGsriX3xoCKhIBasVVBrYKJmU+Qn/fFLg==
X-ME-Sender: <xms:5Yi-YpFpN3sembFocngyv7fsrUge7HRHHvyGpi1igZLNrNpPonNpFw>
    <xme:5Yi-YuVUEpeBDkczYT0xQ7w80Cv43AxI23M2wUn6XPEWN3UVM1mEB2QPDNSGULICO
    6fM1B8VGlgd6I1lAvw>
X-ME-Received: <xmr:5Yi-YrI7kJuyY-aM5ylgFZu-BIwnR34igalhHR81KRURHp_9Q7pYPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:5Yi-YvHCBnsLXuJgLyn4vt2jrZ1K3L2grsgdmGtsGhlY97tqUgjkPg>
    <xmx:5Yi-YvVKdWWUA7VuiGSz7oTaAlAPJX5oTgN5WHfDeOgzdmJ4eFePMw>
    <xmx:5Yi-YqOkC6UkEVMR8mgnybKqYb3aMDePealQf1ThqCSsX6N35tOJKQ>
    <xmx:5Yi-YmHifsrEAVVuU-aXgokXEYtZ-wFDQGK7IjsPReCYlYmh2vndng>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 01:40:50 -0400 (EDT)
Date:   Fri, 1 Jul 2022 08:40:47 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, heiko@sntech.de,
        laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 51/55] media: rkisp1: Add and set registers for output
 size config on i.MX8MP
Message-ID: <20220701054047.qx5ixt4vzsfiza5u@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-52-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-52-paul.elder@ideasonboard.com>
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
>The ISP version in the i.MX8MP has a set of registers currently not
>handled by the driver for output size configuration. Add a feature flag
>to determine if the ISP requires this, and set the registers based on
>that.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 8 ++++++++
> drivers/media/platform/rockchip/rkisp1/rkisp1-common.h  | 1 +
> drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c     | 3 ++-
> drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h    | 9 +++++++++
> 4 files changed, 20 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>index 9edaa95fa44c..35cec263c563 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>@@ -420,6 +420,14 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
> 	rkisp1_write(rkisp1, cap->config->mi.cr_size_init,
> 		     rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
>
>+	if (rkisp1->info->features & RKISP1_FEATURE_MAIN_STRIDE) {
>+		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_LLENGTH, pixm->width);
>+		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_WIDTH, pixm->width);
>+		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_HEIGHT, pixm->height);
>+		rkisp1_write(rkisp1, RKISP1_CIF_MI_MP_Y_PIC_SIZE,
>+			     pixm->width * pixm->height);
>+	}
>+
> 	rkisp1_irq_frame_end_enable(cap);
>
> 	/* set uv swapping for semiplanar formats */
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index e4f422bed09a..96657e55a5b0 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -112,6 +112,7 @@ enum rkisp1_feature {
> 	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
> 	RKISP1_FEATURE_DUAL_CROP = BIT(1),
> 	RKISP1_FEATURE_RSZ_CROP = BIT(2),
>+	RKISP1_FEATURE_MAIN_STRIDE = BIT(3),

Missing doc for this one,

thanks,
Dafna

> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 5abe33f5fed4..d68a805e8b6b 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -505,7 +505,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
> 	.isrs = imx8mp_isp_isrs,
> 	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> 	.isp_ver = IMX8MP_V10,
>-	.features = RKISP1_FEATURE_RSZ_CROP,
>+	.features = RKISP1_FEATURE_RSZ_CROP
>+		  | RKISP1_FEATURE_MAIN_STRIDE,
> };
>
> static const struct of_device_id rkisp1_of_match[] = {
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>index 1fc54ab22b6d..5c2195019723 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
>@@ -1013,6 +1013,15 @@
> #define RKISP1_CIF_MI_SP_CB_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000140)
> #define RKISP1_CIF_MI_SP_CR_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000144)
> #define RKISP1_CIF_MI_XTD_FORMAT_CTRL		(RKISP1_CIF_MI_BASE + 0x00000148)
>+#define RKISP1_CIF_MI_MP_HANDSHAKE_0		(RKISP1_CIF_MI_BASE + 0x0000014C)
>+#define RKISP1_CIF_MI_MP_Y_LLENGTH		(RKISP1_CIF_MI_BASE + 0x00000150)
>+#define RKISP1_CIF_MI_MP_Y_SLICE_OFFSET		(RKISP1_CIF_MI_BASE + 0x00000154)
>+#define RKISP1_CIF_MI_MP_C_SLICE_OFFSET		(RKISP1_CIF_MI_BASE + 0x00000158)
>+#define RKISP1_CIF_MI_OUTPUT_ALIGN_FORMAT	(RKISP1_CIF_MI_BASE + 0x0000015C)
>+#define RKISP1_CIF_MI_MP_OUTPUT_FIFO_SIZE	(RKISP1_CIF_MI_BASE + 0x00000160)
>+#define RKISP1_CIF_MI_MP_Y_PIC_WIDTH		(RKISP1_CIF_MI_BASE + 0x00000164)
>+#define RKISP1_CIF_MI_MP_Y_PIC_HEIGHT		(RKISP1_CIF_MI_BASE + 0x00000168)
>+#define RKISP1_CIF_MI_MP_Y_PIC_SIZE		(RKISP1_CIF_MI_BASE + 0x0000016C)
>
> #define RKISP1_CIF_SMIA_BASE			0x00001A00
> #define RKISP1_CIF_SMIA_CTRL			(RKISP1_CIF_SMIA_BASE + 0x00000000)
>-- 
>2.30.2
>
