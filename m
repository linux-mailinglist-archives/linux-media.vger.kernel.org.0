Return-Path: <linux-media+bounces-14069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2B91510C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 16:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5003F286AD3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 14:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A445C19CCE0;
	Mon, 24 Jun 2024 14:51:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D019B3FD
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240662; cv=none; b=QqIUQVxiuWXVz5OH55gIGKH5vjcwLXigxieB3hs7krZS2BefPqgbQr6llXJNojNlt8vJs02tfQ2isevJkANuURqO8EEWj5wqWe2LI6inH91VFede0Nz0CFUHKuHUVlgUtWSJGZNX+xnrTTYME7s+QDcodkyyJVlXZnLebg+5mTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240662; c=relaxed/simple;
	bh=JbJ6n40CkdSanLv+jngs6pDfvUQyLzvDile5tSvBBao=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OMocj6lBnFzqLRUPcjsHEoVcfwMTOpCQ4rjeVSP6LUGw3NaFURMt41mpQs6QsMxepR/W7Nh+F7njkJr4Qe5ukrWJ5MvI03bobdJHfZwa1/cObuuprh7/0UJsV1juhN4k8EDzqo5ee1tHhtEIXuZU/rnGkREA2LtuZmvCaQrUW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792A2C32782;
	Mon, 24 Jun 2024 14:51:01 +0000 (UTC)
Message-ID: <c715a4c9-3283-4d92-ae30-eb154172010b@xs4all.nl>
Date: Mon, 24 Jun 2024 16:50:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.11] New drivers
To: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
References: <Znf3erGgLvqxG6Ug@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <Znf3erGgLvqxG6Ug@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 23/06/2024 12:22, Sakari Ailus wrote:
> Hi Hans, Mauro,
> 
> Here's a bunch of patches, mostly new drivers: RPi PiSP BE, GC05A2 and
> GC08A3. Also ipu6 documentation fix and MAINTAINERS change are included.

I dropped the RPi patches from this PR: see my review comments. I merged the
remainder of this PR.

As I mentioned in my review of that driver: I need to take a closer look at
the v4l2-compliance tests since it should have been caught by the compliance
tests.

Regards,

	Hans

> 
> Please pull.
> 
> 
> The following changes since commit 7fc65b78b465b8511a503491e7c3116d46dc6c72:
> 
>   media: platform: mtk-mdp3: Add support for MT8188 MDP3 components (2024-06-20 11:47:48 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.11-3-signed
> 
> for you to fetch changes up to 25698102a2785b65aebf74b227c31e6f9825655d:
> 
>   MAINTAINERS: delete email for Anton Sviridenko (2024-06-23 12:14:44 +0300)
> 
> ----------------------------------------------------------------
> V4L2 patches for 6.11
> 
> ----------------------------------------------------------------
> Jacopo Mondi (7):
>       media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
>       media: uapi: Add a pixel format for BGR48 and RGB48
>       media: uapi: Add Raspberry Pi PiSP Back End uAPI
>       media: uapi: Add meta pixel format for PiSP BE config
>       media: uapi: Add PiSP Compressed RAW Bayer formats
>       media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
>       media: admin-guide: Document the Raspberry Pi PiSP BE
> 
> Naushir Patuck (1):
>       media: raspberrypi: Add support for PiSP BE
> 
> Samuel Wein (1):
>       media: Documentation: ipu6: Fix examples in ipu6-isys admin-guide
> 
> Wolfram Sang (1):
>       MAINTAINERS: delete email for Anton Sviridenko
> 
> Zhi Mao (4):
>       media: dt-bindings: i2c: add GalaxyCore GC08A3 image sensor
>       media: i2c: Add GC08A3 image sensor driver
>       media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor
>       media: i2c: Add GC05A2 image sensor driver
> 
>  Documentation/admin-guide/media/ipu6-isys.rst      |   14 +-
>  .../admin-guide/media/raspberrypi-pisp-be.dot      |   20 +
>  .../admin-guide/media/raspberrypi-pisp-be.rst      |  109 ++
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../bindings/media/i2c/galaxycore,gc05a2.yaml      |  112 ++
>  .../bindings/media/i2c/galaxycore,gc08a3.yaml      |  112 ++
>  .../bindings/media/raspberrypi,pispbe.yaml         |   63 +
>  .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>  .../userspace-api/media/v4l/metafmt-pisp-be.rst    |   56 +
>  .../userspace-api/media/v4l/pixfmt-bayer.rst       |    1 +
>  .../userspace-api/media/v4l/pixfmt-rgb.rst         |   54 +
>  .../media/v4l/pixfmt-srggb8-pisp-comp.rst          |   74 +
>  .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |    4 +
>  MAINTAINERS                                        |   25 +-
>  drivers/media/i2c/Kconfig                          |   20 +
>  drivers/media/i2c/Makefile                         |    2 +
>  drivers/media/i2c/gc05a2.c                         | 1359 +++++++++++++++
>  drivers/media/i2c/gc08a3.c                         | 1339 +++++++++++++++
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    1 +
>  drivers/media/platform/raspberrypi/Kconfig         |    5 +
>  drivers/media/platform/raspberrypi/Makefile        |    3 +
>  drivers/media/platform/raspberrypi/pisp_be/Kconfig |   12 +
>  .../media/platform/raspberrypi/pisp_be/Makefile    |    6 +
>  .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 1809 ++++++++++++++++++++
>  .../platform/raspberrypi/pisp_be/pisp_be_formats.h |  519 ++++++
>  drivers/media/v4l2-core/v4l2-common.c              |    2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   13 +
>  .../uapi/linux/media/raspberrypi/pisp_be_config.h  |  927 ++++++++++
>  include/uapi/linux/media/raspberrypi/pisp_common.h |  199 +++
>  include/uapi/linux/videodev2.h                     |   17 +
>  31 files changed, 6871 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.dot
>  create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.rst
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
>  create mode 100644 drivers/media/i2c/gc05a2.c
>  create mode 100644 drivers/media/i2c/gc08a3.c
>  create mode 100644 drivers/media/platform/raspberrypi/Kconfig
>  create mode 100644 drivers/media/platform/raspberrypi/Makefile
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
>  create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h
> 


