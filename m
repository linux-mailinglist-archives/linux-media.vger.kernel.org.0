Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB93F562525
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 23:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237537AbiF3V2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 17:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237566AbiF3V2c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 17:28:32 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FC051B22
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 14:28:30 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 822E7320097E;
        Thu, 30 Jun 2022 17:28:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 30 Jun 2022 17:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1656624507; x=1656710907; bh=SvDtKtA2GP
        KnP8e8Fmt8OeR6i9OomadEsaRdyUvHBdo=; b=RnU10PctHL4jsCVaOaC6TRi8JT
        v/J04PeP5VNBtgu4sprSzcO9ux7i3MUNARGprTA7g9SWNn/GoStvUoDfiI17gsPj
        xy733Ry+E4Bmie36oUd71ecV9ABCOqjzMcrJf30Z7He3pkaUa1naaGuPWpKY5yDV
        ysa8KjK4And1dYPllTynAoVxhDTkz1Dp/6c47qpZfBAX73ZAXtugA43GucTlgNb2
        aZH4UUB/gGJLWz5671EqofVWDBq48qaGZul0F7vcImcoa1ir3qVm/HC2nwjgNzfm
        ZHUGbWHH3QTtQ3pwfvcVO/X0xOByImrjLv/UOJ9DZ5/+S52/e+UnBwcGuo5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656624507; x=1656710907; bh=SvDtKtA2GPKnP8e8Fmt8OeR6i9Oo
        madEsaRdyUvHBdo=; b=jxW8woV+yj+q3uUQLsuH+ucZTX8jY4qB7kRQy57GY3hv
        9hcPLGJN3Ol3qitsDfB7SIAURNl4YEgZny8B1ONab26u7SwkA1C5mdtvkOoBRHQ0
        cj58mzeGSnoXM5IEr2ssabqWBzdyOhGfx+YQg+4NfNhr5TjT3N4mKG+ezhGSoDe3
        Vfp1TJuRNCAOYE6EbpbX7WO0/dyeHKWu2vobbDrMSCbEAnt83dUshA7qao512lfG
        4+Pjxaed3XON5mADBxjdf3O8IagE2bVS+OMBWPhiz3k3fyIhYDYN4tPG6Qs6YekB
        L5gwN4KgXQ1sqL8GTwLjQ7JwWkUSXpG7xfYYKy/Nhg==
X-ME-Sender: <xms:ehW-YsNHux3W9G9vJL7bulwUXx7STfkkw8hI2XjxeJbVY-NX5hbnRQ>
    <xme:ehW-Yi_c8HTdC7kEfCObAms2IGwjRzVLvjHn8C9hkAPQ4OamBnhNmLT8Da988s6l-
    _uWOQcKAY2Qp5WBYiM>
X-ME-Received: <xmr:ehW-YjRSFOUuD6755V1InKGce6I78yUBfJBfs1EXgug7dNWOLQuRcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepheeivdejhedvffelkeffvdejvdeiheehtdethfdvtdeufeeu
    keelhfetuddugfejnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrfhhnrgesfhgr
    shhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:ehW-YkskVfBdpv3Q7Ohmp1Pw_0fnc8c8Fl6uOSlWvGEnSW_SLKrrqg>
    <xmx:ehW-YkeaQ44WgRgN92i7hX7j8ZTGpvYtd3qoCXs__O5aIe4waycLMw>
    <xmx:ehW-Yo0Wv5s5MWlOryvmmgnoNirW1XM93ow4LwdR6DWpCB_PSX-E0w>
    <xmx:exW-YivQleoUsUCkPhF76rm5U8dW1uQPCCxawRQDrnD-O0oca2ctvA>
Feedback-ID: i0e894699:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 17:28:23 -0400 (EDT)
Date:   Fri, 1 Jul 2022 00:28:20 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 07/55] media: rkisp1: Save info pointer in rkisp1_device
Message-ID: <20220630212820.3bsiaxkxtl46se3z@guri>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-8-paul.elder@ideasonboard.com>
 <20220624143400.ars53iairqqbdmq2@guri>
 <YrXOdaswfJZoxK3S@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <YrXOdaswfJZoxK3S@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.06.2022 17:47, Laurent Pinchart wrote:
>Hi Dafna,
>
>On Fri, Jun 24, 2022 at 05:34:00PM +0300, Dafna Hirschfeld wrote:
>> On 15.06.2022 04:10, Paul Elder wrote:
>> > To make it possible to use the rkisp1_info after probe time (for
>> > instance to make code conditional on the ISP version), save it in the
>> > main rkisp1_device structure. To achieve this, also move the info
>> > structure into the common header, and document it.
>> >
>> > While at it, drop a NULL check in rkisp1_probe() for the match data as
>> > it can't happen.
>> >
>> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > ---
>> >  .../platform/rockchip/rkisp1/rkisp1-common.h  | 22 +++++++++++++++++++
>> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 +++----------
>> >  2 files changed, 25 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> > index a67fe7b1dfa1..50d31a254b03 100644
>> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
>> > @@ -91,6 +91,26 @@ enum rkisp1_isp_pad {
>> >  	RKISP1_ISP_PAD_MAX
>> >  };
>> >
>> > +/*
>> > + * struct rkisp1_info - Model-specific ISP Information
>> > + *
>> > + * @clks: array of ISP clock names
>> > + * @clk_size: number of entries in the @clks array
>> > + * @isrs: array of ISP interrupt descriptors
>> > + * @isr_size: number of entires in the @isrs array
>> > + * @isp_ver: ISP version
>> > + *
>> > + * This structure contains information about the ISP specific to a particular
>> > + * ISP model, version, or integration in a particular SoC.
>> > + */
>> > +struct rkisp1_info {
>> > +	const char * const *clks;
>> > +	unsigned int clk_size;
>> > +	const struct rkisp1_isr_data *isrs;
>> > +	unsigned int isr_size;
>> > +	enum rkisp1_cif_isp_version isp_ver;
>> > +};
>> > +
>> >  /*
>> >   * struct rkisp1_sensor_async - A container for the v4l2_async_subdev to add to the notifier
>> >   *				of the v4l2-async API
>> > @@ -395,6 +415,7 @@ struct rkisp1_debug {
>> >   * @pipe:	   media pipeline
>> >   * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
>> >   * @debug:	   debug params to be exposed on debugfs
>> > + * @info:	   version-specific ISP information
>> >   */
>> >  struct rkisp1_device {
>> >  	void __iomem *base_addr;
>> > @@ -413,6 +434,7 @@ struct rkisp1_device {
>> >  	struct media_pipeline pipe;
>> >  	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
>> >  	struct rkisp1_debug debug;
>> > +	const struct rkisp1_info *info;
>> >  };
>> >
>> >  /*
>> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> > index 258980ef4783..39ae35074062 100644
>> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> > @@ -105,14 +105,6 @@ struct rkisp1_isr_data {
>> >  	irqreturn_t (*isr)(int irq, void *ctx);
>> >  };
>> >
>> > -struct rkisp1_info {
>> > -	const char * const *clks;
>> > -	unsigned int clk_size;
>> > -	const struct rkisp1_isr_data *isrs;
>> > -	unsigned int isr_size;
>> > -	enum rkisp1_cif_isp_version isp_ver;
>> > -};
>> > -
>> >  /* ----------------------------------------------------------------------------
>> >   * Sensor DT bindings
>> >   */
>> > @@ -469,14 +461,13 @@ static int rkisp1_probe(struct platform_device *pdev)
>> >  	int ret, irq;
>> >  	u32 cif_id;
>> >
>> > -	info = of_device_get_match_data(&pdev->dev);
>> > -	if (!info)
>> > -		return -ENODEV;
>> > -
>> >  	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
>> >  	if (!rkisp1)
>> >  		return -ENOMEM;
>> >
>> > +	info = of_device_get_match_data(dev);
>>
>> Why did you omit the check 'if(!info)'?
>
>Because it can't happen. The probe() function is only called if the
>platform device matches one of the of_device_id, so
>of_device_get_match_data() can't return NULL.
>

I see now it is also written in the commit log,

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

>> > +	rkisp1->info = info;
>> > +
>> >  	dev_set_drvdata(dev, rkisp1);
>> >  	rkisp1->dev = dev;
>> >
>
>-- 
>Regards,
>
>Laurent Pinchart
>
>_______________________________________________
>Linux-rockchip mailing list
>Linux-rockchip@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-rockchip
