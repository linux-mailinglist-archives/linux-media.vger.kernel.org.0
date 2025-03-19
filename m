Return-Path: <linux-media+bounces-28506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3027A697F2
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 19:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53C7E3B55CE
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 18:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BB820AF7B;
	Wed, 19 Mar 2025 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXM43pZx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88221DF271;
	Wed, 19 Mar 2025 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742408624; cv=none; b=UjCja1Z3n4vfcba1VV3W/KJYtT1B4iVxKBmrDq9h/ZIjIiuRvzj5CYywgY3bq5FuNyXsStVxjo5a7HrFkT6+DxzavZ+vNeixNFw1DZaQBPMG4XSn/dSARs/BYm2ZuFBLuRZlzqKULClPQxPgFNEEE7To56/jrdjCq5ac3rPbeMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742408624; c=relaxed/simple;
	bh=ZVCETI0yNUfYRp4729zphef0ooAPgBwYGzIzB2LyuR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZtEgtVqHT801jUiLxNeYEhNIM6P0mu39YNLBmLgF9W+0D/kuEWzLKEQMDIywqzsOH0+ePPvrry2wAwmXYvdwQ5Bmmd/R8A4AGsP+u8fIbzfTbb2pJd2A+XlbEmtmbwmk5R79g3/gI3yVEclCjcEuVpLlPvw+QPEzVKrkMaYsfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXM43pZx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0CEC4CEE9;
	Wed, 19 Mar 2025 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742408623;
	bh=ZVCETI0yNUfYRp4729zphef0ooAPgBwYGzIzB2LyuR0=;
	h=Date:From:To:Cc:Subject:From;
	b=MXM43pZxxGjcFFXweqKA94d9/SDMDGUS6xR0DCLjh6aTkDK9ORaxO8kJ69Ifdk2dC
	 0mX4K/2qiIkaBDr5egHxPBagxUeEWVlFVYv4fVdDzxEWh5Xa8Euw+B6kir18sUbEda
	 t9i1Xxm9Uw4XCND56n8DFTZZMIBxqcSlmsMLighkGRoEDuN1oEHfHix9tRH7+eGeFp
	 ko9SESOZxw+QVe+o7Zjgivmxw5YfkZbg0+QGl1hrpqks0SqOkfEILGGdTWpQOQo6zj
	 7pTW1AAPjp1HFvaekhutrQlFwjNeXgkpEYgACOYqmX/PYhFQkmAeBzlvVCQfNm6W6J
	 SEK2b/lH8ahNg==
Date: Wed, 19 Mar 2025 19:23:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v6.15] media updates
Message-ID: <20250319192338.043dde45@foz.lan>
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

As I'm doing a biz trip tomorrow to a place where I might have some troubles
sending PRs. I don't expect any real issue, but better to be safe than sorr=
y.

So, I'm opting to send my PR to 6.15 in advance. Please notice that there a=
re
3 patches addressing some Kconfig issues merged today. They hopefully will =
be
on -next before 6.15 the merge window.

So, please pull during the merge window from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v6.15-1

For:

- platform: synopsys: hdmirx: Fix 64-bit division for 32-bit targets;
- vim2m: print device name after registering device;
- Synopsys DesignWare HDMI RX Driver and various fixes;
- cec/printk fixes and the removal of the vidioc_g/s_ctrl and vidioc_queryc=
trl callbacks;
- AVerMedia H789-C PCIe support and rc-core structs padding;
- Several camera sensor patches;
- uvcvideo improvements;
- visl: Fix ERANGE error when setting enum controls;
- codec fixes;
- V4L2 camera sensor patches mostly;
- chips-media: wave5: Fixes;
- Add SDM670 camera subsystem;
- Qualcomm iris video decoder driver;
- dt-bindings: update clocks for sc7280-camss;
- various fixes and enhancements.
   =20
     Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml |  132 +++
     MAINTAINERS                                                  |    8 +
     drivers/media/dvb-frontends/stv0299.c                        |    2 +-
     drivers/media/platform/Kconfig                               |    1 +
     drivers/media/platform/Makefile                              |    1 +
     drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c      |    5 +-
     drivers/media/platform/synopsys/Kconfig                      |    3 +
     drivers/media/platform/synopsys/Makefile                     |    2 +
     drivers/media/platform/synopsys/hdmirx/Kconfig               |   35 +
     drivers/media/platform/synopsys/hdmirx/Makefile              |    4 +
     drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c         | 2750 ++=
+++++++++++++++++++++++++++++++++++++++++++++++++
     drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h         |  394 ++=
++++++
     drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c     |  275 ++=
++++
     drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h     |   43 +
     drivers/media/platform/ti/omap3isp/isp.c                     |   37 -
     drivers/media/platform/ti/omap3isp/isp.h                     |    2 -
     drivers/media/test-drivers/vimc/vimc-streamer.c              |    6 +
     17 files changed, 3658 insertions(+), 42 deletions(-)
     create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdm=
i-rx.yaml
     create mode 100644 drivers/media/platform/synopsys/Kconfig
     create mode 100644 drivers/media/platform/synopsys/Makefile
     create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
     create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
     create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
     create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
     create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_=
cec.c
     create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_=
cec.h
   =20
   =20
    [GIT PULL V2 FOR V6.15] CEC/PRINTK FIXES AND THE REMOVAL OF THE VIDIOC_=
G/S_CTRL AND VIDIOC_QUERYCTRL CALLBACKS
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
   =20
    This PR contains one CEC core patch, two core rectangle logging fixes,
    one cx231xx fix that I discovered while testing Ricardo's patch series,
    and Ricardo's patch series:
   =20
    https://patchwork.linuxtv.org/project/linux-media/list/?series=3D14558
   =20
    Note that the uvc patch from that series was modified due to a trivial
    conflict with the UVC PR that was merged earlier.
   =20
    This PR passed the CI:
   =20
    https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1=
377347
   =20
    Since this series contains core changes it is best if you review and pr=
ocess this PR.
   =20
   =20
    AVERMEDIA H789-C PCIE SUPPORT AND RC-CORE STRUCTS PADDING
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
   =20
    CI passed here:
   =20
    https://gitlab.freedesktop.org/linux-media/users/seanyoung/-/pipelines/=
1376882
   =20
   =20
    MEDIA: MOSTLY CAMERA SENSOR PATCHES
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    Here are a few more patches for mostly camera sensors (improvements and
    fixes for imx219, imx214, ov08x40, ov9282, vgxy61 and imx283 drivers), =
but
    also fixes and improvements for CSI-2 receiver and ISP drivers (ipu6, r=
car
    and omap3isp) and a DT binding rename.
   =20
    Please pull.
   =20
   =20
    MEDIA:  UVCVIDEO IMPROVEMENTS
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
   =20
    uvcvideo improvements:
   =20
    - Support for UVC 1.5 Region of Interest (ROI) control
    - Quirk for Actions UVC05 device
    - Misc cleanup
   =20
   =20
    MEDIA: VISL: FIX ERANGE ERROR WHEN SETTING ENUM CONTROLS
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    The visl driver supports both frame and slice mode, with and without a
    start-code. But, the range and default for these enum controls was not
    set, which currently limits the decoder to enums with a value of 0. Fix
    this by setting the decoder mode and start code controls for both the
    H.264 and HEVC codecs.
   =20
   =20
    MEDIA: VARIOUS FIXES AND ENHANCEMENTS
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    Colin Ian King (1):
          media: hi556: remove redundant assignment to variable enable
   =20
    Dr. David Alan Gilbert (1):
          media: cx23885: Remove unused netup_eeprom_write
   =20
    Martin T=C5=AFma (2):
          media: mgb4: Fix CMT registers update logic
          media: mgb4: Fix switched CMT frequency range "magic values" sets
   =20
    Matthias Fend (3):
          media: tc358746: add support for 8/10/12/14-bit RAW Bayer formats
          media: tc358746: improve calculation of the D-PHY timing registers
          media: tc358746: fix locking issue
   =20
    Niklas S=C3=B6derlund (1):
          media: adv7180: Disable test-pattern control on adv7180
   =20
    Ricardo Ribalda (2):
          media: nuvoton: Fix reference handling of ece_node
          media: nuvoton: Fix reference handling of ece_pdev
   =20
     drivers/media/i2c/adv7180.c                 |  34 +++++++----
     drivers/media/i2c/hi556.c                   |   1 -
     drivers/media/i2c/tc358746.c                | 237 ++++++++++++++++++++=
+++++++++++++++++++------------------------------------
     drivers/media/pci/cx23885/netup-eeprom.c    |  29 ----------
     drivers/media/pci/cx23885/netup-eeprom.h    |   1 -
     drivers/media/pci/mgb4/mgb4_cmt.c           |   8 ++-
     drivers/media/platform/nuvoton/npcm-video.c |   6 +-
     7 files changed, 153 insertions(+), 163 deletions(-)
   =20
   =20
    MEDIA: CODEC FIXES
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    Benjamin Gaignard (2):
          media: verisilicon: HEVC: Initialize start_bit field
          media: verisilicon: VP9: Fix typo
   =20
    Joe Hattori (1):
          media: platform: allgro-dvt: unregister v4l2_device on the error =
path
   =20
     drivers/media/platform/allegro-dvt/allegro-core.c       | 1 +
     drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
     drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c  | 8 ++++----
     3 files changed, 6 insertions(+), 4 deletions(-)
   =20
   =20
    VARIOUS FIXES AND IMPROVEMENTS
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
   =20
    Alain Volmat (1):
          dt-bindings: media: st,stmipid02: correct lane-polarities maxItems
   =20
    Arnd Bergmann (2):
          media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
          media: iris: rename module file
   =20
    Caleb Connolly (1):
          media: qcom: camss: Add sm845 named power-domain support
   =20
    Chandra Pratap (1):
          Documentation: media: fix spelling error in the HDMI CEC document=
ation
   =20
    Christophe JAILLET (5):
          media: dvb-usb: Constify struct usb_device_id
          media: dibx000_common: Constify struct i2c_algorithm
          media: dvb-usb: Constify struct i2c_algorithm
          media: dvb-usb-v2: Constify struct i2c_algorithm
          media: tuners: Constify struct tunertype, tuner_range and tuner_p=
arams
   =20
    Fabio Estevam (1):
          media: dt-bindings: adv7180: Document the 'interrupts' property
   =20
    Huisong Li (1):
          media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
   =20
    Jammy Huang (1):
          media: dt-bindings: aspeed,video-engine: Convert to json schema
   =20
    Jiasheng Jiang (1):
          media: mediatek: vcodec: Fix a resource leak related to the scp d=
evice in FW initialization
   =20
    Marek Vasut (1):
          staging: media: imx: vdic: Drop unused prepare_vdi_in_buffers()
   =20
    Martin T=C5=AFma (2):
          media: admin-guide: add mgb4 GMSL modules variants description
          media: mgb4: Added support for additional GMSL modules variants
   =20
    Matthias Schwarzott (1):
          media: cx23885: add simple suspend/resume
   =20
    Niklas S=C3=B6derlund (2):
          media: uapi: rkisp1-config: Fix typo in extensible params example
          media: i2c: adv748x: Fix test pattern selection mask
   =20
    Ricardo Ribalda (1):
          media: cx231xx: Convert enum into a define
   =20
    Xiaolei Wang (1):
          media: coda: Add system resume interface
   =20
    Zhang Heng (2):
          media: pwc: remove useless header files
          media: usb: use kmalloc_array() to replace kmalloc()
   =20
     Documentation/admin-guide/media/cec.rst                            |  =
 2 +-
     Documentation/admin-guide/media/mgb4.rst                           |  =
 4 +-
     Documentation/devicetree/bindings/media/aspeed,video-engine.yaml   |  =
70 ++++++++++
     Documentation/devicetree/bindings/media/aspeed-video.txt           |  =
33 -----
     Documentation/devicetree/bindings/media/i2c/adv7180.yaml           |  =
 4 +
     Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml     |  =
 2 +-
     MAINTAINERS                                                        |  =
 2 +-
     drivers/media/dvb-frontends/dibx000_common.c                       |  =
10 +-
     drivers/media/i2c/adv748x/adv748x.h                                |  =
 2 +-
     drivers/media/i2c/video-i2c.c                                      |  =
12 +-
     drivers/media/pci/cx23885/cx23885-core.c                           |  =
33 ++++-
     drivers/media/pci/mgb4/mgb4_core.c                                 |  =
13 +-
     drivers/media/pci/mgb4/mgb4_core.h                                 |  =
 8 +-
     drivers/media/platform/chips-media/coda/coda-common.c              |  =
 1 +
     drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c  |  =
 5 +-
     drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c |  =
 6 +-
     drivers/media/platform/qcom/camss/camss.c                          |  =
 3 +
     drivers/media/platform/qcom/iris/Makefile                          |  =
 7 +-
     drivers/media/tuners/tuner-simple.c                                |  =
20 +--
     drivers/media/tuners/tuner-types.c                                 | 2=
96 ++++++++++++++++++++---------------------
     drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h                        |  =
18 +--
     drivers/media/usb/dvb-usb-v2/af9015.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/af9035.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/anysee.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/au6610.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/az6007.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/ce6230.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/dvb_usb.h                             |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/dvbsky.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/ec168.c                               |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/gl861.c                               |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/lmedm04.c                             |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/mxl111sf.c                            |  =
 2 +-
     drivers/media/usb/dvb-usb-v2/rtl28xxu.c                            |  =
 2 +-
     drivers/media/usb/dvb-usb/a800.c                                   |  =
 2 +-
     drivers/media/usb/dvb-usb/af9005.c                                 |  =
 4 +-
     drivers/media/usb/dvb-usb/az6027.c                                 |  =
 4 +-
     drivers/media/usb/dvb-usb/cinergyT2-core.c                         |  =
 2 +-
     drivers/media/usb/dvb-usb/cxusb-analog.c                           |  =
 4 +-
     drivers/media/usb/dvb-usb/cxusb.c                                  |  =
 6 +-
     drivers/media/usb/dvb-usb/dibusb-mb.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb/dibusb-mc.c                              |  =
 2 +-
     drivers/media/usb/dvb-usb/digitv.c                                 |  =
 4 +-
     drivers/media/usb/dvb-usb/dtt200u.c                                |  =
 2 +-
     drivers/media/usb/dvb-usb/dtv5100.c                                |  =
 4 +-
     drivers/media/usb/dvb-usb/dvb-usb.h                                |  =
 6 +-
     drivers/media/usb/dvb-usb/dw2102.c                                 |  =
16 +--
     drivers/media/usb/dvb-usb/gp8psk.c                                 |  =
 2 +-
     drivers/media/usb/dvb-usb/m920x.c                                  |  =
 4 +-
     drivers/media/usb/dvb-usb/nova-t-usb2.c                            |  =
 2 +-
     drivers/media/usb/dvb-usb/opera1.c                                 |  =
 4 +-
     drivers/media/usb/dvb-usb/pctv452e.c                               |  =
 6 +-
     drivers/media/usb/dvb-usb/technisat-usb2.c                         |  =
 4 +-
     drivers/media/usb/dvb-usb/ttusb2.c                                 |  =
 4 +-
     drivers/media/usb/dvb-usb/umt-010.c                                |  =
 2 +-
     drivers/media/usb/dvb-usb/vp702x.c                                 |  =
 2 +-
     drivers/media/usb/dvb-usb/vp7045.c                                 |  =
 2 +-
     drivers/media/usb/pwc/pwc-if.c                                     |  =
 1 -
     drivers/staging/media/imx/imx-media-vdic.c                         |  =
54 --------
     include/media/tuner-types.h                                        |  =
 6 +-
     include/uapi/linux/rkisp1-config.h                                 |  =
 2 +-
     61 files changed, 375 insertions(+), 355 deletions(-)
     create mode 100644 Documentation/devicetree/bindings/media/aspeed,vide=
o-engine.yaml
     delete mode 100644 Documentation/devicetree/bindings/media/aspeed-vide=
o.txt
   =20
   =20
    [GIT PULL FOR V6.15] MEDIA: VARIOUS FIXES AND ENHANCEMENTS
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
   =20
    Five patches from me, fixing a few things and adding support for the EE=
ODB
    in EDIDs. It's relevant for determining the number of EDID blocks, with=
out
    it you will read too few blocks.
   =20
   =20
    MEDIA: V4L2 CAMERA SENSOR PATCHES MOSTLY
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
   =20
    Here's a bunch of fixes and improvements to various drivers, mainly
    including stm32 csi, imx214, imx415, hi556, ov08x40 and ov2740 imx219
    drivers, power management related fixes to imx214, ov7251, ccs, imx219 =
and
    imx319 drivers as well as V4L2 link frequency helper improvements
    (including driver changes).
   =20
    Please pull.
   =20
   =20
    MEDIA: CHIPS-MEDIA: WAVE5: FIXES
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    Various fixes for Wave5
   =20
    Jackson.lee (4):
          media: chips-media: wave5: Fix gray color on screen
          media: chips-media: wave5: Avoid race condition in the interrupt =
handler
          media: chips-media: wave5: Fix a hang after seeking
          media: chips-media: wave5: Fix timeout while testing 10bit hevc f=
luster
   =20
     .../media/platform/chips-media/wave5/wave5-hw.c    |  2 +-
     .../platform/chips-media/wave5/wave5-vpu-dec.c     | 31 ++++++++++++++=
+++++++-
     .../media/platform/chips-media/wave5/wave5-vpu.c   |  4 +--
     .../platform/chips-media/wave5/wave5-vpuapi.c      | 10 +++++++
     4 files changed, 43 insertions(+), 4 deletions(-)
   =20
   =20
    ADD SDM670 CAMERA SUBSYSTEM
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
   =20
    This adds support for the camera subsystem on the Snapdragon 670.
   =20
   =20
    QUALCOMM IRIS VIDEO DECODER DRIVER
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    Introduce support for Qualcomm new video acceleration hardware i.e.=20
    iris, used for video stream decoding.
   =20
    Iris is a multi pipe based hardware that offloads video stream decoding=
=20
    from the application processor (AP). It supports H.264 decoding. The AP=
=20
    communicates with hardware through a well defined protocol, called as=20
    host firmware interface (HFI), which provides fine-grained and =20
    asynchronous control over individual hardware features.
   =20
    The existing venus driver supports only hfi gen1 to communicate with=20
    the firmware while this iris driver supports both hfi gen1 and hfi gen2.
    The support of hfi gen1 is added to the iris driver with the intention=
=20
    that it can support old gen1 interface based firmware, while enabling=20
    gen2 based future SOCs.
    With this, the plan is to migrate older SOCs from venus to iris.
    As of now, since the iris driver supports only entry level features and=
=20
    doesn't have feature parity with the venus driver,  it is enabled for=20
    SM8250 only when venus driver is disabled.
    When the feature parity is achieved, the plan is to enable the iris =20
    driver unconditionally for SM8250, and then gradually start removing=20
    platforms from venus driver.
    Hardware supported by only venus - 8916, 8996, SDM660, SDM845, SC7180, =
SC7280
    Hardware supported by only iris - SM8550
    Hardware supported by both venus and iris - SM8250
   =20
    This driver comes with below capabilities:
    - V4L2 compliant video driver with M2M and STREAMING capability.
    - Supports H264 decoder.
   =20
    This driver comes with below features:
    - Centralized resource management.
    - Centralized management of core and instance states.
    - Defines platform specific capabilities and features. As a results, it=
=20
      provides a single point of control to enable/disable a given feature=
=20
      depending on specific platform capabilities.
    - Handles various video recommended sequences, like DRC, Drain, Seek,=20
      EOS.
    - Implements asynchronous communication with hardware to achieve better=
=20
      experience in low latency usecases.
    - Output and capture planes are controlled independently. Thereby
      providing a way to reconfigure individual plane.
    - Native hardware support of LAST flag which is mandatory to align with=
=20
      port reconfiguration and DRAIN sequence as per V4L guidelines.
   =20
   =20
    MEDIA: DT-BINDINGS: UPDATE CLOCKS FOR SC7280-CAMSS
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
   =20
    Vikram Sharma
    Jan. 21, 2025, 6:07 p.m. UTC
    Update clock names as follow-up change for series.
    https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-1-quic_vik=
ramsa@quicinc.com/
    We have got comments on our dtsi change to update clock names as
    - GCC_CAMERA_AHB_CLK is always enabled clock so it can be removed.
    - Change clock name from gcc_cam_hf_axi to `gcc_axi_hf` for consistency.
    - Add gcc_axi_sf as missing to enable it can have undefined hw behaviou=
r.
   =20
    To handle these comments in our base series we need to update
    documentaion and driver (already merged) to work with dtsi.
   =20
    We are not breaking ABI here because the ABI hasn't been cemented yet a=
s the dtsi
    changes are not merged yet also there are no users for this driver as o=
f now.=20
   =20
    Used following tools for the sanity check of these changes.
    - make CHECK_DTBS=3Dy W=3D1 DT_SCHEMA_FILES=3Dmedia/qcom,sc7280-camss.y=
aml
    - make DT_CHECKER_FLAGS=3D-m W=3D1
    DT_SCHEMA_FILES=3Dmedia/qcom,sc7280-camss.yaml dt_binding_check
    - make -j32 W=3D1
    - ./scripts/checkpatch.pl
   =20
   =20
    Vikram Sharma (2):
      media: dt-bindings: update clocks for sc7280-camss
      media: qcom: camss: update clock names for sc7280
   =20
Regards,
Mauro

---

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v6.15-1

for you to fetch changes up to f2151613e040973c868d28c8b00885dfab69eb75:

  media: pci: mgb4: include linux/errno.h (2025-03-07 12:05:42 +0100)

----------------------------------------------------------------
[GIT PULL for v6.15] media updates

----------------------------------------------------------------
Aakarsh Jain (1):
      media: s5p-mfc: Corrected NV12M/NV21M plane-sizes

Alain Volmat (10):
      media: stm32: dcmipp: correct ret type in dcmipp_graph_notify_bound
      dt-bindings: media: clarify stm32 csi & simplify example
      media: stm32: csi: add missing pm_runtime_put on error
      media: stm32: csi: register subdev only at end of probe
      media: stm32: csi: use ARRAY_SIZE to search D-PHY table
      media: stm32: csi: simplify enable_streams error handling
      media: stm32: csi: remove useless fwnode_graph_get_endpoint call
      media: stm32: csi: correct unsigned or useless variable settings
      media: stm32: dcmipp: add has_csi2 & needs_mclk in match data
      dt-bindings: media: st,stmipid02: correct lane-polarities maxItems

Andr=C3=A9 Apitzsch (12):
      media: i2c: imx214: Use subdev active state
      media: i2c: imx214: Simplify with dev_err_probe()
      media: i2c: imx214: Convert to CCI register access helpers
      media: i2c: imx214: Replace register addresses with macros
      media: i2c: imx214: Drop IMX214_REG_EXPOSURE from mode reg arrays
      media: i2c: imx214: Check number of lanes from device tree
      media: i2c: imx214: Add vblank and hblank controls
      media: i2c: imx214: Implement vflip/hflip controls
      media: i2c: imx214: Add analogue/digital gain control
      media: i2c: imx214: Verify chip ID
      media: i2c: imx214: Add test pattern control
      media: i2c: imx214: Fix link frequency validation

Arnd Bergmann (3):
      media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
      media: iris: rename module file
      media: pci: mgb4: include linux/errno.h

Benjamin Gaignard (2):
      media: verisilicon: HEVC: Initialize start_bit field
      media: verisilicon: VP9: Fix typo

Bingbu Cao (1):
      media: intel/ipu6: set the dev_parent of video device to pdev

Bryan O'Donoghue (6):
      media: qcom: camss: csiphy-3ph: Fix trivial indentation fault in defi=
nes
      media: qcom: camss: csiphy-3ph: Remove redundant PHY init sequence co=
ntrol loop
      media: qcom: camss: csiphy-3ph: Rename struct
      media: qcom: camss: csiphy: Add an init callback to CSI PHY devices
      media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field i=
nside csiphy struct
      media: qcom: camss: csiphy-3ph: Use an offset variable to find common=
 control regs

Caleb Connolly (1):
      media: qcom: camss: Add sm845 named power-domain support

Chandra Pratap (1):
      Documentation: media: fix spelling error in the HDMI CEC documentation

Christophe JAILLET (5):
      media: dvb-usb: Constify struct usb_device_id
      media: dibx000_common: Constify struct i2c_algorithm
      media: dvb-usb: Constify struct i2c_algorithm
      media: dvb-usb-v2: Constify struct i2c_algorithm
      media: tuners: Constify struct tunertype, tuner_range and tuner_params

Colin Ian King (2):
      media: hi556: remove redundant assignment to variable enable
      media: dvb: Fix spelling mistake "ofset" -> "offset"

Cosmin Tanislav (1):
      media: i2c: imx219: remove context around case

Dan Carpenter (3):
      media: i2c: imx214: Fix uninitialized variable in imx214_set_ctrl()
      media: xilinx-tpg: fix double put in xtpg_parse_of()
      media: synopsys: hdmirx: Fix signedness bug in hdmirx_parse_dt()

Dave Stevenson (5):
      media: i2c: imx415: Add read/write control of VBLANK
      media: i2c: imx415: Make HBLANK controllable and in consistent units
      media: i2c: imx415: Link frequencies are not exclusive to num lanes
      media: imx219: Adjust PLL settings based on the number of MIPI lanes
      media: i2c: imx219: make HBLANK r/w to allow longer exposures

David Plowman (1):
      media: i2c: imx219: Correct the minimum vblanking value

Depeng Shao (10):
      media: qcom: camss: csid: Move common code into csid core
      media: qcom: camss: vfe: Move common code into vfe core
      media: qcom: camss: Add callback API for RUP update and buf done
      media: qcom: camss: Add default case in vfe_src_pad_code
      media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is a=
vailable
      dt-bindings: media: camss: Add qcom,sm8550-camss binding
      media: qcom: camss: Add sm8550 compatible
      media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2 two-phase MIPI CSI-2 =
DPHY support
      media: qcom: camss: Add CSID 780 support
      media: qcom: camss: Add support for VFE 780

Dikshita Agarwal (18):
      dt-bindings: media: Add video support for QCOM SM8550 SoC
      media: iris: add platform driver for iris video device
      media: iris: implement iris v4l2 file ops
      media: iris: introduce iris core state management with shared queues
      media: iris: implement video firmware load/unload
      media: iris: implement the boot sequence of the firmware
      media: iris: introduce host firmware interface with necessary hooks
      media: iris: implement power management
      media: iris: implement reqbuf ioctl with vb2_queue_setup
      media: iris: implement iris v4l2_ctrl_ops
      media: iris: implement vb2 streaming ops
      media: iris: allocate, initialize and queue internal buffers
      media: iris: implement vb2 ops for buf_queue and firmware response
      media: iris: add support for dynamic resolution change
      media: iris: handle streamoff/on from client in dynamic resolution ch=
ange
      media: iris: add support for drain sequence
      media: iris: enable video driver probe of SM8250 SoC
      media: MAINTAINERS: add Qualcomm iris video accelerator driver

Dmitry Osipenko (3):
      media: platform: synopsys: hdmirx: Remove duplicated header inclusion
      media: platform: synopsys: hdmirx: Remove unused HDMI audio CODEC rel=
ics
      media: platform: synopsys: hdmirx: Optimize struct snps_hdmirx_dev

Dongcheng Yan (1):
      media: i2c: add lt6911uxe hdmi bridge driver

Dr. David Alan Gilbert (2):
      media: cx23885: Remove unused netup_eeprom_write
      media: platform: ti: Remove unused omap3isp_print_status

Fabio Estevam (1):
      media: dt-bindings: adv7180: Document the 'interrupts' property

Fei Shao (2):
      dt-bindings: media: mediatek,jpeg: Relax IOMMU max item count
      dt-bindings: media: mediatek,vcodec: Revise description

Hans Verkuil (11):
      media: pci: ipu6: drop vb2_ops_wait_prepare/finish
      media: test-drivers: vivid: don't call schedule in loop
      media: radio-aztech.c: fix old email in comment
      media: v4l2-dv-timings: add v4l2_num_edid_blocks() helper
      media: adv7511-v4l2: add support for the EEODB
      media: platform: rpi1-cfe: drop vb2_ops_wait_prepare/finish
      media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
      media: cec: core: allow raw msg transmit while configuring
      media: cx231xx: set device_caps for 417
      media: v4l2-tpg: use (t,l)/wxh format for rectangle
      media: v4l2-core: use (t,l)/wxh format for rectangle

Hans de Goede (17):
      media: hi556: Fix memory leak (on error) in hi556_check_hwcfg()
      media: hi556: Add missing '\n' to hi556 error messages
      media: hi556: Improve error logging when fwnode is not found
      media: hi556: Don't log hi556_check_hwcfg() errors twice
      media: ov08x40: Properly turn sensor on/off when runtime-suspended
      media: ov08x40: Move fwnode_graph_get_next_endpoint() call up
      media: ov08x40: Get reset GPIO and regulators on ACPI platforms too
      media: ov08x40: Get clock on ACPI platforms too
      media: ov08x40: Move ov08x40_identify_module() function up
      media: ov08x40: Improve ov08x40_identify_module() error logging
      media: ov08x40: Improve ov08x40_[read|write]_reg() error returns
      media: ov08x40: Add missing ov08x40_identify_module() call on stream-=
start
      media: ov08x40: Add missing '\n' to ov08x40_check_hwcfg() error messa=
ges
      media: ov08x40: Don't log ov08x40_check_hwcfg() errors twice
      media: dw9719: Add DW9761 support
      media: ov08x40: Fix value of reset GPIO when requesting it
      media: ov08x40: Log chip ID when identifying the chip

Huisong Li (1):
      media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code

Jackson.lee (4):
      media: chips-media: wave5: Fix gray color on screen
      media: chips-media: wave5: Avoid race condition in the interrupt hand=
ler
      media: chips-media: wave5: Fix a hang after seeking
      media: chips-media: wave5: Fix timeout while testing 10bit hevc flust=
er

Jai Luthra (6):
      media: i2c: imx219: Rename VTS to FRM_LENGTH
      media: i2c: imx219: Increase minimum LLP to fix blocky artefacts
      media: i2c: imx219: Scale the pixel rate for analog binning
      media: i2c: imx219: Simplify binning mode
      media: i2c: imx219: Use subdev state to calculate binning and pixelra=
te
      media: i2c: imx219: Only use higher LLP_MIN for binned resolutions

Jammy Huang (1):
      media: dt-bindings: aspeed,video-engine: Convert to json schema

Jiasheng Jiang (2):
      media: mediatek: vcodec: Fix a resource leak related to the scp devic=
e in FW initialization
      media: platform: stm32: Add check for clk_enable()

Joe Hattori (1):
      media: platform: allgro-dvt: unregister v4l2_device on the error path

John Keeping (1):
      media: rockchip: rga: fix rga offset lookup

Karina Yankevich (1):
      media: v4l2-dv-timings: prevent possible overflow in v4l2_detect_gtf()

Krzysztof Kozlowski (1):
      media: omap3isp: Use syscon_regmap_lookup_by_phandle_args

Laurent Pinchart (2):
      media: uvcvideo: Drop the uvc_driver structure
      media: ccs-pll: Make variables const where appropriate

Marek Vasut (1):
      staging: media: imx: vdic: Drop unused prepare_vdi_in_buffers()

Markus Elfring (2):
      media: i2c: tda1997x: Call of_node_put(ep) only once in tda1997x_pars=
e_dt()
      media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_pr=
obe()

Martin T=C5=AFma (4):
      media: admin-guide: add mgb4 GMSL modules variants description
      media: mgb4: Added support for additional GMSL modules variants
      media: mgb4: Fix CMT registers update logic
      media: mgb4: Fix switched CMT frequency range "magic values" sets

Matthew Majewski (1):
      media: vim2m: print device name after registering device

Matthias Fend (3):
      media: tc358746: add support for 8/10/12/14-bit RAW Bayer formats
      media: tc358746: improve calculation of the D-PHY timing registers
      media: tc358746: fix locking issue

Matthias Schwarzott (1):
      media: cx23885: add simple suspend/resume

Michael Klein (1):
      media: rc: add keymap for Siemens Gigaset RC20 remote

Michael Tretter (1):
      media: rockchip: rga: fix field in OUTPUT buffers

Murad Masimov (2):
      media: streamzap: fix race between device disconnection and urb callb=
ack
      media: streamzap: prevent processing IR data on URB failure

Nathan Chancellor (1):
      media: platform: synopsys: hdmirx: Fix 64-bit division for 32-bit tar=
gets

Nicolas Dufresne (1):
      media: visl: Fix ERANGE error when setting enum controls

Nikita Zhandarovich (1):
      media: vimc: skip .s_stream() for stopped entities

Niklas S=C3=B6derlund (3):
      media: uapi: rkisp1-config: Fix typo in extensible params example
      media: i2c: adv748x: Fix test pattern selection mask
      media: adv7180: Disable test-pattern control on adv7180

Paul Elder (1):
      media: imx335: Set vblank immediately

Plamen Atanasov (1):
      media: cx23885: Add analog support for AVerMedia H789-C PCIe card

Qasim Ijaz (1):
      media: vgxy61: Replace nested min() with single min3()

Ricardo Ribalda (29):
      media: cx231xx: Convert enum into a define
      media: nuvoton: Fix reference handling of ece_node
      media: nuvoton: Fix reference handling of ece_pdev
      media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
      media: uvcvideo: Handle uvc menu translation inside uvc_set_le_value
      media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
      media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls: handle NoP case
      media: uvcvideo: Support any size for mapping get/set
      media: uvcvideo: Factor out clamping from uvc_ctrl_set
      media: uvcvideo: Factor out query_boundaries from query_ctrl
      media: uvcvideo: let v4l2_query_v4l2_ctrl() work with v4l2_query_ext_=
ctrl
      media: uvcvideo: Introduce uvc_mapping_v4l2_size
      media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
      media: uvcvideo: Add quirk for Actions UVC05
      media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
      media: pvrusb2: Convert queryctrl to query_ext_ctrl
      media: pvrusb2: Remove g/s_ctrl callbacks
      media: uvcvideo: Remove vidioc_queryctrl
      media: atomisp: Replace queryctrl with query_ext_ctrl
      media: atomisp: Remove vidioc_g/s callback
      media: v4l2: Remove vidioc_queryctrl callback
      media: v4l2: Remove vidioc_g_ctrl callback
      media: cx231xx: Remove vidioc_s_ctrl callback
      media: v4l2: Remove vidioc_s_ctrl callback
      media: v4l2-core: Introduce v4l2_query_ext_ctrl_to_v4l2_queryctrl
      media: radio-wl1273: Rename wl1273_fm_vidioc_s_ctrl
      media: dvb-frontends: tda10048: Make the range of z explicit.
      media: vivid: Move all fb_info references into vivid-osd
      media: vivid: Introduce VIDEO_VIVID_OSD

Richard Acayan (2):
      dt-bindings: media: camss: Add qcom,sdm670-camss
      media: qcom: camss: add support for SDM670 camss

Richard Leitner (2):
      media: i2c: ov9282: use register definitions
      media: i2c: ov9282: add AEC Manual register definition

Robin Murphy (2):
      media: omap3isp: Handle ARM dma_iommu_mapping
      media: qcom: Clean up Kconfig dependencies

Sakari Ailus (20):
      Revert "media: imx214: Fix the error handling in imx214_probe()"
      media: i2c: imx214: Rectify probe error handling related to runtime PM
      media: i2c: ov2740: Free control handler on error path
      media: i2c: ov2740: Small cleanups
      media: i2c: ccs: Set the device's runtime PM status correctly in remo=
ve
      media: i2c: ccs: Set the device's runtime PM status correctly in probe
      media: i2c: imx219: Rectify runtime PM handling in probe and remove
      media: i2c: imx319: Rectify runtime PM handling probe and remove
      media: i2c: ov7251: Set enable GPIO low in probe
      media: i2c: ov7251: Introduce 1 ms delay between regulators and en GP=
IO
      media: v4l: Support passing media pad argument to v4l2_get_link_freq()
      media: v4l: Support obtaining link frequency via get_mbus_config
      media: Documentation: Update link frequency driver documentation
      media: Documentation: tx-rx: Move transmitter control out of CSI-2 pa=
rt
      media: Documentation: Receiver drivers should call v4l2_get_link_freq=
()
      media: v4l: Memset argument to 0 before calling get_mbus_config pad op
      media: intel/ipu6: Obtain link frequency from the remote subdev pad
      media: ivsc: csi: Obtain link frequency from the media pad
      media: v4l: Convert the users of v4l2_get_link_freq to call it on a p=
ad
      media: ipu6: Drop unused ipu6_dma_get_sgtable()

Santiago Ruano Rinc=C3=B3n (2):
      staging: media: sdis: move open brace to a new line
      staging: media: sdis: move open braces to the previous line

Sean Young (1):
      media: rc: reduce useless padding in struct rc_dev etc

Shreeya Patel (3):
      MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
      dt-bindings: media: Document bindings for HDMI RX Controller
      media: platform: synopsys: Add support for HDMI input driver

Tarang Raval (1):
      media: i2c: imx283: Drop runtime suspend/resume functions

Tomi Valkeinen (10):
      media: rcar-csi2: Move Y8 entry to a better place
      media: rcar-csi2: Add RAW10 and RAW12 formats
      media: rcar-isp: Add RAW8, RAW10 and RAW12 formats
      media: rcar-csi2: Use v4l2_get_link_freq()
      media: rcar-vin: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-isp: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-csi2: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-isp: Convert to subdev state
      media: rcar-isp: Convert to .{enable|disable}_streams
      media: rcar-csi2: Convert to .{enable|disable}_streams

Vedang Nagar (10):
      media: iris: implement s_fmt, g_fmt and try_fmt ioctls
      media: iris: implement g_selection ioctl
      media: iris: implement enum_fmt and enum_framesizes ioctls
      media: iris: implement subscribe_event and unsubscribe_event ioctls
      media: iris: implement query_cap ioctl
      media: iris: implement set properties to firmware during streamon
      media: iris: subscribe parameters and properties to firmware for hfi_=
gen2
      media: iris: add check whether the video session is supported or not
      media: iris: implement power scaling for vpu2 and vpu3
      media: iris: add check to allow sub states transitions

Vikash Garodia (4):
      media: venus: hfi_parser: add check to avoid out of bound access
      media: venus: hfi_parser: refactor hfi packet parsing logic
      media: venus: hfi: add check to handle incorrect queue size
      media: venus: hfi: add a check to handle OOB in sfr region

Vikram Sharma (2):
      media: dt-bindings: update clocks for sc7280-camss
      media: qcom: camss: update clock names for sc7280

Vitaliy Shevtsov (1):
      media: cec: use us_to_ktime() where appropriate

Vladimir Zapolskiy (1):
      media: qcom: camss: switch CSID to defined MIPI CSI data type IDs

Xiaolei Wang (1):
      media: coda: Add system resume interface

Yuan Can (1):
      media: siano: Fix error handling in smsdvb_module_init()

Yunke Cao (6):
      media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
      media: vivid: Add a rectangle control
      media: uvcvideo: add support for compound controls
      media: uvcvideo: support V4L2_CTRL_WHICH_MIN/MAX_VAL
      media: uvcvideo: implement UVC v1.5 ROI
      media: uvcvideo: document UVC v1.5 ROI

Zhang Heng (2):
      media: pwc: remove useless header files
      media: usb: use kmalloc_array() to replace kmalloc()

 Documentation/admin-guide/media/cec.rst            |    2 +-
 Documentation/admin-guide/media/mgb4.rst           |    4 +-
 .../bindings/media/aspeed,video-engine.yaml        |   70 +
 .../devicetree/bindings/media/aspeed-video.txt     |   33 -
 .../devicetree/bindings/media/i2c/adv7180.yaml     |    4 +
 .../bindings/media/i2c/st,st-mipid02.yaml          |    2 +-
 .../media/mediatek,vcodec-subdev-decoder.yaml      |  100 +-
 .../bindings/media/mediatek-jpeg-decoder.yaml      |    3 +-
 .../bindings/media/mediatek-jpeg-encoder.yaml      |    2 +-
 .../bindings/media/qcom,sc7280-camss.yaml          |   10 +-
 .../bindings/media/qcom,sdm670-camss.yaml          |  318 +++
 .../bindings/media/qcom,sm8550-camss.yaml          |  597 +++++
 .../bindings/media/qcom,sm8550-iris.yaml           |  158 ++
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml |  132 +
 .../bindings/media/st,stm32mp25-csi.yaml           |    5 +-
 Documentation/driver-api/media/tx-rx.rst           |   26 +-
 .../userspace-api/media/drivers/uvcvideo.rst       |   64 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   26 +-
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   14 +
 .../userspace-api/media/videodev2.h.rst.exceptions |    4 +
 MAINTAINERS                                        |   20 +-
 drivers/media/cec/core/cec-api.c                   |    2 +-
 drivers/media/cec/core/cec-pin.c                   |   11 +-
 drivers/media/common/siano/smsdvb-main.c           |    2 +
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c      |    8 +-
 drivers/media/dvb-frontends/dibx000_common.c       |   10 +-
 drivers/media/dvb-frontends/stv0299.c              |    2 +-
 drivers/media/dvb-frontends/tda10048.c             |    8 +-
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/adv7180.c                        |   34 +-
 drivers/media/i2c/adv748x/adv748x.h                |    2 +-
 drivers/media/i2c/adv7511-v4l2.c                   |    6 +-
 drivers/media/i2c/ccs-pll.c                        |   16 +-
 drivers/media/i2c/ccs/ccs-core.c                   |    6 +-
 drivers/media/i2c/dw9719.c                         |  113 +-
 drivers/media/i2c/hi556.c                          |   46 +-
 drivers/media/i2c/imx214.c                         | 1287 +++++----
 drivers/media/i2c/imx219.c                         |  320 ++-
 drivers/media/i2c/imx283.c                         |   37 +-
 drivers/media/i2c/imx319.c                         |    9 +-
 drivers/media/i2c/imx335.c                         |   21 +-
 drivers/media/i2c/imx415.c                         |  183 +-
 drivers/media/i2c/lt6911uxe.c                      |  707 +++++
 drivers/media/i2c/ov08x40.c                        |  168 +-
 drivers/media/i2c/ov2740.c                         |   27 +-
 drivers/media/i2c/ov7251.c                         |    4 +-
 drivers/media/i2c/ov9282.c                         |   23 +-
 drivers/media/i2c/st-mipid02.c                     |    5 +-
 drivers/media/i2c/tc358746.c                       |  235 +-
 drivers/media/i2c/tda1997x.c                       |    7 +-
 drivers/media/i2c/vgxy61.c                         |    4 +-
 drivers/media/i2c/video-i2c.c                      |   12 +-
 drivers/media/pci/cx23885/cx23885-cards.c          |   30 +
 drivers/media/pci/cx23885/cx23885-core.c           |   33 +-
 drivers/media/pci/cx23885/cx23885-video.c          |    3 +-
 drivers/media/pci/cx23885/cx23885.h                |    1 +
 drivers/media/pci/cx23885/netup-eeprom.c           |   29 -
 drivers/media/pci/cx23885/netup-eeprom.h           |    1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |   11 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |   33 -
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |    3 -
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |   12 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |    2 -
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |    1 +
 drivers/media/pci/intel/ivsc/mei_csi.c             |   78 +-
 drivers/media/pci/mgb4/mgb4_cmt.c                  |    8 +-
 drivers/media/pci/mgb4/mgb4_core.c                 |   13 +-
 drivers/media/pci/mgb4/mgb4_core.h                 |    8 +-
 drivers/media/pci/mgb4/mgb4_regs.c                 |    1 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/allegro-dvt/allegro-core.c  |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c       |    4 +-
 .../media/platform/chips-media/coda/coda-common.c  |    1 +
 .../media/platform/chips-media/wave5/wave5-hw.c    |    2 +-
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |   31 +-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |    4 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c      |   10 +
 .../mediatek/vcodec/common/mtk_vcodec_fw_scp.c     |    5 +-
 .../mediatek/vcodec/encoder/venc/venc_h264_if.c    |    6 +-
 drivers/media/platform/nuvoton/npcm-video.c        |    6 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |    5 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |   11 +-
 drivers/media/platform/qcom/Kconfig                |    1 +
 drivers/media/platform/qcom/Makefile               |    1 +
 drivers/media/platform/qcom/camss/Makefile         |    2 +
 drivers/media/platform/qcom/camss/camss-csid-4-1.c |   19 -
 drivers/media/platform/qcom/camss/camss-csid-4-7.c |   42 -
 drivers/media/platform/qcom/camss/camss-csid-780.c |  337 +++
 drivers/media/platform/qcom/camss/camss-csid-780.h |   25 +
 .../media/platform/qcom/camss/camss-csid-gen2.c    |   60 -
 drivers/media/platform/qcom/camss/camss-csid.c     |  258 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   54 +-
 .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |    6 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  794 +++---
 drivers/media/platform/qcom/camss/camss-csiphy.c   |    4 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |    8 +
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  112 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c  |    9 -
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c  |   11 -
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c  |   11 -
 drivers/media/platform/qcom/camss/camss-vfe-480.c  |  274 +-
 drivers/media/platform/qcom/camss/camss-vfe-780.c  |  159 ++
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c |    9 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  275 ++
 drivers/media/platform/qcom/camss/camss-vfe.h      |   59 +-
 drivers/media/platform/qcom/camss/camss.c          |  595 ++++-
 drivers/media/platform/qcom/camss/camss.h          |    6 +-
 drivers/media/platform/qcom/iris/Kconfig           |   13 +
 drivers/media/platform/qcom/iris/Makefile          |   31 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |  623 +++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  117 +
 drivers/media/platform/qcom/iris/iris_core.c       |   96 +
 drivers/media/platform/qcom/iris/iris_core.h       |  111 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  259 ++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   22 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  116 +
 drivers/media/platform/qcom/iris/iris_firmware.h   |   15 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  176 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  155 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   16 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  826 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  448 ++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  666 +++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   41 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  957 +++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  161 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  292 +++
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  125 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  934 +++++++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  318 +++
 drivers/media/platform/qcom/iris/iris_hfi_queue.h  |  182 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |   77 +
 .../platform/qcom/iris/iris_platform_common.h      |  186 ++
 .../platform/qcom/iris/iris_platform_sm8250.c      |  149 ++
 .../platform/qcom/iris/iris_platform_sm8550.c      |  266 ++
 drivers/media/platform/qcom/iris/iris_power.c      |  140 +
 drivers/media/platform/qcom/iris/iris_power.h      |   13 +
 drivers/media/platform/qcom/iris/iris_probe.c      |  349 +++
 drivers/media/platform/qcom/iris/iris_resources.c  |  131 +
 drivers/media/platform/qcom/iris/iris_resources.h  |   18 +
 drivers/media/platform/qcom/iris/iris_state.c      |  276 ++
 drivers/media/platform/qcom/iris/iris_state.h      |  144 +
 drivers/media/platform/qcom/iris/iris_utils.c      |   90 +
 drivers/media/platform/qcom/iris/iris_utils.h      |   53 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  335 +++
 drivers/media/platform/qcom/iris/iris_vb2.h        |   19 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  659 +++++
 drivers/media/platform/qcom/iris/iris_vdec.h       |   25 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  453 ++++
 drivers/media/platform/qcom/iris/iris_vidc.h       |   15 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   38 +
 drivers/media/platform/qcom/iris/iris_vpu3.c       |  122 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  270 ++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   91 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  369 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   28 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   17 +
 drivers/media/platform/qcom/venus/Kconfig          |    2 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |  100 +-
 drivers/media/platform/qcom/venus/hfi_venus.c      |   18 +-
 drivers/media/platform/qcom/venus/venc_ctrls.c     |    9 +-
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   |    6 +-
 drivers/media/platform/renesas/rcar-csi2.c         |  118 +-
 drivers/media/platform/renesas/rcar-isp.c          |  162 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |    4 +-
 drivers/media/platform/rockchip/rga/rga-buf.c      |    7 +
 drivers/media/platform/rockchip/rga/rga-hw.c       |    2 +-
 .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c      |    5 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |    3 +-
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |    3 +-
 drivers/media/platform/st/stm32/stm32-csi.c        |  106 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |   23 +-
 drivers/media/platform/synopsys/Kconfig            |    3 +
 drivers/media/platform/synopsys/Makefile           |    2 +
 drivers/media/platform/synopsys/hdmirx/Kconfig     |   35 +
 drivers/media/platform/synopsys/hdmirx/Makefile    |    4 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 2746 ++++++++++++++++=
++++
 .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |  394 +++
 .../platform/synopsys/hdmirx/snps_hdmirx_cec.c     |  275 ++
 .../platform/synopsys/hdmirx/snps_hdmirx_cec.h     |   43 +
 drivers/media/platform/ti/cal/cal-camerarx.c       |    3 +-
 drivers/media/platform/ti/cal/cal.c                |    4 +-
 drivers/media/platform/ti/cal/cal.h                |    1 +
 drivers/media/platform/ti/omap3isp/isp.c           |   54 +-
 drivers/media/platform/ti/omap3isp/isp.h           |    2 -
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |    1 +
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |    8 +-
 drivers/media/platform/xilinx/xilinx-tpg.c         |    2 -
 drivers/media/radio/radio-aztech.c                 |    2 +-
 drivers/media/radio/radio-wl1273.c                 |    4 +-
 drivers/media/rc/keymaps/Makefile                  |    1 +
 drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c |   71 +
 drivers/media/rc/rc-core-priv.h                    |    4 +-
 drivers/media/rc/streamzap.c                       |   70 +-
 drivers/media/test-drivers/vim2m.c                 |    6 +-
 drivers/media/test-drivers/vimc/vimc-streamer.c    |    6 +
 drivers/media/test-drivers/visl/visl-core.c        |   12 +
 drivers/media/test-drivers/vivid/Kconfig           |   12 +-
 drivers/media/test-drivers/vivid/Makefile          |    5 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |   14 +-
 drivers/media/test-drivers/vivid/vivid-core.h      |    2 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c     |   36 +-
 .../media/test-drivers/vivid/vivid-kthread-cap.c   |   11 +-
 .../media/test-drivers/vivid/vivid-kthread-out.c   |   11 +-
 .../media/test-drivers/vivid/vivid-kthread-touch.c |   11 +-
 drivers/media/test-drivers/vivid/vivid-osd.c       |   24 +-
 drivers/media/test-drivers/vivid/vivid-osd.h       |   19 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   |   11 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c   |    3 +-
 drivers/media/tuners/tuner-simple.c                |   20 +-
 drivers/media/tuners/tuner-types.c                 |  296 +--
 drivers/media/usb/cx231xx/cx231xx-417.c            |   17 +-
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h        |   18 +-
 drivers/media/usb/dvb-usb-v2/af9015.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/af9035.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/au6610.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/ce6230.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/dvb_usb.h             |    2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |    2 +-
 drivers/media/usb/dvb-usb-v2/ec168.c               |    2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c               |    2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c             |    2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf.c            |    2 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |    2 +-
 drivers/media/usb/dvb-usb/a800.c                   |    2 +-
 drivers/media/usb/dvb-usb/af9005.c                 |    4 +-
 drivers/media/usb/dvb-usb/az6027.c                 |    4 +-
 drivers/media/usb/dvb-usb/cinergyT2-core.c         |    2 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c           |    4 +-
 drivers/media/usb/dvb-usb/cxusb.c                  |    6 +-
 drivers/media/usb/dvb-usb/dibusb-mb.c              |    2 +-
 drivers/media/usb/dvb-usb/dibusb-mc.c              |    2 +-
 drivers/media/usb/dvb-usb/digitv.c                 |    4 +-
 drivers/media/usb/dvb-usb/dtt200u.c                |    2 +-
 drivers/media/usb/dvb-usb/dtv5100.c                |    4 +-
 drivers/media/usb/dvb-usb/dvb-usb.h                |    6 +-
 drivers/media/usb/dvb-usb/dw2102.c                 |   16 +-
 drivers/media/usb/dvb-usb/gp8psk.c                 |    2 +-
 drivers/media/usb/dvb-usb/m920x.c                  |    4 +-
 drivers/media/usb/dvb-usb/nova-t-usb2.c            |    2 +-
 drivers/media/usb/dvb-usb/opera1.c                 |    4 +-
 drivers/media/usb/dvb-usb/pctv452e.c               |    6 +-
 drivers/media/usb/dvb-usb/technisat-usb2.c         |    4 +-
 drivers/media/usb/dvb-usb/ttusb2.c                 |    4 +-
 drivers/media/usb/dvb-usb/umt-010.c                |    2 +-
 drivers/media/usb/dvb-usb/vp702x.c                 |    2 +-
 drivers/media/usb/dvb-usb/vp7045.c                 |    2 +-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c           |   40 +-
 drivers/media/usb/pwc/pwc-if.c                     |    1 -
 drivers/media/usb/uvc/uvc_ctrl.c                   |  799 ++++--
 drivers/media/usb/uvc/uvc_driver.c                 |   44 +-
 drivers/media/usb/uvc/uvc_v4l2.c                   |   74 +-
 drivers/media/usb/uvc/uvcvideo.h                   |   32 +-
 drivers/media/v4l2-core/v4l2-common.c              |   32 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |  105 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  169 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |    6 +-
 drivers/media/v4l2-core/v4l2-dv-timings.c          |   40 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   43 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |    2 +
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |   35 +-
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   |    9 +-
 drivers/staging/media/imx/imx-media-vdic.c         |   54 -
 include/media/rc-core.h                            |   46 +-
 include/media/rc-map.h                             |    1 +
 include/media/tuner-types.h                        |    6 +-
 include/media/v4l2-common.h                        |   19 +-
 include/media/v4l2-ctrls.h                         |   50 +-
 include/media/v4l2-dv-timings.h                    |    1 +
 include/media/v4l2-ioctl.h                         |   12 -
 include/media/v4l2-mediabus.h                      |    2 +
 include/media/v4l2-subdev.h                        |    4 +-
 include/uapi/linux/rkisp1-config.h                 |    2 +-
 include/uapi/linux/usb/video.h                     |    1 +
 include/uapi/linux/uvcvideo.h                      |   13 +
 include/uapi/linux/v4l2-controls.h                 |    7 +
 include/uapi/linux/videodev2.h                     |    5 +
 281 files changed, 22628 insertions(+), 3414 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-en=
gine.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-cam=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-cam=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-iri=
s.yaml
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx=
.yaml
 create mode 100644 drivers/media/i2c/lt6911uxe.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-780.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c
 create mode 100644 drivers/media/platform/qcom/iris/Kconfig
 create mode 100644 drivers/media/platform/qcom/iris/Makefile
 create mode 100644 drivers/media/platform/qcom/iris/iris_buffer.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_buffer.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_core.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_core.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_ctrls.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_ctrls.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_firmware.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_firmware.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_common.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_common.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1_response=
.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_response=
.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_queue.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_queue.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_instance.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_common.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8250.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8550.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_power.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_power.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_probe.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_resources.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_resources.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_state.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_state.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_utils.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_utils.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_vb2.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vb2.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_vdec.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vdec.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_vidc.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vidc.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu2.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu3.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_buffer.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_buffer.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_common.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_common.h
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_register_defi=
nes.h
 create mode 100644 drivers/media/platform/synopsys/Kconfig
 create mode 100644 drivers/media/platform/synopsys/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
 create mode 100644 drivers/media/rc/keymaps/rc-siemens-gigaset-rc20.c

