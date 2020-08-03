Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D73923A36E
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 13:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgHCLkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 07:40:15 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:25127 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726398AbgHCLj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 07:39:57 -0400
X-IronPort-AV: E=Sophos;i="5.75,429,1589209200"; 
   d="scan'208";a="53742345"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2020 20:39:34 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9C0B742389C3;
        Mon,  3 Aug 2020 20:39:31 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: media: ov772x: Document endpoint properties
Date:   Mon,  3 Aug 2020 12:39:11 +0100
Message-Id: <1596454753-13612-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document endpoint properties required for parallel interface

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/media/i2c/ov772x.txt     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
index 0b3ede5b8e6a..1f4153484717 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
@@ -21,6 +21,22 @@ subnode for its digital output video port, in accordance with the video
 interface bindings defined in Documentation/devicetree/bindings/media/
 video-interfaces.txt.
 
+Endpoint node required properties for parallel connection are:
+- remote-endpoint: a phandle to the bus receiver's endpoint node.
+- bus-width: shall be set to <8> for 8 bits parallel bus
+	     or <10> for 10 bits parallel bus
+- data-shift: shall be set to <2> for 8 bits parallel bus
+	      (lines 9:2 are used) or <0> for 10 bits parallel bus
+- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
+		(Not required for bus-type equal 6)
+- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
+		(Not required for bus-type equal 6)
+- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
+	       signal. (Not required for bus-type equal 6)
+- bus-type: data bus type. Possible values are:
+	    5 - Parallel
+	    6 - Bt.656
+
 Example:
 
 &i2c0 {
-- 
2.17.1

