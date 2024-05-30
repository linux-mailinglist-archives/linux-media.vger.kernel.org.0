Return-Path: <linux-media+bounces-12248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F88D4D66
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 16:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FBADB23E1F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 14:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5089186E45;
	Thu, 30 May 2024 14:02:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA63186E32
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077767; cv=none; b=fyYeTQ/RaYBPUrB4maAeQVi2puDEUlNoA4ftMAvf1e1cgq1K7dT3cgQskJ++nBcIhKEJVuQ8m32cdILf44sIFtiBByDA3Movu72Bf9BHUHv4pArf3IrI84OjDvUwcNmR7tY6PEnFRuuTM+/MjWRlHbyvVs9ZV8ygom4QyYD2+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077767; c=relaxed/simple;
	bh=5jF1e+elChdtN0zlqTdu2qEkPeqlITtkluztrLdT6Fw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=uJpODt0VMFAQrYw4j6IjKZcO7sJjGpER6gB66ldzaB+GWsD0iTJMwz/KuBPRx5BtgbTtTaEGzjKhd2vsPfsehaLwMKL7sqVlAfGtWqbMTg7wjMFfdNDCGjESyvza0yhzLx9802QtmBA6oHrs74q7VeLk3Ein+BzxN/MiCbS0ZLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FD2C2BBFC;
	Thu, 30 May 2024 14:02:46 +0000 (UTC)
Message-ID: <95ef7c61-da54-45d3-bb73-a05f6f10771a@xs4all.nl>
Date: Thu, 30 May 2024 16:02:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Ricardo Ribalda <ribalda@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.11] Various fixes and enhancements
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If there are no objections, then I plan to push this tomorrow afternoon.

Regards,

	Hans

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.11a

for you to fetch changes up to d24d31123bc487b4bf1fd6708f98ee0157f5b604:

  media: tegra-vde: remove unused struct 'tegra_vde_h264_frame' (2024-05-30 15:47:39 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dr. David Alan Gilbert (9):
      media: dvb-frontends: drx39xyj: remove unused struct 'drxjeq_stat'
      media: dvb-frontends: stv0910: remove unused struct 'sinit_table'
      media: dvb-frontends: dib7000p: remove unused struct 'i2c_device'
      media: gs1662: remove unused struct 'gs_reg_fmt_custom'
      media: opera1: remove unused struct 'rc_map_opera_table'
      media: pvrusb2: remove unused struct 'debugifc_mask_item'
      media: amphion: remove unused struct 'vpu_malone_frame_buffer'
      media: m2m-deinterlace: remove unused struct 'vb2_dc_conf'
      media: tegra-vde: remove unused struct 'tegra_vde_h264_frame'

Fritz Koenig (1):
      Documentation: media: Fix v4l2_ctrl_vp8_frame struct

Jianfeng Liu (1):
      dt-bindings: media: rockchip-rga: add rockchip,rk3588-rga

Michael Tretter (1):
      media: rockchip: rga: fix sequence number handling

Mikhail Kobuk (1):
      media: pci: ivtv: Add check for DMA map result

Ricardo Ribalda (12):
      media: ivtv: Factor out schedule functions
      media: dvb-frontends/stv090x: Refactor tuner_i2c_lock
      media: go7007: Refactor Adlink PCI-MPG24 i2c mutex
      media: allegro: nal-hevc: Replace array[1] with array[N]
      media: xilinx: Refactor struct xvip_dma
      media: pci: cx18: Use flex arrays for struct cx18_scb
      media: siano: Refactor struct sms_msg_data
      media: siano: Remove unused structures
      media: siano: Use flex arrays for sms_firmware
      media: pci/ivtv: Replace ioremap with devm_ variants
      media: pci/ivtv: Replace request_mem_region with devm_ variant
      media: pci/ivtv: Use managed version of pci_enable_device

 Documentation/devicetree/bindings/media/rockchip-rga.yaml           |  1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst |  4 +--
 drivers/media/common/siano/smscoreapi.c                             | 10 +++---
 drivers/media/common/siano/smscoreapi.h                             | 18 ++---------
 drivers/media/common/siano/smsdvb-main.c                            |  4 +--
 drivers/media/common/siano/smsendian.c                              |  8 +++--
 drivers/media/dvb-frontends/dib7000p.c                              |  5 ---
 drivers/media/dvb-frontends/drx39xyj/drxj.c                         |  7 -----
 drivers/media/dvb-frontends/stv090x.c                               | 37 ++++++++++++----------
 drivers/media/dvb-frontends/stv0910.c                               |  5 ---
 drivers/media/pci/cx18/cx18-scb.h                                   |  2 +-
 drivers/media/pci/ivtv/ivtv-driver.c                                | 93 +++++++++++++++-----------------------------------------
 drivers/media/pci/ivtv/ivtv-fileops.c                               | 66 ++++++++++++++++++++++++----------------
 drivers/media/pci/ivtv/ivtv-udma.c                                  |  8 +++++
 drivers/media/pci/ivtv/ivtv-yuv.c                                   |  6 ++++
 drivers/media/pci/ivtv/ivtvfb.c                                     |  6 ++--
 drivers/media/platform/allegro-dvt/nal-hevc.h                       |  7 +++--
 drivers/media/platform/amphion/vpu_malone.c                         |  5 ---
 drivers/media/platform/m2m-deinterlace.c                            |  4 ---
 drivers/media/platform/nvidia/tegra-vde/h264.c                      |  5 ---
 drivers/media/platform/nvidia/tegra-vde/vde.h                       |  1 -
 drivers/media/platform/rockchip/rga/rga-buf.c                       |  5 +++
 drivers/media/platform/rockchip/rga/rga.c                           |  4 +++
 drivers/media/platform/rockchip/rga/rga.h                           |  3 ++
 drivers/media/platform/xilinx/xilinx-dma.c                          |  4 +--
 drivers/media/platform/xilinx/xilinx-dma.h                          |  2 +-
 drivers/media/spi/gs1662.c                                          |  8 -----
 drivers/media/usb/dvb-usb/opera1.c                                  |  4 ---
 drivers/media/usb/go7007/go7007-i2c.c                               | 30 +++++++++++-------
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c                        |  5 ---
 30 files changed, 157 insertions(+), 210 deletions(-)

