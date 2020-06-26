Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409C820B141
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgFZMTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:35 -0400
Received: from mga06.intel.com ([134.134.136.31]:61058 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728290AbgFZMTd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:33 -0400
IronPort-SDR: Y1MBOzHGzP8Or3oaxC85Wu/KzzqGn+oC6IlEWyIbnVvahJn6EGQM1d/MErrI8bV1M0Ef2ylb6R
 2258STlxRrtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="206818993"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="206818993"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:32 -0700
IronPort-SDR: BXoa+NGYslo2E62TJY+ShinQxyxyR6VBGprGjCTXulkAXx855BltH//mR1EU1W7VXalNkxc2c4
 96dUtREGgSmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="280130796"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 69B3B66E; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 10/15] media: atomisp: Don't try to parse unexpected ACPI object type
Date:   Fri, 26 Jun 2020 15:19:20 +0300
Message-Id: <20200626121925.14365-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are devices with completely different _DSM() format,
and accessing object as a package leads to crashes.

Bail out in the case of unexpected object type.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index fb61274af7e5..f06c0eb6d288 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -959,6 +959,10 @@ static int gmin_get_config_dsm_var(struct device *dev,
 		return -EINVAL;
 	}
 
+	/* Return on unexpected object type */
+	if (obj->type != ACPI_TYPE_PACKAGE)
+		return -EINVAL;
+
 #if 0 /* Just for debugging purposes */
 	for (i = 0; i < obj->package.count; i++) {
 		union acpi_object *cur = &obj->package.elements[i];
-- 
2.27.0

