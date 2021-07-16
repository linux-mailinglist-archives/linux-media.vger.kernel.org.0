Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3667E3CB2C6
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 08:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235045AbhGPGir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 02:38:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36622 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhGPGip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 02:38:45 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F1BD3F0;
        Fri, 16 Jul 2021 08:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626417348;
        bh=DFboP1NDlLZdc7mtpATJxXHw5fcYMFNjb4Zf58mPIS0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ljDdMH0BK8Pr4kkhvPoCc0vUd3/f9l2tKoJNrufFDxb8CQWJpoacLblIcT/JJ3YkP
         IZtYgjtrSb8B8m/0h/2GdlbBbdK3M4gtcAN7AQFyyctbxe5DJv4nFBT0g+diG5RvHQ
         dwxgmL7ptTDiY4KHbQ+Guc6YFaVdB8hVpYlMwCgU=
Subject: Re: [PATCH v7 07/27] media: entity: Use pad as the starting point for
 a pipeline
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-8-tomi.valkeinen@ideasonboard.com>
 <20210708123620.vltqnczhrsh3yl4s@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <00454a3b-d7d6-d610-3c2d-509b0f21dbf0@ideasonboard.com>
Date:   Fri, 16 Jul 2021 09:35:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708123620.vltqnczhrsh3yl4s@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/07/2021 15:36, Jacopo Mondi wrote:
> Hello Tomi,
>      A few minors and a question below
> 
> On Mon, May 24, 2021 at 01:43:48PM +0300, Tomi Valkeinen wrote:
>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> The pipeline has been moved from the entity to the pads; reflect this in
>> the media pipeline function API.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   Documentation/driver-api/media/mc-core.rst    |  6 ++--
>>   drivers/media/mc/mc-entity.c                  | 24 ++++++-------
>>   drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  6 ++--
>>   .../media/platform/exynos4-is/fimc-capture.c  |  8 ++---
>>   .../platform/exynos4-is/fimc-isp-video.c      |  8 ++---
>>   drivers/media/platform/exynos4-is/fimc-lite.c |  8 ++---
>>   drivers/media/platform/omap3isp/ispvideo.c    |  6 ++--
>>   .../media/platform/qcom/camss/camss-video.c   |  6 ++--
>>   drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++--
>>   .../platform/rockchip/rkisp1/rkisp1-capture.c |  6 ++--
>>   .../media/platform/s3c-camif/camif-capture.c  |  6 ++--
>>   drivers/media/platform/stm32/stm32-dcmi.c     |  6 ++--
>>   .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
>>   .../platform/sunxi/sun6i-csi/sun6i_video.c    |  6 ++--
>>   drivers/media/platform/ti-vpe/cal-video.c     |  6 ++--
>>   drivers/media/platform/vsp1/vsp1_video.c      |  6 ++--
>>   drivers/media/platform/xilinx/xilinx-dma.c    |  6 ++--
>>   .../media/test-drivers/vimc/vimc-capture.c    |  6 ++--
>>   drivers/media/usb/au0828/au0828-core.c        |  8 ++---
>>   drivers/staging/media/imx/imx-media-utils.c   |  6 ++--
>>   drivers/staging/media/ipu3/ipu3-v4l2.c        |  6 ++--
>>   drivers/staging/media/omap4iss/iss_video.c    |  6 ++--
>>   drivers/staging/media/tegra-video/tegra210.c  |  6 ++--
>>   include/media/media-entity.h                  | 34 +++++++++----------
>>   24 files changed, 98 insertions(+), 100 deletions(-)
>>
>> diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
>> index 8a13640bed56..69a64279a61f 100644
>> --- a/Documentation/driver-api/media/mc-core.rst
>> +++ b/Documentation/driver-api/media/mc-core.rst
>> @@ -213,11 +213,11 @@ When starting streaming, drivers must notify all entities in the pipeline to
>>   prevent link states from being modified during streaming by calling
>>   :c:func:`media_pipeline_start()`.
>>
>> -The function will mark all entities connected to the given entity through
>> -enabled links, either directly or indirectly, as streaming.
>> +The function will mark all entities connected to the given pad through
> 
> As the stream_count counter is now moved to the pads, should this be
> 
> +The function will mark all the pads connected to the given pad through
> 
>> +enabled routes and links, either directly or indirectly, as streaming.
>>
>>   The struct media_pipeline instance pointed to by
>> -the pipe argument will be stored in every entity in the pipeline.
>> +the pipe argument will be stored in every pad in the pipeline.
>>   Drivers should embed the struct media_pipeline
> 
> Does this still apply ?
> 
>>   in higher-level pipeline structures and can then access the
>>   pipeline through the struct media_entity
> 
> This sentence should probably be changed to
> 
> pipeline through the struct media_pad pipe field.

Thanks! I've made these two changes.

  Tomi

