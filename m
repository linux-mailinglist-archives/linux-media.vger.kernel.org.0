Return-Path: <linux-media+bounces-14309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D7D91B8B7
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 09:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ACC6B210D6
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 07:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02CC1428E6;
	Fri, 28 Jun 2024 07:45:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BDB12F397
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560710; cv=none; b=Uu8icFJuRZZKWPenebKggQ8BqMDLL3J5G3cEvZeaDDGvFoCl8VnhYlYVxtFW/wLRVyo2+icFWEt+OpRWYGUO1FheTIuCdSdsp3blHdZ2IrOWaTbpNTdv5x4U4PL3fyTwqgljwrPaBn61lS93AGOuo0Zgx/BCJy07tdoxzLRt1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560710; c=relaxed/simple;
	bh=DlOA0K4EhWUX9xTckyhow+q1YcPCjKe/MjT2sFQEtKY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dzbqEMopOt/ZhSX4hUo+Dnl36e9TlYcIP6yDrRHxEIJSaKbSj5sToXBA56wHH3Zb0mOEEELpHoP9E06S4Aevv7IpTb/QznbgrRCtINoHfyJ/9SS5TKQ1sXGImwOOYQLnKjrDuNSWeUGyGb5FNjAx7CeCUyyqFhikGoR91Hmdx+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC56C116B1;
	Fri, 28 Jun 2024 07:45:08 +0000 (UTC)
Message-ID: <d89c5556-57f8-44a9-92d9-0e06b372a895@xs4all.nl>
Date: Fri, 28 Jun 2024 09:45:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Nils Rothaug <nils.rothaug@gmx.de>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.11] Various fixes and enhancements
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If there are no objections, then I plan to merge this during the weekend.

Regards,

	Hans

The following changes since commit f5306b757cb78aeec45e03ee52ec038c6423ad7a:

  documentation: media: vivid: Update documentation on vivid loopback support (2024-06-28 08:00:29 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.11f

for you to fetch changes up to 5a3880e16c5cda3106a86d2b1e79b0223437bcba:

  media: videobuf2: add missing MODULE_DESCRIPTION() macro (2024-06-28 09:29:52 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Atanas Filipov (1):
      media: qcom: camss: Decompose register and link operations

Chen Ni (1):
      media: qcom: camss: Add check for v4l2_fwnode_endpoint_parse

Jeff Johnson (8):
      media: exynos4-is: add missing MODULE_DESCRIPTION() macros
      media: ti: add missing MODULE_DESCRIPTION() macros
      media: atomisp: add missing MODULE_DESCRIPTION() macros
      media: dvb-frontends: add missing MODULE_DESCRIPTION() macros
      media: uda1342: add missing MODULE_DESCRIPTION() macro
      usb: uvc: add missing MODULE_DESCRIPTION() macro
      media: dvb-usb: add missing MODULE_DESCRIPTION() macros
      media: videobuf2: add missing MODULE_DESCRIPTION() macro

Milen Mitkov (2):
      media: qcom: camss: Split testgen, RDI and RX for CSID 170
      media: qcom: camss: Decouple VFE from CSID

Nils Rothaug (5):
      media: tuner-simple: Add support for Tena TNF931D-DFDR1
      media: rc: add keymap for MyGica UTV3 remote
      media: dt-bindings: rc: add rc-mygica-utv3
      media: em28xx: Add support for MyGica UTV3
      media: em28xx: Set GPIOs for non-audio boards when switching input

Radoslav Tsvetkov (5):
      media: qcom: camss: Add per sub-device type resources
      media: qcom: camss: Attach formats to VFE resources
      media: qcom: camss: Attach formats to CSID resources
      media: qcom: camss: Attach formats to CSIPHY resources
      media: qcom: camss: Move format related functions

 Documentation/admin-guide/media/em28xx-cardlist.rst          |   8 +
 Documentation/admin-guide/media/tuner-cardlist.rst           |   2 +
 Documentation/devicetree/bindings/media/rc.yaml              |   1 +
 drivers/media/common/uvc.c                                   |   1 +
 drivers/media/common/videobuf2/videobuf2-dvb.c               |   1 +
 drivers/media/dvb-frontends/au8522_decoder.c                 |   1 +
 drivers/media/dvb-frontends/mb86a16.c                        |   1 +
 drivers/media/i2c/uda1342.c                                  |   1 +
 drivers/media/platform/qcom/camss/Makefile                   |   1 +
 drivers/media/platform/qcom/camss/camss-csid-4-1.c           | 132 +---------
 drivers/media/platform/qcom/camss/camss-csid-4-7.c           | 160 +-----------
 drivers/media/platform/qcom/camss/camss-csid-gen2.c          | 413 +++++++++++--------------------
 drivers/media/platform/qcom/camss/camss-csid.c               | 512 +++++++++++++++++++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-csid.h               |  32 ++-
 drivers/media/platform/qcom/camss/camss-csiphy.c             |  74 +++---
 drivers/media/platform/qcom/camss/camss-csiphy.h             |  23 +-
 drivers/media/platform/qcom/camss/camss-format.c             |  91 +++++++
 drivers/media/platform/qcom/camss/camss-format.h             |  62 +++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c            |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c            |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c            |   6 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c            |   6 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen1.c           |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe.c                | 483 +++++++++++++++++++++---------------
 drivers/media/platform/qcom/camss/camss-vfe.h                |  22 +-
 drivers/media/platform/qcom/camss/camss-video.c              | 294 +---------------------
 drivers/media/platform/qcom/camss/camss-video.h              |   4 +-
 drivers/media/platform/qcom/camss/camss.c                    | 731 +++++++++++++++++++++++++++++++++++++++----------------
 drivers/media/platform/qcom/camss/camss.h                    |  20 +-
 drivers/media/platform/samsung/exynos4-is/common.c           |   1 +
 drivers/media/platform/samsung/exynos4-is/fimc-is.c          |   1 +
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c        |   1 +
 drivers/media/platform/ti/vpe/vpdma.c                        |   1 +
 drivers/media/rc/keymaps/Makefile                            |   1 +
 drivers/media/rc/keymaps/rc-mygica-utv3.c                    |  69 ++++++
 drivers/media/tuners/tuner-types.c                           |  21 ++
 drivers/media/usb/dvb-usb/dibusb-common.c                    |   1 +
 drivers/media/usb/dvb-usb/dibusb-mc-common.c                 |   1 +
 drivers/media/usb/em28xx/em28xx-cards.c                      |  52 ++++
 drivers/media/usb/em28xx/em28xx-core.c                       |   3 +-
 drivers/media/usb/em28xx/em28xx.h                            |   1 +
 drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c |   1 +
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c          |   1 +
 include/media/rc-map.h                                       |   1 +
 include/media/tuner.h                                        |   1 +
 45 files changed, 1895 insertions(+), 1366 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-format.h
 create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c

