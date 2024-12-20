Return-Path: <linux-media+bounces-23916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EEE9F93F5
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 855E51889330
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3803215706;
	Fri, 20 Dec 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rb3b1UYt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E71C5488
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734703479; cv=none; b=RaXdFi/6+BcLl6NE6Es3cDdjnLNZOHUSKkORuRw3no1QBgcU5as2KSe1J5Y2jCQkaChH8YYYCTw3Ng0ro1bx8rr/1nZbvP66vQFQPguCH22Tj8zIMKQBwrT2CDPTMDkSp7jN15enBZCn9wiybcE3y+J2H+HQIba2QUAGOaoOBl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734703479; c=relaxed/simple;
	bh=/tZeoZB0ZvjFU9IBdQ6GpaXSRHZ7gSbkqDAyJD483JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwG4IY8aNecckM2R/R6I97filmJLUeE7rdwmMm0hzXhbC2kNQMjmAVLenHCEPW3DeB7PLvI4W77CdupVd4r+xKZiy2CfQ9hb6VykshmiXqiAHZEYKCleTt1LTuzVQNY97nv/+pGuKuYgjDsr/ZKLvgtQWGznil+sZhRt5hS7cYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rb3b1UYt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734703476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q84cOhwO/gh2wKP119w6rxHKwkv2btYxehwVYpmLgAc=;
	b=Rb3b1UYtizEoS/emASA9cWbSJ/TcO9dUm+hQqe9ihGQDoKJR3bDvWtjtILfUS2MC0t8pXD
	cJX7VgNb6EOhgsjtIXLIUT10mYkGOCBIPIbeF2UKwDApFIowYfrJJJDUl73/9fIFE9UffH
	C1XG4/cr/sQKK2MSUDOBcy8e7c7Dnxg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-5yB9jObKNLqNJckUr6AfxA-1; Fri, 20 Dec 2024 09:04:31 -0500
X-MC-Unique: 5yB9jObKNLqNJckUr6AfxA-1
X-Mimecast-MFC-AGG-ID: 5yB9jObKNLqNJckUr6AfxA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa67fcbb549so198387766b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734703470; x=1735308270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q84cOhwO/gh2wKP119w6rxHKwkv2btYxehwVYpmLgAc=;
        b=K9yNNWlK5wkJMF2u16ckU9+svje36RKeFbzv0Kzgnyy0I2CfxNhT1kSli4ag2cbOjU
         mZDjfwWfpBAavweE/K4XBR8mHS4Y+uxxnktudPjkjxIem5Dz7MkaPh1ZNbVa4dxsEIlY
         XhGemIjVjOLKW7CEpAjjoievmzFSpquIGA6UDWOZcBAr3gmfjTmK+XcEmhg8cC5bdDaK
         nPvLWVFyEHsd+hY1Ns1KjLYFRGXhJc+H4lrPlManPGC8GSpz2TCKNABCrQU7ZLjNlx08
         dZaskiyKtoF9t1oHMIy0VMl+pKOWPphsBNTrOA6LSSSnUst6kkxSdTSBB2RBRBrnaF4T
         +PwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfyuqHPb8rAKxa1zCAPxPytauQhzE9gNvixRph8TSy6fHVrTnEeRx1Rjx/bo/odqtac5udzGC64VNLVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3oWgJKu3iDQOpFDUpyuDQF0n7a1GwOfg5NM7nrJnKeVhphPp
	Ozc4f5LNhcltAQWXgDR4Cbgwk7pl/q67YieIi49cO6d/QvJ/1q7w4G0C4qFHmYJIdkQ0J6SmGlz
	68kwIUrydxc+6E+FxVST5+SzNGPYvcx5f3q3h9Kpc0AWUr1LEpVLV/6xYf5XH
X-Gm-Gg: ASbGncvnMlQSKVHJxkv7jLMKNdqF3fhTdlY1u7i2UYcK5Kz31u0O0GwQtC/ez8TRLiW
	97eRSuelPAWqYz5nTJJKSee+1HGzFCbVEY0wiKdd/DSfqAjWknDXLA/o/K4vfkPSJVhQpmS6XWM
	Pl6wCOpcHTknqukFiYIadZ2MsGxTtu/fOzOX4DbHRzRP3CkOtVeCRvIUUxTfsUtnfzTzY8OVUGR
	g27LkoyxNzq2Gwt0sBhCV+uvMVHgVt//fpj/N0461kVOd8K8dpv+lK9cd2wB4tev0WPxaL6DFeF
	0M+mm3Xc/bvsiH9FVQFm6KIC2erNOwXInHHsOnHRNAi33L/TwIx54ZOJHTPkelFS2S7sQcRxMJK
	neWrVoEGdulaTHwHkcrfYa44RJ16ctOE=
X-Received: by 2002:a05:6402:540b:b0:5d0:d610:caa2 with SMTP id 4fb4d7f45d1cf-5d81de1ed59mr2430233a12.26.1734703469634;
        Fri, 20 Dec 2024 06:04:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzc7mrrnLYxS0DiNVKfb2wD0BHNiqxYOh7c1Go+ZT2hg/l4h/ZeiKZ0DvvFSCHdTlLC8deBg==
X-Received: by 2002:a05:6402:540b:b0:5d0:d610:caa2 with SMTP id 4fb4d7f45d1cf-5d81de1ed59mr2430158a12.26.1734703469020;
        Fri, 20 Dec 2024 06:04:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed2a1sm1838221a12.67.2024.12.20.06.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:04:28 -0800 (PST)
Message-ID: <9aa3ac1f-606a-4071-9321-f027a39661a3@redhat.com>
Date: Fri, 20 Dec 2024 15:04:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor
 Lake doesn't work
To: "duanek@chorus.net" <duanek@chorus.net>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media
 <linux-media@vger.kernel.org>,
 libcamera-devel <libcamera-devel@lists.libcamera.org>
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net>
 <361614030.100297606.1734530611240.JavaMail.zimbra@chorus.net>
 <vb66ls2rs5fnr2yj2b5wktccevmrcwq4gztlh4vtezc6hej4vm@dtduyfphcezx>
 <1385342589.100511352.1734536762106.JavaMail.zimbra@chorus.net>
 <45xboahdow6gy7uanhrdsiln3zxcu4xdy7hew3usqtgurf7byj@wl7gvzgtzg5s>
 <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net>
 <a1dde87b-8b1d-4d6c-bd78-ec4e5bd78c97@redhat.com>
 <1405988041.103575290.1734655626318.JavaMail.zimbra@chorus.net>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1405988041.103575290.1734655626318.JavaMail.zimbra@chorus.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Dec-24 1:47 AM, duanek@chorus.net wrote:
> Dear Hans,
> 
> I appreciate your determination, and uploaded a dmesg file with "intel_skl_int3472_discrete.dyndbg" passed as a kernel parameter (I hope I did it right) to RH Bugzilla

Thanks I have posted a long comment on bugzilla, which I think can
mostly be ignored for now, because after that comment I learned of
a bug in my earlier attempt at fixing the ov08x40 driver thanks to
testing of my patches on an ARM device, quoting from my last comment
in bugzilla:

"Ugh, I just learned that my previous attempt to fix this on a "HP Spectre x360 14-eu0xxx" has a bug in one of my patches adding support to the driver to set the GPIO and clks on ACPI platforms, see:

https://lore.kernel.org/linux-media/e3573352-f73e-43f5-8e21-6c313dc54057@redhat.com/

That might very well explain why things do not work.

So poking GPIOs manually and running i2cdetect is probably not really necessary.

Instead what is likely necessary is building a kernel with the patches from this series added:
https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/

with the bug in that series which I linked to above fixed.

*and* with this patch added as well:
https://github.com/jwrdegoede/linux-sunxi/commit/c7803b1a32dab79f8a516e8aa9c08fb4ba74354d
"

I think that that should do the trick.

Regards,

Hans




> ----- On Dec 19, 2024, at 9:02 AM, Hans de Goede hdegoede@redhat.com wrote:
> 
>> Hi,
>>
>> On 18-Dec-24 5:25 PM, duanek@chorus.net wrote:
>>> Dear Jacopo,
>>>
>>> Thanks for forwarding to libcamera - I'm a newbie and am not sure who all should
>>> be involved.
>>>
>>> When I specify the camera, I get:
>>> duane@DuanesSpectre16:~/cameratest$ LIBCAMERA_LOG_LEVELS=0 qcam
>>> -c"\_SB_.PC00.LNK0"
>>
>> <snip>
>>
>>> [2:42:26.110235367] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>>> contiguous
>>> [2:42:26.113343648] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>>> contiguous
>>> [2:42:26.116390199] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>>> contiguous
>>> [2:42:26.119374839] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>>> contiguous
>>> [2:42:26.125329380] [29471] DEBUG Request request.cpp:369 Created request -
>>> cookie: 0
>>> [2:42:26.125505377] [29471] DEBUG Request request.cpp:369 Created request -
>>> cookie: 0
>>> [2:42:26.125523467] [29471] DEBUG Request request.cpp:369 Created request -
>>> cookie: 0
>>> [2:42:26.125531018] [29471] DEBUG Request request.cpp:369 Created request -
>>> cookie: 0
>>> [2:42:26.125546767] [29471] DEBUG Camera camera.cpp:1360 Starting capture
>>> [2:42:26.135295574] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1311
>>> /dev/video0[28:cap]: 3 buffers requested.
>>> [2:42:26.135380273] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>>> contiguous
>>> [2:42:26.135397476] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>>> contiguous
>>> [2:42:26.135407136] [29488] DEBUG Buffer framebuffer.cpp:351 Buffer is
>>> contiguous
>>> [2:42:26.135749405] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>> /dev/video0[28:cap]: Queueing buffer 0
>>> [2:42:26.294678108] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>> /dev/video0[28:cap]: Queueing buffer 1
>>> [2:42:26.294710299] [29488] DEBUG V4L2 v4l2_videodevice.cpp:1750
>>> /dev/video0[28:cap]: Queueing buffer 2
>>
>> Ok so we have set the mode on the camera, queued buffers, etc. and
>> everything is looking great. Except that unfortunately the camera/sensor never
>> starts streaming or at least no frames are received over CSI.
>>
>> Which matches with the dmesg from a later email in this thread which has:
>>
>> [  197.992581] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6
>> CSI2 0 failed with -5
>>
>> As Bingbu mentioned this means that the s_stream pad operation from the ov08x40
>> sensor driver has failed with -5, which means -EIO.
>>
>> I strongly suspect that this is the same issue as the one which I have been
>> debugging with another reporter with a "HP Spectre x360 14-eu0xxx" laptop
>> with a OVTI08F4 sensor.
>>
>> What is happening here is that we fail to properly power-on the sensor and
>> probe() defers identifying the sensor till stream_on time, combined with
>> a bug where stream_on actually is missing the call to identifty the sensor.
>>
>> So instead of getting an error about not being able to identify the sensor
>> instead we get the return value from the first failed ov08x40_write_reg()
>> call, which returns -EIO instead of propagating the actual error which is
>> -EREMOTEIO which indicates that the sensor is not responding to its i2c
>> address which typically means that we have failed to power the sensor on.
>>
>> I have posted a patch series which attempts to fix this here:
>> https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/
>>
>> But at least for the reporter with the HP Spectre x360 this does not
>> fix things, but it does make it much clearer that the i2c communications
>> with the sensor are failing with -EREMOTEIO.
>>
>> One interesting aspect here is that the INT3472 sensor-power-supply-device
>> on the HP Spectre x360 causes the following log messages:
>>
>> [   11.594911] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor
>> may not work
>>
>> which you are seeing too. Another interesting data point is that
>> this warning seen on your laptop:
>>
>> [   11.595033] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin number
>> mismatch _DSM 11 resource 107
>>
>> Points to \_SB.GPI0 which suggests that the sensor is directly connected
>> to GPIOs on the main SoC/CPU, and I expect "ls -l /sys/bus/i2c/devices" to
>> also show that it is using an I2C bus from the main Intel CPU/SoC rather
>> then using some IO-expander as we typically see on Dell and Lenovo designs.
>>
>> Duane, I have been getting a lot of emails about IPU6 not working and
>> I'm sort of loosing track of all of the issues which I'm handling.
>>
>> So now I'm working on tracking all the issues in Fedora's bugzilla,
>> I have filed a new issue to track this issue:
>> https://bugzilla.redhat.com/show_bug.cgi?id=2333331
>>
>> One thing which I'm wondering is if there maybe is a powerdown GPIO
>> which is not handled even after my patches. Can you add:
>> "intel_skl_int3472_discrete.dyndbg" to your kernel commandline,
>> reboot and then collect a new dmesg output ?
>>
>> If you are on Fedora then you can add this to your kernel
>> commandline by running:
>>
>> sudo grubby --update-kernel=ALL --args="intel_skl_int3472_discrete.dyndbg"
>>
>> If possible please attach the new dmesg output to:
>> https://bugzilla.redhat.com/show_bug.cgi?id=2333331
>>
>> If you don't have a bugzilla account yet, all that is required
>> to register is an email address, no other personal info is needed.
>>
>> If you don't want to use bugzilla directly, would it be ok if
>> I attach your dmesg output there?
>>
>> Regards,
>>
>> Hans
> 


