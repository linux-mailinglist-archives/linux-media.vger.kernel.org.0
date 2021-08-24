Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EE93F5EAB
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 15:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237425AbhHXNHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 09:07:03 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:35273 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237325AbhHXNHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 09:07:02 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IW87mJKRJCu83IW88ma1Vn; Tue, 24 Aug 2021 15:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1629810377; bh=QFsB8tTltlYKn/gLF/eLcZB3Zec7BgwkrqJ5W6ogtss=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Wfvrrplhg6Shl4VCRferY+loTWGrozXH5JlfwRGPE9mviFGsHVyxNLNmC6xUfRyYl
         3WEph4/9g+OFG2HzKEt9Ig4WP9D829nSwf7LpPvtZF/wwqxy4QJHxWKOt8r+YgNVHQ
         +SFbOqe0Vw0mOdrGMNWV/2yq4V7kYt+byBcp01vYU9OFF+wj21/XaFyonln1Pe3AsT
         /jpy9PM6mHhqNCE9pw9+vRZGJ6FWznGe/jPKawOvg20wEvrNBEn8QG96V4/SAgihY0
         8ilVAQoNSBcKEDJounLlTBMKcrOq19CQ0Wd40/h+S7frWvOQYFj4W/ZdROjIAexRmY
         q2ZEcX0xJWYvg==
Subject: Re: [PATCH 00/30] TI Video Decoder driver upstreaming to v5.14-rc6
 kernel
To:     sidraya.bj@pathpartnertech.com, gregkh@linuxfoundation.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc:     prashanth.ka@pathpartnertech.com, praneeth@ti.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2d9456e8-6b73-0815-29b8-20919d34e666@xs4all.nl>
Date:   Tue, 24 Aug 2021 15:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOAIyGWoJ2WUQ5I/jCA+P4EEm/2E11NnjOSN5Hh+u+p43nuPN3mp/dIPPal4Kgic909eN+TU+UwAL8AcH9e7C+6CWXZfLJV0cPB15JgyGuHzepBjU6kg
 vBUBgJmbAuvq2ONeTiZ2i2Q6qeX1SPDoSiMaA6IDCT3si5Hl0CXdDb+KC1lO+ayuEx/tgI9YH2XWp+kJsgeP5KuF3ns5GespP+K5u/hJdb/Vz/kh0JBtvSnX
 yCz2C+YJNxbomCPvPTh6Pz4W6IyIPM1ainhHWxLlOpYaANQLVNlQpEOQzr4z0ZfKUHTfom4ZepGu3bepVcOpmsLTeU/8LTYTtRB5RSz7RJf9MJHEQUATV/kd
 wpy9Sxxtc3RDqom9GQodcKcd5pAPFoRB2rfYGYPBAdUpTqnvodUFnGx1GcP+7KtV2nZfA8f+2b8t4LtxGJnkE/I46eIx+JUSKsrqD368gfS1U0XFDj2N6YwA
 dl5lJhRtlHXbI67PudOZWxL0fEtLfNF3R+gAtXJnTfFdVsKMYnraeLbmbzDjQvRTRfsi7GASpKGd8n9qffyuXnz5jSg/VrpbirKol/6TO43NFXMz8uKucA8S
 MQ65K/5Em0C85Aw5xYu7FzIe
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sidraya,

On 18/08/2021 16:10, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> This series of patches implements v4l2 based Decoder driver for H264,
> H265 and MJPEG decoding standards.This Driver is for D5520 H/W decoder on
> DRA8x SOC of J721e platform.
> This driver has been tested on v5.14-rc6 kernel for following
> decoding standards on v4l2 based Gstreamer 1.16 plug-in.
> 1. H264
> 2. H265
> 3. MJPEG
> 
> Note:
> Currently Driver uses list, map and queue custom data structure APIs
> implementation and IOMMU custom framework.We are working on replacing
> customised APIs with Linux kernel generic framework APIs.
> Meanwhile would like to address review comments from
> reviewers before merging to main media/platform subsystem.

OK, so I consider this an RFC series rather than an actual driver submission
and I'll mark it as such in patchwork.

First of all, patch 13/30 never made it to the linux-media mailinglist, so the
series as a whole will not apply. Can you repost 13/30? One possible reason why
13/30 might have been dropped is if it it a really large patch. You may have to
split it up in that case.

Did you run v4l2-compliance for this driver? Always compile v4l2-compliance
(part of https://git.linuxtv.org/v4l-utils.git/) from the git repo sources
to make sure you have most recent tests.

I need to see the output of 'v4l2-compliance' as part of the cover letter.
There shouldn't be any failures.

I see a lot of pointless #ifdef DEBUG_DECODER_DRIVER lines. Either just drop
the debug code or use dev_dbg/pr_debug. Ditto for VDEC_ASSERT(). This really
pollutes the code.

Can you provide a high-level description of the hardware? It seems like this
driver is a lot more complex than other decoder drivers, but it is not immediately
clear why that is. One reason might be that the hardware/firmware is a stateless
decoder, while the driver exposes a stateful decoder API. See the m2m interface
documentation for the differences between the two:

https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/dev-mem2mem.html

If that's the case, then the driver should really be a stateless driver, that
will likely make things much easier.

In any case, this driver clearly needs a lot more work.

Regards,

	Hans

> 
> Sidraya (30):
>   dt-bindings: Add binding for img,d5500-vxd for DRA8x
>   v4l: vxd-dec: Create mmu programming helper library
>   v4l: vxd-dec: Create vxd_dec Mem Manager helper library
>   v4l: vxd-dec: Add vxd helper library
>   v4l: vxd-dec: Add IMG VXD Video Decoder mem to mem drive
>   v4l: vxd-dec: Add hardware control modules
>   v4l: vxd-dec: Add vxd core module
>   v4l: vxd-dec: Add translation control modules
>   v4l: vxd-dec: Add idgen api modules
>   v4l: vxd-dec: Add utility modules
>   v4l: vxd-dec: Add TALMMU module
>   v4l: vxd-dec: Add VDEC MMU wrapper
>   v4l: vxd-dec: Add Bistream Preparser (BSPP) module
>   v4l: vxd-dec: Add common headers
>   v4l: vxd-dec: Add firmware interface headers
>   v4l: vxd-dec: Add pool api modules
>   v4l: vxd-dec: This patch implements resource manage component
>   v4l: vxd-dec: This patch implements pixel processing library
>   v4l:vxd-dec:vdecdd utility library
>   v4l:vxd-dec:Decoder resource component
>   v4l:vxd-dec:Decoder Core Component
>   v4l:vxd-dec:vdecdd headers added
>   v4l:vxd-dec:Decoder Component
>   v4l:vxd-dec: Add resource manager
>   v4l: videodev2: Add 10bit definitions for NV12 and NV16 color formats
>   media: Kconfig: Add Video decoder kconfig and Makefile entries
>   media: platform: vxd: Kconfig: Add Video decoder Kconfig and Makefile
>   IMG DEC V4L2 Interface function implementations
>   arm64: dts: dra82: Add v4l2 vxd_dec device node
>   ARM64: ti_sdk_arm64_release_defconfig: Enable d5520 video decoder
>     driver
> 
>  .../bindings/media/img,d5520-vxd.yaml         |   52 +
>  MAINTAINERS                                   |  114 +
>  arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |    9 +
>  .../configs/ti_sdk_arm64_release_defconfig    | 7407 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>  drivers/staging/media/Kconfig                 |    2 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/vxd/common/addr_alloc.c |  499 ++
>  drivers/staging/media/vxd/common/addr_alloc.h |  238 +
>  drivers/staging/media/vxd/common/dq.c         |  248 +
>  drivers/staging/media/vxd/common/dq.h         |   36 +
>  drivers/staging/media/vxd/common/hash.c       |  481 ++
>  drivers/staging/media/vxd/common/hash.h       |   86 +
>  drivers/staging/media/vxd/common/idgen_api.c  |  449 +
>  drivers/staging/media/vxd/common/idgen_api.h  |   59 +
>  drivers/staging/media/vxd/common/img_errors.h |  104 +
>  drivers/staging/media/vxd/common/img_mem.h    |   43 +
>  .../staging/media/vxd/common/img_mem_man.c    | 1124 +++
>  .../staging/media/vxd/common/img_mem_man.h    |  231 +
>  .../media/vxd/common/img_mem_unified.c        |  276 +
>  drivers/staging/media/vxd/common/imgmmu.c     |  782 ++
>  drivers/staging/media/vxd/common/imgmmu.h     |  180 +
>  drivers/staging/media/vxd/common/lst.c        |  119 +
>  drivers/staging/media/vxd/common/lst.h        |   37 +
>  drivers/staging/media/vxd/common/pool.c       |  228 +
>  drivers/staging/media/vxd/common/pool.h       |   66 +
>  drivers/staging/media/vxd/common/pool_api.c   |  709 ++
>  drivers/staging/media/vxd/common/pool_api.h   |  113 +
>  drivers/staging/media/vxd/common/ra.c         |  972 +++
>  drivers/staging/media/vxd/common/ra.h         |  200 +
>  drivers/staging/media/vxd/common/resource.c   |  576 ++
>  drivers/staging/media/vxd/common/resource.h   |   66 +
>  drivers/staging/media/vxd/common/rman_api.c   |  620 ++
>  drivers/staging/media/vxd/common/rman_api.h   |   66 +
>  drivers/staging/media/vxd/common/talmmu_api.c |  753 ++
>  drivers/staging/media/vxd/common/talmmu_api.h |  246 +
>  drivers/staging/media/vxd/common/vid_buf.h    |   42 +
>  drivers/staging/media/vxd/common/work_queue.c |  188 +
>  drivers/staging/media/vxd/common/work_queue.h |   66 +
>  drivers/staging/media/vxd/decoder/Kconfig     |   13 +
>  drivers/staging/media/vxd/decoder/Makefile    |  129 +
>  drivers/staging/media/vxd/decoder/bspp.c      | 2479 ++++++
>  drivers/staging/media/vxd/decoder/bspp.h      |  363 +
>  drivers/staging/media/vxd/decoder/bspp_int.h  |  514 ++
>  drivers/staging/media/vxd/decoder/core.c      | 3656 ++++++++
>  drivers/staging/media/vxd/decoder/core.h      |   72 +
>  .../staging/media/vxd/decoder/dec_resources.c |  554 ++
>  .../staging/media/vxd/decoder/dec_resources.h |   46 +
>  drivers/staging/media/vxd/decoder/decoder.c   | 4622 ++++++++++
>  drivers/staging/media/vxd/decoder/decoder.h   |  375 +
>  .../staging/media/vxd/decoder/fw_interface.h  |  818 ++
>  drivers/staging/media/vxd/decoder/h264_idx.h  |   60 +
>  .../media/vxd/decoder/h264_secure_parser.c    | 3051 +++++++
>  .../media/vxd/decoder/h264_secure_parser.h    |  278 +
>  drivers/staging/media/vxd/decoder/h264_vlc.h  |  604 ++
>  .../staging/media/vxd/decoder/h264fw_data.h   |  652 ++
>  .../media/vxd/decoder/h264fw_data_shared.h    |  759 ++
>  .../media/vxd/decoder/hevc_secure_parser.c    | 2895 +++++++
>  .../media/vxd/decoder/hevc_secure_parser.h    |  455 +
>  .../staging/media/vxd/decoder/hevcfw_data.h   |  472 ++
>  .../media/vxd/decoder/hevcfw_data_shared.h    |  767 ++
>  .../staging/media/vxd/decoder/hw_control.c    | 1211 +++
>  .../staging/media/vxd/decoder/hw_control.h    |  144 +
>  .../media/vxd/decoder/img_dec_common.h        |  278 +
>  .../media/vxd/decoder/img_msvdx_cmds.h        |  279 +
>  .../media/vxd/decoder/img_msvdx_core_regs.h   |   22 +
>  .../media/vxd/decoder/img_msvdx_vdmc_regs.h   |   26 +
>  .../media/vxd/decoder/img_msvdx_vec_regs.h    |   60 +
>  .../staging/media/vxd/decoder/img_pixfmts.h   |  195 +
>  .../media/vxd/decoder/img_profiles_levels.h   |   33 +
>  .../media/vxd/decoder/img_pvdec_core_regs.h   |   60 +
>  .../media/vxd/decoder/img_pvdec_pixel_regs.h  |   35 +
>  .../media/vxd/decoder/img_pvdec_test_regs.h   |   39 +
>  .../media/vxd/decoder/img_vdec_fw_msg.h       |  192 +
>  .../vxd/decoder/img_video_bus4_mmu_regs.h     |  120 +
>  .../media/vxd/decoder/jpeg_secure_parser.c    |  645 ++
>  .../media/vxd/decoder/jpeg_secure_parser.h    |   37 +
>  .../staging/media/vxd/decoder/jpegfw_data.h   |   83 +
>  .../media/vxd/decoder/jpegfw_data_shared.h    |   84 +
>  drivers/staging/media/vxd/decoder/mem_io.h    |   42 +
>  drivers/staging/media/vxd/decoder/mmu_defs.h  |   42 +
>  drivers/staging/media/vxd/decoder/pixel_api.c |  895 ++
>  drivers/staging/media/vxd/decoder/pixel_api.h |  152 +
>  .../media/vxd/decoder/pvdec_entropy_regs.h    |   33 +
>  drivers/staging/media/vxd/decoder/pvdec_int.h |   82 +
>  .../media/vxd/decoder/pvdec_vec_be_regs.h     |   35 +
>  drivers/staging/media/vxd/decoder/reg_io2.h   |   74 +
>  .../staging/media/vxd/decoder/scaler_setup.h  |   59 +
>  drivers/staging/media/vxd/decoder/swsr.c      | 1657 ++++
>  drivers/staging/media/vxd/decoder/swsr.h      |  278 +
>  .../media/vxd/decoder/translation_api.c       | 1725 ++++
>  .../media/vxd/decoder/translation_api.h       |   42 +
>  drivers/staging/media/vxd/decoder/vdec_defs.h |  548 ++
>  .../media/vxd/decoder/vdec_mmu_wrapper.c      |  829 ++
>  .../media/vxd/decoder/vdec_mmu_wrapper.h      |  174 +
>  .../staging/media/vxd/decoder/vdecdd_defs.h   |  446 +
>  .../staging/media/vxd/decoder/vdecdd_utils.c  |   95 +
>  .../staging/media/vxd/decoder/vdecdd_utils.h  |   93 +
>  .../media/vxd/decoder/vdecdd_utils_buf.c      |  897 ++
>  .../staging/media/vxd/decoder/vdecfw_share.h  |   36 +
>  .../staging/media/vxd/decoder/vdecfw_shared.h |  893 ++
>  drivers/staging/media/vxd/decoder/vxd_core.c  | 1683 ++++
>  drivers/staging/media/vxd/decoder/vxd_dec.c   |  185 +
>  drivers/staging/media/vxd/decoder/vxd_dec.h   |  477 ++
>  drivers/staging/media/vxd/decoder/vxd_ext.h   |   74 +
>  drivers/staging/media/vxd/decoder/vxd_int.c   | 1137 +++
>  drivers/staging/media/vxd/decoder/vxd_int.h   |  128 +
>  .../staging/media/vxd/decoder/vxd_mmu_defs.h  |   30 +
>  drivers/staging/media/vxd/decoder/vxd_props.h |   80 +
>  drivers/staging/media/vxd/decoder/vxd_pvdec.c | 1745 ++++
>  .../media/vxd/decoder/vxd_pvdec_priv.h        |  126 +
>  .../media/vxd/decoder/vxd_pvdec_regs.h        |  779 ++
>  drivers/staging/media/vxd/decoder/vxd_v4l2.c  | 2129 +++++
>  include/uapi/linux/videodev2.h                |    2 +
>  114 files changed, 62369 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/img,d5520-vxd.yaml
>  create mode 100644 arch/arm64/configs/ti_sdk_arm64_release_defconfig
>  create mode 100644 drivers/staging/media/vxd/common/addr_alloc.c
>  create mode 100644 drivers/staging/media/vxd/common/addr_alloc.h
>  create mode 100644 drivers/staging/media/vxd/common/dq.c
>  create mode 100644 drivers/staging/media/vxd/common/dq.h
>  create mode 100644 drivers/staging/media/vxd/common/hash.c
>  create mode 100644 drivers/staging/media/vxd/common/hash.h
>  create mode 100644 drivers/staging/media/vxd/common/idgen_api.c
>  create mode 100644 drivers/staging/media/vxd/common/idgen_api.h
>  create mode 100644 drivers/staging/media/vxd/common/img_errors.h
>  create mode 100644 drivers/staging/media/vxd/common/img_mem.h
>  create mode 100644 drivers/staging/media/vxd/common/img_mem_man.c
>  create mode 100644 drivers/staging/media/vxd/common/img_mem_man.h
>  create mode 100644 drivers/staging/media/vxd/common/img_mem_unified.c
>  create mode 100644 drivers/staging/media/vxd/common/imgmmu.c
>  create mode 100644 drivers/staging/media/vxd/common/imgmmu.h
>  create mode 100644 drivers/staging/media/vxd/common/lst.c
>  create mode 100644 drivers/staging/media/vxd/common/lst.h
>  create mode 100644 drivers/staging/media/vxd/common/pool.c
>  create mode 100644 drivers/staging/media/vxd/common/pool.h
>  create mode 100644 drivers/staging/media/vxd/common/pool_api.c
>  create mode 100644 drivers/staging/media/vxd/common/pool_api.h
>  create mode 100644 drivers/staging/media/vxd/common/ra.c
>  create mode 100644 drivers/staging/media/vxd/common/ra.h
>  create mode 100644 drivers/staging/media/vxd/common/resource.c
>  create mode 100644 drivers/staging/media/vxd/common/resource.h
>  create mode 100644 drivers/staging/media/vxd/common/rman_api.c
>  create mode 100644 drivers/staging/media/vxd/common/rman_api.h
>  create mode 100644 drivers/staging/media/vxd/common/talmmu_api.c
>  create mode 100644 drivers/staging/media/vxd/common/talmmu_api.h
>  create mode 100644 drivers/staging/media/vxd/common/vid_buf.h
>  create mode 100644 drivers/staging/media/vxd/common/work_queue.c
>  create mode 100644 drivers/staging/media/vxd/common/work_queue.h
>  create mode 100644 drivers/staging/media/vxd/decoder/Kconfig
>  create mode 100644 drivers/staging/media/vxd/decoder/Makefile
>  create mode 100644 drivers/staging/media/vxd/decoder/bspp.c
>  create mode 100644 drivers/staging/media/vxd/decoder/bspp.h
>  create mode 100644 drivers/staging/media/vxd/decoder/bspp_int.h
>  create mode 100644 drivers/staging/media/vxd/decoder/core.c
>  create mode 100644 drivers/staging/media/vxd/decoder/core.h
>  create mode 100644 drivers/staging/media/vxd/decoder/dec_resources.c
>  create mode 100644 drivers/staging/media/vxd/decoder/dec_resources.h
>  create mode 100644 drivers/staging/media/vxd/decoder/decoder.c
>  create mode 100644 drivers/staging/media/vxd/decoder/decoder.h
>  create mode 100644 drivers/staging/media/vxd/decoder/fw_interface.h
>  create mode 100644 drivers/staging/media/vxd/decoder/h264_idx.h
>  create mode 100644 drivers/staging/media/vxd/decoder/h264_secure_parser.c
>  create mode 100644 drivers/staging/media/vxd/decoder/h264_secure_parser.h
>  create mode 100644 drivers/staging/media/vxd/decoder/h264_vlc.h
>  create mode 100644 drivers/staging/media/vxd/decoder/h264fw_data.h
>  create mode 100644 drivers/staging/media/vxd/decoder/h264fw_data_shared.h
>  create mode 100644 drivers/staging/media/vxd/decoder/hevc_secure_parser.c
>  create mode 100644 drivers/staging/media/vxd/decoder/hevc_secure_parser.h
>  create mode 100644 drivers/staging/media/vxd/decoder/hevcfw_data.h
>  create mode 100644 drivers/staging/media/vxd/decoder/hevcfw_data_shared.h
>  create mode 100644 drivers/staging/media/vxd/decoder/hw_control.c
>  create mode 100644 drivers/staging/media/vxd/decoder/hw_control.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_dec_common.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_cmds.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_core_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_vdmc_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_msvdx_vec_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_pixfmts.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_profiles_levels.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_core_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_pixel_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_pvdec_test_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_vdec_fw_msg.h
>  create mode 100644 drivers/staging/media/vxd/decoder/img_video_bus4_mmu_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/jpeg_secure_parser.c
>  create mode 100644 drivers/staging/media/vxd/decoder/jpeg_secure_parser.h
>  create mode 100644 drivers/staging/media/vxd/decoder/jpegfw_data.h
>  create mode 100644 drivers/staging/media/vxd/decoder/jpegfw_data_shared.h
>  create mode 100644 drivers/staging/media/vxd/decoder/mem_io.h
>  create mode 100644 drivers/staging/media/vxd/decoder/mmu_defs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/pixel_api.c
>  create mode 100644 drivers/staging/media/vxd/decoder/pixel_api.h
>  create mode 100644 drivers/staging/media/vxd/decoder/pvdec_entropy_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/pvdec_int.h
>  create mode 100644 drivers/staging/media/vxd/decoder/pvdec_vec_be_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/reg_io2.h
>  create mode 100644 drivers/staging/media/vxd/decoder/scaler_setup.h
>  create mode 100644 drivers/staging/media/vxd/decoder/swsr.c
>  create mode 100644 drivers/staging/media/vxd/decoder/swsr.h
>  create mode 100644 drivers/staging/media/vxd/decoder/translation_api.c
>  create mode 100644 drivers/staging/media/vxd/decoder/translation_api.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vdec_defs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.c
>  create mode 100644 drivers/staging/media/vxd/decoder/vdec_mmu_wrapper.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_defs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_utils.c
>  create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_utils.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vdecdd_utils_buf.c
>  create mode 100644 drivers/staging/media/vxd/decoder/vdecfw_share.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vdecfw_shared.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_core.c
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_dec.c
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_dec.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_ext.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_int.c
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_int.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_mmu_defs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_props.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_pvdec.c
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_pvdec_priv.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_pvdec_regs.h
>  create mode 100644 drivers/staging/media/vxd/decoder/vxd_v4l2.c
> 

