Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7153F2CA2
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 15:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240509AbhHTNBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 09:01:10 -0400
Received: from retiisi.eu ([95.216.213.190]:38246 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240479AbhHTNBH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 09:01:07 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C09F8634C91
        for <linux-media@vger.kernel.org>; Fri, 20 Aug 2021 16:00:28 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: admin-guide: Update i2c-cardlist
Date:   Fri, 20 Aug 2021 16:00:28 +0300
Message-Id: <20210820130028.15339-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MIPI CCS compliant devices, a few Sony IMX, Hynix Hi-846 and
Omnivision ov13b10 sensors to the list of supported devices. Also drop
SMIA since as a standard it is obsolete.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/admin-guide/media/i2c-cardlist.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/i2c-cardlist.rst b/Documentation/admin-guide/media/i2c-cardlist.rst
index e60d459d18a9..1dd7ae4f2927 100644
--- a/Documentation/admin-guide/media/i2c-cardlist.rst
+++ b/Documentation/admin-guide/media/i2c-cardlist.rst
@@ -58,15 +58,20 @@ Camera sensor devices
 ============  ==========================================================
 Driver        Name
 ============  ==========================================================
+ccs           MIPI CCS compliant camera sensors (also SMIA++ and SMIA)
 et8ek8        ET8EK8 camera sensor
 hi556         Hynix Hi-556 sensor
+hi846         Hynix Hi-846 sensor
+imx214        Sony IMX208 sensor
 imx214        Sony IMX214 sensor
 imx219        Sony IMX219 sensor
 imx258        Sony IMX258 sensor
 imx274        Sony IMX274 sensor
 imx290        Sony IMX290 sensor
 imx319        Sony IMX319 sensor
+imx334        Sony IMX334 sensor
 imx355        Sony IMX355 sensor
+imx412        Sony IMX412 sensor
 m5mols        Fujitsu M-5MOLS 8MP sensor
 mt9m001       mt9m001
 mt9m032       MT9M032 camera sensor
@@ -79,6 +84,7 @@ mt9v032       Micron MT9V032 sensor
 mt9v111       Aptina MT9V111 sensor
 noon010pc30   Siliconfile NOON010PC30 sensor
 ov13858       OmniVision OV13858 sensor
+ov13b10       OmniVision OV13B10 sensor
 ov2640        OmniVision OV2640 sensor
 ov2659        OmniVision OV2659 sensor
 ov2680        OmniVision OV2680 sensor
@@ -104,7 +110,6 @@ s5k4ecgx      Samsung S5K4ECGX sensor
 s5k5baf       Samsung S5K5BAF sensor
 s5k6a3        Samsung S5K6A3 sensor
 s5k6aa        Samsung S5K6AAFX sensor
-smiapp        SMIA++/SMIA sensor
 sr030pc30     Siliconfile SR030PC30 sensor
 vs6624        ST VS6624 sensor
 ============  ==========================================================
@@ -138,6 +143,7 @@ Driver        Name
 ad5820        AD5820 lens voice coil
 ak7375        AK7375 lens voice coil
 dw9714        DW9714 lens voice coil
+dw9768        DW9768 lens voice coil
 dw9807-vcm    DW9807 lens voice coil
 ============  ==========================================================
 
-- 
2.30.2

