Return-Path: <linux-media+bounces-17980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEDF9714DD
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61DF81F24127
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 10:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CF31B3F14;
	Mon,  9 Sep 2024 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gtxEjCzz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB091B374E;
	Mon,  9 Sep 2024 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725876458; cv=none; b=WNKG/64FuxFn8wNM871FtBn2A001N5cisyXfQ9EKS3YHruvLu0bYNYwiB6YvnSAzVni+yFJ1KKPoCBiLeXqtNdYaZw8kKRZ5FAi1jP0M05A+qVR8heT4dkmEC8cPqOfJZTL6fn6AzXg9tvS4kyfUVNYZhEaaPkPYwIJHfWExXn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725876458; c=relaxed/simple;
	bh=gGAf8fH+CF7c4deB2V1S6EIMbFGUAOFQEO2Wv26+Bh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhbuyzSQ0a6P4pB/2qu/sbPg5sSVSSMiou4wROkuFyjkbozfMFLsQ5KMUiO73lbpkeF7Zxm6Vw2KnvNafJaGBURkpZfVfsgKycJBQRi94kerVQSlEKS5lu1P9y/TZn1KMuShVh9HUfb8KgYgIC+Pv8P5gHN9MZkZMu+yqouOOII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gtxEjCzz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0945D2C6;
	Mon,  9 Sep 2024 12:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725876379;
	bh=gGAf8fH+CF7c4deB2V1S6EIMbFGUAOFQEO2Wv26+Bh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtxEjCzzUV++3NzQ3ApD0eIdjAgJTsk3zplsC8NAevhvOAkWpOo52WMh6Zzyz8AEZ
	 nL3nM0RrK+MFzPBBeJpypsqGRLdyFZ5QXQcTfHkbY1qBXGmBSyBD2FdIHGrIxN7DTI
	 pASuYchjtVGr4ajR+jRHRyNsO2mUVgML0TkC2WZ8=
Date: Mon, 9 Sep 2024 13:07:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] media: platform: rzg2l-cru: rzg2l-video: Retrieve
 virtual channel information
Message-ID: <20240909100732.GA13983@pendragon.ideasonboard.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906231038.GC12915@pendragon.ideasonboard.com>
 <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>
 <CA+V-a8s4UjjDTrQ4aw3OjQuac8B-oq++KqYf-fJEQvuxD5GodA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8s4UjjDTrQ4aw3OjQuac8B-oq++KqYf-fJEQvuxD5GodA@mail.gmail.com>

On Sun, Sep 08, 2024 at 09:23:52PM +0100, Lad, Prabhakar wrote:
> On Sat, Sep 7, 2024 at 10:09 PM Lad, Prabhakar wrote:
> > On Sat, Sep 7, 2024 at 12:10 AM Laurent Pinchart wrote:
>
> <snip>
>
> > > > +
> > > >  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > > >  {
> > > >       struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
> > > >       unsigned long flags;
> > > >       int ret;
> > > >
> > > > +     ret = rzg2l_cru_get_virtual_channel(cru);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +     cru->csi.channel = ret;
> > >
> > > How about passing the value to the function that needs it, instead of
> > > storing it in cru->csi.channel ? You can do that on top and drop the
> > > csi.channel field.
> >
> > OK, let me check if this can be done.
>
> The virtual channel number is programmed in rzg2l_cru_csi2_setup() [0]
> call, below is the code flow of the call. This code flow is called by
> spinlock held.
> 
> rzg2l_cru_start_image_processing()
>     rzg2l_cru_initialize_image_conv()
>         rzg2l_cru_csi2_setup()
> 
> When rzg2l_cru_get_virtual_channel() is called directly in
> rzg2l_cru_csi2_setup() function we get "BUG: Invalid wait context"
> (when PROVE_LOCKING is enabled) this is due to we do a mutex lock as
> part of v4l2_subdev_lock_and_get_active_state() in get_frame_desc.

I didn't mean calling rzg2l_cru_get_virtual_channel() from
rzg2l_cru_csi2_setup(), but passing the virtual channel number from
rzg2l_cru_start_image_processing() to rzg2l_cru_initialize_image_conv()
and then to rzg2l_cru_csi2_setup().

> So probably I'll leave this as it is now.
> 
> [0] https://elixir.bootlin.com/linux/v6.10.8/source/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c#L311

-- 
Regards,

Laurent Pinchart

