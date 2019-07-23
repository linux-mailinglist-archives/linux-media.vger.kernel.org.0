Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A18F171A95
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 16:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732973AbfGWOjV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 23 Jul 2019 10:39:21 -0400
Received: from mga03.intel.com ([134.134.136.65]:63972 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727819AbfGWOjV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 10:39:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 07:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="193087830"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2019 07:39:19 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 07:39:19 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 07:39:19 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.110]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.60]) with mapi id 14.03.0439.000;
 Tue, 23 Jul 2019 22:39:17 +0800
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     "Zhi, Yong" <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akihiro Tsukada <tskd08@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: pci: Use dev_get_drvdata where possible
Thread-Topic: [PATCH] media: pci: Use dev_get_drvdata where possible
Thread-Index: AQHVQUzZm47z7MsLaUekFEorpks1o6bYRV7A
Date:   Tue, 23 Jul 2019 14:39:17 +0000
Message-ID: <EE45BB6704246A4E914B70E8B61FB42A15C77041@SHSMSX104.ccr.corp.intel.com>
References: <20190723115014.18537-1-hslester96@gmail.com>
In-Reply-To: <20190723115014.18537-1-hslester96@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTBiZDNkYWEtN2YzNC00N2ZjLTkyZDctNmY1MjU3Yzg5MTQ3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibzRlWmVVZXByYkl0NWpwU3FOZzUrZnJjN0l4bW5uS3JOTUVXc0lqQTlEQ1BOYllhNXlsVERLWXlWXC81czlXNVEifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



________________________
BRs,  
Bingbu Cao                          


-----Original Message-----
From: Chuhong Yuan <hslester96@gmail.com> 
Sent: Tuesday, July 23, 2019 7:50 PM
Cc: Zhi, Yong <yong.zhi@intel.com>; Sakari Ailus <sakari.ailus@linux.intel.com>; Cao, Bingbu <bingbu.cao@intel.com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Akihiro Tsukada <tskd08@gmail.com>; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: pci: Use dev_get_drvdata where possible

Instead of using to_pci_dev + pci_get_drvdata, use dev_get_drvdata to make code simpler.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 3 +--
 drivers/media/pci/pt1/pt1.c              | 6 ++----
 drivers/media/pci/pt3/pt3.c              | 6 ++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index c1d133e17e4b..50a34bcd4d14 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -2000,8 +2000,7 @@ static int __maybe_unused cio2_suspend(struct device *dev)
 
 static int __maybe_unused cio2_resume(struct device *dev)  {
-	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
+	struct cio2_device *cio2 = dev_get_drvdata(dev);

Thanks for your patch.
I think using pci_get_drvdata() here mainly make a pair with the pci_set_drvdata() in probe.

 	int r = 0;
 	struct cio2_queue *q = cio2->cur_queue;
 
diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c index e51c80bc4646..72b191cfeb54 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -1217,8 +1217,7 @@ static void pt1_i2c_init(struct pt1 *pt1)
 
 static int pt1_suspend(struct device *dev)  {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt1 *pt1 = pci_get_drvdata(pdev);
+	struct pt1 *pt1 = dev_get_drvdata(dev);
 
 	pt1_init_streams(pt1);
 	pt1_disable_ram(pt1);
@@ -1230,8 +1229,7 @@ static int pt1_suspend(struct device *dev)
 
 static int pt1_resume(struct device *dev)  {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt1 *pt1 = pci_get_drvdata(pdev);
+	struct pt1 *pt1 = dev_get_drvdata(dev);
 	int ret;
 	int i;
 
diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c index 7a7afae4c84c..c0bc86793355 100644
--- a/drivers/media/pci/pt3/pt3.c
+++ b/drivers/media/pci/pt3/pt3.c
@@ -626,8 +626,7 @@ static void pt3_cleanup_adapter(struct pt3_board *pt3, int index)
 
 static int pt3_suspend(struct device *dev)  {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt3_board *pt3 = pci_get_drvdata(pdev);
+	struct pt3_board *pt3 = dev_get_drvdata(dev);
 	int i;
 	struct pt3_adapter *adap;
 
@@ -646,8 +645,7 @@ static int pt3_suspend(struct device *dev)
 
 static int pt3_resume(struct device *dev)  {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt3_board *pt3 = pci_get_drvdata(pdev);
+	struct pt3_board *pt3 = dev_get_drvdata(dev);
 	int i, ret;
 	struct pt3_adapter *adap;
 
--
2.20.1

