Return-Path: <linux-media+bounces-8146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CEF890CE2
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 23:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B971F2594A
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 22:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A6613B5A5;
	Thu, 28 Mar 2024 22:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E/RxLlw3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF1136E2C
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663458; cv=none; b=ZPiFC+GlWuuOGOAakWGYvgQYXq5v/jpky9WnRLg81fBsi5U3TdYYLPYcrZu7r1eLrwyxLodCuwffPUJMitIQFPPSlRMe8TuIO+5uGpFkM1eST3Q9/KhwZKn7hLvCwVulQHPbsf8tT21gfE+7rgzqIiN49hmN3h0YSMIvnHPRGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663458; c=relaxed/simple;
	bh=PXdnVTm3E4flpSCoJ8bIUHm0+MMxGrU4bhju28HHYXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpOfBxtbu5byrgsZ9vltfC0gTcuYgC+PI3GNWUtaxTDzTS3g+89HmGnR62/I+1hda+UWrs39rQlnsoSKWWVp5dtR87zSlA/ZRhkYfpj7c4h/isYGjnDCLgK3ddgnt3Km5jiIaMimzbDj5igSmgHqiMAHpMehyiBAjlrIBucExl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E/RxLlw3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A6CE1A2;
	Thu, 28 Mar 2024 23:03:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711663421;
	bh=PXdnVTm3E4flpSCoJ8bIUHm0+MMxGrU4bhju28HHYXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/RxLlw3reL0nJk/sZ0KQz6jKSka3Pixjetl+fGTccrd8Nq+0zFMvTfSbYRT3KYsw
	 E7VoTUX3CBffY50QittFntHeAnxtOdvUvg80ENgePNydcbx3qUfOT8drfQk9fZ02I1
	 nGBO//bNTPgzzl4g7Xa+iIDBYoQqSIRUHMWn9zLQ=
Date: Fri, 29 Mar 2024 00:04:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Fabio Estevam <festevam@gmail.com>, rmfrfs@gmail.com, hansg@kernel.org,
	linux-media@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] media: ov2680: Allow probing if link-frequencies is
 absent
Message-ID: <20240328220403.GG11463@pendragon.ideasonboard.com>
References: <20240328051320.2428125-1-festevam@gmail.com>
 <ZgUiP2WnaAWnJ207@kekkonen.localdomain>
 <ZgXnZKhhOdpD4beP@kekkonen.localdomain>
 <ZgXn2u4x6mLWMImc@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZgXn2u4x6mLWMImc@kekkonen.localdomain>

On Thu, Mar 28, 2024 at 09:57:46PM +0000, Sakari Ailus wrote:
> On Thu, Mar 28, 2024 at 09:55:48PM +0000, Sakari Ailus wrote:
> > On Thu, Mar 28, 2024 at 07:54:41AM +0000, Sakari Ailus wrote:
> > > Hi Fabio,
> > > 
> > > On Thu, Mar 28, 2024 at 02:13:19AM -0300, Fabio Estevam wrote:
> > > > From: Fabio Estevam <festevam@denx.de>
> > > > 
> > > > Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> > > > property verification") the ov2680 no longer probes on a imx7s-warp7:
> > > > 
> > > > ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
> > > > ov2680 1-0036: probe with driver ov2680 failed with error -2
> > > > 
> > > > As the 'link-frequencies' property is not mandatory, allow the probe
> > > > to succeed by skipping the link-frequency verification when the
> > > > property is absent.
> > > > 
> > > > Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> > > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > > ---
> > > >  drivers/media/i2c/ov2680.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> > > > index 39d321e2b7f9..f611ce3a749c 100644
> > > > --- a/drivers/media/i2c/ov2680.c
> > > > +++ b/drivers/media/i2c/ov2680.c
> > > > @@ -1123,6 +1123,9 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
> > > >  		goto out_free_bus_cfg;
> > > >  	}
> > > >  
> > > > +	if (!bus_cfg.nr_of_link_frequencies)
> > > > +		return 0;
> > > > +
> > > 
> > > Thanks for the patch.
> > > 
> > > I'd still rather try to avoid going to this direction as these frequencies
> > > are hardware dependent. Add a new one to the driver and some boards may
> > > stop working properly. For details see
> > > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.
> > 
> > While the above holds, on second thought, the driver has been around for
> > quite some time and indeed the added validation does break certain boards
> > (at least without adding the link frequencies there).
> > 
> > So I'm fine with the patch.
> > 
> > I think this should also be cc'd to stable.
> 
> And this applies to the newer version of the patch that fixes the memory
> leak, of course.

Should we add least log a warning when link frequencies are not present
in DT ?

> > > >  	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
> > > >  		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
> > > >  			break;

-- 
Regards,

Laurent Pinchart

