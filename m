Return-Path: <linux-media+bounces-15725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76760945FD2
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 17:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247E01F22F0E
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 15:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3439221C173;
	Fri,  2 Aug 2024 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a4cFCM5i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD1B1E4EF6;
	Fri,  2 Aug 2024 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722611035; cv=none; b=vBVU9kITrneJfiQaBwmS0lUETkm60x0Xz5MPRq/+Hn+Y/mWvVvGWqppA6M/Fl0okjToQAki7QkXzl1cUOBRISH/NUQ8ZVHRgJrt9v3NEv/UZLtp8hXgmNTzqd6CMLYPul1qQqZ6F125LiktOY+Mmv20UQpIC6M4S1/+Q0KjY/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722611035; c=relaxed/simple;
	bh=5UW2D6G1YHlqnydIqWB/qGN+QOKArVV/7iU0Il/7Lhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlEorF4cYpCzXXu4FrdjHmhaOuDnjWBe59XyI543nBn36SH4a/tILVXYOzPqwsB2zqfrSw5351ZcPy/hcFBAZctnF7q8SG1Oy1wMkX6nb+zgfAqqAt8+DK7qZMG6tMmmEsn7yp7si+i8TsIGcSJMWJGEoUu3z2bQTCDAHkaS7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a4cFCM5i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B0808A9;
	Fri,  2 Aug 2024 17:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722610982;
	bh=5UW2D6G1YHlqnydIqWB/qGN+QOKArVV/7iU0Il/7Lhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4cFCM5irxkC0Zjk4Y+z3sVwOpGtlHesTyyHPdipqE1/OYIMTU09pc24SAo+J30MB
	 iYkV0U34mp3hRNP+dO7aiR2Zb2TNE0Xcf2Lo2ei/h0L2eeLt5zfn+kwN1rgWltkrSZ
	 H6iVv3cMGY+rpzBQMXVSfD33h96lSkMJO3VsGUNY=
Date: Fri, 2 Aug 2024 18:03:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v6 17/18] media: platform: Add mali-c55 parameters video
 node
Message-ID: <20240802150330.GA32405@pendragon.ideasonboard.com>
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
 <20240709132906.3198927-18-dan.scally@ideasonboard.com>
 <20240730221616.GG8146@pendragon.ideasonboard.com>
 <f74638c0-225d-43a9-a412-66cfd0892a00@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f74638c0-225d-43a9-a412-66cfd0892a00@ideasonboard.com>

Hi Dan,

On Wed, Jul 31, 2024 at 04:12:41PM +0100, Daniel Scally wrote:
> On 30/07/2024 23:16, Laurent Pinchart wrote:
> > On Tue, Jul 09, 2024 at 02:29:05PM +0100, Daniel Scally wrote:
> >> Add a new code file to the mali-c55 driver that registers an output
> >> video node for userspace to queue buffers of parameters to. Handlers
> >> are included to program the statistics generation plus the white
> >> balance, black level correction and mesh shading correction blocks.
> >>
> >> Update the rest of the driver to register and link the new video node
> >>
> >> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> >> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >> Changes in v6:
> >>
> >> 	- Used a union to generalise the block pointer rather than resorting to
> >> 	  casting everywhere - fantastic idea Sakari, this made it much cleaner.
> >> 	- Reworked the loop in mali_c55_params_write_config() so that we can be
> >> 	  sure there's remaining space for the next block header.
> >>
> >> Changes in v5:
> >>
> >> 	- New patch
> >>
> >>   drivers/media/platform/arm/mali-c55/Makefile  |   1 +
> >>   .../platform/arm/mali-c55/mali-c55-common.h   |  20 +
> >>   .../platform/arm/mali-c55/mali-c55-core.c     |  23 +
> >>   .../platform/arm/mali-c55/mali-c55-isp.c      |  21 +-
> >>   .../platform/arm/mali-c55/mali-c55-params.c   | 671 ++++++++++++++++++
> >>   .../arm/mali-c55/mali-c55-registers.h         | 128 ++++
> >>   6 files changed, 863 insertions(+), 1 deletion(-)
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-params.c

[snip]

> >> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> >> index ed0db34767a4..55b3cbf53791 100644
> >> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> >> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> >> @@ -384,6 +384,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
> >>   		goto err_remove_links;
> >>   	}
> >>   
> >> +	ret = media_create_pad_link(&mali_c55->params.vdev.entity, 0,
> >> +				    &mali_c55->isp.sd.entity,
> >> +				    MALI_C55_ISP_PAD_SINK_PARAMS,
> >> +				    MEDIA_LNK_FL_ENABLED);
> > Should this be immutable, or do you think it makes sense to support
> > operating the ISP without parameters ? I know we did so when developing
> > the driver to test the initial code, but are there real use cases now ?
> 
> If all you're interested in is RAW data bypassed through the ISP then
> you could skip the parameters and statistics - which would be the case
> for RGB/YUV cameras feeding the ISP too. Is that sufficient use-case
> to leave them mutable?

I suppose that's a good point, yes. Fine with me.

> >> +	if (ret) {
> >> +		dev_err(mali_c55->dev,
> >> +			"failed to link ISP and parameters video node\n");
> >> +		goto err_remove_links;
> >> +	}
> >> +
> >>   	return 0;
> >>   
> >>   err_remove_links:

[snip]

-- 
Regards,

Laurent Pinchart

