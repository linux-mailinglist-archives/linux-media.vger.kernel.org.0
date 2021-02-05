Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95748311387
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 22:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbhBEV1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 16:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232955AbhBEPAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 10:00:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F642C0613D6;
        Fri,  5 Feb 2021 08:38:31 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:169:7140:5c7:913e:f5dc:1fa])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1C45316;
        Fri,  5 Feb 2021 17:38:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612543109;
        bh=VDeh1UbbOpEZAzYMYoSbEP32YFEiJpOEK8yXSrSc9gw=;
        h=From:To:Cc:Subject:Date:From;
        b=W+E11Et3FLdhV256GHjyFmVVALpAUYR2UTSWtLPJDEfe79OTqd/b5NBiMjrZTrBdi
         gM8z6hM+IF0thk0bcB99GXRcKHwPYV4Ozqj1UzpvKVRpQHTrbtYw05c1m46L0rLHAQ
         W/T/UtvdDjE+I4dAeGyYG/0nEBCdizLed0+BjoGE=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        rahul.blr97@gmail.com, gregkh@linuxfoundation.org,
        mchehab@kernel.org, tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, jeanmichel.hautbois@ideasonboard.com
Subject: [PATCH] media: intel-ipu3: Specify CCM values precision
Date:   Fri,  5 Feb 2021 17:38:19 +0100
Message-Id: <20210205163819.28439-1-jeanmichel.hautbois@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When trying to convert a CCM matrix for IPU3, extreme values for the
Color Correction Matrix.
Specify the precision to ease userspace integration.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index edd8edda0647..68f7d11ce52f 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -923,19 +923,21 @@ struct ipu3_uapi_dm_config {
 /**
  * struct ipu3_uapi_ccm_mat_config - Color correction matrix
  *
- * @coeff_m11: CCM 3x3 coefficient, range [-65536, 65535]
+ * @coeff_m11: CCM 3x3 coefficient, range [-32768, 32767]
  * @coeff_m12: CCM 3x3 coefficient, range [-8192, 8191]
- * @coeff_m13: CCM 3x3 coefficient, range [-32768, 32767]
+ * @coeff_m13: CCM 3x3 coefficient, range [-8192, 8191]
  * @coeff_o_r: Bias 3x1 coefficient, range [-8191, 8181]
- * @coeff_m21: CCM 3x3 coefficient, range [-32767, 32767]
- * @coeff_m22: CCM 3x3 coefficient, range [-8192, 8191]
- * @coeff_m23: CCM 3x3 coefficient, range [-32768, 32767]
+ * @coeff_m21: CCM 3x3 coefficient, range [-8192, 8191]
+ * @coeff_m22: CCM 3x3 coefficient, range [-32768, 32767]
+ * @coeff_m23: CCM 3x3 coefficient, range [-8192, 8191]
  * @coeff_o_g: Bias 3x1 coefficient, range [-8191, 8181]
- * @coeff_m31: CCM 3x3 coefficient, range [-32768, 32767]
+ * @coeff_m31: CCM 3x3 coefficient, range [-8192, 8191]
  * @coeff_m32: CCM 3x3 coefficient, range [-8192, 8191]
  * @coeff_m33: CCM 3x3 coefficient, range [-32768, 32767]
  * @coeff_o_b: Bias 3x1 coefficient, range [-8191, 8181]
  *
+ * Precision s3.13, range [-8, 8).
+ *
  * Transform sensor specific color space to standard sRGB by applying 3x3 matrix
  * and adding a bias vector O. The transformation is basically a rotation and
  * translation in the 3-dimensional color spaces. Here are the defaults:
-- 
2.27.0

