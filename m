Return-Path: <linux-media+bounces-28622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95A6A6D843
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 11:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4851F16889E
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 10:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2AC25DAEF;
	Mon, 24 Mar 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoB+cdw0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A3210F9
	for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742812121; cv=none; b=G+xnhfeFfBM5PHe92O5bcsHjlhNCIhNQxLm7Q8ym43XY8INLIGSXBh5NAsimc65/9ZHF8JDdFC8dLygAULChNrv9QwvHEAuH0VGu/1kW/m90S7ItgP1PINyQ+uWp6+sJCxANpiik5riJtYHvZ+gTRcrE+pLEWWk3V7N9EqnS8UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742812121; c=relaxed/simple;
	bh=BBE8Dk5r/9fc3J14YI7KO7GA6muQemmyjZHQHo0UHCQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KK/H39ouDyPNKq0vlhXIxgGqMAUSw2JbbHVquT3dLrylYY9uowV2UsrXi6Wr/gCYzUqbL2IZeEbWSbdA2mGiB4h4SFVwEiXrejMvZvpNUCoA4yf2uSNfKB+2EzzJZYe3i64oVBHKMpFVVcn+ofAqLS5Wbxfyrd8DSL2JfEqhh/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XoB+cdw0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742812118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+WsR8cD/RLeDxoutU2hXcQFpqPpnkire4ATLr6+K4o=;
	b=XoB+cdw0yjOMBaK2AZx4phAb3tZMjSElTETBprS8eXz6AmcyRpg5RuUvL5y5R8GiDOYlGb
	yeYYuezZylmsJmiHb14vsmMk3G3Sf2y8iO8JcFxnqb+uOY+jAez9JlYgs/DVgVu8Mm4woJ
	YCuXJv/6Gu84/ybiel+slmUxOvxrhhU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-5eH_U6K-PvW379X_Ej0wnQ-1; Mon, 24 Mar 2025 06:28:37 -0400
X-MC-Unique: 5eH_U6K-PvW379X_Ej0wnQ-1
X-Mimecast-MFC-AGG-ID: 5eH_U6K-PvW379X_Ej0wnQ_1742812116
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac6a0443bafso65337366b.2
        for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 03:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742812116; x=1743416916;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+WsR8cD/RLeDxoutU2hXcQFpqPpnkire4ATLr6+K4o=;
        b=g8JM+BpNB0cipnTVHt5oATqCPBxTYMPtde4dzaYnlAXOuhHoMXHcfDoV5N2ydB0Hjo
         njZvehZfpCLzvGRXwv3B41CYsf7TMMW15iWVQnaL2YDoleHva5r5+tgY5ycOMSe6aMyr
         dk4jUrvGPAg0n7RpLVMA3mU/J7raWCfcuvqLJck9rtZzC1cZFHMXkfpWtden6+H/wBsG
         9d6veA6dLmpn3ABm8Wqm4GcjI/A5FPxhc36PhsBk6q7TGEIJszu8DHjmvHvJNaQ6TYFQ
         lD3mXga+zc5CZ0XXof2HlP/GCXKCPiVjHvghMVJu5ReWQzNBXYJBmA2IDVUsdgOrAe3J
         t7kw==
X-Forwarded-Encrypted: i=1; AJvYcCWxFfSJndjSM+5+4kMCG8xkm9W4sMZ/notbTbE1yPSXxJNUvVnSD39s20OrEZXluWOmQ0uUahzvmYeN1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU69MibC31KXJHRg+44z+gufbj59lHhaM9vvfqxioaWk1VNqcY
	XnPrjiY3cMrSg5gGJQGdOrmafMj00zQDzkl5NQV837stQGVMTq8ZxbTmw+2AOsBONTcp9GeGJHz
	VqnTlDRVBfJciCYZsEwAOfNslLkJIui8V6hQ61A3iDhUf97iXU22QO9lyaLT2
X-Gm-Gg: ASbGncsyo5eSe1jd5/HMFmYIQlvT884niQOrx5JEOYbfxyLVjhXx/edT5jhZ8G7E6HA
	KGDyHzVrzrEJDb/+kwWExRlj9kmcjhYf+EIn+pM/KUfgfyrZpkt+stcMJkb7whWBrZOATCL+nuL
	V+dQSwnm0nvO1NJmIDpaI1WzskeUsvoXm7pvQArKdzShnW4eGrQakcB4h2VN1MQxwn8rFXDt15M
	H7UJoBpkQB6EgfGJIc6cW+BYgvif3cqUvrxfftT0OYKb6veuseQ23Tn9uyM7V7Bn14FGvmgbryj
	VyEW47bO4zrJgQ8wxYw=
X-Received: by 2002:a17:907:7e5d:b0:ac4:4c8:5e30 with SMTP id a640c23a62f3a-ac404c861eamr836848766b.17.1742812116233;
        Mon, 24 Mar 2025 03:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyO7ye1ZQOXWBZztf4Oqcfg2z9Nywy8UGXZKkppvHfA7a2ilW78k/PyynoSiBySfTpVKZQlg==
X-Received: by 2002:a17:907:7e5d:b0:ac4:4c8:5e30 with SMTP id a640c23a62f3a-ac404c861eamr836845866b.17.1742812115730;
        Mon, 24 Mar 2025 03:28:35 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef85c731sm649464266b.24.2025.03.24.03.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 03:28:35 -0700 (PDT)
Message-ID: <abebbdb4-51ea-4d5f-882d-50654232fd9d@redhat.com>
Date: Mon, 24 Mar 2025 11:28:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] media: i2c: Add Omnivision OV02C10 sensor driver
To: Piyush Raj Chouhan <piyushrajchouhan@gmail.com>
Cc: bryan.odonoghue@linaro.org, heimir.sverrisson@gmail.com,
 ingvar@redpill-linpro.com, linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com
References: <20250319145927.70534-1-hdegoede@redhat.com>
 <e7d92521-f9aa-4a24-b6f8-748ef6f720bd@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <e7d92521-f9aa-4a24-b6f8-748ef6f720bd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 20-Mar-25 3:17 PM, Piyush Raj Chouhan wrote:
> Hey,
> I am running 6.13.7-arch1-1 with v10 patch.
> https://github.com/Pc1598/arch-zl513
> 
> Device I am using it on Infinix ZeroBook 13.

Good to hear that the sensor driver also works on that model, thank you
for testing.

> Feed i get from the ov02c10 sensor, In all of the camera applications that I used (Firefox, cheese, and qcam) the video is inverted (upside down).

That likely means that the sensor is mounted upside-down
in your laptop. This should be reported as such by the ACPI
tables, lets check this.

First of all lets find out which `v4l-subdev#` is the sensor
on your laptop do this run:

ls -l /sys/class/video4linux/v4l-subdev* | grep OVTI

on my laptop this outputs:

lrwxrwxrwx. 1 root root 0 Mar 24 10:21 /sys/class/video4linux/v4l-subdev6 -> ../../devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/usbio-i2c.10.auto/i2c-18/i2c-OVTI08F4:00/video4linux/v4l-subdev6

So on my laptop the sensor is /dev/v4l-subdev6

Now lets check the camera rotation control:

v4l2-ctl -d /dev/v4l-subdev6 -C camera_sensor_rotation

Note replace the `v4l-subdev6` here with the subdev found
with the earlier command.

On my laptop this looks like this:

hans@x1:~/projects/linux$ v4l2-ctl -d /dev/v4l-subdev6 -C camera_sensor_rotation
camera_sensor_rotation: 0

I hope that on yours it will output 180 instead. In which case we need to
fix the tools to actually honor that value.

Regards,

Hans







> 
> $ lsmod | grep ipu
> intel_ipu6_isys       143360  6
> videobuf2_dma_sg       24576  1 intel_ipu6_isys
> videobuf2_v4l2         40960  1 intel_ipu6_isys
> videobuf2_common       94208  4 videobuf2_v4l2,intel_ipu6_isys,videobuf2_dma_sg,videobuf2_memops
> v4l2_fwnode            32768  7 ov02c10,intel_ipu6_isys
> intel_ipu6             86016  7 intel_ipu6_isys
> v4l2_async             32768  3 v4l2_fwnode,ov02c10,intel_ipu6_isys
> ipu_bridge             24576  2 intel_ipu6,intel_ipu6_isys
> videodev              397312  13 v4l2_async,v4l2_fwnode,videobuf2_v4l2,ov02c10,intel_ipu6_isys
> mc                     90112  8 v4l2_async,videodev,videobuf2_v4l2,ov02c10,intel_ipu6_isys,videobuf2_common
> 
> Please let me know what info i need to share.
> 



