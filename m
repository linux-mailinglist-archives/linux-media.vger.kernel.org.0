Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77BD0559B3F
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 16:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiFXOR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 10:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbiFXORV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 10:17:21 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B99153A55
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 07:17:20 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 7861D32002D8;
        Fri, 24 Jun 2022 10:17:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 24 Jun 2022 10:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656080235; x=1656166635; bh=UZO+6LZwuV
        65rxjHuXD5fqHsft7utbD++dALaICTs5Y=; b=HRXKyx2Idq4un2eEi5eWOh6U0j
        V9VY9EwFdXQQ0/u3z/cfd/sFJXnaIjTgkCoiT2utjWF/NNWO5S83phjuW65BfkCn
        J6kSOzQvkmz/8JAku1aa6+C/WeIn//kDtDY+p4qLD918mpZa0mP/O1JAWBW7o44F
        nQSvuP//H9HC13GbVoywVQ5QxxhLIyVka6XdCoYcPnZn21m6xrI/VqEPok4/Gz1S
        ii8uyuxfiXUuS6EiYyQWHNgBd3tdafoB3mSQIXjKWMJOpzxTkhUkxMHfqRCfAtLY
        X2+LpxBuZiEimHO6Q3wDm+IEB7GPe6CaVgwbBOkDjhR16XOS/KTqUg7Pejjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656080235; x=1656166635; bh=UZO+6LZwuV65rxjHuXD5fqHsft7u
        tbD++dALaICTs5Y=; b=FVwXlmN0lJ5YjZ+6USTKUSJyQKzRj3MV+xxgoO42G0+4
        g4Ar8hImR2a/sZ26MTADeJat+2eth1C9/pbs5vSyG5jq6epPfaI2hGKF1LAiF0wU
        jc0/bGAKh1FZgm4JGrMikAsRNNQ2bp/1X5C+MIugMdLXx0iwJ6dRLZxycppwR7oD
        fbY4Huy4u/oWxm4ndsVCMjXH/T0NB75qzDjJ6fE4LrCsHNpnwXEy9+imJf3N5zOF
        GXJ1HIFPXvIwRghJzLqoWDjqMeaHvqAdbqr/+rIZN+6U3Tb3XaUB6fQcWsSBj2yB
        xoEISPFAP61kaW8lILAB8Mz+NByfuOaCLq63f2S3mA==
X-ME-Sender: <xms:ase1Ys4LXgYFYuveBNp6tclhx0QoVP30lJfOxJGhGDjN_tIkJxx_0A>
    <xme:ase1Yt42hAJOUTK3XPM3Dfp_9AUSTt9ZXKsj6iB2kv9IpJBKxdB_SbuuwJsy9-7h0
    jY1hFRlrR2wguD6VD8>
X-ME-Received: <xmr:ase1Yrcon-s2HEtwfvLA1RxhCm15PqcMOtlALmE4bU-h1ZTfRNrYfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:ase1YhIs8NDo5HQm8y7Sv_Nc4KpCU0ywqyRW-_gb8fUopYxQGoOQHw>
    <xmx:ase1YgK0tjYsQj9Mnese2oV8uvWT6dnFypKF3kHrrYw4-j7D8V_LRA>
    <xmx:ase1YiwNQ6ASuU3HsN-2G7qHZ0VcMzBsKeO7l9vM1B8mFjaUFpbAWQ>
    <xmx:a8e1Ypo0AbsYt40_4V86FudF7yyogAKqOykeiSU8HoEuh4W5Rva_rg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:17:11 -0400 (EDT)
Date:   Fri, 24 Jun 2022 17:17:08 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 02/55] media: rkisp1: Enable compilation on ARCH_MXC
Message-ID: <20220624141708.v32f3j377aliygix@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-3-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-3-paul.elder@ideasonboard.com>
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
>The ISP used by the Rockchip RK3399 is also found in the NXP i.MX8MP.
>Enable compilation of the driver for the MXC architecture in addition to
>ARCH_ROCKCHIP.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> drivers/media/platform/rockchip/rkisp1/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
>index dabd7e42c193..731c9acbf6ef 100644
>--- a/drivers/media/platform/rockchip/rkisp1/Kconfig
>+++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
>@@ -3,7 +3,7 @@ config VIDEO_ROCKCHIP_ISP1
> 	tristate "Rockchip Image Signal Processing v1 Unit driver"
> 	depends on V4L_PLATFORM_DRIVERS
> 	depends on VIDEO_DEV && OF
>-	depends on ARCH_ROCKCHIP || COMPILE_TEST
>+	depends on ARCH_ROCKCHIP || ARCH_MXC || COMPILE_TEST

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

> 	select MEDIA_CONTROLLER
> 	select VIDEO_V4L2_SUBDEV_API
> 	select VIDEOBUF2_DMA_CONTIG
>-- 
>2.30.2
>
