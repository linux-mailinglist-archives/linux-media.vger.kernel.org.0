Return-Path: <linux-media+bounces-35561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0DAE3365
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 03:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3F0B3A797F
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 01:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D0B7261A;
	Mon, 23 Jun 2025 01:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3W9V1yT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6131D249EB
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 01:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750643180; cv=none; b=hpQoBo0yYpsFJDXqnHlqbhW8z2LoHZRNXy1T7wsLXoQM7cIkMmSquCell35E0j9BaFud2TKZySedg7PKMEpqXdT10N+SyvBw1ngEV/bzdxo+WMC2whCSPamJL8pexDBOuj/4u6Q/cQfIUExSmUUcNY/ENhNaPvDh5a5Ny3qJ3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750643180; c=relaxed/simple;
	bh=blrwlEk0nmV3IVlTXACXwaHGg3+oM2CL/no+EL3SGOc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rmGfSgDHnSwye4yrJ0b+vWhcNkOkkes5bckXQDJN7AtHdlpyno4Y1mtgQQmqwBj/+Paf5SCI6Ch8zAv/d1LIKrB5gRGEbsLGiyls//DR4Pw9g7p8wM5hsifnK8MlJGoEs9vo0QWd7I+oTka7c+6qugFqmzp79ppmV9SgxF0vyw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3W9V1yT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b43846e8cso29957801fa.0
        for <linux-media@vger.kernel.org>; Sun, 22 Jun 2025 18:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750643176; x=1751247976; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YsSqc0SAlPBBhJdFnK9DUjeF27/7nkHZFKSWVgH0Eas=;
        b=d3W9V1yTJCwnMNdx8i9R7x2gtRQXuNPA4YmHMIW85BoMzrVJUPt7uJX1pBawLKgAGA
         kW8iiSTh9N9feWVkvS49dF4q6MSrPM4+Lq2lIT0YufUE27i3eabtXtpRpHOSR6oTJJI/
         mv46HT/Nl1Bw+4AEJXxL6xPhhx2ZDOxW2FIfOFPhZ9Ph6Elm+R7H3FxDZMS62UBDBw9D
         jLsChH+Vy4SBr0ZkjWMLTWMyK5ydwuAb15v6L29ezRj8IC4Ly0IgBUtdysBsx/FwrQ1I
         C8Dkw0aSaLoEEy1edDw2AVL3sW87OSazfdYUJlO9LEKQRq/MoJepILH6ODadY80wCAgm
         a8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750643176; x=1751247976;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsSqc0SAlPBBhJdFnK9DUjeF27/7nkHZFKSWVgH0Eas=;
        b=VKpMN+yps3TVwoaUXtpcLxEIILSyMIF8ayfSofD7wwtZPsS978/qvls98QWGHGo8n6
         R5zN89Pl2FloNwpVJat5ZWQtEruHrwrFok9xqanJpoCts2OlbGypkfHfx6Rbure4Do1I
         gB40dDdWEFrKw20Tmsg7fQe7YfUVrfW/VWxW9Rn2YbqX94RurqpJI93yoRwbHGETgIjO
         0sTIGpFPuViqz9U0IbTFd9hQAng2L17W4lOhRcDBJDWnDTvPMD3x5TnsCYmNMkTOxzG+
         WL3F6DB7ORvjADbygg49obwb2cwSfCPFWjdl1XcscqstiNnUiu0C9R3IquD1f5ta0OC2
         fuHA==
X-Gm-Message-State: AOJu0YzgqxYhdvj6VvZchGvZ9GZI/qPCdKBfjIgwJBewTesNxcD0Gjm1
	vwnESyjqVEkkqITPeLPK1lNPF2DETwlSh90wwaAUlgrdUkBVMWiRB7NJ+wBfZO8f19BCR+jrsw2
	SY1yC5wXtzh6luCY+q8UwCpRXbak9VhF0sMLh
X-Gm-Gg: ASbGncusqUsBMf3ZCXj/8NwOzIDjwGfl/qcEhn4j0YcyZdvvV2z+pwMZg6zatdPLY+y
	KqNe4T9ShOLU1yXVq6k+hzvPH6UMfj9Rqf3INDQWQSc6ZQKCKqrMnebAwMoGarFPSBDS8RBbXqO
	SNh9UKI6Krz6SZO1y4QbNIIozMY7KUHBNY7uNnCVpA5hoLGBGHTDA=
X-Google-Smtp-Source: AGHT+IEz2zndV6sB4MYXBX6BkMYrFNBCKcvM1G2UAQoOse8CZD5ox7bCmbTtS30s1Zelk11qlLr9DPhkvASjJOnqrlg=
X-Received: by 2002:a2e:b5a9:0:b0:32a:81a2:8a8d with SMTP id
 38308e7fff4ca-32b992d7c56mr23343001fa.26.1750643175958; Sun, 22 Jun 2025
 18:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michael Goffioul <michael.goffioul@gmail.com>
Date: Sun, 22 Jun 2025 21:46:04 -0400
X-Gm-Features: AX0GCFvmS1gHjmuBS4Tam17r8Ry4eFTjHMziFpcg9X2Oh7i8dU-JOHEl3od5syQ
Message-ID: <CAB-99LvD2cCmPt91Kh-1Zj69=_xczV6oUA7soAfFXQBcZxA+pQ@mail.gmail.com>
Subject: Support for Mygica A681B (ATSC/QAM USB tuner)
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a Mygica A681B USB tuner and I'm wondering whether there's any
hope to have it supported by the Linux kernel. I've attached the lsusb
output for the device at the end of this email.

So far, I've downloaded the Linux driver from Geniatech web site. This
is made for Ubuntu 20 and kernel 5.4. From what I can tell from the
driver sources, the device 1f4d:692f seems to use a mxl692 frontend
driver, but it uses a binary-only mxl692_fe.o module, without
providing the source code for it. Kernel 6 includes its own mxl692
driver, however it appears to use a different interface/API (and
apparently also a firmware blob that does not look to be easy to
find...).

Any help or hint would be greatly appreciated.

Michael.

===

Bus 001 Device 008: ID 1f4d:692f G-Tek Electronics Group USB Stick
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x1f4d G-Tek Electronics Group
  idProduct          0x692f USB Stick
  bcdDevice            8.00
  iManufacturer           1 Gen
  iProduct                2 USB Stick
  iSerial                 3 2017.12.09
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x002e
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          4 Def
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           4
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1 [unknown]
      bInterfaceProtocol      1
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

