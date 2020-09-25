Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A0327907B
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbgIYSca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729905AbgIYSca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:32:30 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC85C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:29 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id n14so4000376pff.6
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BXQP6uHt4StLX/k/HZyh3atYMbSEyf7qjx9JBn5RQbE=;
        b=PX3UKzsTTe++7cErJvEieUrSiBLIEqVzFmFSuh5D4U25GYNWW+40+vTK42gC9SA1OI
         ZWD1FIp18JertgZE2cEF3joflHv50pjtVm/jrp0x84IdTm+DGcehUXudXqychk0jUr7E
         3SnUqQvLm5ZvvBsJNFm8/Fn+bCSULFsFdpCh6NYelHCxNICWzp5YBiQ5GMvo3aBCt9A9
         WlP9M1axwRixBAGRYuSTmciYxj+Mf0TEOqJ1AJoUkV9F1lHy4MPp2HFlb9/AWETxltm7
         T3+keDmteiIR2xquQB8sVwSLFJKDd4X9CKkI+GdpfTyuZ1PuL8viH0DD9OxehDnY9/h9
         /GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BXQP6uHt4StLX/k/HZyh3atYMbSEyf7qjx9JBn5RQbE=;
        b=Ne5QP3GSs1UR4VrzCNp+QPQ3AWKNb1HxeRWFjIsaC+siJucRcOeu6vCAVABvUHjY5/
         jfv+NhYd3gM6omfDQmw0zS7GzlRYYmga614dlrbo4NNyuGiOkOAi/Jc/hDzF1WiRhbGG
         QidO77g+7T4SMIl8y2cVbaUobg+6frkbX25qxy6h0KG+S8NGcEzWp6dcYD2wIo7Tv8qC
         OCpscKW+F/FDLBXtfiRwME2xffJi+IBbk9vbSiY1uDBwyT5c7B7REMMe9onqiiMJR+jg
         /5ypkWM3+MgbaruTCK2HH89wqw9AOJtwcplkX6MYCnDwnDMf7s2W9J2k5npGsg3HN6L7
         FSGw==
X-Gm-Message-State: AOAM533/dTidJIwYEzHOtZLnQctbA7raphC5q6OvUil9txj7lztZ5fzS
        GcPCkmXHZ3fkbFEGD0JPG3El1A==
X-Google-Smtp-Source: ABdhPJzUnDeJCsD0GH9J7BWVM9oyLpFe2ym7eh0TulvnyRN4nR44P2sbUcPZAwN80vIAHWhWWWYLqQ==
X-Received: by 2002:a17:902:c404:b029:d2:564a:e41d with SMTP id k4-20020a170902c404b02900d2564ae41dmr691864plk.23.1601058749039;
        Fri, 25 Sep 2020 11:32:29 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.32.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:32:28 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 12/47] staging: media: zoran: remove proc_fs
Date:   Fri, 25 Sep 2020 18:30:22 +0000
Message-Id: <1601058657-14042-13-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The zoran driver give some debug information in procfs, but this is not
the right place.
So let's remove them, we will use debugfs later.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Makefile       |   2 +-
 drivers/staging/media/zoran/zoran.h        |   5 -
 drivers/staging/media/zoran/zoran_card.c   |   6 -
 drivers/staging/media/zoran/zoran_device.c |   1 -
 drivers/staging/media/zoran/zoran_driver.c |   1 -
 drivers/staging/media/zoran/zoran_procfs.c | 213 ---------------------
 drivers/staging/media/zoran/zoran_procfs.h |  32 ----
 7 files changed, 1 insertion(+), 259 deletions(-)
 delete mode 100644 drivers/staging/media/zoran/zoran_procfs.c
 delete mode 100644 drivers/staging/media/zoran/zoran_procfs.h

diff --git a/drivers/staging/media/zoran/Makefile b/drivers/staging/media/zoran/Makefile
index 21ac29a71458..7023158e3892 100644
--- a/drivers/staging/media/zoran/Makefile
+++ b/drivers/staging/media/zoran/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-zr36067-objs	:=	zoran_procfs.o zoran_device.o \
+zr36067-objs	:=	zoran_device.o \
 			zoran_driver.o zoran_card.o
 
 obj-$(CONFIG_VIDEO_ZORAN) += zr36067.o videocodec.o
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index eac8e49a080f..1b3eceaead5a 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -346,11 +346,6 @@ struct zoran {
 	struct zoran_buffer_col jpg_buffers;	/* MJPEG buffers' info */
 
 	/* Additional stuff for testing */
-#ifdef CONFIG_PROC_FS
-	struct proc_dir_entry *zoran_proc;
-#else
-	void *zoran_proc;
-#endif
 	int testing;
 	int jpeg_error;
 	int intr_counter_GIRQ1;
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index e9c0dc1c0313..93a0817a3936 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -18,7 +18,6 @@
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
 
-#include <linux/proc_fs.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/videodev2.h>
@@ -38,7 +37,6 @@
 #include "zoran.h"
 #include "zoran_card.h"
 #include "zoran_device.h"
-#include "zoran_procfs.h"
 
 extern const struct zoran_format zoran_formats[];
 
@@ -978,7 +976,6 @@ static int zr36057_init(struct zoran *zr)
 		encoder_call(zr, video, s_routing, 2, 0, 0);
 	}
 
-	zr->zoran_proc = NULL;
 	zr->initialized = 1;
 	return 0;
 
@@ -1019,7 +1016,6 @@ static void zoran_remove(struct pci_dev *pdev)
 	free_irq(zr->pci_dev->irq, zr);
 	/* unmap and free memory */
 	kfree(zr->stat_com);
-	zoran_proc_cleanup(zr);
 	iounmap(zr->zr36057_mem);
 	pci_disable_device(zr->pci_dev);
 	video_unregister_device(zr->video_dev);
@@ -1280,8 +1276,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (zr36057_init(zr) < 0)
 		goto zr_detach_vfe;
 
-	zoran_proc_init(zr);
-
 	return 0;
 
 zr_detach_vfe:
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index e50153218f72..04ba22a915f0 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -17,7 +17,6 @@
 #include <linux/sched/signal.h>
 
 #include <linux/interrupt.h>
-#include <linux/proc_fs.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/videodev2.h>
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 21a258b7be13..0d6c58a4161e 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -53,7 +53,6 @@
 #include <asm/byteorder.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
-#include <linux/proc_fs.h>
 
 #include <linux/mutex.h>
 #include "zoran.h"
diff --git a/drivers/staging/media/zoran/zoran_procfs.c b/drivers/staging/media/zoran/zoran_procfs.c
deleted file mode 100644
index 98f9e0103d83..000000000000
--- a/drivers/staging/media/zoran/zoran_procfs.c
+++ /dev/null
@@ -1,213 +0,0 @@
-/*
- * Zoran zr36057/zr36067 PCI controller driver, for the
- * Pinnacle/Miro DC10/DC10+/DC30/DC30+, Iomega Buz, Linux
- * Media Labs LML33/LML33R10.
- *
- * This part handles the procFS entries (/proc/ZORAN[%d])
- *
- * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
- *
- * Currently maintained by:
- *   Ronald Bultje    <rbultje@ronald.bitfreak.net>
- *   Laurent Pinchart <laurent.pinchart@skynet.be>
- *   Mailinglist      <mjpeg-users@lists.sf.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/printk.h>
-#include <linux/vmalloc.h>
-
-#include <linux/proc_fs.h>
-#include <linux/pci.h>
-#include <linux/i2c.h>
-#include <linux/i2c-algo-bit.h>
-#include <linux/videodev2.h>
-#include <linux/spinlock.h>
-#include <linux/sem.h>
-#include <linux/seq_file.h>
-
-#include <linux/ctype.h>
-#include <linux/poll.h>
-#include <asm/io.h>
-
-#include "videocodec.h"
-#include "zoran.h"
-#include "zoran_procfs.h"
-#include "zoran_card.h"
-
-#ifdef CONFIG_PROC_FS
-struct procfs_params_zr36067 {
-	char *name;
-	short reg;
-	u32 mask;
-	short bit;
-};
-
-static const struct procfs_params_zr36067 zr67[] = {
-	{"HSPol", 0x000, 1, 30},
-	{"HStart", 0x000, 0x3ff, 10},
-	{"HEnd", 0x000, 0x3ff, 0},
-
-	{"VSPol", 0x004, 1, 30},
-	{"VStart", 0x004, 0x3ff, 10},
-	{"VEnd", 0x004, 0x3ff, 0},
-
-	{"ExtFl", 0x008, 1, 26},
-	{"TopField", 0x008, 1, 25},
-	{"VCLKPol", 0x008, 1, 24},
-	{"DupFld", 0x008, 1, 20},
-	{"LittleEndian", 0x008, 1, 0},
-
-	{"HsyncStart", 0x10c, 0xffff, 16},
-	{"LineTot", 0x10c, 0xffff, 0},
-
-	{"NAX", 0x110, 0xffff, 16},
-	{"PAX", 0x110, 0xffff, 0},
-
-	{"NAY", 0x114, 0xffff, 16},
-	{"PAY", 0x114, 0xffff, 0},
-
-	/* {"",,,}, */
-
-	{NULL, 0, 0, 0},
-};
-
-static void setparam(struct zoran *zr, char *name, char *sval)
-{
-	int i = 0, reg0, reg, val;
-
-	while (zr67[i].name) {
-		if (!strncmp(name, zr67[i].name, strlen(zr67[i].name))) {
-			reg = reg0 = btread(zr67[i].reg);
-			reg &= ~(zr67[i].mask << zr67[i].bit);
-			if (!isdigit(sval[0]))
-				break;
-			val = simple_strtoul(sval, NULL, 0);
-			if ((val & ~zr67[i].mask))
-				break;
-			reg |= (val & zr67[i].mask) << zr67[i].bit;
-			dprintk(4,
-				KERN_INFO
-				"%s: setparam: setting ZR36067 register 0x%03x: 0x%08x=>0x%08x %s=%d\n",
-				ZR_DEVNAME(zr), zr67[i].reg, reg0, reg,
-				zr67[i].name, val);
-			btwrite(reg, zr67[i].reg);
-			break;
-		}
-		i++;
-	}
-}
-
-static int zoran_show(struct seq_file *p, void *v)
-{
-	struct zoran *zr = p->private;
-	int i;
-
-	seq_printf(p, "ZR36067 registers:\n");
-	for (i = 0; i < 0x130; i += 16)
-		seq_printf(p, "%03X %08X  %08X  %08X  %08X\n", i,
-			   btread(i), btread(i + 4), btread(i + 8), btread(i + 12));
-	return 0;
-}
-
-static int zoran_open(struct inode *inode, struct file *file)
-{
-	struct zoran *data = PDE_DATA(inode);
-
-	return single_open(file, zoran_show, data);
-}
-
-static ssize_t zoran_write(struct file *file, const char __user *buffer,
-			   size_t count, loff_t *ppos)
-{
-	struct zoran *zr = PDE_DATA(file_inode(file));
-	char *string, *sp;
-	char *line, *ldelim, *varname, *svar, *tdelim;
-
-	if (count > 32768)	/* Stupidity filter */
-		return -EINVAL;
-
-	string = sp = vmalloc(count + 1);
-	if (!string) {
-		return -ENOMEM;
-	}
-	if (copy_from_user(string, buffer, count)) {
-		vfree(string);
-		return -EFAULT;
-	}
-	string[count] = 0;
-	dprintk(4, KERN_INFO "%s: write_proc: name=%pD count=%zu zr=%p\n",
-		ZR_DEVNAME(zr), file, count, zr);
-	ldelim = " \t\n";
-	tdelim = "=";
-	line = strpbrk(sp, ldelim);
-	while (line) {
-		*line = 0;
-		svar = strpbrk(sp, tdelim);
-		if (svar) {
-			*svar = 0;
-			varname = sp;
-			svar++;
-			setparam(zr, varname, svar);
-		}
-		sp = line + 1;
-		line = strpbrk(sp, ldelim);
-	}
-	vfree(string);
-
-	return count;
-}
-
-static const struct file_operations zoran_operations = {
-	.owner		= THIS_MODULE,
-	.open		= zoran_open,
-	.read		= seq_read,
-	.write		= zoran_write,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-#endif
-
-int zoran_proc_init(struct zoran *zr)
-{
-#ifdef CONFIG_PROC_FS
-	char name[8];
-
-	snprintf(name, 7, "zoran%d", zr->id);
-	zr->zoran_proc = proc_create_data(name, 0, NULL, &zoran_operations, zr);
-	if (zr->zoran_proc) {
-		dprintk(2,
-			KERN_INFO
-			"%s: procfs entry /proc/%s allocated. data=%p\n",
-			ZR_DEVNAME(zr), name, zr);
-	} else {
-		pr_err("%s: Unable to initialise /proc/%s\n", ZR_DEVNAME(zr), name);
-		return 1;
-	}
-#endif
-	return 0;
-}
-
-void zoran_proc_cleanup(struct zoran *zr)
-{
-#ifdef CONFIG_PROC_FS
-	char name[8];
-
-	snprintf(name, 7, "zoran%d", zr->id);
-	if (zr->zoran_proc)
-		remove_proc_entry(name, NULL);
-	zr->zoran_proc = NULL;
-#endif
-}
diff --git a/drivers/staging/media/zoran/zoran_procfs.h b/drivers/staging/media/zoran/zoran_procfs.h
deleted file mode 100644
index 0ac7cb0011f2..000000000000
--- a/drivers/staging/media/zoran/zoran_procfs.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/*
- * Zoran zr36057/zr36067 PCI controller driver, for the
- * Pinnacle/Miro DC10/DC10+/DC30/DC30+, Iomega Buz, Linux
- * Media Labs LML33/LML33R10.
- *
- * This part handles card-specific data and detection
- *
- * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
- *
- * Currently maintained by:
- *   Ronald Bultje    <rbultje@ronald.bitfreak.net>
- *   Laurent Pinchart <laurent.pinchart@skynet.be>
- *   Mailinglist      <mjpeg-users@lists.sf.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __ZORAN_PROCFS_H__
-#define __ZORAN_PROCFS_H__
-
-extern int zoran_proc_init(struct zoran *zr);
-extern void zoran_proc_cleanup(struct zoran *zr);
-
-#endif				/* __ZORAN_PROCFS_H__ */
-- 
2.26.2

