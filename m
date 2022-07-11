Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A72F56D2FB
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 04:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiGKC3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 22:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGKC33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 22:29:29 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E09640B
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 19:29:28 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 37AF6320029B;
        Sun, 10 Jul 2022 22:29:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 10 Jul 2022 22:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657506565; x=1657592965; bh=CCBY9d9Um0
        Hx5Dv0S6QBP9R5oXD6ecN3f+4ds/Nn9eo=; b=VZyG1eJHfMrzi6a1LVxodT6pOU
        8JIsvB4Z176b8DBHR2RLPDnWNYE7usLoTa+RTQ6qhiJ80lwau1OgGmH2ib6YfwN2
        9DNjRo4e7J6ORwkluzH4duUY4WciNUcTSTO0//DxA8e+pVSXN3aFoLWr54j4bS9T
        LeGF6FwkL4GtjGFcKKlf//dAg2tgLIU9CxF00/P8wEhK4df9NiR2fX0T4awtIrmM
        +6RERVwV+rXsE/0yFsqFddDEZspwsubHOipuWyBJVOBksXh69xK751clvIMwah4B
        s7acsGPW4DP1+lELFxz7F/EdDDnVo0VoWrtPFNyH1L/WbVG0RO6xzRJOmhZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657506565; x=1657592965; bh=CCBY9d9Um0Hx5Dv0S6QBP9R5oXD6
        ecN3f+4ds/Nn9eo=; b=tvvldkt4bWDMxIkUqSpylJYIekNMAhSLG0K4OwO3RKCV
        fwkhY951C/58gBCH3Y+f+fFp7o9aXrBcAtkjqtOmtwUh1ae3knL8iuISohhIjfM5
        DHeAUg76AfuspZgl5/gp+u+6CVJhCNC57gaYgioZPd6N7SuYw7/EL0I85Z9RwidP
        a2HqDrL3/MuuFSafKBXthbUbZ/wZ/qjPKrz1CQd21fZXguyjWzhtl8Cr3Cz/PJYY
        WP7E7JtlrgquCYOYWzwHzXAB8KB8DkCtJhdIkxOxK28jsZtI8scn55v4wvE3XFvc
        uEhRNQkgbaZVIGt8nfKM823wfzQRrQ7iSwUQ2gUYdg==
X-ME-Sender: <xms:BYvLYuJkFJbX_aldDJLmpkF62GVfQ8pJjgVeX2G7b8eyJbKZcshmpA>
    <xme:BYvLYmIcoH33nzj88-OR1GFNskc7rxyWwpKHpoUGfg8CmJWihhYjizWBfjjAoqMIG
    1NNgkkzSGGjYWP4-E0>
X-ME-Received: <xmr:BYvLYut5ZHStFvS8oTSSjKzjHPVZSmKvPYX2mjoZxxSL5AhBWD4KMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:BYvLYjZ32EcYeR7Kv-lpvuVjxU1wEILyxpY8afVVf0En_9spXlGUWg>
    <xmx:BYvLYlYKUQiV7BvhtZdo3fx9fz1IZAXkk5mvvg4LZGtBcy82bHwzVg>
    <xmx:BYvLYvBG-fXDd_gGCbLALqR9aps9wqig91gO87RcGIh_rkKJQuGEiA>
    <xmx:BYvLYkW1tNX67_28j9RJf-UXoBVuIuNpo27KvAKZwhCrtTmnJTPPww>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 22:29:22 -0400 (EDT)
Date:   Mon, 11 Jul 2022 05:29:19 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 44/55] media: rkisp1: Add infrastructure to support
 ISP features
Message-ID: <20220711022919.hh3yvmlkioefgdrd@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-45-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-45-laurent.pinchart@ideasonboard.com>
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
>Different ISP versions implement different sets of features. The driver
>already takes the version into account in several places, but this
>approach won't scale well for features that are found in different
>versions. Introduce a new mechanism using a features bitmask in the
>rkisp1_info structure to indicate which features the ISP support.
>
>The first feature bit tells if the ISP has an internal CSI-2 receiver,
>which is not available in all ISP versions.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-common.h      | 15 +++++++++++++++
> .../media/platform/rockchip/rkisp1/rkisp1-dev.c   |  2 ++
> 2 files changed, 17 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index e436f1572566..dedfcf3466c8 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -98,6 +98,19 @@ enum rkisp1_isp_pad {
> 	RKISP1_ISP_PAD_MAX
> };
>
>+/*
>+ * enum rkisp1_feature - ISP features
>+ *
>+ * @RKISP1_FEATURE_MIPI_CSI2: The ISP has an internal MIPI CSI-2 receiver
>+ *
>+ * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
>+ * the driver to implement support for features present in some ISP versions
>+ * only.
>+ */
>+enum rkisp1_feature {
>+	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
>+};
>+
> /*
>  * struct rkisp1_info - Model-specific ISP Information
>  *
>@@ -106,6 +119,7 @@ enum rkisp1_isp_pad {
>  * @isrs: array of ISP interrupt descriptors
>  * @isr_size: number of entries in the @isrs array
>  * @isp_ver: ISP version
>+ * @features: bitmatk of rkisp1_feature features implemented by the ISP
>  *
>  * This structure contains information about the ISP specific to a particular
>  * ISP model, version, or integration in a particular SoC.
>@@ -116,6 +130,7 @@ struct rkisp1_info {
> 	const struct rkisp1_isr_data *isrs;
> 	unsigned int isr_size;
> 	enum rkisp1_cif_isp_version isp_ver;
>+	unsigned int features;
> };
>
> /*
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 1dcade2fd2a7..bc278b49fefc 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -460,6 +460,7 @@ static const struct rkisp1_info px30_isp_info = {
> 	.isrs = px30_isp_isrs,
> 	.isr_size = ARRAY_SIZE(px30_isp_isrs),
> 	.isp_ver = RKISP1_V12,
>+	.features = RKISP1_FEATURE_MIPI_CSI2,
> };
>
> static const char * const rk3399_isp_clks[] = {
>@@ -478,6 +479,7 @@ static const struct rkisp1_info rk3399_isp_info = {
> 	.isrs = rk3399_isp_isrs,
> 	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
> 	.isp_ver = RKISP1_V10,
>+	.features = RKISP1_FEATURE_MIPI_CSI2,
> };
>
> static const struct of_device_id rkisp1_of_match[] = {
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
