Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C89E2B09E3
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 17:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgKLQ1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 11:27:48 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:35083 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbgKLQ1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 11:27:48 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id AD989100011;
        Thu, 12 Nov 2020 16:27:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/8] media: i2c: Add RDACM21 camera module
Date:   Thu, 12 Nov 2020 17:27:21 +0100
Message-Id: <20201112162729.101384-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, this v4 follows discussion on how to better handle the initial
reverse channel amplitude and incorporate Geert's and Kieran suggestion
to use the value in millivolts instead of relying on a boolean property.

v4:
- Replace 'maxim-high-threshold' with 'maxim,initial-reverse-channel-mV'
- Increse delay when reading OV490 chip ID to give it a bit more time to
  exit reset

v3:
https://patchwork.linuxtv.org/project/linux-media/list/?series=3657

Background in v1 cover letter:
https://www.spinics.net/lists/linux-renesas-soc/msg52886.html

I have tested on Eagle V3M with 4 RDACM21, but the whole point of
this series is to retain compatibility with RDACM20.

For this reason I have included 2 patches on top, not intended for merge
that re-propose DTS support for the MAXIM max9286 expansion board connected
to Salvator-X and add the newly introduced property to the DTS file.

Kieran, I know you have a working setup with RDACM20, the final two patches are
meant for ease your testing. Can you give this series a spin ?

Series based on latest renesas-drivers tag: renesas-drivers-2020-11-10-v5.10-rc3

If I get a confirmation this setup works on Salvator-X, I'll submit the new
property for inclusion to devicetree people, which I have left out at the
moment.

Thanks
  j

Jacopo Mondi (7):
  media: i2c: Add driver for RDACM21 camera module
  dt-bindings: media: max9286: Document
    'maxim,,initial-reverse-channel-mV"
  media: i2c: max9286: Break-out reverse channel setup
  media: i2c: max9286: Make channel amplitude programmable
  media: i2c: max9286: Configure reverse channel amplitude
  [DNI] arm64: dts: renesas: salvator-x-max9286: Specify channel
    amplitude
  [DNI] arm64: dts: renesas: eagle: Specify channel amplitude

Laurent Pinchart (1):
  arm64: dts: renesas: salvator-x: Add MAX9286 expansion board

 .../bindings/media/i2c/maxim,max9286.yaml     |  23 +
 MAINTAINERS                                   |  12 +
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts |   1 +
 .../boot/dts/renesas/salvator-x-max9286.dtsi  | 396 +++++++++++++
 drivers/media/i2c/Kconfig                     |  13 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/max9286.c                   |  58 +-
 drivers/media/i2c/rdacm21.c                   | 539 ++++++++++++++++++
 8 files changed, 1031 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
 create mode 100644 drivers/media/i2c/rdacm21.c

--
2.29.1

