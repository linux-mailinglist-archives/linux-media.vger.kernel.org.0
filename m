Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B19C4B2C5B
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 19:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352456AbiBKSBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 13:01:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352443AbiBKSBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 13:01:35 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7642C9
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 10:01:34 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1351F240002;
        Fri, 11 Feb 2022 18:01:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
Date:   Fri, 11 Feb 2022 19:02:15 +0100
Message-Id: <20220211180216.290133-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220211180216.290133-1-jacopo@jmondi.org>
References: <20220211180216.290133-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.

The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
specify a SoC version number in the driver name.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 MAINTAINERS                                                     | 2 +-
 .../media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bdb8c881b0b..7def3b7d56bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/imx7.rst
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
-F:	drivers/media/platform/imx/imx7-mipi-csis.c
+F:	drivers/media/platform/imx/imx-mipi-csis.c
 F:	drivers/staging/media/imx/imx7-media-csi.c
 
 MEDIA DRIVERS FOR HELENE
diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
similarity index 100%
rename from drivers/media/platform/imx/imx7-mipi-csis.c
rename to drivers/media/platform/imx/imx-mipi-csis.c
-- 
2.35.0

