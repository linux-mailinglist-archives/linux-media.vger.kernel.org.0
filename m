Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5DE9141BF5
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2020 05:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgASEVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jan 2020 23:21:31 -0500
Received: from mga12.intel.com ([192.55.52.136]:2493 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbgASEVb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jan 2020 23:21:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jan 2020 20:21:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; 
   d="scan'208";a="220405115"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2020 20:21:29 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        tfiga@chromium.org, tian.shu.qiu@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: staging/intel-ipu3: remove TODO item about acronyms
Date:   Sun, 19 Jan 2020 12:26:55 +0800
Message-Id: <1579408015-31475-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Imgu acronyms are moved from header file into Document by previous
commit b8726aea59de780a2eb95897f133284d742d6c83, so the item can be
removed from TODO list now.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu3/TODO | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/TODO b/drivers/staging/media/ipu3/TODO
index 9ef036f23a21..dc356d6f03c4 100644
--- a/drivers/staging/media/ipu3/TODO
+++ b/drivers/staging/media/ipu3/TODO
@@ -8,9 +8,6 @@ staging directory.
 - IPU3 driver documentation (Laurent)
   Comments on configuring v4l2 subdevs for CIO2 and ImgU.
 
-- uAPI documentation:
-  Move acronyms to doc-rst file. (Mauro)
-
 - Switch to yavta from v4l2n in driver docs.
 
 - Elaborate the functionality of different selection rectangles in driver
-- 
2.7.4

