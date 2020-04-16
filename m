Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E5C1ABCA8
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392143AbgDPJST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:18:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:54589 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392129AbgDPJSL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 05:18:11 -0400
IronPort-SDR: GF8vadV1jZhhA5LfBVwD/pZ4MkTyaJ0D7ypBdT3Lbn9/xJcNeZ3Qmr5oiQU03ckgNiVWeXVY59
 G4tIqoztEl2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:07 -0700
IronPort-SDR: te9M+XHgAUc2pYxFEveHr+Wa17olzmifFUG3TUB1h+Ji6w1I5OFVwyx2qpyq7+m3CVC7+1ifAg
 h1eTfNm1/mBQ==
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="288832127"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 02:18:05 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id AB49420746;
        Thu, 16 Apr 2020 12:18:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jP0fa-00087e-Ax; Thu, 16 Apr 2020 12:18:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     rajmohan.mani@intel.com, bingbu.cao@intel.com, tfiga@chromium.org
Subject: [PATCH 1/3] Revert "staging: imgu: Address a compiler warning on alignment"
Date:   Thu, 16 Apr 2020 12:18:48 +0300
Message-Id: <20200416091850.31177-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
References: <20200416091850.31177-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit ef4104f3d81d8f0d897d7f0cd5d01b006c3caf80.

The patch being reverted changed the memory layout of struct
ipu3_uapi_acc_param. Revert it, and address the compiler warning issues in
further patches.

Reported-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 1c9c3ba4d518d..5f43f631cf62f 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -2477,7 +2477,7 @@ struct ipu3_uapi_acc_param {
 	struct ipu3_uapi_yuvp1_yds_config yds2 __attribute__((aligned(32)));
 	struct ipu3_uapi_yuvp2_tcc_static_config tcc __attribute__((aligned(32)));
 	struct ipu3_uapi_anr_config anr;
-	struct ipu3_uapi_awb_fr_config_s awb_fr __attribute__((aligned(32)));
+	struct ipu3_uapi_awb_fr_config_s awb_fr;
 	struct ipu3_uapi_ae_config ae;
 	struct ipu3_uapi_af_config_s af;
 	struct ipu3_uapi_awb_config awb;
-- 
2.20.1

