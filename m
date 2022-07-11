Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD51756D305
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 04:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiGKCjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 22:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGKCjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 22:39:33 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C30165A4
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 19:39:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 1499632002B6;
        Sun, 10 Jul 2022 22:39:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 10 Jul 2022 22:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657507171; x=1657593571; bh=KLIhSz+wR2
        VqtiP+szDKIFQ0eWo0giVSSA30hYeleH8=; b=KAYoAI7xIW7BX6aEGKh2rexWbr
        KB2X8wxJABdFm10D8smqJcY2Ap2PVT0gC2tzZTZLFgha5FOiFD+8KUujCQdFw/G6
        XSRkW/hG46hV+Ex30AFPzvWp7TCfPRdPE7U+3bwvMy1MfORzRCBbb4RZbHkvUZRS
        U4yoQDEyPzMDmPWxHGBDbIJyW3csN5oFyGsoykTb5NxJbFitxV1WgjeswwUlhMYv
        n5Xt4D1WPFbu6C/2CscCPiNav4w6+hWJeAB5kJWpwDjtwSgqVkshAaKvS7GmJUPZ
        QAe6pFmFWj6E+OuGSoY5Q7LbMApSyjoepuXHQTNvZG/FKeaUjejl079n25eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657507171; x=1657593571; bh=KLIhSz+wR2VqtiP+szDKIFQ0eWo0
        giVSSA30hYeleH8=; b=klWWuQMwU2VNa1QTr7aWr34J8tS5wAy8QcgTQQdOMEcw
        sgVekxaC7DSkC2r1bIRqINXgBsPH/fldEYxsNDsW+iosmhhHuG88lNMgsAN5we+R
        LNd+PtZjDeSDbu0iMN0W9qOSxV6F9fFWp32lJ+C4BynbRGc1ms55sefksWTH53VX
        0HlPBZrW4L/v+zXWDxfeTMvNSX7a5UzS2bFxLYkZG9AtveU/VnPx3zWaZCNjuCwD
        42ruSd0IEN5hpKytK02+IhYMtbC39FycT3ge/txMTkzQZkMWaKFBP3ruXO90HmBZ
        5xT4F+BO/aj7lnwmtExlWUbmm8LvHEjsBHgQjhkBuA==
X-ME-Sender: <xms:Y43LYhWukn7SVvPw0oEXq2ZwTSuwloh85F97XguF09MpQhdsXgiREw>
    <xme:Y43LYhkZLaZ7D0C3bB7uFpQPSTk5_zH7pIRI8FT9VkQdfyWenUgMhFlGVa4xEcmyh
    BJ-RYIfCmbzcgENGR4>
X-ME-Received: <xmr:Y43LYtZ9LA76Iv8yiJgxZnmjTApRMGQ6ij78vqqirfzgDSrn9ILp4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:Y43LYkVEK9wDAaAcZ5ITRSmGDUiNLWOrZ66DtiFs5CHW9NGbSuVjYg>
    <xmx:Y43LYrnToZ_UX86qAD3etYlnCgyHf76ceFbTIiuJigszxtbHchIy9w>
    <xmx:Y43LYhf4kXmY9BI7E7lfiJrafMPipzOeiLwEu1_tKcCH5p0D92jFOw>
    <xmx:Y43LYkBllAuIi4qy2nWdk3rHYTKMNJwRJ7T_ENsvP1Y8NIHQbBMjhw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 22:39:29 -0400 (EDT)
Date:   Mon, 11 Jul 2022 05:39:26 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 45/55] media: rkisp1: Make the internal CSI-2 receiver
 optional
Message-ID: <20220711023926.zg45nxcj3el5l2z2@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-46-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-46-laurent.pinchart@ideasonboard.com>
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
>Not all ISP versions integrate a MIPI CSI-2 receiver.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 50 +++++++++++++------
> 1 file changed, 34 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index bc278b49fefc..f2475c6235ea 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -205,6 +205,14 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>
> 		switch (reg) {
> 		case 0:
>+			/* MIPI CSI-2 port */
>+			if (!(rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)) {
>+				dev_err(rkisp1->dev,
>+					"internal CSI must be available for port 0\n");
>+				ret = -EINVAL;
>+				break;
>+			}
>+
> 			vep.bus_type = V4L2_MBUS_CSI2_DPHY;
> 			break;
>
>@@ -330,13 +338,16 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
> 	unsigned int i;
> 	int ret;
>
>-	/* Link the CSI receiver to the ISP. */
>-	ret = media_create_pad_link(&rkisp1->csi.sd.entity, RKISP1_CSI_PAD_SRC,
>-				    &rkisp1->isp.sd.entity,
>-				    RKISP1_ISP_PAD_SINK_VIDEO,
>-				    MEDIA_LNK_FL_ENABLED);
>-	if (ret)
>-		return ret;
>+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
>+		/* Link the CSI receiver to the ISP. */
>+		ret = media_create_pad_link(&rkisp1->csi.sd.entity,
>+					    RKISP1_CSI_PAD_SRC,
>+					    &rkisp1->isp.sd.entity,
>+					    RKISP1_ISP_PAD_SINK_VIDEO,
>+					    MEDIA_LNK_FL_ENABLED);
>+		if (ret)
>+			return ret;
>+	}
>
> 	/* create ISP->RSZ->CAP links */
> 	for (i = 0; i < 2; i++) {
>@@ -379,7 +390,8 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>
> static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
> {
>-	rkisp1_csi_unregister(rkisp1);
>+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
>+		rkisp1_csi_unregister(rkisp1);
> 	rkisp1_params_unregister(rkisp1);
> 	rkisp1_stats_unregister(rkisp1);
> 	rkisp1_capture_devs_unregister(rkisp1);
>@@ -411,9 +423,11 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
> 	if (ret)
> 		goto error;
>
>-	ret = rkisp1_csi_register(rkisp1);
>-	if (ret)
>-		goto error;
>+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
>+		ret = rkisp1_csi_register(rkisp1);
>+		if (ret)
>+			goto error;
>+	}
>
> 	ret = rkisp1_create_links(rkisp1);
> 	if (ret)
>@@ -576,9 +590,11 @@ static int rkisp1_probe(struct platform_device *pdev)
> 		goto err_unreg_v4l2_dev;
> 	}
>
>-	ret = rkisp1_csi_init(rkisp1);
>-	if (ret)
>-		goto err_unreg_media_dev;
>+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
>+		ret = rkisp1_csi_init(rkisp1);
>+		if (ret)
>+			goto err_unreg_media_dev;
>+	}
>
> 	ret = rkisp1_entities_register(rkisp1);
> 	if (ret)
>@@ -595,7 +611,8 @@ static int rkisp1_probe(struct platform_device *pdev)
> err_unreg_entities:
> 	rkisp1_entities_unregister(rkisp1);
> err_cleanup_csi:
>-	rkisp1_csi_cleanup(rkisp1);
>+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
>+		rkisp1_csi_cleanup(rkisp1);
> err_unreg_media_dev:
> 	media_device_unregister(&rkisp1->media_dev);
> err_unreg_v4l2_dev:
>@@ -613,7 +630,8 @@ static int rkisp1_remove(struct platform_device *pdev)
> 	v4l2_async_nf_cleanup(&rkisp1->notifier);
>
> 	rkisp1_entities_unregister(rkisp1);
>-	rkisp1_csi_cleanup(rkisp1);
>+	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
>+		rkisp1_csi_cleanup(rkisp1);
> 	rkisp1_debug_cleanup(rkisp1);
>
> 	media_device_unregister(&rkisp1->media_dev);
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
