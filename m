Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622BB223C69
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgGQNZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:25:39 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48999 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgGQNZi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:25:38 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0E9DF1C0013;
        Fri, 17 Jul 2020 13:25:34 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/13] dt-bindings: media: ov5640: Convert to json-schema
Date:   Fri, 17 Jul 2020 15:28:46 +0200
Message-Id: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this series has been broken out from
" [PATCH 0/8] dt-bindings: media: i2c: Convert to json-schema"
which I sent out a few days ago.

It was a single patch, now it's 13. Not sure it's a good sign :)

Anyway, in the version sent as part of the mentioned series I just converted
the existing bindings to the json-schema format, without putting to much
attention to what was there.

As suggested by Laurent I moved to specify properties as dt-schema, to
allow their validation, and that sprinkled to a lot of fun.

For each patch in the series, the DTS and bindings maintainers are CC-ed.
The whole series has been sent to a limited audience only.

The series starts with a plain conversion of the existing bindings to
dt-schema. It then fixes a potential issue on a dts user of the sensor,
and then move to remove or demote endpoint properties that were marked as
required in the original text bindings. This of course causes a log of churn
in the existing DTS which use the sensor, and opens some questions there from
which I expect the individual maintainers to provide directions on.

Finally, the small patch for the driver to initialize DVP default signal
values to what the sensor manual and the bindings report.

The series ends with the update of the MAINTAINERS file with the new
.yaml binding file and the addition of myself as co-maintainer for the driver.
Steve if you intended to remove yourself please send a patch, I didn't dare to
do it myself :)

A final note for Rob and his bot: some patches breaks validation of existing
dts, which are then fixed by following patches. Hope this is ok, but it I
have to keep validation of all dts successful, patches would likely be huge
and hinder changes which I preferred to make explicitly in single patches.

Jacopo Mondi (13):
  dt-bindings: media: ov5640: Convert to json-schema
  arm64: dts: qcom: apq8016-sbc: Fix CSI-2 lanes routing
  dt-bindings: media: ov5640: Do not limit rotation
  dt-bindings: media: ti,cal: Remove sensor from example
  dt-bindings: media: ov5640: Make bus-type mandatory
  dt-bindings: media: ov5640: Require ep properties
  dt-bindings: media: ov5640: Remove clock-lanes
  dt-bindings: media: ov5640: Remove data-shift
  dt-bindings: media: ov5640: Add default for synch signals
  dt-bindings: media: ov5640: Demote DVP required properties
  media: i2c: ov5640: Initialize DVP polarities as default
  MAINTAINERS: ov5640: Add bindings file
  dt-bindings: media: ov5640: Add myself as co-maintainer

 .../devicetree/bindings/media/i2c/ov5640.txt  |  92 --------
 .../devicetree/bindings/media/i2c/ov5640.yaml | 208 ++++++++++++++++++
 .../devicetree/bindings/media/ti,cal.yaml     |  22 --
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/dra72-evm-common.dtsi       |   2 +-
 arch/arm/boot/dts/dra76-evm.dts               |   2 +-
 arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi |   2 +-
 arch/arm/boot/dts/imx6qdl-icore.dtsi          |   2 +-
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi      |   2 +-
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi        |   2 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts         |   2 +-
 .../allwinner/sun50i-a64-amarula-relic.dts    |   1 +
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts |   1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |   8 +-
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |   2 +-
 drivers/media/i2c/ov5640.c                    |  16 +-
 16 files changed, 232 insertions(+), 134 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5640.yaml

--
2.27.0

