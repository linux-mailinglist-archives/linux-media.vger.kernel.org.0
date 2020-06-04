Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B451EEC56
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 22:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730072AbgFDUrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 16:47:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730008AbgFDUrK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 16:47:10 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDEC7207F9;
        Thu,  4 Jun 2020 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591303629;
        bh=EpUoapDsHAy7sbPtW80ddehyw4Im20LRuhLaco5sdq4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZTi7nPKy6NlZdYGSLyK240eCUKAv0MdxqRIl+3hmzgZda3rI6lUuNF0lTYGit7jM9
         LFFFiFzqTdWYD0J5WtUhFKP86L4cSb2ANcKzey2F8SNFGAcvdHJQcbQRB8h7iOlbO5
         DmQ/sNctCVEN45PXCln2vKdDaqDhmivkbAJAgt4w=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgwlW-0004Ap-Td; Thu, 04 Jun 2020 22:47:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] media: atomisp: improve ACPI/DMI detection logs
Date:   Thu,  4 Jun 2020 22:47:05 +0200
Message-Id: <aca33f229a1cb2425df1bb6d08670ad982e9daa0.1591303518.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591303518.git.mchehab+huawei@kernel.org>
References: <cover.1591303518.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As there are several ways where the driver could possible
retrieve sensor data, make the prints clearer about what
was detected and from where.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c  | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a14326111b26..1ba03448d348 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -936,7 +936,8 @@ int atomisp_gmin_register_vcm_control(struct camera_vcm_control *vcmCtrl)
 }
 EXPORT_SYMBOL_GPL(atomisp_gmin_register_vcm_control);
 
-static int gmin_get_hardcoded_var(struct gmin_cfg_var *varlist,
+static int gmin_get_hardcoded_var(struct device *dev,
+				  struct gmin_cfg_var *varlist,
 				  const char *var8, char *out, size_t *out_len)
 {
 	struct gmin_cfg_var *gv;
@@ -947,6 +948,8 @@ static int gmin_get_hardcoded_var(struct gmin_cfg_var *varlist,
 		if (strcmp(var8, gv->name))
 			continue;
 
+		dev_info(dev, "Found DMI entry for '%s'\n", var8);
+
 		vl = strlen(gv->val);
 		if (vl > *out_len - 1)
 			return -ENOSPC;
@@ -1070,9 +1073,10 @@ static int gmin_get_config_var(struct device *maindev,
 	 */
 	id = dmi_first_match(gmin_vars);
 	if (id) {
-		dev_info(maindev, "Found DMI entry for '%s'\n", var8);
-		return gmin_get_hardcoded_var(id->driver_data, var8, out,
-					      out_len);
+		ret = gmin_get_hardcoded_var(maindev, id->driver_data, var8,
+					     out, out_len);
+		if (!ret)
+			return 0;
 	}
 
 	/* Our variable names are ASCII by construction, but EFI names
@@ -1102,9 +1106,9 @@ static int gmin_get_config_var(struct device *maindev,
 		*out_len = ev->var.DataSize;
 		dev_info(maindev, "found EFI entry for '%s'\n", var8);
 	} else if (is_gmin) {
-		dev_warn(maindev, "Failed to find gmin variable %s\n", var8);
+		dev_info(maindev, "Failed to find EFI gmin variable %s\n", var8);
 	} else {
-		dev_warn(maindev, "Failed to find variable %s\n", var8);
+		dev_info(maindev, "Failed to find EFI variable %s\n", var8);
 	}
 
 	kfree(ev);
@@ -1123,6 +1127,8 @@ int gmin_get_var_int(struct device *dev, bool is_gmin, const char *var, int def)
 	if (!ret) {
 		val[len] = 0;
 		ret = kstrtol(val, 0, &result);
+	} else {
+		dev_info(dev, "%s: using default (%d)\n", var, def);
 	}
 
 	return ret ? def : result;
-- 
2.26.2

