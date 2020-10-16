Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667F9290274
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 12:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406538AbgJPKG4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 06:06:56 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40099 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394309AbgJPKG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 06:06:56 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D6F22E0010;
        Fri, 16 Oct 2020 10:06:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/7] media: i2c: Add support for RDACM21 camera module
Date:   Fri, 16 Oct 2020 14:06:18 +0200
Message-Id: <20201016120625.64337-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v3:
- small update in 3/7 as suggested by Kieran and Sergei
- Add Kieran's tag to 3/7 and 4/7

Copy of v2 copy letter for reference:

Patch [1/7] introduces the camera module driver.
Only change compared to v1:
- Increase pixel clock to 55MHz

From [2/7] to [5/7] there's a proposal of a possible way to support
both RDACM20 and RDACM21 with the same deserializer driver.
See v1 cover letter for details:
https://www.spinics.net/lists/linux-renesas-soc/msg52886.html

I have tested on Eagle V3M with 4 RDACM21, but the whole point of
this series is to retain compatibility with RDACM20.

For this reason I have included 2 patches on top, not intended for merge
that re-propose DTS support for the MAXIM max9286 expansion board connected
to Salvator-X and add the newly introduced property to the DTS file.

Kieran, I know you have a working setup with RDACM20, the final two patches are
meant for ease your testing. Can you give this series a spin ?
For your convenience I pushed a branch
git://jmondi.org/linux #gmsl/jmondi/renesas-drivers-2020-10-13-v5.9/rdacm21_high-threshold

Series based on latest renesas-drivers tag: renesas-drivers-2020-10-13-v5.9

If I get a confirmation this setup works on Salvator-X, I'll submit the new
property for inclusion to devicetree people, which I have left out at the
moment.

Thanks
  j

Jacopo Mondi (6):
  media: i2c: Add driver for RDACM21 camera module
  dt-bindings: media: max9286: Document 'maxim,high-threshold'
  media: i2c: max9286: Break-out reverse channel setup
  media: i2c: max9286: Make channel amplitude programmable
  media: i2c: max9286: Configure reverse channel amplitude
  [DNI] arm64: dts: renesas: salvator-x-max9286: Use high-threshold

Laurent Pinchart (1):
  arm64: dts: renesas: salvator-x: Add MAX9286 expansion board

 .../bindings/media/i2c/maxim,max9286.yaml     |  15 +
 MAINTAINERS                                   |  12 +
 .../boot/dts/renesas/salvator-x-max9286.dtsi  | 396 +++++++++++++
 drivers/media/i2c/Kconfig                     |  13 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/max9286.c                   |  51 +-
 drivers/media/i2c/rdacm21.c                   | 538 ++++++++++++++++++
 7 files changed, 1017 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
 create mode 100644 drivers/media/i2c/rdacm21.c

--
2.28.0

