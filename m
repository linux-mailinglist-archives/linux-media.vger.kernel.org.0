Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2828C1BA833
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 17:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgD0Plk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 11:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727077AbgD0Plj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 11:41:39 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFA2C0610D5
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 08:41:39 -0700 (PDT)
Received: from lanttu.localdomain (lanttu.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::c1:2])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 0441F634C8F;
        Mon, 27 Apr 2020 18:40:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     rajmohan.mani@intel.com, bingbu.cao@intel.com, tfiga@chromium.org
Subject: [PATCH v1.1 1/3] Revert "staging: imgu: Address a compiler warning on alignment"
Date:   Mon, 27 Apr 2020 18:39:53 +0300
Message-Id: <20200427153953.346-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200416091850.31177-2-sakari.ailus@linux.intel.com>
References: <20200416091850.31177-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit c9d52c114a9fcc61c30512c7f810247a9f2812af.

The patch being reverted changed the memory layout of struct
ipu3_uapi_acc_param. Revert it, and address the compiler warning issues in
further patches.

Reported-by: Tomasz Figa <tfiga@chromium.org>
Tested-by: Tested-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Fixed upstream commit id.

 drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 1c9c3ba4d518..5f43f631cf62 100644
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

