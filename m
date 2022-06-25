Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51BEF55A71A
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 07:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbiFYFDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 01:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiFYFDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 01:03:32 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B4A3A71D
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 22:03:31 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 041E23200910;
        Sat, 25 Jun 2022 01:03:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 25 Jun 2022 01:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656133409; x=1656219809; bh=s0njMbhfOA
        wKQ0HUGJf9ZpruML+71wF10KUEzCkJ53w=; b=QwE9T8HV14jzvNU9akxKpNB4x/
        UuyJKOoAM3iB0OT7Xym1shNp/TbnrZ+3Ah2TgDzACKSD6tq/ZC1HSdNJTYLaqTsQ
        W+H1ESeRPzYG1r8rD7yUfpSWEkecmyRyEdliF55EfTXSYFVE89YoFGENRtJdGWZf
        efdcPeoDlHJ1jUhuqqvG8+fcqn16j/JQ9zn7TPtIpPrFOsIX9Z6vENb/fHz/QDt2
        yHBHPkE/Lh+DR6bRdNOBfHkpk5a6ook7S2zMbPGmW6hFZTYsbTU4U4wZRixG9jeg
        uoexPwEptvzk9waXw7m76m1KZv4LIAD6VbY8FjiHLHizjzNiIO0xODxJzuJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656133409; x=1656219809; bh=s0njMbhfOAwKQ0HUGJf9ZpruML+7
        1wF10KUEzCkJ53w=; b=Oov0ZusTmNLzMLE1jMCaz5mSbJTTGLhbzDVamhXSCKRW
        6VlFFbXJ0ZVT57gjcxQnGjeGKKYjNa9xlRRdG58s06ikx0qabR152zKtj6GZXizq
        jG3GGj86MrIDeHWxnboUOruu+DQTMUzdE0OH+OLjwfo8k45Tyws+j/e26PoNrYSz
        BEns5S843uMzmR/Z4aQMHk1P6HMOnzHuYXe0VYqpZUa5PjxYD7WZmPJurlUN5V+r
        YhBYne6rh601tVQodr7AxXesFhH2pNkXIuSfCLR801CEk5unizX666sf5mslGuiT
        GnFdixiP1vrh2mZRrvz5P2UdCThBaiLyW7VMkeKrDQ==
X-ME-Sender: <xms:IZe2Yii6Xn_YaszNhqyXjwJhF759bYFDcvoEcZzbkWdXBq3m-GFmHA>
    <xme:IZe2YjBPa-u5-hSGN1ssH1I3E7CJ2vA1f3-RsbnnrKmaZ-eYFp7fxiPCv9K_inqm2
    goSQzFTBCnVjSfhD1s>
X-ME-Received: <xmr:IZe2YqEvdj2dT_Pgy965Iw8aocmV_dXkhPREpBaLZhf23Gf1rD4Qeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:IZe2YrRZbCXhh1qc8uCaXTh-QDfTjUKMgSeIhycw2_7Zb04bWAlbAA>
    <xmx:IZe2Yvyt7U24RFBDOdCnnWnKKDyrmkIrjnKW33m9km4eXRkxhRLO8g>
    <xmx:IZe2Yp4YuiUrwTitk5AidoeHqHEzHbITysT3Na1kehz4yHTPjZiRuQ>
    <xmx:IZe2YmwFB3Egwaou91ndfvlmLYdpWseQJDEnB-LdTCPQL7hPtGQ7-w>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 01:03:26 -0400 (EDT)
Date:   Sat, 25 Jun 2022 08:03:24 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 32/55] media: rkisp1: isp: Merge ISP_ACQ_PROP
 configuration in single variable
Message-ID: <20220625050324.vujslblmu3evyvdh@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-33-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-33-paul.elder@ideasonboard.com>
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
>The rkisp1_config_isp() function stores the value of the input selection
>and polarity configuration in two different local variables, OR'ed
>together when writing the register. Merge them into a single acq_prop
>variable.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../media/platform/rockchip/rkisp1/rkisp1-isp.c  | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index f5b8a2e31936..4496af991c82 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -141,7 +141,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> 			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
> {
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
>-	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0, input_sel = 0;
>+	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
> 	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
> 	struct v4l2_mbus_framefmt *sink_frm;
> 	struct v4l2_rect *sink_crop;
>@@ -188,17 +188,17 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> 	/* Set up input acquisition properties */
> 	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL) {
> 		if (mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>-			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
>+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
>
> 		switch (sink_fmt->bus_width) {
> 		case 8:
>-			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
>+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
> 			break;
> 		case 10:
>-			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
>+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
> 			break;
> 		case 12:
>-			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
>+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
> 			break;
> 		default:
> 			dev_err(rkisp1->dev, "Invalid bus width\n");
>@@ -208,15 +208,15 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>
> 	if (mbus_type == V4L2_MBUS_PARALLEL) {
> 		if (mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>-			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
>+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
>
> 		if (mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
>-			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
>+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
> 	}
>
> 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, isp_ctrl);
> 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP,
>-		     signal | sink_fmt->yuv_seq | input_sel |
>+		     acq_prop | sink_fmt->yuv_seq |
> 		     RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(sink_fmt->bayer_pat) |
> 		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL);
> 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_NR_FRAMES, 0);
>-- 
>2.30.2
>
