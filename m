Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7D871241A
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 11:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242934AbjEZJ4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 05:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjEZJ42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 05:56:28 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F276D8
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685094988; x=1716630988;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NyTEjsXCi0Oxksst6YHZ1kPWos/zXCcEdjb+P5KZGYI=;
  b=GhW/UkpQ1Z8TtAquMRUoBZfI5xQx3x2jzK8HXVZT7lEySkj+W4Jeg0C1
   bxet2XkMs+qZgZzt53L1H0rEES1GuhOINgVrI927d28N1P1QLiPkDy8/M
   TlPtywFd19d1D5oPmzHF9Ot/rmjnvsLddyLZHF2Xdj7fnFmuG3b/60HIP
   tAtxtGenbE26v3Hv16oGiZ5ypO3VeEAt4S82fBxIgKLnwipL2PcScQgE2
   kHY/D0GmhtGRBpO/4LX4Wn00E5glEgJlKuPFE4GEM1vmDxafaWNTTPOSL
   g0q9D26hp7Rdbz661uYJcHqdlyWTHU9j/438uWE+CkZ5ZamO8MFfRXIR6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334517518"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="334517518"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035292421"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="1035292421"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga005.fm.intel.com with ESMTP; 26 May 2023 02:56:26 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [RESEND PATCH 1/3] media: ov13b10: support new ACPI HID 'OVTI13B1'
Date:   Fri, 26 May 2023 18:07:23 +0800
Message-Id: <20230526100725.2467635-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

On ACPI systems, the HID of ov13b10 is 'OVTI13B1', add this new
HID in acpi IDs table to make driver support it.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index c1430044fb1e..ede33899248c 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1484,6 +1484,7 @@ static const struct dev_pm_ops ov13b10_pm_ops = {
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov13b10_acpi_ids[] = {
 	{"OVTIDB10"},
+	{"OVTI13B1"},
 	{ /* sentinel */ }
 };
 
-- 
2.40.1

