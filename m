Return-Path: <linux-media+bounces-43416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3CEBAC487
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 11:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA063B714B
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A852F5328;
	Tue, 30 Sep 2025 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ByTQf06D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CBB4D8CE;
	Tue, 30 Sep 2025 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759224948; cv=none; b=i6b6lIlaMM1gMONSoj9F76/bmBwFFnuM3+L1DHmn89e7AJEzxg10z0CfLgIwTWhiJqqZRtXW4yvahyWwbFbW3hfMYZ4x8g9gBiKZ9Rq+UhG9HQtb8ARHCQRuamCn8V0QG9PeETAdXwywJFV6kC/vM6c65DQIdjqk/9RRPXE8hmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759224948; c=relaxed/simple;
	bh=PuUml8F/MFY7w89/vlUngBLAq6ccLr97WEbo2MN9xpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+agy7KAuA0sMWQjjEoAiXmdrBElvqXHU9dcKBauIdj3V7SR0gNKwWqYqdVNRh2nAwxsO9qLj8XznoehWT97Fpp+UXO4jKGMl70q52khcmKvNYgoHT719+gyQabnFo9jrTkB5cNQg3kU+8zA22JefkJ47p8XndwvBzl1GSu6IBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ByTQf06D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DA2742B;
	Tue, 30 Sep 2025 11:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759224855;
	bh=PuUml8F/MFY7w89/vlUngBLAq6ccLr97WEbo2MN9xpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByTQf06DTIvwO0tZMZZIx06Q4vzaIdGI96yda4yyBcFxSUnOycykKKd+J1MSRINdK
	 mf6i3XmjHb/WC5UKaPZlFLxRfvB5BiycqBK6FHnuCzWwOW5eyqjmWwmldnRvdLVh6k
	 8Hj/2DOmvPTLOrdiKFofhqoI3BHUzRkRzlUcA9yA=
Date: Tue, 30 Sep 2025 11:35:40 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ma Ke <make24@iscas.ac.cn>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] media: v4l2-dev: Add support for try state
Message-ID: <ohhhg34jxsiujtwqgcmfpkbugbhouwxjrdlstdldy3hmmsvtoz@7xlotetzbgfu>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-2-b2c42426965c@ideasonboard.com>
 <3eef0f98-c34a-4b67-97f4-d60cd1eab8ad@kernel.org>
 <16f45860-923b-4b5d-995e-0729d0479752@kernel.org>
 <175916253442.2234821.5624749898039510125@freya>
 <006000c4-7ecd-474f-ac0c-90c7b0606506@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <006000c4-7ecd-474f-ac0c-90c7b0606506@kernel.org>

Hi Hans

On Tue, Sep 30, 2025 at 09:30:55AM +0200, Hans Verkuil wrote:
> On 29/09/2025 18:15, Jai Luthra wrote:
> > Hi Hans,
> >
> > Quoting Hans Verkuil (2025-09-22 13:28:26)
> >> On 22/09/2025 09:52, Hans Verkuil wrote:
> >>> On 19/09/2025 11:55, Jai Luthra wrote:
> >>>> Format negotiation performed via the TRY_FMT ioctl should only affect
> >>>> the temporary context of a specific filehandle, not the active state
> >>>> stored in the video device structure. To support this distinction, we
> >>>> need separate storage for try and active states.
> >>>>
> >>>> Introduce an enum to distinguish between these two state types and store
> >>>> the try state in struct v4l2_fh instead of the video device structure.
> >>>> The try state is allocated during file handle initialization in
> >>>> v4l2_fh_init() and released in v4l2_fh_exit().
> >>>
> >>> There is a major difference between TRY in video devices and TRY in subdev
> >>> devices: TRY for video devices is not persistent, i.e. it doesn't need to
> >>> be stored anywhere since nobody will be using that information.
> >>>
> >
> > Yes, the v4l2 format sent with VIDIOC_TRY_FMT is currently not stored by
> > the drivers, but simply modified and returned back to userspace. From the
> > userspace point of view, that should still work the same way with this
> > series.
> >
> > The drivers will get access to the correct state (active) for internal use
> > through framework helpers (that will be introduced in next revision), so
> > the try state doesn't have any real "use" today.
> >
> >>> If the plan is to change that in later patch series, then that should be
> >>> very clearly stated. And I think I would need to know the details of those
> >>> future plans before I can OK this.
> >>>
> >>> So how is this try state intended to be used in the future?
> >>
> >> Follow-up: if there are no plans to change/enhance the VIDIOC_TRY_FMT semantics,
> >> then I don't really see the point of this since there is no need to store this
> >> information.
> >
> > There are no plans to change the userspace side of this. The main
> > motivation to allocate and keep a try state in the framework is to simplify
> > the driver implementation. A single function can serve as both s_fmt and
> > try_fmt ioctl handler, and operate on the passed state argument without
> > caring if it will be applied on the device or just for negotiation.
> >
> > In future, drivers may subclass the state with their device specific data,
> > so that nothing tied to the hardware state is stored in the driver
> > structures directly, but I don't see why drivers will need to inspect TRY
> > formats.
>
> I think having an unused try state is a bad idea and really confusing.
>
> Especially because for subdevices the try state is actually used, so

I might have missed where. TRY formats on subdev sink pads influence
TRY formats on the source pads, are there other usages I might be
overlooking ?

> for normal devices you would automatically expect the same thing when
> you see a try state.
>
> You should reconsider this approach.

The 'try' state will be stored in the v4l2_fh and won't be accessible
to userspace.

Drivers instead, might accumulate the result of multiple TRY_FMT calls
into the state stored in the v4l2_fh incrementally. Is this a concern
for you ?

I still think having a single implementation for s_fmt and try_fmt is
a win for drivers, even if the try state are now effectively stored
somewhere.

Thanks
  j

>
> Regards,
>
> 	Hans

