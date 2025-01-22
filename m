Return-Path: <linux-media+bounces-25168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A5A1976A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 18:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381F33A3FF5
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78846215197;
	Wed, 22 Jan 2025 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fql/02uw"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC50215182
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 17:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566395; cv=none; b=oUJd874JMCVInMtF+EV3nTJsd5UXFoadfw5eQjt04AYRpdK5FkztcExOv6k2DdfayLQFGGEhPO/qHOQmTjloHGkMkdNikn6RXmZhv0jLL6t0wqPHs0ZEKLIxXXUp80QVnwKfe/hzKVgVisnc8D9KwxnUDU++3hDrPwSu+n+Y97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566395; c=relaxed/simple;
	bh=xqWypMoyfCd4qF0n/iqrJ6hzBfYNJ/4aObilXAHR6+U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jPifnnX6Yw3D4f6Vx9Bz+c+fHDoUfqos1OMthVklxoUzq19uONcJ5YZ/gSktJfDCnYHI982nCE61w3vQSFZvInQN9I5QZ2ocUqLuDFhXV/L2O/vK+VYbmXCJQ6qcYAr5f6legAfC/wf5t3mRvO1K3AjEoKcvJ1KzDV9poXzG/rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fql/02uw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737566392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6NiSDZ2syFUJ/H+LWGg4L1FOJeHQTaRHz4nkaiqVCJg=;
	b=Fql/02uwTsUyqq+R50ArU0fqYIRd1lGzMC6znDoJwov9CX1/zxq6gjQPIidTRb7BkxMVDo
	65B4Ya4O921mC985HnaEd/iHAZCbtoRjHIEhsHRpKlVcDaJP8XE+bauuRbTVhNCqRizcP2
	xKJtVJt2cbnDtDryNJUI/mliY7Pc+YU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-oKBou1G_Ny-kzKqimJfu9Q-1; Wed, 22 Jan 2025 12:19:51 -0500
X-MC-Unique: oKBou1G_Ny-kzKqimJfu9Q-1
X-Mimecast-MFC-AGG-ID: oKBou1G_Ny-kzKqimJfu9Q
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d3f55f8f3aso14484a12.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 09:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737566389; x=1738171189;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NiSDZ2syFUJ/H+LWGg4L1FOJeHQTaRHz4nkaiqVCJg=;
        b=BozHDjXFqsW9B+YQyOw6yNc9eIS2kWgQR2bpnUYXfXkl60jjDQdjvzGN5HPUzmDolo
         z4EPUgyZ7wLM2ZJpN0/zhC9ULhvenO5iy1DL0QJjEZJAaTjWOCcO/1GCVLIvPPGXgluh
         Otd1XRPUAFvEGNtTJnwek3uN35BXbDcOBW+bD7oYbTW6V7m98YOVcDPZpDvZ5OsyY0ZG
         qsOfddL6J3uJmH4kYl2Evn3FS0CGA+h9IQujmUmKeQXCUj//OAaE5QCNZr+ueBRBJrM2
         /4Z5Vyeg4mCiT4tSgXF2g6UdtygSmYUqwM/2K45WdIBGt7XSAmEcFsMcNIiXzOXGjbwL
         itkA==
X-Gm-Message-State: AOJu0YzRWJHuAFBlQS+85Dlit/UlBJrXM2WT3mlN40mm5WKyfFNHQkwz
	FEmkCD/JnOXIyVxzhGsppFCGlXTFiB4HX883K0PnyjQo/a67mC6lFW5UYUTmQIcrxowO2ZB68M5
	iIgL5osnh/0k07dgAah/RWv4GvYch7P8UyxN+YSKxBw3zgU4fgyxwewTDOWadzN+bIImM+t5D10
	TjmcZZGmgiU6cMmhwCsUHhRR67OMymdwbfujS85k4k8Bxk3sI=
X-Gm-Gg: ASbGncvJSx+DkeoRUwSOyyqhQRSqcp7aFCZif8LsYt/2nK7DFoL4RyBIqIYEJtyrIMq
	fZgVkCi1YuwQ+VZxxaUszwWZBwI4hM87l2pP3wT+93SACT6cd4e5aJ+As7iKiDZUJ+ZvMaGGLVS
	p2/OAd9uAXExllg57BkeplkPvXr1Wpb31JP+rz3q2yq9CwTOz87+DvlgU8/u6D2+zojPvqC01c3
	rLNV79OCREs269ekiggyJbW9t/8WgDoBZ5nfqkbd9CONIV2Jo0Ip3qLWerznL0aNidVLb8hmh8o
	7vZ4Cla4HGFvXW5Uw53qrAncmjqjuRqbHKXh03q45F1MmcNvTRul1HlhBXuUfnlNX1RlVTkMje1
	ATHVzD18KdbWOPEb/Th4/B9S8gO0bkF/tyE0nJDOFDk++
X-Received: by 2002:a05:6402:50cb:b0:5da:d16:7388 with SMTP id 4fb4d7f45d1cf-5db7d30063emr24119096a12.17.1737566389245;
        Wed, 22 Jan 2025 09:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNt7haZIegJqS5nqU/kNTtPPgS8hPn6pAXeMgCjHI6zge4vOCbOUboaei+OWYr+Y4h9fc2rA==
X-Received: by 2002:a05:6402:50cb:b0:5da:d16:7388 with SMTP id 4fb4d7f45d1cf-5db7d30063emr24119059a12.17.1737566388742;
        Wed, 22 Jan 2025 09:19:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670ebfsm8984611a12.18.2025.01.22.09.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 09:19:48 -0800 (PST)
Message-ID: <59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com>
Date: Wed, 22 Jan 2025 18:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 Dan Scally <djrscally@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Alan Stern
 <stern@rowland.harvard.edu>, "duanek@chorus.net" <duanek@chorus.net>
From: Hans de Goede <hdegoede@redhat.com>
Subject: RFC: How to deal with the INT3472 handshake GPIO found on Intel IPU6
 MTL?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

Background / analysis:
----------------------

New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
pin defined in the INT3472 sensor companion device which describes
the sensor's GPIOs.

Based on what I know about this now, this pin seems to be used in at least
3 different scenarios:

1. To power-up / activate some unknown auxiliary IC on HP laptop designs
where the sensor is directly connected to the main Meteor Lake SoC for
I2C and GPIOs (no USB io-expander used). Example dyndbg int3472 output:

HP Spectre x360 2-in-1 Laptop 16t-aa000/8C17, BIOS F.11 08/14/2024 (ov08x40):
[    4.908016] int3472-discrete INT3472:01: unknown \_SB.GPI0 pin 65 active-high
[    4.908019] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work
[    4.908100] int3472-discrete INT3472:01: privacy-led \_SB.GPI0 pin 107 active-high
(and lsusb shows no Lattice NX## / Synaptics Sabre USB-io expander)

2. To make the Lattice chip in designs with the Lattice chip is used run
the power-on sequence of the sensor which is handled by the Lattice chip
firmware itself running the entire power-on/-down sequence when changing
the GPIO value. Example dyndbg int3472 output:

Dell Latitude 7450 (with patch to map handshake in INT3472) (ov02e10):
[    5.110920] int3472-discrete INT3472:01: Sensor name OVTI02E1:00
[    5.111908] int3472-discrete INT3472:01: Sensor module id: 'CIFNE24'
[    5.113653] int3472-discrete INT3472:01: handshake \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 0 active-high
[    5.113676] int3472-discrete INT3472:01: privacy-led \_SB.PC00.XHCI.RHUB.HS05.VGPO pin 2 active-high
(with 2ac1:20c9 Lattice NX33 USB IO-expander)

3. For unknown reason (ACPI table bug? / not actually used) there is
a handshake type pin in the INT3472 device on some older HP models with
a hi556 sensor connected directly to the Alder Lake or Raptor Lake SoC,
see e.g. the dmesg from: https://linux-hardware.org/?probe=a9a2e2ab03 :

[    9.077107] int3472-discrete INT3472:01: reset \_SB.GPI0 pin number mismatch _DSM 141 resource 301
[    9.077170] int3472-discrete INT3472:01: power-enable \_SB.GPI0 pin number mismatch _DSM 142 resource 302
[    9.086727] int3472-discrete INT3472:01: GPIO type 0x12 unknown; the sensor may not work

which is from a model where it has been confirmed that the FOSS stack
works already even though we have no handshake GPIO support yet.

Testing has shown that for things to work in scenario 1. and 2. the 0x12 /
handshake type pin needs to be driven high, followed by a msleep of 25 ms.

The 25 ms was taken from the out of tree drivers which specify this as
minimum sleep for the Lattice case. For the HP without Lattice, the default
1 ms post reset delay also is not enough see:
https://lore.kernel.org/linux-media/1664997903.107383327.1734874558698.JavaMail.zimbra@chorus.net/

This applies to both the HP Spectre x360 16t without Lattice chip and
the Dell Latitude 7450 with Lattice chip.

I suspect that there might be some micro-controller or something running
the power-on sequence in the HP Spectre x360 16t case too, but there it
is just a standalone chip responding to the GPIO, not an USB attached chip
also offering, e.g. an I2C + GPIO controller like the Lattice chip.


Proposed solution:
------------------

I have been thinking about how to solve this without needing to modify
sensor drivers. I think the best solution is to model the handshake
pin as a GPIO driven "dvdd" regulator, configuring a 25 ms delay on
enable by setting regulator_desc.enable_time to 25 ms.

The reasons for modelling this as a regulator are 3 fold:

1. sensor chips don't have a handshake pin, so we need to abstract this
   in some way which does not require modification to the sensor drivers,
   sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
   is normal. So this will work to get the right value set to the handshake
   pin without requiring sensor driver modifications.

2. sensors typically wait only a small time for the sensor to power-on
   after de-asserting reset. Not the 25ms the Lattice chip requires
   according to the out-of-tree drivers. Using the regulator framework's
   enable_time allows hiding the need for this delay from the sensor
   drivers.

3. Looking at the out of tree drivers from:
   https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c

   They set the handshake line before de-asserting reset and sensor.

   Drivers should normally enable regulators before de-asserting reset,
   so using a regulator will mirror the order the out of tree drivers use.

   Except that they do the 25 ms delay after setting both GPIOs,
   arguably doing the delay to let whatever magic the handshake signal
   does happen before de-asserting reset is better though.

   (also it seems with the exception of the pre Meteor Lake HP models
   where handshake appears to be unused that either reset or handshake
   is used and not both)

Please let me know what you think of this proposal. If there are
no objections then I will start working on implementing this soon.

Regards,

Hans




