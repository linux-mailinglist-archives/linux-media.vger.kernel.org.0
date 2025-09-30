Return-Path: <linux-media+bounces-43419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221DBAC6ED
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 12:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 938FD7A77F1
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 10:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89932F6198;
	Tue, 30 Sep 2025 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EB28MsHT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F3E218AD1;
	Tue, 30 Sep 2025 10:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227397; cv=none; b=V0+6PeqDBG+i4HHSNxzo3MDkmV4KwdVG0lPjOiycnl1ShMdqVDv0SJ1hIGZx56N0m+jMd6nublA4N3Hw+il6uUMiFy8DneUbQMYruvmIstIDVXoQnwOe0So/26e9EwAjj4fPqh2w0wR7IdojaEh96AVqIzfMFJUM5o7IvI2rtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227397; c=relaxed/simple;
	bh=JJyuhPS9cvJhhH392NVdpZy5/YDKI9Im/fRJvp2gzYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgUN7nXDlOIAdMun0EeBIMo94LrqJa+zNhDWuzq9R6zt4IIBw7ApL/gaZl+4yV0BeREa6TlcOJF0tGwATmtpixA/Cvb8xbRHVo9xw0Dh2iAPGV542a8P26CVqzA5xSMONm6fVQXA7ZN2Tz9MGF9NzWv+nX5VGFckXuF+DSSa27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EB28MsHT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A43A7982;
	Tue, 30 Sep 2025 12:15:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759227303;
	bh=JJyuhPS9cvJhhH392NVdpZy5/YDKI9Im/fRJvp2gzYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EB28MsHTRbdEej/CC6YghJ9Eo3P8+FbQJ1UqsMq0WpbxKzf4mwaLmEXwRS+YbJzAk
	 N45+x+jzf8P/Y+kDYqFNhsWhTKcRfuNUYgvUgvOuuc6cU8fzwZzWXTuR/Mnfma8Tn0
	 cd6B1AEJP0lk7qU3NaGOQbbhZfrH+sQM0WOCtodg=
Date: Tue, 30 Sep 2025 13:16:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Anthony McGivern <Anthony.McGivern@arm.com>,
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>,
	"florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>,
	"kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
	"Kieran Bingham (kieran.bingham@ideasonboard.com)" <kieran.bingham@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
Message-ID: <20250930101626.GE25784@pendragon.ideasonboard.com>
References: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
 <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>

On Tue, Sep 30, 2025 at 11:53:39AM +0200, Jacopo Mondi wrote:
> On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
> > On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
> > > Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
> > > contex. It extends 'struct media_entity_context' and is intended to be
> > > extended by drivers that can store driver-specific information
> > > in their derived types.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > I am interested in how the sub-device context will handle the
> > Streams API? Looking at the commits the
> > v4l2_subdev_enable/disable_streams functions still appear to operate
> > on the main sub-device only. I take it we would have additional
> > context-aware functions here that can fetch the subdev state from
> > the sub-device context, though I imagine some fields will have to be
> > moved into the context such as s_stream_enabled, or even
> > enabled_pads for non stream-aware drivers?
> 
> mmm good question, I admit I might have not considered that part yet.
> 
> Streams API should go in a soon as Sakari's long awaited series hits
> mainline, and I will certainly need to rebase soon, so I'll probably
> get back to this.
> 
> Have you any idea about how this should be designed ?

Multi-context is designed for memory to memory pipelines, as inline
pipelines can't be time-multiplexed (at least not without very specific
hardware designs that I haven't encountered in SoCs so far). In a
memory-to-memory pipeline I expect the .enable/disable_streams()
operation to not do much, as the entities in the pipeline operate based
on buffers being queued on the input and output video devices. We may
still need to support this in the multi-context framework, depending on
the needs of drivers.

Anthony, could you perhaps share some information about the pipeline
you're envisioning and the type of subdev that you think would cause
concerns ?

-- 
Regards,

Laurent Pinchart

