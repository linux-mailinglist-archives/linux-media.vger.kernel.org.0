Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348E7361E84
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 13:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240337AbhDPLVL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 07:21:11 -0400
Received: from mga12.intel.com ([192.55.52.136]:63711 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235011AbhDPLVJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 07:21:09 -0400
IronPort-SDR: V2L8wZ/qIxcSR8k6IDKfOh/L+1dGBRAhTDZRjUXelZ5eHbPhsq3Obuf+qsY74z2XiRXW9E062j
 IbHBU+0LeePQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174520052"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="174520052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 04:20:44 -0700
IronPort-SDR: KNUTpDmsWv3TqC084HypCIwIlD/plK0sn/ftJdo6Ss8lxaAf64SUvkXt+qT6ueC3oSnNzxUVe5
 CAn917c/wDPA==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="425560591"
Received: from grosikox-mobl.ger.corp.intel.com (HELO [10.104.80.12]) ([10.104.80.12])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 04:20:42 -0700
Subject: Re: [PATCH 00/10] Keem Bay Camera Subsystem
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
 <YHlazqJeQp4cFYMl@pendragon.ideasonboard.com>
From:   "Rosikopulos, GjorgjiX" <gjorgjix.rosikopulos@linux.intel.com>
Message-ID: <4084cf8d-61f4-2ae4-b6d4-47668996a446@linux.intel.com>
Date:   Fri, 16 Apr 2021 11:20:40 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHlazqJeQp4cFYMl@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 16/04/2021 09:37, Laurent Pinchart wrote:
> Hi Martina and Gjorgji,
>
> Nice to see a new ISP driver :-)
Pleasure for us submit new ISP driver :-).
>
> Before reviewing patches in details, I have a few high-level questions:
>
> - The driver seems to proxy access to the ISP through the VPU firmware.
>    I assume the VPU is a separate CPU core that controls the hardware
>    directly. Is that correct ?

Yes that is correct.

>
> - Does this driver support all the features of the ISP, or only the
>    subset that a particular VPU firmware exposes ? In particular, the ISP
>    is exposed as an inline block, which no memory buffer between the
>    CSI-2 receiver and the ISP, and no ability to capture raw frames. How
>    is one supposed to tune cameras ?

The driver exposes all the features supported by ISP the firmware as 
high level API.

However this patch-set is not exposing all the features of the VPU API 
in userspace. Some of them will came in next patch-set some of them

are part of the separate patch-set (HDR 2DOL and 3DOL support).

The changes which will be posted in next patch-set are:

1. Raw capture support (link can be activated per need).

2. Support for 2 additional scaled outputs which again their links can 
be activated per need.

3. The full size output which is included in this patch-set will remain 
immutable active.


The additional features which will be added as separate patch-set and 
RFC are:

4. 2DOL and 3DOL support. We dont have yet interface for multiple 
streams over one link. We will use current RFC for that. (That why this 
is not included in first patch-set).

Also we need to discuss how to enable raw capture for 2DOL and 3DOL 
usecases....


Regarding the VPU operation. The VPU captures frames from CSI2 in to 
memory and then uses ISP mem2mem processing, there is internal memory 
pool used by the firmware.

When raw capture is enabled the raw buffer pool is allocated in the 
linux driver side and used by VPU for storing the frames to memory, then 
they are processed

by ISP and returned to linux driver side.

>
> - More documentation is needed for both the device architecture (in
>    particular a block diagram of the processing pipeline), and the
>    configuration parameters. Is there ongoing work in this area ?
Yes this is painful part. We are working to get approval for providing 
the needed documentation...
>
> - Last but not least, we need a reference userspace implementation to
>    test this driver. I recommend implementing support in libcamera :-)

So i am not sure if this is a planned effort. Currently we are using 
yavta for doing tests same as IPU3 example,

with prepared configurations and read them from file. I agree that it 
will be great to have libcamera support but

for now is not part of our up-streaming effort :/

Regards,

~Gjorgji

>
> On Fri, Mar 19, 2021 at 06:06:22PM +0000, Martina Krasteva wrote:
>> From: Martina Krasteva <martinax.krasteva@intel.com>
>>
>> Patch series contains Keem Bay Camera Subsystem driver implementation,
>> documentation and devicetree binding document.
>>
>> Gjorgji Rosikopulos (7):
>>    media: Keem Bay Camera: Keem Bay camera driver
>>    media: Keem Bay Camera: Add VPU camera interface
>>    uapi: Keem Bay ISP Parameters data types
>>    media: v4l: Add Keem Bay Camera meta buffer formats
>>    media: Keem Bay Camera: Add ISP sub-device
>>    media: Keem Bay Camera: Add metadata video node
>>    media: admin-guide: Add documentation for Keem Bay Camera
>>
>> Martina Krasteva (3):
>>    dt-bindings: media: Add bindings for Keem Bay Camera
>>    media: Keem Bay Camera: Add pipeline support
>>    media: Keem Bay Camera: Add capture video node
>>
>>   Documentation/admin-guide/media/keembay-camera.dot |   12 +
>>   Documentation/admin-guide/media/keembay-camera.rst |  174 ++
>>   Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>>   .../bindings/media/intel,keembay-camera.yaml       |   98 ++
>>   .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>>   .../media/v4l/pixfmt-meta-intel-kmb.rst            |   98 ++
>>   MAINTAINERS                                        |   14 +
>>   drivers/media/platform/Kconfig                     |    1 +
>>   drivers/media/platform/Makefile                    |    2 +
>>   drivers/media/platform/keembay-camera/Kconfig      |   11 +
>>   drivers/media/platform/keembay-camera/Makefile     |    5 +
>>   .../platform/keembay-camera/keembay-cam-xlink.c    |  327 ++++
>>   .../platform/keembay-camera/keembay-cam-xlink.h    |   49 +
>>   .../media/platform/keembay-camera/keembay-camera.c |  287 +++
>>   .../media/platform/keembay-camera/keembay-camera.h |   43 +
>>   .../media/platform/keembay-camera/keembay-isp.c    | 1397 +++++++++++++++
>>   .../media/platform/keembay-camera/keembay-isp.h    |  136 ++
>>   .../platform/keembay-camera/keembay-metadata.c     | 1860 ++++++++++++++++++++
>>   .../platform/keembay-camera/keembay-metadata.h     |  154 ++
>>   .../keembay-camera/keembay-params-defaults.c       |  326 ++++
>>   .../keembay-camera/keembay-params-defaults.h       |   38 +
>>   .../platform/keembay-camera/keembay-pipeline.c     |  401 +++++
>>   .../platform/keembay-camera/keembay-pipeline.h     |   75 +
>>   .../media/platform/keembay-camera/keembay-video.c  |  922 ++++++++++
>>   .../media/platform/keembay-camera/keembay-video.h  |   74 +
>>   .../platform/keembay-camera/keembay-vpu-cmd.h      |  110 ++
>>   .../platform/keembay-camera/keembay-vpu-frame.h    |  102 ++
>>   .../platform/keembay-camera/keembay-vpu-isp.h      |  724 ++++++++
>>   .../platform/keembay-camera/keembay-vpu-pipe.h     |  110 ++
>>   .../platform/keembay-camera/keembay-vpu-src.h      |  193 ++
>>   include/uapi/linux/keembay-isp-ctl.h               |  796 +++++++++
>>   include/uapi/linux/videodev2.h                     |    4 +
>>   32 files changed, 8545 insertions(+)
>>   create mode 100644 Documentation/admin-guide/media/keembay-camera.dot
>>   create mode 100644 Documentation/admin-guide/media/keembay-camera.rst
>>   create mode 100644 Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
>>   create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst
>>   create mode 100644 drivers/media/platform/keembay-camera/Kconfig
>>   create mode 100644 drivers/media/platform/keembay-camera/Makefile
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.c
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.c
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.c
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.c
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.c
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-params-defaults.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.c
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-video.c
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-video.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-cmd.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-frame.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-isp.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-pipe.h
>>   create mode 100644 drivers/media/platform/keembay-camera/keembay-vpu-src.h
>>   create mode 100644 include/uapi/linux/keembay-isp-ctl.h
>>
>>
>> base-commit: f00397ee41c79b6155b9b44abd0055b2c0621349
