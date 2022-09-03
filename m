Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328D75ABC9B
	for <lists+linux-media@lfdr.de>; Sat,  3 Sep 2022 05:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbiICDic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 23:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiICDib (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 23:38:31 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F646DAEE3
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 20:38:30 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 631A73200919;
        Fri,  2 Sep 2022 23:38:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 02 Sep 2022 23:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662176308; x=1662262708; bh=BJoTr0R3zZ
        jNznhukSdZfeebCqqiqxh9mNtozUM/BOI=; b=ku6M7oWcSi+2Dmm5/Qh7JhPGSb
        hjJntL1MVUqWFsl57A1gl0n66RuNo4aRA4BvMUpsnoBSbdrm7EvfuCdfAC+xWyYy
        f4r38fs/toqunf1PZMobIEeFFJ9FQ7fYtQKeSPiLvOpIonYLOcF3oHMapEypzjU0
        ibB5ADE2EqZr8B5+/ETFdaR6cvl6g4EmgpxbIcSS03F5Z/AYd+i5Rr0fUwEH+Z5x
        ftwnMJ8fm2kjdTxo9PRdqKKXX5t5onWnSjjT/mbvygs4KzMf/VwrxP/9veGGdeVY
        mMhCnkHIZUlSo/kOjg4uuEBtNyladb2GeGFUeY1aSBeWN2vEM7rQkQ+CHFLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662176308; x=1662262708; bh=BJoTr0R3zZjNznhukSdZfeebCqqi
        qxh9mNtozUM/BOI=; b=iGpiKo5klA7FF0W1xgmVBZpqFQdTztED78r7CtwFp6LK
        tXm92zYKq7+eLNdDsyqzazgbmrhpbdoPNhMicVVELE7p/4wWOJENF5y0fgSj2B27
        XI0XUnbuX2YJ0NA8xnPeTehXuaOhwsAvQ37AvnNocznjCWT83HQvRAlwVDVUJhFP
        pEiN1PCjoB+kReauaVuA7tj91Gb340ErJnMj5pZ3LF8A5UTF8NvsVRChbWK/PS4N
        1O3+vA1yY6sPLIAIe3kGKzzSCV/wFJowxmcgH1TRMrw52Znlb/1+ZEFJZyU0M9k5
        aV4Y5ARxQju1x+6VVflAU7duceRtRxiuFc6OFt90wA==
X-ME-Sender: <xms:NMwSY8BxQQR8v66fMIpLXdldKn0IOf6V71b_h_DYcXLuBR7tY4otig>
    <xme:NMwSY-gKBkHrFhnThBHtsmpLCQAYuFOmj0FtLEepjrr0HQhK5fkNye6r2YCQBzDNi
    1WYJO18j6lFqoJRDBo>
X-ME-Received: <xmr:NMwSY_lsn1J4tCcpI9FTMhwI2w4Tgto-bn1knZClIFKbRS4hX7UmGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeluddgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:NMwSYyyIOBJl2Vle-JwW147rszTDLTppMmlOSNTBEU2gKdSVCT2wEA>
    <xmx:NMwSYxRHPXlm3ICgFEwZSr7iKdJ71zwR2PRDP7iuv8q0vxX1QJcJUA>
    <xmx:NMwSY9bXSQwSCChpJuPnPJEGea_kqoT6eaWHUGfY7wrZ2lEIw3Lh_A>
    <xmx:NMwSYzciKXR6NYY1u-CDRLV6YcWPPjBwlWIe3MH4xUqhEeAmH5OgbQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 23:38:26 -0400 (EDT)
Date:   Sat, 3 Sep 2022 06:38:24 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 8/9] media: rkisp1: Initialize color space on resizer
 sink and source pads
Message-ID: <20220903033824.6qu2xb3x7me34t45@guri>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-9-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23.08.2022 20:18, Laurent Pinchart wrote:
>Initialize the four color space fields on the sink and source video pads
>of the resizer in the .init_cfg() operation. The resizer can't perform
>any color space conversion, so set the sink and source color spaces to
>the same defaults, which match the ISP source video pad default.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>index becef04fdf2d..6f6ec00b63b8 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>@@ -430,6 +430,10 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
> 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
> 	sink_fmt->field = V4L2_FIELD_NONE;
> 	sink_fmt->code = RKISP1_DEF_FMT;
>+	sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>+	sink_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
>+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>+	sink_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>
> 	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
> 					     RKISP1_RSZ_PAD_SINK);
>-- 
>Regards,
>
>Laurent Pinchart
>
