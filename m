Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1DE18BE68
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 18:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgCSRmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 13:42:17 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:39493 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbgCSRmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 13:42:15 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MryKr-1jbePu2RHx-00nvui; Thu, 19 Mar 2020 18:41:47 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 718EF65021B;
        Thu, 19 Mar 2020 17:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dqw4xhgj7N5p; Thu, 19 Mar 2020 18:41:44 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 0690264F8ED;
        Thu, 19 Mar 2020 18:41:44 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.52) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Mar 2020 18:41:44 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 739388050C; Thu, 19 Mar 2020 18:41:43 +0100 (CET)
Date:   Thu, 19 Mar 2020 18:41:43 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 01/10] media: adv748x: fix end-of-line terminators in
 diagnostic statements
Message-ID: <5272d873b4daf8b0bdb8aff81b08ab3508da9567.1584639664.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584639664.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.52]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7762
X-Provags-ID: V03:K1:4ZJC+78LMq1c97WiQD0OVYyKMvI2ohF7vZwBoZBySSHelaCDmeq
 jTulDTZ6oMWVm6JGSPM381luWOIXY0G0Xy5Jxtd8+LkP1J+xMMgMF47U3XO2pC5K8ZA27SY
 u5z3JDR9b4J1zpLbY1EPsQjHQ0Btv7f6oUPcCl/l0Xwv7tkGj2EKFAR7qPWpZRl8zRrMKE4
 pLDCrm3hu+wfQJsKjvp3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ojVJRJsVJU8=:N5P41ydm6kNSZsBBgmqFAA
 uEE2h2JO+yHumdQ9fz1F9A/c5FzikkH18zSopYh0pRURk6Z7xz+RVD3YvK1gatezthfuqIDi1
 9nIDWA/VFnlEe2MhYIc6VgiaJ6jc6hQP6h63xCqd6lKk/GaWDTRgEt7M6rRPVKavixF92lVRw
 jghXdwG745BXiwwtC86RusvPnHpwEfq6UotmurYqKeZwNWAi2bix/i8Z5qL3wWl9EzPMt1jXy
 COXi0qoQsQwYBIm3S+EDHhmW5n/qgJKQcgxZP4roONapuv6yYYhLi9pvbiZDTj7SXOhwmS9OB
 4w0cEhx8iDf7B6Sf13irliZfQj0OAMbooAJoTaTrEL9eGowycTt1ljZ8BSWF6L/2evIbu4Rog
 7oU0hApyfODq7n7izg6L3xJIYUAcpS1fPiKquwgfsa7wX3RSGI8MwMN6XQedhkOCDLvwUxqQh
 ZpDA6p6aH756Jbsevz/O1YIk8iGv6zXmptiQ5J/wU+75c0tY78y7R5wXFbPv0MM8SK/VOfGai
 dIm+jBNxmNdVeTKu3nNbQJjMkfMx4z1DAi+pPQMgt3XNVPBz4BSOU4VHjyEsfNPaHNaYCK5Wq
 FVph8hsp7VEJLAS/milgxzS6UJw/AxVyv+LbTII30H/DuL5GS0/0vfXhac/lir0z7Fz3q4OnC
 XTGBstnL40lvis1QCKTiMpxbC6CzO+57XrIaJr0N8f+N7H7BkqV6O3Q1c/+HpCw9bLpsNqgI8
 WyFHcBMRMa51BKTEXIRmXbJxSBqZ8n4/ry3Qvm2gXsgG1JN6VfM94MofeFm7PRLFz9E/6B3Ba
 FTPjLdLk7yXbaRey6xUmFJzXWS1eBkn+uXGl8QlscgNPKH+A4sS/LGx6jQkwv+3cLIpiZM/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-core.c | 24 ++++++++++++------------
 drivers/media/i2c/adv748x/adv748x-csi2.c |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 23e02ff27b17..c3fb113cef62 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -623,11 +623,11 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
 		of_graph_parse_endpoint(ep_np, &ep);
-		adv_info(state, "Endpoint %pOF on port %d", ep.local_node,
+		adv_info(state, "Endpoint %pOF on port %d\n", ep.local_node,
 			 ep.port);
 
 		if (ep.port >= ADV748X_PORT_MAX) {
-			adv_err(state, "Invalid endpoint %pOF on port %d",
+			adv_err(state, "Invalid endpoint %pOF on port %d\n",
 				ep.local_node, ep.port);
 
 			continue;
@@ -635,7 +635,7 @@ static int adv748x_parse_dt(struct adv748x_state *state)
 
 		if (state->endpoints[ep.port]) {
 			adv_err(state,
-				"Multiple port endpoints are not supported");
+				"Multiple port endpoints are not supported\n");
 			continue;
 		}
 
@@ -702,62 +702,62 @@ static int adv748x_probe(struct i2c_client *client)
 	/* Discover and process ports declared by the Device tree endpoints */
 	ret = adv748x_parse_dt(state);
 	if (ret) {
-		adv_err(state, "Failed to parse device tree");
+		adv_err(state, "Failed to parse device tree\n");
 		goto err_free_mutex;
 	}
 
 	/* Configure IO Regmap region */
 	ret = adv748x_configure_regmap(state, ADV748X_PAGE_IO);
 	if (ret) {
-		adv_err(state, "Error configuring IO regmap region");
+		adv_err(state, "Error configuring IO regmap region\n");
 		goto err_cleanup_dt;
 	}
 
 	ret = adv748x_identify_chip(state);
 	if (ret) {
-		adv_err(state, "Failed to identify chip");
+		adv_err(state, "Failed to identify chip\n");
 		goto err_cleanup_dt;
 	}
 
 	/* Configure remaining pages as I2C clients with regmap access */
 	ret = adv748x_initialise_clients(state);
 	if (ret) {
-		adv_err(state, "Failed to setup client regmap pages");
+		adv_err(state, "Failed to setup client regmap pages\n");
 		goto err_cleanup_clients;
 	}
 
 	/* SW reset ADV748X to its default values */
 	ret = adv748x_reset(state);
 	if (ret) {
-		adv_err(state, "Failed to reset hardware");
+		adv_err(state, "Failed to reset hardware\n");
 		goto err_cleanup_clients;
 	}
 
 	/* Initialise HDMI */
 	ret = adv748x_hdmi_init(&state->hdmi);
 	if (ret) {
-		adv_err(state, "Failed to probe HDMI");
+		adv_err(state, "Failed to probe HDMI\n");
 		goto err_cleanup_clients;
 	}
 
 	/* Initialise AFE */
 	ret = adv748x_afe_init(&state->afe);
 	if (ret) {
-		adv_err(state, "Failed to probe AFE");
+		adv_err(state, "Failed to probe AFE\n");
 		goto err_cleanup_hdmi;
 	}
 
 	/* Initialise TXA */
 	ret = adv748x_csi2_init(state, &state->txa);
 	if (ret) {
-		adv_err(state, "Failed to probe TXA");
+		adv_err(state, "Failed to probe TXA\n");
 		goto err_cleanup_afe;
 	}
 
 	/* Initialise TXB */
 	ret = adv748x_csi2_init(state, &state->txb);
 	if (ret) {
-		adv_err(state, "Failed to probe TXB");
+		adv_err(state, "Failed to probe TXB\n");
 		goto err_cleanup_txa;
 	}
 
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 2091cda50935..c43ce5d78723 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -72,7 +72,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
 	struct adv748x_state *state = tx->state;
 	int ret;
 
-	adv_dbg(state, "Registered %s (%s)", is_txa(tx) ? "TXA":"TXB",
+	adv_dbg(state, "Registered %s (%s)\n", is_txa(tx) ? "TXA":"TXB",
 			sd->name);
 
 	/*
-- 
2.25.1.25.g9ecbe7eb18


