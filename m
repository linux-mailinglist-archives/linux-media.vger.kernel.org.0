Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395D62F85EE
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 21:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbhAOUCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 15:02:39 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43331 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbhAOUCh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 15:02:37 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1EE0E1C0006;
        Fri, 15 Jan 2021 20:01:53 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v5 01/16] docs: phy: Add a part about PHY mode and submode
Date:   Fri, 15 Jan 2021 21:01:26 +0100
Message-Id: <20210115200141.1397785-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Besides giving pointers to the relevant functions for PHY mode and
submode configuration, this clarifies the need to set them before
powering on the PHY.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/driver-api/phy/phy.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 8fc1ce0bb905..6cbc72707a49 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -195,3 +195,21 @@ DeviceTree Binding
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+PHY Mode and Submode
+====================
+
+Once a reference to a PHY is obtained by a controller, the PHY can be configured
+to a PHY mode and submode. PHY modes are described in the `phy_mode` enum while
+submodes are specific to the selected PHY mode.
+
+Mode and submode configuration is done by calling::
+
+	int phy_set_mode_ext(struct phy *phy, enum phy_mode mode, int submode);
+
+If no submode is to be configured, users can call::
+
+	int phy_set_mode(struct phy *phy, enum phy_mode mode);
+
+The PHY mode and submode must not be configured after the PHY has already been
+powered on.
-- 
2.30.0

