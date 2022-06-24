Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5D0559B87
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 16:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbiFXO36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiFXO35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:29:57 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302D954F8E
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:29:57 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E7795320085B;
        Fri, 24 Jun 2022 10:29:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 Jun 2022 10:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656080995; x=1656167395; bh=r6us2ddgzT
        QDWr+S0Y6Dq63sK81RbLLdtWxyEFlbbag=; b=dq0D6P5FtLgLhaWdSUYDMAuhlM
        s2mTohj6Sus/l/d7qnQfAM5VDK8k+J2sLTQ3eZsVItCcAdsYbi7p5yY5Xc1Vbwwg
        IiAvvkQl8oeMjJIPVFHcLSoPkevdpncvqyQfNJ9STD+HHgr4vT1qhZZup+AkWq2v
        Q+o49OweLkKEsvgcMl38IOEnj2FD+N3MJlIWRXmFRlyZBEPrmLLG47kB7Pff6x3e
        vOarU5oOKGKDSYcIWPnOupUoJ1AxUAwP5xlq+NtyuactiuWw5wAr535/oYWJG3Ly
        u+mrjdhXlxIrkh3QCOeO2cVe6mTmdal41IToCjWA7JNLZR8cWTJZRJahOS9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656080995; x=1656167395; bh=r6us2ddgzTQDWr+S0Y6Dq63sK81R
        bLLdtWxyEFlbbag=; b=mKy7Klnm+0l3BtruhLdyKws/oSc8KeqkGNOUsCAoWWIf
        oJ/ecK5bN5LKi/WjxsEtQ5SJrTV7GqTRQ8ZtZWF9FPvk7GhnfJ0dnHWX4PbiuZk/
        U23uoMEq6IRSrVq4IIaX4Vbhn+hMGO9uX5pl+3ClcKIx6+/+AFp2s15n3gQCPLCI
        JbOXWqtcQ/y7VRlUBshD3289hqXSsBLxS/cUgjMUCYYCRSHr1zBpGj2J+ACixHzH
        t942g0rUdnkOI0rv/V1nnmjFhTfVA7O+a+qqNtcRMLhJnoAcH3RwYgy5XujIkpja
        kbgAhL1m2nbYGr3XoN+udFJj/mwi3dtDEUjOInUKYg==
X-ME-Sender: <xms:Y8q1YtHGnow1d2L6dV-oW6qpEtGilJWqKt_Vt0b1w2QfDIcNLsndSg>
    <xme:Y8q1YiWJ3FQ-n6JIynoAMum6GzFOO8dIZS14OHYAwLKB5wn4-yizYMCxfMT3zNTbH
    bVIn0hnJYWe9c90ZrM>
X-ME-Received: <xmr:Y8q1YvL6mcAASY2OrGwaObJlN_Uw8hKWSE74XzdweDC9Jwm1Jd2XQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:Y8q1YjGxANGpeMzLfQcrJbhnd987pAZApDBCC_q2oVP5kise7Wj4fA>
    <xmx:Y8q1YjU87a_z_RuY1t30KwRP181wWzNyVxV85xS9iL9k2CvQ1YVXAg>
    <xmx:Y8q1YuPc3ANny9lP6rj88N0fCAQJAcryDYF3nK5_wSr1ixicpAC74A>
    <xmx:Y8q1YqGmPjw42i_OxJ8ld6ITYTgydbaswadslWQ9mw-lx8YdUPxjwg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:29:52 -0400 (EDT)
Date:   Fri, 24 Jun 2022 17:29:49 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 06/55] media: rkisp1: Rename rkisp1_match_data to
 rkisp1_info
Message-ID: <20220624142949.fx5z2tdcpjx2rrou@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-7-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-7-paul.elder@ideasonboard.com>
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
>The rkisp1_match_data structure contains device model-specific
>information. It it referenced from OF match data, but that's an
>implementation detail. Rename it to rkisp1_info to reflect its main
>purpose.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 34 +++++++++----------
> 1 file changed, 17 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index ba773c0784fb..258980ef4783 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -105,7 +105,7 @@ struct rkisp1_isr_data {
> 	irqreturn_t (*isr)(int irq, void *ctx);
> };
>
>-struct rkisp1_match_data {
>+struct rkisp1_info {
> 	const char * const *clks;
> 	unsigned int clk_size;
> 	const struct rkisp1_isr_data *isrs;
>@@ -420,7 +420,7 @@ static const struct rkisp1_isr_data px30_isp_isrs[] = {
> 	{ "mipi", rkisp1_mipi_isr },
> };
>
>-static const struct rkisp1_match_data px30_isp_match_data = {
>+static const struct rkisp1_info px30_isp_info = {
> 	.clks = px30_isp_clks,
> 	.clk_size = ARRAY_SIZE(px30_isp_clks),
> 	.isrs = px30_isp_isrs,
>@@ -438,7 +438,7 @@ static const struct rkisp1_isr_data rk3399_isp_isrs[] = {
> 	{ NULL, rkisp1_isr },
> };
>
>-static const struct rkisp1_match_data rk3399_isp_match_data = {
>+static const struct rkisp1_info rk3399_isp_info = {
> 	.clks = rk3399_isp_clks,
> 	.clk_size = ARRAY_SIZE(rk3399_isp_clks),
> 	.isrs = rk3399_isp_isrs,
>@@ -449,11 +449,11 @@ static const struct rkisp1_match_data rk3399_isp_match_data = {
> static const struct of_device_id rkisp1_of_match[] = {
> 	{
> 		.compatible = "rockchip,px30-cif-isp",
>-		.data = &px30_isp_match_data,
>+		.data = &px30_isp_info,
> 	},
> 	{
> 		.compatible = "rockchip,rk3399-cif-isp",
>-		.data = &rk3399_isp_match_data,
>+		.data = &rk3399_isp_info,
> 	},
> 	{},
> };
>@@ -461,7 +461,7 @@ MODULE_DEVICE_TABLE(of, rkisp1_of_match);
>
> static int rkisp1_probe(struct platform_device *pdev)
> {
>-	const struct rkisp1_match_data *match_data;
>+	const struct rkisp1_info *info;
> 	struct device *dev = &pdev->dev;
> 	struct rkisp1_device *rkisp1;
> 	struct v4l2_device *v4l2_dev;
>@@ -469,8 +469,8 @@ static int rkisp1_probe(struct platform_device *pdev)
> 	int ret, irq;
> 	u32 cif_id;
>
>-	match_data = of_device_get_match_data(&pdev->dev);
>-	if (!match_data)
>+	info = of_device_get_match_data(&pdev->dev);
>+	if (!info)
> 		return -ENODEV;
>
> 	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
>@@ -486,14 +486,14 @@ static int rkisp1_probe(struct platform_device *pdev)
> 	if (IS_ERR(rkisp1->base_addr))
> 		return PTR_ERR(rkisp1->base_addr);
>
>-	for (i = 0; i < match_data->isr_size; i++) {
>-		irq = match_data->isrs[i].name
>-		    ? platform_get_irq_byname(pdev, match_data->isrs[i].name)
>+	for (i = 0; i < info->isr_size; i++) {
>+		irq = info->isrs[i].name
>+		    ? platform_get_irq_byname(pdev, info->isrs[i].name)
> 		    : platform_get_irq(pdev, i);
> 		if (irq < 0)
> 			return irq;
>
>-		ret = devm_request_irq(dev, irq, match_data->isrs[i].isr, IRQF_SHARED,
>+		ret = devm_request_irq(dev, irq, info->isrs[i].isr, IRQF_SHARED,
> 				       dev_driver_string(dev), dev);
> 		if (ret) {
> 			dev_err(dev, "request irq failed: %d\n", ret);
>@@ -501,12 +501,12 @@ static int rkisp1_probe(struct platform_device *pdev)
> 		}
> 	}
>
>-	for (i = 0; i < match_data->clk_size; i++)
>-		rkisp1->clks[i].id = match_data->clks[i];
>-	ret = devm_clk_bulk_get(dev, match_data->clk_size, rkisp1->clks);
>+	for (i = 0; i < info->clk_size; i++)
>+		rkisp1->clks[i].id = info->clks[i];
>+	ret = devm_clk_bulk_get(dev, info->clk_size, rkisp1->clks);
> 	if (ret)
> 		return ret;
>-	rkisp1->clk_size = match_data->clk_size;
>+	rkisp1->clk_size = info->clk_size;
>
> 	pm_runtime_enable(&pdev->dev);
>
>@@ -519,7 +519,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>
> 	pm_runtime_put(&pdev->dev);
>
>-	rkisp1->media_dev.hw_revision = match_data->isp_ver;
>+	rkisp1->media_dev.hw_revision = info->isp_ver;
> 	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
> 		sizeof(rkisp1->media_dev.model));
> 	rkisp1->media_dev.dev = &pdev->dev;
>-- 
>2.30.2
>
