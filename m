Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E94F1D95CB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 14:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgESMCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 08:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgESMCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 08:02:11 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92617C08C5C0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 05:02:11 -0700 (PDT)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id CDCD4634C89;
        Tue, 19 May 2020 15:01:53 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH 1/1] MAINTAINERS: Mark ov5647 driver as "Orphan"
Date:   Tue, 19 May 2020 15:01:05 +0300
Message-Id: <20200519120105.7930-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The old maintainer's e-mail address is no longer working. Mark the driver
as orphan.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7bb6e22d5da..f9efe5d43438 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12431,9 +12431,8 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5640.c
 
 OMNIVISION OV5647 SENSOR DRIVER
-M:	Luis Oliveira <lolivei@synopsys.com>
 L:	linux-media@vger.kernel.org
-S:	Maintained
+S:	Orphan
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5647.c
 
-- 
2.20.1

