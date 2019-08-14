Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02658D04E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfHNKHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:07:46 -0400
Received: from retiisi.org.uk ([95.216.213.190]:35548 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725955AbfHNKHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:07:46 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id ACDAC634C88;
        Wed, 14 Aug 2019 13:07:33 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     chiranjeevi.rapolu@intel.com, hyungwoo.yang@intel.com
Subject: [PATCH 1/1] MAINTAINERS: Add entry for the ov5670 driver
Date:   Wed, 14 Aug 2019 13:04:58 +0300
Message-Id: <20190814100458.20080-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov5670 driver didn't get a MAINTAINERS entry when it was merged. Add
one now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 74c51fe3f25c..69d3fa86cf18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11846,6 +11846,14 @@ T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov5647.c
 
+OMNIVISION OV5670 SENSOR DRIVER
+M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
+M:	Hyungwoo Yang <hyungwoo.yang@intel.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/ov5670.c
+
 OMNIVISION OV5675 SENSOR DRIVER
 M:	Shawn Tu <shawnx.tu@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.20.1

