Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 310962ACF4
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 04:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfE0C0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 22:26:11 -0400
Received: from mga07.intel.com ([134.134.136.100]:46271 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbfE0C0L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 22:26:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 May 2019 19:26:11 -0700
X-ExtLoop1: 1
Received: from shawn-bm6650-pc.itwn.intel.com ([10.5.230.127])
  by fmsmga005.fm.intel.com with ESMTP; 26 May 2019 19:26:09 -0700
From:   Shawnx Tu <shawnx.tu@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        shawnx.tu@intel.com
Subject: [PATCH v2] ov8856: modify register to fix test pattern
Date:   Mon, 27 May 2019 10:26:05 +0800
Message-Id: <1558923965-23481-1-git-send-email-shawnx.tu@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shawn Tu <shawnx.tu@intel.com>

modify registers to fix bayer order in test pattern mode

Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
---
 drivers/media/i2c/ov8856.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index dbf1095..cd347d6 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -195,11 +195,11 @@ static const struct ov8856_reg mode_3280x2464_regs[] = {
 	{0x3800, 0x00},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
-	{0x3803, 0x07},
+	{0x3803, 0x06},
 	{0x3804, 0x0c},
 	{0x3805, 0xdf},
 	{0x3806, 0x09},
-	{0x3807, 0xa6},
+	{0x3807, 0xa7},
 	{0x3808, 0x0c},
 	{0x3809, 0xd0},
 	{0x380a, 0x09},
@@ -211,7 +211,7 @@ static const struct ov8856_reg mode_3280x2464_regs[] = {
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
-	{0x3813, 0x00},
+	{0x3813, 0x01},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x00},
@@ -385,11 +385,11 @@ static const struct ov8856_reg mode_1640x1232_regs[] = {
 	{0x3800, 0x00},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
-	{0x3803, 0x07},
+	{0x3803, 0x06},
 	{0x3804, 0x0c},
 	{0x3805, 0xdf},
 	{0x3806, 0x09},
-	{0x3807, 0xa6},
+	{0x3807, 0xa7},
 	{0x3808, 0x06},
 	{0x3809, 0x68},
 	{0x380a, 0x04},
@@ -401,7 +401,7 @@ static const struct ov8856_reg mode_1640x1232_regs[] = {
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
-	{0x3813, 0x00},
+	{0x3813, 0x01},
 	{0x3814, 0x03},
 	{0x3815, 0x01},
 	{0x3816, 0x00},
-- 
2.7.4

