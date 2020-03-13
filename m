Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B46ED1850C4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 22:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgCMVMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 17:12:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:33087 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726637AbgCMVMs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 17:12:48 -0400
X-IronPort-AV: E=Sophos;i="5.70,550,1574089200"; 
   d="scan'208";a="41835027"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Mar 2020 06:12:43 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E2D6B40E09D5;
        Sat, 14 Mar 2020 06:12:38 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/4] ov5645: Switch to assigned-clock-rates
Date:   Fri, 13 Mar 2020 21:12:30 +0000
Message-Id: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support for using assigned-clock-rates for
specifying clock rates for ov5645 driver

Thanks,
Prabhakar

Changed for v3:
* Dropped reading assigned-clock-rates
* Increased the maximum clock frequency to 24480000

Changes for v2:
* Instead of completely dropping clock-frequency property marked it as
  deprecated.
* Split up imx6qdl-wandboard.dtsi changes as separate patch.

Lad Prabhakar (4):
  media: dt-bindings: media: i2c: Switch to assigned-clock-rates
  media: i2c: ov5645: Switch to assigned-clock-rates
  media: i2c: ov5645: Set maximum leverage of external clock frequency
    to 24480000
  ARM: dts: imx6qdl-wandboard: Switch to assigned-clock-rates for ov5645
    node

 .../devicetree/bindings/media/i2c/ov5645.txt       |  5 ++--
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi           |  3 ++-
 drivers/media/i2c/ov5645.c                         | 27 ++++++++++++----------
 3 files changed, 20 insertions(+), 15 deletions(-)

-- 
2.7.4

