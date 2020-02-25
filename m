Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2BDB16B702
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 02:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgBYBEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 20:04:53 -0500
Received: from gofer.mess.org ([88.97.38.141]:44983 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727976AbgBYBEw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 20:04:52 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C657AC6500; Tue, 25 Feb 2020 01:04:51 +0000 (GMT)
Date:   Tue, 25 Feb 2020 01:04:51 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.7] RC & DVB
Message-ID: <20200225010451.GA22451@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

If you have the time, please have a detailed look at the 64 bit scancodes
commit. Otherwise, nothing to exciting here.

Thanks
Sean

The following changes since commit ef0ed05dcef8a74178a8b480cce23a377b1de2b8:

  media: staging/imx: Missing assignment in imx_media_capture_device_register() (2020-02-24 17:53:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.7a

for you to fetch changes up to 2d993d98c8f9643018208a6f0b945cebc0bfd8a6:

  media: rtl28xxu: add missing sleep before probing slave demod (2020-02-24 16:18:56 -0800)

----------------------------------------------------------------
v5.7a

----------------------------------------------------------------
Colin Ian King (1):
      media: rc: fix spelling mistake "to" -> "too"

Gustavo A. R. Silva (1):
      media: rc: iguanair: Replace zero-length array with flexible-array member

Mario Hros (1):
      media: rtl28xxu: add missing sleep before probing slave demod

Mohammad Rasim (2):
      dt-bindings: media: add new kii pro key map
      arm64: dts: amlogic: add rc-videostrong-kii-pro keymap

Sean Young (1):
      media: rc: make scancodes 64 bit

 Documentation/devicetree/bindings/media/rc.yaml    |  1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |  4 ++
 drivers/media/rc/bpf-lirc.c                        |  5 --
 drivers/media/rc/iguanair.c                        |  2 +-
 drivers/media/rc/ir-xmp-decoder.c                  |  2 +-
 drivers/media/rc/lirc_dev.c                        |  7 +-
 drivers/media/rc/rc-main.c                         | 77 ++++++++++++++--------
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |  3 +
 include/media/rc-core.h                            |  8 +--
 include/media/rc-map.h                             |  4 +-
 10 files changed, 68 insertions(+), 45 deletions(-)
