Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25A3427401
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 01:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243734AbhJHXHX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 19:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243723AbhJHXHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 19:07:22 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1113FC061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 16:05:26 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r10so34085879wra.12
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 16:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KjQj7vP0MMHxT+XmS45qQSA4ttYyUHGrlPDBK5wxk1g=;
        b=KmfyhaZAxSxteHsPIMaTsTUMfDM9gCnl1gBMEvSfgOTxT30U9PKHYBLdOVj2m+qQRR
         iD/IuMZojATlrCmQeVPVKv+8qj4FV8mrfvR+lU0SgE2Nln4rzG6EZiNW66P1WZnqLAuL
         XjR/ai9/ZM73nUAuP8MGJhLL6/0O76O/w5LzKWu33yirQwAshyVSkwFeg6m0iG01KJYj
         853Oervpo4IUvwC71yGgu4ObnnKLVh29o0WCBoy+TXzdDomExCbIKjzVNbjoj4pNx2L2
         OL8G2GBU/C9KDc2SkuuBqRbnW8eMIcgS46L9aWE0z2a8mTkaE/xLRZLsU/ZgU4wDV3lE
         Mglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KjQj7vP0MMHxT+XmS45qQSA4ttYyUHGrlPDBK5wxk1g=;
        b=BtpJzGrEGBr6Hc99vdrzp5P48BpK/z0OAJs793g5SBkzrYnmxnvNfMuS51kHrQQRQB
         CPy4gthjRRju7Iy5Te8w+TLTarAe+Cc2dQwHFI5KIg3Fg/ZEfEXflmKXPMzp+sYxzixU
         vFgwEH9VNuX8xheDx2xjh2m4UMEw5uHXghN+9bcniL05lufwGB5uD8b23gaGNPd65FlZ
         totByefSaTX6IEwpxjsIBZNXinBL5pr6oMwu3ZtHcH2kgenlaVP7pAw2ZUn5Znl4Cp3w
         yo/UPC5sLAvz7ncl4E0PYc7H9MkWiDT4NZkFvTyXWuipp629e+EF54xvQE4XbgHdyhQA
         sHRg==
X-Gm-Message-State: AOAM530BOx3vtn5uVkSCJQ+9+EQd2IP+K1N4/yvts4h7vi/I2Asc2AMi
        2Suu1XBzjFJyKeOy/3nscgI+OI3bi9Y=
X-Google-Smtp-Source: ABdhPJxrttQcYnca3hyeCppGfBwKLkFuT4ZLwmCYaQsumPzAESMZoQprAv3JRzTzuCoAkwkFUpQgtg==
X-Received: by 2002:adf:a292:: with SMTP id s18mr7602773wra.42.1633734324741;
        Fri, 08 Oct 2021 16:05:24 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id y11sm679267wrg.18.2021.10.08.16.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 16:05:24 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v4 2/3] media: ipu3-cio2: Add link freq for INT33BE entry
Date:   Sat,  9 Oct 2021 00:05:14 +0100
Message-Id: <20211008230515.417451-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008230515.417451-1-djrscally@gmail.com>
References: <20211008230515.417451-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a link frequency to the cio2-bridge table of supported sensors.
This means that the driver can parse supported link frequencies from
firmware in the usual way and validate that it can accommodate them.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v3:

	- Patch introduced

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 30d29b96a339..1039d0b473ce 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -21,7 +21,7 @@
  */
 static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	/* Omnivision OV5693 */
-	CIO2_SENSOR_CONFIG("INT33BE", 0),
+	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
 };
-- 
2.25.1

