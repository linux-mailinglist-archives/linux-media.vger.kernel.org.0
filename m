Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 613747123FD
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 11:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243128AbjEZJsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 05:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243159AbjEZJr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 05:47:57 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A1E1BD
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 02:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685094475; x=1716630475;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NyTEjsXCi0Oxksst6YHZ1kPWos/zXCcEdjb+P5KZGYI=;
  b=IFI8jE5pKFwslW14Pl1UOfinauKSzL1lX1oYzWpzTcUIKcwH4s/7VV5n
   fKT29du9iJIIFbAMklBWKsu2H5Hxvghe5Vo3LAceBwfbzUh0hWzNTvMcM
   hmINRftVkUfHoNkYRdyW4u+SVQJyfJeV2kO0vbJ3u3FJo6vz985PhoqFH
   T4mic7/8H/x1EJm6Lbzh9eZmRpowBZfJTqQXXGqCAW1pvp3MN7bFT3P0q
   4gnsYcEBHpsLk85zktpmvyuZUbcIednWkgIKR1czStG85ImojlSweNlns
   0TbXucc4P/xWI4SJ8s8BDE3STg7V9gvuIFGp7cdepmQoLlYYKwGCOu+X8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440521059"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="440521059"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="817478276"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="817478276"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga002.fm.intel.com with ESMTP; 26 May 2023 02:47:40 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com, bingbu.cao@intel.com
Subject: [PATCH 1/4] media: ov13b10: support new ACPI HID 'OVTI13B1'
Date:   Fri, 26 May 2023 17:58:37 +0800
Message-Id: <20230526095839.2443058-1-bingbu.cao@intel.com>
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

