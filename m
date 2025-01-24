Return-Path: <linux-media+bounces-25251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C90A1B0A9
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 08:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 674303AB116
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 07:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2931DA631;
	Fri, 24 Jan 2025 07:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSz/EGB7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627633998;
	Fri, 24 Jan 2025 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702304; cv=none; b=Q/Igaj5wroG3RURvEEtaqJ+Usm0GvnrseBKl6xkAFqAqxqxpSaRzOcAE0R0rjAmCxNS4ziMQ72JC7F4ya56IxjAyEx/VLoKbqGH4UMCReYmYq5PIK6YGqOQku5KLyD+wgxN1CPlLjufZ57OfF9VLlYBVmMyR4OdUSi63Ycxxy3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702304; c=relaxed/simple;
	bh=thH212u2Xs0bK5Cob64JenqESjj7uS5ZJi9Yg/6Sog4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TarNIU8wQcaMbnj+AmDElHz1MrgKaRS845qmadW7RcTzqEl6wJfdi4MFsHIz8TGe42Jrb2qn6GK3sD4Peh9iCr63+NHlPhlrAxsQr14vW3J80kyUIDZ39Z5jFcXLJtvliKSb2AiVPT53l3sS6BP5CQ5/aZ7JVFhhli0gqyh5iTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSz/EGB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E1DC4CED2;
	Fri, 24 Jan 2025 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737702303;
	bh=thH212u2Xs0bK5Cob64JenqESjj7uS5ZJi9Yg/6Sog4=;
	h=Date:From:To:Cc:Subject:From;
	b=WSz/EGB7ZDUYpVdUBxrZT5/fSdUfvHEqY5Tv6UpU+Vmo2Kn4lfEJRyJFd5D/gdAD0
	 WOIchMhrSioR5BDRD/4+Zpv3bqFnEemS++gg4nnYFczdcubYlgy0ZyTWdqEMbjbhXE
	 Qrd7VkLUfeFlRdwDdpf2+RvsCGiZCcF0dqcY0iYbcTWNzL1FQktRMqn+zNjh3uzXf4
	 IXlyCMqESjKg0WdvxkJQ5TpAeSqy/lnHyDDtTSTYCUtVcJDOvFzVee5SMg+ZMJain9
	 MzuYnSbduxuL3lBlfDq+txgO0zhHP5WKNrrqokRJ6qVh9+/t/d9BRh96Y15GaB+3TF
	 24DehWEugZN9w==
Date: Fri, 24 Jan 2025 08:04:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.14] media updates
Message-ID: <20250124080453.375976a7@foz.lan>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v6.14-1

For:

- Sensor driver fixes;
- remove dead TI wl128x FM radio driver;
- Add support for the imx462 sensor at the IMX290 binding
- V4L2 pixel data transmitter and receiver documentation improvements;
- Add support for MIPI Discovery and Configuration for C-PHY line orders;
- imx8-isi fixes and improvements;
- stm32: dcmipp: add core support for the stm32mp25;
- qcom: camss: Add sc7280 support;
- Various fixes and enhancements.
   =20
Regards,
Mauro

---

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v6.14-1

for you to fetch changes up to c4b7779abc6633677e6edb79e2809f4f61fde157:

  media: nuvoton: Fix an error check in npcm_video_ece_init() (2025-01-08 1=
4:59:59 +0000)

----------------------------------------------------------------
[GIT PULL for v6.14] media updates

----------------------------------------------------------------
Alain Volmat (13):
      media: stm32: dcmipp: correct dma_set_mask_and_coherent mask value
      dt-bindings: media: add description of stm32 csi
      media: stm32: csi: addition of the STM32 CSI driver
      media: stm32: dcmipp: use v4l2_subdev_is_streaming
      media: stm32: dcmipp: replace s_stream with enable/disable_streams
      media: stm32: dcmipp: rename dcmipp_parallel into dcmipp_input
      media: stm32: dcmipp: add support for csi input into dcmipp-input
      media: stm32: dcmipp: add bayer 10~14 bits formats
      media: stm32: dcmipp: add 1X16 RGB / YUV formats support
      media: stm32: dcmipp: avoid duplicated format on enum in bytecap
      media: stm32: dcmipp: fill media ctl hw_revision field
      dt-bindings: media: add the stm32mp25 compatible of DCMIPP
      media: stm32: dcmipp: add core support for the stm32mp25

Andy Yan (1):
      media: rockchip: rga: Fix Copyright description

Ariel Otilibili (1):
      media: saa7164: Remove unused values

Arnd Bergmann (1):
      media: cxd2841er: fix 64-bit division on gcc-9

Benjamin Gaignard (3):
      media: verisilicon: Store reference frames pixels format
      media: verisilicon: Fix IMX8 native pixel-format step values
      media: verisilicon: av1: Store chroma and mv offsets

Benoit Sevens (1):
      media: uvcvideo: Refactor frame parsing code into a uvc_parse_frame f=
unction

Biju Das (1):
      media: platform: rzg2l-cru: rzg2l-video: Fix the comment in rzg2l_cru=
_start_streaming_vq()

Bryan O'Donoghue (4):
      media: venus: Add support for static video encoder/decoder declaratio=
ns
      media: venus: Populate video encoder/decoder nodename entries
      media: dt-bindings: qcom-venus: Deprecate video-decoder and video-enc=
oder where applicable
      Revert "media: qcom: camss: Restructure camss_link_entities"

Caleb Connolly (1):
      media: qcom: camss: document csiphy_lanes_cfg structure

Chen Ni (1):
      media: lmedm04: Handle errors for lme2510_int_read

Christophe JAILLET (1):
      media: s5p-mfc: Fix an error handling path s5p_mfc_open()

Chun-Kuang Hu (3):
      media: platform: mtk-mdp3: Get fine-grain control of cmdq_pkt_finaliz=
e()
      media: platform: mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy=
()
      soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

Colin Ian King (1):
      media: cx231xx: remove redundant assignment to variable value

Cosmin Tanislav (1):
      media: mc: fix endpoint iteration

Dan Carpenter (1):
      media: imx-jpeg: Fix potential error pointer dereference in detach_pm=
()

Dave Stevenson (5):
      media: i2c: imx290: Limit analogue gain according to module
      media: i2c: imx290: Register 0x3011 varies between imx327 and imx290
      media: dt-bindings: sony,imx290: Add IMX462 to the IMX290 binding
      media: i2c: imx290: Add configuration for IMX462
      media: i2c: ov9282: Correct the exposure offset

David Heidelberg (1):
      media: Documentation: PHY information can be obtained from OF endpoin=
t too

Desnes Nunes (1):
      media: dvb-usb-v2: af9035: fix ISO C90 compilation error on af9035_i2=
c_master_xfer

Dheeraj Reddy Jonnalagadda (1):
      media: rkisp1: Fix unused value issue

Dr. David Alan Gilbert (6):
      media: b2c2: Remove unused functions
      media: platform: exynos4-is: Remove unused fimc_is_param_strerr
      media: tuners: fc0013 Remove unused functions
      media: cx18: Remove unused cx18_reset_ir_gpio
      media: venus: Remove unused hfi_core_ping()
      media: platform: exynos4-is: Remove unused __is_get_frame_size

Edward Adam Davis (1):
      media: vidtv: Fix a null-ptr-deref in vidtv_mux_stop_thread

Guoniu.zhou (2):
      dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string
      media: nxp: imx8-isi: Add i.MX8ULP support

Hans de Goede (4):
      media: ov2740: Debug log chip ID
      media: ov2740: Add camera orientation and sensor rotation controls
      media: ov2740: Add powerdown GPIO support
      media: ov2740: Add regulator support

Isaac Scott (3):
      media: uvcvideo: Implement dual stream quirk to fix loss of usb packe=
ts
      media: uvcvideo: Add new quirk definition for the Sonix Technology Co=
. 292a camera
      media: uvcvideo: Add Kurokesu C1 PRO camera

Jacopo Mondi (1):
      media: rkisp1: Reduce min_queued_buffers to 1

Jani Nikula (1):
      media: cec: include linux/debugfs.h and linux/seq_file.h where needed

Jiasheng Jiang (3):
      media: marvell: Add check for clk_enable()
      media: mipi-csis: Add check for clk_enable()
      media: camif-core: Add check for clk_enable()

Joe Hattori (1):
      staging: media: imx: fix OF node leak in imx_media_add_of_subdevs()

Krzysztof Kozlowski (1):
      media: dt-bindings: trivial white-space and example cleanup

Laurent Pinchart (2):
      media: uvcvideo: Fix double free in error path
      MAINTAINERS: Add missing file entries for the USB video class driver

Laurentiu Palcu (2):
      staging: media: max96712: fix kernel oops when removing module
      media: nxp: imx8-isi: fix v4l2-compliance test errors

Lubomir Rintel (1):
      media: mmp: Bring back registration of the device

Luca Weiss (1):
      media: i2c: imx412: Add missing newline to prints

Lukas Bulwahn (2):
      media: remove dead TI wl128x FM radio driver
      MAINTAINERS: repair file entry in MEDIA DRIVERS FOR STM32 - CSI

Martin T=C5=AFma (3):
      media: mgb4: Unify the outputs padding logic with the inputs
      media: mgb4: Unify register names in inputs/outputs
      media: mgb4: Defines cleanup

Mehdi Djait (3):
      media: ccs: Fix cleanup order in ccs_probe()
      media: ccs: Print a warning on CCS static data parser failure
      media: ccs: Fail the probe on CCS static data parser failure

Mohammed Anees (1):
      media: platform: mtk-mdp3: cmdq: Remove duplicated platforms checks

Naushir Patuck (5):
      media: imx296: Add standby delay during probe
      media: bcm2835-unicam: Improve frame sequence count handling
      media: bcm2835-unicam: Allow setting of unpacked formats
      media: bcm2835-unicam: Disable trigger mode operation
      media: bcm2835-unicam: Fix for possible dummy buffer overrun

Nicolas Dufresne (1):
      media: hantro: Replace maintainers

Niklas S=C3=B6derlund (4):
      media: dt-bindings: Add property to describe CSI-2 C-PHY line orders
      media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders
      media: rcar-csi2: Allow specifying C-PHY line order
      media: rcar-csi2: Update D-PHY startup on V4M

N=C3=ADcolas F. R. A. Prado (4):
      media: platform: mtk-mdp3: Use cmdq_pkt_write when no mask is needed
      media: platform: mtk-mdp3: Remove useless variadic arguments from mac=
ros
      media: platform: mtk-mdp3: Remove mask parameter from MM_REG_WRITE ma=
cro
      media: platform: mtk-mdp3: Remove mask parameter from MM_REG_POLL mac=
ro

Oliver Neukum (1):
      media: rc: iguanair: handle timeouts

Paul Kocialkowski (1):
      MAINTAINERS: Update own email address from Bootlin to sys-base

Ricardo Ribalda (16):
      media: uvcvideo: Reorder uvc_status_init()
      media: uvcvideo: Fix crash during unbind if gpio unit is in use
      media: uvcvideo: Fix deadlock during uvc_probe
      media: uvcvideo: Fix event flags in uvc_ctrl_send_events
      media: uvcvideo: Support partial control reads
      media: uvcvideo: Add more logging to uvc_query_ctrl()
      media: uvcvideo: Remove duplicated cap/out code
      media: uvcvideo: Only save async fh if success
      media: uvcvideo: Remove redundant NULL assignment
      media: uvcvideo: Remove dangling pointers
      media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
      media: uvcvideo: Flush the control cache when we get an event
      media: uvcvideo: Propagate buf->error to userspace
      media: uvcvideo: Invert default value for nodrop module param
      media: uvcvideo: Allow changing noparam on the fly
      media: uvcvideo: Announce the user our deprecation intentions

Sakari Ailus (4):
      media: Documentation: ipu3: Remove unused and obsolete references
      media: ccs: Fix CCS static data parsing for large block sizes
      media: ccs: Clean up parsed CCS static data on parse failure
      media: Documentation: tx-rx: Fix formatting

Sam Bobrowicz (1):
      media: ov5640: fix get_light_freq on auto

Sean Young (2):
      media: mceusb: don't push static constants on stack for %*ph
      media: imon: don't push static constants on stack for %*ph

Sergey Senozhatsky (2):
      media: venus: destroy hfi session after m2m_ctx release
      media: venus: match instance creation and destruction order

Stanislaw Gruszka (2):
      media: intel/ipu6: remove cpu latency qos request on error
      media: intel/ipu6: move some boot messages to debug level

Suresh Vankadara (1):
      media: qcom: camss: Add support for camss driver on sc7280

Thomas Wei=C3=9Fschuh (2):
      media: i2c: imx208: Use const 'struct bin_attribute' callback
      media: solo6x10: Use const 'struct bin_attribute' callback

Tomi Valkeinen (15):
      media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
      media: i2c: ds90ub960: Fix UB9702 refclk register access
      media: i2c: ds90ub960: Fix use of non-existing registers on UB9702
      media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
      media: i2c: ds90ub960: Fix UB9702 VC map
      media: i2c: ds90ub960: Use HZ_PER_MHZ
      media: i2c: ds90ub960: Add support for I2C_RX_ID
      media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10 formats
      media: i2c: ds90ub953: Clear CRC errors in ub953_log_status()
      media: i2c: ds90ub960: Drop unused indirect block define
      media: i2c: ds90ub960: Reduce sleep in ub960_rxport_wait_locks()
      media: i2c: ds90ub960: Handle errors in ub960_log_status_ub960_sp_eq()
      media: i2c: ds90ub913: Add error handling to ub913_hw_init()
      media: i2c: ds90ub953: Add error handling for i2c reads/writes
      media: i2c: ds90ub960: Fix shadowing of local variables

Vikram Sharma (4):
      media: qcom: camss: reducing the repitious error message string
      media: qcom: camss: Restructure camss_link_entities
      media: dt-bindings: Add qcom,sc7280-camss
      media: qcom: camss: Sort camss version enums and compatible strings

Vladimir Zapolskiy (3):
      dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
      dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
      dt-bindings: media: qcom,sm8250-camss: Fix interrupt types

Wolfram Sang (1):
      media: mceusb: don't include 'pm_wakeup.h' directly

Xiong Nandi (1):
      media: uvcvideo: Use uvc_query_name in uvc_get_video_ctrl

Zhen Lei (1):
      media: nuvoton: Fix an error check in npcm_video_ece_init()

jieqing.wang (1):
      media: fix secfeed undefined when filter alloc fail

 Documentation/admin-guide/media/ipu3.rst           |    6 +-
 .../bindings/media/allwinner,sun50i-h6-vpu-g2.yaml |    1 -
 .../bindings/media/amlogic,meson-ir-tx.yaml        |    1 -
 .../devicetree/bindings/media/amphion,vpu.yaml     |    1 -
 .../devicetree/bindings/media/fsl,imx6ull-pxp.yaml |    1 -
 .../devicetree/bindings/media/i2c/sony,imx290.yaml |    2 +
 .../bindings/media/mediatek,vcodec-decoder.yaml    |    1 -
 .../bindings/media/mediatek,vcodec-encoder.yaml    |    1 -
 .../media/mediatek,vcodec-subdev-decoder.yaml      |    1 -
 .../bindings/media/microchip,sama5d4-vdec.yaml     |   19 +-
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |    2 +
 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml  |   41 +-
 .../bindings/media/qcom,msm8916-camss.yaml         |    1 -
 .../bindings/media/qcom,msm8916-venus.yaml         |   12 +-
 .../bindings/media/qcom,msm8996-camss.yaml         |    1 -
 .../bindings/media/qcom,sc7180-venus.yaml          |   12 +-
 .../bindings/media/qcom,sc7280-camss.yaml          |  425 +++++
 .../bindings/media/qcom,sc7280-venus.yaml          |   12 +-
 .../bindings/media/qcom,sc8280xp-camss.yaml        |   40 +-
 .../bindings/media/qcom,sdm660-camss.yaml          |    1 -
 .../bindings/media/qcom,sdm845-camss.yaml          |   21 +-
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |   12 +-
 .../bindings/media/qcom,sm8250-camss.yaml          |   29 +-
 .../bindings/media/qcom,sm8250-venus.yaml          |   12 +-
 .../bindings/media/rockchip,rk3568-vepu.yaml       |    1 -
 .../devicetree/bindings/media/rockchip-vpu.yaml    |   31 +-
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml |   53 +-
 .../bindings/media/st,stm32mp25-csi.yaml           |  125 ++
 .../bindings/media/video-interfaces.yaml           |   21 +
 Documentation/driver-api/media/tx-rx.rst           |    9 +-
 MAINTAINERS                                        |   25 +-
 drivers/media/cec/core/cec-adap.c                  |    5 +-
 drivers/media/cec/core/cec-core.c                  |    5 +-
 drivers/media/cec/core/cec-pin-error-inj.c         |    3 +-
 drivers/media/cec/core/cec-pin.c                   |    3 +-
 drivers/media/cec/platform/cec-gpio/cec-gpio.c     |    7 +-
 drivers/media/common/b2c2/flexcop-common.h         |    4 -
 drivers/media/common/b2c2/flexcop-misc.c           |   13 -
 drivers/media/dvb-core/dmxdev.c                    |    2 +-
 drivers/media/dvb-frontends/cxd2841er.c            |    8 +-
 drivers/media/i2c/ccs/ccs-core.c                   |   18 +-
 drivers/media/i2c/ccs/ccs-data.c                   |   15 +-
 drivers/media/i2c/ds90ub913.c                      |   26 +-
 drivers/media/i2c/ds90ub953.c                      |   56 +-
 drivers/media/i2c/ds90ub960.c                      |  188 ++-
 drivers/media/i2c/imx208.c                         |    2 +-
 drivers/media/i2c/imx290.c                         |   81 +-
 drivers/media/i2c/imx296.c                         |    2 +
 drivers/media/i2c/imx412.c                         |   42 +-
 drivers/media/i2c/ov2740.c                         |   58 +-
 drivers/media/i2c/ov5640.c                         |    1 +
 drivers/media/i2c/ov9282.c                         |    2 +-
 drivers/media/pci/b2c2/flexcop-dma.c               |   17 -
 drivers/media/pci/cx18/cx18-gpio.c                 |   15 -
 drivers/media/pci/cx18/cx18-gpio.h                 |    1 -
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |    8 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |    2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |    1 +
 drivers/media/pci/mgb4/mgb4_core.c                 |    4 +-
 drivers/media/pci/mgb4/mgb4_core.h                 |    3 -
 drivers/media/pci/mgb4/mgb4_sysfs_in.c             |   12 +-
 drivers/media/pci/mgb4/mgb4_vin.c                  |   20 +-
 drivers/media/pci/mgb4/mgb4_vin.h                  |    4 +-
 drivers/media/pci/mgb4/mgb4_vout.c                 |   14 +-
 drivers/media/pci/saa7164/saa7164-vbi.c            |    2 -
 drivers/media/pci/solo6x10/solo6x10-core.c         |    4 +-
 drivers/media/platform/broadcom/bcm2835-unicam.c   |   42 +-
 drivers/media/platform/marvell/mcam-core.c         |    7 +-
 drivers/media/platform/marvell/mmp-driver.c        |   21 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   |   77 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h   |    1 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   |  537 +++----
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.h   |   29 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    2 +
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |    1 +
 drivers/media/platform/nuvoton/npcm-video.c        |    4 +-
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |    7 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |   14 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |    1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |    3 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   13 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |    5 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    7 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |    8 +-
 drivers/media/platform/qcom/camss/camss.c          |  379 ++++-
 drivers/media/platform/qcom/camss/camss.h          |    5 +-
 drivers/media/platform/qcom/venus/Kconfig          |    1 +
 drivers/media/platform/qcom/venus/core.c           |  113 +-
 drivers/media/platform/qcom/venus/core.h           |    4 +
 drivers/media/platform/qcom/venus/hfi.c            |   23 -
 drivers/media/platform/qcom/venus/hfi.h            |    2 -
 drivers/media/platform/qcom/venus/hfi_venus.c      |   11 -
 drivers/media/platform/qcom/venus/vdec.c           |   18 +-
 drivers/media/platform/qcom/venus/venc.c           |   18 +-
 drivers/media/platform/renesas/rcar-csi2.c         |   91 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |    2 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |    2 +-
 drivers/media/platform/rockchip/rga/rga-hw.c       |    2 +-
 drivers/media/platform/rockchip/rga/rga-hw.h       |    2 +-
 drivers/media/platform/rockchip/rga/rga.c          |    2 +-
 drivers/media/platform/rockchip/rga/rga.h          |    2 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      |    4 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |    3 +
 .../platform/samsung/exynos4-is/fimc-is-errno.c    |  131 --
 .../platform/samsung/exynos4-is/fimc-is-errno.h    |    1 -
 .../platform/samsung/exynos4-is/fimc-is-param.c    |    9 -
 .../platform/samsung/exynos4-is/fimc-is-param.h    |    1 -
 .../media/platform/samsung/exynos4-is/mipi-csis.c  |   10 +-
 .../media/platform/samsung/s3c-camif/camif-core.c  |   13 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |    7 +-
 drivers/media/platform/st/stm32/Kconfig            |   14 +
 drivers/media/platform/st/stm32/Makefile           |    1 +
 drivers/media/platform/st/stm32/stm32-csi.c        | 1137 +++++++++++++
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    2 +-
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  128 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  119 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |    4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  122 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |  540 +++++++
 .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        |  440 -----
 drivers/media/platform/verisilicon/hantro.h        |    9 +
 drivers/media/platform/verisilicon/hantro_g2.c     |    2 +-
 .../media/platform/verisilicon/hantro_postproc.c   |   32 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |   21 +
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |   10 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |    9 +-
 drivers/media/radio/Kconfig                        |    4 -
 drivers/media/radio/Makefile                       |    1 -
 drivers/media/radio/wl128x/Kconfig                 |   15 -
 drivers/media/radio/wl128x/Makefile                |    7 -
 drivers/media/radio/wl128x/fmdrv.h                 |  229 ---
 drivers/media/radio/wl128x/fmdrv_common.c          | 1676 ----------------=
----
 drivers/media/radio/wl128x/fmdrv_common.h          |  389 -----
 drivers/media/radio/wl128x/fmdrv_rx.c              |  820 ----------
 drivers/media/radio/wl128x/fmdrv_rx.h              |   45 -
 drivers/media/radio/wl128x/fmdrv_tx.c              |  413 -----
 drivers/media/radio/wl128x/fmdrv_tx.h              |   24 -
 drivers/media/radio/wl128x/fmdrv_v4l2.c            |  604 -------
 drivers/media/radio/wl128x/fmdrv_v4l2.h            |   20 -
 drivers/media/rc/iguanair.c                        |    4 +-
 drivers/media/rc/imon_raw.c                        |    2 +-
 drivers/media/rc/mceusb.c                          |    5 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |    8 +-
 drivers/media/tuners/fc0013.c                      |   64 -
 drivers/media/tuners/fc0013.h                      |   11 -
 drivers/media/usb/cx231xx/cx231xx-avcore.c         |    1 -
 drivers/media/usb/dvb-usb-v2/af9035.c              |   18 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c             |   12 +-
 drivers/media/usb/uvc/uvc_ctrl.c                   |   88 +-
 drivers/media/usb/uvc/uvc_driver.c                 |  298 ++--
 drivers/media/usb/uvc/uvc_queue.c                  |    9 +-
 drivers/media/usb/uvc/uvc_status.c                 |    8 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |  164 +-
 drivers/media/usb/uvc/uvc_video.c                  |   59 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   15 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   43 +-
 drivers/media/v4l2-core/v4l2-mc.c                  |    2 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c             |   18 -
 drivers/staging/media/imx/imx-media-of.c           |    8 +-
 drivers/staging/media/max96712/max96712.c          |    4 +-
 include/dt-bindings/media/video-interfaces.h       |    7 +
 include/linux/soc/mediatek/mtk-cmdq.h              |   13 -
 include/media/cec.h                                |    1 -
 include/media/v4l2-mediabus.h                      |   21 +
 164 files changed, 4606 insertions(+), 6317 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-cam=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32mp25-cs=
i.yaml
 create mode 100644 drivers/media/platform/st/stm32/stm32-csi.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-inp=
ut.c
 delete mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-par=
allel.c
 delete mode 100644 drivers/media/radio/wl128x/Kconfig
 delete mode 100644 drivers/media/radio/wl128x/Makefile
 delete mode 100644 drivers/media/radio/wl128x/fmdrv.h
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_common.c
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_common.h
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_rx.c
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_rx.h
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_tx.c
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_tx.h
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_v4l2.c
 delete mode 100644 drivers/media/radio/wl128x/fmdrv_v4l2.h

