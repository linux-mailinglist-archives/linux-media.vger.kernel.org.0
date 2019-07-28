Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCA077E1A
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 07:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfG1FBF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jul 2019 01:01:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54279 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfG1FBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jul 2019 01:01:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so50998042wme.4
        for <linux-media@vger.kernel.org>; Sat, 27 Jul 2019 22:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1I0I/Jc1bRZepb/NZUyZxdS0QV1GK5ZXMDVMU2HVId0=;
        b=F0i67vFvbP5Qk1EEZo068sM6udmceT2Zkkwr+DDOYyYv+uTT5KILt7aSnsr8khS3ZP
         y4JhV7aYvklzAtntkdjjBdK69BfRAHlhUIM2mpfkT6DnZIcpKt+1N4ETXabEaVyrFFUk
         z0diJG5Y3dUkXW0nLriWgyKciL05WcTqMfI1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1I0I/Jc1bRZepb/NZUyZxdS0QV1GK5ZXMDVMU2HVId0=;
        b=frx4ZxPXofnlB19WvOS0WQqNmPTosD8xY5/g3WziHu91eOepV6iIj1EgwSbczIdDWC
         Ng79tUrRQv6LsHMuFjEgCCEKjK528GAeCX+XiEEzDI1NPXqA2iMh0zI+1fsD1Llro04w
         Ffavbx6Sz61w/L5nfDgrfWNhPM+LQ0JX14tNeuTDDPAcWDfBti42VvrCiSfhY9VWgX6U
         NgbFOiVh+2tbli4syz9LcXH4iaFWGUUFjEmALtxy7bi/dyFEfqPLG04tdFBSqudYpYXA
         eVrT00bZQeVGXEYcDFh2txNQZyGeM46t5fIeL27r6nHe5BpriKeAVCTAAbcivkq7X8X0
         P0aA==
X-Gm-Message-State: APjAAAVF4JJIJLgSB1I9M7y+zVqkg1iK7nWG26qIlqkjqHid9v9elXvj
        f5FuGNcmQzw1/Mj8Q3+ssX5iHA2cTBqYKvd0VEIaKg==
X-Google-Smtp-Source: APXvYqyELIY3LHpOeAxkHiMPY3MSGB6ozuwFU4RdGeuQQ+MAZdbREFNBVCNsN1wKvkngJmYZMt8AWqnljydAnqEd76k=
X-Received: by 2002:a1c:cfc3:: with SMTP id f186mr86846577wmg.134.1564290053903;
 Sat, 27 Jul 2019 22:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
In-Reply-To: <20190708110500.7242-1-frederic.chen@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sun, 28 Jul 2019 14:00:42 +0900
Message-ID: <CAHD77HmyTiYyQFcV4ceKi-oRdDxkRUYvummdedocr-dpe_=XRg@mail.gmail.com>
Subject: Re: [RFC PATCH V2 0/6] media: platform: Add support for Digital Image
 Processing (DIP) on mt8183 SoC
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Frederic Chen <frederic.chen@mediatek.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yu Zhao <yuzhao@chromium.org>,
        Ross Zwisler <zwisler@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, Shik Chen <shik@chromium.org>,
        Suleiman Souhlal <suleiman@chromium.org>,
        Allan.Yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Jul 8, 2019 at 8:05 PM <frederic.chen@mediatek.com> wrote:
>
> Hello,
>
> This RFC patch series added Digital Image Processing (DIP) driver on Mediatek
> mt8183 SoC. It belongs to the Mediatek's ISP driver series based on V4L2 and
> media controller framework. I posted the main part of the DIP driver as RFC to
> discuss first and would like some review comments.
>
> I appreciate the helpful comment of Tomasz, Rob and Shik in RFC V1. The RFC V2
> patch addressed on the review issues in V1. There are 2 V4L2 compliance test
> issues still under discussion and I will do the corresponding modification in
> the next patch after we come to the conclusion.
>
> 1. Request API test doesn't know which buffers of the video devices are
> required so we got failed in testRequests()
>

Perhaps the test should check the media topology and infer the video
devices required from there?

> 2. V4L2 compliance test check if the driver return error when passing an
> invalid image size, but in vb2_create_bufs() case, we don't know if the
> size check is required or not.

In current VB2 API, we don't get the format given to CREATE_BUFS
anymore, we just get the requested sizeimage. How do we validate if
the sizeimage is big enough for the format? Should we implement that
check in the .vidioc_create_bufs op before calling vb2_create_bufs()?

>
> Please see the following URL for the detail.
> http://lists.infradead.org/pipermail/linux-mediatek/2019-June/020884.html
>

Would you be able to help us with the above 2 issues? They are worked
around in the driver, so the tests pass below, but we don't want such
workarounds in driver code.

Best regards,
Tomasz

> ==============
>  Introduction
> ==============
>
> Digital Image Processing (DIP) unit can accept the tuning parameters and
> adjust the image content in Mediatek ISP system. Furthermore, it performs
> demosaicing and noise reduction on the image to support the advanced camera
> features of the application. The DIP driver also support image format
> conversion, resizing and rotation with its hardware path.
>
> The driver is implemented with V4L2 and media controller framework. We
> have the following entities describing the DIP path. Since a DIP frame has
> multiple buffers, the driver uses Request API to control the multiple
> buffer's enqueue flow.
>
> 1. Meta (output video device): connects to DIP sub device. It accepts the
> input tuning buffer from userspace. The metadata interface used currently
> is only a temporary solution to kick off driver development and is not
> ready for reviewed yet.
>
> 2. RAW (output video device): connects to DIP sub device. It accepts input
> image buffer from userspace.
>
> 3. DIP (sub device): connects to MDP-0 and MDP-1. When processing an image,
> DIP hardware support multiple output images with different size and format
> so it needs two capture video devices to return the streaming data to the
> user.
>
> 4. MDP-0 (capture video device): return the processed image data.
>
> 5. MDP-1 (capture video device): return the processed image data, the
> image size and format can be different from the ones of MDP-0.
>
> The overall file structure of the DIP driver is as following:
>
> * mtk_dip-v4l2.c: implements DIP platform driver, V4L2 and vb2 operations.
>
> * mtk_dip-sys.c: implements the hardware job handling flow including the part of
> interaction with the SCP and MDP.
>
> * mtk_dip-dev.c: implements dip pipe utilities. DIP driver supports 3 software
> pipes (preview, capture and reprocessing) at the same time. All
> the pipes share the same DIP hardware to process the images.
>
> ==================
>  Changes in v2
> ==================
> * mtk_dip-smem.c
> 1. Removed mtk_dip-smem.c and the custom code of SCP and DIP's share memory
> operation, and uses SCP device as the allocation device instead. (SCP creates
> the shared DMA pool of DMA buffers and can hook to DMA mapping APIs)
>
> * mtk_dip-ctrl.c
> 1. Merged mtk_dip-ctrl.c into mtk_dip-v4l2.c since we only have a HW ctrl.
> (V4L2_CID_ROTATE)
>
> * mtk_dip-sys.c:
> 1. Removed struct mtk_dip_hw_work, mtk_dip_hw_submit_work and the related memory
> management flow (use mtk_dip_request instead)
>
> 2. Uses workqueue mdp_wq instead of dip_runner_thread kthread to simplify the
> design
>
> 3. Removed dip_gcejoblist and use mtk_dip_job_info list instead
>
> 4. Removed framejob and mtk_dip_hw_mdpcb_work and the related alloc and free
> since it already embedded in the new struct mtk_dip_request
>
> 5. Integrated struct mtk_dip_hw_user_id and struct with mtk_dip_pipe, and
> removed dip_hw->dip_useridlist
>
> 6. Pass mtk_dip_request to mdp_cmdq_sendtask() as cb data
>
> 7. Use spinlock instead of mutex as struct mtk_dip_hw_queue's queuelock so that
> we can use direct function call instead of mdpcb_workqueue works
>
> 8. Removed dip_send() and use scp_ipi_send() directly
>
> 9. Removed composing_wq and the related macro, we use semaphore instead
>
> 10. Use array to keep constant number of working buffer pointers in dip_hw
> instead a list
>
> 11. Allocates the SCP working buffer before scheduling the job into SCP. When
> there is no free buffer, we hold the job until there are any working buffers
> available.
>
> 12. Re-designed the request handling flow. We implement
> mtk_dip_vb2_request_validate() to collect the job data including buffers and
> check if we got minimum required buffers. mtk_dip_pipe_try_enqueue() is added to
> simplify the job scheduling flow in both streamon() case with buffers already in
> queues and .buf_queue() during streaming. In streamon() function, we call
> mtk_dip_pipe_try_enqueue() to execute as many as jobs in the pending list
>
> 13. Fixed the issue about passing the kernel pointer to SCP
>
> 14. Re-designed mtk_dip_hw_flush_by_id() to remove the unnecessary loop and
> interrupt abort
>
> 15. Added codes to wait for pending jobs already in SCP during suspend flow. In
> mtk_dip_suspend() and dip_submit_worker(), we get mutex hw_op_lock before read
> and update the SCP job number to avoid the race condition when system suspend
> happens and DIP driver is sending ipi command to trigger the firmware job.
>
> 16. Removed struct mtk_dip_hw's dip_user_cnt and dip_state, and uses
> dip_stream_cnt instead
>
> 17. Uses dma_alloc_coherent() instead of scp_get_reserve_mem_phys()/
> scp_get_reserve_mem_size() to allocate DIP working buffers
>
> * mtk_dip-v4l2.c:
> 1. Call mtk_dip_hw_stream{on, off} in mtk_dip_subdev_s_stream() directly instead
> mtk_dip_pipe_stream_on and mtk_dip_pipe_stream_off
>
> 2. Removed buf usage HW ctrl and uses dma port configured in node's description
> instead
>
> 3. Moved platform driver ops to mtk_dip-v4l2.c (which includes the V4L2/media
> ops implementation)
>
> 4. Moved hardware related operation in sub-device open/close to
> streamon()/streamoff() ops
>
> 5. Uses dip_pipe->lock to synchronize streamon, streamoff and link setup flow
>
> 6. Added a counter dip_pipe->cnt_nodes_not_streaming to check if the pipe can be
> streamon or not (instead of the mtk_dip_all_nodes_streaming())
>
> 7. Moved the buffer size checking code from .queue_setup() to .buf_prepare()
>
> 8. Added multiple-plane formats support
>
> 9. Created interfaces and interface links for input and output video nodes
>
> 10. Added error handling and improved the cleanup codes in
> mtk_dip_dev_v4l2_init() and mtk_dip_pipe_v4l2_register()
>
> 11. Added mtk_dip_video_device_v4l2_register() to simplify
> mtk_dip_pipe_v4l2_register()'s implementation
>
> 12. Added mtk_dip_video_device.flags instead of enable, dynamic and immutable
> fields in struct mtk_dip_video_device.
>
> 13. Added a list to mtk_dip_video_device to hold queued buffers instead of
> accessing vbq.bufs directly.
>
> 14. Merged struct mtk_dip_dev_meta_format and struct mtk_dip_dev_mdp_format into
> struct mtk_dip_dev_format
>
> 15. Changed the try_fmt() implementation. If the pixelformat is not supported,
> we use the default one but keep the valid fields.
>
> 16. Moved the mtk_dip_hw_connect()/mtk_dip_hw_disconnect() call from
> mtk_dip_subdev_s_stream() to mtk_dip_hw_streamon()/mtk_dip_hw_streamoff() and
> removed some redundant check about stream count.
>
> 17. Re-implemented dev_pm_ops
>
> * mtk_dip-dev.c:
> 1. Added mtk_dip_request extending media_request and embedded pipe_job_info in
> it.
>
> 2. Removed mtk_dip_pipe_stream{on, off} and move the content to
> mtk_dip_hw_stream{on, off}
>
> 3. Removed fill_ipi_img_param() and extends fill_ipi_img_param_mp() so that it
> can support both multiple non-contiguous and multiple contiguous planes buffers.
>
> 4. Added mtk_dip_pipe_get_stride() to reduce redundant codes.
>
> 5. Removed call_mtk_dip_pipe_finish() and merged its content into its callers
>
> 6. Removed unused ctrl handler from struct mtk_dip_pipe.
>
> ==================
>  Changes in v1
> ==================
> 1. Uses Request API instead of DIP's buffer collection design
>
> 2. Removed unnecessary abstraction structurally, including mtk_dip_ctx and
> related ops
>
> 3. Removed the dip_smem node from device tree
>
> 4. Improved the dip_work list's management flow
>
> 5. Fixed the common issues Tomasz commented on Mediatek ISP Pass 1's RFC v0
> patch series
>
> ==================
>  Dependent patch
> ==================
>
> DIP driver depends on MDP 3 driver and SCP driver. The patches are as
> following:
>
> [1]. support mdp3 on mt8183 platform
> https://patchwork.kernel.org/cover/10945585/
>
> [2]. Add support for mt8183 SCP
> https://patchwork.kernel.org/cover/11027245/
>
> ==================
>  Compliance test
> ==================
>
> * Test command: v4l2-compliance -m /dev/media0
> * test output:
>
> v4l2-compliance SHA: not available, 32 bits
>
> Compliance test for camera-dip device /dev/media0:
>
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
>
> Required ioctls:
>         test MEDIA_IOC_DEVICE_INFO: OK
>
> Allow for multiple opens:
>         test second /dev/media0 open: OK
>         test MEDIA_IOC_DEVICE_INFO: OK
>         test for unlimited opens: OK
>
> Media Controller ioctls:
>         test MEDIA_IOC_G_TOPOLOGY: OK
>         Entities: 15 Interfaces: 27 Pads: 24 Links: 39
>         test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>         test MEDIA_IOC_SETUP_LINK: OK
>
> Total for camera-dip device /dev/media0: 7, Succeeded: 7, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for camera-dip device /dev/v4l-subdev0:
>
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000006
>         Type             : V4L Sub-Device
> Entity Info:
>         ID               : 0x00000001 (1)
>         Name             : MTK-ISP-DIP-V4L2
>         Function         : Video Pixel Formatter
>         Pad 0x01000002   : 0: Sink
>           Link 0x0200000c: from remote pad 0x1000009 of entity 'MTK-ISP-DIP-V4L2 Raw Input': Data, Enabled
>         Pad 0x01000003   : 1: Sink
>           Link 0x02000014: from remote pad 0x1000011 of entity 'MTK-ISP-DIP-V4L2 Tuning': Data
>         Pad 0x01000004   : 2: Source
>           Link 0x0200001c: to remote pad 0x1000019 of entity 'MTK-ISP-DIP-V4L2 MDP0': Data, Enabled, Dynamic
>         Pad 0x01000005   : 3: Source
>           Link 0x02000024: to remote pad 0x1000021 of entity 'MTK-ISP-DIP-V4L2 MDP1': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>
> Allow for multiple opens:
>         test second /dev/v4l-subdev0 open: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 1):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 2):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 3):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
>
> Total for camera-dip device /dev/v4l-subdev0: 69, Succeeded: 69, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video0:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x0300000a
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000008 (8)
>         Name             : MTK-ISP-DIP-V4L2 Raw Input
>         Function         : V4L2 I/O
>         Pad 0x01000009   : 0: Source
>           Link 0x0200000c: to remote pad 0x1000002 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video0:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x0300000a
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000008 (8)
>         Name             : MTK-ISP-DIP-V4L2 Raw Input
>         Function         : V4L2 I/O
>         Pad 0x01000009   : 0: Source
>           Link 0x0200000c: to remote pad 0x1000002 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video1:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x8c200000
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x0c200000
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000012
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000010 (16)
>         Name             : MTK-ISP-DIP-V4L2 Tuning
>         Function         : V4L2 I/O
>         Pad 0x01000011   : 0: Source
>           Link 0x02000014: to remote pad 0x1000003 of entity 'MTK-ISP-DIP-V4L2': Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video1:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x8c200000
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x0c200000
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000012
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000010 (16)
>         Name             : MTK-ISP-DIP-V4L2 Tuning
>         Function         : V4L2 I/O
>         Pad 0x01000011   : 0: Source
>           Link 0x02000014: to remote pad 0x1000003 of entity 'MTK-ISP-DIP-V4L2': Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video2:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x0300001a
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000018 (24)
>         Name             : MTK-ISP-DIP-V4L2 MDP0
>         Function         : V4L2 I/O
>         Pad 0x01000019   : 0: Sink
>           Link 0x0200001c: from remote pad 0x1000004 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video2 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video2: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video2:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x0300001a
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000018 (24)
>         Name             : MTK-ISP-DIP-V4L2 MDP0
>         Function         : V4L2 I/O
>         Pad 0x01000019   : 0: Sink
>           Link 0x0200001c: from remote pad 0x1000004 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video2 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video2: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video3:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000022
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000020 (32)
>         Name             : MTK-ISP-DIP-V4L2 MDP1
>         Function         : V4L2 I/O
>         Pad 0x01000021   : 0: Sink
>           Link 0x02000024: from remote pad 0x1000005 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video3 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video3: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-V4L device /dev/video3:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-V4L
>         Card type        : MTK-ISP-DIP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000022
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000020 (32)
>         Name             : MTK-ISP-DIP-V4L2 MDP1
>         Function         : V4L2 I/O
>         Pad 0x01000021   : 0: Sink
>           Link 0x02000024: from remote pad 0x1000005 of entity 'MTK-ISP-DIP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video3 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-V4L device /dev/video3: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for camera-dip device /dev/v4l-subdev1:
>
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x0300002d
>         Type             : V4L Sub-Device
> Entity Info:
>         ID               : 0x00000028 (40)
>         Name             : MTK-ISP-DIP-CAP-V4L2
>         Function         : Video Pixel Formatter
>         Pad 0x01000029   : 0: Sink
>           Link 0x02000033: from remote pad 0x1000030 of entity 'MTK-ISP-DIP-CAP-V4L2 Raw Input': Data, Enabled
>         Pad 0x0100002a   : 1: Sink
>           Link 0x0200003b: from remote pad 0x1000038 of entity 'MTK-ISP-DIP-CAP-V4L2 Tuning': Data
>         Pad 0x0100002b   : 2: Source
>           Link 0x02000043: to remote pad 0x1000040 of entity 'MTK-ISP-DIP-CAP-V4L2 MDP0': Data, Enabled, Dynamic
>         Pad 0x0100002c   : 3: Source
>           Link 0x0200004b: to remote pad 0x1000048 of entity 'MTK-ISP-DIP-CAP-V4L2 MDP1': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>
> Allow for multiple opens:
>         test second /dev/v4l-subdev1 open: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 1):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 2):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 3):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
>
> Total for camera-dip device /dev/v4l-subdev1: 69, Succeeded: 69, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video4:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000031
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000002f (47)
>         Name             : MTK-ISP-DIP-CAP-V4L2 Raw Input
>         Function         : V4L2 I/O
>         Pad 0x01000030   : 0: Source
>           Link 0x02000033: to remote pad 0x1000029 of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video4 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video4: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video4:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000031
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000002f (47)
>         Name             : MTK-ISP-DIP-CAP-V4L2 Raw Input
>         Function         : V4L2 I/O
>         Pad 0x01000030   : 0: Source
>           Link 0x02000033: to remote pad 0x1000029 of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video4 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video4: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video5:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x8c200000
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x0c200000
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000039
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000037 (55)
>         Name             : MTK-ISP-DIP-CAP-V4L2 Tuning
>         Function         : V4L2 I/O
>         Pad 0x01000038   : 0: Source
>           Link 0x0200003b: to remote pad 0x100002a of entity 'MTK-ISP-DIP-CAP-V4L2': Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video5 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video5: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video5:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x8c200000
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x0c200000
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000039
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000037 (55)
>         Name             : MTK-ISP-DIP-CAP-V4L2 Tuning
>         Function         : V4L2 I/O
>         Pad 0x01000038   : 0: Source
>           Link 0x0200003b: to remote pad 0x100002a of entity 'MTK-ISP-DIP-CAP-V4L2': Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video5 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video5: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video6:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000041
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000003f (63)
>         Name             : MTK-ISP-DIP-CAP-V4L2 MDP0
>         Function         : V4L2 I/O
>         Pad 0x01000040   : 0: Sink
>           Link 0x02000043: from remote pad 0x100002b of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video6 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video6: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video6:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000041
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000003f (63)
>         Name             : MTK-ISP-DIP-CAP-V4L2 MDP0
>         Function         : V4L2 I/O
>         Pad 0x01000040   : 0: Sink
>           Link 0x02000043: from remote pad 0x100002b of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video6 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video6: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video7:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000049
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000047 (71)
>         Name             : MTK-ISP-DIP-CAP-V4L2 MDP1
>         Function         : V4L2 I/O
>         Pad 0x01000048   : 0: Sink
>           Link 0x0200004b: from remote pad 0x100002c of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video7 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video7: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-CAP device /dev/video7:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-CAP
>         Card type        : MTK-ISP-DIP-CAP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000049
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000047 (71)
>         Name             : MTK-ISP-DIP-CAP-V4L2 MDP1
>         Function         : V4L2 I/O
>         Pad 0x01000048   : 0: Sink
>           Link 0x0200004b: from remote pad 0x100002c of entity 'MTK-ISP-DIP-CAP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video7 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-CAP device /dev/video7: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for camera-dip device /dev/v4l-subdev2:
>
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000054
>         Type             : V4L Sub-Device
> Entity Info:
>         ID               : 0x0000004f (79)
>         Name             : MTK-ISP-DIP-REP-V4L2
>         Function         : Video Pixel Formatter
>         Pad 0x01000050   : 0: Sink
>           Link 0x0200005a: from remote pad 0x1000057 of entity 'MTK-ISP-DIP-REP-V4L2 Raw Input': Data, Enabled
>         Pad 0x01000051   : 1: Sink
>           Link 0x02000062: from remote pad 0x100005f of entity 'MTK-ISP-DIP-REP-V4L2 Tuning': Data
>         Pad 0x01000052   : 2: Source
>           Link 0x0200006a: to remote pad 0x1000067 of entity 'MTK-ISP-DIP-REP-V4L2 MDP0': Data, Enabled, Dynamic
>         Pad 0x01000053   : 3: Source
>           Link 0x02000072: to remote pad 0x100006f of entity 'MTK-ISP-DIP-REP-V4L2 MDP1': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>
> Allow for multiple opens:
>         test second /dev/v4l-subdev2 open: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 0):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Sink Pad 1):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 2):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Sub-Device ioctls (Source Pad 3):
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
>
> Total for camera-dip device /dev/v4l-subdev2: 69, Succeeded: 69, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video8:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000058
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000056 (86)
>         Name             : MTK-ISP-DIP-REP-V4L2 Raw Input
>         Function         : V4L2 I/O
>         Pad 0x01000057   : 0: Source
>           Link 0x0200005a: to remote pad 0x1000050 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video8 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video8: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video8:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04202000
>                 Video Output Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000058
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000056 (86)
>         Name             : MTK-ISP-DIP-REP-V4L2 Raw Input
>         Function         : V4L2 I/O
>         Pad 0x01000057   : 0: Source
>           Link 0x0200005a: to remote pad 0x1000050 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video8 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video8: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video9:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x8c200000
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x0c200000
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000060
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000005e (94)
>         Name             : MTK-ISP-DIP-REP-V4L2 Tuning
>         Function         : V4L2 I/O
>         Pad 0x0100005f   : 0: Source
>           Link 0x02000062: to remote pad 0x1000051 of entity 'MTK-ISP-DIP-REP-V4L2': Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video9 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video9: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video9:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x8c200000
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x0c200000
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000060
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000005e (94)
>         Name             : MTK-ISP-DIP-REP-V4L2 Tuning
>         Function         : V4L2 I/O
>         Pad 0x0100005f   : 0: Source
>           Link 0x02000062: to remote pad 0x1000051 of entity 'MTK-ISP-DIP-REP-V4L2': Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video9 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video9: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video10:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000068
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000066 (102)
>         Name             : MTK-ISP-DIP-REP-V4L2 MDP0
>         Function         : V4L2 I/O
>         Pad 0x01000067   : 0: Sink
>           Link 0x0200006a: from remote pad 0x1000052 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video10 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video10: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video10:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000068
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000066 (102)
>         Name             : MTK-ISP-DIP-REP-V4L2 MDP0
>         Function         : V4L2 I/O
>         Pad 0x01000067   : 0: Sink
>           Link 0x0200006a: from remote pad 0x1000052 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video10 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 2 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video10: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video11:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000070
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000006e (110)
>         Name             : MTK-ISP-DIP-REP-V4L2 MDP1
>         Function         : V4L2 I/O
>         Pad 0x0100006f   : 0: Sink
>           Link 0x02000072: from remote pad 0x1000053 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video11 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video11: 45, Succeeded: 45, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for MTK-ISP-DIP-REP device /dev/video11:
>
> Driver Info:
>         Driver name      : MTK-ISP-DIP-REP
>         Card type        : MTK-ISP-DIP-REP-V4L2
>         Bus info         : platform:15022000.dip
>         Driver version   : 4.19.56
>         Capabilities     : 0x84201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : camera-dip
>         Model            : MTK-ISP-DIP-V4L2
>         Serial           :
>         Bus info         : platform:15022000.dip
>         Media version    : 4.19.56
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 4.19.56
> Interface Info:
>         ID               : 0x03000070
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000006e (110)
>         Name             : MTK-ISP-DIP-REP-V4L2 MDP1
>         Function         : V4L2 I/O
>         Pad 0x0100006f   : 0: Sink
>           Link 0x02000072: from remote pad 0x1000053 of entity 'MTK-ISP-DIP-REP-V4L2': Data, Enabled, Dynamic
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video11 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
>
> Total for MTK-ISP-DIP-REP device /dev/video11: 45, Succeeded: 45, Failed: 0, Warnings: 0
>
> Grand Total for camera-dip device /dev/media0: 1294, Succeeded: 1294, Failed: 0, Warnings: 0
>
>
> Frederic Chen (6):
>   dt-bindings: mt8183: Added DIP dt-bindings
>   dts: arm64: mt8183: Add DIP nodes
>   media: platform: Add Mediatek DIP driver KConfig
>   platform: mtk-isp: Add Mediatek DIP driver
>   remoteproc/mediatek: add SCP's shared dma pool support for mt8183
>   media: platform: mtk-mdp3: Added struct tuning_addr
>
>  .../bindings/media/mediatek,mt8183-dip.txt    |   40 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   16 +
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/mtk-isp/Kconfig        |   21 +
>  drivers/media/platform/mtk-isp/Makefile       |   18 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    4 +
>  .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  769 +++++++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  337 ++++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  155 ++
>  .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  794 ++++++++
>  .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 1786 +++++++++++++++++
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |    8 +-
>  drivers/remoteproc/mtk_scp.c                  |   54 +-
>  14 files changed, 4000 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c
>
> --
> 2.18.0
>
>
