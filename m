Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62092443AB
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 05:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgHNDCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 23:02:55 -0400
Received: from mga07.intel.com ([134.134.136.100]:48346 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbgHNDCz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 23:02:55 -0400
IronPort-SDR: slOS+5gjyNI3HbwVa7/OZUoRtPG9gzP8GDWHHBsd6D6woiLKF6SniKKEb2odvcyXKJM0P+0XFK
 9E1r4/eQ2JKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="218683649"
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="218683649"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 20:02:54 -0700
IronPort-SDR: wEhkRU/DQPC9pX4DpyoPjXFa9SctLxpLCacV6p3VqTHLmP/IYd6gRRjH/Yt4wk5gy8JlMIq6OU
 TJPk0Stmdx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="399357936"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2020 20:02:52 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        helgaas@kernel.org
Cc:     sakari.ailus@linux.intel.com, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com
Subject: [PATCH v3] nvmem: core: add sanity check in nvmem_device_read()
Date:   Fri, 14 Aug 2020 11:01:46 +0800
Message-Id: <1597374106-15974-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

nvmem device read/write could be called directly once nvmem
device registered, the sanity check should be done before each
nvmem_reg_read/write().

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/nvmem/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 927eb5f6003f..09ad5a06efee 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -69,6 +69,9 @@ static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			  void *val, size_t bytes)
 {
+	if (bytes + offset > nvmem->size)
+		return -EINVAL;
+
 	if (nvmem->reg_read)
 		return nvmem->reg_read(nvmem->priv, offset, val, bytes);
 
@@ -80,6 +83,9 @@ static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 {
 	int ret;
 
+	if (bytes + offset > nvmem->size)
+		return -EINVAL;
+
 	if (nvmem->reg_write) {
 		gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
 		ret = nvmem->reg_write(nvmem->priv, offset, val, bytes);
-- 
2.7.4

