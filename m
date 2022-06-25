Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7AD55A6B0
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 05:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbiFYDwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 23:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiFYDv7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 23:51:59 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA0743EF7
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 20:51:58 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 4EBAD3200645;
        Fri, 24 Jun 2022 23:51:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 24 Jun 2022 23:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656129116; x=1656215516; bh=0UYs0se20f
        n1hNgX3GTXe/5smp/Hec7Gg7pxSV3hLN4=; b=VXE4aLK9h21b3A8oqEGyBr01MO
        7daDjimWian/QjXq5qic7ndxdQPyEzDA1NM7F/HCq4kKY1n9nGs+T+BGDnhi81P4
        yJHx4oaAX44qS0EMuy8CkM1eKHj7xIaqY0tLfSYrG1mT/cRH0VuKhcTPRAO0hW8T
        h+AtcLLWBBejE/RHt44j+t48PGrKGhGoxaM74RzB0N+Ti+bySOwqWXjd/3Of0dpU
        XemgaSxV/Hkp9Ukx/IOZ8xZB2UV0JKwqoBzV6i6xPXUUL1yJI+5JvUkrZZBciVSz
        AFB6GG7V5txU+FekkVWp1YfOI9xrFEL5JxJGTq3xlssEsaWO36wg2te28gwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656129116; x=1656215516; bh=0UYs0se20fn1hNgX3GTXe/5smp/H
        ec7Gg7pxSV3hLN4=; b=kwwN9VKp2ReFhQ/4O+zc9PvrV7dLeT1Srkuo9zd0i8p+
        ybek6U3MREwF2TzPXF1Rfba6KelNSz9p2RCbbaphbrMgBQYkplP6+OBMPIL0jKSd
        a+W8CfJOEgxWr7iPi0MTleuZsKeORp3H+xActemtp9Ph1BzQZfDYgnE58QjCiXdp
        abzQ6/YV0JaOIuIibzAROjHGc6qzHVE3NbFbx5XzZNeQYcqhQkmOaJmnSlKnasgI
        D9BhyEXcAcjcF0/WmvI9yk1ZpTBAhv4GALXXJKmXjOsIVFcLokOMqe0el85fJEHN
        25Dv2W5VqN+9l4KotRGmLYySm5esMvkGK5dfLjz86g==
X-ME-Sender: <xms:XIa2YrIp8Ce2K29AQHQ7Cl-_tp_LLJJYFJ8ZW9p7jYW6MMbwMaKqbQ>
    <xme:XIa2YvLIxdrJtFCbwjg_uLgLDfzw3rUuzslCqvajlA2NNYYX4ilPBX_3_7u-6iApd
    DoIyj0h6PAemgEWckQ>
X-ME-Received: <xmr:XIa2YjtTOOugZ-Q6PQdrcarOJPwU3-c76WayX1lxVSnyq2VTwW6IIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:XIa2YkbeCeudhmR4WWyoRln2-PuKYp9CKmCiANwZjSn8U4Zp4RfH_A>
    <xmx:XIa2YiZMssl_G57La279i5d1CmCjM8LAzQxGbp8y0mfXpnHoarasAA>
    <xmx:XIa2YoAsQ7lnYnDssw0Jo3u4aucNhmVC7qCFFlOnGUo0MAjopGcNjQ>
    <xmx:XIa2Yq5z29dlBlvbB2GcdKsxma1DoPluZtYd9aZsbtaqVPSRfZN8DA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 23:51:53 -0400 (EDT)
Date:   Sat, 25 Jun 2022 06:51:50 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 19/55] media: rkisp1: isp: Start CSI-2 receiver before ISP
Message-ID: <20220625035150.wbso5x4bn7rtaxgb@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-20-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-20-paul.elder@ideasonboard.com>
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
>Make sure the ISP is ready to receive data before starting the CSI-2
>receiver by starting it first. Similarly, stop the CSI-2 receiver before
>the ISP when stopping streaming.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 5eabb321e320..0e68c8d53404 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -771,8 +771,9 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
> 				 false);
>
>-		rkisp1_isp_stop(rkisp1);
> 		rkisp1_mipi_csi2_stop(&rkisp1->csi);
>+		rkisp1_isp_stop(rkisp1);
>+
> 		return 0;
> 	}
>
>@@ -794,11 +795,13 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 	if (ret)
> 		goto mutex_unlock;
>
>+	rkisp1_isp_start(rkisp1);
>+
> 	ret = rkisp1_mipi_csi2_start(&rkisp1->csi, rkisp1->active_sensor);
>-	if (ret)
>+	if (ret) {
>+		rkisp1_isp_stop(rkisp1);
> 		goto mutex_unlock;
>-
>-	rkisp1_isp_start(rkisp1);
>+	}
>
> 	ret = v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
> 			       true);
>-- 
>2.30.2
>
