Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A04955A71B
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 07:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbiFYFEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 01:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiFYFEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 01:04:30 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93653AA5D
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 22:04:29 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 732D33200910;
        Sat, 25 Jun 2022 01:04:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 25 Jun 2022 01:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656133467; x=1656219867; bh=lm8eqV5bh7
        EwZAwY0dYNZBn1aIogTtEkXnKnj3irYZQ=; b=fSb3pvoeJNIp46y+5zu9AS3QBN
        3WxbM1NUeD5+T+UzAim3SQacK3cUvYOuChqX2dN+owob4IfUA8wKcZmswLTW462F
        1OKlsiQiPMYrExiJe35sATRiDWbwanEggtuG79a2v5/3WRGMkwmwnYD8iS8Y1O/q
        qKBCD/fUfyhU8SQnU2LJnRQXxaf96kP41fLjrMD6y1aTP0Lw5Y/40d5C676Yo50h
        wTblU7/o08BNpMC61U0PAu3d582D+fQW2t/5rphg3oawcgYPmNYOencCBhY+7j4T
        cYhUSzdwscWNl3nkxmfrb/x84vfWRLClvF5XHmIHvajvuJkJ1e7q1bEGqPWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656133467; x=1656219867; bh=lm8eqV5bh7EwZAwY0dYNZBn1aIog
        TtEkXnKnj3irYZQ=; b=oWqItmX4DpOXrMbYrCIZ95lWiwZ0PjcF2/q7TFUCtwmv
        ZEEu4BvSon6+EdtiIHs8eIJ0e5l4OETIl+c+BxSZIRH7H6I+/cwP54vaTuJzB3VK
        Dh1ei2kBxi2hNtKCr3/Hh0ixpoAqcspoOHJE3pIOb+fvjEhVSmqkKH/kpaE/q+qI
        Shvg1Bf1DHj24gaIz264SnG3r8LsFKcuCzzfcxfTdRJPoOVcg1DIJLIL81eZCsWy
        iwR+IXcpJMQhSWXR0ZpuhX99/uulBJu+Z/IdsQ2ZtXMMhWqhGtcZLNk+FBhgGF8k
        vae0FHPgXBSHBhOdRzb7GNmHEwgk4JP/bm/ZnkqneQ==
X-ME-Sender: <xms:W5e2YhZKK-D4d_vAL4rkO5FXFc3kQ1v814cETrk3y9dbWRKSOy78_Q>
    <xme:W5e2YoZrPP_SFgOr5qNdbov_StiZQvwAYsTNn-ysd_ZahZPenmntAtxpNUhjtiL52
    28C-dCCrBv26_gUj-c>
X-ME-Received: <xmr:W5e2Yj-EPEC54zVXuOKdIdmWXURdImitFBmq6x6Wc8knAWA7eT8i8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:W5e2YvpUjIn7Ef5vfjiH13Lc_Hny_F-S9X7kgjeBbY_rPb_kCwiAOw>
    <xmx:W5e2YsqO1ANMxQkxAX0GkpdCWPBt9l8wEfhJ1pg5uROyzfW4hdwiHQ>
    <xmx:W5e2YlTk6OgueoPsdd5ZAsWaVbE9l1WpqlMUrF0-J-XE254TD7Cf1g>
    <xmx:W5e2YkLjTzIlTymNW6kHAkqDCsqZp5Qota_PCuEakPyP6piF7uDWsw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 01:04:24 -0400 (EDT)
Date:   Sat, 25 Jun 2022 08:04:21 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 33/55] media: rkisp1: isp: Initialize some variables at
 declaration time
Message-ID: <20220625050421.f4rgnckrebmsmvlz@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-34-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-34-paul.elder@ideasonboard.com>
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
>From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>Intialize the src_fmt and sink_fmt variable when declaring them in
>rkisp1_config_isp().
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 4496af991c82..bf44f10200f5 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -142,12 +142,11 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> {
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
> 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
>-	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
>+	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
>+	const struct rkisp1_mbus_info *src_fmt = isp->src_fmt;
> 	struct v4l2_mbus_framefmt *sink_frm;
> 	struct v4l2_rect *sink_crop;
>
>-	sink_fmt = isp->sink_fmt;
>-	src_fmt = isp->src_fmt;
> 	sink_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
> 					  RKISP1_ISP_PAD_SINK_VIDEO,
> 					  V4L2_SUBDEV_FORMAT_ACTIVE);
>-- 
>2.30.2
>
