Return-Path: <linux-media+bounces-41629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A16B415B3
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 08:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2997680130
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 06:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C0C2D8DC3;
	Wed,  3 Sep 2025 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lxXdonWX"
X-Original-To: linux-media@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C45B2D6E5A
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882701; cv=none; b=t+MmODNgYCFe/ErdH2VAA6mwoVWCelnVX5Sc73Dtv+fa2oi778psDGBpUsiedtLzQtw6cxqw1fQ4UqFZe7MLQnNDtLOwA/y0o/1TVZpGfl0HR2qxQJCn7BSpxwnbunGEFMaWEjfBGYL0ej6CX0Qfjl6fvd15cw7Y/rwldjn4dMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882701; c=relaxed/simple;
	bh=wFwtaw5JKmGa2t1N8UizUX3V+rZ9tfd0qbxx7k9fI5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhkIVMgxoAlKlwvA1WbuddcAlEpnnqV6nce3QV5ylPwdGOO50I/pgZwdlAkpQQjrKl7GQRXQeVjfiB7hrz+FDxyxt88jjOTImhWUkmMU17vlf6QQmlvlMZgxXIpoKBmcYkEqbjTRtHZGSabJB6ELIe1V1G9FlIHGqQKeMCCWbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lxXdonWX; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 3 Sep 2025 08:58:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756882687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YjVuwKP23Mr05EDBQ+y2Yz4n3zI+tWOw8IGTziGJ+/0=;
	b=lxXdonWX+kF4O4dRRfN0FC0ZZc0o0hHeHqTRvEQ7X4t+PdqDmKXbxY/KHTU8uo3dm7is+M
	6T9+DmJtOYvy0pyHy7b6vl3O6pFBGamoPd2AcZamME2iT4r1yhkARYZnSwjoGRIfoDs9TM
	XPO0vgj741yYw3YHw0ddrk4gmMtfs2c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 06/10] media: i2c: ov9282: add hardware strobe signal
 v4l2 control
Message-ID: <ieqhz2bpvtnej7odzjz3laiudbib3q6j656ed5s7zk4n2nxafh@ci7sdkmdni7d>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-6-d58d5a694afc@linux.dev>
 <aLYIq6GxLgPM6ReC@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLYIq6GxLgPM6ReC@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

On Mon, Sep 01, 2025 at 11:57:15PM +0300, Sakari Ailus wrote:
> Hi Richard,
> 
> On Mon, Sep 01, 2025 at 05:05:11PM +0200, Richard Leitner wrote:
> > Add V4L2_CID_FLASH_HW_STROBE_SIGNAL enable/disable support using the
> > "strobe output enable" feature of the sensor.
> > 
> > All values are based on the OV9281 datasheet v1.53 (january 2019) and
> > tested using an ov9281 VisionComponents module.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 25 ++++++++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index f42e0d439753e74d14e3a3592029e48f49234927..ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> >  				current_val);
> >  }
> >  
> > +static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool enable)
> > +{
> > +	u32 current_val;
> > +	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > +				  &current_val);
> > +	if (ret)
> > +		return ret;
> 
> Please don't do assignments in variable declaration if that involves error
> handling.

Sure. Will fix that!

> 
> > +
> > +	if (enable)
> > +		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
> > +	else
> > +		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
> > +
> > +	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
> > +				current_val);
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >  		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
> >  				       (ctrl->val + ov9282->cur_mode->width) >> 1);
> >  		break;
> > +	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
> > +		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
> > +		break;
> >  	default:
> >  		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >  		ret = -EINVAL;
> > @@ -1326,7 +1346,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	u32 lpfr;
> >  	int ret;
> >  
> > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -1391,6 +1411,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  						OV9282_TIMING_HTS_MAX - mode->width,
> >  						1, hblank_min);
> >  
> > +	/* Flash/Strobe controls */
> > +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
> 
> This seems rather long.

It's exactly 100 chars wide, so from a policy point of view it should be
fine ;-). But I'm also fine with breaking it to 80 if you prefer?

> 
> > +
> >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >  	if (!ret) {
> >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

thanks!

regards;rl

