Return-Path: <linux-media+bounces-23799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5989F7D8F
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9E6416970D
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660812248B4;
	Thu, 19 Dec 2024 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZaW8mDF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19438762EF
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620540; cv=none; b=p3k5LdjG3idp5OKJ67JT48Bx1dD1WJdGOXkZ7/HrhSAmOegH9HMldl6xg8u3ldvy7/l6KE5Q8ZF+w7Jd0Jn6+Tr8UD1D2naidRzcaWlBbBB5MhZku2ZLGD5nlzVwqh+YxMr+zVHb1vk5IbFJkotxMmaTZldrpxRTk+LSAM6m59s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620540; c=relaxed/simple;
	bh=O3YqRYINKcIxpArFWzug4/2bq/krnxJCGAjL4sqZ0gw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nEBiVK2YjIxouI51LyEr21KW/Mcnu66OFEOHoqwciK6OTtC0/gMp5FRQbYdWvOydUPySHvRoKek2lcX8MhJXfeUYKEQEUy894ODimPPvAy22gt4luPooM0dh11ockiJEwpnZV8ag9FbNzVwaY6F63aIIGf3UNOyOaZ6cW4CdLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZaW8mDF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734620537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lzebbVOE974Vy6KuJn+7Pv9X/qJBD071aVxjVB5N4Q=;
	b=IZaW8mDFoXHubTONkoWvtKBTeegU/CkwUnqNRytWnMBFZ2oBI1hebFrSxmBzNlFvU6HR23
	fIo8tnNzkQtwytR25QKfi0vuk94znHrUkxZ8gMzw2dlwgSmWstH8HEwTpQki9HrYTJwcO4
	d8hZn+/TJJnTUYfLCAfUFBzdkPMx62o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-3GzMqG9ZPLmFQvNhYU5RfQ-1; Thu, 19 Dec 2024 10:02:16 -0500
X-MC-Unique: 3GzMqG9ZPLmFQvNhYU5RfQ-1
X-Mimecast-MFC-AGG-ID: 3GzMqG9ZPLmFQvNhYU5RfQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aab9f30ac00so76265866b.3
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 07:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734620532; x=1735225332;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lzebbVOE974Vy6KuJn+7Pv9X/qJBD071aVxjVB5N4Q=;
        b=g301pFGNLl0gef2Ppc1a3h7zitmi4FLSACk72g7yu1qUZLg/rbqt5k8BDP7LY1ytDO
         3ATEKfYARF75hNTFuWX1SKoE0xY9xxDZlT2Jf8SyepDhprsYAUjJU5XwXaAWjZR+vwIu
         z4Lw8qpaehZyng2+AfFzrpcjWxhid88KkGRAehsaNnzhHNEueiyR/yonl+RIb66Mr20v
         jolA0Mb9DR7lR01wUaBZMBG+yRp/jZnRjcTpoIDrPmzbyvgngHhh+DNgQ5KqxrIIfwD4
         CK8Vfx6lMeI60kdVAXV+Zh3CL0JyDub3Y4qFHCdq0rZK1WHSoun/MFXBYCWQsjM4O6RB
         qUyQ==
X-Gm-Message-State: AOJu0YzQjlh2g7SgtdsN7954gTZKdso5xlYSq1J1c9RJ/fqnzVehVaqt
	TtVEhdb+bRAEdRKqPeb/fxF54U4Qb0cpFDMpjoik4UOs7ySqNNEX1HKlVCwL/UbIuf266taw8qw
	Rysh9984aCh+Cgzodbhka5U0hKLWxIZlATOavDkdrqQGjbLWURlY1xoZ4S0WAUO8JZDd0UzU=
X-Gm-Gg: ASbGnct0UAAYNPTO1e6wWi169OPK3cSFI5zcUJdVoYNSBVFlNEE7ZtRq5f7eGwvwC7w
	jYDRIrx0povL2UTIW+yqBzihCN50FDdtdbgxRf4UeLlfphfIPa+hgEA91TT9Y0cPWEt7DisRnbp
	QMA3BSyBrkOYiGXEoy7JENS7P98aJplF9cou4BYPaw/kmrEYv6HP+lLsHwM6RYmJkbyG7KZ3T1j
	Clmkl4lLsFiY0uJBDbGjNFkepRWdKEByNELeM9adcZC7XeauTo7mD/yL3houQKhyvkphfQkyQXB
	f85Morr5g3RV+A6lPFMErqWP7qYJU1vPvThzbWjLth5VhrquT47phjahgeRRv4cS9jwCa7Xv9lr
	eH2u2vmnfDu2OurlpG7dDwEkHsuwe7Mc=
X-Received: by 2002:a17:906:31cf:b0:aab:9607:b6b1 with SMTP id a640c23a62f3a-aabf478a59cmr603703766b.26.1734620531588;
        Thu, 19 Dec 2024 07:02:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYoaHjaRpY8h8/GzZBb+e0aryh56imwEGNdH0JpcMnxlguJwKMo9D7JHvI2Hga1xRqj5BETQ==
X-Received: by 2002:a17:906:31cf:b0:aab:9607:b6b1 with SMTP id a640c23a62f3a-aabf478a59cmr603678266b.26.1734620529161;
        Thu, 19 Dec 2024 07:02:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f014decsm74082666b.149.2024.12.19.07.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:02:08 -0800 (PST)
Message-ID: <a1dde87b-8b1d-4d6c-bd78-ec4e5bd78c97@redhat.com>
Date: Thu, 19 Dec 2024 16:02:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor
 Lake doesn't work
To: "duanek@chorus.net" <duanek@chorus.net>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bingbu Cao <bingbu.cao@intel.com>
Cc: linux-media <linux-media@vger.kernel.org>,
 libcamera-devel@lists.libcamera.org
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net>
 <361614030.100297606.1734530611240.JavaMail.zimbra@chorus.net>
 <vb66ls2rs5fnr2yj2b5wktccevmrcwq4gztlh4vtezc6hej4vm@dtduyfphcezx>
 <1385342589.100511352.1734536762106.JavaMail.zimbra@chorus.net>
 <45xboahdow6gy7uanhrdsiln3zxcu4xdy7hew3usqtgurf7byj@wl7gvzgtzg5s>
 <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net>
Content-Language: en-US, nl
In-Reply-To: <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Dec-24 5:25 PM, duanek@chorus.net wrote:
> Dear Jacopo,
> 
> Thanks for forwarding to libcamera - I'm a newbie and am not sure who all should be involved.
> 
> When I specify the camera, I get:
> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 qcam -c"\_SB_.PC00.LNK0"

<snip>

> [2:42:26.110235367] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.113343648] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.116390199] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.119374839] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.125329380] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125505377] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125523467] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125531018] [29471] DEBUG Request request.cpp:369 Created request - cookie: 0
> [2:42:26.125546767] [29471] DEBUG Camera camera.cpp:1360 Starting capture
> [2:42:26.135295574] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1311 /dev/video0[28:cap]: 3 buffers requested.
> [2:42:26.135380273] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.135397476] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.135407136] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is contiguous
> [2:42:26.135749405] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[28:cap]: Queueing buffer 0
> [2:42:26.294678108] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[28:cap]: Queueing buffer 1
> [2:42:26.294710299] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750 /dev/video0[28:cap]: Queueing buffer 2

Ok so we have set the mode on the camera, queued buffers, etc. and
everything is looking great. Except that unfortunately the camera/sensor never
starts streaming or at least no frames are received over CSI.

Which matches with the dmesg from a later email in this thread which has:

[  197.992581] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6 CSI2 0 failed with -5

As Bingbu mentioned this means that the s_stream pad operation from the ov08x40
sensor driver has failed with -5, which means -EIO.

I strongly suspect that this is the same issue as the one which I have been
debugging with another reporter with a "HP Spectre x360 14-eu0xxx" laptop
with a OVTI08F4 sensor.

What is happening here is that we fail to properly power-on the sensor and
probe() defers identifying the sensor till stream_on time, combined with
a bug where stream_on actually is missing the call to identifty the sensor.

So instead of getting an error about not being able to identify the sensor
instead we get the return value from the first failed ov08x40_write_reg()
call, which returns -EIO instead of propagating the actual error which is
-EREMOTEIO which indicates that the sensor is not responding to its i2c
address which typically means that we have failed to power the sensor on.

I have posted a patch series which attempts to fix this here:
https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/

But at least for the reporter with the HP Spectre x360 this does not
fix things, but it does make it much clearer that the i2c communications
with the sensor are failing with -EREMOTEIO.

One interesting aspect here is that the INT3472 sensor-power-supply-device
on the HP Spectre x360 causes the following log messages:

[   11.594911] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work

which you are seeing too. Another interesting data point is that
this warning seen on your laptop:

[   11.595033] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin number mismatch _DSM 11 resource 107

Points to \_SB.GPI0 which suggests that the sensor is directly connected
to GPIOs on the main SoC/CPU, and I expect "ls -l /sys/bus/i2c/devices" to
also show that it is using an I2C bus from the main Intel CPU/SoC rather
then using some IO-expander as we typically see on Dell and Lenovo designs.

Duane, I have been getting a lot of emails about IPU6 not working and
I'm sort of loosing track of all of the issues which I'm handling.

So now I'm working on tracking all the issues in Fedora's bugzilla,
I have filed a new issue to track this issue:
https://bugzilla.redhat.com/show_bug.cgi?id=2333331

One thing which I'm wondering is if there maybe is a powerdown GPIO
which is not handled even after my patches. Can you add:
"intel_skl_int3472_discrete.dyndbg" to your kernel commandline,
reboot and then collect a new dmesg output ?

If you are on Fedora then you can add this to your kernel
commandline by running:

sudo grubby --update-kernel=ALL --args="intel_skl_int3472_discrete.dyndbg"

If possible please attach the new dmesg output to:
https://bugzilla.redhat.com/show_bug.cgi?id=2333331

If you don't have a bugzilla account yet, all that is required
to register is an email address, no other personal info is needed.

If you don't want to use bugzilla directly, would it be ok if
I attach your dmesg output there?

Regards,

Hans




