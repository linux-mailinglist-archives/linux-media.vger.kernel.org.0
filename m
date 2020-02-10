Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5DF156F23
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 07:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbgBJGDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 01:03:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:36456 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbgBJGDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 01:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=5C1Pl5mrdwkmC0Ibs5rVWyWq5pet5BdrcnU/u0rt7EY=; b=A/TznRQXNYBxeegModDRxPmZwR
        QV0mWYWmotsCWAt8meRxLlJmp58JE2I41Mlbzdv7CvMLsNkFR4bA+AJ2creD0EVk5E9aDcKAO5wX0
        KKK7O90S0fOHHLCkbd0cWfsvQfrHSWLJn3Fj7M6GYcU08+fLZuT5+ZrL5EZWNuF3ckfaBkVgYxvMB
        WGCtLYbGsNAOhWLT/JAqdu44xv6HQuGwDw+e5Eb8iiFSpxBkc/OWjwT9hyYoz9dYmhKXkGAD5llAi
        nxUpAyEsFg30W0TER7lk0Xq83OTlYE67V1zhaMGia341DM2CMVcz7LyHTj+y06M/cLuEStrG2dydL
        c6HvShnw==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j12A3-0006Td-GC; Mon, 10 Feb 2020 06:03:11 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j12A1-00C2Un-Qx; Mon, 10 Feb 2020 07:03:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-um@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 03/28] docs: virt: user_mode_linux.rst: update compiling instructions
Date:   Mon, 10 Feb 2020 07:02:41 +0100
Message-Id: <b678c16fb34280d844c278b8acfb2f53124f50ab.1581314316.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581314316.git.mchehab+huawei@kernel.org>
References: <cover.1581314316.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of pointing for a pre-2.4 and a seaparate patch,
update it to match current upstream, as UML was merged
a long time ago.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/uml/user_mode_linux.rst | 62 ++++------------------
 1 file changed, 9 insertions(+), 53 deletions(-)

diff --git a/Documentation/virt/uml/user_mode_linux.rst b/Documentation/virt/uml/user_mode_linux.rst
index 6085d2c0f8a8..e0632d80753e 100644
--- a/Documentation/virt/uml/user_mode_linux.rst
+++ b/Documentation/virt/uml/user_mode_linux.rst
@@ -5,7 +5,7 @@ User Mode Linux HOWTO
 =====================
 
 :Author:  User Mode Linux Core Team
-:Last-updated: Mon Nov 18 14:16:16 EST 2002
+:Last-updated: Sat Jan 25 16:07:55 CET 2020
 
 This document describes the use and abuse of Jeff Dike's User Mode
 Linux: a port of the Linux kernel as a normal Intel Linux process.
@@ -223,23 +223,15 @@ Linux: a port of the Linux kernel as a normal Intel Linux process.
 
 
   Compiling the user mode kernel is just like compiling any other
-  kernel.  Let's go through the steps, using 2.4.0-prerelease (current
-  as of this writing) as an example:
+  kernel.
 
 
-  1. Download the latest UML patch from
-     the download page <http://user-mode-linux.sourceforge.net/
-
-     In this example, the file is uml-patch-2.4.0-prerelease.bz2.
-
-
-  2. Download the matching kernel from your favourite kernel mirror,
+  1. Download the latest kernel from your favourite kernel mirror,
      such as:
 
-     ftp://ftp.ca.kernel.org/pub/kernel/v2.4/linux-2.4.0-prerelease.tar.bz2
+     https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.4.14.tar.xz
 
-
-  3. Make a directory and unpack the kernel into it::
+  2. Make a directory and unpack the kernel into it::
 
        host%
        mkdir ~/uml
@@ -248,21 +240,10 @@ Linux: a port of the Linux kernel as a normal Intel Linux process.
        cd ~/uml
 
        host%
-       tar -xzvf linux-2.4.0-prerelease.tar.bz2
+       tar xvf linux-5.4.14.tar.xz
 
 
-
-  4. Apply the patch using::
-
-       host%
-       cd ~/uml/linux
-
-       host%
-       bzcat uml-patch-2.4.0-prerelease.bz2 | patch -p1
-
-
-
-  5. Run your favorite config; ``make xconfig ARCH=um`` is the most
+  3. Run your favorite config; ``make xconfig ARCH=um`` is the most
      convenient.  ``make config ARCH=um`` and ``make menuconfig ARCH=um``
      will work as well.  The defaults will give you a useful kernel.  If
      you want to change something, go ahead, it probably won't hurt
@@ -276,34 +257,9 @@ Linux: a port of the Linux kernel as a normal Intel Linux process.
 
 
 
-  6. Finish with ``make linux ARCH=um``: the result is a file called
+  4. Finish with ``make linux ARCH=um``: the result is a file called
      ``linux`` in the top directory of your source tree.
 
-  Make sure that you don't build this kernel in /usr/src/linux.  On some
-  distributions, /usr/include/asm is a link into this pool.  The user-
-  mode build changes the other end of that link, and things that include
-  <asm/anything.h> stop compiling.
-
-  The sources are also available from cvs at the project's cvs page,
-  which has directions on getting the sources. You can also browse the
-  CVS pool from there.
-
-  If you get the CVS sources, you will have to check them out into an
-  empty directory. You will then have to copy each file into the
-  corresponding directory in the appropriate kernel pool.
-
-  If you don't have the latest kernel pool, you can get the
-  corresponding user-mode sources with::
-
-
-       host% cvs co -r v_2_3_x linux
-
-
-
-
-  where 'x' is the version in your pool. Note that you will not get the
-  bug fixes and enhancements that have gone into subsequent releases.
-
 
 2.2.  Compiling and installing kernel modules
 ---------------------------------------------
@@ -416,7 +372,7 @@ Linux: a port of the Linux kernel as a normal Intel Linux process.
 3.1.  Running UML
 -----------------
 
-  It runs on 2.2.15 or later, and all 2.4 kernels.
+  It runs on 2.2.15 or later, and all kernel versions since 2.4.
 
 
   Booting UML is straightforward.  Simply run 'linux': it will try to
-- 
2.24.1

