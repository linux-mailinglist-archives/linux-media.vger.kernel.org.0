Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A14355A746
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 07:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbiFYFJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 01:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiFYFJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 01:09:21 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2690447576
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 22:09:20 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id D73CA320091A;
        Sat, 25 Jun 2022 01:09:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 25 Jun 2022 01:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656133758; x=1656220158; bh=/WOAJNusev
        QhRPdGep7xbeatIe44IvjPx/CwGHOWbHQ=; b=nG4zpBqXXKi6M++uh0RVtD9qcQ
        ApoGFPXmY28OI5x50MNddzy4wYUhzdUUAENOgKRpMkCWIp45d5cCvFWkI/vpHK+c
        AZgEMJr7FQiDylkzk7MurqcGkg0vFdbpRNlPPtEsGqj5g6d4FVgRgpr4IWWBbiI1
        BMSHNYdrEHZYYUd9tpsf+XbsSXN4MVWvwlN0Ojtn98ZGapiYg1CWZX6m2HZOEO9a
        GUcfydxdUNerrvMRkGDWl5R7rR6Jp2emlHJhGRSNBiKcFFftIswhvQTPKM3KsSYq
        XY7Bw2cAiKey0rxKo5ifZEmNAff4pigQewyGMznuUtblh9jDTm9tkWRWFmzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656133758; x=1656220158; bh=/WOAJNusevQhRPdGep7xbeatIe44
        IvjPx/CwGHOWbHQ=; b=p3+0ZHWw0LqmUnLgcizmG8fW3pijAOQz22bCds43ZpRA
        ymcwYV6hB/r7PAYVJ67UlwRb3j/UN/tfhiPOPtUZC+ztU78kUG+ZS+W9np7L4MDD
        UUNGRIZI+oO82jxtT5OMu0p9R0P+PV8myWPignE9VUczCzloOhb9ZIkLQN839NFF
        gPUnNS3bDqosHtDWhno/Pzk7TDaJaIwnlUmlPzEwnTpx19lNAKepqGZ0SppI9Jpx
        diYj+a1S5Bs51NM86PBzdGEjoZtsX1je3shfwwhYOFEzjCioXxHfvo6H60eoXRxb
        zJWwXGsIVA1i9k4Xy+5o1JtPpRCBFkleQHBID98yHQ==
X-ME-Sender: <xms:fpi2Yn_cICz-inzAto2himJQGQGinPOuLOHYz9XLbviHxlII0jupbA>
    <xme:fpi2YjsYIv-AilmDGI9FNq3hZwevJorxi0zgeiqjZH1bpgkKMV9oWY5OtOs9h2xcS
    23tPrVtHY-mQ2KlN-k>
X-ME-Received: <xmr:fpi2YlCrDbsBspXsJ7TRb_u8iKIeRMEg6rNC7WdvPKJgLEInWufKPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:fpi2Yjc9X39ztRIjkLI4V5gN6pkeEHP3i9bSbS9rHntmkBqDMsBvkw>
    <xmx:fpi2YsM-hCktdnshLr0Lx1XABTLZp1Bk-cgo_GWy1yT3d6scb3jDXA>
    <xmx:fpi2YlmHXPSORMOIm32CW_dguP02yodix1IvueyO5QFD7fHmuZjHYA>
    <xmx:fpi2Yjcn_hgTRylK9av3SMnV-i9lXcZlJC03X2dUDFzuWC3RVCS38w>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 01:09:14 -0400 (EDT)
Date:   Sat, 25 Jun 2022 08:09:12 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 36/55] media: rkisp1: isp: Rename
 rkisp1_get_remote_source()
Message-ID: <20220625050912.p2zpukc3flloi5vp@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-37-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-37-paul.elder@ideasonboard.com>
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
>Rename the rkisp1_get_remote_source() function to
>rkisp1_isp_get_source() to use a consistent rkisp1_isp_* prefix for all
>ISP functions, and drop the "remote" as the source can't be local.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 91b37f2dca91..627b1ad3bf26 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -58,7 +58,7 @@
>  * Helpers
>  */
>
>-static struct v4l2_subdev *rkisp1_get_remote_source(struct v4l2_subdev *sd)
>+static struct v4l2_subdev *rkisp1_isp_get_source(struct v4l2_subdev *sd)
> {
> 	struct media_pad *local, *remote;
> 	struct media_entity *sensor_me;
>@@ -754,7 +754,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 		return 0;
> 	}
>
>-	rkisp1->source = rkisp1_get_remote_source(sd);
>+	rkisp1->source = rkisp1_isp_get_source(sd);
> 	if (!rkisp1->source) {
> 		dev_warn(rkisp1->dev, "No link between isp and source\n");
> 		return -ENODEV;
>-- 
>2.30.2
>
