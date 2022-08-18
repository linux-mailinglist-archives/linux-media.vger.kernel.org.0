Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58291597D89
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 06:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239560AbiHRE2j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 00:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243152AbiHRE2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 00:28:32 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299E926AE7
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 21:28:32 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 8CE1C5C0140;
        Thu, 18 Aug 2022 00:28:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 18 Aug 2022 00:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1660796911; x=1660883311; bh=rb+uburvzG
        ICi3Fmjev28CYAJl+gtFPjxoIQiLqp/bc=; b=Z9dE1L1hPqWGC+ELgqRkrqjeuf
        wgQjKDOjRsuOfOVDUJWlDwsHFi8x2wTkfxCi/Sp2vo9HWTBr1JkKAD6rbJKeslxl
        zCSFn5GmBbkC0oKj2sZYs8bNq7b+b8/Q0hKMxD6qpHuhr0vNIemEEK9VQxdyPTNr
        B4XBtRrcNAMjO0x2AmH9Hm0UKJz7wsPBjHOyoQwVMxv6sCw1Rm9xVkqtGhlIjS1Q
        hReGB5JSZap4jvqXQ5DaCi9TwSbQxYONPRsQVDUjzQS3yCDjdF04XziTJ7+8K9cH
        XP6uJl6H3plUa9erKVSPf9G4aAr0jHs6ae1Fm/lBwq0TZcnyVeYkel1PtCkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1660796911; x=1660883311; bh=rb+uburvzGICi3Fmjev28CYAJl+g
        tFPjxoIQiLqp/bc=; b=sUHWIM1T3PkARtz4PQOy2L5ZLQDjA55lVqt2oFrass2U
        qXeIjan08mWADty++kAx23kxXmQD0ouKM9FtN2uiPArDbVhSqyabZXqVYzVXgYJt
        RVYJURXJh0W0vcgMoQ9kdT+bI9uxxJzQ2oMbBNRTDRKSmT9Lxhm9XPpt+60I5icj
        uXeaHtk8nDSj2DOlz8ioJrc5vudwXzmnuxyH+hNTG/lyIMQJUIqnaIM29kdumdnm
        lYPX8n+Gbi1Horjt/vdnOE5XZA5MuNz4TKLIBDQp4d7DCRjvkt1RBvX13Tps9nqu
        RHnFealFn+bKg8xyF+Sbsq7VLk8986mnfNjd2iIj6A==
X-ME-Sender: <xms:77_9YuzyHVJ8bJdAVESMDrIpy71s_8gyT8kgurdBPh7qeAwdyrFzrQ>
    <xme:77_9YqSShsBEtcrcwwj9xqhGE3RNfsm4BzaUtNfpBYkueurE2p-7XhA0YROv2gp0_
    QV-T28EZCUA7D4WxcQ>
X-ME-Received: <xmr:77_9YgUgnD-pJldU68rEdT79TACRY1tpFmfPJ5EAuPZQsJKb7vBzVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehjedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:77_9YkiMvXknLMKNTCLzfGCmCWqRXK9DitqRU_ttj7AOdqc75I1EQg>
    <xmx:77_9YgAvYSAJi0A-kAbOranIur1FegF7HuFGD19bhPVm_WewP-xCpA>
    <xmx:77_9YlKfge6OS8fHJRugBNicLuFjGJ8UslYvZpAgKAdedIPRBGqsmw>
    <xmx:77_9YjMcgxBZbD4KUrEdt9VOqqpaEWGEX-aoOBBkMk_iWqM-ncnrdw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 00:28:29 -0400 (EDT)
Date:   Thu, 18 Aug 2022 07:28:27 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Florian Sylvestre <fsylvestre@baylibre.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH 5/7] media: rkisp1: Configure quantization using ISP
 source pad
Message-ID: <20220818042827.qn4hqirnasdp7sxr@guri>
References: <20220815065235.23797-1-laurent.pinchart@ideasonboard.com>
 <20220815065235.23797-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220815065235.23797-6-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15.08.2022 09:52, Laurent Pinchart wrote:
>The rkisp1_config_isp() function uses the format on the sink pad of the
>ISP to configure quantization at the output of the ISP. This is
>incorrect, as hinted by the src_frm variable name that stores the
>format. Fix it by using the source pad.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 8b93b5c03bce..9d4d018d58b6 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -341,7 +341,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> 		struct v4l2_mbus_framefmt *src_frm;
>
> 		src_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
>-						 RKISP1_ISP_PAD_SINK_VIDEO,
>+						 RKISP1_ISP_PAD_SOURCE_VIDEO,
> 						 V4L2_SUBDEV_FORMAT_ACTIVE);
> 		rkisp1_params_configure(&rkisp1->params, sink_fmt->bayer_pat,
> 					src_frm->quantization);
>-- 
>Regards,
>
>Laurent Pinchart
>
