Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC9B18B336
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 13:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgCSMTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 08:19:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30118 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727112AbgCSMTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 08:19:47 -0400
X-IronPort-AV: E=Sophos;i="5.70,571,1574089200"; 
   d="scan'208";a="42339692"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Mar 2020 21:19:45 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8488342BCBC0;
        Thu, 19 Mar 2020 21:19:41 +0900 (JST)
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
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/5] ov5645: Deprecate usage of the clock-frequency
Date:   Thu, 19 Mar 2020 12:19:18 +0000
Message-Id: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series does the following:
1: Deprecate usage of the clock-frequency property.
2: Increases tolerance level to 5% for external clock frequency
3: Converts bindings to json-schema

Thanks,
Prabhakar

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
  media: i2c: ov5645: Switch to assigned-clock-rates
  media: i2c: ov5645: Increase tolerance of external clock frequency
  ARM: dts: imx6qdl-wandboard: Switch to assigned-clock-rates for ov5645
    node
  media: dt-bindings: media: i2c: convert ov5645 bindings to json-schema

 .../devicetree/bindings/media/i2c/ov5645.txt  |  54 -------
 .../devicetree/bindings/media/i2c/ov5645.yaml | 140 ++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi      |   3 +-
 drivers/media/i2c/ov5645.c                    |  30 ++--
 4 files changed, 156 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.yaml

-- 
2.20.1

