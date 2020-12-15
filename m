Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028A12DB58D
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 22:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgLOVCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 16:02:12 -0500
Received: from retiisi.eu ([95.216.213.190]:47466 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727804AbgLOVCC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 16:02:02 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id CE938634C87
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 22:59:31 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] ccs: Get static data version minor correctly
Date:   Tue, 15 Dec 2020 22:52:45 +0200
Message-Id: <20201215205245.3511-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix obtaining CCS static data version minor part correctly. Instead, the
upper 8 bits were obtained from the major version number.

Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 59338a6704af..52c3534d2061 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -151,7 +151,7 @@ static int ccs_data_parse_version(struct bin_container *bin,
 	vv->version_major = ((u16)v->static_data_version_major[0] << 8) +
 		v->static_data_version_major[1];
 	vv->version_minor = ((u16)v->static_data_version_minor[0] << 8) +
-		v->static_data_version_major[1];
+		v->static_data_version_minor[1];
 	vv->date_year =  ((u16)v->year[0] << 8) + v->year[1];
 	vv->date_month = v->month;
 	vv->date_day = v->day;
-- 
2.29.2

