Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B18E559CED
	for <lists+linux-media@lfdr.de>; Fri, 24 Jun 2022 17:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbiFXPBn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 11:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232511AbiFXPBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 11:01:31 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFEC56C1C
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 08:00:20 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 700CF32007CF;
        Fri, 24 Jun 2022 11:00:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 24 Jun 2022 11:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656082818; x=1656169218; bh=ok59EyrdOe
        6NOklkpZq9hJkZk5ts4QHMi8DcFvp/gDI=; b=RetDgWfVZI93d8kT18a04Q0Pp/
        YFLgbbze58S8CTgZ6Yd+R1r9KTjvvTm8OXA2uCQ/bi4ULoV/Il2yv4YzpNckpgda
        dDRBeqoz2rskzTxME0pz1G+JD7PW2EyjK4S+FnXxnbPdV+eFipSILuhKjcWsh6iz
        +YH3djBE6ejCVb/2ooe4x0E1t93dQ9nrhAWh30EaHgW2tp+6VOG2cgKmtvY1EN/s
        i5EINLNV3+daNnMuEAPMrvXGViCga6w6kpYSOr9l2YrhPZKKwoYZGu+WgF15HtT6
        rbK34P2ruYzWHZBNIlTIG22f8XHrSA/8tBIQD6/xBk6GEyPa74b0h+M+xLew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656082818; x=1656169218; bh=ok59EyrdOe6NOklkpZq9hJkZk5ts
        4QHMi8DcFvp/gDI=; b=QKaepsAw5g2AuaKgqv1c3sbVx9YFY2DD/kzHbZ/0KPur
        /TXYWUuYfjKiuBd5P47nAOe4axLmsidyzvxMX4i8vNAatvBu09vaIqQB49pRMOpK
        yzWJlTA/VJzR0VB9d8qdxRJCrcT+rnJm/zd2LTFVTQhpbBmFGtKIXwFxT+7RchPb
        FUIpv62hHqBNySgca1cIhjpZJkpRPFcCCoaeyTLZ0584sv3xQuhaOMAhn+C/SAv3
        FAk39mXE1wCW2e1iiw5AbAIHsy7CR9E+r0lXEACoYmRxQ2y5YwCm+snHe3SYaQRp
        GE6sdsMpBQJsGdPUtU26aOyzEketLn2JwfiF9R+Cww==
X-ME-Sender: <xms:gtG1YivFlT1YvrLS4ISfrSBq7K6n2pyu2ZkW_FMsgLbeHKMFtqadlw>
    <xme:gtG1Ynexgx1eVrdw0MqBG4R50oQBFbZ31-F-Ks3SQDF45HceA9FKgWpEdrvCg4lM4
    ERKuWmegasI3lEag5w>
X-ME-Received: <xmr:gtG1YtzRl6UGnV7lKt718pRlVOP8ElG6obmDgEstBIz_w_lONsHU9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvhedtledukeegveelfeeuvddujeeiteehkedvhfetkeffudej
    hfeftdduhedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:gtG1YtNu42uXIzGaWa55x9oCOq8gdYU8K0Nd9RzEbVOGqjG5JaIHFw>
    <xmx:gtG1Yi-GL6Y936Bx2c73Y2YK9JSfl9HruSlTL4oYFeh69RQMkcsjww>
    <xmx:gtG1YlX4BGu4x6f8EyPQJGpgVSYiOjPSVnfjsRjfdPAydWlyCvoA9A>
    <xmx:gtG1YnOHKIKptb22sJAR4DY3y7yxjcNbz4mI3v5PPej8h4YnCwDamQ>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 11:00:15 -0400 (EDT)
Date:   Fri, 24 Jun 2022 18:00:12 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        heiko@sntech.de, jeanmichel.hautbois@ideasonboard.com,
        jacopo@jmondi.org, djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 10/55] media: rkisp1: cap: Print debug message on failed
 link validation
Message-ID: <20220624150012.atzih4monjb3sjwf@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-11-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-11-paul.elder@ideasonboard.com>
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
>When a link validation failure occurs, print a debug message to help
>diagnosing the cause.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>---
> .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>index 94819e6c23e2..94a0d787a312 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>@@ -1294,8 +1294,16 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>
> 	if (sd_fmt.format.height != cap->pix.fmt.height ||
> 	    sd_fmt.format.width != cap->pix.fmt.width ||
>-	    sd_fmt.format.code != fmt->mbus)
>+	    sd_fmt.format.code != fmt->mbus) {
>+		dev_dbg(cap->rkisp1->dev,
>+			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u",

missing '\n'

thanks,
Dafna

>+			link->source->entity->name, link->source->index,
>+			link->sink->entity->name, link->sink->index,
>+			sd_fmt.format.code, sd_fmt.format.width,
>+			sd_fmt.format.height, fmt->mbus, cap->pix.fmt.width,
>+			cap->pix.fmt.height);
> 		return -EPIPE;
>+	}
>
> 	return 0;
> }
>-- 
>2.30.2
>
