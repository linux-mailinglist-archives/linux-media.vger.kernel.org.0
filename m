Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E763C83DF
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 13:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhGNLbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 07:31:31 -0400
Received: from mga18.intel.com ([134.134.136.126]:45830 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230164AbhGNLbb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 07:31:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="197600679"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; 
   d="scan'208";a="197600679"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 04:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; 
   d="scan'208";a="494420120"
Received: from ipu5-build.bj.intel.com ([10.238.232.202])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2021 04:28:34 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: staging: document that Imgu not output auto-exposure statistics
Date:   Wed, 14 Jul 2021 19:29:40 +0800
Message-Id: <1626262180-19749-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, Imgu can not support output the auto-exposure statistics into
ae_raw_buffer in 3A stats buffer, this patch document it.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index fa3d6ee5adf2..605113da1aed 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -534,6 +534,9 @@ struct ipu3_uapi_ff_status {
  *
  * @awb_raw_buffer: auto white balance meta data &ipu3_uapi_awb_raw_buffer
  * @ae_raw_buffer: auto exposure raw data &ipu3_uapi_ae_raw_buffer_aligned
+ *                 current Imgu does not output the auto exposure statistics
+ *                 to ae_raw_buffer, the user such as 3A algorithm can use the
+ *                 RGB table in &ipu3_uapi_awb_raw_buffer to do auto-exposure.
  * @af_raw_buffer: &ipu3_uapi_af_raw_buffer for auto focus meta data
  * @awb_fr_raw_buffer: value as specified by &ipu3_uapi_awb_fr_raw_buffer
  * @stats_4a_config: 4a statistics config as defined by &ipu3_uapi_4a_config.
-- 
2.7.4

