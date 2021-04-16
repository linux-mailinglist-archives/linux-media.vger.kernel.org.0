Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D8C361D98
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 12:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241258AbhDPJhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 05:37:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58912 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235027AbhDPJhp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 05:37:45 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ADEA5A5;
        Fri, 16 Apr 2021 11:37:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618565840;
        bh=TtTzqJqMSUNSNp3JKe1VnusjeBxQ4GqD4+KAOtjZIQQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dyDGV4rBVQfgZPW1AlVlvdEIJHPKc0isIPpcJ5BXyifE0rbnICulrcgZTtODZxEBN
         UgJxv6ZIgEdxD+5N/XJhMm9KPjWpbsHUjmrcNg4ud9VdsClWq2QlQb1+x93VH2ijea
         vSsDroWSY/FfZ9qfp5mMJsdywXbB0M/58eYZ563o=
Date:   Fri, 16 Apr 2021 12:37:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 00/10] Keem Bay Camera Subsystem
Message-ID: <YHlazqJeQp4cFYMl@pendragon.ideasonboard.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martina and Gjorgji,

Nice to see a new ISP driver :-)

Before reviewing patches in details, I have a few high-level questions:

- The driver seems to proxy access to the ISP through the VPU firmware.
  I assume the VPU is a separate CPU core that controls the hardware
  directly. Is that correct ?

- Does this driver support all the features of the ISP, or only the
  subset that a particular VPU firmware exposes ? In particular, the ISP
  is exposed as an inline block, which no memory buffer between the
  CSI-2 receiver and the ISP, and no ability to capture raw frames. How
  is one supposed to tune cameras ?

- More documentation is needed for both the device architecture (in
  particular a block diagram of the processing pipeline), and the
  configuration parameters. Is there ongoing work in this area ?

- Last but not least, we need a reference userspace implementation to
  test this driver. I recommend implementing support in libcamera :-)

On Fri, Mar 19, 2021 at 06:06:22PM +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> Patch series contains Keem Bay Camera Subsystem driver implementation,
> documentation and devicetree binding document.
> 
> Gjorgji Rosikopulos (7):
>   media: Keem Bay Camera: Keem Bay camera driver
>   media: Keem Bay Camera: Add VPU camera interface
>   uapi: Keem Bay ISP Parameters data types
>   media: v4l: Add Keem Bay Camera meta buffer formats
>   media: Keem Bay Camera: Add ISP sub-device
>   media: Keem Bay Camera: Add metadata video node
>   media: admin-guide: Add documentation for Keem Bay Camera
> 
> Martina Krasteva (3):
>   dt-bindings: media: Add bindings for Keem Bay Camera
>   media: Keem Bay Camera: Add pipeline support
>   media: Keem Bay Camera: Add capture video node
> 
>  Documentation/admin-guide/media/keembay-camera.dot |   12 +
>  Documentation/admin-guide/media/keembay-camera.rst |  174 ++
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../bindings/media/intel,keembay-camera.yaml       |   98 ++
>  .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>  .../media/v4l/pixfmt-meta-intel-kmb.rst            |   98 ++
>  MAINTAINERS                                        |   14 +
>  drivers/media/platform/Kconfig                     |    1 +
>  drivers/media/platform/Makefile                    |    2 +
>  drivers/media/platform/keembay-camera/Kconfig      |   11 +
>  drivers/media/platform/keembay-camera/Makefile     |    5 +
>  .../platform/keembay-camera/keembay-cam-xlink.c    |  327 ++++
>  .../platform/keembay-camera/keembay-cam-xlink.h    |   49 +
>  .../media/platform/keembay-camera/keembay-camera.c |  287 +++
>  .../media/platform/keembay-camera/keembay-camera.h |   43 +
>  .../media/platform/keembay-camera/keembay-isp.c    | 1397 +++++++++++++++
>  .../media/platform/keembay-camera/keembay-isp.h    |  136 ++
>  .../platform/keembay-camera/keembay-metadata.c     | 1860 ++++++++++++++++++++
>  .../platform/keembay-camera/keembay-metadata.h     |  154 ++
>  .../keembay-camera/keembay-params-defaults.c       |  326 ++++
>  .../keembay-camera/keembay-params-defaults.h       |   38 +
>  .../platform/keembay-camera/keembay-pipeline.c     |  401 +++++
>  .../platform/keembay-camera/keembay-pipeline.h     |   75 +
>  .../media/platform/keembay-camera/keembay-video.c  |  922 ++++++++++
>  .../media/platform/keembay-camera/keembay-video.h  |   74 +
>  .../platform/keembay-camera/keembay-vpu-cmd.h      |  110 ++
>  .../platform/keembay-camera/keembay-vpu-frame.h    |  102 ++
>  .../platform/keembay-camera/keembay-vpu-isp.h      |  724 ++++++++
>  .../platform/keembay-camera/keembay-vpu-pipe.h     |  110 ++
>  .../platform/keembay-camera/keembay-vpu-src.h      |  193 ++
>  include/uapi/linux/keembay-isp-ctl.h               |  796 +++++++++
>  include/uapi/linux/videodev2.h                     |    4 +
>  32 files changed, 8545 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/keembay-camera.dot
>  create mode 100644 Documentation/admin-guide/media/keembay-camera.rst
>  create mode 100644 Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst
>  create mode 100644 drivers/media/platform/keembay-camera/Kconfig
>  create mode 100644 drivers/media/platform/keembay-camera/Makefile
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.c
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.c
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.c
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.c
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.c
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.c
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-video.c
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-video.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-cmd.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-frame.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-isp.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-pipe.h
>  create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-src.h
>  create mode 100644 include/uapi/linux/keembay-isp-ctl.h
> 
> 
> base-commit: f00397ee41c79b6155b9b44abd0055b2c0621349

-- 
Regards,

Laurent Pinchart
