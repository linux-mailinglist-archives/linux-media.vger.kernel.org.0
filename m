Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF1120B140
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 14:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgFZMTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 08:19:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:29753 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728278AbgFZMTd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 08:19:33 -0400
IronPort-SDR: Ffi9EYWALMUB77x9O7650aiHBxcdtUjkFghjE396Ucf9x5VZRen0u99mytWwPAXZFAudHWGL6J
 WRQS4NRDZRFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143544876"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="143544876"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2020 05:19:32 -0700
IronPort-SDR: Xs6Z//h8p2aSrhadqUtnLal95COzppSkHZFFzXFtCnqDOjsHhel8qLF7uHNrE6RRCt4MMJd4y8
 6QpOsMjYMlMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; 
   d="scan'208";a="312306790"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2020 05:19:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 62C5F525; Fri, 26 Jun 2020 15:19:28 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 09/15] media: atomisp: make platform data more readable
Date:   Fri, 26 Jun 2020 15:19:19 +0300
Message-Id: <20200626121925.14365-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add few blank lines to make platform data more readable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 79cbde65d3c1..fb61274af7e5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -294,6 +294,7 @@ static struct gmin_cfg_var mrd7_vars[] = {
 	{"INT33F8:00_CsiFmt", "13"},
 	{"INT33F8:00_CsiBayer", "0"},
 	{"INT33F8:00_CamClk", "0"},
+
 	{"INT33F9:00_CamType", "1"},
 	{"INT33F9:00_CsiPort", "0"},
 	{"INT33F9:00_CsiLanes", "1"},
@@ -309,6 +310,7 @@ static struct gmin_cfg_var ecs7_vars[] = {
 	{"INT33BE:00_CsiFmt", "13"},
 	{"INT33BE:00_CsiBayer", "2"},
 	{"INT33BE:00_CamClk", "0"},
+
 	{"INT33F0:00_CsiPort", "0"},
 	{"INT33F0:00_CsiLanes", "1"},
 	{"INT33F0:00_CsiFmt", "13"},
@@ -322,6 +324,7 @@ static struct gmin_cfg_var i8880_vars[] = {
 	{"XXOV2680:00_CsiPort", "1"},
 	{"XXOV2680:00_CsiLanes", "1"},
 	{"XXOV2680:00_CamClk", "0"},
+
 	{"XXGC0310:00_CsiPort", "0"},
 	{"XXGC0310:00_CsiLanes", "1"},
 	{"XXGC0310:00_CamClk", "1"},
-- 
2.27.0

