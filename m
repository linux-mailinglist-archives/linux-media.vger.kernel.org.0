Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B01155A6C8
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 06:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbiFYEF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 00:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiFYEF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 00:05:26 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E14B7D3
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 21:05:26 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id CE65932004E7;
        Sat, 25 Jun 2022 00:05:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 25 Jun 2022 00:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656129924; x=1656216324; bh=OArguU+i8X
        rGhEUuhYjgY9SoLxXxtMS4WQmT1tMBIOY=; b=pvFupkeViN3orn2ePglQN4Kspm
        3EvUH5gTp9SPoeJRVwArVE0vL4ilTn7JIXG9dfLhBvy08W2UqD8rAdmi7uUgcON3
        CLwxAMHEAUIUxlfNYqsdXGLHVR5BL2jFq7bkJfnJC8te15TzSEXA2GRPE+bWUt6J
        DL9lslsNH+33YkrBg1RYDqrqnwxQIngeZ1tUgNabTaPCPN119to5CSb5n6UwaLmY
        nTsohYFoMnyB3PavS1M6vt6m2epsy5zeDWi86FW1ZoIS9B71QWdLNJjn+MjOrfuK
        lCJxoZ+k94luXkEYL4SPbyMbsRoqvVQHN1FF3Nocbctiu9VfE1BjBR/7Pwag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656129924; x=1656216324; bh=OArguU+i8XrGhEUuhYjgY9SoLxXx
        tMS4WQmT1tMBIOY=; b=tehyC1hmMP3iggWvxNDd7l/r5lOmi/RU30tUjgAL2t3g
        2Gg6CiHaW8SblpjwLGnEctnzVVqcVtvQzrU6jklgHkciywwXlKeEzMZr6ir+LJKl
        qLAUPUdJdp60u358S46w5+i20aA36PnWadhPnjKsep7bbDN8PNoX9emoXmy1pIm0
        9FnYiBWA8eGc/7lxRK2Ocu61Kmc/QAa8Zq/d8LFVYams2Ll2v7CqZQY21ELpM77Z
        ++AWZHS/RxSjAGT5tQRdBlc+69V9yPHwU+CmMtAnvzcF1qG0dMADgJIdsOYqAT84
        pXZV6kwdzmZdo4PDdNxvmb4/LiSNkjuDrHwD3SYjEQ==
X-ME-Sender: <xms:hIm2YpX1F0QoU5O0viXust-t5S3FKUnsUyK5BQNPBcOEQ1E0PIbKaw>
    <xme:hIm2YpmKKWjm1x9eS91TyTnNCrwnzTWO1h9uOvqszBYU3eEin7TeA9lUbfVwhnYvd
    pPEI2szmtS4szdr3x0>
X-ME-Received: <xmr:hIm2YlbRoRbOj5MozJIl6o40SlsofWSBvFty3dvhP7L8FSpL-z8Gxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:hIm2YsXRJNnwE16Duqtkzj7_auw9duakB2hDl5Kxc4J1dX0RCsfzuw>
    <xmx:hIm2YjkTBP3VAjX2-OhQxCfmdCzESHbccOG9tMlNk5p_-IjdccwXOQ>
    <xmx:hIm2YpcBdAsheGPGo-E_tHiPJ_dn59dQtndi7TZ9RRJPdNUSbqAnxA>
    <xmx:hIm2YhXtXuX8nq-79CosdKX7Hr5hDBBDJD-pVWBj1FCm24QJyj2Heg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 00:05:21 -0400 (EDT)
Date:   Sat, 25 Jun 2022 07:05:18 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 22/55] media: rkisp1: csi: Move start delay to
 rkisp1_csi_start()
Message-ID: <20220625040518.kbf2utnmpsartx56@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-23-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-23-paul.elder@ideasonboard.com>
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
>The delay in rkisp1_isp_start() is related to to the CSI-2 receiver and
>the camera sensor. Move it where it belongs, to rkisp1_csi_start().
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 7 +++++++
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 6 ------
> 2 files changed, 7 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>index c1bb8c05543d..fcaffffd371b 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>@@ -9,6 +9,7 @@
>  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>  */
>
>+#include <linux/delay.h>
> #include <linux/device.h>
> #include <linux/phy/phy.h>
> #include <linux/phy/phy-mipi-dphy.h>
>@@ -120,6 +121,12 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
>
> 	rkisp1_csi_enable(csi);
>
>+	/*
>+	 * CIF spec says to wait for sufficient time after enabling
>+	 * the MIPI interface and before starting the sensor output.
>+	 */
>+	usleep_range(1000, 1200);
>+
> 	return 0;
> }
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index ecb8ca0ad670..3ea0deb6b792 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -365,12 +365,6 @@ static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
> 	       RKISP1_CIF_ISP_CTRL_ISP_ENABLE |
> 	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
> 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
>-
>-	/*
>-	 * CIF spec says to wait for sufficient time after enabling
>-	 * the MIPI interface and before starting the sensor output.
>-	 */
>-	usleep_range(1000, 1200);
> }
>
> /* ----------------------------------------------------------------------------
>-- 
>2.30.2
>
