Return-Path: <linux-media+bounces-47963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A10C97C03
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 14:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B1893A2D3C
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 13:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B76F314B88;
	Mon,  1 Dec 2025 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JWl2k74K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B4E72622;
	Mon,  1 Dec 2025 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597507; cv=none; b=h8OEHgf1UGq+QDR6OF1IMerJZr2qFhluVe5B9XvKzTo6LQSPr6PnzizVSfP5r3iMOmvHrm+yvdXpGqRs6qHgHPhls74B/TREz+mjWZNsIsOHRwae02fJaWDRFanTmlHZa62TC1V713MWoZgZ1EJt2rLgxwigWv6llC8XD+uC86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597507; c=relaxed/simple;
	bh=zHD5i3VtRwVHKtO6HDuK6HWHuZ+m71EHvuPu7LGHDI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvaflD9ICLdsC6Z7CL8pFvK7QquAWU39Dt5Tn1GmLr59SLFnP1nSL6P8u6TnlTFsPvaZkVnljkcu8wql1LoRnji6TMBnX6yLqGVqIpDoZcIcZUeKGUWf/LnRUzOIDr4aGGytsZSj0hvWKmpI7gxvTwhnvfTei9H5b+3JMmH7R5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JWl2k74K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45895161;
	Mon,  1 Dec 2025 14:56:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764597369;
	bh=zHD5i3VtRwVHKtO6HDuK6HWHuZ+m71EHvuPu7LGHDI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWl2k74K5XuOwJ9YMF0vCHjB0jo9g/O9VUI81poYih/uoGjDR7LZ9KJGuIQox/yrx
	 W40xG1Zc3wEv8EH16Ko9FKV6rtLd4C9gjd8ed1jPtN0R/FkRqdamwHmI/FzC+Z4dzL
	 wmkILF1NExIXUs0utu0UuNuR1xswZpsgylGHA9PI=
Date: Mon, 1 Dec 2025 14:58:19 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, dave.stevenson@raspberrypi.com, jacopo@jmondi.org, 
	mchehab@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
Message-ID: <cp4pq3myb3gjwau2hzhkui5fx5mnp275ry5moas67qy5nrrigb@zezne7db74ov>
References: <20251201000026.690298-1-xiaolei.wang@windriver.com>
 <4553d9ed-ba4e-4f83-b48e-e819e7979293@oss.qualcomm.com>
 <aS2R0z_pHd64fpOf@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aS2R0z_pHd64fpOf@kekkonen.localdomain>

Hello

On Mon, Dec 01, 2025 at 03:02:11PM +0200, Sakari Ailus wrote:
> Hi Hans, Xiaolei,
>
> On Mon, Dec 01, 2025 at 10:31:59AM +0100, johannes.goede@oss.qualcomm.com wrote:
> > Hi,
> >
> > On 1-Dec-25 1:00 AM, Xiaolei Wang wrote:
> > > __v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
> > > contains an assertion to verify that the v4l2_ctrl_handler::lock
> > > is held, as it should only be called when the lock has already
> > > been acquired. Therefore use our own mutex for the ctrl lock,
> > > otherwise a warning will be  reported.
> > >
> > > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> >
> > Generally speaking as a default locking setup for sensor
> > drivers we are moving in the direction of removing driver
> > specific locks and instead using the control-handler
> > lock everywhere, including using it as the active state
> > lock, see e.g. :
> >
> > https://lore.kernel.org/linux-media/20250313184314.91410-14-hdegoede@redhat.com/
> >
> > which sets ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock
> > and then removes a bunch of manual mutex_lock / unlock calls
> > since all ops which get called with a sd_state will already
> > have the lock called when operating on the active_state
> > (and when called in try mode they should not touch anything
> > needing locking).
> >
> > Note if you also want to make the ctrl_handler lock
> > the active state lock then you need to add calls to
> > v4l2_subdev_init_finalize() / v4l2_subdev_cleanup()
> > to allocate the active-state to probe().
>
> I agree with the above, but the driver is old and it uses its own lock to
> serialise access to its data structures while it uses the control lock
> separately. So this looks like a bugfix that could be backported.
>
> I wonder if anyone still has a system with this sensor.

ov5647 is the rpi camera module v1, so I guess it's still around even
if a bit old. Dave in cc is the expert and maintainer of this driver.

Jai has a series in review to upstream all the remaining BSP patches
for this driver.
https://lore.kernel.org/all/20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com/

I'll cc him as well

>
> --
> Regards,
>
> Sakari Ailus
>

