Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F05559B94
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 16:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbiFXOeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbiFXOeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:34:09 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C833585B
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:34:08 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 3BDC23200917;
        Fri, 24 Jun 2022 10:34:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 24 Jun 2022 10:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656081246; x=1656167646; bh=PkrlNJehcq
        0D5Fk1l5omSFwajqRzmyjNqnS3kbX+838=; b=kKTcVKJOTm/ol/OIA0GvYStFNE
        WsNqbWyk5v8fR1QzcbIVDMs0orvMcyCU9gzBEU1u5tV1f+syXoNdz51m9m0VrF7C
        uVDpz7K9ffjx+3P8olnSxzcqaBFRacSUQU7pMU9Rpv7PVgUJE2UNG593Hd6jjBAn
        K5CW7ifbUaYyRc59ivQomn9LBsL/WHE4WSWdJqFxPj9vPoVqKakY1bq/T7TVh/YH
        w235OIecx4dxObsy4/bYhOPEx6EHpLVElpB0iDQp0IpqjryRt0UDW9XcOLybq5Jg
        FYnqsi+uMCwAAy94hLrFXaVQQxWtkHfpCgluI3f5j4kzPBJl95jNKVvxqCDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656081246; x=1656167646; bh=PkrlNJehcq0D5Fk1l5omSFwajqRz
        myjNqnS3kbX+838=; b=Xl4tzn1IYLF4k8HRQ/mYW/QL3qKJus5qVS1YbIubzlLS
        uQTYMRN95SsDrGjrR3FRutWD7M+U1/WqRYEu+vwMsEHjoj280N0PhSBPbH5njWdO
        WbDZmDNV8wfG7Tx+ojy0KzC7aXJSFlmZrVsethzWSD0lFC9u2sgvoG7KTW8+IjyR
        kmyMBcRAiqP0ljTpnmqjtWdtCAHUhWEvWiOt+lnp2HMvYk7P+IVk2IXIfOTD5+xB
        Lbdc8kuL8KfHdg4aGmVhghUA4iLiUgpTvGt5eGDZTEuJmO0iM/fiLKvrisX2s5Fu
        D4n4E2dOnz5/oqLY1hOK8i2lcm3a6yYmVH/2o+4Niw==
X-ME-Sender: <xms:Xsu1YjP-Mo9BMB2eiOpQSuK-Q5bNfnUgGuneDRJ0t2S4qptA9BNDMQ>
    <xme:Xsu1Yt8pEqLQCGuij4uftmu8sqvuy71ID9EQHXv37vFffT68V8BFxeQ9iJy_WMNC3
    D7iNfOE0P6FD9YhnqM>
X-ME-Received: <xmr:Xsu1YiSGTkaIzq59uNBinw5GqzNvvYHPIun_SkE-cot-zXP7EdYo4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:Xsu1YnvhBqINA_p-gI2j3vJBNjaZAdoc3WEP0PByymqiN88lAU66UA>
    <xmx:Xsu1YrdHKu_0MoEVzd2tPKenhDbBBFjEM173auWxfHxulfVFFHqVjA>
    <xmx:Xsu1Yj2PCSG0gsi1zyVQL7YWMiNJC3WK00uoRvYe9q31MupsU00QNw>
    <xmx:Xsu1YtvpZdaVwGulxcRTTvMK7Uv2FENpLLRKr9RW27suWuv49Dc-WQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:34:03 -0400 (EDT)
Date:   Fri, 24 Jun 2022 17:34:00 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, heiko@sntech.de,
        laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 07/55] media: rkisp1: Save info pointer in rkisp1_device
Message-ID: <20220624143400.ars53iairqqbdmq2@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-8-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-8-paul.elder@ideasonboard.com>
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
>To make it possible to use the rkisp1_info after probe time (for
>instance to make code conditional on the ISP version), save it in the
>main rkisp1_device structure. To achieve this, also move the info
>structure into the common header, and document it.
>
>While at it, drop a NULL check in rkisp1_probe() for the match data as
>it can't happen.
>
>Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-common.h  | 22 +++++++++++++++++++
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 +++----------
> 2 files changed, 25 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index a67fe7b1dfa1..50d31a254b03 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -91,6 +91,26 @@ enum rkisp1_isp_pad {
> 	RKISP1_ISP_PAD_MAX
> };
>
>+/*
>+ * struct rkisp1_info - Model-specific ISP Information
>+ *
>+ * @clks: array of ISP clock names
>+ * @clk_size: number of entries in the @clks array
>+ * @isrs: array of ISP interrupt descriptors
>+ * @isr_size: number of entires in the @isrs array
>+ * @isp_ver: ISP version
>+ *
>+ * This structure contains information about the ISP specific to a particular
>+ * ISP model, version, or integration in a particular SoC.
>+ */
>+struct rkisp1_info {
>+	const char * const *clks;
>+	unsigned int clk_size;
>+	const struct rkisp1_isr_data *isrs;
>+	unsigned int isr_size;
>+	enum rkisp1_cif_isp_version isp_ver;
>+};
>+
> /*
>  * struct rkisp1_sensor_async - A container for the v4l2_async_subdev to add to the notifier
>  *				of the v4l2-async API
>@@ -395,6 +415,7 @@ struct rkisp1_debug {
>  * @pipe:	   media pipeline
>  * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
>  * @debug:	   debug params to be exposed on debugfs
>+ * @info:	   version-specific ISP information
>  */
> struct rkisp1_device {
> 	void __iomem *base_addr;
>@@ -413,6 +434,7 @@ struct rkisp1_device {
> 	struct media_pipeline pipe;
> 	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
> 	struct rkisp1_debug debug;
>+	const struct rkisp1_info *info;
> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 258980ef4783..39ae35074062 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -105,14 +105,6 @@ struct rkisp1_isr_data {
> 	irqreturn_t (*isr)(int irq, void *ctx);
> };
>
>-struct rkisp1_info {
>-	const char * const *clks;
>-	unsigned int clk_size;
>-	const struct rkisp1_isr_data *isrs;
>-	unsigned int isr_size;
>-	enum rkisp1_cif_isp_version isp_ver;
>-};
>-
> /* ----------------------------------------------------------------------------
>  * Sensor DT bindings
>  */
>@@ -469,14 +461,13 @@ static int rkisp1_probe(struct platform_device *pdev)
> 	int ret, irq;
> 	u32 cif_id;
>
>-	info = of_device_get_match_data(&pdev->dev);
>-	if (!info)
>-		return -ENODEV;
>-
> 	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
> 	if (!rkisp1)
> 		return -ENOMEM;
>
>+	info = of_device_get_match_data(dev);

Why did you omit the check 'if(!info)'?

thanks,
Dafna

>+	rkisp1->info = info;
>+
> 	dev_set_drvdata(dev, rkisp1);
> 	rkisp1->dev = dev;
>
>-- 
>2.30.2
>
