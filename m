Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F71F55A0CE
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 20:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiFXSUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 14:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbiFXSUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 14:20:30 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157EC56C37
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 11:20:27 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 400E15C0191;
        Fri, 24 Jun 2022 14:20:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 24 Jun 2022 14:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656094825; x=1656181225; bh=ibjAgQK7We
        cGiKuuHSjJYhCWJTMWlHJNs4G7dwNlxHg=; b=MJpbnLZVOUrHMilq4gvLOeakRv
        mg0KLZjumPrInGDuYWkih3PDjUag3PcXYk+lOfANU6bHk5vZJSf7x2C/csLxr6S8
        KUyE7e0z6cnysX0Q7ts4ghPWUxHWNcNJ6XPie2XhGhb98NN8tVwZ6Hz+onCL+G1c
        wFXen4q/gUUUgeb3ogbL6iyisiq+VIgqPDyaLEF1jY1MAA+m9axh0N+v/FlAVSIL
        oo+i4GPpjE91lLfnm842KF2e7rwlOmJ10RI9tlj/8E3UkHqG2J+wUPN3BftUkTLG
        +EY7gP9ShEtVcJWcUvzoR2K3IsUGeahif9waKC0HGzzONKTJo9ePUsqzfw9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656094825; x=1656181225; bh=ibjAgQK7WecGiKuuHSjJYhCWJTMW
        lHJNs4G7dwNlxHg=; b=ObqXllwB7EHtIg2rr1LA+2/tct8r+LzNdYjP8gcu+LpX
        b2OeiNX4z4eawoJPOscEs09yjyuOoMC9KtuhUEilLSynJmcgvdLEzFbX2sNbJf7M
        HwgAwNuKRtEmskzEG/44amXM0kC8LrlxGE1jVhmBPGzJcaQt/WR/mLAFvuXwgDnJ
        NE3x8g+Eiv6QUcRVfVwuW9JgD87nKbSEANv8a2AvaTffWm9fDObD2mx2IaqwdGPe
        bcFD/JV+hHxVGCeKc/NbC6kWUbjMStn0v1tobr/G+ZK9XyH1rO1i//Osb67s+XWp
        5cv5T99THoJ0XiLdtf4wi8z/RAqnA+85yDQT6Bh1ww==
X-ME-Sender: <xms:aAC2YlCqqGvsd-6dA2rNj34b5Z5l2TT5L7YiqbmcnHfE5WdOZ_dnTQ>
    <xme:aAC2YjiAigk7bw5xV1llz_-mecCVX0sWEc_0ecEtGOaJSN7JBtMwwwTWPX7FiC_jx
    NpjcmpDcLIutWHHjgQ>
X-ME-Received: <xmr:aAC2YglAKzqLIza6Ko_R0X-bfd8EuDKeGAiwShadDRy1Coyed2g2uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:aAC2YvzFIbvQN7OaLbVjSz0RgdOK2e3XO5JO61PJzf5iFUu4lTvoTA>
    <xmx:aAC2YqR41U0nH9vS6sAZruHWf7Z7WvTri_BKjlhwFID7tqfUqjOxiA>
    <xmx:aAC2YiZSXt4E1yroMLHVeUsTLzZs0pFgKD5EgH7aJoyTzB3_iPo4uA>
    <xmx:aQC2YnSI9IxOgxO1X2jHOespedNIqHfvtyv7N44YHHCE9_0FybCipg>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 14:20:21 -0400 (EDT)
Date:   Fri, 24 Jun 2022 21:20:18 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 12/55] media: rkisp1: Reject sensors without pixel rate
 control at bound time
Message-ID: <20220624182018.qziw5zizizhlhn5p@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-13-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-13-paul.elder@ideasonboard.com>
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
>The rkisp1 driver requires the sensor to implement the pixel rate
>control. Trying to operate without it will cause an error when starting
>streaming. Catch the issue earlier, at bound time.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 6 ++++++
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 -----
> 2 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 39ae35074062..7fc617d51f44 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -190,6 +190,12 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>
> 	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
> 						V4L2_CID_PIXEL_RATE);
>+	if (!s_asd->pixel_rate_ctrl) {
>+		dev_err(rkisp1->dev, "No pixel rate control in subdev %s\n",
>+			sd->name);
>+		return -EINVAL;
>+	}
>+
> 	s_asd->sd = sd;
> 	s_asd->dphy = devm_phy_get(rkisp1->dev, "dphy");
> 	if (IS_ERR(s_asd->dphy)) {
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 58cf6d21f1eb..81138c676ac0 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -823,11 +823,6 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
> 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> 	s64 pixel_clock;
>
>-	if (!sensor->pixel_rate_ctrl) {
>-		dev_warn(rkisp1->dev, "No pixel rate control in sensor subdev\n");
>-		return -EPIPE;
>-	}
>-
> 	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
> 	if (!pixel_clock) {
> 		dev_err(rkisp1->dev, "Invalid pixel rate value\n");
>-- 
>2.30.2
>
