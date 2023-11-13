Return-Path: <linux-media+bounces-236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB9F7E9D55
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E9D61C20937
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940C7208B6;
	Mon, 13 Nov 2023 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lQ/eqgdP"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4666208A6
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:38:52 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5F3132;
	Mon, 13 Nov 2023 05:38:50 -0800 (PST)
Received: from [192.168.1.112] (unknown [103.86.18.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9C0810A;
	Mon, 13 Nov 2023 14:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699882703;
	bh=/+ccMUeYSPw4zsyXj/yyi0BbfMoVfyiVZ7njT5tUw70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lQ/eqgdPwYXIUgNiJkyeRQiqAdouJYyS1i99VgNiNGUhLggy83r9U3h29OpHE+3us
	 i76DLxO8IhOzKkDiCoHSkSIHmUw4TyOCQTPg2yfj/Ph/ACjBT+OYmJCfHpPoChLDOz
	 rgAAnR2+0BmbMfElCNZZrzxgiy2slA8UoztLMoEY=
Message-ID: <f93c6c32-1dea-95e8-aafc-0893c66f6b03@ideasonboard.com>
Date: Mon, 13 Nov 2023 19:08:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 00/15] staging: vc04_services: bcm2835-isp support
To: Stefan Wahren <wahrenst@gmx.net>, linux-media@vger.kernel.org,
 kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>,
 Dan Carpenter <error27@gmail.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <aec3897e-3ff6-4256-aaef-0cc1d5e7822a@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <aec3897e-3ff6-4256-aaef-0cc1d5e7822a@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 11/10/23 4:02 PM, Stefan Wahren wrote:
> Hi Umang,
>
> Am 09.11.23 um 22:02 schrieb Umang Jain:
>> This series aims to upport bcm2835-isp from the RPi kernel.
>> It is developed on top of staging-next which comprises many
>> VC04 changes for it's de-staging. Hence, the merge of this
>> driver is targeted when VC04 is de-staged completely (which I
>> have been pushing), but it can be helped getting reviewed meanwhile.
>> Hence, the reason for posting the series.
>>
>> Patch (01-02)/15  adds a new driver named vc-sm-cma to handle memory 
>> sharing
>> with the VC4 VPU.
>>
>> Patch 03/15 adds a small extension to videobuf2 to allow exporting as a
>> dma_buf instead of a file-descriptor.
>>
>> Patch (04-05)/15 adds a couple of improvements/support for
>> bcm2835-isp(event callback and zero-copy) to vchiq-mmal.
>>
>> Patch (06-10)/15 adds the core bcm2835-isp driver along with headers
>> and format defintions. 09/15 is a standalone patch which can be merged
>> independently I believe.
>>
>> Patch (11-12)/15 deals with the colorspace support.
>>
>> Patch 13/15 allows multiple instances of the ISP.
>>
>> Patch 14/15 adds a admin-guide document on bcm2835-isp.
>>
>> Patch 15/15 deals with driver registeration.
>
> since this is V2, i couldn't find a changelog? The first one was one
> year ago, so it's very hard to remember. In such a case a link to the
> last version is also helpful.

I am in your same situation. The changelog won't help here since the I 
have too have lost count of the iterations.

In brief, I would say, the patches have further cleaned up and aligned, 
rebased over the latest staging-next branch.
That majorly includes work I did for VC04 in general for de-staging.

>
> Recently i saw you have a Github account. For such a complex series it's
> also very helpful to provide a link to a working test branch with this
> series applied. It's not a must, but appreciated.

I actually was going to send test branch but at the last minute I 
screwed up my .git repo because of a failed branch checkout.

I had to recreate the branches over the weekend and here they are:

I have tested these branches:

On RPi-3-b 32-bit:
Git branch: 
https://git.uk.ideasonboard.com/uajain/linux/commits/branch/uajain/rpi3/staging-next/isp

On RPi-4-b 64-bit:
Git branch: 
https://git.uk.ideasonboard.com/uajain/linux/commits/branch/uajain/rpi4/staging-next/isp

Both these branches have been tested with IMX219 sensor (there is a DT 
overlay included) and libcamera. These branches have bcm2835-unicam with 
streams support (which is handled by Laurent Pinchart as I believe) and 
on top sits bcm2835-isp (this series).
You'll find DT and kernel configs I have tested with, in the respective 
branches.

As far as libcamera branch goes (it requires a special branch due to 
streams support):
https://git.uk.ideasonboard.com/uajain/libcamera/commits/branch/pinchartl/rpi/streams

Let me know how you get on if you are testing. I am happy to answer/help 
if you decide to test this.
>
> Best regards
>
>>
>> Dave Stevenson (6):
>>    staging: vc04_services: Add new vc-sm-cma driver
>>    media: videobuf2: Allow exporting of a struct dmabuf
>>    staging: mmal-vchiq: Add support for event callbacks
>>    staging: mmal-vchiq: Use vc-sm-cma to support zero copy
>>    staging: mmal_vchiq: Add image formats to be used by bcm2835-isp
>>    uapi: bcm2835-isp: Add bcm2835-isp uapi header file
>>
>> David Plowman (2):
>>    vc04_services: bcm2835-isp: Allow formats with different colour 
>> spaces
>>    vc04_services: bcm2835-isp: Permit all sRGB colour spaces on ISP
>>      outputs
>>
>> Naushir Patuck (4):
>>    media: uapi: v4l2-core: Add ISP statistics output V4L2 fourcc type
>>    staging: vc04_services: bcm2835-isp: Add a more complex ISP 
>> processing
>>      component
>>    staging: vc04_services: bcm2835_isp: Allow multiple users
>>    docs: admin-guide: media: bcm2835-isp: Add documentation for
>>      bcm2835-isp
>>
>> Umang Jain (3):
>>    staging: vc04_services: vchiq_arm: Register vcsm-cma driver
>>    staging: vc04_services: Add helpers for vchiq driver data
>>    staging: vc04_services: vchiq: Register bcm2835-isp
>>
>>   .../admin-guide/media/bcm2835-isp.rst         |  127 ++
>>   .../userspace-api/media/drivers/index.rst     |    1 +
>>   .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>>   .../v4l/pixfmt-meta-bcm2835-isp-stats.rst     |   32 +
>>   MAINTAINERS                                   |    9 +
>>   .../media/common/videobuf2/videobuf2-core.c   |   36 +-
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>>   drivers/staging/vc04_services/Kconfig         |    4 +
>>   drivers/staging/vc04_services/Makefile        |    3 +-
>>   .../staging/vc04_services/bcm2835-isp/Kconfig |   14 +
>>   .../vc04_services/bcm2835-isp/Makefile        |    4 +
>>   .../bcm2835-isp/bcm2835-isp-ctrls.h           |   72 +
>>   .../bcm2835-isp/bcm2835-isp-fmts.h            |  559 +++++
>>   .../bcm2835-isp/bcm2835-v4l2-isp.c            | 1822 +++++++++++++++++
>>   .../interface/vchiq_arm/vchiq_arm.c           |    6 +
>>   .../interface/vchiq_arm/vchiq_bus.h           |   10 +
>>   .../staging/vc04_services/vc-sm-cma/Kconfig   |   10 +
>>   .../staging/vc04_services/vc-sm-cma/Makefile  |    4 +
>>   .../staging/vc04_services/vc-sm-cma/vc_sm.c   |  817 ++++++++
>>   .../staging/vc04_services/vc-sm-cma/vc_sm.h   |   54 +
>>   .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.c  |  507 +++++
>>   .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.h  |   63 +
>>   .../vc04_services/vc-sm-cma/vc_sm_defs.h      |  187 ++
>>   .../vc04_services/vc-sm-cma/vc_sm_knl.h       |   28 +
>>   .../staging/vc04_services/vchiq-mmal/Kconfig  |    1 +
>>   .../vc04_services/vchiq-mmal/mmal-common.h    |    5 +
>>   .../vc04_services/vchiq-mmal/mmal-encodings.h |   66 +
>>   .../vc04_services/vchiq-mmal/mmal-msg.h       |   35 +
>>   .../vchiq-mmal/mmal-parameters.h              |  165 +-
>>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  253 ++-
>>   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |    5 +
>>   include/media/videobuf2-core.h                |   15 +
>>   include/uapi/linux/bcm2835-isp.h              |  347 ++++
>>   include/uapi/linux/v4l2-controls.h            |    5 +
>>   include/uapi/linux/videodev2.h                |    1 +
>>   35 files changed, 5235 insertions(+), 34 deletions(-)
>>   create mode 100644 Documentation/admin-guide/media/bcm2835-isp.rst
>>   create mode 100644 
>> Documentation/userspace-api/media/v4l/pixfmt-meta-bcm2835-isp-stats.rst
>>   create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Kconfig
>>   create mode 100644 drivers/staging/vc04_services/bcm2835-isp/Makefile
>>   create mode 100644 
>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-ctrls.h
>>   create mode 100644 
>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h
>>   create mode 100644 
>> drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
>>   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Kconfig
>>   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Makefile
>>   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
>>   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.h
>>   create mode 100644 
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c
>>   create mode 100644 
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.h
>>   create mode 100644 
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_defs.h
>>   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_knl.h
>>   create mode 100644 include/uapi/linux/bcm2835-isp.h
>>


