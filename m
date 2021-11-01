Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C734415B7
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 09:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhKAI7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 04:59:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230520AbhKAI64 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 04:58:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AD0F60F4F;
        Mon,  1 Nov 2021 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635756981;
        bh=WJ340raXOSVXEwu+FSaVIC+uywKukUz8BRo+Azc1GzE=;
        h=Date:From:To:Cc:Subject:From;
        b=Tcy8BXL979VDQ6KqMvteK+NQq7BhdN7knkXSR6tG9OKjrnXGwCHPDlSbbUfQraMY2
         +H7l4N1iVKrqiDOxw3IttSHEoM1Tq8sM9mdqfj3dUetTB/jndQXuQOnjAjlSQUGNv8
         qRHF6vn7Nwd+qh0Hh/IWtIcbKXwgIT84I3+qZKqhBTw+K1Jw7/m1IFfvsNBQ/0E3vw
         UoL7MZkM9Y31LzxVb5xISnJGydI9E6m6qK/2S6Imrrhs0Ca0sof1LFGRhhkP99SsF0
         hVRSua9s8c4sD/BQ3b2j35Jg0kGc1wfOpTdsR5iTul45Mz6FeRcTorkoLhJDtkRY2h
         yUTg+z625vU2A==
Date:   Mon, 1 Nov 2021 08:56:16 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.16-rc1] media updates
Message-ID: <20211101085616.023abb03@sal.lan>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.16-1


For:

  - New driver for SK Hynix Hi-846 8M pixel camera;
  - New driver for the ov13b10 camera;
  - New driver for Renesas R-Car ISP;=20
  - mtk-vcodec gained support for version 2 of decoder firmware ABI;
  - The legacy sir_ir driver got removed;
  - videobuf2: the vb2_mem_ops kAPI had some improvements;
  - lots of cleanups, fixes and new features at device drivers.

The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:

  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.16-1

for you to fetch changes up to 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8:

  media: venus: core: Add sdm660 DT compatible and resource struct (2021-10=
-21 14:26:19 +0100)

----------------------------------------------------------------
media updates for v5.16-rc1

----------------------------------------------------------------
Alexandre Courbot (8):
      media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
      media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
      media: mtk-vcodec: make flush buffer reusable by encoder
      media: mtk-vcodec: venc: support START and STOP commands
      media: mtk-vcodec: vdec: handle firmware version field
      media: mtk-vcodec: support version 2 of decoder firmware ABI
      media: add Mediatek's MM21 format
      media: dt-bindings: media: document mediatek,mt8183-vcodec-dec

Anant Thazhemadam (1):
      media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()

Andrej Shadura (1):
      HID: u2fzero: ignore incomplete packets without data

Andy Shevchenko (6):
      media: ipu3-cio2: Replace open-coded for_each_set_bit()
      media: ipu3-cio2: Use temporary storage for struct device pointer
      media: ipu3-cio2: Switch to use media_entity_to_video_device()
      media: ipu3-cio2: Introduce to_sensor_asd() helper macro
      media: ipu3-cio2: Introduce to_cio2_buffer() helper macro
      media: ipu3-cio2: Introduce to_cio2_device() helper macro

AngeloGioacchino Del Regno (2):
      media: dt-bindings: media: venus: Add sdm660 dt schema
      media: venus: core: Add sdm660 DT compatible and resource struct

Arec Kao (1):
      media: Add sensor driver support for the ov13b10 camera.

Arnd Bergmann (4):
      media: atomisp: restore missing 'return' statement
      media: rcar_drif: select CONFIG_V4L2_ASYNC
      media: omap_vout: use dma_addr_t consistently
      media: i2c: select V4L2_ASYNC where needed

Basavaraj Natikar (1):
      HID: amd_sfh: Fix potential NULL pointer dereference

Benjamin Gaignard (3):
      media: hevc: Add scaling matrix control
      media: hantro: Add scaling lists feature
      media: hantro: Auto generate the AXI ID to avoid conflicts

Bingbu Cao (1):
      media: staging: document that Imgu not output auto-exposure statistics

Cai Huoqing (48):
      media: c8sectpfe-dvb: Remove unused including <linux/version.h>
      media: uvcvideo: Remove unused including <linux/version.h>
      media: am437x: Make use of the helper function devm_platform_ioremap_=
resource()
      media: cadence: Make use of the helper function devm_platform_ioremap=
_resource()
      media: cec: ao-cec: Make use of the helper function devm_platform_ior=
emap_resource()
      media: cec: s5p_cec: Make use of the helper function devm_platform_io=
remap_resource()
      media: coda: Make use of the helper function devm_platform_ioremap_re=
source()
      media: davinci: Make use of the helper function devm_platform_ioremap=
_resource()
      media: exynos-gsc: Make use of the helper function devm_platform_iore=
map_resource()
      media: exynos4-is: Make use of the helper function devm_platform_iore=
map_resource()
      media: imx-jpeg: Make use of the helper function devm_platform_iorema=
p_resource()
      media: imx-pxp: Make use of the helper function devm_platform_ioremap=
_resource()
      media: meson: ge2d: Make use of the helper function devm_platform_ior=
emap_resource()
      media: mtk-jpeg: Make use of the helper function devm_platform_iorema=
p_resource()
      media: mx2_emmaprp: Make use of the helper function devm_platform_ior=
emap_resource()
      media: rc: img-ir: Make use of the helper function devm_platform_iore=
map_resource()
      media: rc: ir-hix5hd2: Make use of the helper function devm_platform_=
ioremap_resource()
      media: rc: meson-ir: Make use of the helper function devm_platform_io=
remap_resource()
      media: rc: mtk-cir: Make use of the helper function devm_platform_ior=
emap_resource()
      media: rc: st_rc: Make use of the helper function devm_platform_iorem=
ap_resource()
      media: rc: sunxi-cir: Make use of the helper function devm_platform_i=
oremap_resource()
      media: rcar-csi2: Make use of the helper function devm_platform_iorem=
ap_resource()
      media: rcar_fdp1: Make use of the helper function devm_platform_iorem=
ap_resource()
      media: rcar_jpu: Make use of the helper function devm_platform_iorema=
p_resource()
      media: renesas-ceu: Make use of the helper function devm_platform_ior=
emap_resource()
      media: rockchip: rga: Make use of the helper function devm_platform_i=
oremap_resource()
      media: s3c-camif: Make use of the helper function devm_platform_iorem=
ap_resource()
      media: s5p-g2d: Make use of the helper function devm_platform_ioremap=
_resource()
      media: s5p-jpeg: Make use of the helper function devm_platform_iorema=
p_resource()
      media: s5p-mfc: Make use of the helper function devm_platform_ioremap=
_resource()
      media: sti: Make use of the helper function devm_platform_ioremap_res=
ource()
      media: stih-cec: Make use of the helper function devm_platform_iorema=
p_resource()
      media: stm32-cec: Make use of the helper function devm_platform_iorem=
ap_resource()
      media: sunxi: Make use of the helper function devm_platform_ioremap_r=
esource()
      media: venus: core : Make use of the helper function devm_platform_io=
remap_resource()
      media: vsp1: Make use of the helper function devm_platform_ioremap_re=
source()
      media: xilinx: Make use of the helper function devm_platform_ioremap_=
resource()
      media: rcar_drif: Make use of the helper function devm_platform_get_a=
nd_ioremap_resource()
      media: vim2m: Remove repeated verbose license text
      media: s3c-camif: Remove unused including <linux/version.h>
      media: usb: stkwebcam: Update the reference count of the usb device s=
tructure
      media: MAINTAINERS: Add linux-renesas-soc mailing list to renesas JPU
      media: staging: media: rkvdec: Make use of the helper function devm_p=
latform_ioremap_resource()
      media: dvb-frontend/mxl692: Remove repeated verbose license text
      media: dvb-frontend/mxl5xx: Remove repeated verbose license text
      media: dvb-frontends/stv6111: Remove repeated verbose license text
      media: dvb-frontends/stv0910: Remove repeated verbose license text
      media: dvb-frontends/cxd2099: Remove repeated verbose license text

Chad Fraleigh (1):
      media: gspca: Limit frame size to sizeimage.

Chen-Yu Tsai (2):
      media: rkvdec: Do not override sizeimage for output format
      media: rkvdec: Support dynamic resolution changes

Christian Hemp (1):
      media: mt9p031: Make pixel clock polarity configurable by DT

Christophe JAILLET (5):
      media: meson-ge2d: Fix rotation parameter changes detection in 'ge2d_=
s_ctrl()'
      media: mtk-vpu: Fix a resource leak in the error handling path of 'mt=
k_vpu_probe()'
      media: imx-jpeg: Fix the error handling path of 'mxc_jpeg_probe()'
      media: pci/ivtv: switch from 'pci_' to 'dma_' API
      media: switch from 'pci_' to 'dma_' API

Colin Ian King (5):
      media: cxd2880-spi: Fix a null pointer dereference on error handling =
path
      media: saa7164: Remove redundant assignment of pointer t
      media: cx23885: Fix snd_card_free call on null card pointer
      media: em28xx: Don't use ops->suspend if it is NULL
      media: mb86a20s: make arrays static const

Dafna Hirschfeld (1):
      media: mtk-vcodec: venc: fix return value when start_streaming fails

Dan Carpenter (3):
      media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()
      media: ivtv: don't allow negative resolutions as module parameters
      media: vivid: fix an error code in vivid_create_instance()

Daniel Almeida (1):
      media: cedrus: fix double free

David Plowman (2):
      media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
      media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control

Deborah Brouwer (1):
      media: vivid: add signal-free time for cec message xfer

Deepak R Varma (1):
      media: staging: media: atomisp: code formatting changes atomisp_csi2.c

Dikshita Agarwal (8):
      media: dt-bindings: media: venus: Add sc7280 dt schema
      media: venus: firmware: enable no tz fw loading for sc7280
      media: venus: core: Add sc7280 DT compatible and resource data
      media: venus: Add num_vpp_pipes to resource structure
      media: venus: hfi: Skip AON register programming for V6 1pipe
      media: venus: vdec: set work route to fw
      media: venus: helpers: update NUM_MBS macro calculation
      media: venus: Set buffer to FW based on FW min count requirement.

Dirk Bender (1):
      media: mt9p031: Fix corrupted frame after restarting stream

Dmitriy Ulitin (1):
      media: stm32: Potential NULL pointer dereference in dcmi_irq_thread()

Enrico Scholz (1):
      media: mt9p031: Read back the real clock rate

Eugen Hristev (1):
      media: atmel: fix the ispck initialization

Evgeny Novikov (5):
      media: ttusb-dec: avoid release of non-acquired mutex
      media: atomisp: Fix error handling in probe
      media: vidtv: Fix memory leak in remove
      HID: amd_sfh: Fix potential NULL pointer dereference
      media: dvb-frontends: mn88443x: Handle errors of clk_prepare_enable()

Ezequiel Garcia (6):
      media: Rename V4L2_PIX_FMT_SUNXI_TILED_NV12 to V4L2_PIX_FMT_NV12_32L32
      media: Rename V4L2_PIX_FMT_HM12 to V4L2_PIX_FMT_NV12_16L16
      media: Add NV12_4L4 tiled format
      media: Clean V4L2_PIX_FMT_NV12MT documentation
      media: Request API is no longer experimental
      media: MAINTAINERS, .mailmap: Update Ezequiel Garcia's email address

F.A.Sulaiman (1):
      HID: betop: fix slab-out-of-bounds Write in betop_probe

Fabian W=C3=BCthrich (1):
      media: ipu3-cio2: Parse sensor orientation and rotation

Fabio Estevam (2):
      media: imx7.rst: Provide an example for imx6ull-evk capture
      media: imx: TODO: Remove items that are already supported

Geert Uytterhoeven (1):
      media: dt-bindings: media: renesas,imr: Convert to json-schema

Gustavo A. R. Silva (1):
      media: staging/intel-ipu3: css: Fix wrong size comparison imgu_css_fw=
_init

Hans Verkuil (8):
      media: cedrus: drop min_buffers_needed.
      media: vivid: add module option to set request support mode
      media: videobuf2-core: sanity checks for requests and qbuf
      media: uvcvideo: Don't spam the log in uvc_ctrl_restore_values()
      media: cec-pin: fix off-by-one SFT check
      media: staging/media/meson: vdec.h: fix kerneldoc warnings
      media: vidtv: move kfree(dvb) to vidtv_bridge_dev_release()
      media: gspca/gl860-mi1320/ov9655: avoid -Wstring-concatenation warning

Heiko Stuebner (10):
      media: rockchip: rkisp1: remove unused irq variable
      media: dt-bindings: media: rkisp1: fix pclk clock-name
      media: dt-bindings: media: rkisp1: document different irq possibiliti=
es
      media: rockchip: rkisp1: allow separate interrupts
      media: rockchip: rkisp1: make some isp-param functions variable
      media: rockchip: rkisp1: make some isp-stats functions variable
      media: rockchip: rkisp1: add prefixes for v10 specific parts
      media: rockchip: rkisp1: add support for v12 isp variants
      media: dt-bindings: media: rkisp1: document px30 isp compatible
      media: rockchip: rkisp1: add support for px30 isp version

Hirokazu Honda (1):
      media: mtk-vcodec: vdec: Support H264 profile control

Hsin-Yi Wang (1):
      media: ov8856: Set default mbus format but allow caller to alter

Irui Wang (4):
      media: mtk-vcodec: Clean redundant encoder format definition
      media: dt-bindings: media: mtk-vcodec: Add binding for MT8195 VENC
      media: mtk-vcodec: Add MT8195 H264 venc driver
      media: mtk-vcodec: MT8173 h264/vp8 encoder min/max bitrate settings

Jackie Liu (1):
      watchdog/sb_watchdog: fix compilation problem due to COMPILE_TEST

Jammy Huang (2):
      media: aspeed: refine to avoid full jpeg update
      media: aspeed: add debugfs

Jeff Chase (1):
      media: MAINTAINERS: update maintainer for ch7322 driver

Jernej Skrabec (5):
      media: cedrus: hevc: Add support for scaling lists
      media: hantro: Fix check for single irq
      media: cedrus: Add H265 10-bit capability flag
      media: cedrus: add check for H264 and H265 limitations
      media: cedrus: Don't kernel map most buffers

Joshua-Dickens (1):
      HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) device IDs

Kees Cook (3):
      media: radio-wl1273: Avoid card name truncation
      media: si470x: Avoid card name truncation
      media: tm6000: Avoid card name truncation

Kieran Bingham (3):
      media: vsp1: Fix WPF macro names
      media: vsp1: Simplify DRM UIF handling
      media: vsp1: Add support for the V3U VSPD

Krzysztof Ha=C5=82asa (5):
      media: TDA1997x: fix tda1997x_remove()
      media: TDA1997x: replace video detection routine
      media: Add ADV7610 support for adv7604 driver - DT docs.
      media: Add ADV7610 support for adv7604 driver.
      media: i.MX6: Support 16-bit BT.1120 video input

Krzysztof Kozlowski (1):
      media: imx: drop unneeded MODULE_ALIAS

Linus Torvalds (1):
      vboxfs: fix broken legacy mount signature checking

Linus Walleij (1):
      media: cxd2820r: include the right header

Liu Shixin (1):
      media: pvrusb2: Replaced simple_strtol() with kstrtoint()

Mansur Alisha Shaik (4):
      media: venus: helper: change log level for false warning message
      media: venus: vdec: update output buffer size during vdec_s_fmt()
      media: venus: fix vpp frequency calculation for decoder
      media: venus: vdec: decoded picture buffer handling during reconfig s=
equence

Martin Kepplinger (6):
      media: hantro: Fix media device bus_info string
      media: imx: set a media_device bus_info string
      media: dt-bindings: vendor-prefixes: Add SK Hynix Inc.
      media: dt-bindings: media: document SK Hynix Hi-846 MIPI CSI-2 8M pix=
el sensor
      media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera
      media: Documentation: i2c-cardlist: add the Hynix hi846 sensor

Mauro Carvalho Chehab (1):
      Merge tag 'v5.15-rc4' into media_tree

Michael Tretter (13):
      media: allegro: ignore interrupt if mailbox is not initialized
      media: allegro: fix module removal if initialization failed
      media: allegro: lookup VCU settings
      media: allegro: add pm_runtime support
      media: allegro: add encoder buffer support
      media: allegro: add control to disable encoder buffer
      media: allegro: fix row and column in response message
      media: allegro: remove external QP table
      media: allegro: correctly scale the bit rate in SPS
      media: allegro: extract nal value lookup functions to header
      media: allegro: write correct colorspace into SPS
      media: allegro: nal-hevc: implement generator for vui
      media: allegro: write vui parameters for HEVC

Mirela Rabulea (4):
      media: imx-jpeg: Fix possible null pointer dereference
      media: imx-jpeg: Fix occasional decoder fail on jpegs without DHT
      media: imx-jpeg: Remove soft reset between frames encoding
      media: imx-jpeg: Add pm-runtime support for imx-jpeg

Mizuho Mori (1):
      HID: apple: Fix logical maximum and usage maximum of Magic Keyboard J=
IS

Muhammad Usama Anjum (1):
      media: siano: use DEFINE_MUTEX() for mutex lock

Nadezda Lutovinova (2):
      media: s5p-mfc: Add checking to s5p_mfc_probe().
      media: rcar-csi2: Add checking to rcsi2_start_receiver()

Nicolas Dufresne (1):
      media: cedrus: Fix SUNXI tile size calculation

Niklas S=C3=B6derlund (19):
      media: dt-bindings: media: renesas,csi2: Add r8a779a0 support
      media: rcar-csi2: Add r8a779a0 support
      media: rcar-vin: Refactor controls creation for video device
      media: rcar-vin: Fix error paths for rvin_mc_init()
      media: rcar-vin: Improve async notifier cleanup paths
      media: rcar-vin: Improve reuse of parallel notifier
      media: rcar-vin: Rename array storing subdevice information
      media: rcar-vin: Move group async notifier
      media: rcar-vin: Extend group notifier DT parser to work with any port
      media: rcar-vin: Create a callback to setup media links
      media: rcar-vin: Specify media device ops at group creation time
      media: rcar-vin: Move and rename CSI-2 link notifications
      media: rcar-vin: Add r8a779a0 support
      media: rcar-vin: Remove explicit device availability check
      media: v4l2-fwnode: Simplify v4l2_async_nf_parse_fwnode_endpoints()
      media: rcar-vin: Use user provided buffers when starting
      media: rcar-csi2: Cleanup mutex on remove and fail
      media: rcar-csi2: Serialize access to set_fmt and get_fmt
      media: rcar-isp: Add Renesas R-Car Image Signal Processor driver

Nil Yi (3):
      media: rc: clean the freed urb pointer to avoid double free
      media: usb: airspy: clean the freed pointer and counter
      media: rtl2832_sdr: clean the freed pointer and counter

N=C3=ADcolas F. R. A. Prado (1):
      media: ipu3.rst: Improve header formatting on tables

Ondrej Jirman (1):
      media: sun6i-csi: Allow the video device to be open multiple times

Pavel Skripkin (3):
      media: em28xx: add missing em28xx_close_extension
      media: dvb-usb: fix ununit-value in az6027_rc_query
      media: mxl111sf: change mutex_init() location

Pedro Terra (1):
      media: vimc: Enable set resolution at the scaler src pad

Pete Hemery (1):
      media: gspca/sn9c20x: Add ability to control built-in webcam LEDs

Rajat Asthana (1):
      media: mceusb: return without resubmitting URB in case of -EPROTO err=
or.

Randy Dunlap (4):
      media: i2c: ths8200 needs V4L2_ASYNC
      media: s5p-jpeg: rename JPEG marker constants to prevent build warnin=
gs
      media: CEC: keep related menu entries together
      media: ivtv: fix build for UML

Ricardo Ribalda (24):
      media: v4l2-ioctl: Fix check_ext_ctrls
      media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
      media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
      media: v4l2-ioctl: S_CTRL output the right value
      media: uvcvideo: Remove s_ctrl and g_ctrl
      media: uvcvideo: Set capability in s_param
      media: uvcvideo: Return -EIO for control errors
      media: uvcvideo: refactor __uvc_ctrl_add_mapping
      media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
      media: uvcvideo: Use dev->name for querycap()
      media: uvcvideo: Set unique vdev name based in type
      media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
      media: uvcvideo: Use control names from framework
      media: uvcvideo: Check controls flags before accessing them
      media: uvcvideo: Set error_idx during ctrl_commit errors
      media: docs: Document the behaviour of uvcvideo driver
      media: ipu3-cio2 Check num_planes and sizes in queue_setup
      media: ipu3-imgu: Refactor bytesperpixel calculation
      media: ipu3-imgu: Set valid initial format
      media: ipu3-imgu: imgu_fmt: Handle properly try
      media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
      media: dw9714: Add implementation for events
      media: ov13858: Add implementation for events
      media: ov5670: Add implementation for events

Rikard Falkeborn (2):
      media: hantro: Constify static struct v4l2_m2m_ops
      media: staging/intel-ipu3: Constify static struct v4l2_subdev_interna=
l_ops

Robert Foss (5):
      media: camss: vfe: Don't read hardware version needlessly
      media: camss: vfe: Decrease priority of of VFE HW version to 'dbg'
      media: camss: vfe: Remove vfe_hw_version_read() argument
      media: camss: vfe: Rework vfe_hw_version_read() function definition
      media: camss: vfe: Don't call hw_version() before its dependencies ar=
e met

Sakari Ailus (3):
      media: v4l: async: Rename async nf functions, clean up long lines
      media: imx258: Fix getting clock frequency
      media: admin-guide: Update i2c-cardlist

Scott K Logan (1):
      media: saa7134: Add support for Leadtek WinFast HDTV200 H

Sean Young (12):
      media: mceusb: ensure rx resolution can be retrieved
      media: streamzap: ensure rx resolution can be retrieved
      media: ir_toy: allow tx carrier to be set
      media: ir-kbd-i2c: improve responsiveness of hauppauge zilog receivers
      media: ir_toy: print firmware version in correct format
      media: ir_toy: deal with residual irdata before expected response
      media: ir_toy: do not resubmit broken urb
      media: ir_toy: prevent device from hanging during transmit
      media: remove myself from dvb media maintainers
      media: ir_toy: assignment to be16 should be of correct type
      media: sir_ir: remove broken driver
      media: ite-cir: IR receiver stop working after receive overflow

Seongyong Park (1):
      media: video-i2c: more precise intervals between frames

Sergey Senozhatsky (9):
      media: videobuf2: rework vb2_mem_ops API
      media: videobuf2: inverse buffer cache_hints flags
      media: videobuf2: split buffer cache_hints initialisation
      media: videobuf2: move cache_hints handling to allocators
      media: videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
      media: videobuf2: add queue memory coherency parameter
      media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag
      media: videobuf2: handle non-contiguous DMA allocations
      media: videobuf2: always set buffer vb2 pointer

Shaokun Zhang (1):
      media: m5602_ov7660: remove the repeated declaration

Stanimir Varbanov (5):
      media: venus: venc: Use pmruntime autosuspend
      media: venus: Make sys_error flag an atomic bitops
      media: venus: hfi: Check for sys error on session hfi functions
      media: venus: helpers: Add helper to mark fatal vb2 error
      media: venus: Handle fatal errors during encoding and decoding

Stefan Riedmueller (3):
      media: mt9p031: Use BIT macro
      media: dt-bindings: mt9p031: Convert bindings to yaml
      media: dt-bindings: mt9p031: Add missing required properties

Tom Rix (2):
      media: TDA1997x: handle short reads of hdmi info frame.
      media: camss: vfe: simplify vfe_get_wm_sizes()

Tuo Li (1):
      media: s5p-mfc: fix possible null-pointer dereference in s5p_mfc_prob=
e()

Tzung-Bi Shih (1):
      media: mtk-vcodec: fix warnings: symbol XXX was not declared

Vladimir Barinov (2):
      media: rcar-vin: add GREY format
      media: rcar-vin: add G/S_PARM ioctls

Yajun Deng (1):
      media: v4l2-dev.h: move open brace after struct video_device

Yizhuo (1):
      media: staging: atomisp: fix the uninitialized use in gc2235_detect()

Yunfei Dong (5):
      media: mtk-vcodec: vdec: move stateful ops into their own file
      media: mtk-vcodec: vdec: support stateless API
      media: mtk-vcodec: vdec: support stateless H.264 decoding
      media: mtk-vcodec: vdec: add media device if using stateless api
      media: mtk-vcodec: enable MT8183 decoder

Zev Weiss (1):
      media: aspeed-video: ignore interrupts that aren't enabled

Zheyu Ma (1):
      media: netup_unidvb: handle interrupt properly according to the firmw=
are

jing yangyang (1):
      media: meson-ir-tx: fix platform_no_drv_owner.cocci warnings

lijian (2):
      media: tuners: mxl5007t: Removed unnecessary 'return'
      media: via-camera: deleted these redundant semicolons

zhaoxiao (1):
      media: Media: meson: vdec: Use devm_platform_ioremap_resource_byname()

 .mailmap                                           |    1 +
 Documentation/admin-guide/media/i2c-cardlist.rst   |    8 +-
 Documentation/admin-guide/media/imx7.rst           |   60 +
 Documentation/admin-guide/media/ipu3.rst           |   14 +-
 Documentation/admin-guide/media/ivtv.rst           |    2 +-
 Documentation/admin-guide/media/vimc.rst           |   20 +-
 .../devicetree/bindings/media/i2c/adv7604.yaml     |   13 +-
 .../bindings/media/i2c/aptina,mt9p031.yaml         |  108 +
 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |  120 ++
 .../devicetree/bindings/media/i2c/mt9p031.txt      |   40 -
 .../devicetree/bindings/media/mediatek-vcodec.txt  |    2 +
 .../bindings/media/qcom,sc7280-venus.yaml          |  162 ++
 .../bindings/media/qcom,sdm660-venus.yaml          |  186 ++
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 .../devicetree/bindings/media/renesas,imr.txt      |   31 -
 .../devicetree/bindings/media/renesas,imr.yaml     |   67 +
 .../devicetree/bindings/media/rockchip-isp1.yaml   |  114 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/driver-api/media/drivers/rkisp1.rst  |   43 +
 .../driver-api/media/maintainer-entry-profile.rst  |    2 +-
 Documentation/driver-api/media/v4l2-subdev.rst     |   14 +-
 .../userspace-api/media/drivers/cx2341x-uapi.rst   |    8 +-
 Documentation/userspace-api/media/v4l/buffer.rst   |   40 +-
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |   57 +
 .../media/v4l/ext-ctrls-image-source.rst           |   20 +
 .../userspace-api/media/v4l/pixfmt-reserved.rst    |   29 +-
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   50 +-
 .../userspace-api/media/v4l/vidioc-create-bufs.rst |    7 +-
 .../userspace-api/media/v4l/vidioc-g-ctrl.rst      |    3 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |    3 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |    6 +
 .../userspace-api/media/v4l/vidioc-reqbufs.rst     |   16 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    2 +
 MAINTAINERS                                        |   24 +-
 drivers/gpu/ipu-v3/ipu-csi.c                       |   31 +-
 drivers/media/cec/Kconfig                          |    4 +
 drivers/media/cec/core/cec-pin.c                   |    4 +-
 drivers/media/cec/platform/meson/ao-cec-g12a.c     |    4 +-
 drivers/media/cec/platform/meson/ao-cec.c          |    4 +-
 drivers/media/cec/platform/s5p/s5p_cec.c           |    4 +-
 drivers/media/cec/platform/sti/stih-cec.c          |    4 +-
 drivers/media/cec/platform/stm32/stm32-cec.c       |    4 +-
 drivers/media/common/siano/smscoreapi.c            |    7 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |  149 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |  198 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |   39 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |   59 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |   30 +-
 drivers/media/dvb-core/dvb_vb2.c                   |    2 +-
 drivers/media/dvb-frontends/cxd2099.c              |    9 -
 drivers/media/dvb-frontends/cxd2099.h              |    9 -
 drivers/media/dvb-frontends/cxd2820r_priv.h        |    2 +-
 drivers/media/dvb-frontends/mb86a20s.c             |    4 +-
 drivers/media/dvb-frontends/mn88443x.c             |   18 +-
 drivers/media/dvb-frontends/mxl5xx.c               |    9 -
 drivers/media/dvb-frontends/mxl5xx.h               |    9 -
 drivers/media/dvb-frontends/mxl5xx_defs.h          |    4 -
 drivers/media/dvb-frontends/mxl5xx_regs.h          |   10 -
 drivers/media/dvb-frontends/mxl692.c               |    9 -
 drivers/media/dvb-frontends/mxl692.h               |    9 -
 drivers/media/dvb-frontends/mxl692_defs.h          |    9 -
 drivers/media/dvb-frontends/rtl2832_sdr.c          |    5 +-
 drivers/media/dvb-frontends/stv0910.c              |    9 -
 drivers/media/dvb-frontends/stv0910.h              |    9 -
 drivers/media/dvb-frontends/stv6111.c              |    9 -
 drivers/media/dvb-frontends/stv6111.h              |    9 -
 drivers/media/firewire/firedtv-avc.c               |   14 +-
 drivers/media/firewire/firedtv-ci.c                |    2 +
 drivers/media/i2c/Kconfig                          |   27 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/adv7604.c                        |   15 +-
 drivers/media/i2c/dw9714.c                         |   14 +-
 drivers/media/i2c/hi846.c                          | 2190 ++++++++++++++++=
++++
 drivers/media/i2c/imx258.c                         |   12 +-
 drivers/media/i2c/ir-kbd-i2c.c                     |    1 +
 drivers/media/i2c/max9286.c                        |   17 +-
 drivers/media/i2c/mt9p031.c                        |   80 +-
 drivers/media/i2c/ov13858.c                        |   11 +-
 drivers/media/i2c/ov13b10.c                        | 1491 +++++++++++++
 drivers/media/i2c/ov5670.c                         |   11 +-
 drivers/media/i2c/ov8856.c                         |   83 +-
 drivers/media/i2c/st-mipid02.c                     |   22 +-
 drivers/media/i2c/tda1997x.c                       |  131 +-
 drivers/media/i2c/tda1997x_regs.h                  |    3 +
 drivers/media/i2c/video-i2c.c                      |   21 +-
 drivers/media/mc/Kconfig                           |    8 -
 drivers/media/pci/cobalt/cobalt-driver.c           |    4 +-
 drivers/media/pci/cx18/cx18-driver.c               |    2 +-
 drivers/media/pci/cx18/cx18-ioctl.c                |    4 +-
 drivers/media/pci/cx18/cx18-queue.c                |   13 +-
 drivers/media/pci/cx18/cx18-streams.c              |   24 +-
 drivers/media/pci/cx23885/cx23885-alsa.c           |    3 +-
 drivers/media/pci/ddbridge/ddbridge-main.c         |    4 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |   60 +-
 drivers/media/pci/intel/ipu3/cio2-bridge.h         |    9 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |  274 ++-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |    4 +
 drivers/media/pci/ivtv/ivtv-driver.c               |    2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |    8 +-
 drivers/media/pci/ivtv/ivtv-queue.c                |   18 +-
 drivers/media/pci/ivtv/ivtv-streams.c              |   22 +-
 drivers/media/pci/ivtv/ivtv-udma.c                 |   19 +-
 drivers/media/pci/ivtv/ivtv-yuv.c                  |   10 +-
 drivers/media/pci/ivtv/ivtvfb.c                    |   12 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c |   29 +-
 drivers/media/pci/pluto2/pluto2.c                  |   20 +-
 drivers/media/pci/pt1/pt1.c                        |    2 +-
 drivers/media/pci/saa7134/saa7134-cards.c          |   53 +
 drivers/media/pci/saa7134/saa7134-dvb.c            |   29 +
 drivers/media/pci/saa7134/saa7134.h                |    1 +
 drivers/media/pci/saa7164/saa7164-api.c            |    2 -
 drivers/media/pci/tw5864/tw5864-core.c             |    2 +-
 drivers/media/platform/Kconfig                     |   20 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/allegro-dvt/allegro-core.c  |  311 ++-
 drivers/media/platform/allegro-dvt/allegro-mail.c  |   23 +-
 drivers/media/platform/allegro-dvt/allegro-mail.h  |   10 +-
 drivers/media/platform/allegro-dvt/nal-h264.c      |   74 -
 drivers/media/platform/allegro-dvt/nal-h264.h      |  200 +-
 drivers/media/platform/allegro-dvt/nal-hevc.c      |  202 +-
 drivers/media/platform/allegro-dvt/nal-hevc.h      |  189 +-
 drivers/media/platform/am437x/am437x-vpfe.c        |   23 +-
 drivers/media/platform/aspeed-video.c              |  133 +-
 drivers/media/platform/atmel/atmel-isc-base.c      |   29 +-
 drivers/media/platform/atmel/atmel-isc.h           |    2 +
 drivers/media/platform/atmel/atmel-isi.c           |   17 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |   54 +-
 drivers/media/platform/atmel/atmel-sama7g5-isc.c   |   37 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   18 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       |    4 +-
 drivers/media/platform/coda/imx-vdoa.c             |    3 +-
 drivers/media/platform/davinci/vpbe_venc.c         |    9 +-
 drivers/media/platform/davinci/vpif.c              |    5 +-
 drivers/media/platform/davinci/vpif_capture.c      |   21 +-
 drivers/media/platform/davinci/vpss.c              |   10 +-
 drivers/media/platform/exynos-gsc/gsc-core.c       |    3 +-
 drivers/media/platform/exynos4-is/media-dev.c      |   20 +-
 drivers/media/platform/exynos4-is/mipi-csis.c      |    4 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c         |  109 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.h         |    2 +
 drivers/media/platform/imx-pxp.c                   |    4 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |    9 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   10 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c   |    6 +-
 drivers/media/platform/meson/ge2d/ge2d.c           |   10 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    |    4 +-
 drivers/media/platform/mtk-vcodec/Makefile         |    3 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  820 ++------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h |   27 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |   65 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c  |  628 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateless.c |  360 ++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |   59 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |  148 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |   75 +-
 .../platform/mtk-vcodec/vdec/vdec_h264_req_if.c    |  774 +++++++
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c    |    3 +
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h    |    1 +
 drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h   |   23 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c    |   43 +-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h    |    5 +
 drivers/media/platform/mtk-vpu/mtk_vpu.c           |    5 +-
 drivers/media/platform/mx2_emmaprp.c               |    4 +-
 drivers/media/platform/omap/omap_vout.c            |   18 +-
 drivers/media/platform/omap/omap_vout_vrfb.c       |    2 +-
 drivers/media/platform/omap/omap_voutdef.h         |    2 +-
 drivers/media/platform/omap3isp/isp.c              |   21 +-
 drivers/media/platform/pxa_camera.c                |   26 +-
 drivers/media/platform/qcom/camss/camss-vfe-170.c  |    9 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |   28 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |   18 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  |   17 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |    4 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |    2 +-
 drivers/media/platform/qcom/camss/camss.c          |   18 +-
 drivers/media/platform/qcom/venus/core.c           |  135 +-
 drivers/media/platform/qcom/venus/core.h           |    9 +-
 drivers/media/platform/qcom/venus/firmware.c       |   42 +-
 drivers/media/platform/qcom/venus/helpers.c        |   81 +-
 drivers/media/platform/qcom/venus/helpers.h        |    4 +
 drivers/media/platform/qcom/venus/hfi.c            |   48 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |    7 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |   14 +
 drivers/media/platform/qcom/venus/hfi_msgs.c       |    7 +
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |    6 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |   13 -
 drivers/media/platform/qcom/venus/hfi_platform.h   |    2 -
 .../media/platform/qcom/venus/hfi_platform_v6.c    |    6 -
 drivers/media/platform/qcom/venus/hfi_venus.c      |    4 +
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |    2 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   13 +-
 drivers/media/platform/qcom/venus/vdec.c           |   67 +-
 drivers/media/platform/qcom/venus/venc.c           |  116 +-
 drivers/media/platform/rcar-isp.c                  |  515 +++++
 drivers/media/platform/rcar-vin/rcar-core.c        | 1077 +++++-----
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  241 ++-
 drivers/media/platform/rcar-vin/rcar-dma.c         |   40 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   25 +
 drivers/media/platform/rcar-vin/rcar-vin.h         |   25 +-
 drivers/media/platform/rcar_drif.c                 |   17 +-
 drivers/media/platform/rcar_fdp1.c                 |    4 +-
 drivers/media/platform/rcar_jpu.c                  |    4 +-
 drivers/media/platform/renesas-ceu.c               |   33 +-
 drivers/media/platform/rockchip/rga/rga.c          |    5 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |    9 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   44 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   98 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |   29 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |  557 ++++-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  406 ++--
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  107 +-
 drivers/media/platform/s3c-camif/camif-core.c      |    6 +-
 drivers/media/platform/s5p-g2d/g2d.c               |    4 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c        |    5 +-
 drivers/media/platform/s5p-mfc/s5p_mfc.c           |    9 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c      |    3 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-core.c  |    1 -
 .../media/platform/sti/c8sectpfe/c8sectpfe-dvb.c   |    1 -
 drivers/media/platform/sti/hva/hva-hw.c            |    4 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |   37 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |   16 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |   33 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h |    2 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |    8 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    4 +-
 drivers/media/platform/ti-vpe/cal.c                |   16 +-
 drivers/media/platform/via-camera.c                |    6 +-
 drivers/media/platform/video-mux.c                 |   17 +-
 drivers/media/platform/vsp1/vsp1_drm.c             |    8 +-
 drivers/media/platform/vsp1/vsp1_drv.c             |   18 +-
 drivers/media/platform/vsp1/vsp1_regs.h            |   11 +-
 drivers/media/platform/vsp1/vsp1_wpf.c             |    2 +-
 drivers/media/platform/xilinx/xilinx-vip.c         |    4 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |   17 +-
 drivers/media/radio/radio-wl1273.c                 |    2 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c      |    2 +-
 drivers/media/radio/si470x/radio-si470x-usb.c      |    2 +-
 drivers/media/rc/Kconfig                           |    8 -
 drivers/media/rc/Makefile                          |    1 -
 drivers/media/rc/img-ir/img-ir-core.c              |    4 +-
 drivers/media/rc/imon.c                            |    2 +
 drivers/media/rc/ir-hix5hd2.c                      |    4 +-
 drivers/media/rc/ir_toy.c                          |   63 +-
 drivers/media/rc/ite-cir.c                         |    2 +-
 drivers/media/rc/mceusb.c                          |    2 +
 drivers/media/rc/meson-ir-tx.c                     |    1 -
 drivers/media/rc/meson-ir.c                        |    4 +-
 drivers/media/rc/mtk-cir.c                         |    4 +-
 drivers/media/rc/sir_ir.c                          |  438 ----
 drivers/media/rc/st_rc.c                           |    5 +-
 drivers/media/rc/streamzap.c                       |    1 +
 drivers/media/rc/sunxi-cir.c                       |    4 +-
 drivers/media/spi/cxd2880-spi.c                    |    2 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |    4 +
 drivers/media/test-drivers/vim2m.c                 |    5 -
 drivers/media/test-drivers/vimc/vimc-scaler.c      |  366 ++--
 drivers/media/test-drivers/vivid/vivid-cec.c       |  341 +--
 drivers/media/test-drivers/vivid/vivid-cec.h       |    9 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |   52 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |   23 +-
 drivers/media/tuners/mxl5007t.c                    |    9 -
 drivers/media/tuners/tuner-types.c                 |    4 +
 drivers/media/usb/airspy/airspy.c                  |    5 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c            |   16 +-
 drivers/media/usb/dvb-usb/az6027.c                 |    1 +
 drivers/media/usb/dvb-usb/dibusb-common.c          |    2 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |   12 +-
 drivers/media/usb/em28xx/em28xx-core.c             |    5 +-
 drivers/media/usb/gspca/gl860/gl860-mi1320.c       |   87 +-
 drivers/media/usb/gspca/gl860/gl860-ov9655.c       |  169 +-
 drivers/media/usb/gspca/gspca.c                    |    2 +
 drivers/media/usb/gspca/m5602/m5602_ov7660.h       |    1 -
 drivers/media/usb/gspca/sn9c20x.c                  |   22 +-
 drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |   25 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |    4 -
 drivers/media/usb/stkwebcam/stk-webcam.c           |   11 +-
 drivers/media/usb/tm6000/tm6000-video.c            |    3 +-
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |   10 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |  260 ++-
 drivers/media/usb/uvc/uvc_driver.c                 |   16 +-
 drivers/media/usb/uvc/uvc_metadata.c               |    2 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  103 +-
 drivers/media/usb/uvc/uvc_video.c                  |    5 +
 drivers/media/usb/uvc/uvcvideo.h                   |   17 +-
 drivers/media/v4l2-core/v4l2-async.c               |  168 +-
 drivers/media/v4l2-core/v4l2-common.c              |    3 +
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |    9 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |    6 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |    5 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |   83 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   77 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c |   37 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c      |    2 +
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   70 +-
 .../pci/hive_isp_css_common/host/input_system.c    |    2 +
 drivers/staging/media/hantro/hantro_drv.c          |   12 +-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c  |    2 +-
 drivers/staging/media/hantro/hantro_g1_regs.h      |    2 +
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c   |    3 +-
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c  |   52 +
 drivers/staging/media/hantro/hantro_hevc.c         |   21 +
 drivers/staging/media/hantro/hantro_hw.h           |    4 +
 drivers/staging/media/imx/TODO                     |    5 -
 drivers/staging/media/imx/imx-media-csi.c          |   23 +-
 drivers/staging/media/imx/imx-media-dev-common.c   |    9 +-
 drivers/staging/media/imx/imx-media-dev.c          |    6 +-
 drivers/staging/media/imx/imx-media-of.c           |    6 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |   17 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   24 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   16 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c       |   16 +-
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |    7 +-
 drivers/staging/media/ipu3/ipu3-css-fw.c           |    7 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |    2 +-
 drivers/staging/media/ipu3/ipu3-css.c              |   19 +-
 drivers/staging/media/ipu3/ipu3-css.h              |    1 -
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   13 +-
 drivers/staging/media/ipu3/ipu3.h                  |   12 +
 drivers/staging/media/meson/vdec/esparser.h        |    6 +-
 drivers/staging/media/meson/vdec/vdec.c            |    7 +-
 drivers/staging/media/meson/vdec/vdec.h            |   16 +-
 drivers/staging/media/meson/vdec/vdec_helpers.h    |    3 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c         |    5 +-
 drivers/staging/media/rkvdec/rkvdec.c              |   44 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   56 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    2 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |    2 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |  113 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   |  100 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |    2 +
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |    7 +-
 drivers/staging/media/tegra-video/vi.c             |   17 +-
 include/media/hevc-ctrls.h                         |   11 +
 include/media/i2c/mt9p031.h                        |    1 +
 include/media/tuner.h                              |    1 +
 include/media/v4l2-async.h                         |  105 +-
 include/media/v4l2-dev.h                           |    3 +-
 include/media/v4l2-fwnode.h                        |   12 +-
 include/media/videobuf2-core.h                     |   59 +-
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |   31 +-
 342 files changed, 14211 insertions(+), 4856 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p=
031.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/hynix,hi846=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-ven=
us.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-ven=
us.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,imr.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,imr.yaml
 create mode 100644 Documentation/driver-api/media/drivers/rkisp1.rst
 create mode 100644 drivers/media/i2c/hi846.c
 create mode 100644 drivers/media/i2c/ov13b10.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_statef=
ul.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_statel=
ess.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if=
.c
 create mode 100644 drivers/media/platform/rcar-isp.c
 delete mode 100644 drivers/media/rc/sir_ir.c

