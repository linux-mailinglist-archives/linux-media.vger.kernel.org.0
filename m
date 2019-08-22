Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1AD19A033
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391555AbfHVTjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:39:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59198 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389145AbfHVTjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=T4K2EiaGiC4nPZhSIzEC3FFCY5njAchyWMaSF9OQOAM=; b=IQhiSwn9G7F85uMVOyh0zLuv4
        MhusuBKW/jPxLDaeBs2Xzz7uV0NdXFgxGAT/zNDf7hrOjRPh0ExRyMK2a7Jd4TUt59E9yDusvdY/3
        GyPKJFLF1BVUCIJRx1xvi/FA7rUkrhaGyvcHwO6g+JZ70b2VK2gGJ3UpXJ7nxWYYMJ0xxbAgFfRqO
        JoWl0HGQ40jEShV72CsbrtsndVEPmLOAx4YZRsKgXxTxZQalIoU+3dIktgwwrOVXLPvuS+SNGcZ+E
        d7mDUUnaDVU5+8Crnn0qo/BSgwbW3xtVjjIYrOj26wA0SF7iqPk2KjJfjpLZqO5rFpQ5Bw+XVlx6r
        uXSt5PvEg==;
Received: from [177.133.63.56] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i0svr-0002lU-Q4; Thu, 22 Aug 2019 19:39:40 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i0svo-0007IG-D1; Thu, 22 Aug 2019 16:39:36 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/7] media: remove include stdarg.h from some drivers
Date:   Thu, 22 Aug 2019 16:39:28 -0300
Message-Id: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It doesn't make any sense to have gcc's stdarg.h included
inside the Linux Kernel.

Get rid of those includes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/pci/cx18/cx18-mailbox.c | 2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c | 2 --
 drivers/media/pci/ttpci/av7110_hw.c   | 1 -
 drivers/media/radio/radio-trust.c     | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-mailbox.c b/drivers/media/pci/cx18/cx18-mailbox.c
index 967ae2939099..162480ec68ca 100644
--- a/drivers/media/pci/cx18/cx18-mailbox.c
+++ b/drivers/media/pci/cx18/cx18-mailbox.c
@@ -6,7 +6,7 @@
  *  Copyright (C) 2008  Andy Walls <awalls@md.metrocast.net>
  */
 
-#include <stdarg.h>
+#include <linux/bitops.h>
 
 #include "cx18-driver.h"
 #include "cx18-io.h"
diff --git a/drivers/media/pci/ivtv/ivtv-mailbox.c b/drivers/media/pci/ivtv/ivtv-mailbox.c
index 8393675c3f46..d3fdaaa903f1 100644
--- a/drivers/media/pci/ivtv/ivtv-mailbox.c
+++ b/drivers/media/pci/ivtv/ivtv-mailbox.c
@@ -10,8 +10,6 @@
 #include "ivtv-driver.h"
 #include "ivtv-mailbox.h"
 
-#include <stdarg.h>
-
 /* Firmware mailbox flags*/
 #define IVTV_MBOX_FIRMWARE_DONE 0x00000004
 #define IVTV_MBOX_DRIVER_DONE   0x00000002
diff --git a/drivers/media/pci/ttpci/av7110_hw.c b/drivers/media/pci/ttpci/av7110_hw.c
index 8c2442a11f07..e8a8ec5405e2 100644
--- a/drivers/media/pci/ttpci/av7110_hw.c
+++ b/drivers/media/pci/ttpci/av7110_hw.c
@@ -14,7 +14,6 @@
 /* for debugging ARM communication: */
 //#define COM_DEBUG
 
-#include <stdarg.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
diff --git a/drivers/media/radio/radio-trust.c b/drivers/media/radio/radio-trust.c
index 2fc009509c7c..dfb8b62f0e2b 100644
--- a/drivers/media/radio/radio-trust.c
+++ b/drivers/media/radio/radio-trust.c
@@ -16,7 +16,6 @@
  * Converted to V4L2 API by Mauro Carvalho Chehab <mchehab@kernel.org>
  */
 
-#include <stdarg.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/ioport.h>
-- 
2.21.0

