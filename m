Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D883655A70F
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 06:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiFYE3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 00:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiFYE3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 00:29:19 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7344DF69
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 21:29:19 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E14E8320091C;
        Sat, 25 Jun 2022 00:29:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 25 Jun 2022 00:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656131357; x=1656217757; bh=BnmtY0nXyS
        KeNKYb4tE2O8x1rRaPgomnT6pdZYl/GVU=; b=gNTxptsGeVUy/PExplzCkLRQGt
        +Vqq9UUybKIw8XejKCGkp+U6EsGU6IBwSW9WEqKLksds0lPDkhvll1X0kpZ3c3oF
        iZKQz/sK0FcY6hnMm1RUS3LbPo9uEFFPmhEWfzECgILI/Y6pAwuQO6UHkP8i3fy8
        mzCltCek3Zd/LfLoU0Zj5rJ9IbF3qx3pBBGAWQ+/YLVNFLO++t4HK2YB4iNytE7K
        ZgMEaEb/MoiHNfGl3b45dOWOABJlFF3s+FxBhTts5BijlHRwcobXfh6i6+dMMpRc
        erjESn39OIztnj9+4capXpYcBmLODg+l5hXjY45hppwFyXTt+R6Ciix7Xoaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656131357; x=1656217757; bh=BnmtY0nXySKeNKYb4tE2O8x1rRaP
        gomnT6pdZYl/GVU=; b=SrhtA2cvs9qPKeSwuTQUO20PsjfRjrxUMln1iWfckU/Q
        jV0ClhcYLB9PwZ3y3ZYh8qLmWH641JGUfVrvs5YSy+w2EslU5wHkDBwWPjXmLZvH
        xrGAV4p8qrevP9TwDqjA0x0RQ2mQBQqfDWBxMwG6xg191pJoYopddhiZo4AXbhp5
        f7QsNL+tf+X1faEhvEpgIeb+kI9axPDVuNgcQc/yp4oOyYQdYPAsC3jFpjyfmhyw
        y8FwZY+ovy73D99cX/zDZXtS2yBsk7x4O5WLg0F3GoN+TidZA5nYGJZAZPqZtntM
        AtSTCO4zvWiAgknaQtANRmqVgujTXsOvRMdJU+9DjQ==
X-ME-Sender: <xms:HY-2Yk_t7P5bi39JL3S90JkksvKbYg5s09Jrv1lxb-D6TksmEHWlwQ>
    <xme:HY-2Yssg4Pb9Y2plt9a3sVV5c0vgyPz8vRF8CLFOEAcFylfZlJwZlRyHpwe6JXMws
    pfWizHaOb0g1YWX9rE>
X-ME-Received: <xmr:HY-2YqCwaLexy6Z-P68uQZ0Rg59LAe6BrZgMNeYBM-J3Vxg0y7p3gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:HY-2Ykdgpv4ichJl6cfIVu5fhf8f7BN5zoXYCQ-BfuPij2OZ0Bdaxg>
    <xmx:HY-2YpOMDnfzdata-r9VQCC5CeyH58cSgEmKPx3fQ2c_NMJBV3FOvA>
    <xmx:HY-2YumI6FUykYYv7LmaogxAd_AnNBEQ9s9lWkZnCiiFl4SETtnpHA>
    <xmx:HY-2Ysdzj138Piwru1auM6pCpwE5iZmzwVR5clUM6LicRihSR4FKCA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 00:29:13 -0400 (EDT)
Date:   Sat, 25 Jun 2022 07:29:10 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 24/55] media: rkisp1: csi: Constify argument to
 rkisp1_csi_start()
Message-ID: <20220625042910.54hgmk6izei2zcge@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-25-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-25-paul.elder@ideasonboard.com>
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
>The sensor argument to rkisp1_csi_start() isn't meant to be modified by
>the function. Make it const.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 4 ++--
> drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>index 925274b9a3c4..425a3b014089 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
>@@ -20,7 +20,7 @@
> #include "rkisp1-csi.h"
>
> static int rkisp1_csi_config(struct rkisp1_csi *csi,
>-			     struct rkisp1_sensor_async *sensor)
>+			     const struct rkisp1_sensor_async *sensor)
> {
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
> 	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
>@@ -95,7 +95,7 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
> }
>
> int rkisp1_csi_start(struct rkisp1_csi *csi,
>-		     struct rkisp1_sensor_async *sensor)
>+		     const struct rkisp1_sensor_async *sensor)
> {
> 	struct rkisp1_device *rkisp1 = csi->rkisp1;
> 	union phy_configure_opts opts;
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>index 7d3f01cfb49f..97ce7e7959ab 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
>@@ -18,7 +18,7 @@ int rkisp1_csi_init(struct rkisp1_device *rkisp1);
> void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
>
> int rkisp1_csi_start(struct rkisp1_csi *csi,
>-		     struct rkisp1_sensor_async *sensor);
>+		     const struct rkisp1_sensor_async *sensor);
> void rkisp1_csi_stop(struct rkisp1_csi *csi);
>
> #endif /* _RKISP1_CSI_H */
>-- 
>2.30.2
>
