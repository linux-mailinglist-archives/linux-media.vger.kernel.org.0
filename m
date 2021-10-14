Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99CD42D551
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 10:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhJNIp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 04:45:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37162 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229970AbhJNIp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 04:45:27 -0400
X-UUID: 3ce46c0826c94b70bc6b09db3601ba85-20211014
X-UUID: 3ce46c0826c94b70bc6b09db3601ba85-20211014
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1107982130; Thu, 14 Oct 2021 16:43:19 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Oct 2021 16:43:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 Oct
 2021 16:43:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Oct 2021 16:43:17 +0800
Message-ID: <3a07501641da72ea9b3cf528050c9d7516e09497.camel@mediatek.com>
Subject: Re: [PATCH v7 0/5] media: mediatek: support mdp3 on mt8183 platform
From:   moudy ho <moudy.ho@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <hsinyi@google.com>
Date:   Thu, 14 Oct 2021 16:43:17 +0800
In-Reply-To: <0a50c059-bb13-0823-778c-b631ed07d76f@xs4all.nl>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
         <0a50c059-bb13-0823-778c-b631ed07d76f@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for your kind guidance, it is really helpful for us to
comprehend V4L2 framework.
After modifying the settings you mentioned, the V4L2-Compliance test
results all passed and listed below.
All these changes will be integrated into the next version.

localhost ~ # v4l2-compliance -d 11
v4l2-compliance SHA: not available
, 32 bits, 32-bit time_t

Compliance test for mtk-mdp3 device /dev/video11:

Driver Info:
        Driver name      : mtk-mdp3
        Card type        : 14001000.mdp3_rdma0
        Bus info         : platform:mtk-mdp3
        Driver version   : 5.10.66
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video11 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
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
        Standard Controls: 4 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for mtk-mdp3 device /dev/video11: 45, Succeeded: 45, Failed: 0,
Warnings: 0

localhost ~ # v4l2-compliance -d 11 -s 1
v4l2-compliance SHA: not available
, 32 bits, 32-bit time_t

Compliance test for mtk-mdp3 device /dev/video11:

Driver Info:
        Driver name      : mtk-mdp3
        Card type        : 14001000.mdp3_rdma0
        Bus info         : platform:mtk-mdp3
        Driver version   : 5.10.66
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video11 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

        test invalid ioctls: OK
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
        Standard Controls: 4 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 1 buffers
        test MMAP (no poll): OK
        Video Capture Multiplanar: Captured 1 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 1 buffers
        test MMAP (epoll): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for mtk-mdp3 device /dev/video11: 52, Succeeded: 52, Failed: 0,
Warnings: 0

Thanks & Regards,
Moudy Ho

On Fri, 2021-09-03 at 12:01 +0200, Hans Verkuil wrote:
> Hi Moudy,
> 
> Can you provide the 'v4l2-compliance -s' output?
> 
> Make sure to compile v4l2-compliance from the latest code base:
> 
https://urldefense.com/v3/__https://git.linuxtv.org/v4l-utils.git/__;!!CTRNKA9wMg0ARbw!2QmkFhMoYBCR4MC5d_l8b7zvdEdwkfd6826nOY6WAHQChU4rMl8P9UtO6Z8ZrcPD$
>  
> 
> Compiling on x86_64 (so using COMPILE_TEST) fails:
> 
>   LD      .tmp_vmlinux.kallsyms1
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-core.o: in function
> `mdp_probe':
> mtk-mdp3-core.c:(.text+0x415): undefined reference to
> `mtk_mutex_mdp_get'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.o: in function
> `config_camin_subfrm':
> mtk-mdp3-comp.c:(.text+0x9b): undefined reference to
> `mtk_mmsys_mdp_camin_ctrl'
> ld: mtk-mdp3-comp.c:(.text+0xbc): undefined reference to
> `mtk_mmsys_mdp_camin_ctrl'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.o: in function
> `mdp_component_deinit':
> mtk-mdp3-comp.c:(.text+0x2707): undefined reference to
> `mtk_mutex_put'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.o: in function
> `init_isp.cold':
> mtk-mdp3-comp.c:(.text.unlikely+0x4f): undefined reference to
> `mtk_mmsys_mdp_isp_ctrl'
> ld: mtk-mdp3-comp.c:(.text.unlikely+0x7a): undefined reference to
> `mtk_mmsys_mdp_isp_ctrl'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function
> `mdp_auto_release_work':
> mtk-mdp3-cmdq.c:(.text+0x13): undefined reference to
> `mtk_mutex_unprepare'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function
> `mdp_path_subfrm_require':
> mtk-mdp3-cmdq.c:(.text+0x45e): undefined reference to
> `mtk_mutex_add_mdp_mod'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function
> `mdp_path_subfrm_run.isra.0':
> mtk-mdp3-cmdq.c:(.text+0x78b): undefined reference to
> `mtk_mutex_enable_by_cmdq'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function
> `mdp_path_config_subfrm':
> mtk-mdp3-cmdq.c:(.text+0xa0d): undefined reference to
> `mtk_mmsys_mdp_connect'
> ld: mtk-mdp3-cmdq.c:(.text+0xd08): undefined reference to
> `mtk_mmsys_mdp_disconnect'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function
> `mdp_cmdq_send':
> (.text+0x1358): undefined reference to `mtk_mutex_prepare'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function
> `mdp_handle_cmdq_callback.cold':
> mtk-mdp3-cmdq.c:(.text.unlikely+0x34): undefined reference to
> `mtk_mutex_unprepare'
> ld: drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.o: in function
> `mdp_cmdq_send.cold':
> mtk-mdp3-cmdq.c:(.text.unlikely+0xe3): undefined reference to
> `mtk_mutex_unprepare'
> make: *** [Makefile:1177: vmlinux] Error 1
> 
> I also get compile warnings:
> 
> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function
> ‘mdp_sub_comps_create’:
> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:1151:29: warning:
> implicit conversion from ‘enum mtk_mdp_comp_id’ to ‘enum
> mdp_comp_type’ [-Wenum-conversion]
>  1151 |   enum mdp_comp_type type = MDP_COMP_NONE;
>       |                             ^~~~~~~~~~~~~
> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function
> ‘mdp_component_init’:
> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:1217:6: warning:
> unused variable ‘i’ [-Wunused-variable]
>  1217 |  int i, ret;
>       |      ^
> drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c: In function
> ‘mdp_cmdq_send’:
> drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:489:1: warning: the
> frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-
> than=]
>   489 | }
>       | ^
> 
> Regards,
> 
> 	Hans
> 
> On 24/08/2021 12:00, Moudy Ho wrote:
> > Changes since v6:
> > - Refactor GCE event to corresponding node.
> > - Fix dt_binding_check fail.
> > - Fix compilation errors.
> > 
> > Changes since v5:
> > - Rebase on v5.14-rc6.
> > - Move MMSYS/Mutex settings to corresponding driver.
> > - Revise the software license description and copyright.
> > - Remove unnecessary enum. or definitions.
> > - Optimize platform/chip definition conditions.
> > - Use general printing functions instead of MDP3 private ones.
> > - Fix compile warning.
> > 
> > Changes since v4:
> > - Rebase on v5.13-rc1.
> > - Remove the CMDQ flush flow to match the CMDQ API change.
> > - Integrate four of MDP's direct-link subcomponents into MDP
> > controller node
> >   from syscon node to avoid illegal clock usage.
> > - Rewrite dt-binding in a JSON compatible subset of YAML
> > - Fix a bit of macro argument precedence.
> > 
> > Changes since v3:
> > - Rebase on v5.9-rc1.
> > - modify code for review comment from Rob Herring, cancel multiple
> > nodes using
> >   same register base situation.
> > - control IOMMU port through pm runtime get/put to DMA components'
> > device.
> > - SCP(VPU) driver revision.
> > - stop queuing jobs(remove flush_workqueue()) after
> > mdp_m2m_release().
> > - add computation of plane address with data_offset.
> > - fix scale ratio check issue.
> > - add default v4l2_format setting.
> > 
> > Changes since v2:
> > - modify code for review comment from Tomasz Figa & Alexandre
> > Courbot
> > - review comment from Rob Herring will offer code revision in v4,
> > due to
> >   it's related to device node modification, will need to modify
> > code
> >   architecture
> > 
> > Changes since v1:
> > - modify code for CMDQ v3 API support
> > - EC ipi cmd migration
> > - fix compliance test fail item (m2m cmd with -f) due to there is
> > two problem in runing all format(-f) cmd:
> > 1. out of memory before test complete
> >         Due to capture buffer mmap (refcount + 1) after reqbuf but
> > seems
> >         no corresponding munmap called before device close.
> >         There are total 12XX items(formats) in format test and each
> > format
> >         alloc 8 capture/output buffers.
> > 2. unceasingly captureBufs() (randomly)
> >         Seems the break statement didn't catch the count == 0
> > situation:
> >         In v4l2-test-buffers.cpp, function: captureBufs()
> >                         ...
> >                         count--;
> >                         if (!node->is_m2m && !count)
> >                                 break;
> >         Log is as attachment
> > 
> > I will paste the test result with problem part in another e-mail
> > 
> > Hi,
> > 
> > This is the first version of RFC patch for Media Data Path 3
> > (MDP3),
> > MDP3 is used for scaling and color format conversion.
> > support using GCE to write register in critical time limitation.
> > support V4L2 m2m device control.
> > 
> > Moudy Ho (5):
> >   soc: mediatek: mutex: add support for MDP
> >   soc: mediatek: mmsys: Add support for MDP
> >   dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
> >   dts: arm64: mt8183: Add Mediatek MDP3 nodes
> >   media: platform: mtk-mdp3: Add Mediatek MDP3 driver
> > 
> >  .../bindings/media/mediatek,mdp3-ccorr.yaml   |   57 +
> >  .../bindings/media/mediatek,mdp3-rdma.yaml    |  207 +++
> >  .../bindings/media/mediatek,mdp3-rsz.yaml     |   65 +
> >  .../bindings/media/mediatek,mdp3-wdma.yaml    |   71 +
> >  .../bindings/media/mediatek,mdp3-wrot.yaml    |   71 +
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  110 ++
> >  drivers/media/platform/Kconfig                |   19 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/mtk-mdp3/Makefile      |    6 +
> >  .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
> >  drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
> >  .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
> >  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
> >  .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
> >  .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
> >  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  507 +++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1307
> > +++++++++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  329 +++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  801 ++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   41 +
> >  .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  746 ++++++++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  372 +++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  312 ++++
> >  .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
> >  drivers/soc/mediatek/mt8183-mmsys.h           |  235 +++
> >  drivers/soc/mediatek/mtk-mmsys.c              |  164 +++
> >  drivers/soc/mediatek/mtk-mmsys.h              |    9 +-
> >  drivers/soc/mediatek/mtk-mutex.c              |  106 +-
> >  include/linux/soc/mediatek/mtk-mmsys.h        |   81 +
> >  include/linux/soc/mediatek/mtk-mutex.h        |    8 +
> >  34 files changed, 6495 insertions(+), 9 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> >  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
> >  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> > 
> 
> 

