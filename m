Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A78C56D250
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 02:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiGKA5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 20:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGKA5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 20:57:05 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24725B1D3
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 17:57:01 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 25E133200B81;
        Sun, 10 Jul 2022 20:57:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 10 Jul 2022 20:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1657501019; x=1657587419; bh=UcVTvGzkTK
        Vz4u3wvGC1Ppq/u5+GVID20IbnBG1KQoE=; b=bpVwNahZum3O/Mj8dxVHwx6+5A
        4MZqK1IagYyNpfqDl/l979ruVUPcxSwfkhMZIbiMoh6sSVQRHAogX+fEDsGYjJES
        wy5SKz7Aw5NlVwe+Bn3NXdiN5sO9TycB76A+Z2u+MEJ8QUnwgnqMFZYnMvqz8f3P
        ZKzUtASBVUyjvWl2KF0BMjchiktdT0lF0PRW7TYjqzcljfo9pO22PUUhvXnytAw2
        TtIz8Ocj/gMOzfo005Olx+/aCHB2iSGYEdwYS4YKsALISiCjjGP/Qvzpug3LQQc8
        NA45QfYK6d56ux6udYoUwxj8uieABmx/kI7qP6X1uLGOSuiHcxjAoX8nYgvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1657501019; x=1657587419; bh=UcVTvGzkTKVz4u3wvGC1Ppq/u5+G
        VID20IbnBG1KQoE=; b=220kFPexKQkY3xq10XDWPv9uM5VrJrpduLKy13fhKi10
        iLTgIHwO34ZYcCCS/F453gGxpmmLjLkAhMX6wmaWX/0hIU/h80pFiEaakAl7EHru
        FUJqhoPQxsOeycEZ8zkqcHMFi4pCx86PY5fIea2BVwNBTQxMGE9xxr5Y/T0YODBb
        +qVPWzAkvWPmMXlfQawHHNoteQrUFyiviC7p/AvQMZ4DusAxZSWttZpD1/SA2S6+
        hmt433RnDBejHNmP5AZ08db8nbEDGksEiILwtTGUoJi8DQBXWDlGn+56ZblkRqCW
        CTcEiIlf4JOkkoEID2PUto0D/F9+0FnjAe9fzf2hsA==
X-ME-Sender: <xms:W3XLYvE0ELy7CczjZDbtcoIZBLp9wLbgkhbfH_PJF8NUdkmSc1hzIQ>
    <xme:W3XLYsUsmbb7Yf2BIGa-ztNa4QJ_Mf5oxeZOB-DlVGpHUyS8q_4EGjMLFyjOawlKv
    o1qz4c5AwlFr8-u5XY>
X-ME-Received: <xmr:W3XLYhJmbXAap9MvcyEgYmZDM1ZROYRONiWO8HzS9bLetF30kWlgfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehiedvjeehvdffleekffdvjedvieehhedttefhvddtueefueek
    lefhteduudfgjeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghfnhgrsehfrghs
    thhmrghilhdrtghomh
X-ME-Proxy: <xmx:W3XLYtENxCGo9lsoZy-1DD5gYj99vVu0m6IfjRV_PfeBri1ZK2RTWg>
    <xmx:W3XLYlVs07vf0lK9vUXbrAmpjwOdg7jCmU5sQ2pQJWF-A6grKCwFnQ>
    <xmx:W3XLYoManAHqT-RDxr_ova4hW1kR0wCvHByE52OldKiJOEjTxlgwEQ>
    <xmx:W3XLYryY0YPfcmuFCF-2uoJpAnQff6NDQNRPOuJyjW58uK-BWtRn9Q>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Jul 2022 20:56:57 -0400 (EDT)
Date:   Mon, 11 Jul 2022 03:56:53 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 38/55] media: rkisp1: isp: Disallow multiple active
 sources
Message-ID: <20220711005653.5x2tdcr7nsaq2dfu@guri>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-39-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-39-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01.07.2022 02:06, Laurent Pinchart wrote:
>The ISP supports multiple source subdevs, but can only capture from a
>single one at a time. The source is selected through link setup. The
>driver finds the active source in its .s_stream() handler using the
>media_entity_remote_pad() function. This fails to reject invalid
>configurations with multiple active sources. Fix it by using the
>media_entity_remote_source_pad() helper instead, and inline

you meant media_pad_remote_pad_unique ?

thanks,
Dafna

>rkisp1_isp_get_source() in rkisp1_isp_s_stream() as the function is
>small and has a single caller.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> .../platform/rockchip/rkisp1/rkisp1-isp.c     | 30 ++++++++-----------
> 1 file changed, 13 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index 37623b73b1d9..d7e2802d11f5 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -58,20 +58,6 @@
>  * Helpers
>  */
>
>-static struct v4l2_subdev *rkisp1_isp_get_source(struct v4l2_subdev *sd)
>-{
>-	struct media_pad *local, *remote;
>-	struct media_entity *sensor_me;
>-
>-	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
>-	remote = media_pad_remote_pad_first(local);
>-	if (!remote)
>-		return NULL;
>-
>-	sensor_me = remote->entity;
>-	return media_entity_to_v4l2_subdev(sensor_me);
>-}
>-
> static struct v4l2_mbus_framefmt *
> rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
> 		       struct v4l2_subdev_state *sd_state,
>@@ -743,6 +729,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
> 	struct rkisp1_device *rkisp1 = isp->rkisp1;
> 	const struct rkisp1_sensor_async *asd;
>+	struct media_pad *source_pad;
>+	struct media_pad *sink_pad;
> 	int ret;
>
> 	if (!enable) {
>@@ -754,10 +742,18 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> 		return 0;
> 	}
>
>-	rkisp1->source = rkisp1_isp_get_source(sd);
>+	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
>+	source_pad = media_pad_remote_pad_unique(sink_pad);
>+	if (IS_ERR(source_pad)) {
>+		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
>+			PTR_ERR(source_pad));
>+		return -EPIPE;
>+	}
>+
>+	rkisp1->source = media_entity_to_v4l2_subdev(source_pad->entity);
> 	if (!rkisp1->source) {
>-		dev_warn(rkisp1->dev, "No link between isp and source\n");
>-		return -ENODEV;
>+		/* This should really not happen, so is not worth a message. */
>+		return -EPIPE;
> 	}
>
> 	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
>-- 
>Regards,
>
>Laurent Pinchart
>
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
