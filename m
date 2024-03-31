Return-Path: <linux-media+bounces-8264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B17CE893146
	for <lists+linux-media@lfdr.de>; Sun, 31 Mar 2024 12:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E30521C2109E
	for <lists+linux-media@lfdr.de>; Sun, 31 Mar 2024 10:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129CF143C7C;
	Sun, 31 Mar 2024 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b="aBNd2L+h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80914143C76
	for <linux-media@vger.kernel.org>; Sun, 31 Mar 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711882299; cv=none; b=O3RVNf0eJkOR2gQhUG9moH8fZBx5+IxQGzCM0/cWN9amd2sriAUhVDLzOxSV9cCpieBzjmPq9UdF+MSxpxt/JgfDKzl4eAiz97el036h42cFUXUfVbbdzGKDh1iEnSwx6Wm5PahzrJFqHt/RWHBTgckOI/xmgJk4DTSCrabZiRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711882299; c=relaxed/simple;
	bh=pcdIiEhM2l/zdXKf8Ui9dBMz5cNT2DJKO3WWCjp2iwA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:In-Reply-To:
	 Content-Type; b=tg8bZY2dtxCS/LQ2rEDqAYeo3iIZiYJqGm+lmeGEpUPJGSG24mUC+Jv0W6BBOspgXqWU7rPckFyGkmDh/xWs/WS2RKGPukjCE0pdEmP/uTjef+U2NS7TBRg0I9rzb6cTMn5m7ad/VNXZOvbLOsoIz/L1NKHAnsSlxh+5hYAU4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in; spf=none smtp.mailfrom=cpp.in; dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b=aBNd2L+h; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cpp.in
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0d82d441bso29832995ad.3
        for <linux-media@vger.kernel.org>; Sun, 31 Mar 2024 03:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cpp-in.20230601.gappssmtp.com; s=20230601; t=1711882294; x=1712487094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiyEjUctzgw3d5cbSMfpqrqZz263bg9AlN7/QV97RU8=;
        b=aBNd2L+hxc81bM21Uuez4jAwYVhyEEzN3xKS7QvFuFW4PI2WG/FxYGyOYqHxNsMKCB
         jQ9UtS+1P4SsPfvuk/t4r1ic1ZBG1pmMlez99z1keJ2q974Zz7OJqCcbzrdg05MZ0KGW
         z23AgaOwVKeiEV/Xyilcfmt37fWzoKdl6Cq+v7qmjd7E1M9ox4Y3qUuRfonKeA9or6wS
         7mIn1z03Jn+JD+tiOHWrYk+w1aYwTF0dsS/GeCIOt0xCytsbpqEJ+X9oizkuf81r/N03
         gxNF0zpGtRCFhs3uLpThM3vcDAaDgFINvtshtiVGerG279tm5nyA1/Q1Vo8ZF2TGWMCD
         UvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711882294; x=1712487094;
        h=content-transfer-encoding:in-reply-to:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiyEjUctzgw3d5cbSMfpqrqZz263bg9AlN7/QV97RU8=;
        b=cvBgTV8iZmuwWSb76HxAu3REXNEkt+zHc1DC0qhN/XMq75luO4s6gvKgxUqg0OWi0G
         UTI978LxSGEi/YqPAU53Wvo39o9QESLoTfkaLfRWPopCgfp4XwfGNxU4h8B8S7S+e1km
         9fxaxwOVLP2I5/iboqvLpzV7Ff70kFNtUxYY5nRepyhb9T1ubIZo0dOn2atexOyTkCrj
         cPpWoMaZ0sY5KOv9d+MMsKLWHG6lpAy6+EYi8nh00foOPTV3n6J1qIWpbV/C2TI8meaq
         th8Tx3BLaohShcVgqkq3PNq8r+mBE2+T29aBh5oQTLl52w/+MUGCB6UVvyczoWGh7RHt
         2XEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ox1XN6X9k72u+nmstYAR6PH3Z9QoUHXNPcOC5gkyadLkuf2J5xGllCZqTwSeHgVcCxL5WOQc33hhddOtU2C+EDKWU7u1G/pR9ZI=
X-Gm-Message-State: AOJu0Yy46kXPTGeUogifqxbT8himsT+6/TfWYZsMOvjhvSZDjqTXASWK
	NlZu7d2d4vLYrYL8BwmYRSpXF+6Js7oKvKg/tZU/6GyiMevVKlolnim/WkgSmQ==
X-Google-Smtp-Source: AGHT+IGbCXPjBovSTHKR9172xf/YfQYGs9t0Y+nud/nfFHTvv80yMaWcmcBoZV1xkyeTwbzmrc7sPQ==
X-Received: by 2002:a17:903:228e:b0:1e0:b687:c5d1 with SMTP id b14-20020a170903228e00b001e0b687c5d1mr8767015plh.64.1711882294570;
        Sun, 31 Mar 2024 03:51:34 -0700 (PDT)
Received: from [192.168.3.23] (mx-ll-180.183.76-49.dynamic.3bb.co.th. [180.183.76.49])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902ea0700b001e0a7e617d9sm6642277plg.82.2024.03.31.03.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Mar 2024 03:51:34 -0700 (PDT)
Message-ID: <bde342c6-be23-4afa-978f-9503e3c11223@cpp.in>
Date: Sun, 31 Mar 2024 13:51:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anthony I Gilea <i@cpp.in>
Subject: Re: [PATCH] platform/x86: int3472: Add handshake GPIO function
To: hdegoede@redhat.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 bingbu.cao@intel.com, dan.scally@ideasonboard.com, djrscally@gmail.com,
 hao.yao@intel.com, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, sakari.ailus@intel.com
Content-Language: en-US
In-Reply-To: <186830d2-dd18-7948-b2c5-bcda934ad3e8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hello,

I'm trying to get camera on HP Spectre x360 14-eu0xxx (2024) laptop to work.
I was able to make main sensor driver (ov08x40) to play nice with IPU6,
INT3472 and libcamera-SoftISP and the resulting image quality is absolutely
usable and even surprisingly good.

This laptop also uses this "MIPI aggregator".


> Hi,
> 
> On 10/7/23 04:12, Hao Yao wrote:
> > Handshake pin is used for Lattice MIPI aggregator to enable the
> > camera sensor. After pulled up, recommend to wail ~250ms to get
> > everything ready.
> 
> If this is a pin on the "Lattice MIPI aggregator" and
> not on the sensor itself then this really should be
> modeled as such and should not be registered as a GPIO
> consumed by the sensor since the actual sensor does not
> have a handshake pin at all.
> 
> Also we really don't want to need to patch all involved
> sensor drivers to toggle a handshake pin, especially since
> the sensor itself does not physically have this pin.
> 
> Can you explain a bit more:
> 
> 1. What the "Lattice MIPI aggregator" is.
> 2. What its functions are, does this control reset + pwdn
>    GPIOs for the sensor? Voltages to the sensor? Clk
>    to the sensor ?

It acts like MIPI switch as no MIPI data gets from the sensor to IPU6 if
handshake signal is not asserted. Eventually IPU6 times out with "start stream
of firmware failed" message. Any further attempts to start streaming lead to
a panic.

I2C communication is not affected by the handshake signal but it looks like
reset signal is also going through this "MIPI aggregator" as it takes about
150ms for the sensor to reliably start responding via I2C after the reset
is deasserted. It should be about few ms if the reset signal was connected to
the sensor directly.

> 3. How the aggregator is connected to both the main
>    CPU/SoC as well as how it is connected to the sensor ?
>    Some example diagram would be really helpful here.
> 
> Then with this info in hand we can try to come up
> with a way how to model this.
> 
> Assuming this controls the entire power-up sequence
> for the sensor then I think it could be modelled
> as a GPIO regulator. This also allows making the
> regulator core take care of the necessary delay
> between setting the GPIO and trying to talk to
> the sensor.

Are there any updates on how this signal should be implemented? For now I'm
just applying this patch and asserting it from the sensor driver.

Regards


> 
> Regards,
> 
> Hans
> 
> 
> 
> > 
> > Signed-off-by: Hao Yao <hao.yao@intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/platform/x86/intel/int3472/common.h   | 1 +
> >  drivers/platform/x86/intel/int3472/discrete.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> > index 655ae3ec0593..3ad4c72afb45 100644
> > --- a/drivers/platform/x86/intel/int3472/common.h
> > +++ b/drivers/platform/x86/intel/int3472/common.h
> > @@ -23,6 +23,7 @@
> >  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
> >  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
> >  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> > +#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
> >  
> >  #define INT3472_PDEV_MAX_NAME_LEN				23
> >  #define INT3472_MAX_SENSOR_GPIOS				3
> > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> > index b644ce65c990..4753161b4080 100644
> > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > @@ -111,6 +111,10 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
> >  		*func = "power-enable";
> >  		*polarity = GPIO_ACTIVE_HIGH;
> >  		break;
> > +	case INT3472_GPIO_TYPE_HANDSHAKE:
> > +		*func = "handshake";
> > +		*polarity = GPIO_ACTIVE_HIGH;
> > +		break;
> >  	default:
> >  		*func = "unknown";
> >  		*polarity = GPIO_ACTIVE_HIGH;
> > @@ -201,6 +205,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
> >  	switch (type) {
> >  	case INT3472_GPIO_TYPE_RESET:
> >  	case INT3472_GPIO_TYPE_POWERDOWN:
> > +	case INT3472_GPIO_TYPE_HANDSHAKE:
> >  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
> >  		if (ret)
> >  			err_msg = "Failed to map GPIO pin to sensor\n";
> 

