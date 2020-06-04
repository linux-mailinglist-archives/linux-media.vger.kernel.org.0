Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985111EE868
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 18:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbgFDQQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 12:16:00 -0400
Received: from mga03.intel.com ([134.134.136.65]:60613 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729631AbgFDQQA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 12:16:00 -0400
IronPort-SDR: rCVNU9BbgjnyTmM5psoEDwe6VBRQv0lezkFZuXBQOZowgR9mFiRpsL6LFspCj4vY35ARCfDwmn
 1TzCPK6pPhZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:45 -0700
IronPort-SDR: QuULIoJYcPQPMnWEhZ0LcpAw1CUEb1YVNIltM+UX8YbU+UuD3hHULA52pgZ1DOwIdJBKiiBdUI
 yTbblwTaipjA==
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; 
   d="scan'208";a="304758946"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2020 09:15:44 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0924D20859;
        Thu,  4 Jun 2020 19:15:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1jgsXV-0002QW-8j; Thu, 04 Jun 2020 19:16:21 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH 1/4] staging: atomisp: There's no struct atomisp_dvs2_coefficients
Date:   Thu,  4 Jun 2020 19:16:18 +0300
Message-Id: <20200604161621.9282-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
References: <20200604161621.9282-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's called struct atomisp_dis_coefficients.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/include/linux/atomisp.h    | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index e9670749bae08..bf262de1eab82 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -509,7 +509,7 @@ struct atomisp_parameters {
 	struct atomisp_shading_table *shading_table;
 	struct atomisp_morph_table   *morph_table;
 	struct atomisp_dvs_coefficients *dvs_coefs; /* DVS 1.0 coefficients */
-	struct atomisp_dvs2_coefficients *dvs2_coefs; /* DVS 2.0 coefficients */
+	struct atomisp_dis_coefficients *dvs2_coefs; /* DVS 2.0 coefficients */
 	struct atomisp_capture_config   *capture_config;
 	struct atomisp_anr_thres   *anr_thres;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5be690f876c11..934fca6102767 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3796,7 +3796,7 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 	}
 
 	css_param->update_flag.dvs2_coefs =
-	    (struct atomisp_dvs2_coefficients *)css_param->dvs2_coeff;
+	    (struct atomisp_dis_coefficients *)css_param->dvs2_coeff;
 	return 0;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 209bc9954a538..c3a7229ccd3d9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3696,8 +3696,8 @@ int atomisp_css_set_dis_coefs(struct atomisp_sub_device *asd,
 		return -EFAULT;
 
 	asd->params.css_param.update_flag.dvs2_coefs =
-	    (struct atomisp_dvs2_coefficients *)
-	    asd->params.css_param.dvs2_coeff;
+		(struct atomisp_dis_coefficients *)
+		asd->params.css_param.dvs2_coeff;
 	/* FIXME! */
 	/*	asd->params.dis_proj_data_valid = false; */
 	asd->params.css_update_params_needed = true;
-- 
2.20.1

