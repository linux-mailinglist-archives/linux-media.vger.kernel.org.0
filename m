Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A681C5B2D
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 17:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbgEEPaj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 11:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729356AbgEEPaj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 11:30:39 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFA8C061A0F;
        Tue,  5 May 2020 08:30:38 -0700 (PDT)
Received: from [IPv6:2804:431:e7cd:1c96:62a8:9ef5:72d1:90eb] (unknown [IPv6:2804:431:e7cd:1c96:62a8:9ef5:72d1:90eb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E267D2A0712;
        Tue,  5 May 2020 16:30:29 +0100 (BST)
Subject: Re: [v6, 0/5] media: media: platform: mtk-isp: Add Mediatek ISP Pass
 1 driver
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     mchehab@kernel.org, shik@chromium.org, devicetree@vger.kernel.org,
        Sean.Cheng@mediatek.com, suleiman@chromium.org,
        Pi-Hsun Shih <pihsun@chromium.org>,
        srv_heupstream@mediatek.com, robh@kernel.org, ryan.yu@mediatek.com,
        Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com,
        sj.huang@mediatek.com, yuzhao@chromium.org,
        linux-mediatek@lists.infradead.org, zwisler@chromium.org,
        ddavenport@chromium.org, frederic.chen@mediatek.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        tfiga@chromium.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
 <23b9c2f4-04d4-38e0-c71f-7e1ef93265a2@collabora.com>
 <1586514762.8406.114.camel@mtksdccf07>
 <6a19dd95-e26d-1822-73b5-91c6e292dc76@collabora.com>
 <1fd3615eb18f48ada186bfe228fc907b@mtkmbs01n2.mediatek.inc>
 <1588596029.6897.39.camel@mtksdccf07>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <644f9036-d3f7-3a4f-f644-cee58088c62f@collabora.com>
Date:   Tue, 5 May 2020 12:30:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588596029.6897.39.camel@mtksdccf07>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On 5/4/20 9:40 AM, Jungo Lin wrote:
> 
> Hi Helen;
> 
> Sorry for late reply.
> Please check my feedback & questions below.
> 
> On Tue, 2020-04-14 at 09:25 -0300, Helen Koike wrote:
>>
>> Hi Jungo,
>>
>> On 4/10/20 7:32 AM, Jungo Lin wrote:
>>> Hi Helen:
>>>
>>> Thanks for your comment.
>>>
>>> On Tue, 2020-03-31 at 12:34 -0300, Helen Koike wrote:
>>>> Hi Jungo,
>>>>
>>>> I was taking a look at this patchset, please see my comments below.
>>>>
>>>> On 12/19/19 3:49 AM, Jungo Lin wrote:
>>>>> Hello,
>>>>>
>>>>> This patch series adding the driver for Pass 1 (P1) unit in
>>>>> Mediatek's camera ISP system on mt8183 SoC, which will be used in
>>>>> camera features of CrOS.
>>>>>
>>>>> Pass 1 unit processes image signal from sensor devices and accepts the
>>>>> tuning parameters to adjust the image quality. It performs optical
>>>>> black correction, defect pixel correction, W/IR imbalance correction
>>>>> and lens shading correction for RAW processing.
>>>>>
>>>>> The driver is implemented with V4L2 and media controller framework so
>>>>> we have the following entities to describe the ISP pass 1 path.
>>>>>
>>>>> (The current metadata interface used in meta input and partial meta
>>>>> nodes is only a temporary solution to kick off the driver development
>>>>> and is not ready to be reviewed yet.)
>>>>>
>>>>> 1. meta input (output video device): connect to ISP P1 sub device.
>>>>> It accepts the tuning buffer from user.
>>>>>
>>>>> 2. ISP P1 (sub device): connect to partial meta 0/1/2/3,
>>>>> main stream and packed out video devices. When processing an image,
>>>>> Pass 1 hardware supports multiple output images with different sizes
>>>>> and formats so it needs two capture video devices ("main stream" and
>>>>> "packed out") to return the image data to the user.
>>>>>
>>>>> 3. main stream (capture video device): return the processed image data
>>>>> which is used in capture scenario.
>>>>>
>>>>> 4. packed out (capture video device): return the processed image data
>>>>> which is used in preview scenario.
>>>>>
>>>>> 5. partial meta 0 (capture video device): return the AE/AWB statistics.
>>>>>
>>>>> 6. partial meta 1 (capture video device): return the AF statistics.
>>>>>
>>>>> 7. partial meta 2 (capture video device): return the local contrast
>>>>>    enhanced statistics.
>>>>>
>>>>> 8. partial meta 3 (capture video device): return the local motion
>>>>>    vector statistics.
>>>>>
>>>>> The overall patches of the series is:
>>>>>
>>>>> * Patch 1 & 2 are dt-bindings & dts information related to ISP P1 driver.
>>>>> * Patch 3 adds new timestamp type for Camera AR (Augmented Reality) application
>>>>> * Patch 4 extends the original V4L2 image & meta formats for ISP P1 driver.
>>>>> * Patch 5 is the heart of ISP P1 driver. It handles the ISP  HW configuration.
>>>>>   Moreover, implement standard V4L2 video driver that utilizes
>>>>>   V4L2 and media framework APIs. Communicate with co-process via SCP
>>>>>   communication to compose ISP registers in the firmware.
>>>>>
>>>>> Here is ISP P1 media topology:
>>>>> It is included the main/sub sensor, sen-inf sub-devices and len device
>>>>> which are implemented in below patch[1][2][3][4]:
>>>>
>>>> I would be nice if you could provide a branch with those applied.
>>>>
>>>
>>> We apply those patches in the chromeos-4.19 to test.
>>> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19
>>>
>>>
>>>>>
>>>>> For Mediatek ISP P1 driver, it also depends on MT8183 SCP[5] & IOMMU[6]
>>>>> patch sets.
>>>>>
>>>>> /usr/bin/media-ctl -p -d /dev/media2
>>>>>
>>>>> Media controller API version 4.19.89
>>>>>
>>>>> Media device information
>>>>> ------------------------
>>>>> driver          mtk-cam-p1
>>>>> model           mtk-cam-p1
>>>>> serial
>>>>> bus info        platform:1a000000.camisp
>>>>> hw revision     0x0
>>>>> driver version  4.19.89
>>>>>
>>>>> Device topology
>>>>> - entity 1: mtk-cam-p1 (12 pads, 8 links)
>>>>
>>>> If I understand correctly, the hardware supports 3 ISP instances, A, B, and C, and only B is being used.
>>>> Is this correct?
>>>>
>>>> So maybe, rename it to mtk-isp-p1-b, to allow mtk-isp-p1-a and mtk-isp-p1-c to be added in the future.
>>>>
>>>
>>> Currently, we only support single-cam in this SoC with upstream driver.
>>> It is plan in next Mediatek SoC to support multi-cam capabilities. So
>>> we'd like to keep the naming to avoid confusion.
>>
>> I suppose this new Mediatek SoC would use this same driver?
>> I'm just thinking about backwards compatibility. When you add support for this other SoC, the topology
>> naming will be different then, right? (I guess it's ok).
>>
> 
> Sorry, my last comment should be corrected.
> The new Mediatek SoC with new ISP HW version will support multi-cam
> capabilities with new upstream driver. Due to the new enrich function,
> it may not reuse current driver.

right, thanks for the clarification.

> 
>>>
>>>>>             type V4L2 subdev subtype Unknown flags 0
>>>>>             device node name /dev/v4l-subdev0
>>>>> pad0: Sink
>>>>> <- "mtk-cam-p1 meta input":0 []
>>>>
>>>> I would prefer the name params, or parameters, since input/output is confusing, since this is a output video node.
>>>>
>>>
>>> Ok, we will revise our naming in next patch.
>>>
>>>>> pad1: Source
>>>>> -> "mtk-cam-p1 main stream":0 [ENABLED,IMMUTABLE]
>>>>
>>>> Is there any reason for this link to be IMMUTABLE? Can't a use "mtk-cam-p1 packed out" without configuring "mtk-cam-p1 main stream" ?
>>>>
>>>
>>> Yes, you are right. We will remove IMMUTABLE flag in next patch.
>>>
>>>>> pad2: Source
>>>>> -> "mtk-cam-p1 packed out":0 []
>>>>
>>>> Same here, maybe "packed stream" ? Just for curiosity, why is it called packed?
>>>>
>>>
>>> Comparing with V4L2_PIX_FMT_SGBRG8, we packed the color bits without no
>>> padding in the memory. We may revise the naming in next patch.
>>>
>>>>> pad3: Source
>>>>> -> "mtk-cam-p1 partial meta 0":0 []
>>>>> pad4: Source
>>>>> -> "mtk-cam-p1 partial meta 1":0 []
>>>>> pad5: Source
>>>>> -> "mtk-cam-p1 partial meta 2":0 []
>>>>> pad6: Source
>>>>> -> "mtk-cam-p1 partial meta 3":0 []
>>>>
>>>> Shouldn't those links be [ENABLED,IMMUTABLE] ?
>>>>
>>>> It would be better to have a more intuitive naming, e.g. "mtk-cam-p1 AE/AWB stats", "mtk-cam-p1 AF stats",
>>>> "mtk-cam-p1 contrast stats", "mtk-cam-p1 motion stats", what do you think?
>>>>
>>>> I also would prefer to remove blank spaces.
>>>>
>>>> And maybe the prefix could be mtkisp-p1 ? (just to be similar with rkisp1), but I don't have strong feelings about this.
>>>>
>>>
>>> No, these links are optional to setup for userspace.
>>
>> Right, I just saw in the patch that you use links to know which video nodes should participate in the stream,
>> and you wait for STREAM_ON to be called in all video nodes before actually enabling the stream, correct?
>>
>> I'm not sure if using the link state is the best option (please see my comment on 5/5).
>> Instead of waiting for them to call STREAM_ON, userspace could do a request to enable the stream in all the
>> interesting nodes at once.
>>
>>
>> Regards,
>> Helen
>>
> 
> 
> According to your suggestion, do you have sample code about "userspace
> could do a request to enable the stream in all the interesting nodes at
> once"? If this supports, it is helpful for us to simply our current
> implementation.

I was checking the request api docs [1] in more details and it seems this isn't possible, since
"A request must contain at least one buffer, otherwise ENOENT is returned", and STREAMON is not listed
on MEDIA_IOC_REQUEST_ALLOC doc[2].

[1] https://www.kernel.org/doc/html/latest/media/uapi/mediactl/request-api.html
[2] https://www.kernel.org/doc/html/latest/media/uapi/mediactl/media-ioc-request-alloc.html#media-ioc-request-alloc

What bothers me with the current implementation is that users could correctly configure the topology, but when
calling VIDIOC_STREAMON in one capture node, if userspace doesn't call VIDIOC_STREAMON in all other capture nodes
with enabled link, streaming will just "hang" (waiting for other nodes) without providing any feedback
for userspace about what is wrong.

So I was trying to think about how this could be done differently.
I wonder it if would make sense to extend the Request API to allow calling VIDIOC_STREAMON to multiple nodes at once.
If not, I guess we could at least add documentation somewhere explaining that calling VIDIOC_STREAMON in all capture
nodes with enabled link is required to use this driver. Or/And add a dev_info() to print every time VIDIOC_STREAMON
is called to inform that streaming is being held because it is waiting for other VIDIOC_STREAMON calls.

Regards,
Helen


> 
> 
> Thanks,
> 
> 
> Jungo
> 
> 
>>> For naming part, we will align with driver source codes.
>>>
>>>>> pad7: Source
>>>>> pad8: Source
>>>>> pad9: Source
>>>>> pad10: Source
>>>>
>>>> Why source pads that are not connected to anything? (I guess I need to check the last patch better).
>>>>
>>>
>>> These pads are just reserved purpose.
>>> We will plan to remove them in next patch.
>>>
>>> Thanks,
>>>
>>> Jungo
>>>
>>>> Regards,
>>>> Helen
>>>>
>>>>> pad11: Sink
>>>>> <- "1a040000.seninf":4 [ENABLED,IMMUTABLE]
>>>>>
>>>>> - entity 14: mtk-cam-p1 meta input (1 pad, 1 link)
>>>>>              type Node subtype V4L flags 0
>>>>>              device node name /dev/video2
>>>>> pad0: Source
>>>>> -> "mtk-cam-p1":0 []
>>>>>
>>>>> - entity 20: mtk-cam-p1 main stream (1 pad, 1 link)
>>>>>              type Node subtype V4L flags 0
>>>>>              device node name /dev/video3
>>>>> pad0: Sink
>>>>> <- "mtk-cam-p1":1 [ENABLED,IMMUTABLE]
>>>>>
>>>>> - entity 26: mtk-cam-p1 packed out (1 pad, 1 link)
>>>>>              type Node subtype V4L flags 0
>>>>>              device node name /dev/video4
>>>>> pad0: Sink
>>>>> <- "mtk-cam-p1":2 []
>>>>>
>>>>> - entity 32: mtk-cam-p1 partial meta 0 (1 pad, 1 link)
>>>>>              type Node subtype V4L flags 0
>>>>>              device node name /dev/video5
>>>>> pad0: Sink
>>>>> <- "mtk-cam-p1":3 []
>>>>>
>>>>> - entity 38: mtk-cam-p1 partial meta 1 (1 pad, 1 link)
>>>>>              type Node subtype V4L flags 0
>>>>>              device node name /dev/video6
>>>>> pad0: Sink
>>>>> <- "mtk-cam-p1":4 []
>>>>>
>>>>> - entity 44: mtk-cam-p1 partial meta 2 (1 pad, 1 link)
>>>>>              type Node subtype V4L flags 0
>>>>>              device node name /dev/video7
>>>>> pad0: Sink
>>>>> <- "mtk-cam-p1":5 []
>>>>>
>>>>> - entity 50: mtk-cam-p1 partial meta 3 (1 pad, 1 link)
>>>>>              type Node subtype V4L flags 0
>>>>>              device node name /dev/video8
>>>>> pad0: Sink
>>>>> <- "mtk-cam-p1":6 []
>>>>>
>>>>> - entity 56: 1a040000.seninf (12 pads, 3 links)
>>>>>              type V4L2 subdev subtype Unknown flags 0
>>>>>              device node name /dev/v4l-subdev1
>>>>> pad0: Sink
>>>>> [fmt:SGRBG10_1X10/3264x2448 field:none colorspace:srgb]
>>>>> <- "ov8856 2-0010":0 [ENABLED]
>>>>> pad1: Sink
>>>>> [fmt:SRGGB10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> <- "ov02a10 4-003d":0 []
>>>>> pad2: Sink
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad3: Sink
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad4: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> -> "mtk-cam-p1":11 [ENABLED,IMMUTABLE]
>>>>> pad5: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad6: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad7: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad8: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad9: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad10: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>> pad11: Source
>>>>> [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb]
>>>>>
>>>>> - entity 69: ov8856 2-0010 (1 pad, 1 link)
>>>>>              type V4L2 subdev subtype Sensor flags 0
>>>>>              device node name /dev/v4l-subdev2
>>>>> pad0: Source
>>>>> [fmt:SBGGR10_1X10/3264x2448 field:none colorspace:unknown ycbcr:709]
>>>>> -> "1a040000.seninf":0 [ENABLED]
>>>>>
>>>>> - entity 73: dw9768 2-000c (0 pad, 0 link)
>>>>>              type V4L2 subdev subtype Lens flags 0
>>>>>              device node name /dev/v4l-subdev3
>>>>>
>>>>> - entity 74: ov02a10 4-003d (1 pad, 1 link)
>>>>>              type V4L2 subdev subtype Sensor flags 0
>>>>>              device node name /dev/v4l-subdev4
>>>>> pad0: Source
>>>>> [fmt:SRGGB10_1X10/1600x1200 field:none]
>>>>> -> "1a040000.seninf":1 []
>>>>>
>>>>> ===========
>>>>> = history =
>>>>> ===========
>>>>>
>>>>> version 6:
>>>>>  - Add port node description in the dt-binding document and device tree
>>>>>    by Tomasz Figa.
>>>>>  - Remove RGB format definitions in pixfmt-rgb.rst for kernel v5.5-rc1
>>>>>    version.
>>>>>  - Revise help description for VIDEO_MEDIATEK_ISP_PASS1.
>>>>>  - Apply SCP v21 change in P1 driver by Pi-Hsun Shih.
>>>>>  - Correct auto suspend timer value for suspend/resume issue.
>>>>>  - Increase IPI guard timer to 1 second to avoid false alarm command
>>>>>    timeout event.
>>>>>  - Fix KE due to no sen-inf sub-device.
>>>>>
>>>>> Todo:
>>>>>  - vb2_ops's buf_request_complete callback function implementation.
>>>>>  - Add rst documents for Mediatek meta formats.
>>>>>  - New meta buffer structure design & re-factoring.
>>>>>
>>>>> version 5:
>>>>>  - Fixed Rob's comment on dt-binding format
>>>>>  - Fix Tomasz's comment in mtk_isp_pm_suspend function
>>>>>  - Support V4L2_BUF_FLAG_TIMESTAMP_BOOTTIME timestamp flag
>>>>>    and new timestamp type in driver
>>>>>  - Fix buffer en-queue timing issue in v4
>>>>>  - Remove default link_notify callback function in mtk_cam_media_ops
>>>>>
>>>>> Todo:
>>>>>  - vb2_ops's buf_request_complete callback function implementation
>>>>>  - Add rst documents for Mediatek meta formats
>>>>>  - New meta buffer structure design & re-factoring
>>>>>  - Align and pack IPI command structures for EC ROM size shrink
>>>>>
>>>>> version 4:
>>>>>  - Fix Tomasz's comments which are addressed in MTK ISP P1 driver v3
>>>>>    patch[4]
>>>>>  - Fix some Tomasz comments which are addressed in DIP's v2 patch[5]
>>>>>  - Extend Mediatek proprietary image formats to support bayer order
>>>>>  - Support V4L2_BUF_FLAG_TSTAMP_SRC_SOE for capture devices
>>>>>
>>>>> Todo:
>>>>>  - vb2_ops's buf_request_complete callback function implementation
>>>>>  - Add rst documents for Mediatek meta formats
>>>>>  - New meta buffer structure design & re-factoring
>>>>>  - Support V4L2_BUF_FLAG_TIMESTAMP_BOOTTIME timestamp flag
>>>>>  - Align and pack IPI command structures for EC ROM size shrink
>>>>>
>>>>> version 3:
>>>>>  - Remove ISP Pass 1 reserved memory device node and change to use SCP's
>>>>>    reserved memory region. (Rob Herring)
>>>>>  - Fix comments of ISP Pass 1 device node & dt-bindings document (Rob Herring)
>>>>>  - Revise ISP Pass1 Kconfig
>>>>>  - Add rst documents for Mediatek image formats (Hans Verkuil)
>>>>>  - Fix kernel warning messages when running v4l2_compliance test
>>>>>  - Move AFO buffer enqueue & de-queue from request API to non-request
>>>>>  - mtk_cam-ctrl.h/mtk_cam-ctrl.c
>>>>>    Revise Mediatek ISP Pass1 specific V4L2 control naming & file licence
>>>>>    declaration (Hans Verkuil)
>>>>>    Split GET_BIN_INFO control into two controls to get width & height
>>>>>    in-dependently (Hans Verkuil)
>>>>>  - mtk_cam-v4l2-util.h/mtk_cam-v4l2-util.c
>>>>>    Merging mtk_cam-dev.c and mtk_cam-v4l2-util.c. (Drew Davenport)
>>>>>    Remove the pix_mode argument in related functions and unreachable code. (Drew Davenport)
>>>>>    Fix Drew's comments which are addressed in v2 patch
>>>>>    Fix some Tomasz comments which are addressed in DIP's v1 patch[3]
>>>>>  - mtk_cam-regs.h / mtk_cam.h / mtk_cam.c
>>>>>    Fix Drew's comments which are addressed in v2 patch
>>>>>    Fix some Tomasz comments which are addressed in DIP's v1 patch[3]
>>>>>    Refactoring mtk_isp_config & mtk_isp_req_enqueue functions
>>>>>  - mtk_cam-scp.h / mtk_cam-scp.c
>>>>>    Move function declarations from mtk_cam.h to mtk_cam-scp.h (Drew Davenport)
>>>>>    Fix some Tomasz comments which are addressed in DIP's v1 patch[3]
>>>>>    Fix ISP de-initialize timing KE issue
>>>>>  - mtk_cam-smem.h / mtk_cam-smem-dev.c
>>>>>    Get the reserved shared memory via SCP driver (Tomasz Figa)
>>>>>
>>>>> Todo:
>>>>>  - Add rst documents for Mediatek meta formats
>>>>>  - New meta buffer structure design & re-factoring
>>>>>
>>>>> version 2:
>>>>>  - Add 3A enhancement feature which includes:
>>>>>    Separates 3A pipeline out of frame basis to improve
>>>>>    AE/AWB (exposure and white balance) performance.
>>>>>    Add 2 SCP sub-commands for 3A meta buffers.
>>>>>  - Add new child device to manage P1 shared memory between P1 HW unit
>>>>>    and co-processor.
>>>>>  - Remove mediatek,cam_smem.txt & cam_smem dts node in mt8183.dtsi.
>>>>>  - Revised document wording for dt-bindings documents & dts information.
>>>>>  - Remove mtk_cam-ctx.h & mtk_cam-dev-ctx-core.c and move these
>>>>>    source codes to mtk_cam-dev.h & mtk_cam-dev.c.
>>>>>  - mtk_cam-dev.h / mtk_cam-dev.c
>>>>>    Revised mtk_cam_video_device & mtk_cam_dev to remove unused structure fields
>>>>>    or add comments.
>>>>>    Revised buffer size for LMVO & LCSO.
>>>>>    Fix pixel format utility function.
>>>>>    Add vb2_dma_contig_set_max_seg_size to configure DMA max segment size.
>>>>>  - mtk_cam-v4l2-util.c
>>>>>    Refactoring V4L2 async mechanism with seninf driver only
>>>>>    Refactoring CIO (Connection IO) implementation with active sensor
>>>>>    Revised stream on function for 3A enhancement feature
>>>>>    Add new V4L2 en-queue/de-queue utility functions for 3A enhancement feature
>>>>>  - mtk_cam-regs.h / mtk_cam.h / mtk_cam.c
>>>>>    Add meta buffer index register definitions
>>>>>    Add meta DMA configuration function.
>>>>>    Separate with frame-base and non-frame-base en-queue/de-queue functions
>>>>>    Add isp_setup_scp_rproc function to get RPC handle
>>>>>    Add mtk_cam_reserved_memory_init for shared memory management
>>>>>  - mtk_cam-scp.h / mtk_cam-scp.c
>>>>>    Add new meta strictures for 3A enhancement feature
>>>>>    Add new IPI command utility function for 3A enhancement feature
>>>>>    Enhance isp_composer_dma_sg_init function flow
>>>>>    Shorten overall IPI command structure size
>>>>>    Remove scp_state state checking
>>>>>    Improve code readability
>>>>>  - mtk_cam-smem.h / mtk_cam-smem-dev.c
>>>>>    Add mtk_cam_alloc_smem_dev to allocate one new child device of ISP driver.
>>>>>    Handling P1 driver 's reserved memory & allocate DMA buffers based on this
>>>>>    memory region.
>>>>>
>>>>> TODOs:
>>>>>  - 3A enhancement feature bug fixing
>>>>>
>>>>> version 1:
>>>>>  - Revised driver sources based on Tomasz's comments including
>>>>>    part1/2/3/4 in RFC V0 patch.
>>>>>  - Remove DMA cache mechanism.
>>>>>    Support two new video devices (LCSO/LMVO) for advance camera
>>>>>    features.
>>>>>  - Fixed v4l2-compliance test failure items.
>>>>>  - Add private controls for Mediatek camera middle-ware.
>>>>>  - Replace VPU driver's APIs with new SCP driver interface for
>>>>>    co-processor communication.
>>>>>  - Refactoring mtk_cam_scp.c to use ring-buffers mechanism for IPI
>>>>>    commands RX handling.
>>>>>  - Fix internal bugs.
>>>>>
>>>>> TODOs:
>>>>>  - Remove mtk_cam_smem_drv.c & mtk_cam_smem.h and implement DMA pool
>>>>>    for shared memory management.
>>>>>  - Revised file names.
>>>>>  - Support non frame-sync AFO/AAO DMA buffers
>>>>>
>>>>> version 0:
>>>>> - Initial submission
>>>>>
>>>>> ==================
>>>>>  Dependent patch set
>>>>> ==================
>>>>>
>>>>> Camera ISP P1 driver depends on seninf driver, SCP driver.
>>>>> The patches are listed as following:
>>>>>
>>>>> [1]. media: support Mediatek sensor interface driver
>>>>> https://patchwork.kernel.org/cover/11145845/
>>>>>
>>>>> [2]. media: ov8856: Add YAML binding and sensor mode support
>>>>> https://patchwork.kernel.org/cover/11220785/
>>>>>
>>>>> [3]. media: i2c: Add support for OV02A10 sensor
>>>>> https://patchwork.kernel.org/cover/11284779/
>>>>>
>>>>> [4]. media: i2c: add support for DW9768 VCM driver
>>>>> https://patchwork.kernel.org/cover/11132299/
>>>>>
>>>>> [5]. Add support for mt8183 SCP
>>>>> https://patchwork.kernel.org/cover/11239065/
>>>>>
>>>>> [6]. MT8183 IOMMU SUPPORT
>>>>> https://patchwork.kernel.org/cover/11112765/
>>>>>
>>>>> ==================
>>>>>  Compliance test
>>>>> ==================
>>>>>
>>>>> The v4l2-compliance is built with the below lastest patch.
>>>>> https://git.linuxtv.org/v4l-utils.git/commit/?id=e9a7593ec6ae98704ecb35ea64948d34c23a5158
>>>>>
>>>>> Note 1.
>>>>> This testing depends on the above seninf, sensors and len patches[1][2][3][4].
>>>>>
>>>>> Note 2.
>>>>> For failed test csaes in video2~8, it is caused by new V4L2 timestamp
>>>>> called V4L2_BUF_FLAG_TIMESTAMP_BOOTIME.
>>>>>
>>>>> Note 3.
>>>>> The current some failure items are related to Mediatek sensors/len driver [2][3][3]
>>>>>
>>>>> /usr/bin/v4l2-compliance -m /dev/media2
>>>>>
>>>>> v4l2-compliance SHA: not available, 32 bits
>>>>>
>>>>> Compliance test for mtk-cam-p1 device /dev/media1:
>>>>>
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.67
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.67
>>>>>
>>>>> Required ioctls:
>>>>> test MEDIA_IOC_DEVICE_INFO: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/media1 open: OK
>>>>> test MEDIA_IOC_DEVICE_INFO: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Media Controller ioctls:
>>>>> test MEDIA_IOC_G_TOPOLOGY: OK
>>>>> Entities: 11 Interfaces: 11 Pads: 33 Links: 21
>>>>> test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>>>> test MEDIA_IOC_SETUP_LINK: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/media1: 7, Succeeded: 7, Failed: 0, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video25:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.67
>>>>> Capabilities     : 0x8c200000
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x0c200000
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.67
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.67
>>>>> Interface Info:
>>>>> ID               : 0x03000010
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x0000000e (14)
>>>>> Name             : mtk-cam-p1 meta input
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x0100000f   : 0: Source
>>>>>   Link 0x02000012: to remote pad 0x1000002 of entity 'mtk-cam-p1': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video25 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composiv4l2-compliance SHA: not available, 32 bits
>>>>>
>>>>> Compliance test for mtk-cam-p1 device /dev/media2:
>>>>>
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>>
>>>>> Required ioctls:
>>>>> test MEDIA_IOC_DEVICE_INFO: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/media2 open: OK
>>>>> test MEDIA_IOC_DEVICE_INFO: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Media Controller ioctls:
>>>>> test MEDIA_IOC_G_TOPOLOGY: OK
>>>>> Entities: 12 Interfaces: 12 Pads: 33 Links: 22
>>>>> test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>>>> test MEDIA_IOC_SETUP_LINK: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/media2: 7, Succeeded: 7, Failed: 0, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video2:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.89
>>>>> Capabilities     : 0x8c200000
>>>>> Metadata Output
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x0c200000
>>>>> Metadata Output
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000010
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x0000000e (14)
>>>>> Name             : mtk-cam-p1 meta input
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x0100000f   : 0: Source
>>>>>   Link 0x02000012: to remote pad 0x1000002 of entity 'mtk-cam-p1': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video2 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> fail: v4l2-test-buffers.cpp(370): timestamp != V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC && timestamp != V4L2_BUF_FLAG_TIMESTAMP_COPY
>>>>> fail: v4l2-test-buffers.cpp(486): buf.check(Unqueued, i)
>>>>> fail: v4l2-test-buffers.cpp(615): testQueryBuf(node, i, q.g_buffers())
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>>>> fail: v4l2-test-buffers.cpp(747): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
>>>>> fail: v4l2-test-buffers.cpp(748): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/video2: 45, Succeeded: 44, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video3:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.89
>>>>> Capabilities     : 0x84201000
>>>>> Video Capture Multiplanar
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x04201000
>>>>> Video Capture Multiplanar
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000016
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x00000014 (20)
>>>>> Name             : mtk-cam-p1 main stream
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x01000015   : 0: Sink
>>>>>   Link 0x02000018: from remote pad 0x1000003 of entity 'mtk-cam-p1': Data, Enabled, Immutable
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video3 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> fail: v4l2-test-buffers.cpp(370): timestamp != V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC && timestamp != V4L2_BUF_FLAG_TIMESTAMP_COPY
>>>>> fail: v4l2-test-buffers.cpp(486): buf.check(Unqueued, i)
>>>>> fail: v4l2-test-buffers.cpp(615): testQueryBuf(node, i, q.g_buffers())
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>>>> fail: v4l2-test-buffers.cpp(747): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
>>>>> fail: v4l2-test-buffers.cpp(748): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/video3: 45, Succeeded: 44, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video4:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.89
>>>>> Capabilities     : 0x84201000
>>>>> Video Capture Multiplanar
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x04201000
>>>>> Video Capture Multiplanar
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x0300001c
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x0000001a (26)
>>>>> Name             : mtk-cam-p1 packed out
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x0100001b   : 0: Sink
>>>>>   Link 0x0200001e: from remote pad 0x1000004 of entity 'mtk-cam-p1': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video4 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> fail: v4l2-test-buffers.cpp(370): timestamp != V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC && timestamp != V4L2_BUF_FLAG_TIMESTAMP_COPY
>>>>> fail: v4l2-test-buffers.cpp(486): buf.check(Unqueued, i)
>>>>> fail: v4l2-test-buffers.cpp(615): testQueryBuf(node, i, q.g_buffers())
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>>>> fail: v4l2-test-buffers.cpp(747): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
>>>>> fail: v4l2-test-buffers.cpp(748): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/video4: 45, Succeeded: 44, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video5:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.89
>>>>> Capabilities     : 0x84a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x04a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000022
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x00000020 (32)
>>>>> Name             : mtk-cam-p1 partial meta 0
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x01000021   : 0: Sink
>>>>>   Link 0x02000024: from remote pad 0x1000005 of entity 'mtk-cam-p1': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video5 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> fail: v4l2-test-buffers.cpp(370): timestamp != V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC && timestamp != V4L2_BUF_FLAG_TIMESTAMP_COPY
>>>>> fail: v4l2-test-buffers.cpp(486): buf.check(Unqueued, i)
>>>>> fail: v4l2-test-buffers.cpp(615): testQueryBuf(node, i, q.g_buffers())
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>>>> fail: v4l2-test-buffers.cpp(747): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
>>>>> fail: v4l2-test-buffers.cpp(748): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/video5: 45, Succeeded: 44, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video6:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.89
>>>>> Capabilities     : 0x84a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x04a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000028
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x00000026 (38)
>>>>> Name             : mtk-cam-p1 partial meta 1
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x01000027   : 0: Sink
>>>>>   Link 0x0200002a: from remote pad 0x1000006 of entity 'mtk-cam-p1': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video6 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> fail: v4l2-test-buffers.cpp(370): timestamp != V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC && timestamp != V4L2_BUF_FLAG_TIMESTAMP_COPY
>>>>> fail: v4l2-test-buffers.cpp(486): buf.check(Unqueued, i)
>>>>> fail: v4l2-test-buffers.cpp(615): testQueryBuf(node, i, q.g_buffers())
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>>>> fail: v4l2-test-buffers.cpp(747): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
>>>>> fail: v4l2-test-buffers.cpp(748): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/video6: 45, Succeeded: 44, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video7:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.89
>>>>> Capabilities     : 0x84a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x04a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x0300002e
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x0000002c (44)
>>>>> Name             : mtk-cam-p1 partial meta 2
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x0100002d   : 0: Sink
>>>>>   Link 0x02000030: from remote pad 0x1000007 of entity 'mtk-cam-p1': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video7 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> fail: v4l2-test-buffers.cpp(370): timestamp != V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC && timestamp != V4L2_BUF_FLAG_TIMESTAMP_COPY
>>>>> fail: v4l2-test-buffers.cpp(486): buf.check(Unqueued, i)
>>>>> fail: v4l2-test-buffers.cpp(615): testQueryBuf(node, i, q.g_buffers())
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>>>> fail: v4l2-test-buffers.cpp(747): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
>>>>> fail: v4l2-test-buffers.cpp(748): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/video7: 45, Succeeded: 44, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/video8:
>>>>>
>>>>> Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Card type        : mtk-cam-p1
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Driver version   : 4.19.89
>>>>> Capabilities     : 0x84a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Device Capabilities
>>>>> Device Caps      : 0x04a00000
>>>>> Metadata Capture
>>>>> Streaming
>>>>> Extended Pix Format
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000034
>>>>> Type             : V4L Video
>>>>> Entity Info:
>>>>> ID               : 0x00000032 (50)
>>>>> Name             : mtk-cam-p1 partial meta 3
>>>>> Function         : V4L2 I/O
>>>>> Pad 0x01000033   : 0: Sink
>>>>>   Link 0x02000036: from remote pad 0x1000008 of entity 'mtk-cam-p1': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/video8 open: OK
>>>>> test VIDIOC_QUERYCAP: OK
>>>>> test VIDIOC_G/S_PRIORITY: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK
>>>>> test VIDIOC_TRY_FMT: OK
>>>>> test VIDIOC_S_FMT: OK
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> fail: v4l2-test-buffers.cpp(370): timestamp != V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC && timestamp != V4L2_BUF_FLAG_TIMESTAMP_COPY
>>>>> fail: v4l2-test-buffers.cpp(486): buf.check(Unqueued, i)
>>>>> fail: v4l2-test-buffers.cpp(615): testQueryBuf(node, i, q.g_buffers())
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>>>> fail: v4l2-test-buffers.cpp(747): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
>>>>> fail: v4l2-test-buffers.cpp(748): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/video8: 45, Succeeded: 44, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/v4l-subdev0:
>>>>>
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000050
>>>>> Type             : V4L Sub-Device
>>>>> Entity Info:
>>>>> ID               : 0x00000001 (1)
>>>>> Name             : mtk-cam-p1
>>>>> Function         : Video Pixel Formatter
>>>>> Pad 0x01000002   : 0: Sink
>>>>>   Link 0x02000012: from remote pad 0x100000f of entity 'mtk-cam-p1 meta input': Data
>>>>> Pad 0x01000003   : 1: Source
>>>>>   Link 0x02000018: to remote pad 0x1000015 of entity 'mtk-cam-p1 main stream': Data, Enabled, Immutable
>>>>> Pad 0x01000004   : 2: Source
>>>>>   Link 0x0200001e: to remote pad 0x100001b of entity 'mtk-cam-p1 packed out': Data
>>>>> Pad 0x01000005   : 3: Source
>>>>>   Link 0x02000024: to remote pad 0x1000021 of entity 'mtk-cam-p1 partial meta 0': Data
>>>>> Pad 0x01000006   : 4: Source
>>>>>   Link 0x0200002a: to remote pad 0x1000027 of entity 'mtk-cam-p1 partial meta 1': Data
>>>>> Pad 0x01000007   : 5: Source
>>>>>   Link 0x02000030: to remote pad 0x100002d of entity 'mtk-cam-p1 partial meta 2': Data
>>>>> Pad 0x01000008   : 6: Source
>>>>>   Link 0x02000036: to remote pad 0x1000033 of entity 'mtk-cam-p1 partial meta 3': Data
>>>>> Pad 0x01000009   : 7: Source
>>>>> Pad 0x0100000a   : 8: Source
>>>>> Pad 0x0100000b   : 9: Source
>>>>> Pad 0x0100000c   : 10: Source
>>>>> Pad 0x0100000d   : 11: Sink
>>>>>   Link 0x0200004e: from remote pad 0x100003d of entity '1a040000.seninf': Data, Enabled, Immutable
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/v4l-subdev0 open: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Sink Pad 0):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 1):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 2):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 3):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 4):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 5):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 6):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 7):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 8):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 9):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 10):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Sink Pad 11):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>> test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK (Not Supported)
>>>>> test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>> test VIDIOC_S_FMT: OK (Not Supported)
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK (Not Supported)
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/v4l-subdev0: 125, Succeeded: 125, Failed: 0, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/v4l-subdev1:
>>>>>
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000052
>>>>> Type             : V4L Sub-Device
>>>>> Entity Info:
>>>>> ID               : 0x00000038 (56)
>>>>> Name             : 1a040000.seninf
>>>>> Function         : Video Interface Bridge
>>>>> Pad 0x01000039   : 0: Sink
>>>>>   Link 0x02000047: from remote pad 0x1000046 of entity 'ov8856 2-0010': Data, Enabled
>>>>> Pad 0x0100003a   : 1: Sink
>>>>>   Link 0x0200004c: from remote pad 0x100004b of entity 'ov02a10 4-003d': Data
>>>>> Pad 0x0100003b   : 2: Sink
>>>>> Pad 0x0100003c   : 3: Sink
>>>>> Pad 0x0100003d   : 4: Source
>>>>>   Link 0x0200004e: to remote pad 0x100000d of entity 'mtk-cam-p1': Data, Enabled, Immutable
>>>>> Pad 0x0100003e   : 5: Source
>>>>> Pad 0x0100003f   : 6: Source
>>>>> Pad 0x01000040   : 7: Source
>>>>> Pad 0x01000041   : 8: Source
>>>>> Pad 0x01000042   : 9: Source
>>>>> Pad 0x01000043   : 10: Source
>>>>> Pad 0x01000044   : 11: Source
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/v4l-subdev1 open: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Sink Pad 0):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Sink Pad 1):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Sink Pad 2):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Sink Pad 3):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 4):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 5):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 6):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 7):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 8):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 9):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 10):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 11):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>> test VIDIOC_QUERYCTRL: OK
>>>>> test VIDIOC_G/S_CTRL: OK
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 2 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK (Not Supported)
>>>>> test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>> test VIDIOC_S_FMT: OK (Not Supported)
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK (Not Supported)
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/v4l-subdev1: 125, Succeeded: 125, Failed: 0, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/v4l-subdev2:
>>>>>
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000054
>>>>> Type             : V4L Sub-Device
>>>>> Entity Info:
>>>>> ID               : 0x00000045 (69)
>>>>> Name             : ov8856 2-0010
>>>>> Function         : Camera Sensor
>>>>> Pad 0x01000046   : 0: Source
>>>>>   Link 0x02000047: to remote pad 0x1000039 of entity '1a040000.seninf': Data, Enabled
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/v4l-subdev2 open: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 0):
>>>>> fail: v4l2-test-subdevs.cpp(147): doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse)
>>>>> fail: v4l2-test-subdevs.cpp(248): ret && ret != ENOTTY
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
>>>>> fail: v4l2-test-subdevs.cpp(313): fmt.code == 0 || fmt.code == ~0U
>>>>> fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> fail: v4l2-test-subdevs.cpp(147): doioctl(node, VIDIOC_SUBDEV_ENUM_FRAME_SIZE, &fse)
>>>>> fail: v4l2-test-subdevs.cpp(248): ret && ret != ENOTTY
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>> test VIDIOC_QUERYCTRL: OK
>>>>> test VIDIOC_G/S_CTRL: OK
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>> fail: v4l2-test-controls.cpp(830): subscribe event for control 'User Controls' failed
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 11 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK (Not Supported)
>>>>> test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>> test VIDIOC_S_FMT: OK (Not Supported)
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK (Not Supported)
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/v4l-subdev2: 48, Succeeded: 44, Failed: 4, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/v4l-subdev3:
>>>>>
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000056
>>>>> Type             : V4L Sub-Device
>>>>> Entity Info:
>>>>> ID               : 0x00000049 (73)
>>>>> Name             : dw9768 2-000c
>>>>> Function         : Lens Controller
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/v4l-subdev3 open: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>> test VIDIOC_QUERYCTRL: OK
>>>>> test VIDIOC_G/S_CTRL: OK
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>> fail: v4l2-test-controls.cpp(830): subscribe event for control 'Camera Controls' failed
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 2 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK (Not Supported)
>>>>> test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>> test VIDIOC_S_FMT: OK (Not Supported)
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK (Not Supported)
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/v4l-subdev3: 41, Succeeded: 40, Failed: 1, Warnings: 0
>>>>> --------------------------------------------------------------------------------
>>>>> Compliance test for mtk-cam-p1 device /dev/v4l-subdev4:
>>>>>
>>>>> Media Driver Info:
>>>>> Driver name      : mtk-cam-p1
>>>>> Model            : mtk-cam-p1
>>>>> Serial           :
>>>>> Bus info         : platform:1a000000.camisp
>>>>> Media version    : 4.19.89
>>>>> Hardware revision: 0x00000000 (0)
>>>>> Driver version   : 4.19.89
>>>>> Interface Info:
>>>>> ID               : 0x03000058
>>>>> Type             : V4L Sub-Device
>>>>> Entity Info:
>>>>> ID               : 0x0000004a (74)
>>>>> Name             : ov02a10 4-003d
>>>>> Function         : Camera Sensor
>>>>> Pad 0x0100004b   : 0: Source
>>>>>   Link 0x0200004c: to remote pad 0x100003a of entity '1a040000.seninf': Data
>>>>>
>>>>> Required ioctls:
>>>>> test MC information (see 'Media Driver Info' above): OK
>>>>>
>>>>> Allow for multiple opens:
>>>>> test second /dev/v4l-subdev4 open: OK
>>>>> test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>> test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>> test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>> Inputs: 0 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>> test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>> test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>> test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>> test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>> test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>> Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>> test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>> test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>> test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>> test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Sub-Device ioctls (Source Pad 0):
>>>>> test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>>>> test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>>>> test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>>>>
>>>>> Control ioctls:
>>>>> test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>> test VIDIOC_QUERYCTRL: OK
>>>>> fail: v4l2-test-controls.cpp(362): returned control value out of range
>>>>> fail: v4l2-test-controls.cpp(431): invalid control 009e0902
>>>>> test VIDIOC_G/S_CTRL: FAIL
>>>>> fail: v4l2-test-controls.cpp(549): returned control value out of range
>>>>> fail: v4l2-test-controls.cpp(665): invalid control 009e0902
>>>>> test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
>>>>> fail: v4l2-test-controls.cpp(830): subscribe event for control 'User Controls' failed
>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>> test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>> Standard Controls: 10 Private Controls: 0
>>>>>
>>>>> Format ioctls:
>>>>> test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>>>> test VIDIOC_G/S_PARM: OK (Not Supported)
>>>>> test VIDIOC_G_FBUF: OK (Not Supported)
>>>>> test VIDIOC_G_FMT: OK (Not Supported)
>>>>> test VIDIOC_TRY_FMT: OK (Not Supported)
>>>>> test VIDIOC_S_FMT: OK (Not Supported)
>>>>> test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>> test Cropping: OK (Not Supported)
>>>>> test Composing: OK (Not Supported)
>>>>> test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls:
>>>>> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>> test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls:
>>>>> test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>>>> test VIDIOC_EXPBUF: OK (Not Supported)
>>>>> test Requests: OK (Not Supported)
>>>>>
>>>>> Total for mtk-cam-p1 device /dev/v4l-subdev4: 48, Succeeded: 45, Failed: 3, Warnings: 0
>>>>>
>>>>> Grand Total for mtk-cam-p1 device /dev/media2: 709, Succeeded: 694, Failed: 15, Warnings: 0
>>>>>
>>>>>
>>>>> Jungo Lin (5):
>>>>>   media: dt-bindings: mt8183: Added camera ISP Pass 1
>>>>>   dts: arm64: mt8183: Add ISP Pass 1 nodes
>>>>>   media: videodev2.h: Add new boottime timestamp type
>>>>>   media: platform: Add Mediatek ISP P1 image & meta formats
>>>>>   media: platform: Add Mediatek ISP P1 V4L2 device driver
>>>>>
>>>>>  .../bindings/media/mediatek,camisp.txt        |   83 +
>>>>>  Documentation/media/uapi/v4l/buffer.rst       |   11 +-
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr10.rst   |   65 +
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst  |   90 +
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr12.rst   |   61 +
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst  |  110 +
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr14.rst   |   73 +
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst  |  110 +
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr8.rst    |   51 +
>>>>>  .../media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst   |   78 +
>>>>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   38 +
>>>>>  drivers/media/platform/Kconfig                |    1 +
>>>>>  drivers/media/platform/Makefile               |    1 +
>>>>>  drivers/media/platform/mtk-isp/Kconfig        |   20 +
>>>>>  .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
>>>>>  .../platform/mtk-isp/isp_50/cam/Makefile      |    6 +
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.c  |  636 +++++
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam-hw.h  |   64 +
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h |  222 ++
>>>>>  .../mtk-isp/isp_50/cam/mtk_cam-regs.h         |   95 +
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam.c     | 2087 +++++++++++++++++
>>>>>  .../platform/mtk-isp/isp_50/cam/mtk_cam.h     |  244 ++
>>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   37 +
>>>>>  include/uapi/linux/videodev2.h                |   41 +
>>>>>  24 files changed, 4226 insertions(+), 1 deletion(-)
>>>>>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,camisp.txt
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10.rst
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12.rst
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14.rst
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8.rst
>>>>>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/Makefile
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.c
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-hw.h
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ipi.h
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-regs.h
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.c
>>>>>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam.h
>>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-mediatek mailing list
>>>> Linux-mediatek@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
> 
