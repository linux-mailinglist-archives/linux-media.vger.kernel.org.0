Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A30678083
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 16:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbjAWPvX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 10:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbjAWPvT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 10:51:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5DD13D65;
        Mon, 23 Jan 2023 07:51:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D222BB80D39;
        Mon, 23 Jan 2023 15:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129C6C433EF;
        Mon, 23 Jan 2023 15:51:10 +0000 (UTC)
Message-ID: <200db318-73e8-988c-7992-e529e332a6a1@xs4all.nl>
Date:   Mon, 23 Jan 2023 16:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 00/12] Add support for multiple chips
Content-Language: en-US
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113064104.22402-1-moudy.ho@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230113064104.22402-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/01/2023 07:40, Moudy Ho wrote:
> Changes since v4:
> - Rebase on linux-next.
> - Fix potential frame size overflow in "mtk-mdp3-regs.c".
> - Fix OOB in MDP3 component clocks in "mtk-mdp3-comp.*".
> - Reconfigure the shared memory between MDP3 kerenl and SCP.
> 
> Changes since v3:
> - Rebase on linux-next.
> - In the file "mtk-mdp3-m2m.c", use the limited resolution defined by
>   each platform to replace the default format.
> - Add platform ID in driver data, and refine shared memory structure preprocessing.
> - Simplify the way to get mutex ID in function "mdp_path_subfrm_require".
> 
> Changes since v2:
> - Depend on :
>   [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=687004
> - Split the shared memory header(mtk-img-ipi.h) by preprocessing instead, and
>   classify the generic parts into "mtk-mdp3-type.h", and move
>   chip-specific parts to"mt8183/mdp3-comp-mt8183.h".
> 
> Changes since v1:
> - Depend on :
>   [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=687004
> - For hardware-specific structures in the shared memory header(mtk-img-ipi.h),
>   split the relevant functions and structure definitions.
> 
> Hi,
> 
> To support multiple chips, a chip configuration header file needs to be created
> and the relevant information split and moved into it.

FYI: compiling this series with smatch results in the following warnings and errors:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c:285 mdp_vpu_process() warn: inconsistent returns 'vpu->lock'.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:43 is_output_disabled() error: uninitialized symbol 'dis_output'.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:43 is_output_disabled() error: uninitialized symbol 'dis_tile'.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:427 mdp_cmdq_send() warn: missing error code 'ret'
drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:59 get_comp_public_id() error: 'mdp_dev' dereferencing possible ERR_PTR()

Regards,

	Hans

> 
> The v4l2-compliance test results list is as follows:
> v4l2-compliance 1.23.0-4942, 32 bits, 32-bit time_t
> v4l2-compliance SHA: 4cf258c24026 2022-07-28 15:43:45
> 
> Compliance test for mtk-mdp3 device /dev/video0:
> 
> Driver Info:
> 	Driver name      : mtk-mdp3
> 	Card type        : MediaTek MDP3
> 	Bus info         : platform:14001000.mdp3-rdma0
> 	Driver version   : 6.2.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 4 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test TIME32/64: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
>     (snip)
> 	test MMAP (no poll): OK
> 	(snip)
> 	test MMAP (select): OK
>     (snip)
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Stream using all formats:
> 	(snip)
> Total for mtk-mdp3 device /dev/video0: 1174, Succeeded: 1174, Failed: 0, Warnings: 0
> 
> Moudy Ho (12):
>   media: platform: mtk-mdp3: fix potential frame size overflow in
>     mdp_try_fmt_mplane()
>   media: platform: mtk-mdp3: add chip configuration header file
>   media: platform: mtk-mdp3: chip config split about component settings
>   media: platform: mtk-mdp3: chip config split about subcomponents
>   media: platform: mtk-mdp3: chip config split about color format
>   media: platform: mtk-mdp3: chip config split about resolution
>     limitations
>   media: platform: mtk-mdp3: chip config split about pipe info
>   media: platform: mtk-mdp3: extend mdp_color format for compressed mode
>   media: platform: mtk-mdp3: dynamically allocate component clocks
>   media: platform: mtk-mdp3: Split general definitions used in MDP3
>   media: platform: mtk-mdp3: decompose hardware-related information in
>     shared memory
>   media: platform: mtk-mdp3: reconfigure shared memory
> 
>  .../mediatek/mdp3/mt8183/mdp3-comp-mt8183.h   | 144 +++++
>  .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   | 409 +++++++++++++
>  .../platform/mediatek/mdp3/mtk-img-ipi.h      | 188 +-----
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 145 +++--
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 567 ++++++++++++------
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  27 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  49 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  18 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  28 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.h     |   1 -
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.c    | 287 +--------
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.h    | 214 +++----
>  .../platform/mediatek/mdp3/mtk-mdp3-type.h    |  53 ++
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     | 194 +++---
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.h     |  29 +-
>  15 files changed, 1397 insertions(+), 956 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mt8183/mdp3-comp-mt8183.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> 

