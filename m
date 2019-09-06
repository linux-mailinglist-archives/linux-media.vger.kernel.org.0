Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEABABB30
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 16:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405537AbfIFOk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 10:40:56 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:17123 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729464AbfIFOk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 10:40:56 -0400
X-Halon-ID: 43a226ea-d0b4-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.84.18])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 43a226ea-d0b4-11e9-837a-0050569116f7;
        Fri, 06 Sep 2019 16:40:27 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] rcar-vin: Define which hardware supports NV12
Date:   Fri,  6 Sep 2019 16:40:28 +0200
Message-Id: <20190906144029.24080-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906144029.24080-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190906144029.24080-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most but not all Gen3 boards support outputting NV12, add a flag to
indicate which boards.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 6 ++++++
 drivers/media/platform/rcar-vin/rcar-vin.h  | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 6993484ff0f393ff..94993707fa9a2138 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -983,6 +983,7 @@ static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
 static const struct rvin_info rcar_info_r8a7795 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a7795_routes,
@@ -1077,6 +1078,7 @@ static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
 static const struct rvin_info rcar_info_r8a7796 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a7796_routes,
@@ -1121,6 +1123,7 @@ static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
 static const struct rvin_info rcar_info_r8a77965 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77965_routes,
@@ -1168,6 +1171,7 @@ static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
 static const struct rvin_info rcar_info_r8a77980 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77980_routes,
@@ -1184,6 +1188,7 @@ static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
 static const struct rvin_info rcar_info_r8a77990 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77990_routes,
@@ -1196,6 +1201,7 @@ static const struct rvin_group_route rcar_info_r8a77995_routes[] = {
 static const struct rvin_info rcar_info_r8a77995 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a77995_routes,
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index e562c2ff21ec7e7b..727ae0f3ac63c6ac 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -126,6 +126,7 @@ struct rvin_group_route {
  * struct rvin_info - Information about the particular VIN implementation
  * @model:		VIN model
  * @use_mc:		use media controller instead of controlling subdevice
+ * @nv12:		support outputing NV12 pixel format
  * @max_width:		max input width the VIN supports
  * @max_height:		max input height the VIN supports
  * @routes:		list of possible routes from the CSI-2 recivers to
@@ -134,6 +135,7 @@ struct rvin_group_route {
 struct rvin_info {
 	enum model_id model;
 	bool use_mc;
+	bool nv12;
 
 	unsigned int max_width;
 	unsigned int max_height;
-- 
2.23.0

