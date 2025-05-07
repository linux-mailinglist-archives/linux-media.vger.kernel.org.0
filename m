Return-Path: <linux-media+bounces-31969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBFAADF24
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 14:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5A1F46129C
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 12:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE221264616;
	Wed,  7 May 2025 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FSGoagCu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BFE25D536;
	Wed,  7 May 2025 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620942; cv=none; b=fEiesIfT16dPBjunM0Jba0sO43TrGwwe6ucqOgwKeertB9AunRivKf8Xef4t01+J5yWHrYiL92e+EP8Z3vUgsrXnemo72AIUmo7uDtAtCDv6yURG6ba52FiwxBHuYSL9enODUx/373qTbGsdt/dQYNL3c29eSeDVU3P2X0jT0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620942; c=relaxed/simple;
	bh=8QrADYlLGZeERk14Fg2ZqOd/UdojrP6ROM7RYntxKKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AznIbsjWmZlue3JBjcflt1Pe5me47aAlcBzLgCthoydruc7LeZ7EgJ/ZNsK7oB28NIzPXJeYW6/B1Fl4Bnof/FD1+gQ4oZaJzxH/moqfVr32Qm6eRufQEoqMyLLBl6XYSLP07wBlDE56LBKnj+j/ZJXdMLJw6VVfZhx9U0QHuu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FSGoagCu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07DC26D5;
	Wed,  7 May 2025 14:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746620922;
	bh=8QrADYlLGZeERk14Fg2ZqOd/UdojrP6ROM7RYntxKKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSGoagCuHeEatihXK1ciR/gIymqyROL118ZV5lQ7IYK093ABiZUl6K6ysB/q5JizK
	 99DaMoIMaTq1D++xWcwckqh4Y98ImxQ9P97fIdYT/l3q+Fq8MMIA3iqd2kCy7fGKT1
	 wkVFTZEte0R47tkkUL9ciBlr0OiTWWoEcuUwmXAE=
Date: Wed, 7 May 2025 14:28:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9] media: vsp1: Add VSPX support
Message-ID: <2wsx4pmkwmjgqlfywbsqim5irnh7lcfhbdreenevf2lnd2ofsb@u3epcobuxuij>
References: <20250506-b4-vspx-v9-1-d7d50a01f7b6@ideasonboard.com>
 <20250506173733.GA539397@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506173733.GA539397@ragnatech.se>

Hi Niklas,

On Tue, May 06, 2025 at 07:37:33PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> Thanks for this new version!
>
> I will give this a good testing as soon as I have finished some
> refactoring of the user of this. I had a comment I wanted to send for
> v8, but seems I never did. So for now I will just post this incase you
> need to do a v10 before I had time.
>
> On 2025-05-06 18:32:23 +0200, Jacopo Mondi wrote:
>
> .. snip ..
>
> > +struct vsp1_dl_list;
> > +struct vsp1_isp_job_desc {
> > +	struct {
> > +		unsigned int pairs;
> > +		dma_addr_t mem;
> > +	} config;
> > +	struct {
> > +		struct v4l2_format fmt;
>
> I'm very happy to see this is now the only location for the format, nice
> work! I wonder if we shall take it one step further and just record the
> fourcc, width, height and bytesperline here? Or at switch to a
> v4l2_pix_format struct?
>
> The user of this field do not really support multi plane formats, nor do
> it validate fmt.type field.
>
> I recently hit a snag in the ISP driver using this interface where I
> *think* the solution is to only allow single plane buffers to be used as
> input to the ISP (V4L2_CAP_VIDEO_OUTPUT_MPLANE vs
> V4L2_CAP_VIDEO_OUTPUT). While fixing the plumbing for this I ran across
> this, sorry for not noticing before.

True that.

However my understanding is that nowadays the multiplaner API should be used
for single planar formats too. If you want to avoid passing in the
whole 'struct v4l2_format' then I would pass in the
v4l2_pix_format_mplane .pix_mp member (which the VSPX uses
unconditionally at the moment).

However, assuming future developments where a different user uses
V4L2_CAP_VIDEO_OUTPUT, the VSPX driver can be extended and use the
.type field to select which member of the 'fmt' union to use if we
pass the whole 'struct v4l2_format' in. This is all very theoretical I
know. To be honest I would keep the interface as it is and eventually
improve the VSPX driver to use the 'type' field to select which format
to use.

>
> > +		dma_addr_t mem;
> > +	} img;
> > +	struct vsp1_dl_list *dl;
> > +};
>
>
> --
> Kind Regards,
> Niklas Söderlund

