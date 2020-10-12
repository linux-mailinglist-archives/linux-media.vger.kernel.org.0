Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0996A28B3FD
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 13:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388197AbgJLLlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 07:41:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:56698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388135AbgJLLlv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 07:41:51 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00B87206E5;
        Mon, 12 Oct 2020 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602502905;
        bh=ZPr/byBLR0ZAy6H5Hos88iYElRJa14v9usSppK113aQ=;
        h=Date:From:To:Cc:Subject:From;
        b=evd9JQG/186jFKgJrTzXQMWFegGgCY6Luz9Xra5qD+kaPXIFMWMTvA5xmR7oLMbYl
         U1I+7OC3eIK2550IXyH2Z7H2BihdTUQxuWv4e+bHpAdwLaf4YO0GKf1HkrcvLMCMLD
         2nRzW7KTHFoykOmLNqlEJaYEAD7+LDkaE+TE1FJI=
Date:   Mon, 12 Oct 2020 13:41:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.10-rc1] media updates
Message-ID: <20201012134139.0d58f5d7@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.10-1

For:
  - The usbvision driver was dropped from staging;
  - The Zoran driver were re-added at staging. It gained lots of
    improvements, and was converted to use videobuf2 API;
  - A new virtual driver (vidtv) was added in order to allow testing the=20
    digital TV framework and APIs;
  - The media uAPI documentation gained a glossary with commonly used terms,
    helping to simplify some parts of the docs;
  - More cleanups at the atomisp driver;
  - Mediatek VPU gained support for MT8183;
  - Added support for codecs with supports doing colorspace conversion (CSC)
  - Support for CSC API was added at vivid and rksip1 drivers;
  - Added a helper core support and uAPI for better supporting H.264 codecs;
  - Added support for Renesas R8A774E1;
  - Use the new SPDX GFDL-1.1-no-invariants-or-later license on media
    uAPI docs, instead of a license text;
  - Venus driver has gained VP9 codec support;
  - Lots of other cleanups and driver improvements.

Thanks!
Mauro

-


The following changes since commit a1b8638ba1320e6684aa98233c15255eb803fac7:

  Linux 5.9-rc7 (2020-09-27 14:38:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.10-1

for you to fetch changes up to c386e0797d26a32e354daf4480c5d40165db66a1:

  media: dvb-frontends/drxk_hard.c: fix uninitialized variable warning (202=
0-10-08 14:15:14 +0200)

----------------------------------------------------------------
media updates for v5.10-rc1

----------------------------------------------------------------
Adam Goode (2):
      media: uvcvideo: Ensure all probed info is returned to v4l2
      media: uvcvideo: Convey full colorspace information to V4L2

Aditya Jain (1):
      media: atomisp: Fix braces placement coding style errors

Aditya Pakki (1):
      media: st-delta: Fix reference count leak in delta_run_work

Alex Bee (1):
      media: dvb_usb_pctv452e: use ISL6423 voltage regulator per default

Alex Dewar (2):
      media: staging: media: atomisp: Don't do unnecessary zeroing of memory
      media: staging: media: atomisp: Fix bool-related style issues

Alexander A. Klimov (2):
      media: omap: Replace HTTP links with HTTPS ones
      media: uvcvideo: Replace HTTP links with HTTPS ones

Alexandre Courbot (17):
      media: mtk-vcodec: fix Kconfig help text
      remoteproc: scp: add COMPILE_TEST dependency
      media: dt-bindings: media: mtk-vcodec: document SCP node
      media: mtk-vcodec: venc: handle firmware version field
      media: mtk-vcodec: venc: specify bitrate range per-chip
      media: mtk-vcodec: venc: specify supported formats per-chip
      media: dt-bindings: media: document mediatek,mt8183-vcodec-enc
      media: Revert "media: mtk-vcodec: Remove extra area allocation in an =
input buffer on encoding"
      media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
      media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
      media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
      media: mtk-vcodec: venc: support ENUM_FRAMESIZES on OUTPUT formats
      media: mtk-vcodec: venc: set default time per frame
      media: mtk-vcodec: venc: fix invalid time per frame in S_PARM
      media: mtk-vcodec: make IRQs disabled upon request
      media: v4l2-mem2mem: always consider OUTPUT queue during poll
      media: v4l2-mem2mem: simplify poll logic

Allen Pais (11):
      media: bt8xx: convert tasklets to use new tasklet_setup() API
      media: mantis: convert tasklets to use new tasklet_setup() API
      media: ngene: convert tasklets to use new tasklet_setup() API
      media: smipcie: convert tasklets to use new tasklet_setup() API
      media: ttpci: convert tasklets to use new tasklet_setup() API
      media: tw5864: convert tasklets to use new tasklet_setup() API
      media: marvell-ccic: convert tasklets to use new tasklet_setup() API
      media: pxa_camera: convert tasklets to use new tasklet_setup() API
      media: sti: convert tasklets to use new tasklet_setup() API
      media: media/radio: wl128x: convert tasklets to use new tasklet_setup=
() API
      media: ttusb-dec: convert tasklets to use new tasklet_setup() API

Anant Thazhemadam (1):
      media: atomisp: fix "dubious: !x | !y" sparse warning

Andrey Konovalov (3):
      media: camss: Make use of V4L2_CAP_IO_MC
      media: camss: add support for vidioc_enum_framesizes ioctl
      media: camss: __video_try_fmt(): don't use hardcoded constants

Andy Shevchenko (10):
      media: ipu3-cio2: Simplify cleanup code
      media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES constant
      media: ipu2-cio2: Replace custom definition with PAGE_SIZE
      media: ipu3-cio2: Use macros from pfn.h
      media: ipu3-cio2: Replace infinite loop by one with clear exit condit=
ion
      media: ipu3-cio2: Use readl_poll_timeout() helper
      media: ipu3-cio2: Get rid of pci_set_master() duplication
      media: ipu3-cio2: Drop bogus check and error message
      media: ipu3-cio2: Drop useless assignments
      media: ipu3-cio2: Update Copyright year and fix indentation issues

Ankit Baluni (2):
      media: atomisp: fixed a brace coding sytle issue
      media: atomisp: fix a brace coding sytle issue

Bingbu Cao (3):
      media: i2c: ov2740: get OTP data ready before nvmem registration
      media: MAINTAINERS: Fix email typo and correct name of Tianshu
      media: ov5675: correct the maximum exposure value

Cengiz Can (2):
      media: atomisp: move null check to earlier point
      media: staging: atomisp: Remove unnecessary 'fallthrough'

Christophe JAILLET (1):
      media: staging/intel-ipu3: css: Correctly reset some memory

Christopher Snowhill (1):
      media: Implements support for the MyGica iGrabber

Colin Ian King (2):
      media: i2c: fix error check on max9286_read call
      media: atomisp: fix spelling mistake "unsupport" -> "unsupported"

Corentin Labbe (48):
      media: MAINTAINERS: media: cec: fix files location
      media: staging: media: Revert "media: zoran: remove deprecated driver"
      media: MAINTAINERS: change maintainer of the zoran driver
      media: zoran: datasheet is no longer available from zoran.com
      media: zoran: Documentation: fix typo
      media: zoran: fix checkpatch issue
      media: zoran: do not forward declare zr36057_init_vfe
      media: zoran: convert all error dprintk to pci_err/pr_err
      media: zoran: convert dprintk warn
      media: zoran: convert dprintk info to pci_info
      media: zoran: convert dprintk debug
      media: zoran: zoran_device.c: convert pr_x to pci_x
      media: zoran: remove proc_fs
      media: zoran: use VFL_TYPE_VIDEO
      media: zoran: use v4l2_buffer_set_timestamp
      media: zoran: do not print random guest 0
      media: zoran: move buffer_size out of zoran_fh
      media: zoran: move v4l_settings out of zoran_fh
      media: zoran: move jpg_settings out of zoran_fh
      media: zoran: move overlay_settings out of zoran_fh
      media: zoran: Use video_drvdata to get struct zoran
      media: zoran: Change zoran_v4l_set_format parameter from zoran_fh to =
zoran
      media: zoran: remove overlay
      media: zoran: Use DMA coherent for stat_com
      media: zoran: use ZR_NORM
      media: zoran: zoran does not support STD_ALL
      media: zoran: convert irq to pci irq
      media: zoran: convert zoran alloc to devm
      media: zoran: convert mdelay to udelay
      media: zoran: use devm for videocodec_master alloc
      media: zoran: use pci_request_regions
      media: zoran: use devm_ioremap
      media: zoran: add stat_com buffer
      media: zoran: constify struct tvnorm
      media: zoran: constify codec_name
      media: zoran: Add more check for compliance
      media: zoran: Add vb_queue
      media: zoran: disable output
      media: zoran: device support only 32bit DMA address
      media: zoran: enable makefile
      media: zoran: remove framebuffer support
      media: zoran: add vidioc_g_parm
      media: zoran: remove test_interrupts
      media: zoran: fix use of buffer_size and sizeimage
      media: zoran: fix some compliance test
      media: zoran: remove deprecated .vidioc_g_jpegcomp
      media: zoran: convert to vb2
      media: zoran: update TODO

Dafna Hirschfeld (47):
      media: staging: rkisp1: replace 9 coeff* fields with a 3x3 array
      media: staging: rkisp1: replace 3 fields 'ct_offset_*' with one array
      media: staging: rkisp1: rename RKISP1_CIF_ISP_STAT_AFM_FIN to RKISP1_=
CIF_ISP_STAT_AFM
      media: staging: rkisp1: improve documentation in file rkisp1-config.h
      media: staging: rkisp1: don't define vaddr field in rkisp1_buffer as =
an array
      media: staging: rkisp1: unify (un)register functions to have the same=
 parameters
      media: staging: rkisp1: remove declaration of unimplemented function =
'rkisp1_params_isr_handler'
      media: staging: rkisp1: group declaration of similar functions togeth=
er
      media: staging: rkisp1: improve documentation of rkisp1-common.h
      media: Documentation: v4l: move table of v4l2_pix_format(_mplane) fla=
gs to pixfmt-v4l2.rst
      media: staging: rkisp1: set "*_data_tbl" fields in rkisp1_cif_isp_lsc=
_config as 2D arrays
      media: staging: rkisp1: replace two identical macros with one
      media: staging: rkisp1: change type of fields in 'rkisp1_cif_isp_lsc_=
config' from u32 to u16
      media: staging: rkisp1: call params isr only upon frame out
      media: staging: rkisp1: params: use rkisp1_param_set_bits to set reg =
in isr
      media: staging: rkisp1: params: don't release lock in isr before buff=
er is done
      media: v4l2: add support for colorspace conversion API (CSC) for vide=
o capture
      media: vivid: Add support to the CSC API
      media: v4l2: extend the CSC API to subdevice.
      media: staging: rkisp1: allow quantization setting by userspace on th=
e isp source pad
      media: staging: rkisp1: rsz: set flags to 0 in enum_mbus_code cb
      media: mtk-mdp: Fix Null pointer dereference when calling list_add
      media: staging: rkisp1: cap: change RGB24 format to XBGR32
      media: staging: rkisp1: cap: remove unsupported formats
      media: staging: rkisp1: cap: remove unsupported format YUV444
      media: staging: rkisp1: don't support bayer format on selfpath resizer
      media: staging: rkisp1: add capability V4L2_CAP_IO_MC to capture devi=
ces
      media: staging: rkisp1: add a helper function to enumerate supported =
mbus formats on capture
      media: staging: rkisp1: rsz: enumerate the formats on the src pad acc=
ording to the capture
      media: staging: rkisp1: rsz: Add support to more YUV encoded mbus cod=
es on src pad
      media: staging: rkisp1: cap: simplify link validation by comparing me=
dia bus code
      media: staging: rkisp1: fix configuration for GREY pixelformat
      media: pixfmt-meta-rkisp1.rst: add description of rkisp1 metadata for=
mats in pixfmt-meta-rkisp1.rst
      media: admin-guide: add documentation file rkisp1.rst
      media: MAINTAINERS: add documentation files for rkisp1
      media: staging: rkisp1: params: upon stream stop, iterate a local lis=
t to return the buffers
      media: staging: rkisp1: params: in the isr, return if buffer list is =
empty
      media: staging: rkisp1: params: use the new effect value in cproc con=
fig
      media: staging: rkisp1: params: avoid using buffer if params is not s=
treaming
      media: staging: rkisp1: params: set vb.sequence to be the isp's frame=
_sequence + 1
      media: staging: rkisp1: remove atomic operations for frame sequence
      media: staging: rkisp1: isp: add a warning and debugfs var for irq de=
lay
      media: staging: rkisp1: isp: don't enable signal RKISP1_CIF_ISP_FRAME=
_IN
      media: staging: rkisp1: stats: protect write to 'is_streaming' in sta=
rt_streaming cb
      media: staging: rkisp1: params: no need to lock default config
      media: staging: rkisp1: use the right variants of spin_lock
      media: staging: rkisp1: cap: protect access to buf with the spin lock

Daniel W. S. Almeida (21):
      media: sunxi: sun8i-rotate.c: remove useless error message
      media: cobalt: cobalt-omnitek.c: fix comparison to bool
      media: mtk-vcodec: mtk_vcodec_dec.c: fix comparison to bool
      media: vicodec: vicodec-core.c: fix assignment of 0/1 to bool variable
      media: pci: saa7164.c: Replace if(cond) BUG with BUG_ON
      media: pci: saa7164-dvb.c: replace if(cond) BUG() with BUG_ON()
      media: pci: saa7164-vbi.c: replace if (cond) BUG() with BUG_ON()
      media: pci: saa7164-core.c: replace if (cond) BUG() with BUG_ON()
      media: usb: dib0700_devices.c: remove useless if/else
      media: dvb-frontends: mb86a16.c: remove useless if/else
      media: pci: cx23855-video.c: remove duplicate argument in 'or'
      media: i2c: imx219.c: fix assignment of 0/1 to bool variable
      media: i2c: tda1997x.c: Fix assignment of 0/1 to bool variable
      media: pci: cobalt-i2c.c: fix comparison of 0/1 to bool variable
      media: mtk-vcodec: vdec_vp9_if.c: fix comparison to bool
      media: uvcvideo: Fix dereference of out-of-bound list iterator
      media: vidtv: implement a tuner driver
      media: vidtv: implement a demodulator driver
      media: vidtv: add a bridge driver
      media: Documentation: vidtv: Add ReST documentation for vidtv
      media: vidtv: fix build on 32bit architectures

Dinghao Liu (9):
      media: venus: core: Fix runtime PM imbalance in venus_probe
      media: atomisp: fix memleak in ia_css_stream_create
      media: omap3isp: Fix memleak in isp_probe
      media: mx2_emmaprp: Fix memleak in emmaprp_probe
      media: bdisp: Fix runtime PM imbalance on error
      media: platform: sti: hva: Fix runtime PM imbalance on error
      media: platform: s3c-camif: Fix runtime PM imbalance on error
      media: coda: Fix runtime PM imbalance in coda_probe
      media: vsp1: Fix runtime PM imbalance on error

Dmitry Buzdyk (1):
      media: uvcvideo: Add mapping for HEVC payloads

Evgeny Novikov (1):
      media: dvb-frontends: rtl2832_sdr: set error code in probe

Ezequiel Garcia (18):
      media: hantro: h264: Get the correct fallback reference buffer
      media: hantro: postproc: Fix motion vector space allocation
      media: uapi: h264: Further clarify scaling lists order
      media: uapi: h264: Split prediction weight parameters
      media: uapi: h264: Increase size of 'first_mb_in_slice' field
      media: uapi: h264: Clean DPB entry interface
      media: uapi: h264: Increase size of DPB entry pic_num
      media: uapi: h264: Drop SLICE_PARAMS 'size' field
      media: uapi: h264: Clarify SLICE_BASED mode
      media: uapi: h264: Clean slice invariants syntax elements
      media: uapi: h264: Rename and clarify PPS_FLAG_SCALING_MATRIX_PRESENT
      media: hantro: Don't require unneeded H264_SLICE_PARAMS
      media: rkvdec: Don't require unneeded H264_SLICE_PARAMS
      media: rkvdec: Drop unneeded per_request driver-specific control flag
      media: rkvdec: Use H264_SCALING_MATRIX only when required
      media: hantro: Use H264_SCALING_MATRIX only when required
      media: cedrus: Use H264_SCALING_MATRIX only when required
      media: v4l2-mem2mem: Fix spurious v4l2_m2m_buf_done

Fabio Estevam (1):
      media: fsl-viu: Do not redefine out_be32()/in_be32() for CONFIG_M68K

Felix Winkler (1):
      media: ipu3-imgu: Fixed some coding style issues in ipu3-css.c

Frederic Chen (1):
      media: mc-device.c: change media_device_request_alloc to match media_=
ioctl_info

Greg Kroah-Hartman (7):
      media: cec: no need to check return value of debugfs_create functions
      media: coda: no need to check return value of debugfs_create functions
      media: exynos4-is: no need to check return value of debugfs_create fu=
nctions
      media: mtk-vpu: no need to check return value of debugfs_create funct=
ions
      media: sti: no need to check return value of debugfs_create functions
      media: radio: si476x: no need to check return value of debugfs_create=
 functions
      media: usb: uvc: no need to check return value of debugfs_create func=
tions

Gustavo A. R. Silva (1):
      media: Use fallthrough pseudo-keyword

Hans Verkuil (21):
      media: dev-sliced-vbi.rst: fix wrong type
      media: videodev2.h: RGB BT2020 and HSV are always full range
      media: videobuf2-v4l2.c: add vb2_video_unregister_device helper funct=
ion
      media: qcom/camss: use vb2_video_unregister_device()
      media: media/pci: use vb2_video_unregister_device()
      media: media/platform: drop vb2_queue_release()
      media: media/usb: use vb2_video_unregister_device()
      media: media/test-drivers: use vb2_video_unregister_device()
      media: staging/media: drop vb2_queue_release()
      media: imx274: fix frame interval handling
      media: vivid: fix compile warning/error
      media: usbvision: remove deprecated driver
      media: media/test-drivers/Kconfig: fix broken Kconfig
      media: atomisp/pci/atomisp_ioctl.c: strlcpy -> strscpy
      media: cec-core.c: stop kthread_config before kthread
      media: cec-adap.c: add 'unregistered' checks
      media: zoran: fix smatch warning
      media: zoran: fix sparse warnings
      media: s5k5baf: drop 'data' field in struct s5k5baf_fw
      media: tvp7002: fix uninitialized variable warning
      media: dvb-frontends/drxk_hard.c: fix uninitialized variable warning

Hans de Goede (2):
      media: uvcvideo: Fix uvc_ctrl_fixup_xu_info() not having any effect
      media: uvcvideo: Cleanup uvc_ctrl_add_info() error handling

Helen Koike (2):
      media: MAINTAINERS: add Dafna Hirschfeld for rkisp1
      media: staging: rkisp1: uapi: remove __packed

Hsin-Yi Wang (1):
      media: mtk-vcodec: set dma max segment size

Ismael Luceno (1):
      media: MAINTAINERS: Remove broken bluecherry.net email

Jacopo Mondi (14):
      media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
      media: i2c: Use the new get_mbus_config pad op
      media: i2c: ov6650: Use new [get|set]_mbus_config ops
      media: pxa_camera: Use the new set_mbus_config op
      media: v4l2-subdev: Remove [s|g]_mbus_config video ops
      media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
      media: staging: media: imx: Update TODO entry
      media: i2c: adv748x: Adjust TXA data lanes number
      media: i2c: adv748x: Implement get_mbus_config
      media: rcar-csi2: Negotiate data lanes number
      media: dt-bindings: media: ov5647: Convert to json-schema
      media: dt-bindings: media: ov5647: Document pwdn-gpios
      media: dt-bindings: media: ov5647: Document clock-noncontinuous
      media: MAINTAINERS: ov5647: Replace maintainer

Jason Yan (1):
      media: mxl5xx: remove unused including <linux/version.h>

Jernej Skrabec (3):
      media: uapi: h264: Update reference lists
      media: cedrus: h264: Properly configure reference field
      media: cedrus: h264: Fix frame list construction

Joakim Zhang (2):
      media: rc: gpio-ir-recv: add QoS support for cpuidle system
      media: bindings: media: gpio-ir-receiver: add linux,autosuspend-perio=
d property

Joe Perches (1):
      media: atomisp: Avoid comma separated statements

Jonathan Bakker (10):
      media: exynos4-is: Remove static driver data for S5PV210 FIMC variants
      media: exynos4-is: Fix nullptr when no CSIS device present
      media: exynos4-is: Correct missing entity function initialization
      media: exynos4-is: Properly set JPEG options for parallel ports
      media: exynos4-is: Use global num_sensors rather than local index
      media: exynos4-is: Add support for multiple sensors on one port
      media: exynos4-is: Remove inh_sensor_ctrls
      media: exynos4-is: Remove unused struct member input_index
      media: exynos4-is: Handle duplicate calls to vidioc_streamoff
      media: dt-bindings: media: Correct samsung-fimc parallel port numberi=
ng

Jordan Hand (1):
      media: ipu3.rst: Format media-ctl and yavta commands as code blocks

Juan Antonio Aldea-Armenteros (1):
      media: atomisp: mt9m114: replace fixed function names

Julia Lawall (4):
      media: cx231xx: drop unnecessary list_empty
      saa7134: drop unnecessary list_empty
      tm6000: drop unnecessary list_empty
      media: saa7146: drop double zeroing

Jun Chen (1):
      media: uvcvideo: Fix annotation for uvc_video_clock_update()

Kieran Bingham (1):
      media: MAINTAINERS: Fix sort order for RDACM20

Lad Prabhakar (16):
      media: i2c: ov5640: Remain in power down for DVP mode unless streaming
      media: i2c: ov5640: Separate out mipi configuration from s_power
      media: i2c: ov5640: Enable data pins on poweron for DVP mode
      media: i2c: ov5640: Configure HVP lines in s_power callback
      media: i2c: ov5640: Add support for BT656 mode
      media: i2c: ov5640: Fail probe on unsupported bus_type
      media: dt-bindings: media: renesas,vin: Add device tree support for r=
8a7742
      media: rcar-fcp: Update description for VIDEO_RENESAS_FCP Kconfig ent=
ry
      media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_CSI2=
 config
      media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_VIN =
config
      media: dt-bindings: media: renesas,csi2: Add R8A774E1 support
      media: dt-bindings: media: renesas,vin: Add R8A774E1 support
      media: rcar-csi2: Enable support for R8A774E1
      media: rcar-vin: Enable support for R8A774E1
      media: rcar-vin: Enable YDS bit depending on bus_width and data_shift
      media: rcar-vin: rcar-dma: Fix setting VNIS_REG for RAW8 formats

Laurent Pinchart (7):
      media: uvcvideo: Set media controller entity functions
      media: uvcvideo: Silence shift-out-of-bounds warning
      media: v4l2-async: Document asd allocation requirements
      media: rcar_drif: Fix fwnode reference leak when parsing DT
      media: rcar_drif: Allocate v4l2_async_subdev dynamically
      media: rcar-csi2: Allocate v4l2_async_subdev dynamically
      media: i2c: max9286: Allocate v4l2_async_subdev dynamically

Loic Poulain (1):
      media: venus: Fix reported frame intervals

Lubomir Rintel (4):
      media: cafe-driver: use drvdata instead of back-casting from v4l2_dev=
ice
      media: marvell-ccic: mmp: get rid of mmpcam_devices list
      media: marvell-ccic: mmp: use generic dev_pm_ops
      media: marvell-ccic: add support for runtime PM

Luca Ceresoli (4):
      media: docs: v4l2-subdev: fix typo
      media: docs: v4l2-subdev: fix typo
      media: docs: v4l2-subdev: move "Subdev registration" to a subsection
      media: docs: v4l2-subdev: move calling ops to a subsection

Maheshwar Ajja (1):
      media: v4l2-ctrls: Add encoder constant quality control

Marek Szyprowski (3):
      media: pci: fix common ALSA DMA-mapping related codes
      media: videobuf2: use sgtable-based scatterlist wrappers
      media: platform: s5p-mfc: Fix adding a standard frame skip mode contr=
ol

Mauro Carvalho Chehab (106):
      media: docs: use the new SPDX header for GFDL-1.1 on *.rst files
      media: docs: use the new SPDX header for GFDL-1.1 on *.svg files
      media: docs: use SPDX GPL-2.0 OR GFDL-1.1 instead of text on *.rst fi=
les
      media: docs: use SPDX GPL-2.0 OR GFDL-1.1 instead of text on *.svg fi=
les
      media: open.rst: better document device node naming
      media: open.rst: remove the minor number range
      media: docs: add glossary.rst with common terms used at V4L2 spec
      media: open.rst: document mc-centric and video-node-centric
      media: atomisp: fix identation at I2C Kconfig menu
      media: tda10086: cleanup symbol_rate setting logic
      media: qt1010: fix usage of unititialized value
      media: av7110_v4l: avoid a typecast
      media: wl128x: get rid of a potential spectre issue
      media: venus: place extern venus_fw_debug on a header file
      media: tda10021: avoid casts when using symbol_rate
      media: serial_ir: use the right type for a dma address
      media: videobuf-dma-sg: number of pages should be unsigned long
      media: cx25821-alsa: number of pages should be unsigned long
      media: cx23885-alsa: number of pages should be unsigned long
      media: cx88-alsa: number of pages should be unsigned long
      media: saa7134-alsa.c: number of pages should be unsigned long
      media: dvb-ttusb-budget: don't use stack for USB transfers
      media: dvb-ttusb-budget: cleanup printk logic
      media: saa7134: avoid a shift overflow
      media: atomisp: fix casts at atomisp_compat_ioctl32.c
      media: atomisp: atomisp_gmin_platform: check before use
      media: atomisp: csi_rx.c: add missing includes
      media: atomisp: get rid of some unused code
      media: atomisp: cleanup ifdefs from ia_css_debug.c
      media: atomisp: get rid of version-dependent globals
      media: atomisp: get rid of isys_dma.h and isys_dma_local.h
      media: atomisp: get rid of ibuf_ctrl abstraction
      media: atomisp: don't check for ISP version for includes
      media: atomisp: unify INPUT error return type
      media: atomisp: de-duplicate names at *_input_system_global.h
      media: atomisp: reorder functions at pixelgen_private.h
      media: atomisp: remove compile-time tests from input_system_global.h
      media: atomisp: fix some bad indents
      media: atomisp: cleanup isys_irq headers
      media: vivid: move the detection part out of vivid_create_instance
      media: vivid: place the logic which disables ioctl on a separate func=
tion
      media: vivid: move set_capabilities logic to a separate function
      media: vivid: place dt timings init code on a separate function
      media: vivid: move the create queues to a separate function
      media: vivid: move the devnode creation logic to a separate function
      media: vivid: fix error path
      media: atomisp: get rid of some cleanup leftovers
      media: atomisp: print a warning if error while setting downscaler
      media: atomisp: get rid of unused vars
      media: atomisp: move a static constant out of a header file
      media: atomisp: get rid of -Wsuggest-attribute=3Dformat warnings
      Merge tag 'v5.9-rc4' into patchwork
      media: av7110: don't do float point math
      media: vidtv: fix driver unbind/remove
      media: vidtv: add modaliases for the bridge driver
      media: vidtv: prefer using dev_foo() instead of pr_foo()
      media: vidtv: fix 32-bit warnings
      media: vidtv: get rid of some endiannes nonsense
      media: vidtv: get rid of ENDIAN_BITFIELD nonsense
      media: vidtv: fix frequency tuning logic
      media: vidtv: add an initial channel frequency
      media: vidtv: remove a wrong endiannes check from s302m generator
      media: vidtv: properly initialize the internal state struct
      media: vidtv: add basic support for DVBv5 stats
      media: vidtv: get rid of the work queue
      media: vidtv: increment byte and block counters
      media: vidtv: adjust signal strength range
      media: vidtv: don't initialize cnr2qual var
      media: vidtv: add DiSEqC dummy ops
      media: vidtv: fix DVB-S/S2 tuning logic
      media: vidtv.rst: update it to better describe the frequencies
      media: vidtv: add a poor guy's simulation to preBER stats
      media: vidtv: get rid of its own sinusoidal waveform
      media: vidtv: Add a music instead of playing a single tone
      media: vidtv: cleanup the logic which estimates buffer size
      media: vidtv: remove an impossible condition
      media: atomisp: fix gcc warnings
      media: atomisp: cleanup __printf() atributes on printk messages
      media: camera-sensor.rst: fix a doc build warning
      media: glossary.rst: use the right case for glossary entries
      media: docs: ipu3.rst: rely at automarkup extension
      media: dvb-frontends: remove a clone of a kernel-doc markup at zd1301=
_demod.h
      media: v4l2-subdev.rst: get rid of a duplicatd kernel-doc markup
      media: cec-core.rst: fix warnings with Sphinx 3.0+
      media: v4l2-subdev.h: fix a kernel-doc markup
      media: hist-v4l2.rst: remove struct duplication
      media: hist-v4l2.rst: remove :c:`type` from structs and enums
      media: vidtv: simplify PCR logic to get jiffies
      media: vidtv: remove more ENDIAN_BITFIELD nonsense
      media: vidtv: fix initialization of the network_id field at SDT
      media: vidtv: cleanup PSI version numbers
      media: vidtv: cleanup SDT string identifiers
      media: vidtv: fix a typo
      media: vidtv: simplify parameters for vidtv_pes_write_stuffing()
      media: vidtv: rewrite the adaption field logic
      media: vidtv: fix decoding with gstreamer and Vlc
      media: zoran: use upper case for card types
      media: zoran: get rid of an unused var
      media: zoran: fix mixed case on vars
      media: atomisp: fixes build breakage for ISP2400 due to a cleanup
      media: zoran: move documentation file to the right place
      media: siano: rename a duplicated card string
      media: admin-guide: update cardlists
      media: add Zoran cardlist
      Merge tag 'v5.9-rc7' into patchwork
      media: zoran.rst: place it at the right place this time

Neil Armstrong (1):
      media: MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic VD=
EC

Nicolas Dufresne (1):
      media: cedrus: Propagate OUTPUT resolution to CAPTURE

Niklas S=C3=B6derlund (5):
      media: rcar-vin: Unconditionally unregister notifier on remove
      media: rcar-vin: Register media device when all sub-devices bound
      media: rcar-csi2: Extend RAW8 support to all RGB layouts
      media: rcar-vin: Extend RAW8 support to all RGB layouts
      media: staging: rkisp1: uapi: Do not use BIT() macro

Oliver Neukum (3):
      media: ati_remote: sanity check for both endpoints
      media: flexcop-usb: sanity checking of endpoint type
      media: usbtv: Fix refcounting mixup

Paul Kocialkowski (1):
      media: ov5640: Correct Bit Div register in clock tree diagram

Pavel Machek (1):
      media: firewire: fix memory leak

Peilin Ye (2):
      media: vivid: Fix global-out-of-bounds read in precalculate_color()
      media: v4l2-tpg: Clamp hue in tpg_s_hue()

Philipp Zabel (1):
      media: uapi: h264: Clarify pic_order_cnt_bit_size field

Pi-Hsun Shih (1):
      media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume

Qinglang Miao (1):
      media: flexcop-usb: remove needless check before usb_free_coherent()

Qiushi Wu (12):
      media: rcar-vin: Fix a reference count leak.
      media: rcar-vin: Fix a reference count leak.
      media: rockchip/rga: Fix a reference count leak.
      media: platform: fcp: Fix a reference count leak.
      media: camss: Fix a reference count leak.
      media: s5p-mfc: Fix a reference count leak
      media: stm32-dcmi: Fix a reference count leak
      media: ti-vpe: Fix a missing check and reference count leak
      media: exynos4-is: Fix a reference count leak
      media: exynos4-is: Fix a reference count leak due to pm_runtime_get_s=
ync
      media: exynos4-is: Fix several reference count leaks due to pm_runtim=
e_get_sync
      media: sti: Fix reference count leaks

Raag Jadav (1):
      media: ov7740: use SCCB regmap

Rahul Gottipati (3):
      media: intel-ipu3: Fix code style issue
      media: atomisp: coding style: remove beginning whitespaces
      media: atomisp: coding style: correct multiline comments

Rajendra Nayak (3):
      media: venus: core: Fix error handling in probe
      media: venus: core: Add support for opp tables/perf voting
      media: dt-bindings: media: venus: Add an optional power domain for pe=
rf voting

Rikard Falkeborn (1):
      media: dvb-frontends: tda18271c2dd: Constify static structs

Robert Foss (2):
      media: ov8856: Add support for 1632x1224 mode
      media: ov8856: Add support for 3264x2448 mode

Robin Murphy (2):
      media: rcar-fcp: Drop local dma_parms
      media: venus: core: Drop local dma_parms

Rohit K Bharadwaj (1):
      media: atomisp: fix code style issues

Sakari Ailus (6):
      media: Documentation: media: Document how to write camera sensor driv=
ers
      media: i2c: Remove Alan Chiang's e-mail address
      media: v4l2-fwnode: Use debug level for printing link frequencies
      media: v4l2-fwnode: Make number of data lanes a character
      media: v4l2-fwnode: Make bus configuration a struct
      media: v4l2-fwnode: Document new usage patterns of v4l2_fwnode_endpoi=
nt_parse

Sean Young (3):
      media: rc: rename lirc char dev region to "lirc"
      media: rc: harmonize infrared durations to microseconds
      media: rc: rename ir_lirc_* functions to lirc_*

Sowjanya Komatineni (11):
      media: tegra-video: Fix channel format alignment
      media: tegra-video: Enable TPG based on kernel config
      media: tegra-video: Update format lookup to offset based
      media: dt-bindings: tegra: Update VI and CSI bindings with port info
      media: tegra-video: Separate CSI stream enable and disable implementa=
tions
      media: tegra-video: Add support for external sensor capture
      media: tegra-video: Add support for selection ioctl ops
      media: gpu: host1x: mipi: Keep MIPI clock enabled and mutex locked ti=
ll calibration done
      media: tegra-video: Add CSI MIPI pads calibration
      media: tegra-video: Compute settle times based on the clock rate
      media: tegra-video: Fix compilation warning of unused variable

Stanimir Varbanov (18):
      media: venus: parser: Prepare parser for multiple invocations
      media: venus: Rework recovery mechanism
      media: venus: Add new interface queues reinit
      media: venus: venc: Add support for constant quality control
      media: v4l2-ctrl: Add frame-skip std encoder control
      media: venus: venc: Add support for frame-skip mode v4l2 control
      media: s5p-mfc: Use standard frame skip mode control
      media: docs: Deprecate mfc frame skip control
      media: venus: Add debugfs interface to set firmware log level
      media: venus: Make debug infrastructure more flexible
      media: v4l2-ctrl: Add VP9 codec levels
      media: venus: hfi_helper: Add VP9 profile and levels
      media: venus: helpers: Add a helper to map v4l2 ids to HFI ids
      media: venus: vdec: Set/Get VP9 profile/level
      media: venus: vdec: Use helper to get profile and level
      media: venus: venc: Use helper to set profile and level
      media: firmware: qcom_scm: Add memory protect virtual address ranges
      media: venus: firmware: Set virtual address ranges

Suraj Upadhyay (1):
      media: atomisp: Replace deprecated MSI APIs

Sylwester Nawrocki (2):
      media: Revert "media: exynos4-is: Add missed check for pinctrl_lookup=
_state()"
      media: exynos4-is: Simplify the pinctrl code

Tom Rix (5):
      media: tuner-simple: fix regression in simple_set_radio_freq
      media: tw5864: check status of tw5864_frameinterval_get
      media: m5mols: Check function pointer in m5mols_sensor_power
      media: tc358743: initialize variable
      media: tc358743: cleanup tc358743_cec_isr

Tomasz Figa (4):
      media: MAINTAINERS: Make Tomasz the main maintainer of videobuf2
      media: MAINTAINERS: Remove Kyungmin from the maintainers list of vide=
obuf2
      media: MAINTAINERS: Remove Pawel from the maintainers list of videobu=
f2
      media: exynos4-is: Request syscon only if ISP writeback is present

Tong Zhang (1):
      media: pvrusb2: fix parsing error

Vaibhav Gupta (2):
      media: saa7134: use generic power management
      media: netup_unidvb: drop initialization of PM pointers

Vikash Garodia (1):
      media: venus: fixes for list corruption

Wei Yongjun (1):
      media: marvell-ccic: mmp: mark PM functions as __maybe_unused

Xia Jiang (27):
      media: platform: Improve subscribe event flow for bug fixing
      media: platform: Improve queue set up flow for bug fixing
      media: platform: Improve getting and requesting irq flow for bug fixi=
ng
      media: platform: Change the fixed device node number to unfixed value
      media: platform: Improve power on and power off flow
      media: platform: Delete the resetting hardware flow in the system PM =
ops
      media: platform: Improve the implementation of the system PM ops
      media: platform: Add mechanism to handle jpeg hardware's locking up
      media: platform: Cancel the last frame handling flow
      media: platform: Delete zeroing the reserved fields
      media: platform: Stylistic changes for improving code quality
      media: platform: Use generic rounding helpers
      media: platform: Change MTK_JPEG_COMP_MAX macro definition location
      media: platform: Delete redundant code and add annotation for an enum
      media: platform: Delete vidioc_s_selection ioctl of jpeg dec
      media: platform: Change the maximum width and height supported by JPE=
G dec
      media: platform: Refactor mtk_jpeg_try_fmt_mplane()
      media: platform: Refactor mtk_jpeg_find_format()
      media: platform: Redefinition of mtk_jpeg_q_data structure
      media: platform: Change the colorspace of jpeg to the fixed value
      media: platform: Refactor mtk_jpeg_set_default_params()
      media: platform: Change the call functions of getting/enable/disable =
the jpeg's clock
      media: dt-bindings: Add jpeg enc device tree node document
      media: platform: Rename jpeg dec file name
      media: platform: Rename existing functions/defines/variables
      media: platform: Using the variant structure to contain the varabilit=
y between dec and enc
      media: platform: Add jpeg enc feature

Xiaoliang Pang (1):
      media: atomisp:pci/runtime/queue: modify the return error value

Xiaolong Huang (1):
      media: media/pci: prevent memory leak in bttv_probe

YueHaibing (1):
      media: staging: tegra-vde: Mark tegra_vde_runtime_suspend/resume as _=
_maybe_unused

Yunfei Dong (4):
      media: mtk-vcodec: abstract firmware interface
      media: mtk-vcodec: add SCP firmware ops
      media: mtk-vcodec: venc: support SCP firmware
      media: mtk-vcodec: add support for MT8183 encoder

 .../admin-guide/media/dvb-usb-dvbsky-cardlist.rst  |    8 +-
 .../admin-guide/media/dvb-usb-dw2102-cardlist.rst  |    4 +
 .../admin-guide/media/em28xx-cardlist.rst          |    4 +
 Documentation/admin-guide/media/ipu3.rst           |  142 +-
 Documentation/admin-guide/media/pci-cardlist.rst   |    2 +
 Documentation/admin-guide/media/rkisp1.dot         |   18 +
 Documentation/admin-guide/media/rkisp1.rst         |  181 ++
 Documentation/admin-guide/media/siano-cardlist.rst |    2 +-
 Documentation/admin-guide/media/usb-cardlist.rst   |    1 -
 .../admin-guide/media/usbvision-cardlist.rst       |  283 ---
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 Documentation/admin-guide/media/zoran-cardlist.rst |   51 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |   92 +-
 .../devicetree/bindings/media/gpio-ir-receiver.txt |    3 +
 .../devicetree/bindings/media/i2c/ov5647.txt       |   35 -
 .../devicetree/bindings/media/i2c/ov5647.yaml      |   88 +
 .../bindings/media/mediatek-jpeg-encoder.txt       |   35 +
 .../devicetree/bindings/media/mediatek-vcodec.txt  |    9 +-
 .../bindings/media/qcom,sc7180-venus.yaml          |    6 +-
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |    6 +-
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 .../devicetree/bindings/media/renesas,vin.yaml     |    2 +
 .../devicetree/bindings/media/samsung-fimc.txt     |    6 +-
 Documentation/driver-api/media/camera-sensor.rst   |  134 ++
 Documentation/driver-api/media/cec-core.rst        |   62 +-
 Documentation/driver-api/media/csi2.rst            |    2 +
 Documentation/driver-api/media/drivers/index.rst   |    2 +
 Documentation/driver-api/media/drivers/vidtv.rst   |  425 ++++
 Documentation/driver-api/media/drivers/zoran.rst   |  575 +++++
 Documentation/driver-api/media/index.rst           |    1 +
 Documentation/driver-api/media/v4l2-subdev.rst     |   97 +-
 Documentation/userspace-api/media/cec/cec-api.rst  |   10 +-
 .../userspace-api/media/cec/cec-func-close.rst     |    9 +-
 .../userspace-api/media/cec/cec-func-ioctl.rst     |    9 +-
 .../userspace-api/media/cec/cec-func-open.rst      |    9 +-
 .../userspace-api/media/cec/cec-func-poll.rst      |    9 +-
 .../userspace-api/media/cec/cec-funcs.rst          |    9 +-
 .../userspace-api/media/cec/cec-header.rst         |    9 +-
 .../userspace-api/media/cec/cec-intro.rst          |    9 +-
 .../media/cec/cec-ioc-adap-g-caps.rst              |    9 +-
 .../media/cec/cec-ioc-adap-g-log-addrs.rst         |    9 +-
 .../media/cec/cec-ioc-adap-g-phys-addr.rst         |    9 +-
 .../userspace-api/media/cec/cec-ioc-dqevent.rst    |    9 +-
 .../userspace-api/media/cec/cec-ioc-g-mode.rst     |    9 +-
 .../userspace-api/media/cec/cec-ioc-receive.rst    |    9 +-
 .../userspace-api/media/cec/cec-pin-error-inj.rst  |    9 +-
 .../media/dvb/audio-bilingual-channel-select.rst   |    9 +-
 .../media/dvb/audio-channel-select.rst             |    9 +-
 .../userspace-api/media/dvb/audio-clear-buffer.rst |    9 +-
 .../userspace-api/media/dvb/audio-continue.rst     |    9 +-
 .../userspace-api/media/dvb/audio-fclose.rst       |    9 +-
 .../userspace-api/media/dvb/audio-fopen.rst        |    9 +-
 .../userspace-api/media/dvb/audio-fwrite.rst       |    9 +-
 .../media/dvb/audio-get-capabilities.rst           |    9 +-
 .../userspace-api/media/dvb/audio-get-status.rst   |    9 +-
 .../userspace-api/media/dvb/audio-pause.rst        |    9 +-
 .../userspace-api/media/dvb/audio-play.rst         |    9 +-
 .../media/dvb/audio-select-source.rst              |    9 +-
 .../userspace-api/media/dvb/audio-set-av-sync.rst  |    9 +-
 .../media/dvb/audio-set-bypass-mode.rst            |    9 +-
 .../userspace-api/media/dvb/audio-set-id.rst       |    9 +-
 .../userspace-api/media/dvb/audio-set-mixer.rst    |    9 +-
 .../userspace-api/media/dvb/audio-set-mute.rst     |    9 +-
 .../media/dvb/audio-set-streamtype.rst             |    9 +-
 .../userspace-api/media/dvb/audio-stop.rst         |    9 +-
 Documentation/userspace-api/media/dvb/audio.rst    |    9 +-
 .../userspace-api/media/dvb/audio_data_types.rst   |    9 +-
 .../media/dvb/audio_function_calls.rst             |    9 +-
 .../userspace-api/media/dvb/ca-fclose.rst          |    9 +-
 Documentation/userspace-api/media/dvb/ca-fopen.rst |    9 +-
 .../userspace-api/media/dvb/ca-get-cap.rst         |    9 +-
 .../userspace-api/media/dvb/ca-get-descr-info.rst  |    9 +-
 .../userspace-api/media/dvb/ca-get-msg.rst         |    9 +-
 .../userspace-api/media/dvb/ca-get-slot-info.rst   |    9 +-
 Documentation/userspace-api/media/dvb/ca-reset.rst |    9 +-
 .../userspace-api/media/dvb/ca-send-msg.rst        |    9 +-
 .../userspace-api/media/dvb/ca-set-descr.rst       |    9 +-
 Documentation/userspace-api/media/dvb/ca.rst       |    9 +-
 .../userspace-api/media/dvb/ca_data_types.rst      |    9 +-
 .../userspace-api/media/dvb/ca_function_calls.rst  |    9 +-
 Documentation/userspace-api/media/dvb/demux.rst    |    9 +-
 .../userspace-api/media/dvb/dmx-add-pid.rst        |    9 +-
 .../userspace-api/media/dvb/dmx-expbuf.rst         |    9 +-
 .../userspace-api/media/dvb/dmx-fclose.rst         |    9 +-
 .../userspace-api/media/dvb/dmx-fopen.rst          |    9 +-
 .../userspace-api/media/dvb/dmx-fread.rst          |    9 +-
 .../userspace-api/media/dvb/dmx-fwrite.rst         |    9 +-
 .../userspace-api/media/dvb/dmx-get-pes-pids.rst   |    9 +-
 .../userspace-api/media/dvb/dmx-get-stc.rst        |    9 +-
 Documentation/userspace-api/media/dvb/dmx-mmap.rst |    9 +-
 .../userspace-api/media/dvb/dmx-munmap.rst         |    9 +-
 Documentation/userspace-api/media/dvb/dmx-qbuf.rst |    9 +-
 .../userspace-api/media/dvb/dmx-querybuf.rst       |    9 +-
 .../userspace-api/media/dvb/dmx-remove-pid.rst     |    9 +-
 .../userspace-api/media/dvb/dmx-reqbufs.rst        |    9 +-
 .../media/dvb/dmx-set-buffer-size.rst              |    9 +-
 .../userspace-api/media/dvb/dmx-set-filter.rst     |    9 +-
 .../userspace-api/media/dvb/dmx-set-pes-filter.rst |    9 +-
 .../userspace-api/media/dvb/dmx-start.rst          |    9 +-
 Documentation/userspace-api/media/dvb/dmx-stop.rst |    9 +-
 .../userspace-api/media/dvb/dmx_fcalls.rst         |    9 +-
 .../userspace-api/media/dvb/dmx_types.rst          |    9 +-
 .../userspace-api/media/dvb/dvb-fe-read-status.rst |    9 +-
 .../userspace-api/media/dvb/dvb-frontend-event.rst |    9 +-
 .../media/dvb/dvb-frontend-parameters.rst          |    9 +-
 Documentation/userspace-api/media/dvb/dvbapi.rst   |   10 +-
 .../userspace-api/media/dvb/dvbproperty.rst        |    9 +-
 Documentation/userspace-api/media/dvb/dvbstb.svg   |   28 +-
 Documentation/userspace-api/media/dvb/examples.rst |    9 +-
 .../userspace-api/media/dvb/fe-bandwidth-t.rst     |    9 +-
 .../media/dvb/fe-diseqc-recv-slave-reply.rst       |    9 +-
 .../media/dvb/fe-diseqc-reset-overload.rst         |    9 +-
 .../media/dvb/fe-diseqc-send-burst.rst             |    9 +-
 .../media/dvb/fe-diseqc-send-master-cmd.rst        |    9 +-
 .../media/dvb/fe-dishnetwork-send-legacy-cmd.rst   |    9 +-
 .../media/dvb/fe-enable-high-lnb-voltage.rst       |    9 +-
 .../userspace-api/media/dvb/fe-get-event.rst       |    9 +-
 .../userspace-api/media/dvb/fe-get-frontend.rst    |    9 +-
 .../userspace-api/media/dvb/fe-get-info.rst        |    9 +-
 .../userspace-api/media/dvb/fe-get-property.rst    |    9 +-
 .../userspace-api/media/dvb/fe-read-ber.rst        |    9 +-
 .../media/dvb/fe-read-signal-strength.rst          |    9 +-
 .../userspace-api/media/dvb/fe-read-snr.rst        |    9 +-
 .../userspace-api/media/dvb/fe-read-status.rst     |    9 +-
 .../media/dvb/fe-read-uncorrected-blocks.rst       |    9 +-
 .../media/dvb/fe-set-frontend-tune-mode.rst        |    9 +-
 .../userspace-api/media/dvb/fe-set-frontend.rst    |    9 +-
 .../userspace-api/media/dvb/fe-set-tone.rst        |    9 +-
 .../userspace-api/media/dvb/fe-set-voltage.rst     |    9 +-
 .../userspace-api/media/dvb/fe-type-t.rst          |    9 +-
 .../media/dvb/fe_property_parameters.rst           |    9 +-
 .../userspace-api/media/dvb/frontend-header.rst    |    9 +-
 .../media/dvb/frontend-property-cable-systems.rst  |    9 +-
 .../dvb/frontend-property-satellite-systems.rst    |    9 +-
 .../dvb/frontend-property-terrestrial-systems.rst  |    9 +-
 .../media/dvb/frontend-stat-properties.rst         |    9 +-
 Documentation/userspace-api/media/dvb/frontend.rst |    9 +-
 .../userspace-api/media/dvb/frontend_f_close.rst   |    9 +-
 .../userspace-api/media/dvb/frontend_f_open.rst    |    9 +-
 .../userspace-api/media/dvb/frontend_fcalls.rst    |    9 +-
 .../media/dvb/frontend_legacy_api.rst              |    9 +-
 .../media/dvb/frontend_legacy_dvbv3_api.rst        |    9 +-
 Documentation/userspace-api/media/dvb/headers.rst  |    9 +-
 Documentation/userspace-api/media/dvb/intro.rst    |    9 +-
 .../userspace-api/media/dvb/legacy_dvb_apis.rst    |    9 +-
 .../userspace-api/media/dvb/net-add-if.rst         |    9 +-
 .../userspace-api/media/dvb/net-get-if.rst         |    9 +-
 .../userspace-api/media/dvb/net-remove-if.rst      |    9 +-
 .../userspace-api/media/dvb/net-types.rst          |    9 +-
 Documentation/userspace-api/media/dvb/net.rst      |    9 +-
 .../media/dvb/query-dvb-frontend-info.rst          |    9 +-
 .../userspace-api/media/dvb/video-clear-buffer.rst |    9 +-
 .../userspace-api/media/dvb/video-command.rst      |    9 +-
 .../userspace-api/media/dvb/video-continue.rst     |    9 +-
 .../userspace-api/media/dvb/video-fast-forward.rst |    9 +-
 .../userspace-api/media/dvb/video-fclose.rst       |    9 +-
 .../userspace-api/media/dvb/video-fopen.rst        |    9 +-
 .../userspace-api/media/dvb/video-freeze.rst       |    9 +-
 .../userspace-api/media/dvb/video-fwrite.rst       |    9 +-
 .../media/dvb/video-get-capabilities.rst           |    9 +-
 .../userspace-api/media/dvb/video-get-event.rst    |    9 +-
 .../media/dvb/video-get-frame-count.rst            |    9 +-
 .../userspace-api/media/dvb/video-get-pts.rst      |    9 +-
 .../userspace-api/media/dvb/video-get-size.rst     |    9 +-
 .../userspace-api/media/dvb/video-get-status.rst   |    9 +-
 .../userspace-api/media/dvb/video-play.rst         |    9 +-
 .../media/dvb/video-select-source.rst              |    9 +-
 .../userspace-api/media/dvb/video-set-blank.rst    |    9 +-
 .../media/dvb/video-set-display-format.rst         |    9 +-
 .../userspace-api/media/dvb/video-set-format.rst   |    9 +-
 .../media/dvb/video-set-streamtype.rst             |    9 +-
 .../userspace-api/media/dvb/video-slowmotion.rst   |    9 +-
 .../userspace-api/media/dvb/video-stillpicture.rst |    9 +-
 .../userspace-api/media/dvb/video-stop.rst         |    9 +-
 .../userspace-api/media/dvb/video-try-command.rst  |    9 +-
 Documentation/userspace-api/media/dvb/video.rst    |    9 +-
 .../media/dvb/video_function_calls.rst             |    9 +-
 .../userspace-api/media/dvb/video_types.rst        |    9 +-
 Documentation/userspace-api/media/fdl-appendix.rst |    9 +-
 Documentation/userspace-api/media/gen-errors.rst   |    9 +-
 Documentation/userspace-api/media/glossary.rst     |  205 ++
 Documentation/userspace-api/media/index.rst        |    3 +
 .../media/mediactl/media-controller-intro.rst      |    9 +-
 .../media/mediactl/media-controller-model.rst      |    9 +-
 .../media/mediactl/media-controller.rst            |   10 +-
 .../media/mediactl/media-func-close.rst            |    9 +-
 .../media/mediactl/media-func-ioctl.rst            |    9 +-
 .../media/mediactl/media-func-open.rst             |    9 +-
 .../userspace-api/media/mediactl/media-funcs.rst   |    9 +-
 .../userspace-api/media/mediactl/media-header.rst  |    9 +-
 .../media/mediactl/media-ioc-device-info.rst       |    9 +-
 .../media/mediactl/media-ioc-enum-entities.rst     |    9 +-
 .../media/mediactl/media-ioc-enum-links.rst        |    9 +-
 .../media/mediactl/media-ioc-g-topology.rst        |    9 +-
 .../media/mediactl/media-ioc-request-alloc.rst     |   26 +-
 .../media/mediactl/media-ioc-setup-link.rst        |    9 +-
 .../media/mediactl/media-request-ioc-queue.rst     |   26 +-
 .../media/mediactl/media-request-ioc-reinit.rst    |   26 +-
 .../userspace-api/media/mediactl/media-types.rst   |    9 +-
 .../userspace-api/media/mediactl/request-api.rst   |   26 +-
 .../media/mediactl/request-func-close.rst          |   26 +-
 .../media/mediactl/request-func-ioctl.rst          |   26 +-
 .../media/mediactl/request-func-poll.rst           |   26 +-
 .../userspace-api/media/rc/keytable.c.rst          |    9 +-
 .../userspace-api/media/rc/lirc-dev-intro.rst      |    9 +-
 Documentation/userspace-api/media/rc/lirc-dev.rst  |    9 +-
 Documentation/userspace-api/media/rc/lirc-func.rst |    9 +-
 .../userspace-api/media/rc/lirc-get-features.rst   |    9 +-
 .../userspace-api/media/rc/lirc-get-rec-mode.rst   |    9 +-
 .../media/rc/lirc-get-rec-resolution.rst           |    9 +-
 .../userspace-api/media/rc/lirc-get-send-mode.rst  |    9 +-
 .../userspace-api/media/rc/lirc-get-timeout.rst    |    9 +-
 .../userspace-api/media/rc/lirc-header.rst         |    9 +-
 Documentation/userspace-api/media/rc/lirc-read.rst |    9 +-
 .../media/rc/lirc-set-measure-carrier-mode.rst     |    9 +-
 .../media/rc/lirc-set-rec-carrier-range.rst        |    9 +-
 .../media/rc/lirc-set-rec-carrier.rst              |    9 +-
 .../media/rc/lirc-set-rec-timeout-reports.rst      |    9 +-
 .../media/rc/lirc-set-rec-timeout.rst              |    9 +-
 .../media/rc/lirc-set-send-carrier.rst             |    9 +-
 .../media/rc/lirc-set-send-duty-cycle.rst          |    9 +-
 .../media/rc/lirc-set-transmitter-mask.rst         |    9 +-
 .../media/rc/lirc-set-wideband-receiver.rst        |    9 +-
 .../userspace-api/media/rc/lirc-write.rst          |    9 +-
 Documentation/userspace-api/media/rc/rc-intro.rst  |    9 +-
 Documentation/userspace-api/media/rc/rc-protos.rst |    4 +-
 .../userspace-api/media/rc/rc-sysfs-nodes.rst      |    9 +-
 .../userspace-api/media/rc/rc-table-change.rst     |    9 +-
 Documentation/userspace-api/media/rc/rc-tables.rst |    9 +-
 .../userspace-api/media/rc/remote_controllers.rst  |   10 +-
 .../userspace-api/media/typical_media_device.svg   |   11 +-
 Documentation/userspace-api/media/v4l/app-pri.rst  |    9 +-
 Documentation/userspace-api/media/v4l/async.rst    |    9 +-
 Documentation/userspace-api/media/v4l/audio.rst    |    9 +-
 Documentation/userspace-api/media/v4l/bayer.svg    |   28 +-
 Documentation/userspace-api/media/v4l/biblio.rst   |    9 +-
 Documentation/userspace-api/media/v4l/buffer.rst   |    9 +-
 .../userspace-api/media/v4l/capture-example.rst    |    9 +-
 .../userspace-api/media/v4l/capture.c.rst          |    9 +-
 .../userspace-api/media/v4l/colorspaces-defs.rst   |   18 +-
 .../media/v4l/colorspaces-details.rst              |   14 +-
 .../userspace-api/media/v4l/colorspaces.rst        |    9 +-
 .../userspace-api/media/v4l/common-defs.rst        |    9 +-
 Documentation/userspace-api/media/v4l/common.rst   |    9 +-
 Documentation/userspace-api/media/v4l/compat.rst   |    9 +-
 .../userspace-api/media/v4l/constraints.svg        |   28 +-
 Documentation/userspace-api/media/v4l/control.rst  |    9 +-
 Documentation/userspace-api/media/v4l/crop.rst     |    9 +-
 Documentation/userspace-api/media/v4l/crop.svg     |   11 +-
 .../userspace-api/media/v4l/depth-formats.rst      |    9 +-
 .../userspace-api/media/v4l/dev-capture.rst        |    9 +-
 .../userspace-api/media/v4l/dev-encoder.rst        |   26 +-
 .../userspace-api/media/v4l/dev-event.rst          |    9 +-
 .../userspace-api/media/v4l/dev-mem2mem.rst        |    9 +-
 Documentation/userspace-api/media/v4l/dev-meta.rst |    9 +-
 Documentation/userspace-api/media/v4l/dev-osd.rst  |    9 +-
 .../userspace-api/media/v4l/dev-output.rst         |    9 +-
 .../userspace-api/media/v4l/dev-overlay.rst        |    9 +-
 .../userspace-api/media/v4l/dev-radio.rst          |    9 +-
 .../userspace-api/media/v4l/dev-raw-vbi.rst        |    9 +-
 Documentation/userspace-api/media/v4l/dev-rds.rst  |    9 +-
 Documentation/userspace-api/media/v4l/dev-sdr.rst  |    9 +-
 .../userspace-api/media/v4l/dev-sliced-vbi.rst     |   11 +-
 .../userspace-api/media/v4l/dev-subdev.rst         |    9 +-
 .../userspace-api/media/v4l/dev-touch.rst          |    9 +-
 Documentation/userspace-api/media/v4l/devices.rst  |    9 +-
 Documentation/userspace-api/media/v4l/diff-v4l.rst |    9 +-
 Documentation/userspace-api/media/v4l/dmabuf.rst   |    9 +-
 .../userspace-api/media/v4l/dv-timings.rst         |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  338 ++-
 .../userspace-api/media/v4l/ext-ctrls-detect.rst   |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-dv.rst       |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-fm-rx.rst    |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-fm-tx.rst    |    9 +-
 .../media/v4l/ext-ctrls-image-process.rst          |    9 +-
 .../media/v4l/ext-ctrls-image-source.rst           |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-jpeg.rst     |    9 +-
 .../userspace-api/media/v4l/ext-ctrls-rf-tuner.rst |    9 +-
 .../userspace-api/media/v4l/extended-controls.rst  |    9 +-
 .../userspace-api/media/v4l/field-order.rst        |    9 +-
 .../userspace-api/media/v4l/fieldseq_bt.svg        |   11 +-
 .../userspace-api/media/v4l/fieldseq_tb.svg        |   11 +-
 Documentation/userspace-api/media/v4l/format.rst   |    9 +-
 .../userspace-api/media/v4l/func-close.rst         |    9 +-
 .../userspace-api/media/v4l/func-ioctl.rst         |    9 +-
 .../userspace-api/media/v4l/func-mmap.rst          |    9 +-
 .../userspace-api/media/v4l/func-munmap.rst        |    9 +-
 .../userspace-api/media/v4l/func-open.rst          |    9 +-
 .../userspace-api/media/v4l/func-poll.rst          |    9 +-
 .../userspace-api/media/v4l/func-read.rst          |    9 +-
 .../userspace-api/media/v4l/func-select.rst        |    9 +-
 .../userspace-api/media/v4l/func-write.rst         |    9 +-
 .../userspace-api/media/v4l/hist-v4l2.rst          |  248 +-
 .../userspace-api/media/v4l/hsv-formats.rst        |    9 +-
 Documentation/userspace-api/media/v4l/io.rst       |    9 +-
 .../media/v4l/libv4l-introduction.rst              |    9 +-
 Documentation/userspace-api/media/v4l/libv4l.rst   |    9 +-
 .../userspace-api/media/v4l/meta-formats.rst       |   10 +-
 Documentation/userspace-api/media/v4l/mmap.rst     |    9 +-
 Documentation/userspace-api/media/v4l/nv12mt.svg   |   28 +-
 .../userspace-api/media/v4l/nv12mt_example.svg     |   28 +-
 Documentation/userspace-api/media/v4l/open.rst     |  120 +-
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |    9 +-
 .../userspace-api/media/v4l/pixfmt-compressed.rst  |    9 +-
 .../userspace-api/media/v4l/pixfmt-grey.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-indexed.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-intro.rst       |    9 +-
 .../userspace-api/media/v4l/pixfmt-inzi.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-m420.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-meta-d4xx.rst   |    9 +-
 .../media/v4l/pixfmt-meta-intel-ipu3.rst           |   25 +-
 .../userspace-api/media/v4l/pixfmt-meta-rkisp1.rst |   49 +
 .../userspace-api/media/v4l/pixfmt-meta-uvc.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-meta-vivid.rst  |   26 +-
 .../media/v4l/pixfmt-meta-vsp1-hgo.rst             |    9 +-
 .../media/v4l/pixfmt-meta-vsp1-hgt.rst             |    9 +-
 .../userspace-api/media/v4l/pixfmt-nv12.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-nv12m.rst       |    9 +-
 .../userspace-api/media/v4l/pixfmt-nv12mt.rst      |    9 +-
 .../userspace-api/media/v4l/pixfmt-nv16.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-nv16m.rst       |    9 +-
 .../userspace-api/media/v4l/pixfmt-nv24.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-packed-hsv.rst  |    9 +-
 .../userspace-api/media/v4l/pixfmt-packed-yuv.rst  |    9 +-
 .../userspace-api/media/v4l/pixfmt-reserved.rst    |   26 +-
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-cs08.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-cs14le.rst  |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-cu08.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-cu16le.rst  |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst |    9 +-
 .../userspace-api/media/v4l/pixfmt-sdr-ru12le.rst  |    9 +-
 .../media/v4l/pixfmt-srggb10-ipu3.rst              |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb10.rst     |    9 +-
 .../media/v4l/pixfmt-srggb10alaw8.rst              |    9 +-
 .../media/v4l/pixfmt-srggb10dpcm8.rst              |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb10p.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb12.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb12p.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb14.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb14p.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb16.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-srggb8.rst      |    9 +-
 .../userspace-api/media/v4l/pixfmt-tch-td08.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-tch-td16.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-tch-tu08.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-tch-tu16.rst    |    9 +-
 .../userspace-api/media/v4l/pixfmt-uv8.rst         |    9 +-
 .../userspace-api/media/v4l/pixfmt-uyvy.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-v4l2-mplane.rst |   25 +-
 .../userspace-api/media/v4l/pixfmt-v4l2.rst        |   90 +-
 .../userspace-api/media/v4l/pixfmt-vyuy.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-y10.rst         |    9 +-
 .../userspace-api/media/v4l/pixfmt-y10b.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-y10p.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-y12.rst         |    9 +-
 .../userspace-api/media/v4l/pixfmt-y12i.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-y14.rst         |    9 +-
 .../userspace-api/media/v4l/pixfmt-y16-be.rst      |    9 +-
 .../userspace-api/media/v4l/pixfmt-y16.rst         |    9 +-
 .../userspace-api/media/v4l/pixfmt-y41p.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-y8i.rst         |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuv410.rst      |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuv411p.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuv420.rst      |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuv420m.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuv422m.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuv422p.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuv444m.rst     |    9 +-
 .../userspace-api/media/v4l/pixfmt-yuyv.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-yvyu.rst        |    9 +-
 .../userspace-api/media/v4l/pixfmt-z16.rst         |    9 +-
 Documentation/userspace-api/media/v4l/pixfmt.rst   |    9 +-
 .../userspace-api/media/v4l/planar-apis.rst        |    9 +-
 Documentation/userspace-api/media/v4l/querycap.rst |    9 +-
 Documentation/userspace-api/media/v4l/rw.rst       |    9 +-
 .../userspace-api/media/v4l/sdr-formats.rst        |    9 +-
 .../media/v4l/selection-api-configuration.rst      |    9 +-
 .../media/v4l/selection-api-examples.rst           |    9 +-
 .../media/v4l/selection-api-intro.rst              |    9 +-
 .../media/v4l/selection-api-targets.rst            |    9 +-
 .../media/v4l/selection-api-vs-crop-api.rst        |    9 +-
 .../userspace-api/media/v4l/selection-api.rst      |    9 +-
 .../userspace-api/media/v4l/selection.svg          |   28 +-
 .../userspace-api/media/v4l/selections-common.rst  |    9 +-
 Documentation/userspace-api/media/v4l/standard.rst |    9 +-
 .../userspace-api/media/v4l/streaming-par.rst      |    9 +-
 .../userspace-api/media/v4l/subdev-formats.rst     |  104 +-
 .../media/v4l/subdev-image-processing-crop.svg     |   11 +-
 .../media/v4l/subdev-image-processing-full.svg     |   11 +-
 ...ubdev-image-processing-scaling-multi-source.svg |   11 +-
 .../userspace-api/media/v4l/tch-formats.rst        |    9 +-
 Documentation/userspace-api/media/v4l/tuner.rst    |    9 +-
 .../userspace-api/media/v4l/user-func.rst          |    9 +-
 Documentation/userspace-api/media/v4l/userp.rst    |    9 +-
 .../media/v4l/v4l2-selection-flags.rst             |    9 +-
 .../media/v4l/v4l2-selection-targets.rst           |    9 +-
 Documentation/userspace-api/media/v4l/v4l2.rst     |   11 +-
 .../userspace-api/media/v4l/v4l2grab-example.rst   |    9 +-
 .../userspace-api/media/v4l/v4l2grab.c.rst         |    9 +-
 Documentation/userspace-api/media/v4l/vbi_525.svg  |   11 +-
 Documentation/userspace-api/media/v4l/vbi_625.svg  |   11 +-
 .../userspace-api/media/v4l/vbi_hsync.svg          |   11 +-
 Documentation/userspace-api/media/v4l/video.rst    |    9 +-
 Documentation/userspace-api/media/v4l/videodev.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-create-bufs.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-cropcap.rst     |    9 +-
 .../media/v4l/vidioc-dbg-g-chip-info.rst           |    9 +-
 .../media/v4l/vidioc-dbg-g-register.rst            |    9 +-
 .../userspace-api/media/v4l/vidioc-decoder-cmd.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-dqevent.rst     |    9 +-
 .../media/v4l/vidioc-dv-timings-cap.rst            |    9 +-
 .../userspace-api/media/v4l/vidioc-encoder-cmd.rst |    9 +-
 .../media/v4l/vidioc-enum-dv-timings.rst           |    9 +-
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |   44 +-
 .../media/v4l/vidioc-enum-frameintervals.rst       |    9 +-
 .../media/v4l/vidioc-enum-framesizes.rst           |    9 +-
 .../media/v4l/vidioc-enum-freq-bands.rst           |    9 +-
 .../userspace-api/media/v4l/vidioc-enumaudio.rst   |    9 +-
 .../media/v4l/vidioc-enumaudioout.rst              |    9 +-
 .../userspace-api/media/v4l/vidioc-enuminput.rst   |    9 +-
 .../userspace-api/media/v4l/vidioc-enumoutput.rst  |    9 +-
 .../userspace-api/media/v4l/vidioc-enumstd.rst     |    9 +-
 .../userspace-api/media/v4l/vidioc-expbuf.rst      |    9 +-
 .../userspace-api/media/v4l/vidioc-g-audio.rst     |    9 +-
 .../userspace-api/media/v4l/vidioc-g-audioout.rst  |    9 +-
 .../userspace-api/media/v4l/vidioc-g-crop.rst      |    9 +-
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst      |    9 +-
 .../media/v4l/vidioc-g-dv-timings.rst              |    9 +-
 .../userspace-api/media/v4l/vidioc-g-edid.rst      |    9 +-
 .../userspace-api/media/v4l/vidioc-g-enc-index.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-g-fbuf.rst      |    9 +-
 .../userspace-api/media/v4l/vidioc-g-fmt.rst       |    9 +-
 .../userspace-api/media/v4l/vidioc-g-frequency.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-g-input.rst     |    9 +-
 .../userspace-api/media/v4l/vidioc-g-jpegcomp.rst  |    9 +-
 .../userspace-api/media/v4l/vidioc-g-modulator.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-g-output.rst    |    9 +-
 .../userspace-api/media/v4l/vidioc-g-parm.rst      |    9 +-
 .../userspace-api/media/v4l/vidioc-g-priority.rst  |    9 +-
 .../userspace-api/media/v4l/vidioc-g-selection.rst |    9 +-
 .../media/v4l/vidioc-g-sliced-vbi-cap.rst          |    9 +-
 .../userspace-api/media/v4l/vidioc-g-std.rst       |    9 +-
 .../userspace-api/media/v4l/vidioc-g-tuner.rst     |    9 +-
 .../userspace-api/media/v4l/vidioc-log-status.rst  |    9 +-
 .../userspace-api/media/v4l/vidioc-overlay.rst     |    9 +-
 .../userspace-api/media/v4l/vidioc-prepare-buf.rst |    9 +-
 .../userspace-api/media/v4l/vidioc-qbuf.rst        |    9 +-
 .../media/v4l/vidioc-query-dv-timings.rst          |    9 +-
 .../userspace-api/media/v4l/vidioc-querybuf.rst    |    9 +-
 .../userspace-api/media/v4l/vidioc-querycap.rst    |    9 +-
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |    9 +-
 .../userspace-api/media/v4l/vidioc-querystd.rst    |    9 +-
 .../userspace-api/media/v4l/vidioc-reqbufs.rst     |    9 +-
 .../media/v4l/vidioc-s-hw-freq-seek.rst            |    9 +-
 .../userspace-api/media/v4l/vidioc-streamon.rst    |    9 +-
 .../v4l/vidioc-subdev-enum-frame-interval.rst      |    9 +-
 .../media/v4l/vidioc-subdev-enum-frame-size.rst    |    9 +-
 .../media/v4l/vidioc-subdev-enum-mbus-code.rst     |   60 +-
 .../media/v4l/vidioc-subdev-g-crop.rst             |    9 +-
 .../media/v4l/vidioc-subdev-g-fmt.rst              |    9 +-
 .../media/v4l/vidioc-subdev-g-frame-interval.rst   |    9 +-
 .../media/v4l/vidioc-subdev-g-selection.rst        |    9 +-
 .../media/v4l/vidioc-subdev-querycap.rst           |    9 +-
 .../media/v4l/vidioc-subscribe-event.rst           |    9 +-
 .../userspace-api/media/v4l/yuv-formats.rst        |    9 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    7 +-
 MAINTAINERS                                        |   63 +-
 drivers/firmware/qcom_scm.c                        |   24 +
 drivers/firmware/qcom_scm.h                        |    1 +
 drivers/gpu/drm/tegra/dsi.c                        |    4 +-
 drivers/gpu/host1x/mipi.c                          |   22 +-
 drivers/hid/hid-picolcd_cir.c                      |   10 +-
 drivers/media/cec/core/cec-adap.c                  |    8 +-
 drivers/media/cec/core/cec-core.c                  |   31 +-
 drivers/media/cec/core/cec-pin.c                   |    6 +-
 drivers/media/cec/platform/seco/seco-cec.c         |    2 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |    2 +-
 drivers/media/common/saa7146/saa7146_core.c        |    2 +-
 drivers/media/common/siano/sms-cards.c             |    2 +-
 drivers/media/common/siano/smsir.c                 |    4 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |   34 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   32 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   53 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   12 +-
 drivers/media/dvb-frontends/af9013.c               |    2 +-
 drivers/media/dvb-frontends/drxk_hard.c            |    3 +-
 drivers/media/dvb-frontends/lg2160.c               |    2 +-
 drivers/media/dvb-frontends/m88ds3103.c            |    2 +-
 drivers/media/dvb-frontends/mb86a16.c              |    7 +-
 drivers/media/dvb-frontends/mxl5xx.c               |    1 -
 drivers/media/dvb-frontends/rtl2832_sdr.c          |    1 +
 drivers/media/dvb-frontends/tda10021.c             |   40 +-
 drivers/media/dvb-frontends/tda10086.c             |   22 +-
 drivers/media/dvb-frontends/tda18271c2dd.c         |   41 +-
 drivers/media/dvb-frontends/tda18271c2dd_maps.h    |   22 +-
 drivers/media/dvb-frontends/zd1301_demod.h         |    6 -
 drivers/media/firewire/firedtv-fw.c                |    6 +-
 drivers/media/i2c/Kconfig                          |    2 +-
 drivers/media/i2c/adv7180.c                        |    9 +-
 drivers/media/i2c/adv748x/adv748x-core.c           |   31 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           |   31 +
 drivers/media/i2c/adv748x/adv748x.h                |    1 +
 drivers/media/i2c/adv7511-v4l2.c                   |    4 +-
 drivers/media/i2c/cx25840/cx25840-ir.c             |    2 +-
 drivers/media/i2c/dw9807-vcm.c                     |    2 +-
 drivers/media/i2c/imx219.c                         |    2 +-
 drivers/media/i2c/imx258.c                         |    2 +-
 drivers/media/i2c/imx274.c                         |    8 +-
 drivers/media/i2c/m5mols/m5mols_core.c             |    3 +-
 drivers/media/i2c/max9286.c                        |   43 +-
 drivers/media/i2c/ml86v7667.c                      |    7 +-
 drivers/media/i2c/msp3400-kthreads.c               |    2 +-
 drivers/media/i2c/mt9m001.c                        |    7 +-
 drivers/media/i2c/mt9m111.c                        |    7 +-
 drivers/media/i2c/ov2740.c                         |   24 +-
 drivers/media/i2c/ov5640.c                         |  340 +--
 drivers/media/i2c/ov5675.c                         |   15 +-
 drivers/media/i2c/ov6650.c                         |   57 +-
 drivers/media/i2c/ov7740.c                         |   10 +-
 drivers/media/i2c/ov8856.c                         |  430 ++++
 drivers/media/i2c/ov9640.c                         |    9 +-
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c          |    2 +-
 drivers/media/i2c/s5k5baf.c                        |    5 +-
 drivers/media/i2c/smiapp/smiapp-core.c             |    6 +-
 drivers/media/i2c/tc358743.c                       |   21 +-
 drivers/media/i2c/tda1997x.c                       |   16 +-
 drivers/media/i2c/tvp5150.c                        |    9 +-
 drivers/media/i2c/tvp7002.c                        |    4 +-
 drivers/media/mc/mc-device.c                       |    7 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |   15 +-
 drivers/media/pci/bt8xx/dvb-bt8xx.c                |    7 +-
 drivers/media/pci/cobalt/cobalt-i2c.c              |    8 +-
 drivers/media/pci/cobalt/cobalt-omnitek.c          |    2 +-
 drivers/media/pci/cx23885/cx23885-alsa.c           |   11 +-
 drivers/media/pci/cx23885/cx23885-video.c          |    2 +-
 drivers/media/pci/cx23885/cx23885.h                |    4 +-
 drivers/media/pci/cx23885/cx23888-ir.c             |    2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c           |   15 +-
 drivers/media/pci/cx88/cx88-alsa.c                 |   19 +-
 drivers/media/pci/cx88/cx88-cards.c                |    2 +-
 drivers/media/pci/cx88/cx88-input.c                |    4 +-
 drivers/media/pci/cx88/cx88-video.c                |    2 +-
 drivers/media/pci/dt3155/dt3155.c                  |    3 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  159 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |    4 +-
 drivers/media/pci/mantis/mantis_dma.c              |    4 +-
 drivers/media/pci/mantis/mantis_dma.h              |    2 +-
 drivers/media/pci/mantis/mantis_dvb.c              |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |    2 -
 drivers/media/pci/ngene/ngene-core.c               |   12 +-
 drivers/media/pci/saa7134/saa7134-alsa.c           |   11 +-
 drivers/media/pci/saa7134/saa7134-cards.c          |    4 +-
 drivers/media/pci/saa7134/saa7134-core.c           |   47 +-
 drivers/media/pci/saa7134/saa7134-empress.c        |    3 +-
 drivers/media/pci/saa7134/saa7134-go7007.c         |    2 +-
 drivers/media/pci/saa7134/saa7134-tvaudio.c        |    3 +-
 drivers/media/pci/saa7134/saa7134-video.c          |    2 -
 drivers/media/pci/saa7134/saa7134.h                |    2 +-
 drivers/media/pci/saa7164/saa7164-buffer.c         |    8 +-
 drivers/media/pci/saa7164/saa7164-core.c           |   12 +-
 drivers/media/pci/saa7164/saa7164-dvb.c            |    7 +-
 drivers/media/pci/saa7164/saa7164-vbi.c            |    6 +-
 drivers/media/pci/smipcie/smipcie-ir.c             |    7 +-
 drivers/media/pci/smipcie/smipcie-main.c           |    6 +-
 drivers/media/pci/solo6x10/solo6x10-core.c         |    2 +-
 drivers/media/pci/solo6x10/solo6x10-i2c.c          |    2 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c            |    6 +-
 drivers/media/pci/ttpci/av7110.c                   |   20 +-
 drivers/media/pci/ttpci/av7110_v4l.c               |    4 +-
 drivers/media/pci/ttpci/budget-ci.c                |   15 +-
 drivers/media/pci/ttpci/budget-core.c              |    6 +-
 drivers/media/pci/tw5864/tw5864-video.c            |   19 +-
 drivers/media/platform/Kconfig                     |    9 +-
 drivers/media/platform/aspeed-video.c              |    5 +-
 drivers/media/platform/coda/coda-bit.c             |    4 +-
 drivers/media/platform/coda/coda-common.c          |   17 +-
 drivers/media/platform/exynos4-is/fimc-capture.c   |   27 +-
 drivers/media/platform/exynos4-is/fimc-core.c      |   67 +-
 drivers/media/platform/exynos4-is/fimc-core.h      |    5 -
 drivers/media/platform/exynos4-is/fimc-is.c        |   17 +-
 drivers/media/platform/exynos4-is/fimc-isp.c       |    4 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      |    2 +-
 drivers/media/platform/exynos4-is/fimc-reg.c       |    9 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   89 +-
 drivers/media/platform/exynos4-is/media-dev.h      |   11 -
 drivers/media/platform/exynos4-is/mipi-csis.c      |    4 +-
 drivers/media/platform/fsl-viu.c                   |    2 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |   10 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   40 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |  133 +-
 drivers/media/platform/mtk-jpeg/Makefile           |    5 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |  930 +++++---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  106 +-
 .../mtk-jpeg/{mtk_jpeg_hw.c =3D> mtk_jpeg_dec_hw.c}  |   10 +-
 .../mtk-jpeg/{mtk_jpeg_hw.h =3D> mtk_jpeg_dec_hw.h}  |   12 +-
 .../{mtk_jpeg_parse.c =3D> mtk_jpeg_dec_parse.c}     |    2 +-
 .../{mtk_jpeg_parse.h =3D> mtk_jpeg_dec_parse.h}     |    2 +-
 .../{mtk_jpeg_reg.h =3D> mtk_jpeg_dec_reg.h}         |   19 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  |  154 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h  |   91 +
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |    2 +-
 drivers/media/platform/mtk-vcodec/Makefile         |    6 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |   11 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |   62 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  |    1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |   40 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |  211 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  180 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  |    2 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c  |  231 ++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h  |   38 +
 .../media/platform/mtk-vcodec/mtk_vcodec_util.c    |    1 -
 .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |    1 -
 .../media/platform/mtk-vcodec/vdec/vdec_vp8_if.c   |    1 -
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |    3 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_base.h  |    2 -
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c    |    1 -
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c    |   12 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h    |   11 +-
 .../media/platform/mtk-vcodec/venc/venc_h264_if.c  |   68 +-
 .../media/platform/mtk-vcodec/venc/venc_vp8_if.c   |   11 +-
 drivers/media/platform/mtk-vcodec/venc_drv_if.c    |    1 -
 drivers/media/platform/mtk-vcodec/venc_drv_if.h    |   13 +
 drivers/media/platform/mtk-vcodec/venc_ipi_msg.h   |   27 +-
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c    |  141 +-
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h    |    8 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |    5 -
 drivers/media/platform/mx2_emmaprp.c               |    7 +-
 drivers/media/platform/omap3isp/isp.c              |    8 +-
 drivers/media/platform/omap3isp/ispvideo.c         |    2 +-
 drivers/media/platform/pxa_camera.c                |  195 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |    4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |    8 -
 drivers/media/platform/qcom/camss/camss-vfe.h      |    2 -
 drivers/media/platform/qcom/camss/camss-video.c    |  124 +-
 drivers/media/platform/qcom/camss/camss-video.h    |    2 -
 drivers/media/platform/qcom/camss/camss.c          |    5 -
 drivers/media/platform/qcom/venus/Makefile         |    2 +-
 drivers/media/platform/qcom/venus/core.c           |   56 +-
 drivers/media/platform/qcom/venus/core.h           |   34 +-
 drivers/media/platform/qcom/venus/dbgfs.c          |   19 +
 drivers/media/platform/qcom/venus/dbgfs.h          |   12 +
 drivers/media/platform/qcom/venus/firmware.c       |   19 +-
 drivers/media/platform/qcom/venus/helpers.c        |  241 +-
 drivers/media/platform/qcom/venus/helpers.h        |    2 +
 drivers/media/platform/qcom/venus/hfi.c            |    5 +
 drivers/media/platform/qcom/venus/hfi.h            |    1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c       |   37 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |   28 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c       |   18 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |    3 +
 drivers/media/platform/qcom/venus/hfi_venus.c      |   72 +-
 drivers/media/platform/qcom/venus/hfi_venus.h      |    1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   94 +-
 drivers/media/platform/qcom/venus/vdec.c           |   26 +-
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |   31 +-
 drivers/media/platform/qcom/venus/venc.c           |  199 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |   35 +-
 drivers/media/platform/rcar-fcp.c                  |    8 +-
 drivers/media/platform/rcar-vin/Kconfig            |    4 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |   71 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  106 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   49 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   31 +-
 drivers/media/platform/rcar-vin/rcar-vin.h         |    5 +-
 drivers/media/platform/rcar_drif.c                 |   30 +-
 drivers/media/platform/renesas-ceu.c               |    4 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |    1 +
 drivers/media/platform/s3c-camif/camif-core.c      |    5 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c       |    7 +
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c        |    4 +-
 drivers/media/platform/sti/bdisp/bdisp-debug.c     |   29 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |   10 +-
 drivers/media/platform/sti/bdisp/bdisp.h           |    2 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-core.c  |   10 +-
 drivers/media/platform/sti/delta/delta-v4l2.c      |    4 +-
 drivers/media/platform/sti/hva/hva-debugfs.c       |   22 +-
 drivers/media/platform/sti/hva/hva-hw.c            |    4 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |    4 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |    1 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |    6 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |    7 +-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |    5 +-
 drivers/media/platform/ti-vpe/vpe.c                |    2 +
 drivers/media/platform/vsp1/vsp1_drv.c             |   11 +-
 drivers/media/radio/radio-si476x.c                 |   66 +-
 drivers/media/radio/si4713/si4713.c                |    2 +-
 drivers/media/radio/wl128x/fmdrv_common.c          |   28 +-
 drivers/media/rc/ati_remote.c                      |    4 +
 drivers/media/rc/ene_ir.c                          |   18 +-
 drivers/media/rc/fintek-cir.c                      |    8 +-
 drivers/media/rc/gpio-ir-recv.c                    |   53 +
 drivers/media/rc/igorplugusb.c                     |    6 +-
 drivers/media/rc/iguanair.c                        |    6 +-
 drivers/media/rc/imon_raw.c                        |    2 +-
 drivers/media/rc/ir-hix5hd2.c                      |    8 +-
 drivers/media/rc/ir-imon-decoder.c                 |   10 +-
 drivers/media/rc/ir-jvc-decoder.c                  |    6 +-
 drivers/media/rc/ir-mce_kbd-decoder.c              |    8 +-
 drivers/media/rc/ir-nec-decoder.c                  |    6 +-
 drivers/media/rc/ir-rc5-decoder.c                  |    6 +-
 drivers/media/rc/ir-rc6-decoder.c                  |    6 +-
 drivers/media/rc/ir-rcmm-decoder.c                 |   18 +-
 drivers/media/rc/ir-sanyo-decoder.c                |    6 +-
 drivers/media/rc/ir-sharp-decoder.c                |    6 +-
 drivers/media/rc/ir-sony-decoder.c                 |    6 +-
 drivers/media/rc/ir-xmp-decoder.c                  |   15 +-
 drivers/media/rc/ir_toy.c                          |   14 +-
 drivers/media/rc/ite-cir.c                         |   10 +-
 drivers/media/rc/ite-cir.h                         |    4 +-
 drivers/media/rc/lirc_dev.c                        |   95 +-
 drivers/media/rc/mceusb.c                          |   12 +-
 drivers/media/rc/meson-ir.c                        |    4 +-
 drivers/media/rc/mtk-cir.c                         |    4 +-
 drivers/media/rc/nuvoton-cir.c                     |   10 +-
 drivers/media/rc/nuvoton-cir.h                     |    2 +-
 drivers/media/rc/rc-core-priv.h                    |   21 +-
 drivers/media/rc/rc-ir-raw.c                       |   16 +-
 drivers/media/rc/rc-loopback.c                     |    8 +-
 drivers/media/rc/rc-main.c                         |   10 +-
 drivers/media/rc/redrat3.c                         |   17 +-
 drivers/media/rc/serial_ir.c                       |   12 +-
 drivers/media/rc/sir_ir.c                          |    2 +-
 drivers/media/rc/st_rc.c                           |    6 +-
 drivers/media/rc/streamzap.c                       |   10 +-
 drivers/media/rc/sunxi-cir.c                       |    4 +-
 drivers/media/rc/ttusbir.c                         |   18 +-
 drivers/media/rc/winbond-cir.c                     |   10 +-
 drivers/media/rc/xbox_remote.c                     |    2 +-
 drivers/media/test-drivers/Kconfig                 |   16 +
 drivers/media/test-drivers/Makefile                |    1 +
 drivers/media/test-drivers/vicodec/vicodec-core.c  |    6 +-
 drivers/media/test-drivers/vidtv/Kconfig           |   11 +
 drivers/media/test-drivers/vidtv/Makefile          |    9 +
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |  566 +++++
 drivers/media/test-drivers/vidtv/vidtv_bridge.h    |   63 +
 drivers/media/test-drivers/vidtv/vidtv_channel.c   |  310 +++
 drivers/media/test-drivers/vidtv/vidtv_channel.h   |   76 +
 drivers/media/test-drivers/vidtv/vidtv_common.c    |   89 +
 drivers/media/test-drivers/vidtv/vidtv_common.h    |   33 +
 drivers/media/test-drivers/vidtv/vidtv_demod.c     |  464 ++++
 drivers/media/test-drivers/vidtv/vidtv_demod.h     |   69 +
 drivers/media/test-drivers/vidtv/vidtv_encoder.h   |  166 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c       |  474 ++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h       |  167 ++
 drivers/media/test-drivers/vidtv/vidtv_pes.c       |  438 ++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h       |  191 ++
 drivers/media/test-drivers/vidtv/vidtv_psi.c       | 1322 +++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h       |  577 +++++
 drivers/media/test-drivers/vidtv/vidtv_s302m.c     |  502 ++++
 drivers/media/test-drivers/vidtv/vidtv_s302m.h     |   92 +
 drivers/media/test-drivers/vidtv/vidtv_ts.c        |  137 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.h        |  108 +
 drivers/media/test-drivers/vidtv/vidtv_tuner.c     |  438 ++++
 drivers/media/test-drivers/vidtv/vidtv_tuner.h     |   43 +
 drivers/media/test-drivers/vimc/vimc-capture.c     |    7 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |  674 +++---
 drivers/media/test-drivers/vivid/vivid-meta-out.c  |    9 +-
 drivers/media/test-drivers/vivid/vivid-vbi-gen.c   |    2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |   38 +-
 .../media/test-drivers/vivid/vivid-vid-common.c    |   25 +
 drivers/media/tuners/fc0011.c                      |    2 +-
 drivers/media/tuners/qt1010.c                      |   25 +-
 drivers/media/tuners/tda18271-fe.c                 |    2 +-
 drivers/media/tuners/tuner-simple.c                |    5 +-
 drivers/media/usb/au0828/au0828-input.c            |    8 +-
 drivers/media/usb/au0828/au0828-video.c            |   12 +-
 drivers/media/usb/b2c2/flexcop-usb.c               |    9 +-
 drivers/media/usb/b2c2/flexcop-usb.h               |    2 +-
 drivers/media/usb/cx231xx/cx231xx-core.c           |   16 +-
 drivers/media/usb/dvb-usb-v2/af9015.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c               |    2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c             |    8 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c       |    4 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |    4 +-
 drivers/media/usb/dvb-usb/Kconfig                  |    1 +
 drivers/media/usb/dvb-usb/cxusb-analog.c           |   13 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c        |   11 +-
 drivers/media/usb/dvb-usb/pctv452e.c               |   26 +-
 drivers/media/usb/dvb-usb/technisat-usb2.c         |    4 +-
 drivers/media/usb/em28xx/em28xx-audio.c            |    8 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |   22 +
 drivers/media/usb/em28xx/em28xx.h                  |    1 +
 drivers/media/usb/go7007/go7007-driver.c           |    2 +-
 drivers/media/usb/gspca/mr97310a.c                 |   10 +-
 drivers/media/usb/gspca/nw80x.c                    |    2 +-
 drivers/media/usb/gspca/ov519.c                    |    6 +-
 drivers/media/usb/gspca/sn9c20x.c                  |    2 +-
 drivers/media/usb/gspca/sunplus.c                  |    4 +-
 drivers/media/usb/gspca/xirlink_cit.c              |    4 +-
 drivers/media/usb/gspca/zc3xx.c                    |    4 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |    5 +-
 drivers/media/usb/pwc/pwc-v4l.c                    |    2 +-
 drivers/media/usb/siano/smsusb.c                   |    2 +-
 drivers/media/usb/tm6000/tm6000-alsa.c             |    8 +-
 drivers/media/usb/tm6000/tm6000-core.c             |   24 +-
 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c  |  197 +-
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |    7 +-
 drivers/media/usb/usbtv/usbtv-core.c               |    3 +-
 drivers/media/usb/usbtv/usbtv-video.c              |    4 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |   46 +-
 drivers/media/usb/uvc/uvc_debugfs.c                |   20 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   71 +-
 drivers/media/usb/uvc/uvc_entity.c                 |   35 +
 drivers/media/usb/uvc/uvc_v4l2.c                   |   34 +
 drivers/media/usb/uvc/uvc_video.c                  |    6 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    8 +-
 drivers/media/v4l2-core/v4l2-ctrls.c               |   61 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |    4 +-
 drivers/media/v4l2-core/v4l2-h264.c                |   12 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   68 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   16 +
 drivers/media/v4l2-core/videobuf-dma-sg.c          |   22 +-
 drivers/remoteproc/Kconfig                         |    2 +-
 drivers/staging/media/Kconfig                      |    6 +-
 drivers/staging/media/Makefile                     |    2 +-
 drivers/staging/media/atomisp/Makefile             |   12 +-
 drivers/staging/media/atomisp/i2c/Kconfig          |   74 +-
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |    4 +-
 drivers/staging/media/atomisp/i2c/ov5693/Kconfig   |   12 -
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   29 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |   17 +-
 .../media/atomisp/pci/atomisp_compat_ioctl32.c     |   84 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c      |   10 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   51 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |    6 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |    9 +-
 .../atomisp/pci/css_2401_system/host/csi_rx.c      |    1 +
 .../atomisp/pci/css_2401_system/host/ibuf_ctrl.c   |    1 +
 .../pci/css_2401_system/host/ibuf_ctrl_local.h     |    1 +
 .../pci/css_2401_system/host/ibuf_ctrl_private.h   |  268 ---
 .../atomisp/pci/css_2401_system/host/isys_dma.c    |   10 +-
 .../pci/css_2401_system/host/isys_dma_local.h      |   21 -
 .../pci/css_2401_system/host/isys_dma_private.h    |   12 +-
 .../atomisp/pci/css_2401_system/host/isys_irq.c    |    3 +-
 .../pci/css_2401_system/host/isys_irq_local.h      |    4 +-
 .../pci/css_2401_system/host/isys_irq_private.h    |   12 +-
 .../pci/css_2401_system/host/pixelgen_private.h    |   73 +-
 .../atomisp/pci/css_2401_system/ibuf_ctrl_global.h |    6 +-
 .../atomisp/pci/css_2401_system/isys_irq_global.h  |    4 +-
 .../atomisp/pci/css_2401_system/pixelgen_global.h  |    8 +-
 .../pci/hive_isp_css_common/host/input_formatter.c |    6 +-
 .../host/input_formatter_local.h                   |    4 -
 .../pci/hive_isp_css_common/host/input_system.c    |   70 +-
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |    4 +-
 .../hive_isp_css_include/host/ibuf_ctrl_public.h   |   94 -
 .../hive_isp_css_include/host/isys_dma_public.h    |    8 +-
 .../hive_isp_css_include/host/isys_irq_public.h    |   29 +-
 .../pci/hive_isp_css_include/host/isys_public.h    |    4 +-
 .../hive_isp_css_include/host/pixelgen_public.h    |    4 +-
 .../atomisp/pci/hive_isp_css_include/ibuf_ctrl.h   |   47 -
 .../atomisp/pci/hive_isp_css_include/isys_dma.h    |   47 -
 .../atomisp/pci/hive_isp_css_include/isys_irq.h    |   16 +-
 .../pci/hive_isp_css_include/print_support.h       |    2 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |    6 +-
 drivers/staging/media/atomisp/pci/ia_css_env.h     |    4 +-
 drivers/staging/media/atomisp/pci/ia_css_mipi.h    |    2 -
 drivers/staging/media/atomisp/pci/ia_css_stream.h  |    4 +-
 .../media/atomisp/pci/input_system_global.h        |   29 +-
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h |    7 -
 .../kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c    |  145 --
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c  |    3 -
 .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c   |  144 --
 .../isp/kernels/gc/gc_2/ia_css_gc2_table.host.c    |   53 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c  |    4 +-
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c    |    3 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |    7 +-
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h |    7 -
 .../kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c    |   31 -
 .../atomisp/pci/isp2400_input_system_global.h      |   21 +-
 .../media/atomisp/pci/isp2400_input_system_local.h |   17 +-
 .../atomisp/pci/isp2400_input_system_public.h      |   26 +-
 .../media/atomisp/pci/isp2400_system_global.h      |   16 -
 .../atomisp/pci/isp2401_input_system_global.h      |   30 +-
 .../media/atomisp/pci/isp2401_input_system_local.h |    3 -
 .../atomisp/pci/isp2401_input_system_private.h     |  224 +-
 .../media/atomisp/pci/isp2401_system_global.h      |   19 -
 .../media/atomisp/pci/runtime/binary/src/binary.c  |  863 ++++---
 .../pci/runtime/bufq/interface/ia_css_bufq_comm.h  |   10 -
 .../media/atomisp/pci/runtime/bufq/src/bufq.c      |   26 +-
 .../pci/runtime/debug/interface/ia_css_debug.h     |   15 +-
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |  196 +-
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |    2 +-
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |   10 -
 .../pci/runtime/isys/interface/ia_css_isys.h       |   18 +-
 .../pci/runtime/isys/interface/ia_css_isys_comm.h  |    4 +-
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.c     |    2 +-
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.c   |    2 +-
 .../media/atomisp/pci/runtime/isys/src/isys_init.c |   20 +-
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.c   |    2 +-
 .../media/atomisp/pci/runtime/isys/src/rx.c        |   24 +-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |   58 +-
 .../runtime/pipeline/interface/ia_css_pipeline.h   |    2 +-
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |    4 +-
 .../atomisp/pci/runtime/queue/src/queue_access.c   |    2 +-
 .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c |    4 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  379 +--
 drivers/staging/media/atomisp/pci/sh_css_defs.h    |    4 -
 .../staging/media/atomisp/pci/sh_css_firmware.c    |   64 +-
 drivers/staging/media/atomisp/pci/sh_css_hrt.c     |    4 -
 .../staging/media/atomisp/pci/sh_css_internal.h    |   44 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   46 +-
 .../media/atomisp/pci/sh_css_param_shading.c       |   25 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |  547 +----
 .../staging/media/atomisp/pci/sh_css_properties.c  |   10 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |   39 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |    8 +-
 drivers/staging/media/atomisp/pci/sh_css_struct.h  |    2 -
 drivers/staging/media/atomisp/pci/system_global.h  |   23 -
 drivers/staging/media/hantro/hantro_drv.c          |    5 -
 drivers/staging/media/hantro/hantro_g1_h264_dec.c  |   26 +-
 drivers/staging/media/hantro/hantro_h264.c         |   14 +-
 drivers/staging/media/hantro/hantro_hw.h           |    2 -
 drivers/staging/media/hantro/hantro_postproc.c     |    4 +-
 drivers/staging/media/imx/TODO                     |    4 +
 drivers/staging/media/ipu3/include/intel-ipu3.h    |   14 +-
 drivers/staging/media/ipu3/ipu3-css-params.c       |    2 +-
 drivers/staging/media/ipu3/ipu3-css.c              |  274 +--
 drivers/staging/media/meson/vdec/vdec.c            |    8 +-
 drivers/staging/media/omap4iss/iss.c               |    2 +-
 .../media/uapi/v4l/pixfmt-meta-rkisp1-params.rst   |   23 -
 .../media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst     |   22 -
 drivers/staging/media/rkisp1/TODO                  |    4 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c      |  230 +-
 drivers/staging/media/rkisp1/rkisp1-common.h       |  281 ++-
 drivers/staging/media/rkisp1/rkisp1-dev.c          |   17 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c          |   59 +-
 drivers/staging/media/rkisp1/rkisp1-params.c       |  211 +-
 drivers/staging/media/rkisp1/rkisp1-regs.h         |    1 -
 drivers/staging/media/rkisp1/rkisp1-resizer.c      |   94 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c        |   29 +-
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h  |  289 ++-
 drivers/staging/media/rkvdec/rkvdec-h264.c         |   37 +-
 drivers/staging/media/rkvdec/rkvdec.c              |   14 +-
 drivers/staging/media/rkvdec/rkvdec.h              |    1 -
 drivers/staging/media/sunxi/cedrus/cedrus.c        |    9 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |    2 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |   61 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |   29 +-
 drivers/staging/media/tegra-vde/vde.c              |    4 +-
 drivers/staging/media/tegra-video/Kconfig          |    7 +
 drivers/staging/media/tegra-video/TODO             |    6 -
 drivers/staging/media/tegra-video/csi.c            |  314 ++-
 drivers/staging/media/tegra-video/csi.h            |    8 +
 drivers/staging/media/tegra-video/tegra210.c       |   25 +-
 drivers/staging/media/tegra-video/vi.c             |  850 ++++++-
 drivers/staging/media/tegra-video/vi.h             |   25 +-
 drivers/staging/media/tegra-video/video.c          |   23 +-
 drivers/staging/media/usbvision/Kconfig            |   18 -
 drivers/staging/media/usbvision/Makefile           |    4 -
 drivers/staging/media/usbvision/TODO               |   11 -
 drivers/staging/media/usbvision/usbvision-cards.c  | 1120 ---------
 drivers/staging/media/usbvision/usbvision-cards.h  |   70 -
 drivers/staging/media/usbvision/usbvision-core.c   | 2428 ----------------=
----
 drivers/staging/media/usbvision/usbvision-i2c.c    |  438 ----
 drivers/staging/media/usbvision/usbvision-video.c  | 1643 -------------
 drivers/staging/media/usbvision/usbvision.h        |  500 ----
 drivers/staging/media/zoran/Kconfig                |   76 +
 drivers/staging/media/zoran/Makefile               |    7 +
 drivers/staging/media/zoran/TODO                   |   19 +
 drivers/staging/media/zoran/videocodec.c           |  330 +++
 drivers/staging/media/zoran/videocodec.h           |  308 +++
 drivers/staging/media/zoran/zoran.h                |  319 +++
 drivers/staging/media/zoran/zoran_card.c           | 1333 +++++++++++
 drivers/staging/media/zoran/zoran_card.h           |   30 +
 drivers/staging/media/zoran/zoran_device.c         | 1013 ++++++++
 drivers/staging/media/zoran/zoran_device.h         |   64 +
 drivers/staging/media/zoran/zoran_driver.c         | 1037 +++++++++
 drivers/staging/media/zoran/zr36016.c              |  433 ++++
 drivers/staging/media/zoran/zr36016.h              |   92 +
 drivers/staging/media/zoran/zr36050.c              |  842 +++++++
 drivers/staging/media/zoran/zr36050.h              |  163 ++
 drivers/staging/media/zoran/zr36057.h              |  154 ++
 drivers/staging/media/zoran/zr36060.c              |  872 +++++++
 drivers/staging/media/zoran/zr36060.h              |  201 ++
 include/linux/host1x.h                             |    4 +-
 include/linux/qcom_scm.h                           |    7 +
 include/media/cec.h                                |    2 -
 include/media/h264-ctrls.h                         |   87 +-
 include/media/rc-core.h                            |   11 +-
 include/media/tpg/v4l2-tpg.h                       |    1 +
 include/media/v4l2-async.h                         |    5 +-
 include/media/v4l2-common.h                        |   29 +
 include/media/v4l2-ctrls.h                         |    2 +
 include/media/v4l2-fwnode.h                        |   24 +-
 include/media/v4l2-h264.h                          |    3 +-
 include/media/v4l2-mediabus.h                      |   33 +-
 include/media/v4l2-mem2mem.h                       |   22 +
 include/media/v4l2-subdev.h                        |   40 +-
 include/media/videobuf-dma-sg.h                    |    2 +-
 include/media/videobuf2-v4l2.h                     |   17 +
 include/uapi/linux/v4l2-controls.h                 |   25 +
 include/uapi/linux/v4l2-mediabus.h                 |   15 +-
 include/uapi/linux/v4l2-subdev.h                   |   10 +-
 include/uapi/linux/videodev2.h                     |   23 +-
 1002 files changed, 26154 insertions(+), 18129 deletions(-)
 create mode 100644 Documentation/admin-guide/media/rkisp1.dot
 create mode 100644 Documentation/admin-guide/media/rkisp1.rst
 delete mode 100644 Documentation/admin-guide/media/usbvision-cardlist.rst
 create mode 100644 Documentation/admin-guide/media/zoran-cardlist.rst
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-e=
ncoder.txt
 create mode 100644 Documentation/driver-api/media/camera-sensor.rst
 create mode 100644 Documentation/driver-api/media/drivers/vidtv.rst
 create mode 100644 Documentation/driver-api/media/drivers/zoran.rst
 create mode 100644 Documentation/userspace-api/media/glossary.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp=
1.rst
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c =3D> mtk_jpeg_dec_hw=
.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h =3D> mtk_jpeg_dec_hw=
.h} (91%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c =3D> mtk_jpeg_dec=
_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h =3D> mtk_jpeg_dec=
_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h =3D> mtk_jpeg_dec_r=
eg.h} (77%)
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.c
 create mode 100644 drivers/media/platform/qcom/venus/dbgfs.h
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.h
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov5693/Kconfig
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2401_system/host/=
ibuf_ctrl_private.h
 delete mode 100644 drivers/staging/media/atomisp/pci/css_2401_system/host/=
isys_dma_local.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/=
host/ibuf_ctrl_public.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/=
ibuf_ctrl.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hive_isp_css_include/=
isys_dma.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2400_system_global=
.h
 delete mode 100644 drivers/staging/media/atomisp/pci/isp2401_system_global=
.h
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v=
4l/pixfmt-meta-rkisp1-params.rst
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v=
4l/pixfmt-meta-rkisp1-stat.rst
 delete mode 100644 drivers/staging/media/usbvision/Kconfig
 delete mode 100644 drivers/staging/media/usbvision/Makefile
 delete mode 100644 drivers/staging/media/usbvision/TODO
 delete mode 100644 drivers/staging/media/usbvision/usbvision-cards.c
 delete mode 100644 drivers/staging/media/usbvision/usbvision-cards.h
 delete mode 100644 drivers/staging/media/usbvision/usbvision-core.c
 delete mode 100644 drivers/staging/media/usbvision/usbvision-i2c.c
 delete mode 100644 drivers/staging/media/usbvision/usbvision-video.c
 delete mode 100644 drivers/staging/media/usbvision/usbvision.h
 create mode 100644 drivers/staging/media/zoran/Kconfig
 create mode 100644 drivers/staging/media/zoran/Makefile
 create mode 100644 drivers/staging/media/zoran/TODO
 create mode 100644 drivers/staging/media/zoran/videocodec.c
 create mode 100644 drivers/staging/media/zoran/videocodec.h
 create mode 100644 drivers/staging/media/zoran/zoran.h
 create mode 100644 drivers/staging/media/zoran/zoran_card.c
 create mode 100644 drivers/staging/media/zoran/zoran_card.h
 create mode 100644 drivers/staging/media/zoran/zoran_device.c
 create mode 100644 drivers/staging/media/zoran/zoran_device.h
 create mode 100644 drivers/staging/media/zoran/zoran_driver.c
 create mode 100644 drivers/staging/media/zoran/zr36016.c
 create mode 100644 drivers/staging/media/zoran/zr36016.h
 create mode 100644 drivers/staging/media/zoran/zr36050.c
 create mode 100644 drivers/staging/media/zoran/zr36050.h
 create mode 100644 drivers/staging/media/zoran/zr36057.h
 create mode 100644 drivers/staging/media/zoran/zr36060.c
 create mode 100644 drivers/staging/media/zoran/zr36060.h

