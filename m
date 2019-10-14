Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119E3D58EF
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 02:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbfJNAQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 20:16:31 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:47221 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728691AbfJNAQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 20:16:31 -0400
X-Halon-ID: ae0bfa0c-ee17-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id ae0bfa0c-ee17-11e9-837a-0050569116f7;
        Mon, 14 Oct 2019 02:15:09 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] rcar-vin: Define which hardware supports NV12
Date:   Mon, 14 Oct 2019 02:16:14 +0200
Message-Id: <20191014001615.2865301-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014001615.2865301-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191014001615.2865301-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most but not all Gen3 hardware support outputting NV12, add a flag to
indicate which SoCs do support it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 6 ++++++
 drivers/media/platform/rcar-vin/rcar-vin.h  | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 334c62805959cc8a..dcb539711151a3b5 100644
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
index 86e9bad44484092c..a36b0824f81d171d 100644
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

