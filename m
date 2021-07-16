Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860A83CB3C9
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 10:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbhGPILQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 04:11:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:58618 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237321AbhGPILI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 04:11:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232530467"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232530467"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2021 01:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="495971437"
Received: from ipu5-build.bj.intel.com ([10.238.232.202])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2021 01:08:12 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: staging: document that Imgu not output auto-exposure statistics
Date:   Fri, 16 Jul 2021 16:06:28 +0800
Message-Id: <1626422788-10243-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, Imgu can not support output the auto-exposure statistics into
ae_raw_buffer in 3A stats buffer, this patch document it.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
index fa3d6ee5adf2..585f55981c86 100644
--- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
@@ -234,7 +234,9 @@ struct ipu3_uapi_ae_ccm {
  * struct ipu3_uapi_ae_config - AE config
  *
  * @grid_cfg:	config for auto exposure statistics grid. See struct
- *		&ipu3_uapi_ae_grid_config
+ *		&ipu3_uapi_ae_grid_config, as Imgu did not support output
+ *		auto exposure statistics, so user can ignore this configuration
+ *		and use the RGB table in auto-whitebalance statistics instead.
  * @weights:	&IPU3_UAPI_AE_WEIGHTS is based on 32x24 blocks in the grid.
  *		Each grid cell has a corresponding value in weights LUT called
  *		grid value, global histogram is updated based on grid value and
@@ -534,6 +536,9 @@ struct ipu3_uapi_ff_status {
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

