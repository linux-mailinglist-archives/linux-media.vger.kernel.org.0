Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66BEA97A4A
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 15:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbfHUNEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 09:04:37 -0400
Received: from gofer.mess.org ([88.97.38.141]:48329 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfHUNEh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 09:04:37 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5263960449; Wed, 21 Aug 2019 14:04:35 +0100 (BST)
Date:   Wed, 21 Aug 2019 14:04:35 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.4] More DVB/RC changes
Message-ID: <20190821130434.gh4drkm6tiawzbpg@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This moves the MyGica T230 to dvbsky, like was previously done for the T230C
model. Other than that some minor fixes and device tree update to yaml.

Thanks
Sean

The following changes since commit d4e0f82ac840bf3d16b25d60f261b429603138a9:

  media: pixfmt-compressed.rst: improve H264/HEVC/MPEG1+2/VP8+9 documentation (2019-08-19 15:00:54 -0300)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.4e

for you to fetch changes up to da73cb750fdb94ea3dd70f97224bd27f72d91955:

  dt-bindings: media: Convert Allwinner A10 IR to a schema (2019-08-20 17:34:22 +0100)

----------------------------------------------------------------
DVB/RC for 5.4

----------------------------------------------------------------
Jan Pieter van Woerkom (2):
      media: dvb-usb: remove T230 from cxusb
      media: dvb-usb: add T230 to dvbsky

Maxime Ripard (2):
      dt-bindings: media: Add YAML schemas for the generic RC bindings
      dt-bindings: media: Convert Allwinner A10 IR to a schema

Nishka Dasgupta (4):
      media: dvb-bt8xx: Make variable dst_config constant
      media: firewire: Make structure fdtv_ca constant
      media: ec168: Make structure ec168_props constant
      media: dvb-frontends/cxd2099: Make en_templ constant

Tomas Bortoli (1):
      media: ttusb-dec: Fix info-leak in ttusb_dec_send_command()

 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |  80 ++++++++++
 Documentation/devicetree/bindings/media/rc.txt     | 118 +--------------
 Documentation/devicetree/bindings/media/rc.yaml    | 145 +++++++++++++++++++
 .../devicetree/bindings/media/sunxi-ir.txt         |  35 -----
 drivers/media/dvb-frontends/cxd2099.c              |   2 +-
 drivers/media/firewire/firedtv-ci.c                |   2 +-
 drivers/media/pci/bt8xx/dvb-bt8xx.c                |   2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c              |  21 ++-
 drivers/media/usb/dvb-usb-v2/ec168.c               |   2 +-
 drivers/media/usb/dvb-usb/cxusb.c                  | 161 ---------------------
 drivers/media/usb/ttusb-dec/ttusb_dec.c            |   2 +-
 11 files changed, 247 insertions(+), 323 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
 create mode 100644 Documentation/devicetree/bindings/media/rc.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/sunxi-ir.txt
