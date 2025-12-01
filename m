Return-Path: <linux-media+bounces-47985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A29C982CD
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 17:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31E423A2617
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 16:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C493333457;
	Mon,  1 Dec 2025 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GNABcPxj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E9332EAB
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605229; cv=none; b=jft541MORXPMxXiG+dwUGKFXaQP+AxNoENRqK1GRx+OkZT/9O2StnaiAapvj0fmwYk5dlyYBw5IQ6alwTt0C7uv3/nC7ELf3aQDTtfff9Z20FfZXqO0djmPu44JIzj1/l4zpCO0NrONAFHb9I7qA4XmR7OI4ED6OPTNWq2pF7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605229; c=relaxed/simple;
	bh=c0s1Bpv9SIJtLgO+MFj7pYgKnWbXZmC//uAC5eGqd1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3p5orc06Bjr3gButipWVuDvBwymMeA5d49eSkLY49m0jtR0SH1EfVmBN8BWSTAtby/sEaQLvhNQd7SkuYUmEf8/6whMJygRxR8L5wzmjRTD52E5enm7HMNQ8si7dCOLM4FOCQeKxEVEJ1YwMdo3+k5JZ/Qf4unOqIJ1IztFGtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GNABcPxj; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-640d4f2f13dso4028456d50.1
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1764605226; x=1765210026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e+GUj4l2rAJUYnUE8POrzf1i4JPBTbLojun0fOHCQLk=;
        b=GNABcPxjsX8pKJBHspOZ5Qg9LAmQnT0e3AiYIx8DQrQs5bhFi1pn6+jcgDHbNzbGfQ
         HUKsMdzYCLD9U2qFvZYv46pvg7Ht4GQg3S6PKdd29L//FC7hSzIxeU7mWbCk6rytMgxD
         kWp62/qfU1o6MxdpAXQCwbhe8w/EDkv62ELbSs46REffPE+lgmq0QilErzExHTgUtWdC
         iKdLEyQeCYDtvCFZzAQQ8asec/MQl2vh7qjYe+7lcR4oD1BnLlpjaAakZxaWWHqJ8h9M
         FYU1xipX6hIsUWmWbD42wMKpKYzkJ+lXxeI2uO+rrLlf0nDTKzCL08+YCo+ecOc4qZIu
         y58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605227; x=1765210027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+GUj4l2rAJUYnUE8POrzf1i4JPBTbLojun0fOHCQLk=;
        b=IskeLCWyXw90ihVDV5IF7CBkkUh0qpXi1bghv3X0AP6x8Rh/+xm5modIrksdFwQz6L
         sHjnR9W9GczcHA2lIu5/xe5cWd/W7XcYKxGJ8wyoqnu2v7fEayNINLamiWMXFZ7TSSQz
         qdize0LeJ7f4IxfCW+GILYJvYl5dmHw7+vd4WIxNaMsgz6XdSiGVabXgSTmbUMYQo7b5
         64w0qbPd8C2Y4qVRYqKwHPMBQwKtQtPn0myjrmaOfivBbRTb4+QeBv3qKvJmNNRid+5V
         g2Opaw7Mcy5NRjhL+XeCa2ztSprYxepNDMJe+DtsUqPD4hzZtiw7JWsse+Gaos7Manev
         CvCw==
X-Forwarded-Encrypted: i=1; AJvYcCU12z6J9gdyg0XqMLYKX/hgM3Ytk2XWs6XSBJYkMut+vYURiOi+R3P36WypLXS/fEu4ElvsZ0QjVKy6qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxabGFw+fbwTNnDCpcL5ieg0Rd70qzPuBnso5QfLQwyOhzNeINd
	1TokcLDTSP6GEc0NrJwwO/XaHQgWlplpSKk93ItyeZIpUpryq7NA0RCWI/G6OfApPL00BQ5e5yG
	w/Q/ZkppeoRb39xIu+8OG9sJnhk+YPpka0AMfksPA6g==
X-Gm-Gg: ASbGncsEaqCI3dIqZwx/j62NVdN/MPwXgD5EfDj596EKLbjWpFELlb/s7zZQh0dosRM
	gJQd8uqBNfv0ZeN4oraVz2nEgghZJSVJiWSUzA6seafCFNJdQGy7kQv0TlDS9FnhRxeD1c7oJ/D
	HZHg8BwabwBzVy7bLq6I7Edxorz4LA5yb+8FjiEpqMakoelEWpuVosaStQ0tikJM423vjs3bLv+
	TzvaD1eHWufBgEwYHJkt8V++dpS9PByBFQ8CidvhYPT//wOY1A5apOk7nngcQs9uoaCTgRY/fwQ
	q7KcjX2Ujppv2aGWJa5Cds18dAU=
X-Google-Smtp-Source: AGHT+IFJLCIBjC3GyN+zfktvsURYsuAMKMhR7lJGonUfr2PybOCbYOMQXw9BWaix5ZQ9kWj4E9hU6vquSCi7u7o3X8E=
X-Received: by 2002:a53:b10a:0:b0:640:d303:3523 with SMTP id
 956f58d0204a3-6432934817cmr17176653d50.50.1764605226195; Mon, 01 Dec 2025
 08:07:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201000026.690298-1-xiaolei.wang@windriver.com>
 <4553d9ed-ba4e-4f83-b48e-e819e7979293@oss.qualcomm.com> <aS2R0z_pHd64fpOf@kekkonen.localdomain>
 <cp4pq3myb3gjwau2hzhkui5fx5mnp275ry5moas67qy5nrrigb@zezne7db74ov>
In-Reply-To: <cp4pq3myb3gjwau2hzhkui5fx5mnp275ry5moas67qy5nrrigb@zezne7db74ov>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 1 Dec 2025 16:06:49 +0000
X-Gm-Features: AWmQ_blNg8KbEQdKP9_fgV3XmVwk3gwUAM2iKX1JWAnczZnCzRNWWSohnJ5iWp8
Message-ID: <CAPY8ntCXb4R48bNCf0EdHeLSiA2xh62Y+=Uq9XRWNEEv2xrnHw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, johannes.goede@oss.qualcomm.com, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, jacopo@jmondi.org, mchehab@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, laurent.pinchart@ideasonboard.com, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Mon, 1 Dec 2025 at 13:58, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hello
>
> On Mon, Dec 01, 2025 at 03:02:11PM +0200, Sakari Ailus wrote:
> > Hi Hans, Xiaolei,
> >
> > On Mon, Dec 01, 2025 at 10:31:59AM +0100, johannes.goede@oss.qualcomm.com wrote:
> > > Hi,
> > >
> > > On 1-Dec-25 1:00 AM, Xiaolei Wang wrote:
> > > > __v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
> > > > contains an assertion to verify that the v4l2_ctrl_handler::lock
> > > > is held, as it should only be called when the lock has already
> > > > been acquired. Therefore use our own mutex for the ctrl lock,
> > > > otherwise a warning will be  reported.
> > > >
> > > > Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> > >
> > > Generally speaking as a default locking setup for sensor
> > > drivers we are moving in the direction of removing driver
> > > specific locks and instead using the control-handler
> > > lock everywhere, including using it as the active state
> > > lock, see e.g. :
> > >
> > > https://lore.kernel.org/linux-media/20250313184314.91410-14-hdegoede@redhat.com/
> > >
> > > which sets ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock
> > > and then removes a bunch of manual mutex_lock / unlock calls
> > > since all ops which get called with a sd_state will already
> > > have the lock called when operating on the active_state
> > > (and when called in try mode they should not touch anything
> > > needing locking).
> > >
> > > Note if you also want to make the ctrl_handler lock
> > > the active state lock then you need to add calls to
> > > v4l2_subdev_init_finalize() / v4l2_subdev_cleanup()
> > > to allocate the active-state to probe().
> >
> > I agree with the above, but the driver is old and it uses its own lock to
> > serialise access to its data structures while it uses the control lock
> > separately. So this looks like a bugfix that could be backported.
> >
> > I wonder if anyone still has a system with this sensor.
>
> ov5647 is the rpi camera module v1, so I guess it's still around even
> if a bit old. Dave in cc is the expert and maintainer of this driver.

Raspberry Pi stopped selling OV5647 in about 2016 after Omnivision
gave a last-time-buy date in 2014/5, and we brought out the v2 camera
module based on imx219. However there are still modules being sold
even now - stick "OV5647" into eBay or Amazon and you'll get loads of
hits.

We still support the modules, but have little enthusiasm for investing
significant development effort into it whilst it remains functional.

As this is a bug fix for a genuine issue and has minimal impact, I'd
be tempted to accept it. Reworking the driver to use the same mutex
and all the subdev state can be done at a separate time (unless
Xiaolei is really keen to do it now).

  Dave

> Jai has a series in review to upstream all the remaining BSP patches
> for this driver.
> https://lore.kernel.org/all/20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com/
>
> I'll cc him as well
>
> >
> > --
> > Regards,
> >
> > Sakari Ailus
> >

