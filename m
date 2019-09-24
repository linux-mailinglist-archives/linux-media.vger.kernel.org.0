Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45FBDBC696
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440818AbfIXLXI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:23:08 -0400
Received: from mga04.intel.com ([192.55.52.120]:59578 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440812AbfIXLXH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:23:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:07 -0700
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="182884300"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 04:23:06 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 075A720E7F;
        Tue, 24 Sep 2019 14:23:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iCiuw-00075P-Br; Tue, 24 Sep 2019 14:23:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 4/7] smiapp: Add definitions for data transfer if capability bits
Date:   Tue, 24 Sep 2019 14:23:35 +0300
Message-Id: <20190924112338.27180-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
References: <20190924112338.27180-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The data transfer capability register was defined but its bits were not.
Do that now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-reg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/smiapp/smiapp-reg.h b/drivers/media/i2c/smiapp/smiapp-reg.h
index 02b0abef6a223..43505cd0616e8 100644
--- a/drivers/media/i2c/smiapp/smiapp-reg.h
+++ b/drivers/media/i2c/smiapp/smiapp-reg.h
@@ -27,6 +27,9 @@
 #define SMIAPP_DATA_TRANSFER_IF_1_STATUS_EDATA		BIT(2)
 #define SMIAPP_DATA_TRANSFER_IF_1_STATUS_EUSAGE		BIT(3)
 
+#define SMIAPP_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED	BIT(0)
+#define SMIAPP_DATA_TRANSFER_IF_CAPABILITY_POLL		BIT(2)
+
 #define SMIAPP_SOFTWARE_RESET				BIT(0)
 
 #define SMIAPP_FLASH_MODE_CAPABILITY_SINGLE_STROBE	BIT(0)
-- 
2.20.1

