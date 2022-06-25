Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA57955A716
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 06:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbiFYEuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 00:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbiFYEuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 00:50:21 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9293724BE6
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 21:50:20 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id A4DA3320091C;
        Sat, 25 Jun 2022 00:50:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 25 Jun 2022 00:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656132617; x=1656219017; bh=blAuf5J9Du
        JTKgmoN9/Dnj0jJc61KJQnF6ZOBArbbGg=; b=VNIlLleTnVaPSvyAuU7V0SNPQX
        lQ1XkzRAYqR5E7NOcgd+U23YPkr/y0PYHLScyy8iL6vR/ieB5Cn08n3cSZIYZN0S
        ZPHtp7pRsqbRoy0j9tAH3GUZU3AGnU4URShcBTpzp6CM9L+tbyLUNGECTBUkZRgS
        3DzFlmS3Ut8DOrsnpO6aNloAXa3NOjyP6jN+AowdcXR028Zoqv0+2+9wfCYA/tP6
        OGu+SIWJREeDFTt6cFFtJC/Ewybr2uepvPHFozHgMwF2D+7PIJBnVtwBwFdDB/KZ
        R4Lxn3HC0Wa7dGk7KBXWIJi3ox+xxLippjKD20yV5wP27oIlEgpldjO0M4Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656132617; x=1656219017; bh=blAuf5J9DuJTKgmoN9/Dnj0jJc61
        KJQnF6ZOBArbbGg=; b=BtsP1oUJnpOnmcDyIOoyte+3J07UVCxlRhYPrrWCpZ+8
        sDrFYNod3JCNDQvy8tE/aRvCKPjJefLI55WQqX+sHqFurTiW4VLuB1hgfNxzvX1l
        YagryX7Vi4hemnDRTHD93BwrKGO2V+AGh+v2bNa5QgZFIHFSlcmAWdqZvSa2Wsre
        iWSkLLzPcA36ndsyEXNiQivYR9XY565SEmWVwA3t0bVlA4CH1BZPP0DE24qkjEc6
        gltLXDK1QmDwEWvdvh36zgF8iOJ1V+MyAei1U/FQu01WxRS6/JjboYNKjKEpHDFl
        kBVQ2bpfy9WBFwPyrZcBKwRM9nnN/j16lhCw9pESbQ==
X-ME-Sender: <xms:CJS2YrXTQRW53eDsHa_mCHRROh3WwevCqY_h0wTzjdKOAw_bRdi9DQ>
    <xme:CJS2YjneDZpXPgRdV6jOapfczYAFA1eyYh7Iywly7A9Gfcp8XwpNCyD0jTtoUykXQ
    2UXj6_k-6rHsIioaWY>
X-ME-Received: <xmr:CJS2YnYse08FbTImGw7kusTwDkowGyCXd9e1A4V0EiBHcCHcW3tB7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:CJS2YmVeDxds3b62f1Lp171VezU2mmFmPL_fOsXX9HIFwmhYZkabhQ>
    <xmx:CJS2YlmzuXd5QBj5p23SSqPGbv728CUh7kSrbS3Y2RHDY7uG4dOwzA>
    <xmx:CJS2YjfvJdYOvJQaqkU-dyuf7kEi4SxfRGmx5LMqjbDbOJ068_01Rw>
    <xmx:CZS2YrVofz2hl0BnqKQoU4cijH5g1j6if029p8acOq7vPVKNpCvuGw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 00:50:13 -0400 (EDT)
Date:   Sat, 25 Jun 2022 07:50:10 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 29/55] media: rkisp1: isp: Add rkisp1_device backpointer
 to rkisp1_isp
Message-ID: <20220625045010.w42npklynssgjvlw@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-30-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-30-paul.elder@ideasonboard.com>
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
>The rkisp1_isp structure documentation mentions a backpointer field to
>rkisp1_device, but the field is missing. Add it, and use it to replace
>more complicated constructs using container_of() on the v4l2_device.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../media/platform/rockchip/rkisp1/rkisp1-common.h    |  1 +
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c   | 11 +++++------
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>index 7a6f55a31bb0..3c55e922346e 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>@@ -162,6 +162,7 @@ struct rkisp1_csi {
>  */
> struct rkisp1_isp {
> 	struct v4l2_subdev sd;
>+	struct rkisp1_device *rkisp1;
> 	struct media_pad pads[RKISP1_ISP_PAD_MAX];
> 	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
> 	const struct rkisp1_mbus_info *sink_fmt;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 812fb2ea5323..f8ab1d9cc8cd 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -704,15 +704,13 @@ static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
> 				    struct v4l2_subdev_state *sd_state,
> 				    struct v4l2_subdev_selection *sel)
> {
>-	struct rkisp1_device *rkisp1 =
>-		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
> 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
> 	int ret = 0;
>
> 	if (sel->target != V4L2_SEL_TGT_CROP)
> 		return -EINVAL;
>
>-	dev_dbg(rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
>+	dev_dbg(isp->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
> 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
> 	mutex_lock(&isp->ops_lock);
> 	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
>@@ -751,9 +749,8 @@ static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
>
> static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> {
>-	struct rkisp1_device *rkisp1 =
>-		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
> 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
>+	struct rkisp1_device *rkisp1 = isp->rkisp1;
> 	struct rkisp1_sensor_async *asd;
> 	int ret;
>
>@@ -840,12 +837,14 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
> {
> 	struct v4l2_subdev_state state = {
> 		.pads = rkisp1->isp.pad_cfg
>-		};
>+	};
> 	struct rkisp1_isp *isp = &rkisp1->isp;
> 	struct media_pad *pads = isp->pads;
> 	struct v4l2_subdev *sd = &isp->sd;
> 	int ret;
>
>+	isp->rkisp1 = rkisp1;
>+
> 	v4l2_subdev_init(sd, &rkisp1_isp_ops);
> 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> 	sd->entity.ops = &rkisp1_isp_media_ops;
>-- 
>2.30.2
>
