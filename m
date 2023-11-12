Return-Path: <linux-media+bounces-124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47997E8DDE
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 02:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0DF4280D93
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 01:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9600417D9;
	Sun, 12 Nov 2023 01:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kwlC4zx0"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512E315B5
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 01:22:42 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16082D59
	for <linux-media@vger.kernel.org>; Sat, 11 Nov 2023 17:22:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81A4D6CA;
	Sun, 12 Nov 2023 02:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699752135;
	bh=TqxMQ1LSOLa5VOx/RjWW/4y8zWRy+MH7CAveoJ9a+hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwlC4zx0NA7A2YzICftVOvHcl7umHQ4mHi1zZvN1y4YJ8spKhVCeinYjQk5D+7oN8
	 7J+WTG2+yX72YzRCbiyI4jWdyFTkPpMkCKwnS3bniQFx+EKLnUjUQ6o6HklQZFuARJ
	 qVqzR4EVW4NPNNL7LGhrVhF1UpxOIWFH7cvuAP+I=
Date: Sun, 12 Nov 2023 03:22:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] media: v4l: subdev: Always compile sub-device state
 access functions
Message-ID: <20231112012246.GA18216@pendragon.ideasonboard.com>
References: <20231110101049.890577-1-sakari.ailus@linux.intel.com>
 <20231110153940.GA7466@pendragon.ideasonboard.com>
 <ZU6diJrv-iKvcE9B@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZU6diJrv-iKvcE9B@kekkonen.localdomain>

Hi Sakari,

On Fri, Nov 10, 2023 at 09:15:52PM +0000, Sakari Ailus wrote:
> On Fri, Nov 10, 2023 at 05:39:40PM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 10, 2023 at 12:10:49PM +0200, Sakari Ailus wrote:
> > > Compile sub-device state information access functions
> > > v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
> > > now also used by plain V4L2 drivers.
> > 
> > What do you mean by "plain" V4L2 drivers here ?
> 
> Those that do not need MC: if you now disable MC in kernel configuration,
> these functions won't be available.

This covers subdev drivers (such as sensor drivers) too, not just host
drivers ? If so, shouldn't we also drop the dependency on
VIDEO_V4L2_SUBDEV_API from drivers/media/i2c/Kconfig ?

-- 
Regards,

Laurent Pinchart

