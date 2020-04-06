Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4671B19FA92
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbgDFQm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:42:56 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:31608 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729416AbgDFQm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 12:42:56 -0400
X-IronPort-AV: E=Sophos;i="5.72,351,1580742000"; 
   d="scan'208";a="43643781"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Apr 2020 01:42:54 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A53F4006CD9;
        Tue,  7 Apr 2020 01:42:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/5] ov5645: Deprecate usage of the clock-frequency
Date:   Mon,  6 Apr 2020 17:42:36 +0100
Message-Id: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series does the following:
1: Deprecate usage of the clock-frequency property.
2: Converts bindings to json-schema

Thanks,
Prabhakar

Changes for v5:
* Dropped assigned-clocks
* Fixed review comments from Laurent for patch 5/5

Changes for v4:
* Addressed to comments from Laurent updated patch description for
  patch 1/5, 4/5.
* Included Reviewed-by tags from Laurent.
* Increased tolerance level to 5% for external clock frequency.
* Patch 5/5 is new patch which converts bindings to json-schema.

Changed for v3:
* Dropped reading assigned-clock-rates
* Increased the maximum clock frequency to 24480000

Changes for v2:
* Instead of completely dropping clock-frequency property marked it as
  deprecated.
* Split up imx6qdl-wandboard.dtsi changes as separate patch.

Lad Prabhakar (5):
  media: dt-bindings: media: i2c: Deprecate usage of the clock-frequency
    property
  media: i2c: ov5645: Drop reading clock-frequency dt-property
  media: i2c: ov5645: Turn probe error into warning for xvclk frequency
    mismatch
  ARM: dts: imx6qdl-wandboard: Drop clock-frequency property from ov5645
    node
  media: dt-bindings: media: i2c: convert ov5645 bindings to json-schema

 .../devicetree/bindings/media/i2c/ov5645.txt  |  54 --------
 .../devicetree/bindings/media/i2c/ov5645.yaml | 126 ++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi      |   1 -
 drivers/media/i2c/ov5645.c                    |  21 +--
 4 files changed, 133 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml

-- 
2.20.1

