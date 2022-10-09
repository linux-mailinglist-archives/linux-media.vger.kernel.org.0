Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23505F8976
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 07:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiJIFjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 01:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiJIFjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 01:39:07 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA9032B86
        for <linux-media@vger.kernel.org>; Sat,  8 Oct 2022 22:39:06 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 8BD035C00F8;
        Sun,  9 Oct 2022 01:39:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 09 Oct 2022 01:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665293945; x=1665380345; bh=vBjW1qNt6v
        Wq+jciJa8stN/rPWx9/yLvAAU/bpSDGEw=; b=QymyVAd2/X5UyqyzZTZ7DB2ljX
        ZdO9dh3Of2c+gEoKD+j/y9TUOpAdkVns76l/rwT/pnXh8jRvsOwVH18lGMgqCyp8
        6nKSDP7sn9stOxsSsfYwfhUFRJJvUbEcZhaZncPdqKUf09ZXCAjxaWK+PI1WmF4n
        er2Vgny2Z4I0L+NAK9s5CxyI6ZbJtXZBScmd0F90l1Uk8qRrpGSmqK6jJpHCWGZu
        cJO6LQVBNcDYXFjcgtB22SwPCAD3QoxDej+CFbQmriwJF6i8XnG/CKhvLp23OCJA
        JCfcfUNzJj4H6DAblJx0Va6mQBPlq6N+IdLw93SQHIm3QdPHp0UTWUPr4vDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665293945; x=1665380345; bh=vBjW1qNt6vWq+jciJa8stN/rPWx9
        /yLvAAU/bpSDGEw=; b=linpvrlplJh9hwh8AFCcEtMtq0NYTXcW2RfOJRVfq1nU
        p//0eOoIH97KGrGKt46BvCJghD3OcO2aZXRHqgi6hH2FI24f/deWe3uj+Y4O3wXp
        1Q61sL62wHoHccFoe6S2ZVi00BNz6ucE0S0qbo8FVbGBWMZv+Yio6yCY9ffSJf3I
        X6y8OM5fDihjUDRQCiPVqcjyKlbc8t6KV2hb8g8gxywUKhBLE3qf24mWAyZDyHCn
        A8X4dHyn1SQZaCXWBrZkE3F5CtExMHFNEsl56y7d/pmKDYK3esZEP8odf/KzW+8e
        7tP2wNXR/kV5wKFvc0cC5SWtPB55oNwdOggvmEdN5Q==
X-ME-Sender: <xms:eF5CY_q9s-cp7o3H1LQCh2WzN_7DJcJtqhagNKTnZEAgAqt3CkCqPA>
    <xme:eF5CY5qbpFpdLOjavzjzGvScjMVKHp7mm3jS5L-NE9ZXCnXeJU2HSYVXidAzsIbj8
    IlPGahH6d-g8osFwY4>
X-ME-Received: <xmr:eF5CY8P0OnE6ydGfajB61uqnaEN7zVmCrWmMYa-L4SSp56mpQHKYEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejtddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:eF5CYy7VqDCQa76uXlV71kFm8UAQL4eJB3Zy42iYINwjaX4t_TMTqA>
    <xmx:eF5CY-7cFQ78cl6Xq3isykHjPS_L3XAkkzzdcpm7umpK2tw564nNMw>
    <xmx:eF5CY6iBGzSdXiU3NKqGpHW5f-84_lm986J1rB_8KK05auGH0AbvaQ>
    <xmx:eV5CY3GddaJGbmWzzzJhXdk_ZZPyxTgpStpJgclVltRWnPu7ssJF_w>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Oct 2022 01:39:01 -0400 (EDT)
Date:   Sun, 9 Oct 2022 08:38:59 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v15 08/19] media: subdev: Add for_each_active_route()
 macro
Message-ID: <20221009053859.fmiiwdu4rjxe5c7g@guri>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-9-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20221003121852.616745-9-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03.10.2022 15:18, Tomi Valkeinen wrote:
>From: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
>Add a for_each_active_route() macro to replace the repeated pattern
>of iterating on the active routes of a routing table.
>
>Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>---
> .clang-format                         |  1 +
> drivers/media/v4l2-core/v4l2-subdev.c | 20 ++++++++++++++++++++
> include/media/v4l2-subdev.h           | 13 +++++++++++++
> 3 files changed, 34 insertions(+)
>
>diff --git a/.clang-format b/.clang-format
>index 1247d54f9e49..31f39ae78f7b 100644
>--- a/.clang-format
>+++ b/.clang-format
>@@ -190,6 +190,7 @@ ForEachMacros:
>   - 'for_each_active_dev_scope'
>   - 'for_each_active_drhd_unit'
>   - 'for_each_active_iommu'
>+  - 'for_each_active_route'
>   - 'for_each_aggr_pgid'
>   - 'for_each_available_child_of_node'
>   - 'for_each_bench'
>diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>index 3ae4f39a50e4..1049c07d2e49 100644
>--- a/drivers/media/v4l2-core/v4l2-subdev.c
>+++ b/drivers/media/v4l2-core/v4l2-subdev.c
>@@ -1212,6 +1212,26 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> }
> EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
>
>+struct v4l2_subdev_route *
>+__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
>+				struct v4l2_subdev_route *route)
>+{
>+	if (route)
>+		++route;
>+	else
>+		route = &routing->routes[0];
>+
>+	for (; route < routing->routes + routing->num_routes; ++route) {
>+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>+			continue;
>+
>+		return route;
>+	}
>+
>+	return NULL;
>+}
>+EXPORT_SYMBOL_GPL(__v4l2_subdev_next_active_route);
>+
> #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
> #endif /* CONFIG_MEDIA_CONTROLLER */
>diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>index 7962e6572bda..89e58208e330 100644
>--- a/include/media/v4l2-subdev.h
>+++ b/include/media/v4l2-subdev.h
>@@ -1435,6 +1435,19 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> 			    struct v4l2_subdev_state *state,
> 			    const struct v4l2_subdev_krouting *routing);
>
>+struct v4l2_subdev_route *
>+__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
>+				struct v4l2_subdev_route *route);
>+
>+/**
>+ * for_each_active_route - iterate on all active routes of a routing table
>+ * @routing: The routing table
>+ * @route: The route iterator
>+ */
>+#define for_each_active_route(routing, route) \
>+	for ((route) = NULL;                  \
>+	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
Hi, shouldn't it be something like:
	for ((route) = NULL; (route) ; (route) = __v4l2_subdev_next_active_route((routing), (route)))

Thanks,
Dafna

>+
> #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>
> #endif /* CONFIG_MEDIA_CONTROLLER */
>-- 
>2.34.1
>
