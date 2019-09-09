Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76EC6ADF5B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 21:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387776AbfIITXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 15:23:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52895 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726814AbfIITXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 15:23:50 -0400
X-UUID: c2155056eff44cc2b5b716f9a5461cac-20190910
X-UUID: c2155056eff44cc2b5b716f9a5461cac-20190910
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2121973316; Tue, 10 Sep 2019 03:22:55 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Sep 2019 03:22:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Sep 2019 03:22:53 +0800
From:   <frederic.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <shik@chromium.org>, <suleiman@chromium.org>,
        <Allan.Yang@mediatek.com>
Subject: [RFC PATCH V3 0/5] media: platform: Add support for Digital Image Processing (DIP) on mt8183 SoC
Date:   Tue, 10 Sep 2019 03:22:39 +0800
Message-ID: <20190909192244.9367-1-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This RFC patch series added Digital Image Processing (DIP) driver on Mediatek
mt8183 SoC. It belongs to the Mediatek's ISP driver series based on V4L2 and
media controller framework. I posted the main part of the DIP driver as RFC to
discuss first and would like some review comments.

I appreciate the comment of Tomasz in RFC V2. The RFC V3 patch addressed on all
issues reviewed in V2 except the one about Mediatek proprietary MDP stride, 
depth and raw depth usage which is still under discussion. I will refactor 
the related parts once we come to the conclusion.

You can check the following URL for the detail.
http://lists.infradead.org/pipermail/linux-mediatek/2019-September/023254.html


In V3, I also removed all workaround solution about the following V4L2 
compliance tool issues so that we got the related failed result. 

1. Request API test doesn't know which buffers of the video devices are
required so we got failed in testRequests()

2. V4L2 compliance test check if the driver return error when passing an
invalid image size, but in vb2_create_bufs() case, we don't know if the
size check is required or not.

Please see the following URL for the detail.
http://lists.infradead.org/pipermail/linux-mediatek/2019-June/020884.html


Besides that, we got a new issue about the test case. When receiving the
VIDIOC_SUBDEV_G_FMT ioctl on a DIP sub device's pad which connects with a 
meta video device, we return -EINVEL since it doesn't represent an image
data flow (no width and height information), but the test case expects
that the driver return some media format information.

	Sub-Device ioctls (Sink Pad 1):
	fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL


==============
 Introduction
==============

Digital Image Processing (DIP) unit can accept the tuning parameters and
adjust the image content in Mediatek ISP system. Furthermore, it performs
demosaicing and noise reduction on the image to support the advanced camera
features of the application. The DIP driver also support image format
conversion, resizing and rotation with its hardware path.

The driver is implemented with V4L2 and media controller framework. We
have the following entities describing the DIP path. Since a DIP frame has
multiple buffers, the driver uses Request API to control the multiple
buffer's enqueue flow.

1. Meta (output video device): connects to DIP sub device. It accepts the
input tuning buffer from userspace. The metadata interface used currently
is only a temporary solution to kick off driver development and is not
ready for reviewed yet.

2. RAW (output video device): connects to DIP sub device. It accepts input
image buffer from userspace.

3. DIP (sub device): connects to MDP-0 and MDP-1. When processing an image,
DIP hardware support multiple output images with different size and format
so it needs two capture video devices to return the streaming data to the
user.

4. MDP-0 (capture video device): return the processed image data.

5. MDP-1 (capture video device): return the processed image data, the
image size and format can be different from the ones of MDP-0.

The overall file structure of the DIP driver is as following:

* mtk_dip-v4l2.c: implements DIP platform driver, V4L2 and vb2 operations.

* mtk_dip-sys.c: implements the hardware job handling flow including the part of
interaction with the SCP and MDP.

* mtk_dip-dev.c: implements dip pipe utilities. DIP driver supports 3 software
pipes (preview, capture and reprocessing) at the same time. All
the pipes share the same DIP hardware to process the images.


==================
 Changes in v3
==================
* mtk_dip-sys.c:
1. Use mtk_dip_pipe_job_finish() in mtk_dip_hw_streamoff()

2. Splice the pipe's running job list into a local list_head in 
mtk_dip_hw_streamoff()

3. In dip_composer_workfunc(), use down() instead custom wait_event() calls

4. Added error handling of SCP ipi sending failure in dip_composer_workfunc(),
which returns the buffers in the error case.

5. Remove jobs which are not queued to the hardware in
mtk_dip_hw_flush_pipe_jobs() and wait for the job already in SCP to be finished.
When streaming off, dip returns buffers after it finish the above operations.

6. Call mtk_dip_hw_flush_pipe_jobs() first in mtk_dip_hw_streamon()
7. In dip_scp_handler() and dip_composer_workfunc(), we get buffer pointers back
from the driver with job ids instead of the va field of the IPI structure
8. Use dma_map_resource()/dma_unmap_resource instead of ma_map_page_attrs()/
dma_unmap_page_attrs


* mtk_dip-v4l2.c: 
1. Serialized full link_setup, start_streaming and stop_streaming with 
pipe->lock

2. Added pipe->nodes_streaming and pipe->nodes_enabled bitmasks

3. Used media_pipeline_start to lock the link state when first node starts
streaming and the last node stops streaming.

4. Support B8, F8, B12, F12, B14, F14 input formats

5. Enabled RPM auto suspension and improved the rpm/pm ops implementation

6. Moved the v4l2_device_register_subdev_nodes() call from
mtk_dip_pipe_v4l2_register() to mtk_dip_dev_v4l2_init().

7. Merged struct mtk_dip_dev and struct mtk_dip_hw

8. Moved mtk_dip_hw_res_init() call from mtk_dip_hw_connect() to probe()

9. Separated meta and video vb2 ops implementation

10. Moved pending job adding codes from .req_validate() to .req_queue()

11. Added helper mtk_dip_media_req_to_dip_req() and removed error-prone codes
about the casting between struct mtk_dip_request and media_request

12. Removed unnecessary ctrl handler initialization of nodes which doesn't
support ctrl. (Only MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE support ctrl)

13. Refactored mtk_dip_pipe_try_fmt()/ mtk_dip_videoc_try_fmt()/
mtk_dip_videoc_s_fmt() so that we can remove the codes changing driver internal
status in mtk_dip_videoc_try_fmt().

14. Support noise reduction and shading video devices

* mtk_dip-dev.c
1. Merged struct mtk_dip_pipe_job_info and struct mtk_dip_request. 

2. Added pass_1_align and num_cplanes fields in mtk_dip_dev_format

3. Use bytesperline set in mtk_dip_pipe_try_fmt() when preparing HW setting
instead of calling mtk_dip_pipe_get_stride() again

4. Removed unnecessary local list used in mtk_dip_pipe_try_enqueue()

==================
 Changes in v2
==================
* mtk_dip-smem.c
1. Removed mtk_dip-smem.c and the custom code of SCP and DIP's share memory
operation, and uses SCP device as the allocation device instead. (SCP creates
the shared DMA pool of DMA buffers and can hook to DMA mapping APIs)

* mtk_dip-ctrl.c
1. Merged mtk_dip-ctrl.c into mtk_dip-v4l2.c since we only have a HW ctrl.
(V4L2_CID_ROTATE)

* mtk_dip-sys.c:
1. Removed struct mtk_dip_hw_work, mtk_dip_hw_submit_work and the related memory
management flow (use mtk_dip_request instead)

2. Uses workqueue mdp_wq instead of dip_runner_thread kthread to simplify the
design

3. Removed dip_gcejoblist and use mtk_dip_job_info list instead

4. Removed framejob and mtk_dip_hw_mdpcb_work and the related alloc and free
since it already embedded in the new struct mtk_dip_request

5. Integrated struct mtk_dip_hw_user_id and struct with mtk_dip_pipe, and
removed dip_hw->dip_useridlist

6. Pass mtk_dip_request to mdp_cmdq_sendtask() as cb data

7. Use spinlock instead of mutex as struct mtk_dip_hw_queue's queuelock so that
we can use direct function call instead of mdpcb_workqueue works

8. Removed dip_send() and use scp_ipi_send() directly

9. Removed composing_wq and the related macro, we use semaphore instead

10. Use array to keep constant number of working buffer pointers in dip_hw
instead a list

11. Allocates the SCP working buffer before scheduling the job into SCP. When
there is no free buffer, we hold the job until there are any working buffers
available.

12. Re-designed the request handling flow. We implement
mtk_dip_vb2_request_validate() to collect the job data including buffers and
check if we got minimum required buffers. mtk_dip_pipe_try_enqueue() is added to
simplify the job scheduling flow in both streamon() case with buffers already in
queues and .buf_queue() during streaming. In streamon() function, we call
mtk_dip_pipe_try_enqueue() to execute as many as jobs in the pending list

13. Fixed the issue about passing the kernel pointer to SCP

14. Re-designed mtk_dip_hw_flush_by_id() to remove the unnecessary loop and
interrupt abort

15. Added codes to wait for pending jobs already in SCP during suspend flow. In
mtk_dip_suspend() and dip_submit_worker(), we get mutex hw_op_lock before read
and update the SCP job number to avoid the race condition when system suspend
happens and DIP driver is sending ipi command to trigger the firmware job.

16. Removed struct mtk_dip_hw's dip_user_cnt and dip_state, and uses
dip_stream_cnt instead

17. Uses dma_alloc_coherent() instead of scp_get_reserve_mem_phys()/
scp_get_reserve_mem_size() to allocate DIP working buffers

* mtk_dip-v4l2.c: 
1. Call mtk_dip_hw_stream{on, off} in mtk_dip_subdev_s_stream() directly instead
mtk_dip_pipe_stream_on and mtk_dip_pipe_stream_off

2. Removed buf usage HW ctrl and uses dma port configured in node's description
instead

3. Moved platform driver ops to mtk_dip-v4l2.c (which includes the V4L2/media
ops implementation)

4. Moved hardware related operation in sub-device open/close to
streamon()/streamoff() ops

5. Uses dip_pipe->lock to synchronize streamon, streamoff and link setup flow

6. Added a counter dip_pipe->cnt_nodes_not_streaming to check if the pipe can be
streamon or not (instead of the mtk_dip_all_nodes_streaming())

7. Moved the buffer size checking code from .queue_setup() to .buf_prepare()

8. Added multiple-plane formats support

9. Created interfaces and interface links for input and output video nodes

10. Added error handling and improved the cleanup codes in
mtk_dip_dev_v4l2_init() and mtk_dip_pipe_v4l2_register()

11. Added mtk_dip_video_device_v4l2_register() to simplify
mtk_dip_pipe_v4l2_register()'s implementation

12. Added mtk_dip_video_device.flags instead of enable, dynamic and immutable
fields in struct mtk_dip_video_device.

13. Added a list to mtk_dip_video_device to hold queued buffers instead of
accessing vbq.bufs directly.

14. Merged struct mtk_dip_dev_meta_format and struct mtk_dip_dev_mdp_format into
struct mtk_dip_dev_format

15. Changed the try_fmt() implementation. If the pixelformat is not supported,
we use the default one but keep the valid fields.

16. Moved the mtk_dip_hw_connect()/mtk_dip_hw_disconnect() call from
mtk_dip_subdev_s_stream() to mtk_dip_hw_streamon()/mtk_dip_hw_streamoff() and
removed some redundant check about stream count.

17. Re-implemented dev_pm_ops

* mtk_dip-dev.c: 
1. Added mtk_dip_request extending media_request and embedded pipe_job_info in
it.

2. Removed mtk_dip_pipe_stream{on, off} and move the content to
mtk_dip_hw_stream{on, off}

3. Removed fill_ipi_img_param() and extends fill_ipi_img_param_mp() so that it
can support both multiple non-contiguous and multiple contiguous planes buffers.

4. Added mtk_dip_pipe_get_stride() to reduce redundant codes.

5. Removed call_mtk_dip_pipe_finish() and merged its content into its callers

6. Removed unused ctrl handler from struct mtk_dip_pipe.

==================
 Changes in v1
==================
1. Uses Request API instead of DIP's buffer collection design

2. Removed unnecessary abstraction structurally, including mtk_dip_ctx and
related ops

3. Removed the dip_smem node from device tree

4. Improved the dip_work list's management flow

5. Fixed the common issues Tomasz commented on Mediatek ISP Pass 1's RFC v0
patch series

==================
 Dependent patch
==================

DIP driver depends on MDP 3 driver and SCP driver. The patches are as
following:

[1]. support mdp3 on mt8183 platform
https://patchwork.kernel.org/cover/10945585/

[2]. Add support for mt8183 SCP
https://patchwork.kernel.org/cover/11027245/

==================
 Compliance test
==================

* Test command: v4l2-compliance -m /dev/media0
* test output:

v4l2-compliance SHA: not available, 32 bits

Compliance test for mtk-cam-dip device /dev/media0:

Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 27 Interfaces: 51 Pads: 48 Links: 75
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for mtk-cam-dip device /dev/media0: 7, Succeeded: 7, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video0:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000a (10)
	Name             : mtk-cam-dip preview Raw Input
	Function         : V4L2 I/O
	Pad 0x0100000b   : 0: Source
	  Link 0x0200000e: to remote pad 0x1000002 of entity 'preview': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video0: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video0:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000a (10)
	Name             : mtk-cam-dip preview Raw Input
	Function         : V4L2 I/O
	Pad 0x0100000b   : 0: Source
	  Link 0x0200000e: to remote pad 0x1000002 of entity 'preview': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video0: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video1:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000014
	Type             : V4L Video
Entity Info:
	ID               : 0x00000012 (18)
	Name             : mtk-cam-dip preview Tuning
	Function         : V4L2 I/O
	Pad 0x01000013   : 0: Source
	  Link 0x02000016: to remote pad 0x1000003 of entity 'preview': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(604): q.reqbufs(node, 1)
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
		fail: v4l2-test-buffers.cpp(741): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
		fail: v4l2-test-buffers.cpp(742): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video1: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video1:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000014
	Type             : V4L Video
Entity Info:
	ID               : 0x00000012 (18)
	Name             : mtk-cam-dip preview Tuning
	Function         : V4L2 I/O
	Pad 0x01000013   : 0: Source
	  Link 0x02000016: to remote pad 0x1000003 of entity 'preview': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(604): q.reqbufs(node, 1)
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
		fail: v4l2-test-buffers.cpp(741): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
		fail: v4l2-test-buffers.cpp(742): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video1: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video2:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300001c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001a (26)
	Name             : mtk-cam-dip preview NR Input
	Function         : V4L2 I/O
	Pad 0x0100001b   : 0: Source
	  Link 0x0200001e: to remote pad 0x1000004 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video2: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video2:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300001c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001a (26)
	Name             : mtk-cam-dip preview NR Input
	Function         : V4L2 I/O
	Pad 0x0100001b   : 0: Source
	  Link 0x0200001e: to remote pad 0x1000004 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video2: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video3:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000024
	Type             : V4L Video
Entity Info:
	ID               : 0x00000022 (34)
	Name             : mtk-cam-dip preview Shading
	Function         : V4L2 I/O
	Pad 0x01000023   : 0: Source
	  Link 0x02000026: to remote pad 0x1000005 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video3: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video3:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000024
	Type             : V4L Video
Entity Info:
	ID               : 0x00000022 (34)
	Name             : mtk-cam-dip preview Shading
	Function         : V4L2 I/O
	Pad 0x01000023   : 0: Source
	  Link 0x02000026: to remote pad 0x1000005 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video3: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video4:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300002c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000002a (42)
	Name             : mtk-cam-dip preview MDP0
	Function         : V4L2 I/O
	Pad 0x0100002b   : 0: Sink
	  Link 0x0200002e: from remote pad 0x1000006 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
		fail: v4l2-test-buffers.cpp(1622): doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT
	test Requests: FAIL

Total for mtk-cam-dip pre device /dev/video4: 45, Succeeded: 43, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video4:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300002c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000002a (42)
	Name             : mtk-cam-dip preview MDP0
	Function         : V4L2 I/O
	Pad 0x0100002b   : 0: Sink
	  Link 0x0200002e: from remote pad 0x1000006 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
		fail: v4l2-test-buffers.cpp(1622): doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT
	test Requests: FAIL

Total for mtk-cam-dip pre device /dev/video4: 45, Succeeded: 43, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video5:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000034
	Type             : V4L Video
Entity Info:
	ID               : 0x00000032 (50)
	Name             : mtk-cam-dip preview MDP1
	Function         : V4L2 I/O
	Pad 0x01000033   : 0: Sink
	  Link 0x02000036: from remote pad 0x1000007 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video5 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video5: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video5:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000034
	Type             : V4L Video
Entity Info:
	ID               : 0x00000032 (50)
	Name             : mtk-cam-dip preview MDP1
	Function         : V4L2 I/O
	Pad 0x01000033   : 0: Sink
	  Link 0x02000036: from remote pad 0x1000007 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video5 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video5: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video6:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300003c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000003a (58)
	Name             : mtk-cam-dip preview IMG2
	Function         : V4L2 I/O
	Pad 0x0100003b   : 0: Sink
	  Link 0x0200003e: from remote pad 0x1000008 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video6 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video6: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video6:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300003c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000003a (58)
	Name             : mtk-cam-dip preview IMG2
	Function         : V4L2 I/O
	Pad 0x0100003b   : 0: Sink
	  Link 0x0200003e: from remote pad 0x1000008 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video6 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video6: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video7:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000044
	Type             : V4L Video
Entity Info:
	ID               : 0x00000042 (66)
	Name             : mtk-cam-dip preview IMG3
	Function         : V4L2 I/O
	Pad 0x01000043   : 0: Sink
	  Link 0x02000046: from remote pad 0x1000009 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video7 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video7: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip pre device /dev/video7:

Driver Info:
	Driver name      : mtk-cam-dip pre
	Card type        : mtk-cam-dip preview
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000044
	Type             : V4L Video
Entity Info:
	ID               : 0x00000042 (66)
	Name             : mtk-cam-dip preview IMG3
	Function         : V4L2 I/O
	Pad 0x01000043   : 0: Sink
	  Link 0x02000046: from remote pad 0x1000009 of entity 'preview': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video7 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip pre device /dev/video7: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video8:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000055
	Type             : V4L Video
Entity Info:
	ID               : 0x00000053 (83)
	Name             : mtk-cam-dip capture Raw Input
	Function         : V4L2 I/O
	Pad 0x01000054   : 0: Source
	  Link 0x02000057: to remote pad 0x100004b of entity 'capture': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video8 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video8: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video8:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000055
	Type             : V4L Video
Entity Info:
	ID               : 0x00000053 (83)
	Name             : mtk-cam-dip capture Raw Input
	Function         : V4L2 I/O
	Pad 0x01000054   : 0: Source
	  Link 0x02000057: to remote pad 0x100004b of entity 'capture': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video8 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video8: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video9:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300005d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000005b (91)
	Name             : mtk-cam-dip capture Tuning
	Function         : V4L2 I/O
	Pad 0x0100005c   : 0: Source
	  Link 0x0200005f: to remote pad 0x100004c of entity 'capture': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video9 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(604): q.reqbufs(node, 1)
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
		fail: v4l2-test-buffers.cpp(741): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
		fail: v4l2-test-buffers.cpp(742): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video9: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video9:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300005d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000005b (91)
	Name             : mtk-cam-dip capture Tuning
	Function         : V4L2 I/O
	Pad 0x0100005c   : 0: Source
	  Link 0x0200005f: to remote pad 0x100004c of entity 'capture': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video9 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(604): q.reqbufs(node, 1)
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
		fail: v4l2-test-buffers.cpp(741): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
		fail: v4l2-test-buffers.cpp(742): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video9: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video10:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000065
	Type             : V4L Video
Entity Info:
	ID               : 0x00000063 (99)
	Name             : mtk-cam-dip capture NR Input
	Function         : V4L2 I/O
	Pad 0x01000064   : 0: Source
	  Link 0x02000067: to remote pad 0x100004d of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video10 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video10: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video10:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000065
	Type             : V4L Video
Entity Info:
	ID               : 0x00000063 (99)
	Name             : mtk-cam-dip capture NR Input
	Function         : V4L2 I/O
	Pad 0x01000064   : 0: Source
	  Link 0x02000067: to remote pad 0x100004d of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video10 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video10: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video11:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300006d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000006b (107)
	Name             : mtk-cam-dip capture Shading
	Function         : V4L2 I/O
	Pad 0x0100006c   : 0: Source
	  Link 0x0200006f: to remote pad 0x100004e of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video11 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video11: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video11:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300006d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000006b (107)
	Name             : mtk-cam-dip capture Shading
	Function         : V4L2 I/O
	Pad 0x0100006c   : 0: Source
	  Link 0x0200006f: to remote pad 0x100004e of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video11 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video11: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video12:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000075
	Type             : V4L Video
Entity Info:
	ID               : 0x00000073 (115)
	Name             : mtk-cam-dip capture MDP0
	Function         : V4L2 I/O
	Pad 0x01000074   : 0: Sink
	  Link 0x02000077: from remote pad 0x100004f of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video12 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
		fail: v4l2-test-buffers.cpp(1622): doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT
	test Requests: FAIL

Total for mtk-cam-dip cap device /dev/video12: 45, Succeeded: 43, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video12:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000075
	Type             : V4L Video
Entity Info:
	ID               : 0x00000073 (115)
	Name             : mtk-cam-dip capture MDP0
	Function         : V4L2 I/O
	Pad 0x01000074   : 0: Sink
	  Link 0x02000077: from remote pad 0x100004f of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video12 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
		fail: v4l2-test-buffers.cpp(1622): doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT
	test Requests: FAIL

Total for mtk-cam-dip cap device /dev/video12: 45, Succeeded: 43, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video13:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300007d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000007b (123)
	Name             : mtk-cam-dip capture MDP1
	Function         : V4L2 I/O
	Pad 0x0100007c   : 0: Sink
	  Link 0x0200007f: from remote pad 0x1000050 of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video13 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video13: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video13:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300007d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000007b (123)
	Name             : mtk-cam-dip capture MDP1
	Function         : V4L2 I/O
	Pad 0x0100007c   : 0: Sink
	  Link 0x0200007f: from remote pad 0x1000050 of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video13 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video13: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video14:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000085
	Type             : V4L Video
Entity Info:
	ID               : 0x00000083 (131)
	Name             : mtk-cam-dip capture IMG2
	Function         : V4L2 I/O
	Pad 0x01000084   : 0: Sink
	  Link 0x02000087: from remote pad 0x1000051 of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video14 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video14: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video14:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x03000085
	Type             : V4L Video
Entity Info:
	ID               : 0x00000083 (131)
	Name             : mtk-cam-dip capture IMG2
	Function         : V4L2 I/O
	Pad 0x01000084   : 0: Sink
	  Link 0x02000087: from remote pad 0x1000051 of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video14 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video14: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video15:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300008d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000008b (139)
	Name             : mtk-cam-dip capture IMG3
	Function         : V4L2 I/O
	Pad 0x0100008c   : 0: Sink
	  Link 0x0200008f: from remote pad 0x1000052 of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video15 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video15: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip cap device /dev/video15:

Driver Info:
	Driver name      : mtk-cam-dip cap
	Card type        : mtk-cam-dip capture
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300008d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000008b (139)
	Name             : mtk-cam-dip capture IMG3
	Function         : V4L2 I/O
	Pad 0x0100008c   : 0: Sink
	  Link 0x0200008f: from remote pad 0x1000052 of entity 'capture': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video15 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip cap device /dev/video15: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video16:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300009e
	Type             : V4L Video
Entity Info:
	ID               : 0x0000009c (156)
	Name             : mtk-cam-dip reprocess Raw Input
	Function         : V4L2 I/O
	Pad 0x0100009d   : 0: Source
	  Link 0x020000a0: to remote pad 0x1000094 of entity 'reprocess': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video16 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video16: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video16:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x0300009e
	Type             : V4L Video
Entity Info:
	ID               : 0x0000009c (156)
	Name             : mtk-cam-dip reprocess Raw Input
	Function         : V4L2 I/O
	Pad 0x0100009d   : 0: Source
	  Link 0x020000a0: to remote pad 0x1000094 of entity 'reprocess': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video16 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video16: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video17:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000a6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000a4 (164)
	Name             : mtk-cam-dip reprocess Tuning
	Function         : V4L2 I/O
	Pad 0x010000a5   : 0: Source
	  Link 0x020000a8: to remote pad 0x1000095 of entity 'reprocess': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video17 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(604): q.reqbufs(node, 1)
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
		fail: v4l2-test-buffers.cpp(741): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
		fail: v4l2-test-buffers.cpp(742): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video17: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video17:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x8c200000
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000a6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000a4 (164)
	Name             : mtk-cam-dip reprocess Tuning
	Function         : V4L2 I/O
	Pad 0x010000a5   : 0: Source
	  Link 0x020000a8: to remote pad 0x1000095 of entity 'reprocess': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video17 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(604): q.reqbufs(node, 1)
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
		fail: v4l2-test-buffers.cpp(741): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
		fail: v4l2-test-buffers.cpp(742): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video17: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video18:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000ae
	Type             : V4L Video
Entity Info:
	ID               : 0x000000ac (172)
	Name             : mtk-cam-dip reprocess NR Input
	Function         : V4L2 I/O
	Pad 0x010000ad   : 0: Source
	  Link 0x020000b0: to remote pad 0x1000096 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video18 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video18: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video18:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000ae
	Type             : V4L Video
Entity Info:
	ID               : 0x000000ac (172)
	Name             : mtk-cam-dip reprocess NR Input
	Function         : V4L2 I/O
	Pad 0x010000ad   : 0: Source
	  Link 0x020000b0: to remote pad 0x1000096 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video18 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video18: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video19:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000b6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000b4 (180)
	Name             : mtk-cam-dip reprocess Shading
	Function         : V4L2 I/O
	Pad 0x010000b5   : 0: Source
	  Link 0x020000b8: to remote pad 0x1000097 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video19 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video19: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video19:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000b6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000b4 (180)
	Name             : mtk-cam-dip reprocess Shading
	Function         : V4L2 I/O
	Pad 0x010000b5   : 0: Source
	  Link 0x020000b8: to remote pad 0x1000097 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video19 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video19: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video20:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000be
	Type             : V4L Video
Entity Info:
	ID               : 0x000000bc (188)
	Name             : mtk-cam-dip reprocess MDP0
	Function         : V4L2 I/O
	Pad 0x010000bd   : 0: Sink
	  Link 0x020000c0: from remote pad 0x1000098 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video20 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
		fail: v4l2-test-buffers.cpp(1622): doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT
	test Requests: FAIL

Total for mtk-cam-dip rep device /dev/video20: 45, Succeeded: 43, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video20:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000be
	Type             : V4L Video
Entity Info:
	ID               : 0x000000bc (188)
	Name             : mtk-cam-dip reprocess MDP0
	Function         : V4L2 I/O
	Pad 0x010000bd   : 0: Sink
	  Link 0x020000c0: from remote pad 0x1000098 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video20 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
		fail: v4l2-test-buffers.cpp(1622): doioctl_fd(req_fd, MEDIA_REQUEST_IOC_QUEUE, 0) != ENOENT
	test Requests: FAIL

Total for mtk-cam-dip rep device /dev/video20: 45, Succeeded: 43, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video21:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000c6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000c4 (196)
	Name             : mtk-cam-dip reprocess MDP1
	Function         : V4L2 I/O
	Pad 0x010000c5   : 0: Sink
	  Link 0x020000c8: from remote pad 0x1000099 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video21 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video21: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video21:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000c6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000c4 (196)
	Name             : mtk-cam-dip reprocess MDP1
	Function         : V4L2 I/O
	Pad 0x010000c5   : 0: Sink
	  Link 0x020000c8: from remote pad 0x1000099 of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video21 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video21: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video22:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000ce
	Type             : V4L Video
Entity Info:
	ID               : 0x000000cc (204)
	Name             : mtk-cam-dip reprocess IMG2
	Function         : V4L2 I/O
	Pad 0x010000cd   : 0: Sink
	  Link 0x020000d0: from remote pad 0x100009a of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video22 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video22: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video22:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000ce
	Type             : V4L Video
Entity Info:
	ID               : 0x000000cc (204)
	Name             : mtk-cam-dip reprocess IMG2
	Function         : V4L2 I/O
	Pad 0x010000cd   : 0: Sink
	  Link 0x020000d0: from remote pad 0x100009a of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video22 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video22: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video23:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000d6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000d4 (212)
	Name             : mtk-cam-dip reprocess IMG3
	Function         : V4L2 I/O
	Pad 0x010000d5   : 0: Sink
	  Link 0x020000d8: from remote pad 0x100009b of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video23 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video23: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip rep device /dev/video23:

Driver Info:
	Driver name      : mtk-cam-dip rep
	Card type        : mtk-cam-dip reprocess
	Bus info         : platform:15022000.dip
	Driver version   : 4.19.66
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000d6
	Type             : V4L Video
Entity Info:
	ID               : 0x000000d4 (212)
	Name             : mtk-cam-dip reprocess IMG3
	Function         : V4L2 I/O
	Pad 0x010000d5   : 0: Sink
	  Link 0x020000d8: from remote pad 0x100009b of entity 'reprocess': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video23 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
		fail: v4l2-test-buffers.cpp(709): q.create_bufs(node, 1, &fmt) != EINVAL
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
	test VIDIOC_EXPBUF: OK
	test Requests: OK

Total for mtk-cam-dip rep device /dev/video23: 45, Succeeded: 44, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip device /dev/v4l-subdev0:

Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000dc
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : preview
	Function         : Video Pixel Formatter
	Pad 0x01000002   : 0: Sink
	  Link 0x0200000e: from remote pad 0x100000b of entity 'mtk-cam-dip preview Raw Input': Data, Enabled
	Pad 0x01000003   : 1: Sink
	  Link 0x02000016: from remote pad 0x1000013 of entity 'mtk-cam-dip preview Tuning': Data
	Pad 0x01000004   : 2: Sink
	  Link 0x0200001e: from remote pad 0x100001b of entity 'mtk-cam-dip preview NR Input': Data, Dynamic
	Pad 0x01000005   : 3: Sink
	  Link 0x02000026: from remote pad 0x1000023 of entity 'mtk-cam-dip preview Shading': Data, Dynamic
	Pad 0x01000006   : 4: Source
	  Link 0x0200002e: to remote pad 0x100002b of entity 'mtk-cam-dip preview MDP0': Data, Dynamic
	Pad 0x01000007   : 5: Source
	  Link 0x02000036: to remote pad 0x1000033 of entity 'mtk-cam-dip preview MDP1': Data, Dynamic
	Pad 0x01000008   : 6: Source
	  Link 0x0200003e: to remote pad 0x100003b of entity 'mtk-cam-dip preview IMG2': Data, Dynamic
	Pad 0x01000009   : 7: Source
	  Link 0x02000046: to remote pad 0x1000043 of entity 'mtk-cam-dip preview IMG3': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 3):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 6):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 7):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for mtk-cam-dip device /dev/v4l-subdev0: 97, Succeeded: 95, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip device /dev/v4l-subdev1:

Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000de
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x0000004a (74)
	Name             : capture
	Function         : Video Pixel Formatter
	Pad 0x0100004b   : 0: Sink
	  Link 0x02000057: from remote pad 0x1000054 of entity 'mtk-cam-dip capture Raw Input': Data, Enabled
	Pad 0x0100004c   : 1: Sink
	  Link 0x0200005f: from remote pad 0x100005c of entity 'mtk-cam-dip capture Tuning': Data
	Pad 0x0100004d   : 2: Sink
	  Link 0x02000067: from remote pad 0x1000064 of entity 'mtk-cam-dip capture NR Input': Data, Dynamic
	Pad 0x0100004e   : 3: Sink
	  Link 0x0200006f: from remote pad 0x100006c of entity 'mtk-cam-dip capture Shading': Data, Dynamic
	Pad 0x0100004f   : 4: Source
	  Link 0x02000077: to remote pad 0x1000074 of entity 'mtk-cam-dip capture MDP0': Data, Dynamic
	Pad 0x01000050   : 5: Source
	  Link 0x0200007f: to remote pad 0x100007c of entity 'mtk-cam-dip capture MDP1': Data, Dynamic
	Pad 0x01000051   : 6: Source
	  Link 0x02000087: to remote pad 0x1000084 of entity 'mtk-cam-dip capture IMG2': Data, Dynamic
	Pad 0x01000052   : 7: Source
	  Link 0x0200008f: to remote pad 0x100008c of entity 'mtk-cam-dip capture IMG3': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev1 open: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 3):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 6):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 7):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for mtk-cam-dip device /dev/v4l-subdev1: 97, Succeeded: 95, Failed: 2, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mtk-cam-dip device /dev/v4l-subdev2:

Media Driver Info:
	Driver name      : mtk-cam-dip
	Model            : mtk-cam-dip
	Serial           : 
	Bus info         : platform:15022000.dip
	Media version    : 4.19.66
	Hardware revision: 0x00000000 (0)
	Driver version   : 4.19.66
Interface Info:
	ID               : 0x030000e0
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000093 (147)
	Name             : reprocess
	Function         : Video Pixel Formatter
	Pad 0x01000094   : 0: Sink
	  Link 0x020000a0: from remote pad 0x100009d of entity 'mtk-cam-dip reprocess Raw Input': Data, Enabled
	Pad 0x01000095   : 1: Sink
	  Link 0x020000a8: from remote pad 0x10000a5 of entity 'mtk-cam-dip reprocess Tuning': Data
	Pad 0x01000096   : 2: Sink
	  Link 0x020000b0: from remote pad 0x10000ad of entity 'mtk-cam-dip reprocess NR Input': Data, Dynamic
	Pad 0x01000097   : 3: Sink
	  Link 0x020000b8: from remote pad 0x10000b5 of entity 'mtk-cam-dip reprocess Shading': Data, Dynamic
	Pad 0x01000098   : 4: Source
	  Link 0x020000c0: to remote pad 0x10000bd of entity 'mtk-cam-dip reprocess MDP0': Data, Dynamic
	Pad 0x01000099   : 5: Source
	  Link 0x020000c8: to remote pad 0x10000c5 of entity 'mtk-cam-dip reprocess MDP1': Data, Dynamic
	Pad 0x0100009a   : 6: Source
	  Link 0x020000d0: to remote pad 0x10000cd of entity 'mtk-cam-dip reprocess IMG2': Data, Dynamic
	Pad 0x0100009b   : 7: Source
	  Link 0x020000d8: to remote pad 0x10000d5 of entity 'mtk-cam-dip reprocess IMG3': Data, Dynamic

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK

Allow for multiple opens:
	test second /dev/v4l-subdev2 open: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(352): doioctl(node, VIDIOC_SUBDEV_G_FMT, &fmt)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 3):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 6):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 7):
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for mtk-cam-dip device /dev/v4l-subdev2: 97, Succeeded: 95, Failed: 2, Warnings: 0

Grand Total for mtk-cam-dip device /dev/media0: 2458, Succeeded: 2398, Failed: 60, Warnings: 0



Frederic Chen (5):
  dt-bindings: mt8183: Added DIP dt-bindings
  dts: arm64: mt8183: Add DIP nodes
  media: platform: Add Mediatek DIP driver KConfig
  platform: mtk-isp: Add Mediatek DIP driver
  media: platform: mtk-mdp3: Add struct tuning_addr and img_sw_buffer

 .../bindings/media/mediatek,mt8183-dip.txt    |   40 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   16 +
 drivers/media/platform/Kconfig                |    2 +
 drivers/media/platform/mtk-isp/Kconfig        |   19 +
 drivers/media/platform/mtk-isp/Makefile       |    7 +
 .../media/platform/mtk-isp/isp_50/Makefile    |    7 +
 .../platform/mtk-isp/isp_50/dip/Makefile      |   18 +
 .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.c |  650 +++++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-dev.h |  566 +++++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-hw.h  |  156 ++
 .../platform/mtk-isp/isp_50/dip/mtk_dip-sys.c |  521 ++++
 .../mtk-isp/isp_50/dip/mtk_dip-v4l2.c         | 2255 +++++++++++++++++
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |   15 +-
 13 files changed, 4270 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-dev.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-hw.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-sys.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/dip/mtk_dip-v4l2.c

-- 
2.18.0



