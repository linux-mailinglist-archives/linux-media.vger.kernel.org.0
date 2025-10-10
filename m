Return-Path: <linux-media+bounces-44149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7ABBCC1B3
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F44340236D
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 08:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD05426059D;
	Fri, 10 Oct 2025 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wh+SrsUz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295111991D2;
	Fri, 10 Oct 2025 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084519; cv=none; b=ZQVUMZM8IMjltOnK30OtI+S5MJYmYcux3k/4KhepRvoa+ep4R2k2SI3ACdFw0fGYRmV18Py0ErNDn7zne4tFcMlLFYjscAY6KNoVd7+ZrckMvTP+grrPgHgKbdW0JquwYGzD37aeBz1c0xBzAoP4mVwvBlBkmoFC2Up1X39gn78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084519; c=relaxed/simple;
	bh=YSQNJr2oYKk3qMOODi3stI1a6DzS4lkkF0P3amUMrSI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MXnoaPd3KRrXcZNcCwI5Ynj/lCCMZN5LPyIY/QkzEdgVlUjEL77FvPLnXAfSLlASJPqG0t2tzQkXVqH8CZ+cgYofUxZe6CY1iXKhTWL22VK4IAJzPCv7q/VQG5SKFHparbJiVenW2hQT9QjXn3QGdG+Ro8hSUckkO3JGOun3yxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wh+SrsUz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 496105B3;
	Fri, 10 Oct 2025 10:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760084419;
	bh=YSQNJr2oYKk3qMOODi3stI1a6DzS4lkkF0P3amUMrSI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wh+SrsUzNEIBibEeDhQhc1qqGwwHfMb0P91qH4PQjEOeo2y92dpRU3qb8lSxIM+ZK
	 pSh8HHZg0ZlJ3FC2XjO/lHGbgIFqcbukSrVU/O9LCrMj79vYrK/H6sDVQ03LnNFNu6
	 MElInC2i8+egIqm6SC68AU0whL2i6oGUB4EGP4sE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com> <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
Subject: Re: [PATCH 00/18] media: microchip-isc: Color correction and histogram stats
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Chas Williams <3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Balakrishnan Sambath <balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>
Date: Fri, 10 Oct 2025 09:21:51 +0100
Message-ID: <176008451125.756374.6436397947711705101@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Eugen Hristev (2025-10-09 21:11:17)
> Hi Bala,
>=20
> On 10/9/25 18:52, Balamanikandan Gunasundar wrote:
> > Hi,
> >=20
> > This patch series has a set of enhancements to the Microchip Image Sens=
or
> > Controller driver. The objective is to expand its image processing
> > capabilities and to improve the colors.
> >=20
> > This series also introduces a new stats driver that exposes the histogr=
am
> > data to userspace via v4l2 controls. This allows applications such as
> > libcamera to access real time image statistics for advanced image
> > processing like automatic exposure, white balance adjustments etc.

How much data do you anticipate to be passing through controls? (What
can the hardware provide in total if we look at the bigger picture to
support the full device?)

For all other ISPs we've been working towards using structured parameter
buffers to pass data - and we've been making that format extensible,
which I think could also be a design that can apply to statistics.

This would greatly reduce the overhead of managing 'one control per
value' ... or things like passing large tables (like a lens shading
table perhaps) through controls.

--
Kieran

> >=20
> > Balakrishnan Sambath (11):
> >   media: microchip-isc: Enable GDC and CBC module flags for RGB formats
> >   media: microchip-isc: Improve histogram calculation with outlier
> >     rejection
> >   media: microchip-isc: Use channel averages for Grey World AWB
> >   media: microchip-isc: Add range based black level correction
> >   media: platform: microchip: Extend gamma table and control range
> >   media: platform: microchip: Add new histogram submodule
> >   media: microchip-isc: Register and unregister statistics device
> >   media: microchip-isc: Always enable histogram for all RAW formats
> >   media: microchip-isc: fix histogram state initialization order
> >   media: microchip-isc: decouple histogram cycling from AWB mode
> >   media: microchip-isc: enable userspace histogram statistics export
> >=20
> > Balamanikandan Gunasundar (7):
> >   media: platform: microchip: set maximum resolution for sam9x7
> >   media: platform: microchip: Include DPC modules flags in pipeline
> >   media: microchip-isc: expose hue and saturation as v4l2 controls
> >   media: microchip-isc: Rename CBC to CBHS
> >   media: microchip-isc: Store histogram data of all channels
> >   media: videodev2.h, v4l2-ioctl: Add microchip statistics format
> >   media: microchip-isc: expose color correction registers as v4l2
> >     controls
> >=20
> >  drivers/media/platform/microchip/Kconfig      |   2 +
> >  drivers/media/platform/microchip/Makefile     |   2 +-
> >  .../platform/microchip/microchip-isc-base.c   | 373 ++++++++++--
> >  .../platform/microchip/microchip-isc-regs.h   |   3 +
> >  .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
> >  .../media/platform/microchip/microchip-isc.h  |  44 +-
> >  .../microchip/microchip-sama5d2-isc.c         |   2 +-
> >  .../microchip/microchip-sama7g5-isc.c         |  73 ++-
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  include/linux/atmel-isc-media.h               |  13 +
> >  include/uapi/linux/videodev2.h                |   3 +
> >  11 files changed, 1001 insertions(+), 64 deletions(-)
> >  create mode 100644 drivers/media/platform/microchip/microchip-isc-stat=
s.c
> >=20
>=20
> This looks interesting.
> I would like to see the compliance tool output for more platforms
> (sama7g5, sama5d2, and the new sam9x7), also the media-ctl -p , to see
> the topology with your new driver.
>=20
> Thanks,
> Eugen

