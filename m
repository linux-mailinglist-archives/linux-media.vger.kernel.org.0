Return-Path: <linux-media+bounces-2805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CED819F59
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 13:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B131284D97
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 12:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BBE25544;
	Wed, 20 Dec 2023 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJzKXwO9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246D0250E7
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e3c6f1c10so4295495e87.1
        for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 04:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703076810; x=1703681610; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QZ3IIkdSmYC2Go4m9T4Dq2tsXHplBAd7I16P8WLpMc4=;
        b=WJzKXwO9GBLhh0LRSmOJw++MFC3dWAYp96tcPSoOaH8S48AL6udfZklAI7OUMs/7nE
         KVHsYpF/PR7aPDfiCIeCGZJfnoSJWzaKrEbcFU6Qcd+Bphh9T2MRmN0rjGnK4KFtXMdX
         E5k7IEPypvfFsKi9aIJo68E1GK7ZqjmdGG4sELo4OLy2DtFbmLjIg8Vpth1JxOCuy571
         cczUZBCbstYDB+8TET/8N6TtwJ1QX9iCA+hUKHBdhQ8vxOQt2zFU0EuqXqD0/VGWneng
         DK2BTgvmL13FiKlulepX/23i0ogjaCG3/CTYMUzdDOZmdyNO+zDLjz51XMBZS+MW69T/
         LD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703076810; x=1703681610;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZ3IIkdSmYC2Go4m9T4Dq2tsXHplBAd7I16P8WLpMc4=;
        b=s9sQCr+A4hbjWpdXaWc5Qn32CbvAMxyV6p7+rhLpc5CiN8AIg9pzwNOGH+uU3XhpYc
         WEB/rFGAFibAS4b55fBpWhk+qlmENxNktBJMp908gqpRTNxEEILvV3VDc9JKzfG8AUnb
         zKciQzF8rYR87oxx+cP2xeDsHSoowVBahNab5a+J1hQcAzhO2C+6gCyh4e6X+BiGcUFs
         Q9uNDWlPkbxFqGdR23uE3cGZ4arCFeDiTLVfVPpMF4PSCcqcdifWMnPYErrw+S070rja
         HpJURaUZJ70QMNqQ7kY/dZ8ulQyM2lA8K6vYSkeMKA6Q/uNbR65XeWaNOepn9lLbT173
         HwIQ==
X-Gm-Message-State: AOJu0Ywa7M9eWgf4KdAF7tKnWC6nsS2WSdP0BGxisRe5tQPOudCq28yu
	oPHsalyT7K/GvEj6rrtMTWM=
X-Google-Smtp-Source: AGHT+IEu2raiXBCp1dpACjgESqgYPMdRJRxrt4YMMqXfltExUpFjRfGIVCDQk7j/XTvLo2LHmdHt5A==
X-Received: by 2002:ac2:420a:0:b0:50e:530a:22a6 with SMTP id y10-20020ac2420a000000b0050e530a22a6mr228861lfh.55.1703076809697;
        Wed, 20 Dec 2023 04:53:29 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id bq6-20020a170906d0c600b00a268ee9017fsm825373ejb.157.2023.12.20.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 04:53:29 -0800 (PST)
Message-ID: <e136389011517dbc65b30f6bf0b1a9c49ab4e599.camel@gmail.com>
Subject: RFC: Intel IPU4 driver proof of concept
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, Bingbu Cao
 <bingbu.cao@linux.intel.com>,  bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
 laurent.pinchart@ideasonboard.com, Ricardo Ribalda <ribalda@chromium.org>, 
 claus.stovgaard@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
 senozhatsky@chromium.org,  andriy.shevchenko@linux.intel.com,
 tomi.valkeinen@ideasonboard.com,  tian.shu.qiu@intel.com,
 hongju.wang@intel.com
Date: Wed, 20 Dec 2023 13:53:27 +0100
In-Reply-To: <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
	 <20230727071558.1148653-11-bingbu.cao@intel.com>
	 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
	 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
	 <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
	 <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
	 <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
	 <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

As mentioned previously in Bingbu's IPU6 patch series, I'm working on
porting the driver to IPU4. I've now got a hole through so I think it
makes sense sense to share the code.

I'm able to capture frames with yavta with the current code, but there
are several issues that needs to be fixed for it to be complete.

# How it is tested
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The hardware is a custom x86 PC-like embedded device with the following
video pipeline:
Endoscope -> FPGA -> tc358748 -> IPU4 (E3950/Apollo Lake)

See my colleague Claus' description[2] for more info.

There is currently no V4L2 subdevice for the FPGA, so we have a custom
ambu-tc358748.c driver which pretends to be an image sensor.

$ media-ctl -v \
  -V "\
    \"tc358748 0-000e\"    :0 [fmt:RGB888_1X24/800x800],\
    \"Intel IPU4 CSI2 0\"  :0 [fmt:RGB888_1X24/800x800],\
    \"Intel IPU4 CSI2 0\"  :1 [fmt:RGB888_1X24/800x800]\
    "\
  -l "\
    \"tc358748 0-000e\"    :0 -> \"Intel IPU4 CSI2 0\" :0 [1],\
    \"Intel IPU4 CSI2 0\"  :1 -> \"Intel IPU4 ISYS Capture 12\" :0 [5]\
  "

$ yavta --data-prefix -c2 -n2 -I -s 800x800 --file=3D/tmp/frame-#.bin \
        -f XBGR32 /dev/video12

This produces frame-*.bin files containing 800x800x4 bytes of valid
"BGR0" data.

# The code
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The code is available at the tag
https://github.com/Kleist/linux/tree/kleist-v6.6-ipu4-hacks-1
(15245fe26e07)


Note that I haven't renamed the files to ipu4, to make it clear what
the changes are compared to the IPU6 driver.

It is based on v6.6 with the IPU6 v2 patches[1] on top, and then my
hacks to make the IPU4 work. This is not meant for upstreaming as it
is. The commits are a cleaned up version of the chronological order I
made the port in. It is not yet in a state where I think an RFC PATCH
series makes sense yet, but I wanted to share it anyway.

## Changes compared to IPU6
diff --stat of the changes in ../ipu6/ compared to the IPU6 v2 patches:

 drivers/media/pci/intel/ipu6/Kconfig               |  12 +-
 drivers/media/pci/intel/ipu6/Makefile              |  13 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h            |   6 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  71 ++-
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   8 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  45 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   2 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        | 171 ++++---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        | 237 ++++++----
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      | 219 +++++----
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |  11 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  33 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   8 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 212 +++------
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |   4 -
 drivers/media/pci/intel/ipu6/ipu6-isys.c           | 435 +++----------
-----
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |  18 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            | 130 +++++-
 .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  98 +---
 .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   | 226 ++-------
 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  | 172 ++-----
 drivers/media/pci/intel/ipu6/ipu6.c                | 511 ++++++++-----
--------
 drivers/media/pci/intel/ipu6/ipu6.h                |  37 +-
 24 files changed, 1032 insertions(+), 1649 deletions(-)

Note that most of the deleted lines are removed because they are not
used in IPU4. E.g. the watermark handling, which I haven't seen an
equivalent for in the old IPU4 driver.

## Ambu-specific tweaks
Note that I'm using a hacked ipu-bridge (AMBU_IPU_BRIDGE) to setup the
fwnode graph for our hardware. You don't want if you're testing this,
so revert at least the "ambu: Add AMBU_IPU_BRIDGE" commit.

I'm not sure the right approach for handling this would be going
forward. Of course the ambu-ipu-bridge shouldn't be upstreamed, so I'm
wondering how we can achieve something similar? The ACPI tables from
our BIOS unfortunately don't contain any info about the Toshiba Bridge
(tc358748), so we can't derive the information from there. Maybe some
kind of platform driver could be created which tweaks the ACPI info
before the ipu-bridge driver reads it?

What do you typically do when you have some proprietary hardware that
does not provide proper ACPI information? We could carry the ambu-ipu-
bridge patches in our internal kernel tree, but that is not desirable
in the long term.

# Inspiration for the IPU4 port
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
We are currently using a Intel LTS 4.19.217 based kernel[3], which
contains the old IPU4 driver. The port was basically made by comparing
mmiotrace's between the old IPU4 driver and the new driver.

We're using the IPU4 FW ipu4_cpd_b0.bin extracted from a ClearLinux
package[4].

# Known issues
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
## Doesn't yet work with gstreamer for unknown reasons
I get "Unexpected buffer address:" errors from
ipu6_isys_queue_buf_ready, and don't get an image through.

## 64 byte chunks of wrong data
We occasionally get 64 byte aligned 64 byte wrong data (all 0xCC) in
the captured frame*.bin files. This could be a cache invalidation
issue, we haven't looked into this yet. The code currently doesn't use
zlw_invalidate, even though it was ported from the old driver. We
haven't yet tested if enabling this fixes the issue.

# Upstreaming
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
We would like to upstream this driver, probably after the IPU6 driver
has been merged. We're definitely not ready yet (either), but I already
have a couple of questions, that it would be nice to get some input on
from the community.

##=C2=A0How to share code between IPU4 and IPU6
Big parts of the code (approximately 6k out of 7k lines) does not need
to be changed compared to the IPU6 driver, so there is clearly a big
overlap in what the two drivers need to do. I'm not sure how the best
approach would be for sharing this functionality. I see a few options:
1. Shared driver that supports both IPU's (still split in PCI driver
and -isys driver)
2. Shared PCI driver that supports both IPU's, but device-specific
intel-ipu4-isys/intel-ipu6-isys drivers
3. Separate drivers that use a shared "library module" (for lack of a
better term)

My gut feeling is that 2. is the right choice, especially if we moved
the shared code in to the PCI driver and the more version-specific code
was moved into the specific drivers.

The answer to this could also be input to Bingbu's IPU6 series, maybe
it would make sense to place some files differently if they eventually
will be used in both IPU4 and IPU6 drivers?

## How to implement our platform specific fwnode graph?
As mentioned above, we currently have a hacked ambu-ipu-bridge driver,
which is clearly not upstreamable. What would you typically do if you
need to make a v4l setup where the ACPI table information about
sensors/bridges is missing?

/Andreas

[1]https://lore.kernel.org/all/20231024112924.3934228-1-bingbu.cao@intel.co=
m/
[2]
https://lore.kernel.org/all/471df7ffdf34b73d186c429a366cfee62963015f.camel@=
gmail.com/
[3]
https://github.com/intel/linux-intel-lts/tree/lts-v4.19.217-base-211118T072=
627Z
[4]
https://download.clearlinux.org/releases/32370/clear/source/SRPMS/linux-fir=
mware-ipu-19ww39-104.src.rpm

