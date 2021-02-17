Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7C131DB95
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 15:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhBQOlc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 09:41:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233381AbhBQOl2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 09:41:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7E0D64E02;
        Wed, 17 Feb 2021 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613572846;
        bh=vK5hYHCmmghUns6lQGx4m/dNFg/hAGQcXax1IqfoMxU=;
        h=Date:From:To:Cc:Subject:From;
        b=o3vFaCTXWJh0DC6bayUjKkCCthqFImOBKrgygOPdGZwAwOeFu77aW6DjlBNmzTdx9
         F+/PHBGdYgvXRLKcqQPRgdcyu8OY+k0vVXHv4QNZfqImgtSNt0iPlKRfo/VPWe12oA
         +q9XBTWTqxA5MVUMfoGQlvoJoEeX2GUy676m4rQPV7ZP3TFZBS1OHUbK9gXNZciNe9
         xUXebPYiShX4JPRPAqE+khGWEDNj4D+Mbmbm02jaBirSf/WtkYfLoOf9ccAiNkjF6r
         NvglNuG4T4A0qwUtNKP5XH9d3yPNRIMfx7s+6m5sqaI5cUQvJD5lRm0OHbv9BAdkIK
         O9hXSZwRDP6eQ==
Date:   Wed, 17 Feb 2021 15:40:40 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.12-rc1] media updates
Message-ID: <20210217154040.46145543@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.12-1

For:

- some core fixes at VB2 mem2mem support;
- some improvements and cleanups at V4L2 async kAPI;
- newer controls at V4L2 API for H-264 and HEVC codecs;
- allegro-dvt driver was promoted from staging;
- new i2c sendor drivers: imx334, ov5648, ov8865
- new automobile camera module: rdacm21
- ipu3 cio2 driver started gained support for some ACPI BIOSes;
- new ATSC frontend: MaxLinear mxl692 VSB tuner/demod;
- the SMIA/CCS driver gained more support for CSS standard;
- several driver fixes, updates and improvements.

---

Regards,
Mauro

The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:

  Linux 5.11-rc6 (2021-01-31 13:50:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.12-1

for you to fetch changes up to 8f202f8e9ff38e29694a4bc0a519b4e03c1726ee:

  media: v4l: async: Fix kerneldoc documentation for async functions (2021-=
02-15 16:21:54 +0100)

----------------------------------------------------------------
media updates for v5.12-rc1

----------------------------------------------------------------
Alexandre Courbot (4):
      media: videobuf2: always call poll_wait() on queues
      media: v4l2-mem2mem: always call poll_wait() on queues
      media: venus: use contig vb2 ops
      media: venus: preserve DRC state across seeks

Andrey Konovalov (1):
      media: i2c: imx219: Implement V4L2_CID_LINK_FREQ control

Andy Shevchenko (2):
      media: ipu3-cio2: Build only for x86
      media: ipu3-cio2: Add headers that ipu3-cio2.h is direct user of

Arnd Bergmann (2):
      media: ti-vpe: cal: avoid FIELD_GET assertion
      media: rc: select CONFIG_BITREVERSE where needed

Brad Love (4):
      media: mxl692: MaxLinear 692 ATSC demod/tuner driver
      media: em28xx-core: Fix TS2 active led
      media: em28xx-core: Fix i2c error debug
      media: em28xx: Add support for Hauppauge USB QuadHD

Christophe JAILLET (4):
      media: vsp1: Fix an error handling path in the probe function
      media: saa7164: switch from 'pci_' to 'dma_' API
      media: cx25821: Fix a bug when reallocating some dma memory
      media: smipcie: switch from 'pci_' to 'dma_' API

Colin Ian King (2):
      media: venus: Fix uninitialized variable count being checked for zero
      media: i2c: fix spelling mistakes: "enpoint" -> "endpoint"

Dan Carpenter (6):
      media: allegro: Fix use after free on error
      media: camss: Fix signedness bug in video_enum_fmt()
      media: camss: missing error code in msm_video_register()
      media: atomisp: Fix a buffer overflow in debug code
      media: zr364xx: fix memory leaks in probe()
      media: i2c: ov5648: remove unnecessary NULL check

Daniel Scally (13):
      media: software_node: Fix refcounts in software_node_get_next_child()
      media: device property: Return true in fwnode_device_is_available for=
 NULL ops
      media: device property: Call fwnode_graph_get_endpoint_by_id() for fw=
node->secondary
      media: software_node: Enforce parent before child ordering of nodes a=
rrays
      media: software_node: unregister software_nodes in reverse order
      media: device property: Define format macros for ports and endpoints
      media: lib/test_printf.c: Use helper function to unwind array of soft=
ware_nodes
      media: ipu3-cio2: Add T: entry to MAINTAINERS
      media: ipu3-cio2: Rename ipu3-cio2.c
      media: v4l2-core: v4l2-async: Check sd->fwnode->secondary in match_fw=
node()
      media: ACPI / bus: Add acpi_dev_get_next_match_dev() and helper macro
      media: v4l2-fwnode: Include v4l2_fwnode_bus_type
      media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver

Daniel W. S. Almeida (6):
      media: vidtv: psi: fix missing crc for PMT
      media: vidtv: remove unused field from 'struct vidtv_mpeg_ts'
      media: vidtv: Add media controller support
      media: vidtv: reinstate sysfs bind attrs
      media: vidtv: use a simpler name in platform_{device|driver}
      media: vidtv: print message when driver is removed

Dave Stevenson (8):
      media: ov5647: Add support for PWDN GPIO.
      media: ov5647: Add support for non-continuous clock mode
      media: ov5647: Add set_fmt and get_fmt calls.
      media: ov5647: Add support for get_selection()
      media: ov5647: Set V4L2_SUBDEV_FL_HAS_EVENTS flag
      media: ov5647: Support V4L2_CID_PIXEL_RATE
      media: ov5647: Support V4L2_CID_VBLANK control
      media: ov5647: Advertise the correct exposure range

David Plowman (1):
      media: ov5647: Support gain, exposure and AWB controls

Dikshita Agarwal (9):
      media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
      media: v4l2-ctrl: Add layer wise bitrate controls for h264
      media: venus: venc: Add support for frame-specific min/max qp controls
      media: v4l2-ctrl: Add base layer priority id control.
      media: venus: venc : Add support for priority ID control.
      media: venus: core: add support to dump FW region
      media: venus: venc: fix handlig of S_SELECTION and G_SELECTION
      media: venus: venc: set inband mode property to FW.
      media: venus: venc: set IDR period to FW only for H264 & HEVC

Dinghao Liu (3):
      media: em28xx: Fix use-after-free in em28xx_alloc_urbs
      media: media/pci: Fix memleak in empress_init
      media: tm6000: Fix memleak in tm6000_start_stream

Enrico Weigelt (1):
      media: drivers: staging: media: remove unneeded MODULE_VERSION() call

Evan Benn (1):
      media: mtk-vcodec: Fix order of log arguments

Ezequiel Garcia (26):
      media: mt9v111: Remove unneeded device-managed puts
      media: imx: Unregister csc/scaler only if registered
      media: imx: Fix csc/scaler unregister
      media: imx: Clean capture unregister
      media: imx6-mipi-csi2: Call remote subdev get_mbus_config to get acti=
ve lanes
      media: v4l2-async: Remove V4L2_ASYNC_MATCH_CUSTOM
      media: v4l2-async: Add waiting subdevices debugfs
      media: v4l2-async: Remove V4L2_ASYNC_MATCH_DEVNAME
      media: v4l2-async: Clean v4l2_async_notifier_add_fwnode_remote_subdev
      media: atmel: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: stm32: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: st-mipid02: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: cadence: Use v4l2_async_notifier_add_fwnode_remote_subdev
      media: marvell-ccic: Use v4l2_async_notifier_add_*_subdev
      media: renesas-ceu: Use v4l2_async_notifier_add_*_subdev
      media: pxa-camera: Use v4l2_async_notifier_add_*_subdev
      media: davinci: vpif_display: Remove unused v4l2-async code
      media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev
      media: Clarify v4l2-async subdevice addition API
      media: mach-pxa: Register the camera sensor fixed-rate clock
      media: pxa_camera: Drop the v4l2-clk clock register
      media: ov9640: Use the generic clock framework
      media: mt9m111: Use the generic clock framework
      media: ov6650: Use the generic clock framework
      media: Remove the legacy v4l2-clk API

Fabio Estevam (1):
      media: imx7: csi: Fix regression for parallel cameras on i.MX6UL

Fritz Koenig (1):
      media: venus: vdec: Handle DRC after drain

Geert Uytterhoeven (1):
      media: sh_vou: Drop bogus __refdata annotation

Georgi Djakov (1):
      media: platform: Remove depends on interconnect

Gustavo A. R. Silva (6):
      media: dvb-frontends: Fix fall-through warnings for Clang
      media: usb: dvb-usb-v2: Fix fall-through warnings for Clang
      media: atomisp: Fix fall-through warnings for Clang
      media: dvb_frontend: Fix fall-through warnings for Clang
      media: rcar_jpu: Fix fall-through warnings for Clang
      media: saa7134: Fix fall-through warnings for Clang

Hans Verkuil (23):
      media: v4l2-dev/event: add v4l2_event_wake_all()
      media: vivid: call v4l2_event_wake_all() on disconnect
      media: v4l2-dev: add EPOLLPRI in v4l2_poll() when dev is unregistered
      media: cec: add EPOLLPRI in poll() when dev is unregistered
      media: i2c: imx219: take lock in imx219_enum_mbus_code/frame_size
      media: atomisp/pci/hmm: fix wrong printk format
      media: v4l2-ctrls.c: fix shift-out-of-bounds in std_validate
      media: meson/ge2d: set ret to -ENOMEM
      media: davinci/vpbe.c: ret contains the return code, not err
      media: tuners/it913x.c: fix missing error code
      media: i2c/ov8865.c: fix error checks using wrong variable
      media: sti/c8sectpfe: set correct return code
      media: sti/hva: add missing clk_disable_unprepare()
      media: pci/ivtv: release memory regions on error
      media: usb/dvb-usb-v2/rtl28xxu.c: clean up code to fix smatch warning
      media: dvb-frontends/rtl2832.c: fix missing error code
      media: dvb-frontends/af9033.c: fix missing error codes
      media: atomisp/pci: add missing include
      media: i2c/ov02a10.c: add cast to fix type mismatch
      media: media/dvb/dvbstb.svg: Antena -> Antenna
      media: vidtv: adapter->mdev was set too late
      media: uvc: strncpy -> strscpy
      media: imx334: 'ret' is uninitialized, should have been PTR_ERR()

Heikki Krogerus (1):
      media: software_node: Add support for fwnode_graph*() family of funct=
ions

Helen Koike (3):
      media: v4l2-ioctl: print capabilities in v4l_print_create_buffers()
      media: videobuf2-v4l2: remove redundant error test
      media: doc: pixfmt-yuv: Fix 4:4:4 subsampling info

Jacopo Mondi (30):
      media: dt-bindings: media: i2c: Rename ov5647.yaml
      media: ov5647: Fix format initialization
      media: ov5647: Fix style issues
      media: ov5647: Replace license with SPDX identifier
      media: ov5647: Fix return value from read/write
      media: ov5647: Program mode at s_stream(1) time
      media: ov5647: Implement enum_frame_size()
      media: ov5647: Protect s_stream() with mutex
      media: ov5647: Rationalize driver structure name
      media: ov5647: Break out format handling
      media: ov5647: Rename SBGGR8 VGA mode
      media: ov5647: Add SGGBR10_1X10 modes
      media: ov5647: Use SBGGR10_1X10 640x480 as default
      media: ov5647: Implement set_fmt pad operation
      media: ov5647: Support V4L2_CID_HBLANK control
      media: ov5647: Use pm_runtime infrastructure
      media: ov5647: Rework s_stream() operation
      media: ov5647: Apply controls only when powered
      media: ov5647: Constify oe_enable/disable reglist
      media: ov5647: Support VIDIOC_SUBSCRIBE_EVENT
      media: ov5647: Remove 640x480 SBGGR8 mode
      media: i2c: ov5670: Fix PIXEL_RATE minimum value
      media: dt-bindings: media: ov5647: Fix filename
      media: i2c: Add driver for RDACM21 camera module
      media: dt-bindings: media: max9286: Document 'maxim,reverse-channel-m=
icrovolt'
      media: i2c: max9286: Break-out reverse channel setup
      media: i2c: max9286: Make channel amplitude programmable
      media: i2c: max9286: Configure reverse channel amplitude
      media: i2c: Kconfig: Make MAX9271 a module
      media: i2c: max9271: Add MODULE_* macros

James Reynolds (1):
      media: mceusb: Fix potential out-of-bounds shift

Jernej Skrabec (1):
      media: cedrus: Remove checking for required controls

Joe Perches (2):
      media: lmedm04: Fix misuse of comma
      media: uvcvideo: Rename debug functions

Kieran Bingham (1):
      media: vsp1: Use BIT macro for feature identification

Krzysztof Kozlowski (4):
      media: dt-bindings: media: imx258: add bindings for IMX258 sensor
      media: i2c: imx258: add support for binding via device tree
      media: i2c: imx258: simplify getting state container
      media: i2c: imx258: get clock from device properties and enable it vi=
a runtime PM

Lad Prabhakar (1):
      media: i2c/Kconfig: Select FWNODE for OV772x sensor

Laurent Pinchart (27):
      media: ti-vpe: cal: Create subdev for CAMERARX
      media: ti-vpe: cal: Drop cal_ctx m_fmt field
      media: ti-vpe: cal: Move format handling to cal.c and expose helpers
      media: ti-vpe: cal: Rename MAX_(WIDTH|HEIGHT)_* macros with CAL_ pref=
ix
      media: ti-vpe: cal: Replace hardcoded BIT() value with macro
      media: ti-vpe: cal: Iterate over correct number of CAMERARX instances
      media: ti-vpe: cal: Implement subdev ops for CAMERARX
      media: ti-vpe: cal: Use CAMERARX subdev s_stream op in video device c=
ode
      media: ti-vpe: cal: Don't pass format to cal_ctx_wr_dma_config()
      media: ti-vpe: cal: Rename struct cal_fmt to cal_format_info
      media: ti-vpe: cal: Refactor interrupt enable/disable
      media: ti-vpe: cal: Fold PPI enable in CAMERARX .s_stream()
      media: ti-vpe: cal: Stop write DMA without disabling PPI
      media: ti-vpe: cal: Use spin_lock_irq() when starting or stopping str=
eam
      media: ti-vpe: cal: Share buffer release code between start and stop
      media: ti-vpe: cal: Drop V4L2_CAP_READWRITE
      media: ti-vpe: cal: Drop unneeded check in cal_calc_format_size()
      media: ti-vpe: cal: Remove DMA queue empty check at start streaming t=
ime
      media: ti-vpe: cal: Use list_first_entry()
      media: ti-vpe: cal: Group all DMA queue fields in struct cal_dmaqueue
      media: ti-vpe: cal: Set cal_dmaqueue.pending to NULL when no pending =
buffer
      media: ti-vpe: cal: Store buffer DMA address in dma_addr_t
      media: ti-vpe: cal: Simplify the context API
      media: uvcvideo: Force UVC version to 1.0a for 1bcf:0b40
      media: uvcvideo: Accept invalid bFormatIndex and bFrameIndex values
      media: v4l2-async: Safely unregister an non-registered async subdev
      media: v4l2-async: Improve v4l2_async_notifier_add_*_subdev() API

Lubomir Rintel (1):
      media: marvell-ccic: power up the device on mclk enable

Lukas Bulwahn (1):
      media: MAINTAINERS: correct entry in Amlogic GE2D driver section

Luo Meng (1):
      media: qm1d1c0042: fix error return code in qm1d1c0042_init()

Malcolm Priestley (2):
      media: lmedm04: Use GFP_KERNEL for URB allocation/submission.
      media: lmedm04: Remove lme2510_kill_urb function.

Martin Kepplinger (1):
      media: staging: media: imx: Kconfig: support VIDEO_IMX7_CSI for imx8m

Martina Krasteva (2):
      media: dt-bindings: media: Add bindings for imx334
      media: i2c: Add imx334 camera sensor driver

Matwey V. Kornilov (1):
      media: pwc: Use correct device for DMA

Mauro Carvalho Chehab (1):
      Merge tag 'v5.11-rc6' into patchwork

Maxim Plotnikov (1):
      media: Fix RTL2832 not depending on REGMAP_I2C

Michael Tretter (22):
      media: allegro: move driver out of staging
      media: dt-bindings: media: allegro,al5e: Convert to YAML
      media: allegro: remove custom drain state handling
      media: allegro: rename stream_id to dst_handle
      media: allegro: extract RBSP handler from H.264 NAL generator
      media: allegro: add helper to report unsupported fields
      media: allegro: add HEVC NAL unit generator
      media: allegro: implement S_FMT for CAPTURE
      media: allegro: adjust channel after format change
      media: allegro: move encoding options to channel
      media: allegro: fix log2_max_poc in firmware 2019.1
      media: allegro: use handler_setup to configure channel
      media: allegro: initialize bitrate using v4l2_ctrl
      media: allegro: implement scaling of cpb size in SPS
      media: allegro: remove cpb_size and gop_size from channel
      media: allegro: remove profile and level from channel
      media: allegro: use accessor functions for QP values
      media: allegro: add helper to get entropy mode
      media: allegro: rename codec specific functions
      media: allegro: increase offset in CAPTURE buffer
      media: allegro: activate v4l2-ctrls only for current codec
      media: allegro: add support for HEVC encoding

Nigel Christian (1):
      media: cec: fix trivial style warnings

Niklas S=C3=B6derlund (2):
      media: rcar-vin: Do not try to stop stream if not running
      media: rcar-vin: Route events to correct video device

Paul Kocialkowski (5):
      media: dt-bindings: media: i2c: Add OV5648 bindings documentation
      media: i2c: Add support for the OV5648 image sensor
      media: dt-bindings: media: i2c: Add OV8865 bindings documentation
      media: i2c: Add support for the OV8865 image sensor
      media: i2c: ov5648/ov8865: Minor cosmetic fixes

Pavel Machek (1):
      media: ipu3-cio2: Fix mbus_code processing in cio2_subdev_set_fmt()

Ricardo Ribalda (19):
      media: mtk-mdp: Do not zero reserved fields
      media: fdp1: Do not zero reserved fields
      media: jpu: Do not zero reserved fields
      media: ti-vpe: Do not zero reserved fields
      media: vicodec: Do not zero reserved fields
      media: sun4i-csi: Do not zero reserved fields
      media: mtk-vcodec: Do not zero reserved fields
      media: uvcvideo: Move guid to entity
      media: uvcvideo: Allow extra entities
      media: uvcvideo: Allow entities with no pads
      media: uvcvideo: Provide sync and async uvc_ctrl_status_event
      media: uvcvideo: Allow entity-defined get_info and get_cur
      media: uvcvideo: Implement UVC_EXT_GPIO_UNIT
      media: uvcvideo: Add Privacy control based on EXT_GPIO
      media: uvcvideo: Use dev_ printk aliases
      media: uvcvideo: New macro uvc_trace_cont
      media: uvcvideo: use dev_printk() for uvc_trace()
      media: ipu3-cio2: Do not zero reserved fields
      media: staging/intel-ipu3: Do not zero reserved fields

Rikard Falkeborn (1):
      media: i2c: rdacm20: Constify static structs

Rob Herring (2):
      media: dt-bindings: Convert video-interfaces.txt properties to schemas
      media: dt-bindings: media: Use graph and video-interfaces schemas

Robert Foss (1):
      media: ov8856: Configure sensor for GRBG Bayer for all modes

Rui Miguel Silva (1):
      media: imx7: csi: Fix pad link validation

Sakari Ailus (38):
      media: Documentation: v4l: Remove reference to video ops
      media: Documentation: v4l: Document that link_validate op is valid fo=
r sink only
      media: Documentation: media: Update pixel rate formula for C-PHY
      media: v4l: fwnode: v4l2_async_notifier_parse_fwnode_endpoints is dep=
recated
      media: uapi: Add an entity type for Image Signal Processors
      media: v4l: ioctl: Fix memory leak in video_usercopy
      media: v4l: ioctl: Use kmalloc to allocate a small chunk of memory
      media: Documentation: media: Document clock handling in camera sensor=
 drivers
      media: ccs: Add digital gain support
      media: ccs: Add support for old-style SMIA digital gain
      media: ccs: Remove analogue gain field
      media: ccs: Only add analogue gain control if the device supports it
      media: v4l: uapi: Add user control base for CCS controls
      media: Documentation: ccs: Add user documentation for the CCS driver
      media: v4l: uapi: ccs: Add controls for analogue gain constants
      media: ccs: Add support for analogue gain coefficient controls
      media: v4l: uapi: ccs: Add controls for CCS alternative analogue gain
      media: ccs: Add support for alternate analogue global gain
      media: ccs: Add debug prints for MSR registers
      media: v4l: uapi: ccs: Add CCS controls for shading correction
      media: ccs: Add shading correction and luminance correction level con=
trols
      media: ccs: Get the endpoint by port rather than any next endpoint
      media: ccs: Don't change the I=C2=B2C address just for software reset
      media: ccs: Only do software reset if we have no hardware reset
      media: ccs: Wait until software reset is done
      media: ccs: Hardware requires a delay after starting the clock of lif=
ting reset
      media: ccs: Add a sanity check for external clock frequency
      media: ccs: Support and default to auto PHY control
      media: Documentation: Include CCS PLL calculator to CCS driver docume=
ntation
      media: ccs-pll: Switch from standard integer types to kernel ones
      media: ccs: Switch from standard integer types to kernel ones
      media: Revert "media: ccs-pll: Fix MODULE_LICENSE"
      media: ccs: Small definition cleanup
      media: ccs: Make (non-)use of uninitialised variables more robust
      media: Documentation: media: Fix recently introduced build warning in=
 subdev docs
      media: dt-bindings: Remove old ov5647.yaml file, update ovti,ov5647.y=
aml
      media: ipu3-cio2: Build bridge only if ACPI is enabled
      media: v4l: async: Fix kerneldoc documentation for async functions

Samuel Holland (4):
      media: sunxi-cir: Clean up dead register writes
      media: sunxi-cir: Remove unnecessary spinlock
      media: sunxi-cir: Factor out hardware initialization
      media: sunxi-cir: Implement suspend/resume/shutdown callbacks

Sean Young (3):
      media: ir_toy: add another IR Droid device
      media: mceusb: sanity check for prescaler value
      media: smipcie: fix interrupt handling and IR timeout

Sebastian Fricke (1):
      media: rkisp1: isp: Add the enum_frame_size ioctl

Shawn Tu (1):
      media: ov5675: fix vflip/hflip control

Sowjanya Komatineni (13):
      media: tegra-video: Use zero crop settings if subdev has no get_selec=
tion
      media: tegra-video: Enable VI pixel transform for YUV and RGB formats
      media: tegra-video: Fix V4L2 pixel format RGB and YUV
      media: tegra-video: Add support for V4L2_PIX_FMT_NV16
      media: tegra-video: Add DV timing support
      media: tegra-video: Add support for EDID ioctl ops
      media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
      media: tegra-video: Add support for V4L2_EVENT_SOURCE_CHANGE
      media: tegra-video: Implement V4L2 device notify callback
      media: v4l2-fwnode: Update V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
      media: dt-bindings: tegra: Update csi data-lanes to maximum 8 lanes
      media: tegra-video: Add support for x8 captures with gang ports
      media: tegra-video: Add custom V4L2 control V4L2_CID_TEGRA_SYNCPT_TIM=
EOUT_RETRY

Stanimir Varbanov (22):
      media: venus: vdec: Fix non reliable setting of LAST flag
      media: venus: vdec: Make decoder return LAST flag for sufficient event
      media: venus: helpers: Lock outside of buffer queue helper
      media: venus: venc: Init the session only once in queue_setup
      media: venus: Limit HFI sessions to the maximum supported
      media: venus: hfi: Correct session init return error
      media: venus: helpers: Calculate properly compressed buffer size
      media: venus: pm_helpers: Check instance state when calculate instanc=
e frequency
      media: venus: Delete not used core caps
      media: venus: Add more capabilities and VP9 profile/levels
      media: venus: Create hfi platform and move vpp/vsp there
      media: venus: Rename venus_caps to hfi_plat_caps
      media: venus: hfi_plat: Add codecs and capabilities ops
      media: venus: hfi_plat_v4: Populate codecs and capabilities for v4
      media: venus: hfi_plat: Add platform ops for getting number of VPP pi=
pes
      media: venus: hfi_plat_v6: Populate capabilities for v6
      media: venus: hfi_plat: Add hfi platform buffers ops
      media: venus: Add platform buffers for v6
      media: venus: Get codecs and capabilities from hfi platform
      media: venus: vdec,core: Handle picture structure event
      media: venus: helpers: Wire up hfi platform buffer requirements
      media: venus: pm_helpers: Control core power domain manually

Tian Tao (1):
      media: vidtv: Use kmemdup instead of kzalloc and memcpy

Tom Rix (2):
      media: mtk-vcodec: fix argument used when DEBUG is defined
      media: pxa_camera: declare variable when DEBUG is defined

Tomi Valkeinen (2):
      media: ti-vpe: cal: fix write to unallocated memory
      media: i2c: max9286: fix access to unallocated memory

Travis Carter (2):
      media: staging:hantro: Fixed "replace comma with semicolon" Warning
      media: staging:rkvdec: Fixed "replace comma with semicolon" Warning

Vikash Garodia (1):
      media: venus: request for interrupt from venus

Zhang Changzhong (2):
      media: mtk-vcodec: fix error return code in vdec_vp9_decode()
      media: aspeed: fix error return code in aspeed_video_setup_video()

Zheng Yongjun (4):
      media: platform: davinci: Use DEFINE_SPINLOCK() for spinlock
      media: cxd2841er: use DIV_ROUND_UP to calculate timeout
      media: zoran: convert comma to semicolon
      media: atomisp: convert comma to semicolon

Zou Wei (2):
      media: ti-vpe: cal: Mark cal_camerarx_media_ops with static keyword
      media: venus: Mark bufreq_enc with static keyword

dingsenjie (1):
      media: media/pci: fix spelling typo of frimware

ivan tkachenko (1):
      media: hdmi: cec: replace broken link to HDMI specs

 .../display/tegra/nvidia,tegra20-host1x.txt        |    4 +-
 .../devicetree/bindings/media/allegro,al5e.yaml    |  105 +
 .../devicetree/bindings/media/allegro.txt          |   43 -
 .../bindings/media/allwinner,sun4i-a10-csi.yaml    |   11 +-
 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |   12 +-
 .../devicetree/bindings/media/i2c/adv7180.yaml     |   36 +-
 .../devicetree/bindings/media/i2c/adv7604.yaml     |   37 +-
 .../bindings/media/i2c/aptina,mt9v111.yaml         |    4 +-
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml       |   30 +-
 .../devicetree/bindings/media/i2c/imx219.yaml      |   21 +-
 .../devicetree/bindings/media/i2c/imx258.yaml      |  134 +
 .../bindings/media/i2c/maxim,max9286.yaml          |  117 +-
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |   17 +-
 .../devicetree/bindings/media/i2c/ov8856.yaml      |   22 +-
 .../bindings/media/i2c/ovti,ov02a10.yaml           |   29 +-
 .../devicetree/bindings/media/i2c/ovti,ov2680.yaml |    6 +-
 .../media/i2c/{ov5647.yaml =3D> ovti,ov5647.yaml}    |   22 +-
 .../devicetree/bindings/media/i2c/ovti,ov5648.yaml |  115 +
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml |    9 +-
 .../devicetree/bindings/media/i2c/ovti,ov8865.yaml |  124 +
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |   25 +-
 .../devicetree/bindings/media/i2c/sony,imx274.yaml |    3 +-
 .../devicetree/bindings/media/i2c/sony,imx334.yaml |   91 +
 .../bindings/media/marvell,mmp2-ccic.yaml          |   15 +-
 .../devicetree/bindings/media/nxp,imx7-csi.yaml    |    5 +-
 .../bindings/media/nxp,imx7-mipi-csi2.yaml         |   32 +-
 .../devicetree/bindings/media/renesas,ceu.yaml     |   17 +-
 .../devicetree/bindings/media/renesas,csi2.yaml    |   54 +-
 .../devicetree/bindings/media/renesas,vin.yaml     |  113 +-
 .../devicetree/bindings/media/rockchip-isp1.yaml   |   40 +-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |   18 +-
 .../devicetree/bindings/media/ti,cal.yaml          |   55 +-
 .../bindings/media/video-interface-devices.yaml    |  406 +++
 .../devicetree/bindings/media/video-interfaces.txt |  640 +----
 .../bindings/media/video-interfaces.yaml           |  344 +++
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml       |   39 +-
 Documentation/driver-api/media/camera-sensor.rst   |   20 +-
 Documentation/driver-api/media/cec-core.rst        |    2 +-
 Documentation/driver-api/media/csi2.rst            |    4 +-
 Documentation/driver-api/media/drivers/ccs/ccs.rst |   13 +
 Documentation/driver-api/media/v4l2-clocks.rst     |   31 -
 Documentation/driver-api/media/v4l2-core.rst       |    1 -
 Documentation/driver-api/media/v4l2-subdev.rst     |   63 +-
 Documentation/userspace-api/media/drivers/ccs.rst  |  110 +
 .../userspace-api/media/drivers/index.rst          |    1 +
 Documentation/userspace-api/media/dvb/dvbstb.svg   |    2 +-
 .../userspace-api/media/mediactl/media-types.rst   |    7 +
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |   81 +-
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |    6 +-
 MAINTAINERS                                        |   33 +-
 arch/arm/mach-pxa/devices.c                        |    8 +
 drivers/acpi/utils.c                               |   30 +-
 drivers/base/property.c                            |   15 +-
 drivers/base/swnode.c                              |  180 +-
 drivers/media/cec/core/cec-adap.c                  |    4 +-
 drivers/media/cec/core/cec-api.c                   |    2 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   11 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |    5 -
 drivers/media/dvb-core/dvb_frontend.c              |    1 +
 drivers/media/dvb-frontends/Kconfig                |   11 +-
 drivers/media/dvb-frontends/Makefile               |    1 +
 drivers/media/dvb-frontends/af9033.c               |    2 +
 drivers/media/dvb-frontends/cx24120.c              |    1 +
 drivers/media/dvb-frontends/cxd2841er.c            |    2 +-
 drivers/media/dvb-frontends/dib0090.c              |    2 +
 drivers/media/dvb-frontends/drxk_hard.c            |    1 +
 drivers/media/dvb-frontends/m88rs2000.c            |    1 +
 drivers/media/dvb-frontends/mxl692.c               | 1378 +++++++++
 drivers/media/dvb-frontends/mxl692.h               |   38 +
 drivers/media/dvb-frontends/mxl692_defs.h          |  548 ++++
 drivers/media/dvb-frontends/rtl2832.c              |    1 +
 drivers/media/i2c/Kconfig                          |   59 +
 drivers/media/i2c/Makefile                         |    8 +-
 drivers/media/i2c/ccs-pll.c                        |  116 +-
 drivers/media/i2c/ccs-pll.h                        |   86 +-
 drivers/media/i2c/ccs/ccs-core.c                   |  318 ++-
 drivers/media/i2c/ccs/ccs-data.c                   |   25 +-
 drivers/media/i2c/ccs/ccs-data.h                   |    2 +
 drivers/media/i2c/ccs/ccs-reg-access.c             |   29 +-
 drivers/media/i2c/ccs/ccs.h                        |    8 +-
 drivers/media/i2c/ccs/smiapp-reg-defs.h            |    2 +
 drivers/media/i2c/imx219.c                         |   23 +-
 drivers/media/i2c/imx258.c                         |   82 +-
 drivers/media/i2c/imx334.c                         | 1132 ++++++++
 drivers/media/i2c/max9271.c                        |    5 +
 drivers/media/i2c/max9286.c                        |   74 +-
 drivers/media/i2c/mt9m111.c                        |   17 +-
 drivers/media/i2c/mt9v111.c                        |    6 -
 drivers/media/i2c/ov02a10.c                        |    2 +-
 drivers/media/i2c/ov5647.c                         | 1259 +++++++--
 drivers/media/i2c/ov5648.c                         | 2624 +++++++++++++++++
 drivers/media/i2c/ov5670.c                         |    3 +-
 drivers/media/i2c/ov5675.c                         |    6 +-
 drivers/media/i2c/ov6650.c                         |   28 +-
 drivers/media/i2c/ov8856.c                         |    4 +-
 drivers/media/i2c/ov8865.c                         | 2972 ++++++++++++++++=
++++
 drivers/media/i2c/ov9640.c                         |   15 +-
 drivers/media/i2c/ov9640.h                         |    2 +-
 drivers/media/i2c/rdacm20.c                        |    4 +-
 drivers/media/i2c/rdacm21.c                        |  623 ++++
 drivers/media/i2c/st-mipid02.c                     |   21 +-
 drivers/media/pci/cx25821/cx25821-core.c           |    4 +-
 drivers/media/pci/intel/ipu3/Kconfig               |   21 +-
 drivers/media/pci/intel/ipu3/Makefile              |    3 +
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |  314 +++
 drivers/media/pci/intel/ipu3/cio2-bridge.h         |  125 +
 .../intel/ipu3/{ipu3-cio2.c =3D> ipu3-cio2-main.c}   |   54 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |   24 +
 drivers/media/pci/ivtv/ivtv-driver.c               |    5 +
 drivers/media/pci/saa7134/saa7134-empress.c        |    5 +-
 drivers/media/pci/saa7134/saa7134-tvaudio.c        |   25 +-
 drivers/media/pci/saa7164/saa7164-buffer.c         |   16 +-
 drivers/media/pci/saa7164/saa7164-core.c           |    2 +-
 drivers/media/pci/saa7164/saa7164.h                |    2 +-
 drivers/media/pci/smipcie/smipcie-ir.c             |   46 +-
 drivers/media/pci/smipcie/smipcie-main.c           |   26 +-
 drivers/media/platform/Kconfig                     |   18 +-
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/allegro-dvt/Makefile        |    6 +
 .../platform}/allegro-dvt/allegro-core.c           |  974 +++++--
 .../platform}/allegro-dvt/allegro-mail.c           |   21 +-
 .../platform}/allegro-dvt/allegro-mail.h           |    5 +-
 .../platform}/allegro-dvt/nal-h264.c               |  336 +--
 .../platform}/allegro-dvt/nal-h264.h               |    0
 drivers/media/platform/allegro-dvt/nal-hevc.c      |  824 ++++++
 drivers/media/platform/allegro-dvt/nal-hevc.h      |  350 +++
 drivers/media/platform/allegro-dvt/nal-rbsp.c      |  310 ++
 drivers/media/platform/allegro-dvt/nal-rbsp.h      |   61 +
 drivers/media/platform/am437x/am437x-vpfe.c        |    2 +-
 drivers/media/platform/aspeed-video.c              |    6 +-
 drivers/media/platform/atmel/atmel-isc.h           |    1 +
 drivers/media/platform/atmel/atmel-isi.c           |   46 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c   |   44 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |   17 +-
 drivers/media/platform/davinci/vpbe.c              |    2 +-
 drivers/media/platform/davinci/vpif.c              |    3 +-
 drivers/media/platform/davinci/vpif_capture.c      |    2 +-
 drivers/media/platform/davinci/vpif_display.c      |   86 +-
 drivers/media/platform/davinci/vpif_display.h      |    1 -
 drivers/media/platform/exynos4-is/media-dev.c      |   25 +-
 drivers/media/platform/exynos4-is/media-dev.h      |    2 +-
 drivers/media/platform/marvell-ccic/cafe-driver.c  |   14 +-
 drivers/media/platform/marvell-ccic/mcam-core.c    |   12 +-
 drivers/media/platform/marvell-ccic/mcam-core.h    |    1 -
 drivers/media/platform/marvell-ccic/mmp-driver.c   |   11 +-
 drivers/media/platform/meson/ge2d/ge2d.c           |    1 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c       |    3 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |    6 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |   10 -
 .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |    4 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_intr.c    |   12 +-
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |    3 +-
 drivers/media/platform/omap3isp/isp.c              |   74 +-
 drivers/media/platform/pxa_camera.c                |   86 +-
 drivers/media/platform/qcom/camss/camss-video.c    |    3 +-
 drivers/media/platform/qcom/camss/camss.c          |   11 +-
 drivers/media/platform/qcom/venus/Makefile         |    4 +-
 drivers/media/platform/qcom/venus/core.c           |   47 +-
 drivers/media/platform/qcom/venus/core.h           |   78 +-
 drivers/media/platform/qcom/venus/firmware.c       |    3 +
 drivers/media/platform/qcom/venus/helpers.c        |  154 +-
 drivers/media/platform/qcom/venus/helpers.h        |    4 +-
 drivers/media/platform/qcom/venus/hfi.c            |   18 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |   12 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |   22 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |   59 +-
 drivers/media/platform/qcom/venus/hfi_parser.h     |    7 +-
 drivers/media/platform/qcom/venus/hfi_plat_bufs.h  |   38 +
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 1317 +++++++++
 drivers/media/platform/qcom/venus/hfi_platform.c   |   65 +
 drivers/media/platform/qcom/venus/hfi_platform.h   |   67 +
 .../media/platform/qcom/venus/hfi_platform_v4.c    |  319 +++
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  326 +++
 drivers/media/platform/qcom/venus/hfi_venus.c      |   80 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     |   48 +-
 drivers/media/platform/qcom/venus/vdec.c           |  129 +-
 drivers/media/platform/qcom/venus/venc.c           |  202 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  138 +-
 drivers/media/platform/rcar-vin/rcar-core.c        |    5 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c        |    2 +-
 drivers/media/platform/rcar-vin/rcar-dma.c         |    5 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c        |   42 +-
 drivers/media/platform/rcar_drif.c                 |    2 +-
 drivers/media/platform/rcar_fdp1.c                 |    4 -
 drivers/media/platform/rcar_jpu.c                  |    6 +-
 drivers/media/platform/renesas-ceu.c               |   56 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   15 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |   34 +
 drivers/media/platform/sh_vou.c                    |    2 +-
 .../media/platform/sti/c8sectpfe/c8sectpfe-core.c  |    1 +
 drivers/media/platform/sti/hva/hva-hw.c            |    1 +
 drivers/media/platform/stm32/stm32-dcmi.c          |   87 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |    9 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |    1 -
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |    4 -
 drivers/media/platform/ti-vpe/cal-camerarx.c       |  373 ++-
 drivers/media/platform/ti-vpe/cal-video.c          |  394 +--
 drivers/media/platform/ti-vpe/cal.c                |  399 ++-
 drivers/media/platform/ti-vpe/cal.h                |  105 +-
 drivers/media/platform/ti-vpe/vpe.c                |    2 -
 drivers/media/platform/video-mux.c                 |   14 +-
 drivers/media/platform/vsp1/vsp1.h                 |   20 +-
 drivers/media/platform/vsp1/vsp1_drv.c             |    4 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |   10 +-
 drivers/media/rc/Kconfig                           |    2 +
 drivers/media/rc/img-ir/Kconfig                    |    1 +
 drivers/media/rc/ir_toy.c                          |    1 +
 drivers/media/rc/mceusb.c                          |   11 +-
 drivers/media/rc/sunxi-cir.c                       |  169 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |    5 -
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |   36 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.h    |    7 +
 drivers/media/test-drivers/vidtv/vidtv_psi.c       |    8 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.h        |    1 -
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |   38 +-
 drivers/media/tuners/it913x.c                      |    1 +
 drivers/media/tuners/qm1d1c0042.c                  |    4 +-
 drivers/media/usb/cx231xx/Kconfig                  |    1 +
 drivers/media/usb/dvb-usb-v2/af9015.c              |    1 +
 drivers/media/usb/dvb-usb-v2/lmedm04.c             |   26 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |   35 +-
 drivers/media/usb/em28xx/Kconfig                   |    2 +
 drivers/media/usb/em28xx/em28xx-cards.c            |   46 +
 drivers/media/usb/em28xx/em28xx-core.c             |   10 +-
 drivers/media/usb/em28xx/em28xx-dvb.c              |   26 +
 drivers/media/usb/em28xx/em28xx-i2c.c              |    6 +-
 drivers/media/usb/em28xx/em28xx.h                  |    1 +
 drivers/media/usb/pwc/pwc-if.c                     |   22 +-
 drivers/media/usb/tm6000/tm6000-dvb.c              |    4 +
 drivers/media/usb/uvc/uvc_ctrl.c                   |  179 +-
 drivers/media/usb/uvc/uvc_driver.c                 |  552 ++--
 drivers/media/usb/uvc/uvc_entity.c                 |   11 +-
 drivers/media/usb/uvc/uvc_isight.c                 |   17 +-
 drivers/media/usb/uvc/uvc_queue.c                  |    9 +-
 drivers/media/usb/uvc/uvc_status.c                 |   44 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |   62 +-
 drivers/media/usb/uvc/uvc_video.c                  |  162 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   99 +-
 drivers/media/usb/zr364xx/zr364xx.c                |   49 +-
 drivers/media/v4l2-core/Makefile                   |    2 +-
 drivers/media/v4l2-core/v4l2-async.c               |  180 +-
 drivers/media/v4l2-core/v4l2-clk.c                 |  321 ---
 drivers/media/v4l2-core/v4l2-ctrls.c               |   19 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   20 +-
 drivers/media/v4l2-core/v4l2-event.c               |   17 +
 drivers/media/v4l2-core/v4l2-fwnode.c              |   17 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   42 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   15 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/allegro-dvt/Kconfig          |   16 -
 drivers/staging/media/allegro-dvt/Makefile         |    5 -
 drivers/staging/media/allegro-dvt/TODO             |    4 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   24 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |    2 +-
 .../staging/media/atomisp/pci/ia_css_firmware.h    |    1 +
 .../media/atomisp/pci/runtime/isys/src/rx.c        |    1 +
 drivers/staging/media/atomisp/pci/sh_css_params.c  |    6 +-
 drivers/staging/media/hantro/hantro_v4l2.c         |    2 +-
 drivers/staging/media/imx/Kconfig                  |    9 +-
 drivers/staging/media/imx/Makefile                 |    2 +-
 drivers/staging/media/imx/imx-media-capture.c      |   10 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c   |    4 -
 drivers/staging/media/imx/imx-media-csi.c          |   14 +-
 drivers/staging/media/imx/imx-media-dev.c          |    7 +-
 drivers/staging/media/imx/imx-media-of.c           |    2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c         |  127 +-
 drivers/staging/media/imx/imx7-media-csi.c         |   43 +-
 drivers/staging/media/imx/imx7-mipi-csis.c         |   15 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    3 -
 drivers/staging/media/omap4iss/iss.c               |    1 -
 drivers/staging/media/omap4iss/iss_video.h         |    1 -
 drivers/staging/media/rkvdec/rkvdec.c              |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   49 -
 drivers/staging/media/sunxi/cedrus/cedrus.h        |    1 -
 drivers/staging/media/tegra-video/csi.c            |   35 +-
 drivers/staging/media/tegra-video/csi.h            |   14 +-
 drivers/staging/media/tegra-video/tegra210.c       |  340 ++-
 drivers/staging/media/tegra-video/vi.c             |  348 ++-
 drivers/staging/media/tegra-video/vi.h             |   23 +-
 drivers/staging/media/tegra-video/video.c          |   18 +
 drivers/staging/media/zoran/zoran_driver.c         |    2 +-
 include/acpi/acpi_bus.h                            |    7 +
 include/linux/fwnode.h                             |    7 +
 include/media/davinci/vpif_types.h                 |    2 -
 include/media/v4l2-async.h                         |  146 +-
 include/media/v4l2-clk.h                           |   73 -
 include/media/v4l2-event.h                         |   13 +-
 include/media/v4l2-fwnode.h                        |   28 +-
 include/uapi/linux/ccs.h                           |   18 +
 include/uapi/linux/media.h                         |    1 +
 include/uapi/linux/v4l2-controls.h                 |   22 +
 lib/test_printf.c                                  |    4 +-
 293 files changed, 22208 insertions(+), 5294 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro,al5e.ya=
ml
 delete mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
 rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml =3D> ovti,=
ov5647.yaml} (68%)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5648=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov8865=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334=
.yaml
 create mode 100644 Documentation/devicetree/bindings/media/video-interface=
-devices.yaml
 create mode 100644 Documentation/devicetree/bindings/media/video-interface=
s.yaml
 delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
 create mode 100644 Documentation/userspace-api/media/drivers/ccs.rst
 create mode 100644 drivers/media/dvb-frontends/mxl692.c
 create mode 100644 drivers/media/dvb-frontends/mxl692.h
 create mode 100644 drivers/media/dvb-frontends/mxl692_defs.h
 create mode 100644 drivers/media/i2c/imx334.c
 create mode 100644 drivers/media/i2c/ov5648.c
 create mode 100644 drivers/media/i2c/ov8865.c
 create mode 100644 drivers/media/i2c/rdacm21.c
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c =3D> ipu3-cio2-main.c} (9=
8%)
 create mode 100644 drivers/media/platform/allegro-dvt/Makefile
 rename drivers/{staging/media =3D> media/platform}/allegro-dvt/allegro-cor=
e.c (76%)
 rename drivers/{staging/media =3D> media/platform}/allegro-dvt/allegro-mai=
l.c (96%)
 rename drivers/{staging/media =3D> media/platform}/allegro-dvt/allegro-mai=
l.h (98%)
 rename drivers/{staging/media =3D> media/platform}/allegro-dvt/nal-h264.c =
(73%)
 rename drivers/{staging/media =3D> media/platform}/allegro-dvt/nal-h264.h =
(100%)
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.h
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_plat_bufs.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v4.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6.c
 delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
 delete mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 delete mode 100644 drivers/staging/media/allegro-dvt/Makefile
 delete mode 100644 drivers/staging/media/allegro-dvt/TODO
 delete mode 100644 include/media/v4l2-clk.h
 create mode 100644 include/uapi/linux/ccs.h

