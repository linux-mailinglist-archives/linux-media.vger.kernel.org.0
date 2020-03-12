Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC04182DCA
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgCLKck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:32:40 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41053 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgCLKc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:32:27 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8T-0002xp-At; Thu, 12 Mar 2020 11:32:17 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCL8R-0001Jy-CL; Thu, 12 Mar 2020 11:32:15 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v13 04/21] media: v4l2-fwnode: fix v4l2_fwnode_parse_link handling
Date:   Thu, 12 Mar 2020 11:31:39 +0100
Message-Id: <20200312103156.3178-5-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312103156.3178-1-m.felsch@pengutronix.de>
References: <20200312103156.3178-1-m.felsch@pengutronix.de>
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

Currently the driver differentiate the port number property handling for
ACPI and DT. This is wrong as because ACPI should use the "reg" val too
[1].

[1] https://patchwork.kernel.org/patch/11421985/

Fixes: ca50c197bd96 ("[media] v4l: fwnode: Support generic fwnode for parsing standardised properties")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 6ece4320e1d2..d56eee9c09b8 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -560,7 +560,7 @@ EXPORT_SYMBOL_GPL(v4l2_fwnode_endpoint_alloc_parse);
 int v4l2_fwnode_parse_link(struct fwnode_handle *__fwnode,
 			   struct v4l2_fwnode_link *link)
 {
-	const char *port_prop = is_of_node(__fwnode) ? "reg" : "port";
+	const char *port_prop = "reg";
 	struct fwnode_handle *fwnode;
 
 	memset(link, 0, sizeof(*link));
-- 
2.20.1

