Return-Path: <linux-media+bounces-11920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA98CFB7C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47B11281D15
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 08:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7D85427E;
	Mon, 27 May 2024 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vzemOWoa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF54DD268
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798708; cv=none; b=jPpXvpi+gIdG5Anl4D0mFnHEQyr1LiN+/4wRPHVcCObOTtkv/oj5ifG3Kcvg+Ty48SjPCjDNQrEo5HjcOT+mhJIz1v8MQA2aHsfK7fXALx+1iCeVIZMEN8/KuHfhcDIbDEIk3CKjJXqB8vjmLDj+fQhuxvIMZlIak4nP9cZGY0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798708; c=relaxed/simple;
	bh=6nDxI9qjQXyyzphbep8BKmO5K3lVXjdIiNiJMwUz6+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNT1A38ShKqtHx1n2PRjrC7DF6FKnXw+P3mXZoZEr+TPzIB2mJui4YER+7WabSn9Ld0WcabhAhm3ZryziLFsD3pxcVD1jAyx/+k2HYWfDbnLg3wYNnQRJKkFEJBboVhZw+Pujwfv0UrWbIocDhJKRNYHUXqrgvCgkB6Lzpcnw6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vzemOWoa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CDF2908;
	Mon, 27 May 2024 10:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716798702;
	bh=6nDxI9qjQXyyzphbep8BKmO5K3lVXjdIiNiJMwUz6+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vzemOWoaaA6a7ebf34hsgDSRzI8XYYEl1xLVot/iyrcTNl8KCQFiMBsyghAtaKLlm
	 1oK8MK8Md3zglf/xYXSBknNXcdjP/3UBMlHXj/BZF//daJIPlCMkIJR2TR0x232+VZ
	 l9Dzpj9C5ubJVaFy9/BA+eyMuoKVpd/JQAo+YudI=
Date: Mon, 27 May 2024 11:31:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v7 7/8] media: raspberrypi: Add support for PiSP BE
Message-ID: <20240527083133.GB2986@pendragon.ideasonboard.com>
References: <20240524140024.161313-1-jacopo.mondi@ideasonboard.com>
 <20240524140024.161313-8-jacopo.mondi@ideasonboard.com>
 <ZlOimSRFNNt1fdN3@valkosipuli.retiisi.eu>
 <lqo77pdefh6f5ynxu32s24paj2qa22rc6pih623mhywifgr4pw@kt4iic67ljfz>
 <ZlRAyMCduqsxYaQu@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZlRAyMCduqsxYaQu@valkosipuli.retiisi.eu>

On Mon, May 27, 2024 at 08:14:00AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
> 
> On Mon, May 27, 2024 at 09:56:00AM +0200, Jacopo Mondi wrote:
> > > > +#include <linux/media/raspberrypi/pisp_be_config.h>
> > >
> > > Where is the header included from? If it's just this driver, then I'd put
> > > it in the driver's directory.
> > 
> > It's the uAPI header file. Or did I miss your question ?
> 
> If it's uapi, then you should have uapi in its header path. I.e.
> 
> #include <uapi/linux...>
> 
> > > > +	/* Everything else is as supplied by the user. */
> > > > +	begin =	offsetof(struct pisp_be_config, global.bayer_order)
> > > > +	      / sizeof(u32);
> > >
> > > The slash should be on the previous line. Same elsewhere.
> > >
> > 
> > Please, this is highly subjective and other people (like Laurent) often
> > ask for the contrary. Without any polemic intent, I encourage reviewers
> > (myself included) in considering how much time we spend (and
> > demand) on such subjective issues. Even more when other reviewers might have
> > different opinions, with the end result of pulling contributors in
> > different directions.
> 
> Having binary operators at the beginning of a statement split on multiple
> lines is simply uncommon, perhaps around 10 % of the cases in the media
> tree based on a quick look. Keeping the coding style consistent is
> beneficial for us all.

I've been slowly but steadily working on increasing that number :-) I
think the style above is the most readable, and I would leave it to
driver authors (as long as they're consistent within a driver).

> 
> ...
> 
> > > > +static void pispbe_xlate_addrs(dma_addr_t addrs[N_HW_ADDRESSES],
> > > > +			       u32 hw_enables[N_HW_ENABLES],
> > > > +			       struct pisp_be_tiles_config *config,
> > > > +			       struct pispbe_buffer *buf[PISPBE_NUM_NODES],
> > > > +			       struct pispbe_node_group *node_group)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	/* Take a copy of the "enable" bitmaps so we can modify them. */
> > > > +	hw_enables[0] = config->config.global.bayer_enables;
> > > > +	hw_enables[1] = config->config.global.rgb_enables;
> > >
> > > I wonder if hw_enables would be better declared as a struct.
> > 
> > struct hw_enable {
> >         u32 bayer_enable;
> >         u32 rgb_enable;
> > };
> > 
> > ?
> 
> You currently  have an array of struct hw_enable here.
> 
> > > > +
> > > > +	/*
> > > > +	 * Main input first. There are 3 address pointers, corresponding to up
> > > > +	 * to 3 planes.
> > > > +	 */
> > > > +	ret = pispbe_get_planes_addr(addrs, buf[MAIN_INPUT_NODE],
> > > > +				     &node_group->node[MAIN_INPUT_NODE]);
> > > > +	if (ret <= 0) {
> > > > +		/*
> > > > +		 * This shouldn't happen; pispbe_schedule_internal should insist
> > > > +		 * on an input.
> > > > +		 */
> > > > +		dev_warn(node_group->pispbe->dev, "ISP-BE missing input\n");
> > > > +		hw_enables[0] = 0;
> > > > +		hw_enables[1] = 0;
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Now TDN/Stitch inputs and outputs. These are single-plane and only
> > > > +	 * used with Bayer input. Input enables must match the requirements
> > > > +	 * of the processing stages, otherwise the hardware can lock up!
> > > > +	 */
> > > > +	if (hw_enables[0] & PISP_BE_BAYER_ENABLE_INPUT) {
> > > > +		addrs[3] = pispbe_get_addr(buf[TDN_INPUT_NODE]);
> > > > +		if (addrs[3] == 0 ||
> > > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_TDN_INPUT) ||
> > > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_TDN) ||
> > > > +		    (config->config.tdn.reset & 1)) {
> > > > +			hw_enables[0] &= ~(PISP_BE_BAYER_ENABLE_TDN_INPUT |
> > > > +					   PISP_BE_BAYER_ENABLE_TDN_DECOMPRESS);
> > > > +			if (!(config->config.tdn.reset & 1))
> > > > +				hw_enables[0] &= ~PISP_BE_BAYER_ENABLE_TDN;
> > > > +		}
> > > > +
> > > > +		addrs[4] = pispbe_get_addr(buf[STITCH_INPUT_NODE]);
> > > > +		if (addrs[4] == 0 ||
> > > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_STITCH_INPUT) ||
> > > > +		    !(hw_enables[0] & PISP_BE_BAYER_ENABLE_STITCH)) {
> > > > +			hw_enables[0] &=
> > > > +				~(PISP_BE_BAYER_ENABLE_STITCH_INPUT |
> > > > +				  PISP_BE_BAYER_ENABLE_STITCH_DECOMPRESS |
> > > > +				  PISP_BE_BAYER_ENABLE_STITCH);
> > > > +		}
> > > > +
> > > > +		addrs[5] = pispbe_get_addr(buf[TDN_OUTPUT_NODE]);
> > > > +		if (addrs[5] == 0)
> > > > +			hw_enables[0] &= ~(PISP_BE_BAYER_ENABLE_TDN_COMPRESS |
> > > > +					   PISP_BE_BAYER_ENABLE_TDN_OUTPUT);
> > > > +
> > > > +		addrs[6] = pispbe_get_addr(buf[STITCH_OUTPUT_NODE]);
> > > > +		if (addrs[6] == 0)
> > > > +			hw_enables[0] &=
> > > > +				~(PISP_BE_BAYER_ENABLE_STITCH_COMPRESS |
> > > > +				  PISP_BE_BAYER_ENABLE_STITCH_OUTPUT);
> > > > +	} else {
> > > > +		/* No Bayer input? Disable entire Bayer pipe (else lockup) */
> > > > +		hw_enables[0] = 0;
> > > > +	}
> > > > +
> > > > +	/* Main image output channels. */
> > > > +	for (unsigned int i = 0; i < PISP_BACK_END_NUM_OUTPUTS; i++) {
> > > > +		ret = pispbe_get_planes_addr(addrs + 7 + 3 * i,
> > > > +					     buf[OUTPUT0_NODE + i],
> > > > +					     &node_group->node[OUTPUT0_NODE + i]);
> > > > +		if (ret <= 0)
> > > > +			hw_enables[1] &= ~(PISP_BE_RGB_ENABLE_OUTPUT0 << i);
> > > > +	}
> > > > +}
> 
> ...
> 
> > > > +static void pispbe_node_def_fmt(struct pispbe_node *node)
> > > > +{
> > > > +	if (NODE_IS_META(node) && NODE_IS_OUTPUT(node)) {
> > > > +		/* Config node */
> > > > +		struct v4l2_format *f = &node->format;
> > > > +
> > > > +		f->fmt.meta.dataformat = V4L2_META_FMT_RPI_BE_CFG;
> > > > +		f->fmt.meta.buffersize = sizeof(struct pisp_be_tiles_config);
> > > > +		f->type = node->buf_type;
> > > > +	} else {
> > > > +		struct v4l2_format f = {0};
> > > > +
> > > > +		f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_YUV420;
> > > > +		f.fmt.pix_mp.width = 1920;
> > > > +		f.fmt.pix_mp.height = 1080;
> > > > +		f.type = node->buf_type;
> > >
> > > You can assign these in the declaration. The same above.
> > 
> > Here indeed I can. Above I don't think I can (if you mean in the if()
> > branch)
> 
> Ack.
> 
> ...
> 
> > > > +	/* Hardware initialisation */
> > > > +	pm_runtime_set_autosuspend_delay(pispbe->dev, 200);
> > > > +	pm_runtime_use_autosuspend(pispbe->dev);
> > > > +	pm_runtime_enable(pispbe->dev);
> > > > +
> > > > +	ret = pm_runtime_resume_and_get(pispbe->dev);
> > >
> > > You'll need to call the driver's resume function manually instead. The
> > > above depends on CONFIG_PM.
> > 
> > The driver selects CONFIG_PM, doesn't it ?
> 
> It depends on PM.
> 
> It'd be trivial to remove that dependency.

For drivers such as sensor drivers that need to work on a wide variety
of platforms, with varying configurations, I agree that not depending on
CONFIG_PM is a good thing (I reserve the right to change my mind though
:-)). For this driver, I don't think the dependency is an issue.

-- 
Regards,

Laurent Pinchart

