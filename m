Return-Path: <linux-media+bounces-26781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC27A418F3
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D366616D667
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B1B24A042;
	Mon, 24 Feb 2025 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aKCFL4+l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A98245004;
	Mon, 24 Feb 2025 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740388922; cv=none; b=nBMfHVOphBZEMCthlrhm9Tgq9iY0jB+iWpk+xqP6LBiWgDowIknnXrB0evPppDTGC3VhyC3gILrcCE+yboPJhchnsrduylvymChEIq6TPp8eibOWoUp0egsi8YAgbRJcujYtPkN9ktQRq0PwxvmqCpTXpJzECss6p/d6fAgO8qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740388922; c=relaxed/simple;
	bh=6s6mE6iWL2zLpUlwDFdCQx4XhtHfEW/hJy2iFvXQnHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXed0Mt6BEYWMyF50ppWcuqPIph2L3BmBbTfRUR+P+b0FVC+wHdM7mTSYy71HKcLf9lvQWvoR14LFkW4H0Tikp2MCUOrxBC54XmDPkry9sf4inJ5j7QGcP/GpMFXSSUWPT/ejISsK1vvdMIpFVclPA4ykwCvQCHFvU2wHmvofmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aKCFL4+l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F42F55A;
	Mon, 24 Feb 2025 10:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740388832;
	bh=6s6mE6iWL2zLpUlwDFdCQx4XhtHfEW/hJy2iFvXQnHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKCFL4+lUe+cwxys5YXBpNb6v6150ygxINtgje7a9KI1N2NgUWCmK2b+uqeP1ih+A
	 BHtTxQ9tpd/5GI+SVum39bcOPKx4l/+FJN8vtRMQ204Ych1Xe1U8mnT0PEVe42k9yr
	 Y7T8GDFdHJ6I8+/ngq/6RKYuF7C31YeZypBQg54c=
Date: Mon, 24 Feb 2025 11:21:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <20250224092140.GA29646@pendragon.ideasonboard.com>
References: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
 <20241105165928.GJ14276@pendragon.ideasonboard.com>
 <71d343e7-ff9f-44e6-abfc-64425640c4f6@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71d343e7-ff9f-44e6-abfc-64425640c4f6@xs4all.nl>

Hi Hans,

On Mon, Feb 24, 2025 at 09:49:47AM +0100, Hans Verkuil wrote:
> On 05/11/2024 17:59, Laurent Pinchart wrote:
> > Hi Dan,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Nov 04, 2024 at 08:16:19PM +0300, Dan Carpenter wrote:
> >> This loop was recently converted to use for_each_of_graph_port() which
> >> automatically does __cleanup__ on the "port" iterator variable.  Delete
> >> the calls to of_node_put(port) to avoid a double put bug.
> >>
> >> Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > The offending commit wasn't merged through the media tree, so we can't
> > easily merge the fix there either. I'm fine merging this fix through
> > Rob's tree.
> 
> I don't see this patch merged anywhere. Should I just pick it up? I think
> it got lost in the noise.
> 
> The commit 393194cdf11e is now available in our media tree, so it should
> be fine, I think, if I pick it up. It needs a CC to stable as well, right?
> I can add that.

Yes, I'd CC stable. Thank you for handling it.

> >> ---
> >>  drivers/media/platform/xilinx/xilinx-tpg.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> >> index cb93711ea3e3..7deec6e37edc 100644
> >> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> >> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> >> @@ -722,7 +722,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
> >>  		format = xvip_of_get_format(port);
> >>  		if (IS_ERR(format)) {
> >>  			dev_err(dev, "invalid format in DT");
> >> -			of_node_put(port);
> >>  			return PTR_ERR(format);
> >>  		}
> >>  
> >> @@ -731,7 +730,6 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
> >>  			xtpg->vip_format = format;
> >>  		} else if (xtpg->vip_format != format) {
> >>  			dev_err(dev, "in/out format mismatch in DT");
> >> -			of_node_put(port);
> >>  			return -EINVAL;
> >>  		}
> >>  

-- 
Regards,

Laurent Pinchart

