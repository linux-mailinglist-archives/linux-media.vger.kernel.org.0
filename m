Return-Path: <linux-media+bounces-25123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95523A1910C
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 12:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3FD3A561D
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 11:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D76D212B1C;
	Wed, 22 Jan 2025 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KYxUo+xi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A79211A39;
	Wed, 22 Jan 2025 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737547041; cv=none; b=Wl3+TpAAiXQ5sg+jEYHuxqNtXAhfiV1qCreU7yTSaEtkcwFMYKzTn8OnJaeKzHcEtQ1FsrAJ7OykS3Qp89I3CHw6iEi48Bhz1SBtzGzIsUlA9dx3N5wyAm0bu11MceJpw0AqF8KdrSIhFbpS3c1SeCE18LVPw2qItRsUv7I1iTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737547041; c=relaxed/simple;
	bh=xG7WdzHH5i4+MwNUdpzOh7SvWcJmZE0jC0SGc6QAH/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m42W+cpERo92xmKBG/E3j+y2CZpvsT0/eyy7sot8DEDht65p5hjo/Xe+N23nL5DfreT14bei90oNm7U7IJPRaOCYLzYCebnwVZhcNQ2WhEA8J8gqZvFmDG+gkMBcWJCLLRGeOslJeYiCWasdmlLS85olsvfjjXFFwjJsoFVyOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KYxUo+xi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F151B1E3;
	Wed, 22 Jan 2025 12:56:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737546974;
	bh=xG7WdzHH5i4+MwNUdpzOh7SvWcJmZE0jC0SGc6QAH/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYxUo+xiFTP86fEI+WgoYxvdgfQoEbDrNggBJtEpusCfXUhLUupNsDIJhcETr3tFt
	 iNVcUWNkKooOB+mVwbl1aoaOtTGGZ/TE31DSgwKHQGbcMZ7SaahqgTJU4JqC5iCqcb
	 jm2d1Qd5ZwBxthu02G8OZNBamwUUasieYYjGQx8Y=
Date: Wed, 22 Jan 2025 12:57:13 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] media: rcar: Minor cleanups and improvements
Message-ID: <p2f3d5tm4ufax2ubgrsfm75c754mu2pdnkzmtopzwwebyuhcjf@i3dttqpg5myu>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
 <20250121212448.GA3302176@ragnatech.se>
 <a0e38115-87c7-4145-b9d0-fb8f8ea1fcf7@ideasonboard.com>
 <20250122092128.GB3436806@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122092128.GB3436806@ragnatech.se>

Hi Niklas,

On Wed, Jan 22, 2025 at 10:21:28AM +0100, Niklas Söderlund wrote:
> On 2025-01-22 10:02:59 +0200, Tomi Valkeinen wrote:
> > Hi,
> >
> > On 21/01/2025 23:24, Niklas Söderlund wrote:
> > > Hi Tomi,
> > >
> > > Thanks for a great cleanup series!
> > >
> > > On 2025-01-20 15:10:33 +0200, Tomi Valkeinen wrote:
> > > > I've started looking at multi-stream support, and came up with these
> > > > while working towards streams.
> > > >
> > > >   Tomi
> > > >
> > > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >
> > > I have tested this in Gen2, Gen3 and Gen4 without noticing any
> > > regressions. The log is now spammed with the helpful suggestion that the
> > > CSI-2 TX subdevices shall implement V4L2_CID_LINK_FREQ control. This is
> > > annoying but out of scope for this series, but would be nice at some
> > > point.
> > >
> > >    [   37.421531] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
> > >    [   37.430991] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> >
> > Which drivers need fixing? The staging max96712 is one (there seems to be a
> > TODO there about it), and adv748x? I'm not going to work on that right now,
> > but just collecting the details.
>
> Indeed adv748x is the other driver needing work here. The problem as I
> recall it is that V4L2_CID_LINK_FREQ is a menu control, and adv748x
> selects it link freq based on what it is outputting. But it's been some
> time since I looked at this, maybe I recall incorrectly.
>

Would this series help ?
https://patchwork.kernel.org/project/linux-media/list/?series=926905

> >
> > > For the whole series,
> > >
> > > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Thanks!
> >
> >  Tomi
> >
>
> --
> Kind Regards,
> Niklas Söderlund
>

