Return-Path: <linux-media+bounces-43354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49CBAA099
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 18:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45BA0172B61
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 16:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE3A3093A6;
	Mon, 29 Sep 2025 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HTJH87j+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B740CA52;
	Mon, 29 Sep 2025 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759164631; cv=none; b=GPqkXifGQtg1meIMZIFXpu4G2yupnaahyo9W3+cRy41YMgqjqWCrTChf7bEl0RFpdcVUCmCHOSFrUeMIIxWhl5lmMXeQALV3jMOfRP0LSYV1+ZZ9iqCgT+/tEpNhC/2K2D8xM/vwXth4YPuWb/RA/Lub5/KhIJkA0zm/lkJFhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759164631; c=relaxed/simple;
	bh=hRJCTgUGf9lO8IlLW7Jrp6UjL1i4hk1up5T6tDJCnuc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FezyEXHcbB42/wuoGvH32JYqERNJ3XRXTdlq9PSFXtjIk/JT9r2AHZs0Y0fQYF9YC5Lkz9ph+AAw/t85O8byHV7IZ2QKfufXSBsJ2ngLaxPw19PAcBwX1kJuIqoG0axHgEP1qJLTZ99DdJo2bMYD0ruVdIBvVeMfzD+7wDYB+F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HTJH87j+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.87.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC4E8346;
	Mon, 29 Sep 2025 18:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759164539;
	bh=hRJCTgUGf9lO8IlLW7Jrp6UjL1i4hk1up5T6tDJCnuc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HTJH87j+gQsMdxpX56f5w8hv9iPAVGukjFYkpAOQ6dJFQ0DqPPVGjUM9YmipVcv8b
	 68f1gWKEEcqkHyAc1p61QhAeJcR92GjpFYipnX7wWV12htx3qogKivE09fPxVW23Zi
	 naWiInCT7DwrXHK/m/9ZiKpuxrY0myIZpdRolzjU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250924121545.1456cbea@foz.lan>
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com> <20250919-vdev-state-v2-1-b2c42426965c@ideasonboard.com> <20250924121545.1456cbea@foz.lan>
Subject: Re: [PATCH v2 01/10] media: v4l2-core: Introduce state management for video devices
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Al Viro <viro@zeniv.linux.org.uk>, Ma Ke <make24@iscas.ac.cn>, linux-kernel@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Mon, 29 Sep 2025 22:20:12 +0530
Message-ID: <175916461248.2234821.1065883006028083651@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Mauro,

Quoting Mauro Carvalho Chehab (2025-09-24 15:45:45)
> Em Fri, 19 Sep 2025 15:25:53 +0530
> Jai Luthra <jai.luthra@ideasonboard.com> escreveu:
>=20
> > Similar to V4L2 subdev states, introduce state support for video devices
> > to provide a centralized location for storing device state information.
> > This includes the current (active) pixelformat used by the device and
> > the temporary (try) pixelformat used during format negotiation.
>=20
> I didn't look at the patch series yet, so I may be just jumping too
> fast here, but storing "try" attempts doesn't seem the right thing to
> do.
>=20
> Btw, IMHO, the first patch on this series should be against documentation,
> where you would be describing not only the new feature with the supported=
=20
> states, but also the state machine transitions that are supported,
> preferably with some graphs.
>=20
> So, before actually looking on any code changes, I'd like to see a clear
> description of this new feature, what it is proposing to address, how
> and what impacts (if any) this would bring to userspace.
>=20
> The current diffstat:
>=20
>  include/media/v4l2-ctrls.h                         |   5 +-
>  include/media/v4l2-dev.h                           |  84 +++++
>  include/media/v4l2-fh.h                            |   2 +
>  include/media/v4l2-ioctl.h                         | 238 ++++++-------
>  include/media/v4l2-mem2mem.h                       |  48 ++-
>  include/media/videobuf2-v4l2.h                     |  33 +-
>=20
> implies that this affects for now only Documentation/driver-api/media/...

There shouldn't be any change to userspace with this series. The state
structure introduced here is only for internal use by the drivers, which
currently store the applied formats in driver-specific structures.

In the next revision, I will add documentation in v4l2-dev.rst similar to
how the subdev state is described in v4l2-subdev.rst.

>=20
> > In the
> > future, this may be extended or subclassed by device drivers to store
> > their internal state variables.
> >=20
> > Also introduce a flag for drivers that wish to use this state
> > management. When set, the framework automatically allocates the state
> > during device registration and stores a pointer to it within the
> > video_device structure.
> >=20
> > This change aligns video devices with V4L2 subdevices by storing
> > hardware state in a common framework-allocated structure. This is the
> > first step towards enabling the multiplexing of the underlying hardware
> > by using different software "contexts", each represented by the combined
> > state of all video devices and V4L2 subdevices in a complex media graph.
>=20
> ... but when you mention "contexts", I'm assuming that you're aiming
> at either userspace API changes and/or behavoral changes that will
> affect uAPI as well.

Yes, the userspace side changes are documented in Jacopo's series adding
context support for media devices, for example:

https://lore.kernel.org/linux-media/20250724-multicontext-mainline-2025-v2-=
7-c9b316773486@ideasonboard.com/

>=20
> Thanks,
> Mauro

Thanks,
Jai

