Return-Path: <linux-media+bounces-41991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0612B48C5B
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBD941B25B5B
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D342E9757;
	Mon,  8 Sep 2025 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hK+SkrDw"
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937B1C8605
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757331528; cv=none; b=VvsKRJklPHRJ3GSHXLYtFLJ5E4+LaszxYzIzY/kCQJuFJ92vH2S6q7tY9u6ahEq3AKRHlpJOb2swG4fS7UHDox5LZRwYgnSMbJutYZmIbj17I3zO04X6COMvNYJE8sU02wPm5hZc9YxIRa0jlLV7O5jQ+ORZ4ci0WsiH33XV36k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757331528; c=relaxed/simple;
	bh=78HQTbMxkxICVwNrNUz/nBn6v8URdG0pSjB6Se329gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qtof3/2e51hhjn+Aypq1Hx9dgdzJlp0aMv096vlYHAJFQ8XpS9zUZWtiZ0owIRUTWeainNyEgujsWF1gI5rNV6A9rFDQoGzNXYCcx5u8I3e9uG4omKWZE/q8/xUXnb431Kmf44cEaKLCR368DUjqGIkqmXGUvR9A7+7sonzAfR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hK+SkrDw; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 8 Sep 2025 13:38:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757331525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HM+3u8vSgO7cECxpJBI6TasYUQutn7K+Scs1YfDyRPM=;
	b=hK+SkrDw8cFmp4A8S6xqcyzYQKVshAka7iQlthmE/qCWs5LXnOIQOQ466ervxGpOkdpw3V
	evm03lABFeZ4IBUhCrJukTAKS5gnurvb2S44SEAGbehFF9Iy3xT+SpwTopeYIONFwieP7A
	ej3Zxc9VFPniIuiroTKIxMOa2CK4odg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 08/10] media: i2c: ov9282: add strobe_source v4l2
 control
Message-ID: <pr42kk7pxmj7p5sdakgqgu5f2kacifublyjn5cp3nkfjqivub7@czcsi2da6nmi>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-8-d58d5a694afc@linux.dev>
 <20250907202049.GD19568@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250907202049.GD19568@pendragon.ideasonboard.com>
X-Migadu-Flow: FLOW_OUT

Hi Laurent,

thanks for your feedback!

On Sun, Sep 07, 2025 at 10:20:49PM +0200, Laurent Pinchart wrote:
> Hi Richard,
> 
> Thank you for the patch.
> 
> On Mon, Sep 01, 2025 at 05:05:13PM +0200, Richard Leitner wrote:
> > Add read-only V4L2_CID_FLASH_STROBE_SOURCE control. Its value is fixed
> > to V4L2_FLASH_STROBE_SOURCE_EXTERNAL as the camera sensor triggers the
> > strobe based on its register settings.
> 
> I don't think you should implement this control in the sensor driver. It
> should only be implemented in the flash controller driver to select the
> source.

Totally true. This was introduced in the first version of this series to
enable the flash output. Now as we have V4L2_CID_FLASH_STROBE_SOURCE (or
however it will be named finally) this, for no reason, became a read-only
property. This shouldn't be there at all.

Thanks for the catch. I will remove it from the series!

> 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index c405e3411daf37cf98d5af3535702f8321394af5..9efc82a1929a76c6fb245e7dbfb5276a133d1c5d 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -1368,11 +1368,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
> >  	const struct ov9282_mode *mode = ov9282->cur_mode;
> >  	struct v4l2_fwnode_device_properties props;
> > +	struct v4l2_ctrl *ctrl;
> >  	u32 hblank_min;
> >  	u32 lpfr;
> >  	int ret;
> >  
> > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -1443,6 +1444,14 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >  	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
> >  			  0, 13900, 1, 8);
> >  
> > +	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
> > +				      V4L2_CID_FLASH_STROBE_SOURCE,
> > +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL,
> > +				      ~(1 << V4L2_FLASH_STROBE_SOURCE_EXTERNAL),
> > +				      V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
> > +	if (ctrl)
> > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >  	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
> >  	if (!ret) {
> >  		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

thanks again!

regards;rl

