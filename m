Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0C42559B7C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 16:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbiFXO0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbiFXO0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:26:38 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB474ECE7
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:26:37 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 7E2463200583;
        Fri, 24 Jun 2022 10:26:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 24 Jun 2022 10:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656080796; x=1656167196; bh=vrcQNWbWEq
        p2BQDqxLoYVEEMbzQpZUSnVdzJ7D8CIOU=; b=LkfhnCxMGx8L3BAt4A6+Ypanwy
        opUqN01BiphQq6rJINfzfPkJvuHwKBv3q3Ori/4yTi+IjFdXfo69OR6m04dCDCys
        D1xMsJXtm71FHpZ0TyBxrO7eptL4Daqo86N9ZMZ6f3Ysp3A64uznSbjBQj/FNmlZ
        i6fsZjCH97LhIUEVfey83+LeZ8Ftw8f+Ik7YieSjt16bG3JQ1Ih/KYo4GoSSA27b
        VQmW9I6NWsRFtVOtVBlj81mgCJToyvwcGD3uZF2RF4NErtLG5qUucVd4YFM5DitX
        bnKcE61Y9Q27mmoGSbgIbbeGS2TWZi4HX6kOlgd82DpoY0jPW7xEW+9VaJtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656080796; x=1656167196; bh=vrcQNWbWEqp2BQDqxLoYVEEMbzQp
        ZUSnVdzJ7D8CIOU=; b=Nec4v+U6P830sdt8nUji6AZSnS3tg9j3yCb07B0mI4ni
        ie88L+VLwQVi5SFXRhgtS+U9rPFHQCOqlHrZdsViSI/plHWCe7U6ZMDh9ijD9py/
        7rDazZPXuOAY+DKwMyD/2zPiZe5r0BJh3i8wL37uB5AOey9zqdEQCq4wBweorHzp
        9iHCQA78dkSHU7hfbcMPsleAAbWKRpvYKZCC0E+KGaUWweufM62Jiozwhkhz7GLv
        76MNWUQpJEMsjubbNiteMfT59Ou2N81OablT2ApMwdl+ozVr0si9YVMPlF8EPNxC
        /q620cK+Siu34Gza3iajXVvcQK8I51RaQaERtmMdUQ==
X-ME-Sender: <xms:m8m1YgXsdR1nRPE_kpgBNek8ZmJlh4DfcXvM7NnibAnE8nweW_ZlJQ>
    <xme:m8m1YkkY1K_k3F9NE4DmocXNO57LIEfIrzX9Ni7GtChM1ZR3YaNzZCicXg3sHkb0A
    7iqw6gA_FTNr4ZlBkI>
X-ME-Received: <xmr:m8m1YkZFzBPbj1Rh7sVmgyKgpOZ0I2tw7yfi7QjN5LAACm_6REATnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:m8m1YvXOoclePzYEYfwHxzzcGkgT8vpXYjitiDdD5kNA_-0wkOR5Eg>
    <xmx:m8m1YqkA9bUHU7OiFQHYKK0pjPmcRfz_cLlHiukSV0q4dHL7CrTmjg>
    <xmx:m8m1Yke6m0J4QY2fffR9XwXAYSzCcrNtUllNInN_iyRkST04rcCPUg>
    <xmx:nMm1YsVGiKDpYU8ZF_SdTs9aoyPwiPmIvd3zSrEAdfQDgyM-zO2UnA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:26:33 -0400 (EDT)
Date:   Fri, 24 Jun 2022 17:26:30 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 05/55] media: rkisp1: Read the ID register at probe time
 instead of streamon
Message-ID: <20220624142630.w2gtm7adq4qmyutt@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-6-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-6-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.06.2022 04:10, Paul Elder wrote:
>From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>There's no need to read the ID register every time streaming is started.
>Do it once, at probe time.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 10 ++++++++++
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  4 ----
> 2 files changed, 10 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 248f0172ca62..ba773c0784fb 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -467,6 +467,7 @@ static int rkisp1_probe(struct platform_device *pdev)
> 	struct v4l2_device *v4l2_dev;
> 	unsigned int i;
> 	int ret, irq;
>+	u32 cif_id;
>
> 	match_data = of_device_get_match_data(&pdev->dev);
> 	if (!match_data)
>@@ -509,6 +510,15 @@ static int rkisp1_probe(struct platform_device *pdev)
>
> 	pm_runtime_enable(&pdev->dev);
>
>+	ret = pm_runtime_resume_and_get(&pdev->dev);
>+	if (ret)
>+		goto err_pm_runtime_disable;
>+
>+	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
>+	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
>+
>+	pm_runtime_put(&pdev->dev);
>+
> 	rkisp1->media_dev.hw_revision = match_data->isp_ver;
> 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
> 		sizeof(rkisp1->media_dev.model));
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 187d78075acb..02968656f3c0 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -473,12 +473,8 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
> /* Hardware configure Entry */
> static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
> {
>-	u32 cif_id;
> 	int ret;
>
>-	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
>-	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
>-
> 	ret = rkisp1_config_isp(rkisp1);
> 	if (ret)
> 		return ret;
>-- 
>2.30.2
>
