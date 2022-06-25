Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3636955A71D
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 07:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbiFYFFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jun 2022 01:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiFYFFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jun 2022 01:05:10 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5423AA5D
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 22:05:09 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id C37E83200901;
        Sat, 25 Jun 2022 01:05:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 25 Jun 2022 01:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656133507; x=1656219907; bh=Gv7D2SRG9y
        KuAB2N1Eso0pAhevzF/nzQN+ib0KFHt0c=; b=JfnyHZzSrB0XBul0fe8cVyy+/I
        sHqvvSBB9fCHB+cxovA2WBZNzotze1XbFTiDknyUKZrBJ1+ioOo5cA0l76i5qWBS
        bAUrS7/inSd7EfHYzjwZIQX+owkcCx3KIMSPpFiWnrYUWq08WFWLgNnDXp9h+fJ7
        EHpNHwNBaNz9YGFp2nsR2v08xr7CmAoLHN0E0lpByqp48cvMR1ntR5QUcgrDAWIs
        mtAhbCFLr2SMoOAwPZB0DHUwo7RotrBJdT3zztdW0mjh+Ivk7ieGOFeLBOwqPXSz
        CDvfsJBbktZC96rS5XQ3Dsprryo/fQ+mPGMpdGZY1Sj/cOnx/T3JcRV60ipQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656133507; x=1656219907; bh=Gv7D2SRG9yKuAB2N1Eso0pAhevzF
        /nzQN+ib0KFHt0c=; b=pkpeUgvt7cxlv/zKW0Xf9ziCFYMVLa98bjRvJXeVCx7e
        cYJwN0T8F19wYd8h1XZJWuHWevG+0UcymscusgYdEan7dMHrMcqC6Kjb0Dmq9mzK
        1ZJtlMKBHm1oDhkDw2/GC/kC5fQ32nmcl+RH397ujzUh+FOCocUwvLSysXjk241h
        0ZLq8JIIvLlaKavCYh+lojXRSefRdIFdyB6zdfltY2OKkcxit5xT7u82iKuZace7
        GmMGQLWFQ67IM55Y8nLzfh9pCCUXzHm02HCliFEHGgJ10SXUjVZMYQAMFD9QtUeh
        9rmknqfUjcwE7C72o3qPkbosq3xjF3qS6aHjoxlvSA==
X-ME-Sender: <xms:g5e2Yonxfxd-ZJS5xlQvt0nq7FEFxNXYcUqkXdcQ6lt8tUoW7iVspg>
    <xme:g5e2Yn0JvbSY-6qXG_zaRYTMJMO1vY5_Ap0UPLzQ_beeKAwyluaRErXy9gat53CdO
    5LQnnzVcZhisDiE3s4>
X-ME-Received: <xmr:g5e2Ymqwn-ebqjKalxxk6Z53oiH49wGXVW6w5UxPcOCgDdva-pA_Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegtddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:g5e2YknFGOoIx94vNFS7jtlENc2my9UmLJkRrlYAlAH9-smNPb01Rw>
    <xmx:g5e2Ym1aW1cj_2IGg4rUUBNypprMdhan_SEzWOCq--KK-DdHke4IJQ>
    <xmx:g5e2YrsKhqiFI4WHuYjx47obQMp0kUrbn57GAQdfBlQz5YWQPH0Mew>
    <xmx:g5e2YvnsH33AO_5esKRA6zJOodyMVKQcEaM0Ik3Qs9TJxzzYJeb7kw>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jun 2022 01:05:04 -0400 (EDT)
Date:   Sat, 25 Jun 2022 08:05:01 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 34/55] media: rkisp1: isp: Fix whitespace issues
Message-ID: <20220625050501.zpyhh6gtk7ezaee5@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-35-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-35-paul.elder@ideasonboard.com>
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
>Add missing blank lines after variable declaration blocks, and fix
>indentation issues.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by Dafna Hirschfeld <dafna@fastmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>index bf44f10200f5..86d496855374 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
>@@ -79,7 +79,8 @@ rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
> {
> 	struct v4l2_subdev_state state = {
> 		.pads = isp->pad_cfg
>-		};
>+	};
>+
> 	if (which == V4L2_SUBDEV_FORMAT_TRY)
> 		return v4l2_subdev_get_try_format(&isp->sd, sd_state, pad);
> 	else
>@@ -93,7 +94,8 @@ rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
> {
> 	struct v4l2_subdev_state state = {
> 		.pads = isp->pad_cfg
>-		};
>+	};
>+
> 	if (which == V4L2_SUBDEV_FORMAT_TRY)
> 		return v4l2_subdev_get_try_crop(&isp->sd, sd_state, pad);
> 	else
>@@ -893,8 +895,8 @@ static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
> 	struct v4l2_event event = {
> 		.type = V4L2_EVENT_FRAME_SYNC,
> 	};
>-	event.u.frame_sync.frame_sequence = isp->frame_sequence;
>
>+	event.u.frame_sync.frame_sequence = isp->frame_sequence;
> 	v4l2_event_queue(isp->sd.devnode, &event);
> }
>
>-- 
>2.30.2
>
