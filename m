Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7C12103D1
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 08:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgGAGVy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 02:21:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57910 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgGAGVy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 02:21:54 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F118455B;
        Wed,  1 Jul 2020 08:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593584512;
        bh=/+m3Ksh55Q3cNYCFz7Xh4xcWcjcp+zge4slRCex/PDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fi0aXQP+EX4/FIhBmj2gx0bZQ9pClNeI7Coa7Qfjx5c/kpCB1TxVE1z/BdzrQEX8w
         XwAXoYfVbkEM0lo/EC0Uj0Rt3aqAcMC741AoEOXBzSfQIFPWjUAzTsepargsO+pwKI
         E/7n7odtylH0YQnoM4T0D+HCqKkynpZDWzcw2tFI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [PATCH v4 1/4] device property: Add a function to test is a fwnode is a graph endpoint
Date:   Wed,  1 Jul 2020 09:21:37 +0300
Message-Id: <20200701062140.12953-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers may need to test if a fwnode is a graph endpoint. To avoid
hand-written solutions that wouldn't work for all fwnode types, add a
new fwnode_graph_is_endpoint() function for this purpose. We don't need
to wire it up to different backends for OF and ACPI for now, as the
implementation can simply be based on checkout the presence of a
remote-endpoint property.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/linux/property.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 10d03572f52e..9f805c442819 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -389,6 +389,11 @@ struct fwnode_handle *
 fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
 			     u32 endpoint);
 
+static inline bool fwnode_graph_is_endpoint(struct fwnode_handle *fwnode)
+{
+	return fwnode_property_present(fwnode, "remote-endpoint");
+}
+
 /*
  * Fwnode lookup flags
  *
-- 
Regards,

Laurent Pinchart

