Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9546817DD2F
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCIKPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:15:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54819 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgCIKOr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:47 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQj-0003mL-6t; Mon, 09 Mar 2020 11:14:37 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001le-Ks; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v12 01/19] dt-bindings: connector: analog: add sdtv standards property
Date:   Mon,  9 Mar 2020 11:14:10 +0100
Message-Id: <20200309101428.15267-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some connectors no matter if in- or output supports only a limited
range of sdtv standards. It doesn't matter if the hardware behind that
connector supports more than the listed formats since the users are
restriced by a label e.g. to plug only a camera into this connector
which uses the PAL format.

This patch adds the capability to describe such limitation within the
firmware. There are no format restrictions if the property isn't
present, so it's completely backward compatible.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
[1] https://patchwork.kernel.org/cover/10794703/

v12:
- split patch https://patchwork.linuxtv.org/patch/58491/

v10:
- fix typo s/TV_STD_*/SDTV_STD_*/

v8:
Hi Rob,

I dropped your r b tag becuase of the changes I made in this version.
Please can you have look on it again? Luckily this would be the last
time ;-)

- move definition to include/dt-bindings/display
- rename tvnorms.h to sdtv-standards.h
- TVORMS_* -> SDTV_STD_*
- add sync comments
- adapt commit message
- fix bindings documentation

v7:
I kept Robs r b tag because I only changed the example and extended
TVNORM_* macros.

- fix some style issues
- add TVNORM_NTSC, TVNORM_525_60 and TVNORM_625_50

v6:
- tvnorms.h: use tabs instead of spaces
- tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
- tvnorms.h: drop rarely used TVNORM_ATSC_* norms

v2-v4:
- nothing since the patch was squashed from series [1] into this
  series.

 .../bindings/display/connector/analog-tv-connector.txt      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
index 0c0970c210ab..883bcb2604c7 100644
--- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
+++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
@@ -6,16 +6,22 @@ Required properties:
 
 Optional properties:
 - label: a symbolic name for the connector
+- sdtv-standards: limit the supported TV standards on a connector to the given
+                  ones. If not specified all TV standards are allowed.
+                  Possible TV standards are defined in
+                  include/dt-bindings/display/sdtv-standards.h.
 
 Required nodes:
 - Video port for TV input
 
 Example
 -------
+#include <dt-bindings/display/sdtv-standards.h>
 
 tv: connector {
 	compatible = "composite-video-connector";
 	label = "tv";
+	sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
 
 	port {
 		tv_connector_in: endpoint {
-- 
2.20.1

