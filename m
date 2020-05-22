Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6692B1DE293
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 11:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgEVJGx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 05:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgEVJGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 05:06:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF08CC061A0E
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 02:06:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 232362A098F
Subject: Re: [PATCH v4 0/5] media: add v4l2_pipeline_stream_{enable,disable}
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <1c8bd467-5a9c-7285-ec23-d0d864a5f938@collabora.com>
Date:   Fri, 22 May 2020 06:06:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for working on this.

On 5/22/20 4:55 AM, Dafna Hirschfeld wrote:
> Hi,
> This is v4 of the patchset that was sent by Helen Koike.
> 
> Media drivers need to iterate through the pipeline and call .s_stream()
> callbacks in the subdevices.
> 
> Instead of repeating code, add helpers for this.
> 
> These helpers will go walk through the pipeline only visiting entities
> that participates in the stream, i.e. it follows links from sink to source
> (and not the opposite).
> For example, in a topology like this https://bit.ly/3b2MxjI
> calling v4l2_pipeline_stream_enable() from rkisp1_mainpath won't call
> .s_stream(true) for rkisp1_resizer_selfpath.
> 
> stream_count variable was added in v4l2_subdevice to handle nested calls
> to the helpers.
> This is useful when the driver allows streaming from more then one
> capture device sharing subdevices.

If I understand correctly, this isn't  true anymore right? Nested calls aren't
possible anymore since this version doesn't contain stream_count in struct v4l2_subdevice.

Documentation of v4l2_pipeline_stream_*() should also be updated.

Just to be clear, without the nested call, vimc will require to add its own
counters, patch https://patchwork.kernel.org/patch/10948833/ will be
required again to allow multi streaming.

Also, patch "media: staging: rkisp1: cap: use v4l2_pipeline_stream_{enable,disable}"
is cleaner in the previous version (with stream_count in struct v4l2_subdevice).

All drivers that allows multi streaming will need to implement some special handling.

Adding stream_count in struct v4l2_subdevice still seems cleaner to me. I'd like to hear
what others think.

> 
> This patchset was tested on rkisp1 and vimc drivers.
> 
> Other cleanup might be possible (but I won't add in this patchset as I
> don't have the hw to test):
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/qcom/camss/camss-video.c#n430
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/omap3isp/isp.c#n697
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/stm32/stm32-dcmi.c#n680
> 	https://git.linuxtv.org/media_tree.git/tree/drivers/media/platform/xilinx/xilinx-dma.c#n97
> 
> Testing:
> --------
> 
> SEN_DEV=/dev/v4l-subdev3
> ISP_DEV=/dev/v4l-subdev0
> RSZ_SP_DEV=/dev/v4l-subdev2
> RSZ_MP_DEV=/dev/v4l-subdev1
> CAP_SP_DEV=/dev/video1
> CAP_MP_DEV=/dev/video0
> 
> WIDTH=1920
> HEIGHT=1080
> RAW_CODE=SRGGB10_1X10
> YUV_CODE=YUYV8_2X8
> 
> v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=$RAW_CODE -d $SEN_DEV
> 
> v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=$RAW_CODE -d $ISP_DEV
> v4l2-ctl --set-subdev-selection pad=0,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $ISP_DEV
> 
> v4l2-ctl --set-subdev-selection pad=2,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $ISP_DEV
> v4l2-ctl --set-subdev-fmt pad=2,width=$WIDTH,height=$HEIGHT,code=$YUV_CODE -d $ISP_DEV
> 
> v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=$YUV_CODE -d $RSZ_SP_DEV
> v4l2-ctl --set-subdev-fmt pad=1,width=$WIDTH,height=$HEIGHT,code=$YUV_CODE -d $RSZ_SP_DEV
> 
> v4l2-ctl --set-subdev-selection pad=0,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $RSZ_SP_DEV
> 
> v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=$YUV_CODE -d $RSZ_MP_DEV
> v4l2-ctl --set-subdev-fmt pad=1,width=$WIDTH,height=$HEIGHT,code=$YUV_CODE -d $RSZ_MP_DEV
> 
> v4l2-ctl --set-subdev-selection pad=0,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $RSZ_MP_DEV
> 
> v4l2-ctl -v width=$WIDTH,height=$HEIGHT,pixelformat=NV12 -d $CAP_SP_DEV
> v4l2-ctl -v width=$WIDTH,height=$HEIGHT,pixelformat=NV12 -d $CAP_MP_DEV
> 
> sleep 1
> 
> v4l2-ctl --stream-mmap --stream-count=100 -d $CAP_SP_DEV --stream-to=/tmp/test_sp.raw &
> v4l2-ctl --stream-mmap --stream-count=100 -d $CAP_MP_DEV --stream-to=/tmp/test_mp.raw &
> 
> wait
> echo "Completed"
> 
> 
> Changes in v4:
> ==============
> patch 1: fix coding style issues
> 
> patch 2:
> - in function v4l2_pipeline_subdevs_get, use a local media_graph to walk on the topology so a lock is not needed
> and also the pipe parameter is not needed.

You are assuming that media_pipeline_start() will always be called before v4l2_pipeline_stream_enable().
I think this is fine, but it should reflect in the docs.

Regards,
Helen

> - adding a function v4l2_subdevs_stream_disable to avoid code duplication
> - change v4l2_pipeline_stream_disable to return an error code if failed
> - don't add a new field to subdevice "stream_counter" when calling s_stream, since this counter is updated only in
> the helper functions, and might be confusing that it is generally not an indication of the number of calls to s_stream.
> Also, except of rkisp1, and vimc, it seems that the other drivers that might use the new helpers don't use a counter.
> 
> new added - patch 3: the call to media_pipeline_start should be called before calling s_stream on the subdevices in order
> to validate the links and prevents them from changing, this patch fixes it.
> 
> patch 4: (use the helpers in rkisp1). The helpers now don't have a counter for the number of calls to s_stream, so rkisp1
> should check if the other capture is streaming and in that case call s_stream only for its resizer.
> 
> patch 5: - (use the helpers in vimc)
> - test the return value of v4l2_pipeline_stream_disable
> - the call to the helerps now doesn't need the pipe parameter.
> 
> Overview of patches in V3:
> --------------------------
> 
> Patch 1/5 adds a new iterator function in media-controller to follow links from sink to
> source only.
> 
> Patch 2/5 adds the helpers in v4l2-common.c,
> 
> Patch 3/5 calles media_pipeline_start before calling s_stream on the subdevices
> 
> Patch 4/5 cleanup rkisp1 driver to use the helpers.
> 
> Patch 5/5 cleanup vimc driver to use the helpers.
> 
> Changes in V3:
> ====================
> Following up Niklas' comments in V2 https://patchwork.kernel.org/patch/11473681/#23270823
> 
> * I removed the limitation in topologies with entities with multiple enabled
> links to its sink pads in the topology.
> Now it enables all subdevs in the pipeline that have an enabled link going
> from sink to source while walking from the video device, so it can be
> also useful for rcar-vin driver.
> 
> To implement this, I added back in the series the patch from v1:
>     "media: mc-entity.c: add media_graph_walk_next_stream()"
> 
> * "size" was renamed to "max_size" in function v4l2_pipeline_subdevs_get()
> to reflect the maximum number of elements that can fit in the subdevs array,
> with proper documentation.
> 
> * v4l2_pipeline_subdevs_get() returns a negative number for error, instead
> of returning 0 and printing a warning.
> 
> * I also add if defined(CONFIG_MEDIA_CONTROLLER) around helpers to avoid
> compiling errors.
> 
> Overview of patches in V3:
> --------------------------
> 
> Patch 1/4 adds a new iterator function in media-controller to follow links from sink to
> source only.
> 
> Patch 2/4 adds the helpers in v4l2-common.c, allowing nested calls by
> adding stream_count in the subdevice struct.
> 
> Patch 3/4 cleanup rkisp1 driver to use the helpers.
> 
> Patch 4/4 cleanup vimc driver to use the helpers.
> 
> Changes in V2:
> ====================
> The first version was calling the s_stream() callbacks from sensor to
> capture.
> 
> This was generating errors in the Scarlet Chromebook, when the sensor
> was being enabled before the ISP.
> 
> It make sense to enable subdevices from capture to sensor instead (which
> is what most drivers do already).
> 
> This v2 drops the changes from mc-entity.c, and re-implement helpers in
> v4l2-common.c
> 
> Overview of patches in V2:
> --------------------------
> 
> Path 1/3 adds the helpers in v4l2-common.c, allowing nested calls by
> adding stream_count in the subdevice struct.
> 
> Patch 2/3 cleanup rkisp1 driver to use the helpers.
> 
> Patch 3/3 cleanup vimc driver to use the helpers.
> 
> Dafna Hirschfeld (1):
>   media: staging: rkisp1: validate links before powering and streaming
> 
> Helen Koike (4):
>   media: mc-entity.c: add media_graph_walk_next_stream()
>   media: v4l2-common: add helper functions to call s_stream() callbacks
>   media: staging: rkisp1: cap: use v4l2_pipeline_stream_{enable,disable}
>     helpers
>   media: vimc: use v4l2_pipeline_stream_{enable,disable} helpers
> 
>  drivers/media/mc/mc-entity.c                  |  34 ++++-
>  .../media/test-drivers/vimc/vimc-capture.c    |  31 +++--
>  .../media/test-drivers/vimc/vimc-streamer.c   |  49 +------
>  drivers/media/v4l2-core/v4l2-common.c         |  99 ++++++++++++++
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 125 ++++++------------
>  include/media/media-entity.h                  |  15 +++
>  include/media/v4l2-common.h                   |  39 ++++++
>  7 files changed, 253 insertions(+), 139 deletions(-)
> 
