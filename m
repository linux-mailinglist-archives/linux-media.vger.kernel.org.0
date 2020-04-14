Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A394F1A768D
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437132AbgDNIvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:52240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437050AbgDNIvN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:13 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22BD421582;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=o2G3asvWsLABYQWZAtTrFIi+u6SVnR8zFgKNqXemdRk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pfYQyZt9+qkxhV+Om/10PqNVu6gmfN+aDIooOwvi6bA+wW8J5r5HHOgITLBPVmIlt
         vkT56cb/0MN48OXwnL8zkOQ4YkxRvacC8W5naJxikV9myPYWUZI8yeWmYWBBzrNvM+
         Awxk0Dl/BzIiSlbn0ZiBuAJy9nt38HvtSKxVUAh0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002wzk-D8; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 13/19] media: docs: get rid of obsoleted udev documentation
Date:   Tue, 14 Apr 2020 10:50:59 +0200
Message-Id: <c73f1a6e87bd9b6e7c7df839a367cf81715be547.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file is very old, and doesn't match the current udev
behavior.

I wanted to preserve it, because we'll need some udev
description some day about how to keep names unique,
but there's nothing here to help with that...

So, be it: let's just discard this document, as it doesn't
provide anything useful anymore.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/bt8xx.rst |  2 -
 Documentation/admin-guide/media/index.rst |  1 -
 Documentation/admin-guide/media/udev.rst  | 63 -----------------------
 3 files changed, 66 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/udev.rst

diff --git a/Documentation/admin-guide/media/bt8xx.rst b/Documentation/admin-guide/media/bt8xx.rst
index 707919f29c86..a55f4f5af042 100644
--- a/Documentation/admin-guide/media/bt8xx.rst
+++ b/Documentation/admin-guide/media/bt8xx.rst
@@ -74,8 +74,6 @@ Exceptions are:
 - Old TwinHan DST cards or clones with or without CA slot and not
   containing an Eeprom.
 
-People running udev please see :doc:`udev`.
-
 In the following cases overriding the PCI type detection for bttv and
 for dvb-bt8xx drivers by passing modprobe parameters may be necessary.
 
diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index 11d01d681b57..04bc259f3325 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -84,7 +84,6 @@ Linux Digital TV driver-specific documentation
 	opera-firmware
 	technisat
 	ttusb-dec
-	udev
 	zr364xx
 
 #################################
diff --git a/Documentation/admin-guide/media/udev.rst b/Documentation/admin-guide/media/udev.rst
deleted file mode 100644
index ca6c9c226902..000000000000
--- a/Documentation/admin-guide/media/udev.rst
+++ /dev/null
@@ -1,63 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-UDEV rules for DVB
-==================
-
-.. note::
-
-   #) This documentation is outdated. Udev on modern distributions auto-detect
-      the DVB devices.
-
-   #) **TODO:** change this document to explain how to make DVB devices
-      persistent, as, when a machine has multiple devices, they may be detected
-      on different orders, which could cause apps that relies on the device
-      numbers to fail.
-
-The DVB subsystem currently registers to the sysfs subsystem using the
-"class_simple" interface.
-
-This means that only the basic information like module loading parameters
-are presented through sysfs. Other things that might be interesting are
-currently **not** available.
-
-Nevertheless it's now possible to add proper udev rules so that the
-DVB device nodes are created automatically.
-
-We assume that you have udev already up and running and that have been
-creating the DVB device nodes manually up to now due to the missing sysfs
-support.
-
-0. Don't forget to disable your current method of creating the
-device nodes manually.
-
-1. Unfortunately, you'll need a helper script to transform the kernel
-sysfs device name into the well known dvb adapter / device naming scheme.
-The script should be called "dvb.sh" and should be placed into a script
-dir where udev can execute it, most likely /etc/udev/scripts/
-
-So, create a new file /etc/udev/scripts/dvb.sh and add the following:
-
-.. code-block:: none
-
-	#!/bin/sh
-	/bin/echo $1 | /bin/sed -e 's,dvb\([0-9]\)\.\([^0-9]*\)\([0-9]\),dvb/adapter\1/\2\3,'
-
-Don't forget to make the script executable with "chmod".
-
-1. You need to create a proper udev rule that will create the device nodes
-like you know them. All real distributions out there scan the /etc/udev/rules.d
-directory for rule files. The main udev configuration file /etc/udev/udev.conf
-will tell you the directory where the rules are, most likely it's /etc/udev/rules.d/
-
-Create a new rule file in that directory called "dvb.rule" and add the following line:
-
-.. code-block:: none
-
-	KERNEL="dvb*", PROGRAM="/etc/udev/scripts/dvb.sh %k", NAME="%c"
-
-If you want more control over the device nodes (for example a special group membership)
-have a look at "man udev".
-
-For every device that registers to the sysfs subsystem with a "dvb" prefix,
-the helper script /etc/udev/scripts/dvb.sh is invoked, which will then
-create the proper device node in your /dev/ directory.
-- 
2.25.2

