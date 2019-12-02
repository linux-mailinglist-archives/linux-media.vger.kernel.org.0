Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C362210E6F9
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 09:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLBIiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 03:38:02 -0500
Received: from retiisi.org.uk ([95.216.213.190]:37124 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725977AbfLBIiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Dec 2019 03:38:02 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id A75F0634C87;
        Mon,  2 Dec 2019 10:37:17 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, bingbu.cao@intel.com
Subject: [PATCH 1/1] intel-ipu3: Align struct ipu3_uapi_awb_fr_config_s to 32 bytes
Date:   Mon,  2 Dec 2019 10:38:20 +0200
Message-Id: <20191202083820.15639-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A struct that needs to be aligned to 32 bytes has a size of 28. Increase
the size to 32.

This makes elements of arrays of this struct aligned to 32 as well, and
other structs where members are aligned to 32 mixing
ipu3_uapi_awb_fr_config_s as well as other types.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 08eaa0bad0de..1c9c3ba4d518 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -449,7 +449,7 @@ struct ipu3_uapi_awb_fr_config_s {
 	__u16 reserved1;
 	__u32 bayer_sign;
 	__u8 bayer_nf;
-	__u8 reserved2[3];
+	__u8 reserved2[7];
 } __attribute__((aligned(32))) __packed;
 
 /**
-- 
2.20.1

