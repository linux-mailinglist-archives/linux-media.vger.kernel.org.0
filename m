Return-Path: <linux-media+bounces-37799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BACB065D1
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB745048D7
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 18:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6307529B220;
	Tue, 15 Jul 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="La8sp7w6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E325A331;
	Tue, 15 Jul 2025 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752603245; cv=none; b=gtpsXOF5StM+xVx9WP1QVITawAodcALRBzp1VKkm3ydWi3gmdskq98HknnRJrxKwOgFhS0mWdttvOUVfnXdbxI4iNVm2Xk8jmTOl+y2jbvwiy4Rqf4Q2xmJq9jv52ENELbPqY+Irgp1Ci2UVKjdrfwf6BdE/Sfv4xT0pvRB/q+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752603245; c=relaxed/simple;
	bh=UUc+1Uxt/NGdwKaSudHaVfxUE1XasUS3kZXNx6+A4wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOuClYzmdvx3cS5qpoGGwDklc028MpkkXu2Zgt8EoLNEGlnkpdkzf6g1KIqBqr/4oyDL/XJpKkkApD9wYm33UK/F2I3xPL38FD4KuOq3yJXVdH0yyrjo4XosWdPIwa5L+g9YEQQqwqh7hNOkxXlD1BYWcE7KRq+ilRBy6LWnM68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=La8sp7w6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A5E226A8;
	Tue, 15 Jul 2025 20:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752603207;
	bh=UUc+1Uxt/NGdwKaSudHaVfxUE1XasUS3kZXNx6+A4wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=La8sp7w64DnRhFJslCklYTYleM2y1ghpHzZqnlQ8iwbzRKCKSnS4SdF9NqRVzJo/Z
	 GbSYgaPQEl37HQJz6WR9hd1beGAT9pDJTQxXJw+hxIsgjAHORkwbM4R3KEQq+I2zXG
	 lmwqtIBC4P/4uPFKwo3yKRAP7GsOFImghE5jb9eA=
Date: Tue, 15 Jul 2025 21:13:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com,
	hao.yao@intel.com, mehdi.djait@linux.intel.com,
	dongcheng.yan@linux.intel.com, hverkuil@xs4all.nl, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	Phil.Jawich@amd.com
Subject: Re: [PATCH v4] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <20250715181358.GI20231@pendragon.ideasonboard.com>
References: <20250714205805.1329403-1-pratap.nirujogi@amd.com>
 <60cf7590-4fd8-419b-a782-8bc89fb5395a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60cf7590-4fd8-419b-a782-8bc89fb5395a@kernel.org>

On Tue, Jul 15, 2025 at 12:54:30PM +0100, Bryan O'Donoghue wrote:
> On 14/07/2025 21:51, Pratap Nirujogi wrote:
> 
> > +	ret = ov05c10_init_controls(ov05c10);
> > +	if (ret) {
> > +		dev_err(ov05c10->dev, "fail to init ov05c10 ctl %d\n", ret);
> > +		goto err_pm;
> > +	}
> 
> I would expect to see an "identify_module()" function here, something 
> similar to ov02c10.
> 
> ret = ov02c10_power_on(&client->dev);
> if (ret) {
>          dev_err_probe(&client->dev, ret, "failed to power on\n");
>          return ret;
> }
> 
> ret = ov02c10_identify_module(ov02c10);
> if (ret) {
>         dev_err(&client->dev, "failed to find sensor: %d", ret);
>          goto probe_error_power_off;
> }
> 
> ret = ov02c10_init_controls(ov02c10);
> if (ret) {
>         dev_err(&client->dev, "failed to init controls: %d", ret);
>          goto probe_error_v4l2_ctrl_handler_free;
> }
> 
> Standard practice is to try to talk to the sensor in probe() and bug out 
> if you can't.

It's actually not that standard, and is a frowned upon behaviour when
the sensor has a privacy LED GPIO connected to the power rail instead of
a hardware streaming signal. It would cause the privacy GPIO to flash at
boot time, which is considered a worrying behaviour for users. That's
why a few sensor drivers make runtime identification optional. We should
try to handle that in a standard way across all drivers, likely based on
a device property..

> With your current logic, the first time you'd realise no sensor was 
> present or is in reset etc is the first time you try to stream I think..
> 
> Definitely a good idea to probe for your sensor in probe failing the 
> probe if you can't find the hardware.

-- 
Regards,

Laurent Pinchart

