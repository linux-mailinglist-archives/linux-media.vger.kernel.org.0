Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF9D1A7696
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437142AbgDNIvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:52018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437091AbgDNIvJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:09 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A89D82082E;
        Tue, 14 Apr 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854268;
        bh=IPLJW6ranQTtcCr1fkEonj5u1tO/z4jUl8bRD/UFTfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S1Z91AFbSqV9oDqsNA2u5g6KdhTMgabmf9yOW9ooNqfgF96bpSW3e1y7C723aZwJb
         h+kJE2hAwhHdsNfC1LAwOLhLd6CwHMPqUgiWT3uLRH7MZOYtDyPfjbd6+ouKZJnM2l
         YFSIHiY8sIhb3x/5wDA1qxGBxLrqby6rtSJK4o14=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHe-002wz1-VK; Tue, 14 Apr 2020 10:51:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 04/19] media: docs: intro.rst actually contain DVB references
Date:   Tue, 14 Apr 2020 10:50:50 +0200
Message-Id: <35f90d6f161d0cd48a347a56f05056b2d61ff648.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This document doesn't describe the DVB subsystem. Instead, it
just contain references to some places.

Better name it and improve its contents.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../admin-guide/media/dvb_references.rst      | 29 +++++++++++++++++++
 Documentation/admin-guide/media/index.rst     |  8 ++---
 Documentation/admin-guide/media/intro.rst     | 23 ---------------
 3 files changed, 32 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/admin-guide/media/dvb_references.rst
 delete mode 100644 Documentation/admin-guide/media/intro.rst

diff --git a/Documentation/admin-guide/media/dvb_references.rst b/Documentation/admin-guide/media/dvb_references.rst
new file mode 100644
index 000000000000..48445ac76275
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb_references.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+References
+==========
+
+The main development site and GIT repository for Digital TV
+drivers is https://linuxtv.org.
+
+The DVB mailing list linux-dvb is hosted at vger. Please see
+http://vger.kernel.org/vger-lists.html#linux-media for details.
+
+There are also some other old lists hosted at:
+https://linuxtv.org/lists.php. If you're insterested on that for historic
+reasons, please check the archive at https://linuxtv.org/pipermail/linux-dvb/.
+
+The media subsystem Wiki is hosted at https://linuxtv.org/wiki/.
+There, you'll find lots of information, from both development and usage
+of media boards. Please check it before asking newbie questions on the
+mailing list or IRC channels.
+
+The API documentation is documented at the Kernel tree. You can find it
+in both html and pdf formats, together with other useful documentation at:
+
+  - https://linuxtv.org/docs.php.
+
+You may also find useful material at https://linuxtv.org/downloads/.
+
+In order to get the needed firmware for some drivers to work, there's
+a script at the kernel tree, at scripts/get_dvb_firmware.
diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index 7e8d43502167..11d01d681b57 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -72,14 +72,12 @@ Linux Digital TV driver-specific documentation
 	:maxdepth: 5
 	:numbered:
 
-	intro
-
-	cards
+	dvb_intro
 	ci
 	faq
+	dvb_references
 
-	dvb_intro
-
+	cards
 	avermedia
 	bt8xx
 	lmedm04
diff --git a/Documentation/admin-guide/media/intro.rst b/Documentation/admin-guide/media/intro.rst
deleted file mode 100644
index 4e361bcc3ad4..000000000000
--- a/Documentation/admin-guide/media/intro.rst
+++ /dev/null
@@ -1,23 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Introduction
-============
-
-The main development site and GIT repository for these
-drivers is https://linuxtv.org.
-
-The DVB mailing list linux-dvb is hosted at vger. Please see
-http://vger.kernel.org/vger-lists.html#linux-media for details.
-
-There are also some other old lists hosted at https://linuxtv.org/lists.php. Please check the archive https://linuxtv.org/pipermail/linux-dvb/.
-
-The media subsystem Wiki is hosted at https://linuxtv.org/wiki/.
-Please check it before asking newbie questions on the list.
-
-API documentation is documented at the Kernel. You'll also find useful
-documentation at: https://linuxtv.org/docs.php.
-
-You may also find useful material at https://linuxtv.org/downloads/.
-
-In order to get firmware from proprietary drivers, there's a script at
-the kernel tree, at scripts/get_dvb_firmware.
-- 
2.25.2

