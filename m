Return-Path: <linux-media+bounces-43351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F03BA9FCA
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 18:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C50C7A4DFE
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 16:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFEB309F11;
	Mon, 29 Sep 2025 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pHm2q4sN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2111426C;
	Mon, 29 Sep 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759162552; cv=none; b=l1bIzFQxc3la+207OemprveCFFWXEqKe9/P+ItP4nFBtoE6bMUOZj3ClCqWMyq8QlwB8jvk1FZucFY4gzmDvoiN8jC4ewEEwE00vUwXq6MUcwCYJG4G/R14ZWbmYiFJN2ugnMuNicX0IZRP+ePWZBdZIcpw2Q81iTbbD9jwC7bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759162552; c=relaxed/simple;
	bh=MGz34QOjpxquAx8V0hXd3ycpXw4c6itgjgjMazStRN0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=clK42KqJXICd5pmX+M5vlXIGlhhXIQhbYd+hZO7g9MwzF8/XGaRPrw6+tQ1d7dL0iVigD5H6qWe59+9ztir6pYlwEMvue0eSJHPTYjg/22TdxFK0nosAfB8WlsLezc9ilcJzRrzBdn8nqKtGXkOM3eY07vBPPtHHNlBMak5fq7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pHm2q4sN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.87.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A29C6346;
	Mon, 29 Sep 2025 18:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759162461;
	bh=MGz34QOjpxquAx8V0hXd3ycpXw4c6itgjgjMazStRN0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pHm2q4sN/560ALRfuJDKqevqj+fQ4GDY3klgfKKnQd3Iw/KaSrhPd1U4Drtob8PLj
	 AYY6DFcoUUMplJmTZhU30uIp4btebqGPAZGNl7ntmbKnK+ebP5GQMzcZbXHzV8wgvH
	 gI2+ZVKbRQNwjxjuQD8RRgTCoTe+0EXXOsPyMvxQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <16f45860-923b-4b5d-995e-0729d0479752@kernel.org>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com> <20250919-vdev-state-v2-2-b2c42426965c@ideasonboard.com> <3eef0f98-c34a-4b67-97f4-d60cd1eab8ad@kernel.org> <16f45860-923b-4b5d-995e-0729d0479752@kernel.org>
Subject: Re: [PATCH v2 02/10] media: v4l2-dev: Add support for try state
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ma Ke <make24@iscas.ac.cn>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org
Date: Mon, 29 Sep 2025 21:45:34 +0530
Message-ID: <175916253442.2234821.5624749898039510125@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Hans,

Quoting Hans Verkuil (2025-09-22 13:28:26)
> On 22/09/2025 09:52, Hans Verkuil wrote:
> > On 19/09/2025 11:55, Jai Luthra wrote:
> >> Format negotiation performed via the TRY_FMT ioctl should only affect
> >> the temporary context of a specific filehandle, not the active state
> >> stored in the video device structure. To support this distinction, we
> >> need separate storage for try and active states.
> >>
> >> Introduce an enum to distinguish between these two state types and sto=
re
> >> the try state in struct v4l2_fh instead of the video device structure.
> >> The try state is allocated during file handle initialization in
> >> v4l2_fh_init() and released in v4l2_fh_exit().
> >=20
> > There is a major difference between TRY in video devices and TRY in sub=
dev
> > devices: TRY for video devices is not persistent, i.e. it doesn't need =
to
> > be stored anywhere since nobody will be using that information.
> >=20

Yes, the v4l2 format sent with VIDIOC_TRY_FMT is currently not stored by
the drivers, but simply modified and returned back to userspace. From the
userspace point of view, that should still work the same way with this
series.

The drivers will get access to the correct state (active) for internal use
through framework helpers (that will be introduced in next revision), so
the try state doesn't have any real "use" today.

> > If the plan is to change that in later patch series, then that should be
> > very clearly stated. And I think I would need to know the details of th=
ose
> > future plans before I can OK this.
> >=20
> > So how is this try state intended to be used in the future?
>=20
> Follow-up: if there are no plans to change/enhance the VIDIOC_TRY_FMT sem=
antics,
> then I don't really see the point of this since there is no need to store=
 this
> information.

There are no plans to change the userspace side of this. The main
motivation to allocate and keep a try state in the framework is to simplify
the driver implementation. A single function can serve as both s_fmt and
try_fmt ioctl handler, and operate on the passed state argument without
caring if it will be applied on the device or just for negotiation.

In future, drivers may subclass the state with their device specific data,
so that nothing tied to the hardware state is stored in the driver
structures directly, but I don't see why drivers will need to inspect TRY
formats.

>=20
> Regards,
>=20
>         Hans
>=20
> >=20
> > Regards,
> >=20
> >       Hans
> >=20

Thanks,
Jai

[snip]

