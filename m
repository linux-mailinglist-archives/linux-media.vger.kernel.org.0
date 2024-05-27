Return-Path: <linux-media+bounces-11916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 563CD8CFB1F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33841F2162D
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 08:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0940A3F8E2;
	Mon, 27 May 2024 08:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="I44hA0n9"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243782030B
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797821; cv=pass; b=dJYKXEKdP+xqfh8Qe3AU+x2VQMIBr2BZc1AUjXSZR+mDL5e+wFg2Twz70XRlj0pbX+HFn2BXkQGaCPg/TMW/fnXl+EIuLSeyHiwg0UNZuOyfbPyQS6pH+hDk6pm025VGbQI7RxVeKNOM78Tyxlk/oVqs9Ew91YC/D9QEimZ/hGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797821; c=relaxed/simple;
	bh=ZYqc67LXkNKG5cx18KQRwCKvcK+so9kbdSqEc7otyTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKnqw1it60oMuwguLBA51788ltkt6H2JvMRoKAQfOLof0t3MAwi/jw2qkQa1ai02AbXU7nuzuiT7suPmFz6+V4LcY69QmdkHF6QLi+nvS/ti8gcx9Dyzth1qSQcAfdssmApXfpThvnSHBxw+F+fGp9wLTPtmWgQcw0n2Q+h14sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=I44hA0n9; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VnpQc07nCz49Pyq;
	Mon, 27 May 2024 11:16:55 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716797816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/45sqEO6rx3bOnUjplv9JALMi18Z1kCzNOPyT+nWek=;
	b=I44hA0n9AKA/Mji2uTB22192uyRjs21QRd318NCccyr/K7Atlr/4nOX49MkZx2iU19xmo5
	pIZ5W+j1Sig/EM09ujYP3uqSvu0E2deXrvZDDwGjAtH3S7Gp4SuHw2BghfmF9nG2ZMEM1l
	1qsL2AKn0ss9ZI6nbYN5RZnFkwuSJEdPQPJ+1ngWMHb4WFb6IufCFDNh8sGHRpdq9lQntq
	1R4plIx4yW99jLQ5CGtbn/925Q06u3FxYueSARz38qjN2hsMHKEav4bUgwNBC2Es0G69s+
	XEbJBfZvRz1MmUhJOaCsjI9G1JMjNgbL6GivlkQ2m1S1KcuhtRIFGgqfeCU1bw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716797816; a=rsa-sha256;
	cv=none;
	b=li82scXBmHomD7hqz6Y8z3kYQFi6RCFb/v/PoVVFmxPy2u/Lfln2/i5gNdkJWUYoOsc3p1
	XNBKG05OB815tIpL3wRo/FaD/ZgAPVMrjAqF4oOYTJbfqPAfvDm0AKzCCh/AJ2tXpc14gi
	OpSfRw5pEoIyVBOMuqSNC0d2KWFpSsbFNdSfgxq/9ZZCbuwZiSIPLxwxWqEAh9brJ7/rfu
	SL1q65+R9hh4sq51sPC3ucr2Pq3DNl6Tf67PoHH4Dzeb5JFqOEI85zM781NlQp7B4Lr3e5
	6lVCFS71WdnKaxs38vXK3uhmwr8C5OiReHGUE8P3X+zgKbgiUAChYTKI6YxQUw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716797816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/45sqEO6rx3bOnUjplv9JALMi18Z1kCzNOPyT+nWek=;
	b=Ptf2JkmYI1PWTfFoV11IpFNmCOps+pD/jUAo77I+AWoW0Vv8PpBtPuWiYhjQ1CGDAig1b2
	ZIH401avkxhgBTkbOABpldzdoNa7Yb+/I3Ywvr1dWhzgGEBJkKVILmpwlCcJ8C+GNnYOnk
	FWog0K/Zh7tpVyyv4u6TBK55kZBos5KCqNC2sDcT6tt+M5qo375mjC/mVAZcJuYapM7Vww
	N6dM2X+I8wvFBTwL92rRoDqSQdxP/4dW8Gg5SDK+e9GFlCdYW/2yWcXG15Q5amVnKH/8HI
	Pd83GcNB6I9WVopgB/UbwRzUErwNNCL4IJS+A0CExKCVFPT8kX3at8xa8adLsA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BF178634C93;
	Mon, 27 May 2024 11:14:00 +0300 (EEST)
Date: Mon, 27 May 2024 08:14:00 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <ZlRAyMCduqsxYaQu@valkosipuli.retiisi.eu>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
 <lqo77pdefh6f5ynxu32s24paj2qa22rc6pih623mhywifgr4pw@kt4iic67ljfz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lqo77pdefh6f5ynxu32s24paj2qa22rc6pih623mhywifgr4pw@kt4iic67ljfz>

Hi Jacopo,

On Mon, May 27, 2024 at 09:56:00AM +0200, Jacopo Mondi wrote:
> > > +#include <linux/media/raspberrypi/pisp_be_config.h>
> >
> > Where is the header included from? If it's just this driver, then I'd put
> > it in the driver's directory.
> >
> 
> It's the uAPI header file. Or did I miss your question ?

If it's uapi, then you should have uapi in its header path. I.e.

#include <uapi/linux...>

> > > +	/* Everything else is as supplied by the user. */
> > > +	begin =	offsetof(struct pisp_be_config, global.bayer_order)
> > > +	      / sizeof(u32);
> >
> > The slash should be on the previous line. Same elsewhere.
> >
> 
> Please, this is highly subjective and other people (like Laurent) often
> ask for the contrary. Without any polemic intent, I encourage reviewers
> (myself included) in considering how much time we spend (and
> demand) on such subjective issues. Even more when other reviewers might have
> different opinions, with the end result of pulling contributors in
> different directions.

Having binary operators at the beginning of a statement split on multiple
lines is simply uncommon, perhaps around 10 % of the cases in the media
tree based on a quick look. Keeping the coding style consistent is
beneficial for us all.

...

> > > +static void pispbe_xlate_addrs(dma_addr_t addrs[N_HW_ADDRESSES],
> > > +			       u32 hw_enables[N_HW_ENABLES],
> > > +			       struct pisp_be_tiles_config *config,
> > > +			       struct pispbe_buffer *buf[PISPBE_NUM_NODES],
> > > +			       struct pispbe_node_group *node_group)
> > > +{
> > > +	int ret;
> > > +
> > > +	/* Take a copy of the "enable" bitmaps so we can modify them. */
> > > +	hw_enables[0] = config->config.global.bayer_enables;
> > > +	hw_enables[1] = config->config.global.rgb_enables;
> >
> > I wonder if hw_enables would be better declared as a struct.
> 
> struct hw_enable {
>         u32 bayer_enable;
>         u32 rgb_enable;
> };
> 
> ?

You currently  have an array of struct hw_enable here.

> 
> >
> > > +
> > > +	/*
> > > +	 * Main input first. There are 3 address pointers, corresponding to up
> > > +	 * to 3 planes.
> > > +	 */
> > > +	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
> > > +				     &node_group->node[MAIN_INPUT_NODE]);
> > > +	if (ret <= 0) {
> > > +		/*
> > > +		 * This shouldn't happen; pispbe_schedule_internal should insist
> > > +		 * on an input.
> > > +		 */
> > > +		dev_warn(node_group->pispbe->dev, "ISP-BE missing input\n");
> > > +		hw_enables[0] = 0;
> > > +		hw_enables[1] = 0;
> > > +		return;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Now TDN/Stitch inputs and outputs. These are single-plane and only
> > > +	 * used with Bayer input. Input enables must match the requirements
> > > +	 * of the processing stages, otherwise the hardware can lock up!
> > > +	 */
> > > +	if (hw_enables[0] & PISP_BE_BAYER_ENABLE_INPUT) {
> > > +		addrs[3] = pispbe_get_addr(buf[TDN_INPUT_NODE]);
> > > +		if (addrs[3] == 0 ||
> > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_TDN_INPUT) ||
> > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_TDN) ||
> > > +		    (config->config.tdn.reset & 1)) {
> > > +			hw_enables[0] &= ~(PISP_BE_BAYER_ENABLE_TDN_INPUT |
> > > +					   PISP_BE_BAYER_ENABLE_TDN_DECOMPRESS);
> > > +			if (!(config->config.tdn.reset & 1))
> > > +				hw_enables[0] &= ~PISP_BE_BAYER_ENABLE_TDN;
> > > +		}
> > > +
> > > +		addrs[4] = pispbe_get_addr(buf[STITCH_INPUT_NODE]);
> > > +		if (addrs[4] == 0 ||
> > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_STITCH_INPUT) ||
> > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_STITCH)) {
> > > +			hw_enables[0] &=
> > > +				~(PISP_BE_BAYER_ENABLE_STITCH_INPUT |
> > > +				  PISP_BE_BAYER_ENABLE_STITCH_DECOMPRESS |
> > > +				  PISP_BE_BAYER_ENABLE_STITCH);
> > > +		}
> > > +
> > > +		addrs[5] = pispbe_get_addr(buf[TDN_OUTPUT_NODE]);
> > > +		if (addrs[5] == 0)
> > > +			hw_enables[0] &= ~(PISP_BE_BAYER_ENABLE_TDN_COMPRESS |
> > > +					   PISP_BE_BAYER_ENABLE_TDN_OUTPUT);
> > > +
> > > +		addrs[6] = pispbe_get_addr(buf[STITCH_OUTPUT_NODE]);
> > > +		if (addrs[6] == 0)
> > > +			hw_enables[0] &=
> > > +				~(PISP_BE_BAYER_ENABLE_STITCH_COMPRESS |
> > > +				  PISP_BE_BAYER_ENABLE_STITCH_OUTPUT);
> > > +	} else {
> > > +		/* No Bayer input? Disable entire Bayer pipe (else lockup) */
> > > +		hw_enables[0] = 0;
> > > +	}
> > > +
> > > +	/* Main image output channels. */
> > > +	for (unsigned int i = 0; i < PISP_BACK_END_NUM_OUTPUTS; i++) {
> > > +		ret = pispbe_get_planes_addr(addrs + 7 + 3 * i,
> > > +					     buf[OUTPUT0_NODE + i],
> > > +					     &node_group->node[OUTPUT0_NODE + i]);
> > > +		if (ret <= 0)
> > > +			hw_enables[1] &= ~(PISP_BE_RGB_ENABLE_OUTPUT0 << i);
> > > +	}
> > > +}

...

> > > +static void pispbe_node_def_fmt(struct pispbe_node *node)
> > > +{
> > > +	if (NODE_IS_META(node) && NODE_IS_OUTPUT(node)) {
> > > +		/* Config node */
> > > +		struct v4l2_format *f = &node->format;
> > > +
> > > +		f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
> > > +		f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
> > > +		f->type = node->buf_type;
> > > +	} else {
> > > +		struct v4l2_format f = {0};
> > > +
> > > +		f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420;
> > > +		f.fmt.pix_mp.width = 1920;
> > > +		f.fmt.pix_mp.height = 1080;
> > > +		f.type = node->buf_type;
> >
> > You can assign these in the declaration. The same above.
> 
> Here indeed I can. Above I don't think I can (if you mean in the if()
> branch)

Ack.

...

> > > +	/* Hardware initialisation */
> > > +	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > > +	pm_runtime_use_autosuspend(pispbe->dev);
> > > +	pm_runtime_enable(pispbe->dev);
> > > +
> > > +	ret = pm_runtime_resume_and_get(pispbe->dev);
> >
> > You'll need to call the driver's resume function manually instead. The
> > above depends on CONFIG_PM.
> >
> 
> The driver selects CONFIG_PM, doesn't it ?

It depends on PM.

It'd be trivial to remove that dependency.

-- 
Regards,

Sakari Ailus

