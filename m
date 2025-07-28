Return-Path: <linux-media+bounces-38578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5CB13D84
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A162D189AEDF
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECCE270547;
	Mon, 28 Jul 2025 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DsloWYd2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5826FDA3
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753713800; cv=none; b=gM0pexqv6HK+WFsAtqdjTmhgBXFRo+0ehguk7yrIlU3XF7BE6ODKTXyzXVnHxqkMnK6VaHCfiSDPEFA+i+J2w5fVIvOgBe4ygmLnKXryYWFMogGhgG8J6KupWAAHcm2TIBpLylQiS5/KgXY0kSu+jEKbyTOQQAs0TL9pJ3/C/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753713800; c=relaxed/simple;
	bh=WkKPSYBS6FUHA8FjjEP5RlAHTLvAsbfgNQ6puGvbD6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0hnBrmzrUPw+33uJyuv4h/FFmdxQzUKVo/+UpkvDFKxXyq08RhMvYG6uhn2sBL8xVpw4B7c9Pk5GJqQvl7M1/dCWjBXnOQqDpo0vvlNlgzbzGI3keTbgs0268RQ65A15OGl1A3/BJzhZjI8b0l0hQ0ZGNisn0kHQ5CV90sEbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DsloWYd2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4DC9022B;
	Mon, 28 Jul 2025 16:42:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753713752;
	bh=WkKPSYBS6FUHA8FjjEP5RlAHTLvAsbfgNQ6puGvbD6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DsloWYd2vAiz++13lS+cTOCJB2N2IGCPbDDgWdOgsWJJSfI7mwQ/6ykIoe/GLJ8in
	 q+616iEhFlRA5Pf/5cT8r9ahQfdeVb+FsTFYnKuF5lFOh9ctCpTgCGPWVn+dvMty/t
	 dfoTnglr1YZQG0PmDZKbvbDfQgesroKMnHnYAQos=
Date: Mon, 28 Jul 2025 17:43:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hans@jjverkuil.nl>, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 0/2] media: Make v4l2_subdev_stream_config private
Message-ID: <20250728144307.GJ787@pendragon.ideasonboard.com>
References: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>
 <gzp4zzk3ie6y47g5gp43kcyhmfh5f6gme5iep63pw2rqt72n4x@56qpwjgtvdlb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gzp4zzk3ie6y47g5gp43kcyhmfh5f6gme5iep63pw2rqt72n4x@56qpwjgtvdlb>

On Mon, Jul 28, 2025 at 04:04:10PM +0200, Jacopo Mondi wrote:
> On Mon, Jun 30, 2025 at 03:46:00AM +0300, Laurent Pinchart wrote:
> > Hello,
> >
> > This small patch series attempts to avoid usage of the
> > v4l2_subdev_stream_config structure in drivers. The rationale is that
> > the structure was meant to be an implementation detail. Recent
> > discussions about how we store stream config led to considering a need
> > to rework the internals, and usage of the structure in drivers makes
> > this more difficult.
> >
> > Patch 1/2 drops usage of the structure in the ds90ub913 driver, and
> > patch 2/2 then makes the structure private to v4l2-subdev.c.
> >
> > Ideally we should also make v4l2_subdev_pad_config private, but it has a
> > few more users:
> >
> > drivers/media/pci/saa7134/saa7134-empress.c
> > drivers/media/platform/atmel/atmel-isi.c
> > drivers/media/platform/intel/pxa_camera.c
> > drivers/media/platform/marvell/mcam-core.c
> > drivers/media/platform/renesas/renesas-ceu.c
> > drivers/media/platform/via/via-camera.c
> > drivers/staging/media/deprecated/atmel/atmel-isc-base.c
> >
> > All those drivers are video-centric drivers that use
> > v4l2_subdev_pad_config to implement TRY_FMT. I think we could use
> > v4l2_subdev_call_state_try() in those drivers, like done in
> >
> > commit f076057f0107c3ef890bfad8d6658387504e7f11
> > Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Date:   Fri Jul 1 14:15:59 2022 +0100
> >
> >     media: stm32: dcmi: Fix subdev op call with uninitialized state
> >
> > I however lack the ability to test that beside compile testing.
> >
> > Laurent Pinchart (2):
> >   media: i2c: ds90ub913: Stop accessing streams configs directly
> >   media: v4l2-subdev: Make struct v4l2_subdev_stream_config private
> >
> 
> Sorry, the series went ignored...

And of course in the meantime another user appeared in
drivers/staging/media/ipu7/ipu7-isys-video.c *sigh*

I'll see if I can send a v2 to address this.

> For both patches
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> >  drivers/media/i2c/ds90ub913.c         | 17 +++++++++--------
> >  drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
> >  include/media/v4l2-subdev.h           | 25 +------------------------
> >  3 files changed, 34 insertions(+), 32 deletions(-)
> >
> >
> > base-commit: c0b1da281d84d33281fc49289f0c7f8aada450ff
> > prerequisite-patch-id: e09080849e2b6fabfc70eb12b5c99c42111d3823

-- 
Regards,

Laurent Pinchart

