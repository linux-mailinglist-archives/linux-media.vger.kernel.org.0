Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E187E37F1BC
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 05:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhEMDsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 23:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhEMDsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 23:48:14 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66804C061574;
        Wed, 12 May 2021 20:47:05 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 10so20604905pfl.1;
        Wed, 12 May 2021 20:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCFKPzrYeuwaqZekX+y/t+Ka+1uMgBTfhabTovYmswE=;
        b=S1VPcIohjHX5sP19NIEdpm56pe9PXvkGl7DaTv6G2T0uAyfAvcQT5SAa9lnNA978jO
         ZTt1yWfo6m3kOYvXP69MZcGR4kAaKxbtzpsWs2ds2wua4NBX2zBrxJEXmhjtDh8A9cpm
         wFalWIggNCl1SonztJEPMp+AXsWI8KEsEUcj+iKPeKVNJ/pd6gxkm9WIyJBCPSuvOKQ7
         dLs8Fxf6vhrqz0pvgjvkMUA1qG89j8YCWtQR0C7Di8b3ZgPztHfxKpTX8Adem0bsK9cq
         u2E9YhfAEIXrSUp4KUI4/XIAcKJLm2mpMq2YXfRu4TfhYtNrUqmKjWi3TMHdVWyb5xhr
         M0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uCFKPzrYeuwaqZekX+y/t+Ka+1uMgBTfhabTovYmswE=;
        b=E9AJjxzxkLcL3bmVwI2SVaf+Mxklip5PTbhK1iev5b++y7aLjgYs7e7lBOTaLsA9DU
         1OKL8AfAphx+RnVowUkt8mNXw6seJeG2pJPRAZjVKXprpK44JCDts8yO41Wc7KH101ot
         2z67LNcBaQOxvc7JMTqQF/x+mHizGT4nMI1TyRBBesXNAb7xlxj5Bi8lZciN4ZhuNdCE
         Xue0EwCWLNy0hSBJE/eN8XazqSS9pOpZb67MBLLi6ylNuOA8lLbzLs8ft60m1uD+WlBl
         S6v6DkUOtItV48SHh1AfrDups1P3A8wBkUSNGGmKMSOmvbSZsefUaclMqrMAGqvey84r
         nWmQ==
X-Gm-Message-State: AOAM531QuWNrG2WQYWGd4eMxREEd7jFShK9QYvl49f1QN4WuJKUxnTPN
        mvtrRV3ZwJ2pHH4daP0YlwI=
X-Google-Smtp-Source: ABdhPJy+EbKIa+BZvLYWEb/qxTIUGLYURVDv4BQlMdlRdnjgQvyyOG8THHzFekc06oruonzKBg/68A==
X-Received: by 2002:a17:90a:a60d:: with SMTP id c13mr2242335pjq.172.1620877624487;
        Wed, 12 May 2021 20:47:04 -0700 (PDT)
Received: from localhost.localdomain ([118.200.63.8])
        by smtp.gmail.com with ESMTPSA id t19sm988295pfg.70.2021.05.12.20.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 20:47:04 -0700 (PDT)
From:   Nguyen Dinh Phi <phind.uet@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: atomisp: Use sysfs_emit() instead of sprintf() where appropriate
Date:   Thu, 13 May 2021 11:46:50 +0800
Message-Id: <20210513034650.252993-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

sysfs_emit() is preferred over raw sprintf() for sysfs attributes since it
knows about the sysfs buffer specifics and has some built-in sanity checks.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index f670faf978e6..dcb571f515a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -96,7 +96,7 @@ static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 static ssize_t iunit_dbglvl_show(struct device_driver *drv, char *buf)
 {
 	iunit_debug.dbglvl = dbg_level;
-	return sprintf(buf, "dtrace level:%u\n", iunit_debug.dbglvl);
+	return sysfs_emit(buf, "dtrace level:%u\n", iunit_debug.dbglvl);
 }
 
 static ssize_t iunit_dbglvl_store(struct device_driver *drv, const char *buf,
@@ -115,7 +115,7 @@ static ssize_t iunit_dbglvl_store(struct device_driver *drv, const char *buf,
 static ssize_t iunit_dbgfun_show(struct device_driver *drv, char *buf)
 {
 	iunit_debug.dbgfun = atomisp_get_css_dbgfunc();
-	return sprintf(buf, "dbgfun opt:%u\n", iunit_debug.dbgfun);
+	return sysfs_emit(buf, "dbgfun opt:%u\n", iunit_debug.dbgfun);
 }
 
 static ssize_t iunit_dbgfun_store(struct device_driver *drv, const char *buf,
@@ -139,7 +139,7 @@ static ssize_t iunit_dbgfun_store(struct device_driver *drv, const char *buf,
 
 static ssize_t iunit_dbgopt_show(struct device_driver *drv, char *buf)
 {
-	return sprintf(buf, "option:0x%x\n", iunit_debug.dbgopt);
+	return sysfs_emit(buf, "option:0x%x\n", iunit_debug.dbgopt);
 }
 
 static ssize_t iunit_dbgopt_store(struct device_driver *drv, const char *buf,
-- 
2.25.1

