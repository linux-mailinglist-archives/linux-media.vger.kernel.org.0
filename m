Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A5DBEDC2
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 10:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfIZIsf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 04:48:35 -0400
Received: from gofer.mess.org ([88.97.38.141]:53739 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727259AbfIZIsf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 04:48:35 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 15080C6363; Thu, 26 Sep 2019 09:48:34 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Richard Fontana <rfontana@redhat.com>
Subject: [PATCH v2 2/2] media: delete unused proc_fs.h include
Date:   Thu, 26 Sep 2019 09:48:33 +0100
Message-Id: <20190926084833.19197-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190926084833.19197-1-sean@mess.org>
References: <20190926084833.19197-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

procfs is no longer used anywhere in media.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/dm1105/dm1105.c         | 1 -
 drivers/media/pci/smipcie/smipcie.h       | 1 -
 drivers/media/usb/cx231xx/cx231xx-audio.c | 1 -
 drivers/media/usb/em28xx/em28xx-audio.c   | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index bb3a8cc9de0c..9dce31d2b525 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -11,7 +11,6 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/proc_fs.h>
 #include <linux/pci.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
diff --git a/drivers/media/pci/smipcie/smipcie.h b/drivers/media/pci/smipcie/smipcie.h
index 65bc7e29450b..2b5e0154814c 100644
--- a/drivers/media/pci/smipcie/smipcie.h
+++ b/drivers/media/pci/smipcie/smipcie.h
@@ -14,7 +14,6 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/proc_fs.h>
 #include <linux/pci.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
diff --git a/drivers/media/usb/cx231xx/cx231xx-audio.c b/drivers/media/usb/cx231xx/cx231xx-audio.c
index 9ef362e221df..fd6e2df3d1b7 100644
--- a/drivers/media/usb/cx231xx/cx231xx-audio.c
+++ b/drivers/media/usb/cx231xx/cx231xx-audio.c
@@ -14,7 +14,6 @@
 #include <linux/soundcard.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/proc_fs.h>
 #include <linux/module.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index 49c9b70b632b..79dfbb25714b 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -31,7 +31,6 @@
 #include <linux/soundcard.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/proc_fs.h>
 #include <linux/module.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
-- 
2.21.0

