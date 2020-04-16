Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7248C1ABCA6
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392141AbgDPJSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:18:14 -0400
Received: from mga09.intel.com ([134.134.136.24]:26415 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392122AbgDPJSK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 05:18:10 -0400
IronPort-SDR: 1i6c4fO764gQNogmULoIQ+KKElIab1bn0WD7osyNzPGSEv6wT3yvMQbDtH6XofTKQSn+VxWBTQ
 VNBDiVzEod4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:07 -0700
IronPort-SDR: fx6QjBdzNuCkKVqGs9sC9txwuBHxIUDaVox0y6Wi+KZRJ6A9XZ27nr1fD23hULFSawLHbdBkrR
 Y8U9IkWJpYZA==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="242591048"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:05 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id ABB3A20939;
        Thu, 16 Apr 2020 12:18:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jP0fa-00087h-C6; Thu, 16 Apr 2020 12:18:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     rajmohan.mani@intel.com, bingbu.cao@intel.com, tfiga@chromium.org
Subject: [PATCH 2/3] staging: ipu3-imgu: Move alignment attribute to field
Date:   Thu, 16 Apr 2020 12:18:49 +0300
Message-Id: <20200416091850.31177-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
References: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the alignment attribute of struct ipu3_uapi_awb_fr_config_s to the
field in struct ipu3_uapi_4a_config, the other location where the struct
is used.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 5f43f631cf62f..a607b0158c81d 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -450,7 +450,7 @@ struct ipu3_uapi_awb_fr_config_s {
 	__u32 bayer_sign;
 	__u8 bayer_nf;
 	__u8 reserved2[7];
-} __attribute__((aligned(32))) __packed;
+} __packed;
 
 /**
  * struct ipu3_uapi_4a_config - 4A config
@@ -466,7 +466,8 @@ struct ipu3_uapi_4a_config {
 	struct ipu3_uapi_ae_grid_config ae_grd_config;
 	__u8 padding[20];
 	struct ipu3_uapi_af_config_s af_config;
-	struct ipu3_uapi_awb_fr_config_s awb_fr_config;
+	struct ipu3_uapi_awb_fr_config_s awb_fr_config
+		__attribute__((aligned(32)));
 } __packed;
 
 /**
-- 
2.20.1

