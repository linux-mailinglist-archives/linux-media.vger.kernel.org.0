Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBE355A132
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 20:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiFXSnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 14:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiFXSnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 14:43:41 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC7956FB1
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 11:43:40 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 1EB215C01D5;
        Fri, 24 Jun 2022 14:43:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 24 Jun 2022 14:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656096220; x=1656182620; bh=/4h61kVDfN
        jVyPQF/xQAyWCcFWmlO5sv/VgdDmfATag=; b=i18EgZ57AwmxBJLlXRC/hjJdKw
        bICOy528JtwJuZL01Nl+BcZNrJG0lDY3PYTdrCYc4FXzEak48GVkBta5U1qVNKlf
        kgRsGDB6dLLYdaDbLz7lC7UBjPu0O3ZJJ5KKabh7hLsNc3oZDkweAoZG61X8+dFE
        3gholXq8BxV6wtlADQme6YEyxCqHr/2by/Yhr4p2Kv9D50vBJCQ5X9joGIIOpxKC
        ZlothHsHzB86V33iSEYcOWFf+SAfACzYj5uTYBX8tPmNBmPebPpf0HUGPv6c3+Pk
        FHY+Qd8y5WL9i7581lX1/iDed8FRwb6nGSUduriXMDs/vJSY2V8joI92bAvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656096220; x=1656182620; bh=/4h61kVDfNjVyPQF/xQAyWCcFWml
        O5sv/VgdDmfATag=; b=uieWWA/kTTWUyJYaOn0H506qAC+SKS+TNGV8YvisjQaq
        5PiPZhg6iut2cLvolFZzPN1UtOkbMBLyPUVKKB0/4hDm+1anhNHmWT5A7qX/sorH
        otCGdowXNDEE5QpYfNqeJ7IAC9ow38ausOUeHVDz7QH5P3UoMH2OBET1apP0qQ3r
        1WN+6kxQvhhIxgPRlTJbk24QmYPrjHfarA/imfwGXZc0mwYUREdKV8ZsBUeMCrVE
        sVzz1FoGXBnPnp9DQzfgvSgd5J8WdZ2R/9LuWCMEBD1mCxYyMchNNKQWaFEGQrJ/
        gfQSLa/aU1zQlomuJXhUjgVrj6of+x5LWln+4sDFEw==
X-ME-Sender: <xms:2wW2Yhd56LDoisGvPnZJZdqRZGDxCs8U1J0FwbzeKY0tP7H1tt59tQ>
    <xme:2wW2YvNU8ApdXI4bj_yrObIMvcbubQ0haRN7dkWhUXnfghE8yyaKwXeefVrJoe2i_
    IWXTQ-scyruEgZFR80>
X-ME-Received: <xmr:2wW2YqjVCpYcuiS5cZo73FLS92py8RBwFtexc2rjSPOmNY8hqiy4jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvdehtdeludekgeevleefuedvudejieetheekvdfhteekffdu
    jefhfedtudehvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:2wW2Yq9UVYp2SruEiIpJby7dKEsLjy3Wr_UbYtz28aEfZTEUcKcnDg>
    <xmx:2wW2YtsMAqCeq-tbVbVXoeXRO0AA_Ve1Q5--rim8B7Fyh0rs3Umeow>
    <xmx:2wW2YpHXNj13ZBQlq6hKKTPDxbF54Mj8BvZTzVlIJpkzFBpSv8HgIA>
    <xmx:3AW2Yu8BNTjI8mH-bdREkhbW8EghpcVa6D21kue7BI5JCfXB1gaZhA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 14:43:36 -0400 (EDT)
Date:   Fri, 24 Jun 2022 21:43:34 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 14/55] media: rkisp1: Create internal links at probe time
Message-ID: <20220624184334.gpupbgyjyotpbe4i@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-15-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-15-paul.elder@ideasonboard.com>
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
>There's no need to wait until all async subdevs are bound before
>creating internal links. Create them at probe time.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> .../platform/rockchip/rkisp1/rkisp1-dev.c     | 105 ++++++++----------
> 1 file changed, 49 insertions(+), 56 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>index 4501aea265cb..7bb1235cddea 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>@@ -109,50 +109,6 @@ struct rkisp1_isr_data {
>  * Sensor DT bindings
>  */
>
>-static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>-{
>-	unsigned int i;
>-	int ret;
>-
>-	/* create ISP->RSZ->CAP links */
>-	for (i = 0; i < 2; i++) {
>-		struct media_entity *resizer =
>-			&rkisp1->resizer_devs[i].sd.entity;
>-		struct media_entity *capture =
>-			&rkisp1->capture_devs[i].vnode.vdev.entity;;
>-
>-		ret = media_create_pad_link(&rkisp1->isp.sd.entity,
>-					    RKISP1_ISP_PAD_SOURCE_VIDEO,
>-					    resizer, RKISP1_RSZ_PAD_SINK,
>-					    MEDIA_LNK_FL_ENABLED);
>-		if (ret)
>-			return ret;
>-
>-		ret = media_create_pad_link(resizer, RKISP1_RSZ_PAD_SRC,
>-					    capture, 0,
>-					    MEDIA_LNK_FL_ENABLED |
>-					    MEDIA_LNK_FL_IMMUTABLE);
>-		if (ret)
>-			return ret;
>-	}
>-
>-	/* params links */
>-	ret = media_create_pad_link(&rkisp1->params.vnode.vdev.entity, 0,
>-				    &rkisp1->isp.sd.entity,
>-				    RKISP1_ISP_PAD_SINK_PARAMS,
>-				    MEDIA_LNK_FL_ENABLED |
>-				    MEDIA_LNK_FL_IMMUTABLE);
>-	if (ret)
>-		return ret;
>-
>-	/* 3A stats links */
>-	return media_create_pad_link(&rkisp1->isp.sd.entity,
>-				     RKISP1_ISP_PAD_SOURCE_STATS,
>-				     &rkisp1->stats.vnode.vdev.entity, 0,
>-				     MEDIA_LNK_FL_ENABLED |
>-				     MEDIA_LNK_FL_IMMUTABLE);
>-}
>-
> static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
> 					struct v4l2_subdev *sd,
> 					struct v4l2_async_subdev *asd)
>@@ -210,19 +166,8 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
> {
> 	struct rkisp1_device *rkisp1 =
> 		container_of(notifier, struct rkisp1_device, notifier);
>-	int ret;
>-
>-	ret = rkisp1_create_links(rkisp1);
>-	if (ret)
>-		return ret;
>-
>-	ret = v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
>-	if (ret)
>-		return ret;
>-
>-	dev_dbg(rkisp1->dev, "Async subdev notifier completed\n");
>
>-	return 0;
>+	return v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
> }
>
> static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
>@@ -332,6 +277,50 @@ static const struct dev_pm_ops rkisp1_pm_ops = {
>  * Core
>  */
>
>+static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>+{
>+	unsigned int i;
>+	int ret;
>+
>+	/* create ISP->RSZ->CAP links */
>+	for (i = 0; i < 2; i++) {
>+		struct media_entity *resizer =
>+			&rkisp1->resizer_devs[i].sd.entity;
>+		struct media_entity *capture =
>+			&rkisp1->capture_devs[i].vnode.vdev.entity;;
>+
>+		ret = media_create_pad_link(&rkisp1->isp.sd.entity,
>+					    RKISP1_ISP_PAD_SOURCE_VIDEO,
>+					    resizer, RKISP1_RSZ_PAD_SINK,
>+					    MEDIA_LNK_FL_ENABLED);
>+		if (ret)
>+			return ret;
>+
>+		ret = media_create_pad_link(resizer, RKISP1_RSZ_PAD_SRC,
>+					    capture, 0,
>+					    MEDIA_LNK_FL_ENABLED |
>+					    MEDIA_LNK_FL_IMMUTABLE);
>+		if (ret)
>+			return ret;
>+	}
>+
>+	/* params links */
>+	ret = media_create_pad_link(&rkisp1->params.vnode.vdev.entity, 0,
>+				    &rkisp1->isp.sd.entity,
>+				    RKISP1_ISP_PAD_SINK_PARAMS,
>+				    MEDIA_LNK_FL_ENABLED |
>+				    MEDIA_LNK_FL_IMMUTABLE);
>+	if (ret)
>+		return ret;
>+
>+	/* 3A stats links */
>+	return media_create_pad_link(&rkisp1->isp.sd.entity,
>+				     RKISP1_ISP_PAD_SOURCE_STATS,
>+				     &rkisp1->stats.vnode.vdev.entity, 0,
>+				     MEDIA_LNK_FL_ENABLED |
>+				     MEDIA_LNK_FL_IMMUTABLE);
>+}
>+
> static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
> {
> 	rkisp1_params_unregister(rkisp1);
>@@ -365,6 +354,10 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
> 	if (ret)
> 		goto error;
>
>+	ret = rkisp1_create_links(rkisp1);
>+	if (ret)
>+		goto error;
>+
> 	ret = rkisp1_subdev_notifier(rkisp1);
> 	if (ret) {
> 		dev_err(rkisp1->dev,
>-- 
>2.30.2
>
