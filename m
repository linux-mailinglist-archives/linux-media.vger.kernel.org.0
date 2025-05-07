Return-Path: <linux-media+bounces-32007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8FAAEDDE
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 23:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 557C7524C94
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 21:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45316290086;
	Wed,  7 May 2025 21:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NrB++wUB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DE928FFCC;
	Wed,  7 May 2025 21:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653065; cv=none; b=UdQzTabHsLIs1n60Fy/PuVhf/Z0+uqc4x5jiTJ290DQ+3IaHYdyu0MzJzqBynKP9zXGUr/unixiR9/cA4dhfTSukyInO9pVA2wZoNJe2ixSzyAGb7/9y7Y7MRtNQf2KxVryaRR60mt8QmM9xbi9YZF2MYm70nguMkJqLTtKzjts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653065; c=relaxed/simple;
	bh=LB/ZOlAxqkucdq1FVR1eTNobUWaWqOLt9pLxmFHNkpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZftKfmOPRpNhOPlVFGVka9i6d++IP4M3UniNwTRglKBES3do4+X6HDLsthIf0xhgMeKtn0nS1c6ImGeFd+NQ5quWIN8qYR44ILY0h5RhNQWbojfXMsqKDG9axNo0XoiJ0Nul9s6DVTbEUSkSi+H0hoe/SI5dsLdDXnkG5inlQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NrB++wUB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1EA0C59;
	Wed,  7 May 2025 23:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746653049;
	bh=LB/ZOlAxqkucdq1FVR1eTNobUWaWqOLt9pLxmFHNkpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrB++wUBfvR+yy92LRIlYYH3HEe68G8uoibvBv/onV5Ezk+rfVktqpfdSVEaLXQMB
	 qpXfWs7z8EuxokTPamYH9nw7MQbJ5wLnTRbxm/6vDX6zEyAADSEVz8hwoyndJxmy7B
	 mjMtA5hf4vc6l1aI25melc8Cav8M07l5VasD55UM=
Date: Wed, 7 May 2025 23:24:17 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9] media: vsp1: Add VSPX support
Message-ID: <7gsxhn3ny3pxauvgwyucfhlegaojx3rj2b4ncaaumrzroei6ek@6ht24cjv6b5n>
References: <20250506-b4-vspx-v9-1-d7d50a01f7b6@ideasonboard.com>
 <20250506173733.GA539397@ragnatech.se>
 <2wsx4pmkwmjgqlfywbsqim5irnh7lcfhbdreenevf2lnd2ofsb@u3epcobuxuij>
 <20250507140949.GB836326@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507140949.GB836326@ragnatech.se>

Hi Niklas,

On Wed, May 07, 2025 at 04:09:49PM +0200, Niklas Söderlund wrote:
> Hi Jacopo,
>
> On 2025-05-07 14:28:50 +0200, Jacopo Mondi wrote:
> > Hi Niklas,
> >
> > On Tue, May 06, 2025 at 07:37:33PM +0200, Niklas Söderlund wrote:
> > > Hi Jacopo,
> > >
> > > Thanks for this new version!
> > >
> > > I will give this a good testing as soon as I have finished some
> > > refactoring of the user of this. I had a comment I wanted to send for
> > > v8, but seems I never did. So for now I will just post this incase you
> > > need to do a v10 before I had time.
> > >
> > > On 2025-05-06 18:32:23 +0200, Jacopo Mondi wrote:
> > >
> > > .. snip ..
> > >
> > > > +struct vsp1_dl_list;
> > > > +struct vsp1_isp_job_desc {
> > > > +	struct {
> > > > +		unsigned int pairs;
> > > > +		dma_addr_t mem;
> > > > +	} config;
> > > > +	struct {
> > > > +		struct v4l2_format fmt;
> > >
> > > I'm very happy to see this is now the only location for the format, nice
> > > work! I wonder if we shall take it one step further and just record the
> > > fourcc, width, height and bytesperline here? Or at switch to a
> > > v4l2_pix_format struct?
> > >
> > > The user of this field do not really support multi plane formats, nor do
> > > it validate fmt.type field.
> > >
> > > I recently hit a snag in the ISP driver using this interface where I
> > > *think* the solution is to only allow single plane buffers to be used as
> > > input to the ISP (V4L2_CAP_VIDEO_OUTPUT_MPLANE vs
> > > V4L2_CAP_VIDEO_OUTPUT). While fixing the plumbing for this I ran across
> > > this, sorry for not noticing before.
> >
> > True that.
> >
> > However my understanding is that nowadays the multiplaner API should be used
> > for single planar formats too.
>
> Mine too, I'm just grasping for straws debugging things and this was one
> thing I tried to figure things out. It was unrelated to the VSPX, and
> did not solve my instal problem. But working on it was what lead me to
> this design decision in the VSPX driver.
>
> > If you want to avoid passing in the
> > whole 'struct v4l2_format' then I would pass in the
> > v4l2_pix_format_mplane .pix_mp member (which the VSPX uses
> > unconditionally at the moment).
> >
> > However, assuming future developments where a different user uses
> > V4L2_CAP_VIDEO_OUTPUT, the VSPX driver can be extended and use the
> > .type field to select which member of the 'fmt' union to use if we
> > pass the whole 'struct v4l2_format' in. This is all very theoretical I
> > know. To be honest I would keep the interface as it is and eventually
> > improve the VSPX driver to use the 'type' field to select which format
> > to use.
>
> I'm fine with that. Maybe add a check on .type field in the VSPX driver
> and fail if the .pix_mp 'variant' is not used to configure the VSPX?

Good idea. I'll wait for more comments on v9 and include this change
in v10! Should be really few lines check.

Thanks
  j

> When playing with V4L2_CAP_VIDEO_OUTPUT the VSPX code still happy
> accepted the struct v4l2_format but it contained bad data when
> interpreted as .pix_mp instead of the .pix that was populated.
>
> >
> > >
> > > > +		dma_addr_t mem;
> > > > +	} img;
> > > > +	struct vsp1_dl_list *dl;
> > > > +};
> > >
> > >
> > > --
> > > Kind Regards,
> > > Niklas Söderlund
>
> --
> Kind Regards,
> Niklas Söderlund

