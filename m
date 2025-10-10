Return-Path: <linux-media+bounces-44150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D799DBCC210
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B8C944F5347
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 08:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19FA26E6F8;
	Fri, 10 Oct 2025 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GrMUYELy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927425B30E;
	Fri, 10 Oct 2025 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084864; cv=none; b=BX2yTkcDhAt1HoVHc6/Rx62Uh1nyRXYPIJbr4Wf1odFAIsI6DpYjlTttyc+S4s9aPefKQjNZoRiYILHtjzhJNOyAVMLoI/S6ImJ0mU17+vtVubeT7x9JJTghfTWvyIEttZ10eF7U4rbQjAvscYlpYhqkIhp8EnQBntbqWZGWfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084864; c=relaxed/simple;
	bh=2+RcnlQxS3+RIK9E0tYEPF/reHjktrNwea6lr8gji+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrWXgATb9fUmaVg5+5rAg4uTl9MhNnCk58gfj/UU32Z6YotNadzGhRDrfuQvFhz8eSfiEyw1dlq5tQQtuPRJwHo8QN/8MS86UE/YvlX7ZEqLX/9kIbG7bF1zsmoM+YkA1exthY5fgLpd5ss9/oxhFIWHPV8PORYpP3L7kya4klc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GrMUYELy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D095C664;
	Fri, 10 Oct 2025 10:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760084764;
	bh=2+RcnlQxS3+RIK9E0tYEPF/reHjktrNwea6lr8gji+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrMUYELyvjwwjUs9bSvtrKoNDuoK5DSgRnuT/U0NFBpsKkCRrLhTg94rId2kfyS1E
	 o/IkWfGjf9nFsniXZTqDc+qfA8+SUVrVNY+9ENEI8DioesJRRzsLgxDiLzJEfmpNiu
	 LZ+gaYhQR7KKKcyXuHc+nXcIE6qEmXcb4BER0LPc=
Date: Fri, 10 Oct 2025 11:27:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Chas Williams <3chas3@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 00/18] media: microchip-isc: Color correction and
 histogram stats
Message-ID: <20251010082731.GG29493@pendragon.ideasonboard.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
 <176008451125.756374.6436397947711705101@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176008451125.756374.6436397947711705101@ping.linuxembedded.co.uk>

On Fri, Oct 10, 2025 at 09:21:51AM +0100, Kieran Bingham wrote:
> Quoting Eugen Hristev (2025-10-09 21:11:17)
> > On 10/9/25 18:52, Balamanikandan Gunasundar wrote:
> > > Hi,
> > > 
> > > This patch series has a set of enhancements to the Microchip Image Sensor
> > > Controller driver. The objective is to expand its image processing
> > > capabilities and to improve the colors.
> > > 
> > > This series also introduces a new stats driver that exposes the histogram
> > > data to userspace via v4l2 controls. This allows applications such as
> > > libcamera to access real time image statistics for advanced image
> > > processing like automatic exposure, white balance adjustments etc.
> 
> How much data do you anticipate to be passing through controls? (What
> can the hardware provide in total if we look at the bigger picture to
> support the full device?)
> 
> For all other ISPs we've been working towards using structured parameter
> buffers to pass data - and we've been making that format extensible,
> which I think could also be a design that can apply to statistics.
> 
> This would greatly reduce the overhead of managing 'one control per
> value' ... or things like passing large tables (like a lens shading
> table perhaps) through controls.

V4L2 is standardizing on parameter buffers and statistics buffers for
ISPs. Using the same mechanism here will keep the driver in line with
other ISPs, which will help in userspace too.

> > > 
> > > Balakrishnan Sambath (11):
> > >   media: microchip-isc: Enable GDC and CBC module flags for RGB formats
> > >   media: microchip-isc: Improve histogram calculation with outlier
> > >     rejection
> > >   media: microchip-isc: Use channel averages for Grey World AWB
> > >   media: microchip-isc: Add range based black level correction
> > >   media: platform: microchip: Extend gamma table and control range
> > >   media: platform: microchip: Add new histogram submodule
> > >   media: microchip-isc: Register and unregister statistics device
> > >   media: microchip-isc: Always enable histogram for all RAW formats
> > >   media: microchip-isc: fix histogram state initialization order
> > >   media: microchip-isc: decouple histogram cycling from AWB mode
> > >   media: microchip-isc: enable userspace histogram statistics export
> > > 
> > > Balamanikandan Gunasundar (7):
> > >   media: platform: microchip: set maximum resolution for sam9x7
> > >   media: platform: microchip: Include DPC modules flags in pipeline
> > >   media: microchip-isc: expose hue and saturation as v4l2 controls
> > >   media: microchip-isc: Rename CBC to CBHS
> > >   media: microchip-isc: Store histogram data of all channels
> > >   media: videodev2.h, v4l2-ioctl: Add microchip statistics format
> > >   media: microchip-isc: expose color correction registers as v4l2
> > >     controls
> > > 
> > >  drivers/media/platform/microchip/Kconfig      |   2 +
> > >  drivers/media/platform/microchip/Makefile     |   2 +-
> > >  .../platform/microchip/microchip-isc-base.c   | 373 ++++++++++--
> > >  .../platform/microchip/microchip-isc-regs.h   |   3 +
> > >  .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
> > >  .../media/platform/microchip/microchip-isc.h  |  44 +-
> > >  .../microchip/microchip-sama5d2-isc.c         |   2 +-
> > >  .../microchip/microchip-sama7g5-isc.c         |  73 ++-
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> > >  include/linux/atmel-isc-media.h               |  13 +
> > >  include/uapi/linux/videodev2.h                |   3 +
> > >  11 files changed, 1001 insertions(+), 64 deletions(-)
> > >  create mode 100644 drivers/media/platform/microchip/microchip-isc-stats.c
> > 
> > This looks interesting.
> > I would like to see the compliance tool output for more platforms
> > (sama7g5, sama5d2, and the new sam9x7), also the media-ctl -p , to see
> > the topology with your new driver.

-- 
Regards,

Laurent Pinchart

