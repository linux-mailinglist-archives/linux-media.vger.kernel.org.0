Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B787817DEF0
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 12:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgCILqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 07:46:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43551 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726428AbgCILqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 07:46:45 -0400
X-IronPort-AV: E=Sophos;i="5.70,533,1574089200"; 
   d="scan'208";a="41388051"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Mar 2020 20:46:43 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B8986421A427;
        Mon,  9 Mar 2020 20:46:39 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] media: i2c: ov5645: Switch to assigned-clock-rates
Date:   Mon,  9 Mar 2020 11:46:11 +0000
Message-Id: <1583754373-16510-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series adds support for using assigned-clock-rates for
specifying clock rates for ov5645 driver

Lad Prabhakar (2):
  media: dt-bindings: media: i2c: Switch to assigned-clock-rates
  media: i2c: ov5645: Switch to assigned-clock-rates

 Documentation/devicetree/bindings/media/i2c/ov5645.txt | 4 ++--
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi               | 3 ++-
 drivers/media/i2c/ov5645.c                             | 9 ++-------
 3 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.7.4

