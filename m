Return-Path: <linux-media+bounces-15434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41E93F131
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EAF61F22394
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243E513C814;
	Mon, 29 Jul 2024 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wTjnsjyc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B6B667;
	Mon, 29 Jul 2024 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722245602; cv=none; b=cWsBH6xwGMscTwQiXCIJcvH58Hd5cyhoptUN/YvkAJlwCti/fa9dLZs990N7QGQpjuIXl8cnCFy+IPVDSfFWPFz4BKHLleZtDwAISINc9d+gyMUHVwJ70rYYOXyNT52mVuByPHL6gP/vRd3E4XKzOwbUUKFIAIiopavavoEPW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722245602; c=relaxed/simple;
	bh=eLtXGh0GNrE0GjB2gfA9Puv6Yku+pwVZoF3jaTnn9iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skoUk3eLrVep1aacfzZvpHerYB6V3ieZ8we7o7heGEXyZn2J5G1zvCGgLR3bRvKPhjylZdmVXNmXHDTNeGIca97k006ZXAljjTKXVRKSgfuiJHpDE7KH0uYjaJA5KEtIwdlcoZD+B476YbJcUZvQaMP0We7La55Opt5jP+XRhAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wTjnsjyc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD8E545A;
	Mon, 29 Jul 2024 11:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722245553;
	bh=eLtXGh0GNrE0GjB2gfA9Puv6Yku+pwVZoF3jaTnn9iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wTjnsjyc1kECtkioC5DBaOj0ifg26xDHoKtE1O3FBON6vtPaPLT2BDXU3U0L1hicR
	 G/Mk2+6AxMMwY2YKxSR459dM36yHjCC88IansIf4z9ZYzAc1hOwbxHJ/ymI3vR3BFL
	 PfAW13rL+iQVdbiM/BV+8XtV22JxloMKqHLtx+rI=
Date: Mon, 29 Jul 2024 12:32:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx-mipi-csis: avoid logging while holding
 spinlock
Message-ID: <20240729093259.GB2320@pendragon.ideasonboard.com>
References: <20240723060909.534584-1-matthias.fend@emfend.at>
 <20240726104255.GH14252@pendragon.ideasonboard.com>
 <3e38bf09-734d-4cbf-a0a5-b01cd1998037@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e38bf09-734d-4cbf-a0a5-b01cd1998037@emfend.at>

On Fri, Jul 26, 2024 at 02:16:07PM +0200, Matthias Fend wrote:
> Hi Laurent,
> 
> Am 26.07.2024 um 12:42 schrieb Laurent Pinchart:
> > Hi Matthias,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jul 23, 2024 at 08:09:08AM +0200, Matthias Fend wrote:
> >> Refactor mipi_csis_log_counters() to prevent calling dev_info() while
> >> IRQs are disabled. This reduces crucial IRQs off time to a bare minimum.
> > 
> > Should we add
> > 
> > Cc: stable@vger.kernel.org
> > 
> > to get this backported to stable kernels ?
> 
> Hard for me to tell. Since this problem only occurs when you explicitly 
> trigger the debug output from this driver, it probably only affects very 
> few end users. So I'm not sure if a backport would be worth it.

I slept over it and decided not to Cc stable.

> >> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> >> ---
> >>   drivers/media/platform/nxp/imx-mipi-csis.c | 9 ++++++---
> >>   1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> >> index f49b06978f14..0c34d316ed29 100644
> >> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> >> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> >> @@ -857,18 +857,21 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
> >>   {
> >>   	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
> >>   				: MIPI_CSIS_NUM_EVENTS - 8;
> >> +	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
> >>   	unsigned long flags;
> >>   	unsigned int i;
> >>   
> >>   	spin_lock_irqsave(&csis->slock, flags);
> >> +	for (i = 0; i < num_events; ++i)
> >> +		counters[i] =  csis->events[i].counter;
> >> +	spin_unlock_irqrestore(&csis->slock, flags);
> >>   
> >>   	for (i = 0; i < num_events; ++i) {
> >> -		if (csis->events[i].counter > 0 || csis->debug.enable)
> >> +		if (counters[i] > 0 || csis->debug.enable)
> >>   			dev_info(csis->dev, "%s events: %d\n",
> >>   				 csis->events[i].name,
> >> -				 csis->events[i].counter);
> >> +				 counters[i]);
> > 
> > The last two lines now fit in a single line. No need for a v2, I'll
> > rewrap the code myself, and add the Cc line if you think that's a good
> > idea.
> 
> Thanks! Regarding Cc, I would like to leave it up to you; you have the 
> necessary experience and overview to judge that.
> 
> ~Matthias
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> >>   	}
> >> -	spin_unlock_irqrestore(&csis->slock, flags);
> >>   }
> >>   
> >>   static int mipi_csis_dump_regs(struct mipi_csis_device *csis)

-- 
Regards,

Laurent Pinchart

