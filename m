Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACC0559B62
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 16:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbiFXOVO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiFXOVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:21:13 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A201D54FB7
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:21:12 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 62E663200392;
        Fri, 24 Jun 2022 10:21:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 24 Jun 2022 10:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656080470; x=1656166870; bh=06ugER3/EV
        ur2CjgczapAghiL8yo30yXUocyiOMNz/E=; b=gMYaaq60CzbIB8dKg9UxPySlpE
        68kUFjkPqYLE25KVh1bPWSFwP9RDulCs+G1VRuQkq3QXSkhy0P5+qtSDFAGm2wfS
        PoqZnMr+Xki0L9LVxOdK3kZ9SjBZoIQ0xpy/1H/6iuAzPgtAfkcX3qrYkz1lW1Ni
        Vz9FxSxyMJ7fUfwhU2bCiL4EOxcsC3jyWrb4AiDuUFFjaw0nOIjx0/q04Y43DGWj
        KXOTDm8osA3VwlgmUhpdXlyYyOL73oK5gGSE4KlSHezIbOx5IEJTAb8c+3wQCF4g
        JQHuplcQg1vFFVHypOh90kFvMCiAG2IGMANOSAbRMDgxexOLMIC+bH5USLQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656080470; x=1656166870; bh=06ugER3/EVur2CjgczapAghiL8yo
        30yXUocyiOMNz/E=; b=FlOA7Ww36x/lLYKm3NJrtxZ5Q6wwkl1m7POnqCTUVp6G
        aYYMIbaVq9zVJadmMAweG7U2rSq0GWUVjxtej02Z2TK8J6U9gGG58xOL16gSOQvD
        NvFU9hMUeBCwaluALoySZq/f36aiCjK5QOyMLYjtJWtS4KgBEczTg8qtzzB8T1Fc
        D5tjmYsIzkirsbDZYrvZhulRySVpSLlqZ66yPm+mIpcwdXdeJk7El4Gdl13d5xOk
        M/vWi10xK+3M7mQ0KmGXLsUfp4fdCLsUDP0C5vUms4qPqXMJ5DZr7qJgn9T02PAL
        4o0HPs8l5ckXHKLszJBDDTtdD9kSg326NZhYBhjexg==
X-ME-Sender: <xms:Vsi1YksiFvKYVvlO3uGMaA61jFnxwhVyshK13-NzVOBSexYULX-tkQ>
    <xme:Vsi1YhcYVuXFEMqbt0NQRxg7gSMbFSAdKWdtLhd8pPo2uOsZYaqc64iH6MFq0fijE
    pffFGu7bQ5rsqX8lX0>
X-ME-Received: <xmr:Vsi1YvxD4R1e1v6qT2YC0RZrNFoVAwbR39PYJPVIBLYuF-3rO4eguw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:Vsi1YnPGMZU8N04HpEORvMdtcD3OUsemUZ7Pq6e0CrizvnRqoIQUiw>
    <xmx:Vsi1Yk-VxCZwCSePxpjtiqucGy1o4UFEWxEGgaoRZYxqNjRWmg8g4Q>
    <xmx:Vsi1YvUok8eb14UgQlOXqomHyH-UQxUzLKsSADQD0E7UJhjtVh3McQ>
    <xmx:Vsi1YhPW4WPRTsMWlyhL3u7rc4irIzBdhAZb0uJ7RvK3Qk8VpIgY1A>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:21:07 -0400 (EDT)
Date:   Fri, 24 Jun 2022 17:21:04 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 04/55] media: rkisp1: Disable runtime PM in probe error
 path
Message-ID: <20220624142104.zdrcwbyhlb436tru@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-5-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-5-paul.elder@ideasonboard.com>
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
>If the v4l2_device_register() call fails, runtime PM is left enabled.
>Fix it.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 97d569968285..248f0172ca62 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -523,7 +523,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>
> 	ret = v4l2_device_register(rkisp1->dev, &rkisp1->v4l2_dev);
> 	if (ret)
>-		return ret;
>+		goto err_pm_runtime_disable;
>
> 	ret = media_device_register(&rkisp1->media_dev);
> 	if (ret) {
>@@ -543,6 +543,7 @@ static int rkisp1_probe(struct platform_device *pdev)
> 	media_device_unregister(&rkisp1->media_dev);
> err_unreg_v4l2_dev:
> 	v4l2_device_unregister(&rkisp1->v4l2_dev);
>+err_pm_runtime_disable:
> 	pm_runtime_disable(&pdev->dev);
> 	return ret;
> }
>-- 
>2.30.2
>
