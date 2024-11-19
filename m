Return-Path: <linux-media+bounces-21570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B29D2133
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4411281332
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C5F157A67;
	Tue, 19 Nov 2024 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5oGZ5Pf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168F14D430;
	Tue, 19 Nov 2024 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732003452; cv=none; b=NXGs+lIDFoZuVUYslZYs0S6lRS1QaVSvnnHqPX6+N9rirQLp8Y0YLOGKiYRU0dCOFCEGEek5k96YgbSAAr7ux6MGOHn2xuxj1lGAdSWwTl73a9PyE576R52d7odpf5/vBtCZnSB9L282qfekA8URPGWOB8DDy4eJvFOBYhCq01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732003452; c=relaxed/simple;
	bh=SkilByIVUFgM5H2r6jwKa/7uu2azgLk5Qpu+OFEcGgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fyGBiY3E83+OsUVFuSIA5cVIjZAUIuiGXflNFzXYHGL/iyedXXo+jCF1Z6rdC6t5y9lc1t5PxqUN4rOGEiWkGyhF1aTjVoy4WMBy4igv3f4Yi3GrO9Ddyhzq17KVPFB3PbOHEyqVefIK/tA9dMaFzuKJurYkSMozfpXsH5ccyOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5oGZ5Pf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59B2C4CECF;
	Tue, 19 Nov 2024 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732003452;
	bh=SkilByIVUFgM5H2r6jwKa/7uu2azgLk5Qpu+OFEcGgs=;
	h=Date:From:To:Cc:Subject:From;
	b=Q5oGZ5PfymLK72fMqXskU2dCL7+OgFmKjmNHzfnHNC14dJLVSErv+tEBMawh7OZtD
	 jZinpZtObOeWIydD2oioWWuaiUQrT6PRtLznuKO5R5ESXqxffVKzUYfeJAj7IwfCqJ
	 SwhEhGyAZrWA06QKnB49JOYZZvERcUhBHFiahRrm9o+gKM3k0n2+CqcyYirIbk2sth
	 MYG+diBMXG4c5GMFJ6vgx5VnrCAzn+mXWLH02uY7RGcuOnifftoV1TEigYmgC/sVPP
	 lNUO+VWqyYyanjoNwZLEx4BlLwTRMQ7sLaTdsT6A5gAZgAv1BEQK2VWYuu7INyyijl
	 aHyqFdWoLPS1w==
Date: Tue, 19 Nov 2024 09:04:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.13-rc1] media updates
Message-ID: <20241119090407.645ee267@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.13-1


For:

- removal of the old omap4iss media driver;
- mantis: remove orphan mantis_core.h;
- add support for Raspberypi CFE;
- uvc driver got a co-maintainer;
- main media tree moved to git://linuxtv.org/media.git;
- lots of driver cleanups, updates and fixes.

Regards,
Mauro

The following changes since commit 2d5404caa8c7bb5c4e0435f94b28834ae5456623:

  Linux 6.12-rc7 (2024-11-10 14:19:35 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v6.13-1

for you to fetch changes up to 72ad4ff638047bbbdf3232178fea4bec1f429319:

  docs: media: update location of the media patches (2024-11-18 12:41:22 +0=
100)

----------------------------------------------------------------
media updates for v6.13-rc1

----------------------------------------------------------------
Alain Volmat (5):
      media: i2c: gc2145: introduce enable/disable_streams ops
      media: i2c: st-mipid02: fix mipid02_stream_enable error handling
      media: i2c: st-mipid02: use enable/disable_streams pad ops
      media: i2c: st-mipid02: add pm_runtime handling
      media: i2c: st-mipid02: remove parallel mbus format on sink pad

Alexander Shiyan (1):
      media: i2c: tc358743: Fix crash in the probe error path when using po=
lling

Alexey Klimov (1):
      MAINTAINERS: mailmap: update Alexey Klimov's email address

Andrew Kreimer (1):
      media: platform: ti: omap: fix a typo

Andy Shevchenko (2):
      media: ati_remote: don't push static constants on stack for %*ph
      media: atomisp: Remove License information boilerplate

Arnd Bergmann (1):
      media: cec: seco: add HAS_IOPORT dependency

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (2):
      media: qcom: camss: implement pm domain ops for VFE v4.1
      media: dt-bindings: Add qcom,msm8953-camss

Bartosz Golaszewski (1):
      media: v4l2-core: constify the class struct

Benjamin Bara (3):
      media: i2c: imx290: Remove CHIP_ID reg definition
      media: i2c: imx290: Avoid communication during probe()
      media: i2c: imx290: Check for availability in probe()

Benjamin Gaignard (4):
      media: verisilicon: av1: Fix reference video buffer pointer assignment
      media: videodev2: Add flag to unconditionally enumerate pixel formats
      media: test-drivers: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
      media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag

Biju Das (2):
      media: platform: rzg2l-cru: rzg2l-video: Move request_irq() to probe()
      media: platform: rzg2l-cru: rzg2l-video: Set AXI burst max length

Bingbu Cao (11):
      media: ipu6: fix the wrong type casting and 64-bit division
      media: ipu6: remove redundant dependency in Kconfig
      media: ipu6: not override the dma_ops of device in driver
      media: ipu6: use the IPU6 DMA mapping APIs to do mapping
      media: ipu6: remove architecture DMA ops dependency in Kconfig
      media: Documentation: ipu6: remove the dma_ops part from the doc
      media: ipu6: use PFN_UP() and sg_virt() for code simplicity
      media: ipu6: move the l2_unmap() up before l2_map()
      media: ipu6: optimize the IPU6 MMU mapping flow
      media: ipu6: optimize the IPU6 MMU unmapping flow
      media: ipu6: make the ipu6_mmu_unmap() as a void function

Bj=C3=B8rn Mork (1):
      media: mantis: remove orphan mantis_core.h

Bryan O'Donoghue (6):
      media: qcom: camss: Add hooks to get CSID wrapper resources
      media: dt-bindings: Remove assigned-clock-* from various schema
      media: ov08x40: Fix burst write sequence
      media: dt-bindings: Add OmniVision OV08X40
      media: ov08x40: Rename ext_clk to xvclk
      media: ov08x40: Add OF probe support

Chen Ni (2):
      media: vde: Convert comma to semicolon
      media: ti: j721e-csi2rx: Convert comma to semicolon

Christophe JAILLET (1):
      media: i2c: vgxy61: Fix an error handling path in vgxy61_detect()

Colin Ian King (3):
      media: i2c: ds90ub960: Fix missing return check on ub960_rxport_read =
call
      media: raspberrypi: rp1-cfe: Fix spelling mistake "Orphanded" -> "Orp=
haned"
      media: atomisp: remove redundant re-checking of err

Dan Carpenter (2):
      media: i2c: max96717: clean up on error in max96717_subdev_init()
      media: raspberrypi: Do some cleanup in probe()

David Given (2):
      media: uvcvideo: Add support for the D3DFMT_R5G6B5 pixmap type
      media: uvcvideo: Add a quirk for the Kaiweets KTI-W02 infrared camera

Dmitry Perchanov (3):
      media: v4l: Add luma 16-bit interlaced pixel format
      media: uvcvideo: Add luma 16-bit interlaced pixel format
      media: uvcvideo: RealSense D421 Depth module metadata

Dr. David Alan Gilbert (2):
      media: cx231xx: Remove some deadcode
      media: platform: samsung: s5p-jpeg: Remove deadcode

Everest K.C. (2):
      media: atomisp: hmm_bo: Fix spelling errors in hmm_bo.h
      media: atomisp: Fix spelling errors reported by codespell

Fabio Estevam (3):
      media: imx-jpeg: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      media: dt-bindings: adv7180: Document 'adi,force-bt656-4'
      media: adv7180: Also check for "adi,force-bt656-4"

Fabio Luongo (1):
      media: cx231xx: Fix the S-Video capture on August VGB100

Fritz Koenig (2):
      media: venus: Helper function for dynamically updating bitrate
      media: venus: Enable h.264 hierarchical coding

Gaosheng Cui (1):
      media: platform: allegro-dvt: Fix possible memory leak in allocate_bu=
ffers_internal()

Guoqing Jiang (1):
      media: mtk-jpeg: Fix null-ptr-deref during unload module

Hans Verkuil (35):
      mailmap: add entries for Hans Verkuil
      media: staging: drop omap4iss
      media: dvb-core: add missing buffer index check
      media: v4l2-core: add v4l2_debugfs_root()
      media: v4l2-core: add v4l2_debugfs_if_alloc/free()
      media: i2c: adv7511-v4l2: export InfoFrames to debugfs
      media: i2c: adv7604: export InfoFrames to debugfs
      media: i2c: adv7842: export InfoFrames to debugfs
      media: i2c: tc358743: export InfoFrames to debugfs
      media: omap3isp: add missing wait_prepare/finish ops
      media: pisp_be: add missing wait_prepare/finish ops
      media: venus: add missing wait_prepare/finish ops
      media: pwc: set lock before calling vb2_queue_init()
      media: msi2500: set lock before calling vb2_queue_init()
      media: hackrf: set lock before calling vb2_queue_init()
      media: airspy: set lock before calling vb2_queue_init()
      media: rcar_drif.c: set lock before calling vb2_queue_init()
      media: video-i2c: set lock before calling vb2_queue_init()
      media: vb2: vb2_core_queue_init(): sanity check lock and wait_prepare=
/finish
      media: vb2: use lock if wait_prepare/finish are NULL
      media: videobuf2-core: update vb2_thread if wait_finish/prepare are N=
ULL
      media: test-drivers: drop vb2_ops_wait_prepare/finish
      media: pci: drop vb2_ops_wait_prepare/finish
      media: usb: drop vb2_ops_wait_prepare/finish
      media: video-i2c: drop vb2_ops_wait_prepare/finish
      media: rtl2832_sdr: drop vb2_ops_wait_prepare/finish
      media: platform: drop vb2_ops_wait_prepare/finish
      media: common: saa7146: drop vb2_ops_wait_prepare/finish
      staging: media: drop vb2_ops_wait_prepare/finish
      media: samples: v4l2-pci-skeleton.c: drop vb2_ops_wait_prepare/finish
      media: v4l2-core: v4l2-dv-timings: check cvt/gtf result
      media: vb2: fix confusing log message
      media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls
      Documentation: media: improve V4L2_CID_MIN_BUFFERS_FOR_*, doc
      media: replace obsolete hans.verkuil@cisco.com alias

Hans de Goede (7):
      media: ov2740: Don't log ov2740_check_hwcfg() errors twice
      media: atomisp: Remove unused libmsrlisthelper
      media: atomisp: Fix WARN_ON() in vb2_start_streaming() triggering
      media: atomisp: mt9m114: Disable V4L2_CID_3A_LOCK control
      media: atomisp: mt9m114: Add missing mutex_init() call
      media: atomisp: mt9m114: Fix fmt->code not getting set on try_fmt
      media: MAINTAINERS: Add Hans de Goede as USB VIDEO CLASS co-maintainer

Hridesh MG (1):
      staging: media: ipu3: fix spelling mistakes

Jackson.lee (4):
      media: chips-media: wave5: Support SPS/PPS generation for each IDR
      media: chips-media: wave5: Support runtime suspend/resume
      media: chips-media: wave5: Use helpers to calculate bytesperline and =
sizeimage.
      media: chips-media: wave5: Support YUV422 raw pixel-formats on the en=
coder.

Jai Luthra (2):
      MAINTAINERS: mailmap: update Jai Luthra's email address
      dt-bindings: media: ti,j721e-csi2rx-shim: Update maintainer email

Jinjie Ruan (4):
      media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm en=
abled
      media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
      media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
      media: gspca: ov534-ov772x: Fix off-by-one error in set_frame_rate()

Joe Hattori (1):
      media: platform: exynos4-is: Fix an OF node reference leak in fimc_md=
_is_isp_available

John Keeping (1):
      media: platform: rga: fix 32-bit DMA limitation

Karina Yankevich (1):
      media: tda18271: add missing result checking of tda18271_lookup_map()

Kendra Moore (1):
      docs: media: fix misspelling in lirc-set-send-duty-cycle

Lad Prabhakar (30):
      v4l2-subdev: Return -EOPNOTSUPP for unsupported pad type in call_get_=
frame_desc()
      media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
      media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
      media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT fl=
ag
      media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
      media: rzg2l-cru: csi2: Implement .get_frame_desc()
      media: rzg2l-cru: Retrieve virtual channel information
      media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
      media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
      media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
      media: rzg2l-cru: Remove unnecessary WARN_ON check in format func
      media: rzg2l-cru: Simplify configuring input format for image process=
ing
      media: rzg2l-cru: Inline calculating image size
      media: rzg2l-cru: Simplify handling of supported formats
      media: rzg2l-cru: Inline calculating bytesperline
      media: rzg2l-cru: Make use of v4l2_format_info() helpers
      media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
      media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
      media: rzg2l-cru: video: Implement .link_validate() callback
      media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in enum_frame_si=
ze
      media: rzg2l-cru: Refactor ICnDMR register configuration
      media: rzg2l-cru: Add support to capture 8bit raw sRGB
      media: rzg2l-cru: Move register definitions to a separate file
      media: renesas: rzg2l-cru: Add 'yuv' flag to IP format structure
      media: i2c: ov5645: Use local `dev` pointer for subdev device assignm=
ent
      media: i2c: ov5645: Replace dev_err with dev_err_probe in probe funct=
ion
      media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
      media: i2c: ov5645: Drop `power_lock` mutex
      media: i2c: ov5645: Use subdev active state
      media: i2c: ov5645: Switch to {enable,disable}_streams

Laurent Pinchart (3):
      media: i2c: mt9p031: Drop support for legacy platform data
      media: i2c: mt9p031: Drop I2C device ID table
      media: i2c: mt9p031: Switch from OF to fwnode API

Li Huafei (1):
      media: atomisp: Add check for rgby_data memory allocation failure

Li Zetao (2):
      media: siano: remove redundant null pointer checks in cec_devnode_ini=
t()
      media: ts2020: fix null-ptr-deref in ts2020_probe()

Lu Baolu (1):
      media: nvidia: tegra: Use iommu_paging_domain_alloc()

Martin T=C5=AFma (2):
      media: mgb4: Fix debugfs error handling
      media: mgb4: Fix inconsistent input/output alignment in loopback mode

Mauro Carvalho Chehab (3):
      Merge tag 'v6.12-rc7' into __tmp-hansg-linux-tags_media_atomisp_6_13_1
      MAINTAINERS: update location of media main tree
      docs: media: update location of the media patches

Ming Qian (4):
      media: amphion: Guard memory allocation to catch failures
      media: imx-jpeg: Set video drvdata before register video device
      media: amphion: Set video drvdata before register video device
      media: imx-jpeg: Ensure power suppliers be suspended before detach th=
em

Niklas S=C3=B6derlund (17):
      dt-bindings: media: renesas,csi2: Add binding for V4M
      media: rcar-csi2: Correct field size for PHTW writes
      media: rcar-csi2: Allow writing any code and data value to PHTW
      media: rcar-csi2: Abstract PHTW and PHYPLL register offsets
      media: rcar-csi2: Add helper to lookup mbps settings
      media: rcar-csi2: Move PHTW write helpers
      media: rcar-csi2: Add documentation for PHY_EN and PHY_MODE registers
      media: rcar-csi2: Add support for R-Car V4M
      dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
      media: staging: max96712: Remove device id check
      media: staging: max96712: Move link frequency setting to device struct
      media: staging: max96712: Document the DEBUG_EXTRA register
      media: staging: max96712: Add support for MAX96724
      dt-bindings: media: renesas,isp: Add Gen4 family fallback
      media: rcar-isp: Add family compatible for R-Car Gen4 family
      dt-bindings: media: renesas,isp: Add binding for V4M
      media: rcar-vin: Add support for RAW10

Paul Elder (1):
      media: platform: video-mux: Fix mutex locking

Qiu-ji Chen (1):
      media: wl128x: Fix atomicity violation in fmc_send_cmd()

Ricardo Ribalda (8):
      media: uvcvideo: Force UVC version to 1.0a for 0408:4033
      media: uvcvideo: Refactor the status irq API
      media: uvcvideo: Avoid race condition during unregister
      media: uvcvideo: Exit early if there is not int_urb
      media: atomisp: Replace ternary operator with if
      media: uvcvideo: Stop stream during unregister
      media: vb2: Fix comment
      media: raspberrypi: Remove redundant "no IRQ" message

Rohan Barar (1):
      media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108

Sakari Ailus (5):
      media: Documentation: Deprecate s_stream video op, update docs
      media: Documentation: Update {enable,disable}_streams documentation
      media: Documentation: Improve v4l2_subdev_{en,dis}able_streams docume=
ntation
      media: ipu6: Fix DMA and physical address debugging messages for 32-b=
it
      media: mc: Rename pad as origin in __media_pipeline_start()

Sean Young (2):
      media: gpio-ir-tx: Driver does not behave with PREEMPT_RT
      media: gpio-ir-tx: Remove redundant call to local_irq_disable()

Sergey Senozhatsky (3):
      media: venus: fix enc/dec destruction order
      media: venus: sync with threaded IRQ during inst destruction
      media: venus: factor out inst destruction routine

Shen Lichuan (2):
      media: pvrusb2: Use kmemdup_array instead of kmemdup for multiple all=
ocation
      media: staging/intel-ipu3: css: Convert comma to semicolon

Stanislaw Gruszka (2):
      media: intel/ipu6: do not handle interrupts when device is disabled
      media: intel/ipu6: remove buttress ish structure

Tarang Raval (1):
      media: mt9p031: Refactor format handling for different sensor models

Thadeu Lima de Souza Cascardo (1):
      media: uvcvideo: Require entities to have a non-zero unique ID

Tomi Valkeinen (5):
      media: uapi: Add meta formats for PiSP FE config and stats
      dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
      media: raspberrypi: Add support for RP1-CFE
      media: admin-guide: Document the Raspberry Pi CFE (rp1-cfe)
      media: raspberrypi: cfe: Fix mapping of dmabuf buffers

Tommaso Merciai (5):
      media: i2c: max96714: add HAS_EVENTS support
      media: i2c: max96717: add HAS_EVENTS support
      media: v4l2-subdev: Refactor events
      media: i2c: Drop HAS_EVENTS and event handlers
      media: i2c: imx415: Drop HAS_EVENTS flag

Umang Jain (1):
      media: dw100: Rectify debug log

Uwe Kleine-K=C3=B6nig (1):
      media: Switch back to struct platform_driver::remove()

Vladimir Lypak (1):
      media: qcom: camss: Add MSM8953 resources

Vladimir Zapolskiy (3):
      media: qcom: camss: fix error path on configuration of power domains
      media: qcom: camss: add management of supply regulators to CSIPHY
      media: qcom: camss: move SM8250 regulators from CSID to CSIPHY subdev=
ice

Yu Jiaoliang (4):
      media:tuners: Fix typos in comments across various files
      media: dvb: Fix typos in comments across various files
      media: i2c: Fix typos in comments across various files
      media: atomisp: Fix typos in comment

Zhi Mao (1):
      media: i2c: dw9768: Use runtime PM autosuspend

 .mailmap                                           |    4 +
 Documentation/admin-guide/media/building.rst       |    2 +-
 Documentation/admin-guide/media/omap4_camera.rst   |   62 -
 .../admin-guide/media/raspberrypi-rp1-cfe.dot      |   27 +
 .../admin-guide/media/raspberrypi-rp1-cfe.rst      |   78 +
 Documentation/admin-guide/media/saa7134.rst        |    2 +-
 Documentation/admin-guide/media/v4l-drivers.rst    |    2 +-
 .../devicetree/bindings/media/i2c/adv7180.yaml     |    6 +
 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |   10 -
 .../bindings/media/i2c/maxim,max96712.yaml         |    5 +-
 .../bindings/media/i2c/ovti,ov08x40.yaml           |  120 +
 .../devicetree/bindings/media/i2c/ovti,ov5648.yaml |   11 -
 .../devicetree/bindings/media/i2c/ovti,ov8865.yaml |   10 -
 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |    8 -
 .../devicetree/bindings/media/i2c/sony,imx258.yaml |    7 -
 .../devicetree/bindings/media/i2c/sony,imx334.yaml |    8 -
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |    8 -
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |    8 -
 .../bindings/media/qcom,msm8953-camss.yaml         |  322 +++
 .../bindings/media/raspberrypi,rp1-cfe.yaml        |   93 +
 .../devicetree/bindings/media/renesas,csi2.yaml    |    1 +
 .../devicetree/bindings/media/renesas,isp.yaml     |    4 +-
 .../bindings/media/ti,j721e-csi2rx-shim.yaml       |    2 +-
 Documentation/driver-api/media/camera-sensor.rst   |    8 +-
 Documentation/driver-api/media/drivers/ipu6.rst    |   15 -
 Documentation/driver-api/media/tx-rx.rst           |   13 +-
 .../media/rc/lirc-set-send-duty-cycle.rst          |    2 +-
 Documentation/userspace-api/media/v4l/control.rst  |    6 +-
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |   39 +
 .../userspace-api/media/v4l/pixfmt-y16i.rst        |   73 +
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |   18 +-
 .../userspace-api/media/v4l/yuv-formats.rst        |    1 +
 .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
 MAINTAINERS                                        |  358 +--
 drivers/media/cec/core/cec-core.c                  |    2 +-
 drivers/media/cec/platform/Kconfig                 |    2 +-
 drivers/media/cec/platform/cec-gpio/cec-gpio.c     |    4 +-
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c   |    2 +-
 drivers/media/cec/platform/meson/ao-cec-g12a.c     |    2 +-
 drivers/media/cec/platform/meson/ao-cec.c          |    2 +-
 drivers/media/cec/platform/s5p/s5p_cec.c           |    2 +-
 drivers/media/cec/platform/seco/seco-cec.c         |    2 +-
 drivers/media/cec/platform/sti/stih-cec.c          |    2 +-
 drivers/media/cec/platform/stm32/stm32-cec.c       |    2 +-
 drivers/media/cec/platform/tegra/tegra_cec.c       |    2 +-
 drivers/media/common/saa7146/saa7146_vbi.c         |    2 -
 drivers/media/common/saa7146/saa7146_video.c       |    2 -
 drivers/media/common/siano/smsdvb-debugfs.c        |    9 +-
 drivers/media/common/uvc.c                         |    8 +
 drivers/media/common/videobuf2/videobuf2-core.c    |   49 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |    2 +-
 drivers/media/dvb-frontends/bcm3510.c              |    2 +-
 drivers/media/dvb-frontends/dib0090.c              |    4 +-
 drivers/media/dvb-frontends/dib3000mb.c            |    2 +-
 drivers/media/dvb-frontends/rtl2832_sdr.c          |    4 +-
 drivers/media/dvb-frontends/stv6111.c              |    2 +-
 drivers/media/dvb-frontends/tda18271c2dd.c         |    2 +-
 drivers/media/dvb-frontends/ts2020.c               |    8 +-
 drivers/media/dvb-frontends/zd1301_demod.c         |    2 +-
 drivers/media/dvb-frontends/zl10036.c              |    2 +-
 drivers/media/i2c/adv7180.c                        |    3 +-
 drivers/media/i2c/adv7511-v4l2.c                   |   91 +-
 drivers/media/i2c/adv7604.c                        |   97 +-
 drivers/media/i2c/adv7842.c                        |  135 +-
 drivers/media/i2c/alvium-csi2.c                    |    5 +-
 drivers/media/i2c/ds90ub953.c                      |    5 +-
 drivers/media/i2c/ds90ub960.c                      |    7 +-
 drivers/media/i2c/dw9768.c                         |   15 +-
 drivers/media/i2c/gc0308.c                         |    4 -
 drivers/media/i2c/gc05a2.c                         |   10 +-
 drivers/media/i2c/gc08a3.c                         |   10 +-
 drivers/media/i2c/gc2145.c                         |   41 +-
 drivers/media/i2c/hi556.c                          |    2 +-
 drivers/media/i2c/imx219.c                         |   10 +-
 drivers/media/i2c/imx283.c                         |   10 +-
 drivers/media/i2c/imx290.c                         |   40 +-
 drivers/media/i2c/imx415.c                         |    3 +-
 drivers/media/i2c/max96717.c                       |    6 +-
 drivers/media/i2c/mt9p031.c                        |   96 +-
 drivers/media/i2c/ov01a10.c                        |    6 +-
 drivers/media/i2c/ov08x40.c                        |  181 +-
 drivers/media/i2c/ov2740.c                         |    7 +-
 drivers/media/i2c/ov5640.c                         |    2 +-
 drivers/media/i2c/ov5645.c                         |  278 +--
 drivers/media/i2c/ov5670.c                         |    2 +-
 drivers/media/i2c/ov5675.c                         |    4 +-
 drivers/media/i2c/ov64a40.c                        |   10 +-
 drivers/media/i2c/ov772x.c                         |    2 +-
 drivers/media/i2c/ov7740.c                         |    2 +-
 drivers/media/i2c/ov8856.c                         |    2 +-
 drivers/media/i2c/ov8858.c                         |    9 +-
 drivers/media/i2c/ov9650.c                         |    2 +-
 drivers/media/i2c/ov9734.c                         |    2 +-
 drivers/media/i2c/st-mipid02.c                     |  117 +-
 drivers/media/i2c/tc358743.c                       |   40 +-
 drivers/media/i2c/thp7312.c                        |    5 +-
 drivers/media/i2c/ths7303.c                        |    2 +-
 drivers/media/i2c/vgxy61.c                         |    2 +-
 drivers/media/i2c/video-i2c.c                      |    4 +-
 drivers/media/mc/mc-entity.c                       |   14 +-
 drivers/media/mc/mc-request.c                      |    2 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |    2 -
 drivers/media/pci/bt8xx/bttv-vbi.c                 |    2 -
 drivers/media/pci/cobalt/cobalt-driver.c           |    2 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |    2 -
 drivers/media/pci/cx18/cx18-streams.c              |    2 -
 drivers/media/pci/cx23885/cx23885-417.c            |    2 -
 drivers/media/pci/cx23885/cx23885-dvb.c            |    2 -
 drivers/media/pci/cx23885/cx23885-vbi.c            |    2 -
 drivers/media/pci/cx23885/cx23885-video.c          |    2 -
 drivers/media/pci/cx25821/cx25821-video.c          |    2 -
 drivers/media/pci/cx88/cx88-blackbird.c            |    2 -
 drivers/media/pci/cx88/cx88-dvb.c                  |    2 -
 drivers/media/pci/cx88/cx88-vbi.c                  |    2 -
 drivers/media/pci/cx88/cx88-video.c                |    2 -
 drivers/media/pci/dt3155/dt3155.c                  |    2 -
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    2 -
 drivers/media/pci/intel/ipu6/Kconfig               |   10 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |    6 -
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |   65 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |    6 -
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |   24 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |  208 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |   34 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |   22 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |    4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |   66 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |    1 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |   25 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  310 ++-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h            |    4 +-
 .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |    2 -
 drivers/media/pci/intel/ipu6/ipu6.c                |    6 +-
 drivers/media/pci/mantis/mantis_core.h             |   43 -
 drivers/media/pci/mgb4/mgb4_core.c                 |    8 +-
 drivers/media/pci/mgb4/mgb4_core.h                 |    2 -
 drivers/media/pci/mgb4/mgb4_vin.c                  |   57 +-
 drivers/media/pci/mgb4/mgb4_vin.h                  |    1 -
 drivers/media/pci/mgb4/mgb4_vout.c                 |   27 +-
 drivers/media/pci/mgb4/mgb4_vout.h                 |    1 -
 drivers/media/pci/saa7134/saa7134-empress.c        |    2 -
 drivers/media/pci/saa7134/saa7134-ts.c             |    2 -
 drivers/media/pci/saa7134/saa7134-vbi.c            |    2 -
 drivers/media/pci/saa7134/saa7134-video.c          |    2 -
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |    2 -
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |    2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c            |    2 -
 drivers/media/pci/tw5864/tw5864-video.c            |    2 -
 drivers/media/pci/tw68/tw68-video.c                |    2 -
 drivers/media/pci/tw686x/tw686x-video.c            |    2 -
 drivers/media/pci/zoran/zoran_driver.c             |    2 -
 drivers/media/platform/allegro-dvt/allegro-core.c  |    8 +-
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |    4 +-
 drivers/media/platform/amphion/venc.c              |   12 +
 drivers/media/platform/amphion/vpu_core.c          |    2 +-
 drivers/media/platform/amphion/vpu_drv.c           |    4 +-
 drivers/media/platform/amphion/vpu_v4l2.c          |    4 +-
 drivers/media/platform/aspeed/aspeed-video.c       |    4 +-
 drivers/media/platform/atmel/atmel-isi.c           |    4 +-
 drivers/media/platform/broadcom/bcm2835-unicam.c   |    4 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |    2 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       |    2 +-
 .../media/platform/chips-media/coda/coda-common.c  |    4 +-
 .../platform/chips-media/wave5/wave5-helper.c      |   37 +-
 .../platform/chips-media/wave5/wave5-helper.h      |    5 +
 .../media/platform/chips-media/wave5/wave5-hw.c    |   30 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |  323 +--
 .../platform/chips-media/wave5/wave5-vpu-enc.c     |  315 +--
 .../media/platform/chips-media/wave5/wave5-vpu.c   |   52 +-
 .../media/platform/chips-media/wave5/wave5-vpu.h   |    5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c      |   33 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h      |    1 +
 .../platform/chips-media/wave5/wave5-vpuconfig.h   |   27 +-
 drivers/media/platform/chips-media/wave5/wave5.h   |    3 +
 .../media/platform/imagination/e5010-jpeg-enc.c    |    4 +-
 drivers/media/platform/intel/pxa_camera.c          |    4 +-
 drivers/media/platform/m2m-deinterlace.c           |    4 +-
 drivers/media/platform/marvell/mcam-core.c         |    4 -
 drivers/media/platform/marvell/mmp-driver.c        |    2 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |   16 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c |   11 -
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c |    2 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |    2 -
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |    2 -
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |    2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c       |    2 -
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      |    2 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       |    2 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |    2 +-
 drivers/media/platform/mediatek/vpu/mtk_vpu.c      |    2 +-
 .../media/platform/microchip/microchip-csi2dc.c    |    2 +-
 .../media/platform/microchip/microchip-isc-base.c  |    2 -
 .../platform/microchip/microchip-sama5d2-isc.c     |    2 +-
 .../platform/microchip/microchip-sama7g5-isc.c     |    2 +-
 drivers/media/platform/nuvoton/npcm-video.c        |    4 +-
 drivers/media/platform/nvidia/tegra-vde/iommu.c    |    7 +-
 drivers/media/platform/nvidia/tegra-vde/v4l2.c     |   14 +-
 drivers/media/platform/nvidia/tegra-vde/vde.c      |    2 +-
 drivers/media/platform/nxp/dw100/dw100.c           |    6 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   19 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |    2 +-
 drivers/media/platform/nxp/imx-pxp.c               |    4 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |    4 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |    2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |    2 -
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |    2 -
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |    2 +-
 drivers/media/platform/nxp/mx2_emmaprp.c           |    4 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   36 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    2 +
 drivers/media/platform/qcom/camss/camss-ispif.c    |    5 +
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |   10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |    1 +
 drivers/media/platform/qcom/camss/camss-video.c    |    2 -
 drivers/media/platform/qcom/camss/camss.c          |  223 +-
 drivers/media/platform/qcom/camss/camss.h          |    7 +
 drivers/media/platform/qcom/venus/core.c           |   29 +-
 drivers/media/platform/qcom/venus/core.h           |    6 +
 drivers/media/platform/qcom/venus/vdec.c           |   15 +-
 drivers/media/platform/qcom/venus/vdec.h           |    1 -
 drivers/media/platform/qcom/venus/vdec_ctrls.c     |    5 -
 drivers/media/platform/qcom/venus/venc.c           |   87 +-
 drivers/media/platform/qcom/venus/venc.h           |    1 -
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  131 +-
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   |    2 +-
 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   15 +
 .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
 .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
 .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  202 ++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2509 ++++++++++++++++=
++++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  586 +++++
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  181 ++
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  605 +++++
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
 drivers/media/platform/renesas/rcar-csi2.c         |  520 +++-
 drivers/media/platform/renesas/rcar-fcp.c          |    2 +-
 drivers/media/platform/renesas/rcar-isp.c          |    6 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |    3 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   32 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   43 +
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |    4 +-
 drivers/media/platform/renesas/rcar_drif.c         |    6 +-
 drivers/media/platform/renesas/rcar_fdp1.c         |    4 +-
 drivers/media/platform/renesas/rcar_jpu.c          |    4 +-
 drivers/media/platform/renesas/renesas-ceu.c       |    4 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |   18 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |   80 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |   34 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   41 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   85 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |  305 +--
 drivers/media/platform/renesas/sh_vou.c            |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |    2 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |    2 -
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |    2 -
 drivers/media/platform/rockchip/rga/rga-buf.c      |    2 -
 drivers/media/platform/rockchip/rga/rga.c          |    4 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |    2 -
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |    2 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c |    2 -
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |    2 -
 .../media/platform/samsung/exynos-gsc/gsc-core.c   |    2 +-
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |    2 -
 .../platform/samsung/exynos4-is/fimc-capture.c     |    2 -
 .../media/platform/samsung/exynos4-is/fimc-core.c  |    2 +-
 .../platform/samsung/exynos4-is/fimc-is-i2c.c      |    2 +-
 .../media/platform/samsung/exynos4-is/fimc-is.c    |    2 +-
 .../platform/samsung/exynos4-is/fimc-isp-video.c   |    2 -
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |    4 +-
 .../media/platform/samsung/exynos4-is/fimc-m2m.c   |    2 -
 .../media/platform/samsung/exynos4-is/media-dev.c  |    2 +-
 .../media/platform/samsung/exynos4-is/media-dev.h  |    5 +-
 .../media/platform/samsung/exynos4-is/mipi-csis.c  |    2 +-
 .../platform/samsung/s3c-camif/camif-capture.c     |    2 -
 .../media/platform/samsung/s3c-camif/camif-core.c  |    2 +-
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |    4 +-
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |    4 +-
 .../platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.c |    5 -
 .../platform/samsung/s5p-jpeg/jpeg-hw-exynos3250.h |    1 -
 .../platform/samsung/s5p-jpeg/jpeg-hw-exynos4.c    |   19 -
 .../platform/samsung/s5p-jpeg/jpeg-hw-exynos4.h    |    4 -
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |    2 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.c   |    2 -
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.c   |    2 -
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |    4 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |    2 +-
 drivers/media/platform/st/sti/delta/delta-v4l2.c   |    6 +-
 drivers/media/platform/st/sti/hva/hva-v4l2.c       |    4 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |    4 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |    4 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |    6 -
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |    2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |    2 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |    2 -
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |    2 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_capture.c   |    2 -
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |    2 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |    2 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    4 +-
 .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |    4 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |    4 +-
 drivers/media/platform/ti/cal/cal-video.c          |    2 -
 drivers/media/platform/ti/cal/cal.c                |    2 +-
 drivers/media/platform/ti/davinci/vpif.c           |    2 +-
 drivers/media/platform/ti/davinci/vpif_capture.c   |    4 +-
 drivers/media/platform/ti/davinci/vpif_display.c   |    4 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   10 +-
 drivers/media/platform/ti/omap/omap_vout.c         |    4 +-
 drivers/media/platform/ti/omap/omap_voutdef.h      |    2 +-
 drivers/media/platform/ti/omap3isp/isp.c           |    2 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |   18 +
 drivers/media/platform/ti/vpe/vpe.c                |    4 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |    2 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |   20 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |    3 +-
 drivers/media/platform/via/via-camera.c            |    4 +-
 drivers/media/platform/video-mux.c                 |    8 +-
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    |    2 +-
 drivers/media/platform/xilinx/xilinx-dma.c         |    2 -
 drivers/media/platform/xilinx/xilinx-tpg.c         |    2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c        |    2 +-
 drivers/media/platform/xilinx/xilinx-vtc.c         |    2 +-
 drivers/media/radio/radio-aimslab.c                |    2 +-
 drivers/media/radio/radio-gemtek.c                 |    2 +-
 drivers/media/radio/radio-isa.c                    |    2 +-
 drivers/media/radio/radio-isa.h                    |    2 +-
 drivers/media/radio/radio-miropcm20.c              |    2 +-
 drivers/media/radio/radio-rtrack2.c                |    2 +-
 drivers/media/radio/radio-si476x.c                 |    2 +-
 drivers/media/radio/radio-terratec.c               |    2 +-
 drivers/media/radio/radio-timb.c                   |    2 +-
 drivers/media/radio/radio-wl1273.c                 |    2 +-
 drivers/media/radio/radio-zoltrix.c                |    2 +-
 drivers/media/radio/si4713/radio-platform-si4713.c |    2 +-
 drivers/media/radio/wl128x/fmdrv_common.c          |    3 +-
 drivers/media/rc/Kconfig                           |    1 +
 drivers/media/rc/ati_remote.c                      |    6 +-
 drivers/media/rc/gpio-ir-recv.c                    |    2 +-
 drivers/media/rc/gpio-ir-tx.c                      |    4 -
 drivers/media/rc/img-ir/img-ir-core.c              |    2 +-
 drivers/media/rc/ir-hix5hd2.c                      |    2 +-
 drivers/media/rc/meson-ir.c                        |    2 +-
 drivers/media/rc/mtk-cir.c                         |    2 +-
 drivers/media/rc/st_rc.c                           |    2 +-
 drivers/media/rc/sunxi-cir.c                       |    2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   29 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |    2 +-
 drivers/media/test-drivers/vim2m.c                 |    4 +-
 drivers/media/test-drivers/vimc/vimc-capture.c     |    6 -
 drivers/media/test-drivers/vimc/vimc-core.c        |    2 +-
 drivers/media/test-drivers/visl/visl-core.c        |    2 +-
 drivers/media/test-drivers/visl/visl-video.c       |   22 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |    2 +-
 drivers/media/test-drivers/vivid/vivid-meta-cap.c  |    2 -
 drivers/media/test-drivers/vivid/vivid-meta-out.c  |    2 -
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |    2 -
 drivers/media/test-drivers/vivid/vivid-touch-cap.c |    2 -
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   |    2 -
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   |    2 -
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |   17 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c   |    2 -
 drivers/media/tuners/it913x.c                      |    2 +-
 drivers/media/tuners/mt2063.c                      |    2 +-
 drivers/media/tuners/mxl301rf.c                    |    2 +-
 drivers/media/tuners/mxl5005s.c                    |    2 +-
 drivers/media/tuners/tda18271-fe.c                 |    4 +-
 drivers/media/tuners/tea5761.c                     |    4 +-
 drivers/media/tuners/tea5767.c                     |    4 +-
 drivers/media/usb/airspy/airspy.c                  |    4 +-
 drivers/media/usb/au0828/au0828-vbi.c              |    2 -
 drivers/media/usb/au0828/au0828-video.c            |    2 -
 drivers/media/usb/cx231xx/cx231xx-417.c            |    2 -
 drivers/media/usb/cx231xx/cx231xx-avcore.c         |   59 +-
 drivers/media/usb/cx231xx/cx231xx-cards.c          |    6 +-
 drivers/media/usb/cx231xx/cx231xx-vbi.c            |    2 -
 drivers/media/usb/cx231xx/cx231xx-video.c          |    2 -
 drivers/media/usb/cx231xx/cx231xx.h                |    5 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c           |    2 -
 drivers/media/usb/em28xx/em28xx-vbi.c              |    2 -
 drivers/media/usb/em28xx/em28xx-video.c            |    2 -
 drivers/media/usb/go7007/go7007-v4l2.c             |    2 -
 drivers/media/usb/gspca/gspca.c                    |    2 -
 drivers/media/usb/gspca/ov534.c                    |    2 +-
 drivers/media/usb/hackrf/hackrf.c                  |    6 +-
 drivers/media/usb/msi2500/msi2500.c                |    4 +-
 drivers/media/usb/pvrusb2/pvrusb2-io.c             |    4 +-
 drivers/media/usb/pwc/pwc-if.c                     |    4 +-
 drivers/media/usb/s2255/s2255drv.c                 |    2 -
 drivers/media/usb/stk1160/stk1160-v4l.c            |    2 -
 drivers/media/usb/usbtv/usbtv-video.c              |    2 -
 drivers/media/usb/uvc/uvc_driver.c                 |  146 +-
 drivers/media/usb/uvc/uvc_queue.c                  |    4 -
 drivers/media/usb/uvc/uvc_status.c                 |   63 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |   22 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   10 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |   16 +-
 drivers/media/v4l2-core/v4l2-dv-timings.c          |  199 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    3 +
 drivers/media/v4l2-core/v4l2-subdev.c              |   27 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/atomisp/i2c/Kconfig          |   10 -
 drivers/staging/media/atomisp/i2c/Makefile         |    2 -
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |   10 -
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   10 -
 .../media/atomisp/i2c/atomisp-libmsrlisthelper.c   |  211 --
 .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |   24 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |   10 -
 drivers/staging/media/atomisp/i2c/gc2235.h         |   13 -
 drivers/staging/media/atomisp/i2c/mt9m114.h        |   11 -
 drivers/staging/media/atomisp/i2c/ov2722.h         |   11 -
 drivers/staging/media/atomisp/include/hmm/hmm.h    |   11 -
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |   15 +-
 .../staging/media/atomisp/include/hmm/hmm_common.h |   11 -
 .../staging/media/atomisp/include/linux/atomisp.h  |   11 -
 .../atomisp/include/linux/atomisp_gmin_platform.h  |    9 -
 .../media/atomisp/include/linux/atomisp_platform.h |   11 -
 .../media/atomisp/include/linux/libmsrlisthelper.h |   28 -
 .../staging/media/atomisp/include/mmu/isp_mmu.h    |   11 -
 .../media/atomisp/include/mmu/sh_mmu_mrfld.h       |   11 -
 drivers/staging/media/atomisp/pci/atomisp-regs.h   |   11 -
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   11 -
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |   11 -
 drivers/staging/media/atomisp/pci/atomisp_common.h |   11 -
 drivers/staging/media/atomisp/pci/atomisp_compat.h |   11 -
 .../media/atomisp/pci/atomisp_compat_css20.c       |   11 -
 .../media/atomisp/pci/atomisp_compat_css20.h       |   11 -
 .../media/atomisp/pci/atomisp_compat_ioctl32.h     |   11 -
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   11 -
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |   11 -
 .../staging/media/atomisp/pci/atomisp_dfs_tables.h |   11 -
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c  |   11 -
 drivers/staging/media/atomisp/pci/atomisp_drvfs.h  |   11 -
 drivers/staging/media/atomisp/pci/atomisp_fops.c   |   13 -
 drivers/staging/media/atomisp/pci/atomisp_fops.h   |   11 -
 .../staging/media/atomisp/pci/atomisp_internal.h   |   11 -
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   24 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |   11 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   11 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   11 -
 drivers/staging/media/atomisp/pci/atomisp_tables.h |   11 -
 .../media/atomisp/pci/atomisp_trace_event.h        |   11 -
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   13 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.h   |   11 -
 .../pci/base/circbuf/interface/ia_css_circbuf.h    |    9 -
 .../base/circbuf/interface/ia_css_circbuf_comm.h   |    9 -
 .../base/circbuf/interface/ia_css_circbuf_desc.h   |    9 -
 .../media/atomisp/pci/base/circbuf/src/circbuf.c   |    9 -
 .../pci/base/refcount/interface/ia_css_refcount.h  |    9 -
 .../media/atomisp/pci/base/refcount/src/refcount.c |    9 -
 drivers/staging/media/atomisp/pci/bits.h           |    9 -
 .../camera/pipe/interface/ia_css_pipe_binarydesc.h |    9 -
 .../camera/pipe/interface/ia_css_pipe_stagedesc.h  |    9 -
 .../pci/camera/pipe/interface/ia_css_pipe_util.h   |    9 -
 .../atomisp/pci/camera/pipe/src/pipe_binarydesc.c  |    9 -
 .../atomisp/pci/camera/pipe/src/pipe_stagedesc.c   |    9 -
 .../media/atomisp/pci/camera/pipe/src/pipe_util.c  |    9 -
 .../pci/camera/util/interface/ia_css_util.h        |    9 -
 .../media/atomisp/pci/camera/util/src/util.c       |    9 -
 drivers/staging/media/atomisp/pci/cell_params.h    |    9 -
 .../atomisp/pci/css_2401_system/csi_rx_global.h    |    9 -
 .../atomisp/pci/css_2401_system/host/csi_rx.c      |    9 -
 .../pci/css_2401_system/host/csi_rx_local.h        |    9 -
 .../pci/css_2401_system/host/csi_rx_private.h      |    9 -
 .../atomisp/pci/css_2401_system/host/ibuf_ctrl.c   |    9 -
 .../pci/css_2401_system/host/ibuf_ctrl_local.h     |    9 -
 .../atomisp/pci/css_2401_system/host/isys_dma.c    |    9 -
 .../pci/css_2401_system/host/isys_dma_private.h    |    9 -
 .../atomisp/pci/css_2401_system/host/isys_irq.c    |    9 -
 .../pci/css_2401_system/host/isys_irq_local.h      |    9 -
 .../pci/css_2401_system/host/isys_irq_private.h    |    9 -
 .../pci/css_2401_system/host/isys_stream2mmio.c    |    9 -
 .../css_2401_system/host/isys_stream2mmio_local.h  |    9 -
 .../host/isys_stream2mmio_private.h                |    9 -
 .../pci/css_2401_system/host/pixelgen_local.h      |    9 -
 .../pci/css_2401_system/host/pixelgen_private.h    |    9 -
 .../css_2401_system/hrt/PixelGen_SysBlock_defs.h   |    9 -
 .../pci/css_2401_system/hrt/ibuf_cntrl_defs.h      |    9 -
 .../css_2401_system/hrt/mipi_backend_common_defs.h |    9 -
 .../pci/css_2401_system/hrt/mipi_backend_defs.h    |    9 -
 .../atomisp/pci/css_2401_system/hrt/rx_csi_defs.h  |    9 -
 .../pci/css_2401_system/hrt/stream2mmio_defs.h     |    9 -
 .../atomisp/pci/css_2401_system/ibuf_ctrl_global.h |    9 -
 .../atomisp/pci/css_2401_system/isys_dma_global.h  |    9 -
 .../atomisp/pci/css_2401_system/isys_irq_global.h  |    9 -
 .../pci/css_2401_system/isys_stream2mmio_global.h  |    9 -
 .../atomisp/pci/css_2401_system/pixelgen_global.h  |    9 -
 .../atomisp/pci/css_receiver_2400_common_defs.h    |    9 -
 .../media/atomisp/pci/css_receiver_2400_defs.h     |    9 -
 drivers/staging/media/atomisp/pci/css_trace.h      |    9 -
 drivers/staging/media/atomisp/pci/dma_v2_defs.h    |    9 -
 drivers/staging/media/atomisp/pci/gdc_v2_defs.h    |    9 -
 drivers/staging/media/atomisp/pci/gp_timer_defs.h  |    9 -
 .../staging/media/atomisp/pci/gpio_block_defs.h    |    9 -
 .../atomisp/pci/hive_isp_css_common/debug_global.h |    9 -
 .../atomisp/pci/hive_isp_css_common/dma_global.h   |   10 -
 .../pci/hive_isp_css_common/event_fifo_global.h    |    9 -
 .../pci/hive_isp_css_common/fifo_monitor_global.h  |    9 -
 .../atomisp/pci/hive_isp_css_common/gdc_global.h   |    9 -
 .../pci/hive_isp_css_common/gp_device_global.h     |    9 -
 .../pci/hive_isp_css_common/gp_timer_global.h      |    9 -
 .../atomisp/pci/hive_isp_css_common/gpio_global.h  |    9 -
 .../atomisp/pci/hive_isp_css_common/hmem_global.h  |    9 -
 .../atomisp/pci/hive_isp_css_common/host/debug.c   |    9 -
 .../pci/hive_isp_css_common/host/debug_local.h     |    9 -
 .../pci/hive_isp_css_common/host/debug_private.h   |    9 -
 .../atomisp/pci/hive_isp_css_common/host/dma.c     |    9 -
 .../pci/hive_isp_css_common/host/dma_local.h       |    9 -
 .../pci/hive_isp_css_common/host/dma_private.h     |    9 -
 .../pci/hive_isp_css_common/host/event_fifo.c      |    9 -
 .../hive_isp_css_common/host/event_fifo_local.h    |    9 -
 .../hive_isp_css_common/host/event_fifo_private.h  |    9 -
 .../pci/hive_isp_css_common/host/fifo_monitor.c    |    9 -
 .../hive_isp_css_common/host/fifo_monitor_local.h  |    9 -
 .../host/fifo_monitor_private.h                    |    9 -
 .../atomisp/pci/hive_isp_css_common/host/gdc.c     |    9 -
 .../pci/hive_isp_css_common/host/gdc_local.h       |    9 -
 .../pci/hive_isp_css_common/host/gdc_private.h     |    9 -
 .../pci/hive_isp_css_common/host/gp_device.c       |    9 -
 .../pci/hive_isp_css_common/host/gp_device_local.h |    9 -
 .../hive_isp_css_common/host/gp_device_private.h   |    9 -
 .../pci/hive_isp_css_common/host/gp_timer.c        |    9 -
 .../pci/hive_isp_css_common/host/gp_timer_local.h  |    9 -
 .../hive_isp_css_common/host/gp_timer_private.h    |    9 -
 .../pci/hive_isp_css_common/host/gpio_private.h    |    9 -
 .../atomisp/pci/hive_isp_css_common/host/hmem.c    |    9 -
 .../pci/hive_isp_css_common/host/hmem_local.h      |    9 -
 .../pci/hive_isp_css_common/host/hmem_private.h    |    9 -
 .../pci/hive_isp_css_common/host/input_formatter.c |    9 -
 .../host/input_formatter_local.h                   |    9 -
 .../host/input_formatter_private.h                 |    9 -
 .../pci/hive_isp_css_common/host/input_system.c    |   11 +-
 .../atomisp/pci/hive_isp_css_common/host/irq.c     |    9 -
 .../pci/hive_isp_css_common/host/irq_local.h       |    9 -
 .../pci/hive_isp_css_common/host/irq_private.h     |    9 -
 .../atomisp/pci/hive_isp_css_common/host/isp.c     |    9 -
 .../pci/hive_isp_css_common/host/isp_local.h       |    9 -
 .../pci/hive_isp_css_common/host/isp_private.h     |    9 -
 .../atomisp/pci/hive_isp_css_common/host/mmu.c     |    9 -
 .../pci/hive_isp_css_common/host/mmu_local.h       |    9 -
 .../atomisp/pci/hive_isp_css_common/host/sp.c      |    9 -
 .../pci/hive_isp_css_common/host/sp_local.h        |    9 -
 .../pci/hive_isp_css_common/host/sp_private.h      |    9 -
 .../pci/hive_isp_css_common/host/timed_ctrl.c      |    9 -
 .../hive_isp_css_common/host/timed_ctrl_local.h    |    9 -
 .../hive_isp_css_common/host/timed_ctrl_private.h  |    9 -
 .../pci/hive_isp_css_common/host/vamem_local.h     |    9 -
 .../atomisp/pci/hive_isp_css_common/host/vmem.c    |    9 -
 .../pci/hive_isp_css_common/host/vmem_local.h      |    9 -
 .../pci/hive_isp_css_common/host/vmem_private.h    |    9 -
 .../hive_isp_css_common/input_formatter_global.h   |    9 -
 .../atomisp/pci/hive_isp_css_common/irq_global.h   |    9 -
 .../atomisp/pci/hive_isp_css_common/isp_global.h   |    9 -
 .../atomisp/pci/hive_isp_css_common/mmu_global.h   |    9 -
 .../atomisp/pci/hive_isp_css_common/sp_global.h    |    9 -
 .../pci/hive_isp_css_common/timed_ctrl_global.h    |    9 -
 .../atomisp/pci/hive_isp_css_common/vamem_global.h |    9 -
 .../atomisp/pci/hive_isp_css_common/vmem_global.h  |    9 -
 .../staging/media/atomisp/pci/hive_isp_css_defs.h  |    9 -
 .../pci/hive_isp_css_include/assert_support.h      |    9 -
 .../pci/hive_isp_css_include/bitop_support.h       |    9 -
 .../atomisp/pci/hive_isp_css_include/csi_rx.h      |    9 -
 .../media/atomisp/pci/hive_isp_css_include/debug.h |    9 -
 .../device_access/device_access.h                  |    8 -
 .../media/atomisp/pci/hive_isp_css_include/dma.h   |    9 -
 .../atomisp/pci/hive_isp_css_include/event_fifo.h  |    9 -
 .../pci/hive_isp_css_include/fifo_monitor.h        |    9 -
 .../atomisp/pci/hive_isp_css_include/gdc_device.h  |    9 -
 .../atomisp/pci/hive_isp_css_include/gp_device.h   |    9 -
 .../atomisp/pci/hive_isp_css_include/gp_timer.h    |    9 -
 .../media/atomisp/pci/hive_isp_css_include/hmem.h  |    9 -
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |    9 -
 .../pci/hive_isp_css_include/host/debug_public.h   |    9 -
 .../pci/hive_isp_css_include/host/dma_public.h     |    9 -
 .../hive_isp_css_include/host/event_fifo_public.h  |    9 -
 .../host/fifo_monitor_public.h                     |    9 -
 .../pci/hive_isp_css_include/host/gdc_public.h     |    9 -
 .../hive_isp_css_include/host/gp_device_public.h   |    9 -
 .../hive_isp_css_include/host/gp_timer_public.h    |    9 -
 .../pci/hive_isp_css_include/host/hmem_public.h    |    9 -
 .../host/input_formatter_public.h                  |    9 -
 .../pci/hive_isp_css_include/host/irq_public.h     |    9 -
 .../pci/hive_isp_css_include/host/isp_public.h     |    9 -
 .../hive_isp_css_include/host/isys_dma_public.h    |    9 -
 .../hive_isp_css_include/host/isys_irq_public.h    |    9 -
 .../host/isys_stream2mmio_public.h                 |    9 -
 .../pci/hive_isp_css_include/host/mmu_public.h     |    9 -
 .../hive_isp_css_include/host/pixelgen_public.h    |    9 -
 .../pci/hive_isp_css_include/host/sp_public.h      |    9 -
 .../pci/hive_isp_css_include/host/tag_public.h     |    9 -
 .../hive_isp_css_include/host/timed_ctrl_public.h  |    9 -
 .../pci/hive_isp_css_include/host/vamem_public.h   |    9 -
 .../pci/hive_isp_css_include/host/vmem_public.h    |    9 -
 .../pci/hive_isp_css_include/input_formatter.h     |    9 -
 .../pci/hive_isp_css_include/input_system.h        |    9 -
 .../media/atomisp/pci/hive_isp_css_include/irq.h   |    9 -
 .../media/atomisp/pci/hive_isp_css_include/isp.h   |    9 -
 .../atomisp/pci/hive_isp_css_include/isys_irq.h    |    9 -
 .../pci/hive_isp_css_include/isys_stream2mmio.h    |    9 -
 .../pci/hive_isp_css_include/math_support.h        |    9 -
 .../pci/hive_isp_css_include/misc_support.h        |    9 -
 .../atomisp/pci/hive_isp_css_include/mmu_device.h  |    9 -
 .../atomisp/pci/hive_isp_css_include/pixelgen.h    |    9 -
 .../pci/hive_isp_css_include/platform_support.h    |    9 -
 .../pci/hive_isp_css_include/print_support.h       |    9 -
 .../media/atomisp/pci/hive_isp_css_include/queue.h |    9 -
 .../atomisp/pci/hive_isp_css_include/resource.h    |    9 -
 .../media/atomisp/pci/hive_isp_css_include/sp.h    |    9 -
 .../media/atomisp/pci/hive_isp_css_include/tag.h   |    9 -
 .../atomisp/pci/hive_isp_css_include/timed_ctrl.h  |    9 -
 .../pci/hive_isp_css_include/type_support.h        |    9 -
 .../media/atomisp/pci/hive_isp_css_include/vamem.h |    9 -
 .../media/atomisp/pci/hive_isp_css_include/vmem.h  |    9 -
 .../pci/hive_isp_css_shared/host/queue_local.h     |    9 -
 .../pci/hive_isp_css_shared/host/queue_private.h   |    9 -
 .../atomisp/pci/hive_isp_css_shared/host/tag.c     |    9 -
 .../pci/hive_isp_css_shared/host/tag_local.h       |    9 -
 .../pci/hive_isp_css_shared/host/tag_private.h     |    9 -
 .../atomisp/pci/hive_isp_css_shared/queue_global.h |    9 -
 .../pci/hive_isp_css_shared/sw_event_global.h      |    9 -
 .../atomisp/pci/hive_isp_css_shared/tag_global.h   |    9 -
 .../pci/hive_isp_css_streaming_to_mipi_types_hrt.h |    9 -
 drivers/staging/media/atomisp/pci/hive_types.h     |    9 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |   11 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |   11 -
 drivers/staging/media/atomisp/pci/ia_css.h         |    9 -
 drivers/staging/media/atomisp/pci/ia_css_3a.h      |    9 -
 .../staging/media/atomisp/pci/ia_css_acc_types.h   |    9 -
 drivers/staging/media/atomisp/pci/ia_css_buffer.h  |    9 -
 drivers/staging/media/atomisp/pci/ia_css_control.h |    9 -
 .../media/atomisp/pci/ia_css_device_access.c       |    9 -
 .../media/atomisp/pci/ia_css_device_access.h       |    9 -
 drivers/staging/media/atomisp/pci/ia_css_dvs.h     |    9 -
 drivers/staging/media/atomisp/pci/ia_css_env.h     |    9 -
 drivers/staging/media/atomisp/pci/ia_css_err.h     |    9 -
 .../media/atomisp/pci/ia_css_event_public.h        |    9 -
 .../staging/media/atomisp/pci/ia_css_firmware.h    |    9 -
 drivers/staging/media/atomisp/pci/ia_css_frac.h    |    9 -
 .../media/atomisp/pci/ia_css_frame_format.h        |    9 -
 .../media/atomisp/pci/ia_css_frame_public.h        |    9 -
 .../staging/media/atomisp/pci/ia_css_host_data.h   |    9 -
 .../staging/media/atomisp/pci/ia_css_input_port.h  |    9 -
 drivers/staging/media/atomisp/pci/ia_css_irq.h     |    9 -
 .../staging/media/atomisp/pci/ia_css_isp_configs.c |    9 -
 .../staging/media/atomisp/pci/ia_css_isp_configs.h |    9 -
 .../staging/media/atomisp/pci/ia_css_isp_params.c  |    9 -
 .../staging/media/atomisp/pci/ia_css_isp_params.h  |    9 -
 .../staging/media/atomisp/pci/ia_css_isp_states.c  |    9 -
 .../staging/media/atomisp/pci/ia_css_isp_states.h  |    9 -
 .../staging/media/atomisp/pci/ia_css_metadata.h    |    9 -
 drivers/staging/media/atomisp/pci/ia_css_mipi.h    |    9 -
 drivers/staging/media/atomisp/pci/ia_css_mmu.h     |    9 -
 .../staging/media/atomisp/pci/ia_css_mmu_private.h |    9 -
 drivers/staging/media/atomisp/pci/ia_css_morph.h   |    9 -
 drivers/staging/media/atomisp/pci/ia_css_pipe.h    |    9 -
 .../staging/media/atomisp/pci/ia_css_pipe_public.h |    9 -
 drivers/staging/media/atomisp/pci/ia_css_prbs.h    |    9 -
 .../staging/media/atomisp/pci/ia_css_properties.h  |    9 -
 drivers/staging/media/atomisp/pci/ia_css_shading.h |    9 -
 drivers/staging/media/atomisp/pci/ia_css_stream.h  |    9 -
 .../media/atomisp/pci/ia_css_stream_format.h       |    9 -
 .../media/atomisp/pci/ia_css_stream_public.h       |    9 -
 drivers/staging/media/atomisp/pci/ia_css_timer.h   |    8 -
 drivers/staging/media/atomisp/pci/ia_css_types.h   |    9 -
 drivers/staging/media/atomisp/pci/ia_css_version.h |    9 -
 .../media/atomisp/pci/ia_css_version_data.h        |    9 -
 drivers/staging/media/atomisp/pci/if_defs.h        |    9 -
 .../atomisp/pci/input_formatter_subsystem_defs.h   |    9 -
 .../media/atomisp/pci/input_selector_defs.h        |    9 -
 .../media/atomisp/pci/input_switch_2400_defs.h     |    9 -
 .../media/atomisp/pci/input_system_ctrl_defs.h     |    9 -
 .../staging/media/atomisp/pci/input_system_defs.h  |    9 -
 .../media/atomisp/pci/irq_controller_defs.h        |    9 -
 drivers/staging/media/atomisp/pci/irq_types_hrt.h  |    9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.c      |    9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2.host.h      |    9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_param.h     |    9 -
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |    9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  |    9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  |    9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_param.h |    9 -
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |    9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   |    9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   |    9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2_param.h  |    9 -
 .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.c |    9 -
 .../isp/kernels/anr/anr_2/ia_css_anr2_table.host.h |    9 -
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2_types.h  |    9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       |    9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       |    9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_param.h      |    9 -
 .../pci/isp/kernels/bh/bh_2/ia_css_bh_types.h      |    9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.c        |    9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm.host.h        |    9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm_param.h       |    9 -
 .../pci/isp/kernels/bnlm/ia_css_bnlm_types.h       |    9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.c    |    9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.h    |    9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_param.h   |    9 -
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h   |    9 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.c  |    9 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.h  |    9 -
 .../pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr_param.h |    9 -
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c  |    9 -
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.h  |    9 -
 .../pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr_param.h |    9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.c   |    9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.h   |    9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_param.h  |    9 -
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h  |    9 -
 .../conversion_1.0/ia_css_conversion.host.c        |    9 -
 .../conversion_1.0/ia_css_conversion.host.h        |    9 -
 .../conversion_1.0/ia_css_conversion_param.h       |    9 -
 .../conversion_1.0/ia_css_conversion_types.h       |    9 -
 .../copy_output_1.0/ia_css_copy_output.host.c      |    9 -
 .../copy_output_1.0/ia_css_copy_output.host.h      |    9 -
 .../copy_output_1.0/ia_css_copy_output_param.h     |    9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop.host.c   |    9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop.host.h   |    9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop_param.h  |    9 -
 .../isp/kernels/crop/crop_1.0/ia_css_crop_types.h  |    9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.c  |    9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.h  |    9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_param.h |    9 -
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h |    9 -
 .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.c    |    9 -
 .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.h    |    9 -
 .../isp/kernels/ctc/ctc1_5/ia_css_ctc1_5_param.h   |    9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c    |    9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.h    |    9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h   |    9 -
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h   |    9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.c  |    9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.h  |    9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_param.h |    9 -
 .../kernels/ctc/ctc_1.0/ia_css_ctc_table.host.c    |    9 -
 .../kernels/ctc/ctc_1.0/ia_css_ctc_table.host.h    |    9 -
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h |    9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.c     |    9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de.host.h     |    9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de_param.h    |    9 -
 .../pci/isp/kernels/de/de_1.0/ia_css_de_types.h    |    9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.c      |    9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2.host.h      |    9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2_param.h     |    9 -
 .../pci/isp/kernels/de/de_2/ia_css_de2_types.h     |    9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.c     |    9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.h     |    9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_param.h    |    9 -
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h    |    9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2.host.c        |    9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2.host.h        |    9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h       |    9 -
 .../pci/isp/kernels/dpc2/ia_css_dpc2_types.h       |    9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c  |    9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.h  |    9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_param.h |    9 -
 .../pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs_types.h |    9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c    |    9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8.host.h    |    9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_param.h   |    9 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h   |    9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats.host.c    |    9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats.host.h    |    9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats_param.h   |    9 -
 .../isp/kernels/fc/fc_1.0/ia_css_formats_types.h   |    9 -
 .../fixedbds/fixedbds_1.0/ia_css_fixedbds_param.h  |    9 -
 .../fixedbds/fixedbds_1.0/ia_css_fixedbds_types.h  |    9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c  |    9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.h  |    9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_param.h |    9 -
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h |    9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c     |    9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.h     |    9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_param.h    |    9 -
 .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.c   |    9 -
 .../isp/kernels/gc/gc_1.0/ia_css_gc_table.host.h   |    9 -
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h    |    9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.c      |    9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2.host.h      |    9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_param.h     |    9 -
 .../isp/kernels/gc/gc_2/ia_css_gc2_table.host.c    |    9 -
 .../isp/kernels/gc/gc_2/ia_css_gc2_table.host.h    |    9 -
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h     |    9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.c  |    9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr.host.h  |    9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_param.h |    9 -
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |    9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c  |    9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.h  |    9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_param.h |    9 -
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io_types.h |    9 -
 .../ipu2_io_ls/common/ia_css_common_io_param.h     |    8 -
 .../ipu2_io_ls/common/ia_css_common_io_types.h     |    8 -
 .../yuv444_io_ls/ia_css_yuv444_io.host.c           |    8 -
 .../yuv444_io_ls/ia_css_yuv444_io.host.h           |    8 -
 .../yuv444_io_ls/ia_css_yuv444_io_param.h          |    8 -
 .../yuv444_io_ls/ia_css_yuv444_io_types.h          |    8 -
 .../iterator/iterator_1.0/ia_css_iterator.host.c   |    9 -
 .../iterator/iterator_1.0/ia_css_iterator.host.h   |    9 -
 .../iterator/iterator_1.0/ia_css_iterator_param.h  |    9 -
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.c |    9 -
 .../isp/kernels/macc/macc1_5/ia_css_macc1_5.host.h |    9 -
 .../kernels/macc/macc1_5/ia_css_macc1_5_param.h    |    9 -
 .../macc/macc1_5/ia_css_macc1_5_table.host.c       |    9 -
 .../macc/macc1_5/ia_css_macc1_5_table.host.h       |    9 -
 .../kernels/macc/macc1_5/ia_css_macc1_5_types.h    |    9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc.host.c   |    9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc.host.h   |    9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc_param.h  |    9 -
 .../kernels/macc/macc_1.0/ia_css_macc_table.host.c |    9 -
 .../kernels/macc/macc_1.0/ia_css_macc_table.host.h |    9 -
 .../isp/kernels/macc/macc_1.0/ia_css_macc_types.h  |    9 -
 .../isp/kernels/norm/norm_1.0/ia_css_norm.host.c   |    9 -
 .../isp/kernels/norm/norm_1.0/ia_css_norm.host.h   |    9 -
 .../isp/kernels/norm/norm_1.0/ia_css_norm_param.h  |    9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.c       |    9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2.host.h       |    9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_param.h      |    9 -
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_types.h      |    9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.c     |    9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.h     |    9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_param.h    |    9 -
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h    |    9 -
 .../kernels/output/output_1.0/ia_css_output.host.c |    9 -
 .../kernels/output/output_1.0/ia_css_output.host.h |    9 -
 .../output/output_1.0/ia_css_output_param.h        |    9 -
 .../output/output_1.0/ia_css_output_types.h        |    9 -
 .../kernels/qplane/qplane_2/ia_css_qplane.host.c   |    9 -
 .../kernels/qplane/qplane_2/ia_css_qplane.host.h   |    9 -
 .../kernels/qplane/qplane_2/ia_css_qplane_param.h  |    9 -
 .../kernels/qplane/qplane_2/ia_css_qplane_types.h  |    9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c  |    9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.h  |    9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_param.h |    9 -
 .../pci/isp/kernels/raw/raw_1.0/ia_css_raw_types.h |    9 -
 .../raw_aa_binning_1.0/ia_css_raa.host.c           |    9 -
 .../raw_aa_binning_1.0/ia_css_raa.host.h           |    9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c  |    9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.h  |    9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_param.h |    9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_state.h |    9 -
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref_types.h |    9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c  |    9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h  |    9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_param.h |    9 -
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h |    9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c     |    9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h     |    9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_param.h    |    9 -
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h    |    9 -
 .../kernels/sdis/common/ia_css_sdis_common.host.h  |    9 -
 .../kernels/sdis/common/ia_css_sdis_common_types.h |    9 -
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   |    9 -
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.h   |    9 -
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h  |    9 -
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c    |    9 -
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2.host.h    |    9 -
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h   |    9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.c  |    9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.h  |    9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_param.h |    9 -
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h |    9 -
 .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h   |    8 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c  |    9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h  |    9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_param.h |    9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_state.h |    9 -
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h |    9 -
 .../pci/isp/kernels/uds/uds_1.0/ia_css_uds_param.h |    9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c     |    9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.h     |    9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h    |    9 -
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h    |    9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.c     |    9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.h     |    9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_param.h    |    9 -
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h    |    9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.c  |    9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.h  |    9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_param.h |    9 -
 .../kernels/xnr/xnr_1.0/ia_css_xnr_table.host.c    |    9 -
 .../kernels/xnr/xnr_1.0/ia_css_xnr_table.host.h    |    9 -
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h |    9 -
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.c |    9 -
 .../pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.host.h |    9 -
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_param.h    |    9 -
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h    |    9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.c  |    9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.h  |    9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_param.h |    9 -
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h |    9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.c   |    9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.h   |    9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_param.h  |    9 -
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h  |    9 -
 .../pci/isp/modes/interface/input_buf.isp.h        |    8 -
 .../atomisp/pci/isp/modes/interface/isp_const.h    |    8 -
 .../atomisp/pci/isp/modes/interface/isp_types.h    |    9 -
 .../atomisp/pci/isp2400_input_system_global.h      |    9 -
 .../media/atomisp/pci/isp2400_input_system_local.h |    9 -
 .../atomisp/pci/isp2400_input_system_private.h     |    9 -
 .../atomisp/pci/isp2400_input_system_public.h      |    9 -
 .../staging/media/atomisp/pci/isp2400_support.h    |    9 -
 .../atomisp/pci/isp2401_input_system_global.h      |    9 -
 .../media/atomisp/pci/isp2401_input_system_local.h |    9 -
 .../atomisp/pci/isp2401_input_system_private.h     |    9 -
 .../media/atomisp/pci/isp_acquisition_defs.h       |    9 -
 .../staging/media/atomisp/pci/isp_capture_defs.h   |    9 -
 .../staging/media/atomisp/pci/mamoiada_params.h    |    9 -
 drivers/staging/media/atomisp/pci/mmu/isp_mmu.c    |   11 -
 .../staging/media/atomisp/pci/mmu/sh_mmu_mrfld.c   |   11 -
 drivers/staging/media/atomisp/pci/mmu_defs.h       |    9 -
 .../pci/runtime/binary/interface/ia_css_binary.h   |    9 -
 .../media/atomisp/pci/runtime/binary/src/binary.c  |   11 +-
 .../pci/runtime/bufq/interface/ia_css_bufq.h       |    9 -
 .../pci/runtime/bufq/interface/ia_css_bufq_comm.h  |    9 -
 .../media/atomisp/pci/runtime/bufq/src/bufq.c      |    9 -
 .../pci/runtime/debug/interface/ia_css_debug.h     |    9 -
 .../debug/interface/ia_css_debug_internal.h        |    9 -
 .../runtime/debug/interface/ia_css_debug_pipe.h    |    9 -
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |    9 -
 .../pci/runtime/event/interface/ia_css_event.h     |    9 -
 .../media/atomisp/pci/runtime/event/src/event.c    |    9 -
 .../pci/runtime/eventq/interface/ia_css_eventq.h   |    9 -
 .../media/atomisp/pci/runtime/eventq/src/eventq.c  |    9 -
 .../pci/runtime/frame/interface/ia_css_frame.h     |    9 -
 .../runtime/frame/interface/ia_css_frame_comm.h    |    9 -
 .../media/atomisp/pci/runtime/frame/src/frame.c    |   11 +-
 .../pci/runtime/ifmtr/interface/ia_css_ifmtr.h     |    9 -
 .../media/atomisp/pci/runtime/ifmtr/src/ifmtr.c    |    9 -
 .../runtime/inputfifo/interface/ia_css_inputfifo.h |    9 -
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |    9 -
 .../runtime/isp_param/interface/ia_css_isp_param.h |    9 -
 .../isp_param/interface/ia_css_isp_param_types.h   |    8 -
 .../atomisp/pci/runtime/isp_param/src/isp_param.c  |    9 -
 .../pci/runtime/isys/interface/ia_css_isys.h       |    9 -
 .../pci/runtime/isys/interface/ia_css_isys_comm.h  |    9 -
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.c     |    9 -
 .../atomisp/pci/runtime/isys/src/csi_rx_rmgr.h     |    9 -
 .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c  |    9 -
 .../atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.h  |    9 -
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.c   |    9 -
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.h   |    9 -
 .../media/atomisp/pci/runtime/isys/src/isys_init.c |    9 -
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.c   |    9 -
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.h   |    9 -
 .../media/atomisp/pci/runtime/isys/src/rx.c        |    9 -
 .../atomisp/pci/runtime/isys/src/virtual_isys.c    |    9 -
 .../atomisp/pci/runtime/isys/src/virtual_isys.h    |    9 -
 .../runtime/pipeline/interface/ia_css_pipeline.h   |    9 -
 .../pipeline/interface/ia_css_pipeline_common.h    |    9 -
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |    9 -
 .../pci/runtime/queue/interface/ia_css_queue.h     |    9 -
 .../runtime/queue/interface/ia_css_queue_comm.h    |    9 -
 .../media/atomisp/pci/runtime/queue/src/queue.c    |    9 -
 .../atomisp/pci/runtime/queue/src/queue_access.c   |    9 -
 .../atomisp/pci/runtime/queue/src/queue_access.h   |    9 -
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h       |    9 -
 .../pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h  |    9 -
 .../media/atomisp/pci/runtime/rmgr/src/rmgr.c      |    9 -
 .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c |    9 -
 .../pci/runtime/spctrl/interface/ia_css_spctrl.h   |    9 -
 .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |    9 -
 .../media/atomisp/pci/runtime/spctrl/src/spctrl.c  |    9 -
 .../tagger/interface/ia_css_tagger_common.h        |    9 -
 .../media/atomisp/pci/runtime/timer/src/timer.c    |    9 -
 .../atomisp/pci/scalar_processor_2400_params.h     |    9 -
 drivers/staging/media/atomisp/pci/sh_css.c         |   12 -
 drivers/staging/media/atomisp/pci/sh_css_defs.h    |    9 -
 .../staging/media/atomisp/pci/sh_css_firmware.c    |    9 -
 .../staging/media/atomisp/pci/sh_css_firmware.h    |    9 -
 drivers/staging/media/atomisp/pci/sh_css_frac.h    |   15 +-
 .../staging/media/atomisp/pci/sh_css_host_data.c   |    9 -
 drivers/staging/media/atomisp/pci/sh_css_hrt.c     |    9 -
 drivers/staging/media/atomisp/pci/sh_css_hrt.h     |    9 -
 .../staging/media/atomisp/pci/sh_css_internal.h    |    9 -
 drivers/staging/media/atomisp/pci/sh_css_legacy.h  |    9 -
 drivers/staging/media/atomisp/pci/sh_css_metrics.c |    9 -
 drivers/staging/media/atomisp/pci/sh_css_metrics.h |    9 -
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   11 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.h    |    9 -
 drivers/staging/media/atomisp/pci/sh_css_mmu.c     |    9 -
 .../staging/media/atomisp/pci/sh_css_param_dvs.c   |    9 -
 .../staging/media/atomisp/pci/sh_css_param_dvs.h   |    9 -
 .../media/atomisp/pci/sh_css_param_shading.c       |    9 -
 .../media/atomisp/pci/sh_css_param_shading.h       |    9 -
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   11 +-
 drivers/staging/media/atomisp/pci/sh_css_params.h  |    9 -
 .../media/atomisp/pci/sh_css_params_internal.h     |    9 -
 .../staging/media/atomisp/pci/sh_css_properties.c  |    9 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |    9 -
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |    9 -
 .../media/atomisp/pci/sh_css_stream_format.c       |    9 -
 .../media/atomisp/pci/sh_css_stream_format.h       |    9 -
 drivers/staging/media/atomisp/pci/sh_css_struct.h  |    9 -
 drivers/staging/media/atomisp/pci/sh_css_uds.h     |    9 -
 drivers/staging/media/atomisp/pci/sh_css_version.c |    9 -
 drivers/staging/media/atomisp/pci/str2mem_defs.h   |    9 -
 .../media/atomisp/pci/streaming_to_mipi_defs.h     |    9 -
 drivers/staging/media/atomisp/pci/system_local.c   |    9 -
 drivers/staging/media/atomisp/pci/system_local.h   |    9 -
 .../media/atomisp/pci/timed_controller_defs.h      |    9 -
 drivers/staging/media/atomisp/pci/version.h        |    9 -
 .../media/deprecated/atmel/atmel-isc-base.c        |    2 -
 drivers/staging/media/imx/imx-media-capture.c      |    2 -
 drivers/staging/media/imx/imx-media-csc-scaler.c   |    2 -
 drivers/staging/media/ipu3/ipu3-css-params.c       |    6 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    2 -
 drivers/staging/media/max96712/max96712.c          |   56 +-
 drivers/staging/media/meson/vdec/vdec.c            |    2 -
 drivers/staging/media/omap4iss/Kconfig             |   12 -
 drivers/staging/media/omap4iss/Makefile            |    9 -
 drivers/staging/media/omap4iss/TODO                |    3 -
 drivers/staging/media/omap4iss/iss.c               | 1354 -----------
 drivers/staging/media/omap4iss/iss.h               |  247 --
 drivers/staging/media/omap4iss/iss_csi2.c          | 1379 -----------
 drivers/staging/media/omap4iss/iss_csi2.h          |  155 --
 drivers/staging/media/omap4iss/iss_csiphy.c        |  277 ---
 drivers/staging/media/omap4iss/iss_csiphy.h        |   47 -
 drivers/staging/media/omap4iss/iss_ipipe.c         |  579 -----
 drivers/staging/media/omap4iss/iss_ipipe.h         |   63 -
 drivers/staging/media/omap4iss/iss_ipipeif.c       |  844 -------
 drivers/staging/media/omap4iss/iss_ipipeif.h       |   89 -
 drivers/staging/media/omap4iss/iss_regs.h          |  899 -------
 drivers/staging/media/omap4iss/iss_resizer.c       |  884 -------
 drivers/staging/media/omap4iss/iss_resizer.h       |   72 -
 drivers/staging/media/omap4iss/iss_video.c         | 1274 ----------
 drivers/staging/media/omap4iss/iss_video.h         |  203 --
 drivers/staging/media/rkvdec/rkvdec.c              |    2 -
 drivers/staging/media/starfive/camss/stf-video.c   |    2 -
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |    2 -
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c      |    2 -
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c       |    2 -
 drivers/staging/media/tegra-video/vi.c             |    2 -
 include/linux/platform_data/media/omap4iss.h       |   66 -
 include/linux/usb/uvc.h                            |    6 +
 include/media/i2c/mt9p031.h                        |   18 -
 include/media/i2c/ths7303.h                        |    2 +-
 include/media/media-entity.h                       |   10 +-
 include/media/media-request.h                      |    2 +-
 include/media/v4l2-dev.h                           |   15 +
 include/media/v4l2-dv-timings.h                    |   66 +-
 include/media/v4l2-subdev.h                        |   17 +-
 .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
 .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
 include/uapi/linux/v4l2-dv-timings.h               |    2 +-
 include/uapi/linux/videodev2.h                     |    6 +
 samples/v4l/v4l2-pci-skeleton.c                    |    6 +-
 1058 files changed, 9802 insertions(+), 17208 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/omap4_camera.rst
 create mode 100644 Documentation/admin-guide/media/raspberrypi-rp1-cfe.dot
 create mode 100644 Documentation/admin-guide/media/raspberrypi-rp1-cfe.rst
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov08x4=
0.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8953-ca=
mss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,rp1=
-cfe.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-fe.r=
st
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16i.rst
 delete mode 100644 drivers/media/pci/mantis/mantis_core.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe-fmts.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe-trace.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.c
 create mode 100644 drivers/media/platform/raspberrypi/rp1-cfe/pisp-fe.h
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs=
.h
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthel=
per.c
 delete mode 100644 drivers/staging/media/atomisp/include/linux/libmsrlisth=
elper.h
 delete mode 100644 drivers/staging/media/omap4iss/Kconfig
 delete mode 100644 drivers/staging/media/omap4iss/Makefile
 delete mode 100644 drivers/staging/media/omap4iss/TODO
 delete mode 100644 drivers/staging/media/omap4iss/iss.c
 delete mode 100644 drivers/staging/media/omap4iss/iss.h
 delete mode 100644 drivers/staging/media/omap4iss/iss_csi2.c
 delete mode 100644 drivers/staging/media/omap4iss/iss_csi2.h
 delete mode 100644 drivers/staging/media/omap4iss/iss_csiphy.c
 delete mode 100644 drivers/staging/media/omap4iss/iss_csiphy.h
 delete mode 100644 drivers/staging/media/omap4iss/iss_ipipe.c
 delete mode 100644 drivers/staging/media/omap4iss/iss_ipipe.h
 delete mode 100644 drivers/staging/media/omap4iss/iss_ipipeif.c
 delete mode 100644 drivers/staging/media/omap4iss/iss_ipipeif.h
 delete mode 100644 drivers/staging/media/omap4iss/iss_regs.h
 delete mode 100644 drivers/staging/media/omap4iss/iss_resizer.c
 delete mode 100644 drivers/staging/media/omap4iss/iss_resizer.h
 delete mode 100644 drivers/staging/media/omap4iss/iss_video.c
 delete mode 100644 drivers/staging/media/omap4iss/iss_video.h
 delete mode 100644 include/linux/platform_data/media/omap4iss.h
 delete mode 100644 include/media/i2c/mt9p031.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_fe_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_fe_statistics=
.h


