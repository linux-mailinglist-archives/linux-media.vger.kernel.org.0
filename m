Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48D7771776
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 13:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387715AbfGWLuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 07:50:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35110 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387711AbfGWLuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 07:50:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so19044124pfn.2;
        Tue, 23 Jul 2019 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUQa7K6zscCV3fr5I8Gtd2v9SYWgICuDAxYQisb0dZw=;
        b=jj93UquXb5PC9RCWOpnZQ/vTnyfgNEfJYu7JO9l/0Re5ge5QDe5ObpOQy36pX3xsTx
         Ubc2pBGepvs1fGVuqGvRNkXZoUKKjPfXnuR8ihuSEsOI4nKO+6GRfgIzzsZz4Wj9h/OA
         TldCtGryyIkUvBkFtx5wg3TMZgUVKtmX7VKZHHOqW9BIFbGDcMeJL2umzopaE3wcbts7
         kbNLsJ1ue79+TmwBQy9Xs9U1s7MnnZkyZ2j1sZcwWkjeoFDeSTU/B1qX/fIOq1IODsvR
         5hzflMXNvThvRLjnM5vFHWlrW4Y6KoIqQlQ8TKoVTGKdHqxScqfNJ5hsqOmmvUkufVDE
         iGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUQa7K6zscCV3fr5I8Gtd2v9SYWgICuDAxYQisb0dZw=;
        b=VreNtxHabzk4DMt09XTveMzUvJ8lmiBv71eV0zmyuafKWDvCdUEYQMv41zyMgtqCcK
         MuqIafcj8nsE2/tx8ezqNpJhHSGUQCQigrrRA66NfZT0sDUTRzSr3KhucIxE3v62nycy
         /iejK4t/TCSUe1gFberASFwOKbi9Cm8zyz0FyP3NgTBU++z3YitgcsaTdrLvRM2in+Yy
         eabeN2MlMu/S9vTK8tN7HNwBV87n3FkBssx4feJXznzQC5KDiPKPqo7KqjdnkppB2xks
         27HBbQf7ixru21UUmSNbtNFrMS8E+HJOzzw2iPuY0uxuSC1z5ajeD3j9ApSKXNHh3l4e
         Ydnw==
X-Gm-Message-State: APjAAAXi54oPrmkfin9t2f9dh6673lky9ABrq7R6yw61aGWJpXLqYHFx
        L6GP1QQmiBSdnDyjiQKlBLw=
X-Google-Smtp-Source: APXvYqzFozLyb5L5JjaqcJ4btOrVdBr7IfvYM65VEM7EB8e9SiaXohXKc1JUUgF27e3D0W/J8CqbIg==
X-Received: by 2002:a63:101b:: with SMTP id f27mr73351394pgl.291.1563882620325;
        Tue, 23 Jul 2019 04:50:20 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id r75sm58941857pfc.18.2019.07.23.04.50.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 04:50:19 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Akihiro Tsukada <tskd08@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: pci: Use dev_get_drvdata where possible
Date:   Tue, 23 Jul 2019 19:50:14 +0800
Message-Id: <20190723115014.18537-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of using to_pci_dev + pci_get_drvdata,
use dev_get_drvdata to make code simpler.

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
 
 static int __maybe_unused cio2_resume(struct device *dev)
 {
-	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
+	struct cio2_device *cio2 = dev_get_drvdata(dev);
 	int r = 0;
 	struct cio2_queue *q = cio2->cur_queue;
 
diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
index e51c80bc4646..72b191cfeb54 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -1217,8 +1217,7 @@ static void pt1_i2c_init(struct pt1 *pt1)
 
 static int pt1_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt1 *pt1 = pci_get_drvdata(pdev);
+	struct pt1 *pt1 = dev_get_drvdata(dev);
 
 	pt1_init_streams(pt1);
 	pt1_disable_ram(pt1);
@@ -1230,8 +1229,7 @@ static int pt1_suspend(struct device *dev)
 
 static int pt1_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt1 *pt1 = pci_get_drvdata(pdev);
+	struct pt1 *pt1 = dev_get_drvdata(dev);
 	int ret;
 	int i;
 
diff --git a/drivers/media/pci/pt3/pt3.c b/drivers/media/pci/pt3/pt3.c
index 7a7afae4c84c..c0bc86793355 100644
--- a/drivers/media/pci/pt3/pt3.c
+++ b/drivers/media/pci/pt3/pt3.c
@@ -626,8 +626,7 @@ static void pt3_cleanup_adapter(struct pt3_board *pt3, int index)
 
 static int pt3_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt3_board *pt3 = pci_get_drvdata(pdev);
+	struct pt3_board *pt3 = dev_get_drvdata(dev);
 	int i;
 	struct pt3_adapter *adap;
 
@@ -646,8 +645,7 @@ static int pt3_suspend(struct device *dev)
 
 static int pt3_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct pt3_board *pt3 = pci_get_drvdata(pdev);
+	struct pt3_board *pt3 = dev_get_drvdata(dev);
 	int i, ret;
 	struct pt3_adapter *adap;
 
-- 
2.20.1

