Return-Path: <linux-media+bounces-30686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9ECA962DA
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 10:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C919B7A957B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 08:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BECE26388C;
	Tue, 22 Apr 2025 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S8T5zhGO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AE2571AB
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311489; cv=none; b=W9hkOdC+B5Sq3TFHpepX63nIoAEa+H73cbFgZ5lN5v2K2IOxYp15qnnY66w6oe4FdLGYxrPm///9tpZItLTpEZhMVUaFkmaScyitsnvBgrAwgQOjuA187aDC6qgp3aruMlG4RUCBwRwdIQOQFbMLDJ8qzkrbH7wZTAXOjBDLXGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311489; c=relaxed/simple;
	bh=P47QWwCm1v9g4MBFhGt7X6yWDzEz0lF1K9o6O8AqT60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guvJmDbRID/Ecvra1K9T0JN6pYXeRwpMj+AbrQxqUxslI6yk4rK5iD+k9Fa/e9ElRu7eDXlgkGtEuzNPvNYA9/teN8Wp+3+v9t0PWNbN+ConGwQiYmKAqbUjgIsAck1mxhdIlRADl3t2TNTGWMNRiimeV+HlMBsbC9R00Nt47Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S8T5zhGO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745311486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+RdOtqSYZgJN9V7ZhicuRS1n/wY7Pa3OON81X9wpN0=;
	b=S8T5zhGOZZaxplduP/1AZHsikS2KHCI7oHeI6DK5o7W5Uezc5ABgFphHzZdD/ZQP8DsGin
	0n/QFQua80jAqIiLabOVWi8KbW8qfdRLzmpOCPgo8cro4anZUgP17SZeHVAIqYDhfUnEzK
	VWr7RE844gZC6clZl3/ErUaoRbAZ4XE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-M_Jx7AyOMS-FsZtmpGr7hg-1; Tue, 22 Apr 2025 04:44:44 -0400
X-MC-Unique: M_Jx7AyOMS-FsZtmpGr7hg-1
X-Mimecast-MFC-AGG-ID: M_Jx7AyOMS-FsZtmpGr7hg_1745311483
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab39f65dc10so630044266b.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 01:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311483; x=1745916283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+RdOtqSYZgJN9V7ZhicuRS1n/wY7Pa3OON81X9wpN0=;
        b=kjwnhyCNdvWqy+dWui0fvgpNYGpBrXtCAUdjJbJnOxkmLU+FOLuIcK1edktonWUpyO
         qB9h+PNJ+X25mvRxO8B5uEGifi3UhXWu+zpCwNP2ZG5eVU+sYqlFiShTpYWss9e/Eodw
         /6OP3+JCA1vFvrqiQdPQhjYfKP0cplmo+etP7qlBQ2fcRKLMq5ICiG3l9OdzuTxE0AtO
         pZBjm9LuHjpGbhoVlSFvzJ6fxfrEvCmWFTLDECp87E2hb9xnynn961Pb+Sxoe2PCnVpz
         lg64jvS/YZdf5E2R34BlSUoo7MnC/cN9TejM3XhQ3ShJwSVcI9aD3uEr8XxqDEdUwm2z
         RB7g==
X-Forwarded-Encrypted: i=1; AJvYcCVoXXnwZGVQ5Y5aaBjqeEjZ+FoTuU+S85goNs/yYAsKecPcJO4qSo6r4s9F9qhInmylUK0Rl2TbAIv+Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrakHhkr/RklfSNKWcY3EzoYXOGAEm0nYaczAd+wAC46Lzytw4
	YMLQQ6zfzBQwF0CJtajywMbNQr2AA+rHZg0aL4Xc7aus9gvGlqgThF4UsCbOjC1xicjTHk6/LVr
	4/AYYVXjio2fZFzsdTX+VG+7/WxSuWrENQNT0tnGuz8Q8eoxIpv/D7w7fiw7+
X-Gm-Gg: ASbGncskKHh+JSEhoA6xgfjF951wSOAHhy6/uk1Mc7mjFwRjC4REY0Yd5hAX4obuA7u
	0pHVWfNcXFSX4dXOq44sVXb5of1PZveb3os2MOjJPR3ZwZZ2BvBVwlTuA4ti8RJLpoVRIlZkcyw
	KI1VhIPLtY5BfoY1qUItWh4ZuBOfl3twV5xI9r9HDolalYlJmyF38MQv1/SqTGOhz8ZQwssqDfc
	ukR/izEWum+rYEnhQmXrlptR8Fyhtr6nbSoz7txUkKrJ/ioQOtd7dltB6yCZOAGJq0+hH1f2X/Y
	ouDC8Q/l80WCUwUNjYXO10fmA4kRI5OHDZ056iE52h4tXb50wdq02BVw09T0k8HkPznbEU52mTX
	Qhpf7o/bKX90tu+gc9k6e+lB9Gpqx6kxeT948t08Z/LRDSEL9yPg9pfUTgLcEwQ==
X-Received: by 2002:a17:906:5048:b0:acb:8aa6:5455 with SMTP id a640c23a62f3a-acb8aa666bbmr673103466b.19.1745311482867;
        Tue, 22 Apr 2025 01:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpgdWV71E14QWV9s59BE4ul4PG5ma83tK012XEEsIaRAbQGVP1sxKldI3T51XJVDSQc/mtRQ==
X-Received: by 2002:a17:906:5048:b0:acb:8aa6:5455 with SMTP id a640c23a62f3a-acb8aa666bbmr673100066b.19.1745311482404;
        Tue, 22 Apr 2025 01:44:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec5160csm635268866b.63.2025.04.22.01.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:44:41 -0700 (PDT)
Message-ID: <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com>
Date: Tue, 22 Apr 2025 10:44:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for
 v4l2_fwnode_device_parse
To: Ricardo Ribalda <ribalda@chromium.org>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org>
 <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
 <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On 22-Apr-25 2:23 AM, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>>
>> Hi Ricardo,
>>
>> Thanks for the patch.
>>
>> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
>>> This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.
>>>
>>> We initially add support only for orientation via the ACPI _PLD method.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
>>>  1 file changed, 52 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
>>> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
>>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
>>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
>>> @@ -15,6 +15,7 @@
>>>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
>>>   */
>>>  #include <linux/acpi.h>
>>> +#include <acpi/acpi_bus.h>
>>>  #include <linux/kernel.h>
>>>  #include <linux/mm.h>
>>>  #include <linux/module.h>
>>> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
>>>  }
>>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
>>>
>>> -int v4l2_fwnode_device_parse(struct device *dev,
>>> -                          struct v4l2_fwnode_device_properties *props)
>>> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
>>> +                                      struct v4l2_fwnode_device_properties *props)
>>> +{
>>> +     struct acpi_pld_info *pld;
>>> +     int ret = 0;
>>> +
>>> +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
>>> +             dev_dbg(dev, "acpi _PLD call failed\n");
>>> +             return 0;
>>> +     }
>>
>> You could have software nodes in an ACPI system as well as DT-aligned
>> properties. They're not the primary means to convey this information still.
>>
>> How about returning e.g. -ENODATA here if _PLD doesn't exist for the device
>> and then proceeding to parse properties as in DT?
> 
> Do you mean that there can be devices with ACPI handles that can also
> have DT properties?

Yes it is possible to embed DT properties in ACPI, but I don't
think that is really applicable here.

But we also have secondary software-fwnodes which are used
extensively on x86 to set device-properties on devices by
platform code to deal with ACPI tables sometimes having
incomplete information.

For example atm _PLD is already being parsed in:

drivers/media/pci/intel/ipu-bridge.c and that is then used to add
a standard "orientation" device-property on the sensor device.

This is actually something which I guess we can drop once your
patches are in, since those should then do the same in a more
generic manner.

> What shall we do if _PLD contradicts the DT property? What takes precedence?

As for priorities, at east for rotation it seems that we are going
to need some quirks, I already have a few Dell laptops where it seems
that the sensor is upside down and parsing the rotation field in
the IPU6 specific SSDB ACPI package does not yield a 180° rotation,
so we are going to need some quirks.

I expect these quirks to live in the bridge code, while your helper
will be called from sensor drivers, so in order to allow quirks to
override things, I think that first the "orientation" device-property
should be checked (which the ACPI glue code we have can set before
the sensor driver binds) and only then should _PLD be checked.

IOW _PLD should be seen as the fallback, because ACPI tables are
often a copy and paste job so it can very well contain wrong info
copy-pasted from some example ACPI code or from another hw model.

Regards,

Hans



