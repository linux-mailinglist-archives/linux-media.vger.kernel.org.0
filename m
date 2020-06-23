Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28DBF205A1E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 20:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733191AbgFWSFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 14:05:40 -0400
Received: from mga07.intel.com ([134.134.136.100]:44038 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733184AbgFWSFj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 14:05:39 -0400
IronPort-SDR: 2kpiErhWNRCHZdDTx/+13PwZPQ287QRTSnlyLfI30TD455lW2AmRGajBHAXNKNJjYkAD0ucro/
 LOEdOt5gP4RQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="209358583"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="209358583"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 11:05:38 -0700
IronPort-SDR: CniwEDzw6twIYevc0KPyOXnieTd3qsO//BxXjzRzEZ405Ol6qAim53q7MhKmcvRWjtYRG1SwDo
 dkJd1D8IgXmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; 
   d="scan'208";a="264850768"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jun 2020 11:05:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4EA5A23F; Tue, 23 Jun 2020 21:05:34 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 9/9] media: atomisp: make platform data more readable
Date:   Tue, 23 Jun 2020 21:05:33 +0300
Message-Id: <20200623180533.65970-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
References: <20200623180533.65970-1-andriy.shevchenko@linux.intel.com>
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

