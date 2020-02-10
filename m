Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C48156F1F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 07:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgBJGDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 01:03:22 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:36468 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbgBJGDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 01:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=AkWGbYs/Tc4L0PtFVpG/Hbx8MoKG1TWn2p2YU4gP5Hs=; b=T+OSy4/BQbpbvYYJVqqVzGgFc7
        EbSaxJYsEYGOUXGr4aJ7+1NR44DLaKiiXsQGvhSY1VcJYy4iXDn3vXzqIrdg62oKFtpMP35z06/SV
        xVISb1XYNBpLeZFrQW8Dhef4pvgMUr5Uhpc6u2/c50AMWouWx75hEuN75Mqo0h+wH3QmWP64MdIPl
        VAY4ot5OXzcYt+9YC1K7JH7iWl0FdktEo063k9hLTukRI3wCmXAo2GZnqjQpt2oNcPH29p8xGUEFZ
        MNeWpMJivroKyOIpCGenTRnwaRtbARnnQudb8Hz9bYhN6u0CSzow1FmfOlunqhO8baX2gnNK+ycNK
        v5Q68VbA==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j12A3-0006Te-HC; Mon, 10 Feb 2020 06:03:11 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j12A1-00C2Us-Ry; Mon, 10 Feb 2020 07:03:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-um@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 04/28] docs: virt: user_mode_linux.rst: fix URL references
Date:   Mon, 10 Feb 2020 07:02:42 +0100
Message-Id: <7703891859ba5dae121fa9fa21914512ba3d3fbb.1581314316.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581314316.git.mchehab+huawei@kernel.org>
References: <cover.1581314316.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several URLs are pointing to outdated places.

Update the references for the URLs whose contents still exists,
removing the others.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/uml/user_mode_linux.rst | 71 +++++++++-------------
 1 file changed, 29 insertions(+), 42 deletions(-)

diff --git a/Documentation/virt/uml/user_mode_linux.rst b/Documentation/virt/uml/user_mode_linux.rst
index e0632d80753e..de0f0b2c9d5b 100644
--- a/Documentation/virt/uml/user_mode_linux.rst
+++ b/Documentation/virt/uml/user_mode_linux.rst
@@ -321,7 +321,7 @@ Linux: a port of the Linux kernel as a normal Intel Linux process.
   as modules, especially filesystems and network protocols and filters,
   so most symbols which need to be exported probably already are.
   However, if you do find symbols that need exporting, let  us
-  <http://user-mode-linux.sourceforge.net/>  know, and
+  know at http://user-mode-linux.sourceforge.net/, and
   they'll be "taken care of".
 
 
@@ -383,9 +383,9 @@ Linux: a port of the Linux kernel as a normal Intel Linux process.
 
 
   You will need a filesystem to boot UML from.  There are a number
-  available for download from  here  <http://user-mode-
-  linux.sourceforge.net/> .  There are also  several tools
-  <http://user-mode-linux.sourceforge.net/>  which can be
+  available for download from http://user-mode-linux.sourceforge.net.
+  There are also  several tools at
+  http://user-mode-linux.sourceforge.net/  which can be
   used to generate UML-compatible filesystem images from media.
   The kernel will boot up and present you with a login prompt.
 
@@ -464,10 +464,9 @@ Note:
 
   Here are some examples of UML in action:
 
-  -  A login session <http://user-mode-linux.sourceforge.net/login.html>
-
-  -  A virtual network <http://user-mode-linux.sourceforge.net/net.html>
+  -  A login session http://user-mode-linux.sourceforge.net/old/login.html
 
+  -  A virtual network http://user-mode-linux.sourceforge.net/old/net.html
 
 
 
@@ -1132,11 +1131,6 @@ Note:
 
 
 
-
-  Harald's original README is here <http://user-mode-linux.source-
-  forge.net/>  and explains these in detail, as well as
-  some other issues.
-
   There is also a related point-to-point only "ucast" transport.
   This is useful when your network does not support multicast, and
   all network connections are simple point to point links.
@@ -1219,8 +1213,7 @@ Note:
   make sure that /usr/src/linux points to the headers for the running
   kernel.
 
-  These were pointed out by Tim Robinson <timro at trkr dot net> in
-  <http://www.geocrawler.com/> name="this uml-user post"> .
+  These were pointed out by Tim Robinson <timro at trkr dot net> in the past.
 
 
 
@@ -1914,8 +1907,8 @@ Note:
 
   uml_moo is installed with the UML deb and RPM.  If you didn't install
   UML from one of those packages, you can also get it from the UML
-  utilities <http://user-mode-linux.sourceforge.net/
-  utilities>  tar file in tools/moo.
+  utilities http://user-mode-linux.sourceforge.net/utilities tar file
+  in tools/moo.
 
 
 
@@ -3709,18 +3702,15 @@ Note:
 
 
   This is a syslogd bug.  There's a race between a parent process
-  installing a signal handler and its child sending the signal.  See
-  this uml-devel post <http://www.geocrawler.com/lists/3/Source-
-  Forge/709/0/6612801>  for the details.
+  installing a signal handler and its child sending the signal.
 
 
 
 13.8.  TUN/TAP networking doesn't work on a 2.4 host
 ----------------------------------------------------
 
-  There are a couple of problems which were
-  <http://www.geocrawler.com/lists/3/SourceForge/597/0/> name="pointed
-  out">  by Tim Robinson <timro at trkr dot net>
+  There are a couple of problems which were reported by
+  Tim Robinson <timro at trkr dot net>
 
   -  It doesn't work on hosts running 2.4.7 (or thereabouts) or earlier.
      The fix is to upgrade to something more recent and then read the
@@ -3763,7 +3753,7 @@ Note:
 
 
   Documentation on IP Masquerading, and SNAT, can be found at
-  www.netfilter.org  <http://www.netfilter.org> .
+  http://www.netfilter.org.
 
 
   If you can reach the local net, but not the outside Internet, then
@@ -4113,14 +4103,14 @@ Note:
 
   Rusty Russell <rusty at linuxcare.com.au>  -
 
-  -  wrote the  HOWTO <http://user-mode-
-     linux.sourceforge.net/UserModeLinux-HOWTO.html>
+  -  wrote the  HOWTO
+     http://user-mode-linux.sourceforge.net/old/UserModeLinux-HOWTO.html
 
   -  prodded me into making this project official and putting it on
      SourceForge
 
-  -  came up with the way cool UML logo <http://user-mode-
-     linux.sourceforge.net/uml-small.png>
+  -  came up with the way cool UML logo
+     http://user-mode-linux.sourceforge.net/uml-small.png
 
   -  redid the config process
 
@@ -4148,17 +4138,15 @@ Note:
   Jim Leu <jleu at mindspring.com>  - Wrote the virtual ethernet driver
   and associated usermode tools
 
-  Lars Brinkhoff <http://lars.nocrew.org/>  - Contributed the ptrace
-  proxy from his own  project <http://a386.nocrew.org/> to allow easier
-  kernel debugging
+  Lars Brinkhoff http://lars.nocrew.org/  - Contributed the ptrace
+  proxy from his own  project to allow easier kernel debugging
 
 
   Andrea Arcangeli <andrea at suse.de>  - Redid some of the early boot
   code so that it would work on machines with Large File Support
 
 
-  Chris Emerson <http://www.chiark.greenend.org.uk/~cemerson/>  - Did
-  the first UML port to Linux/ppc
+  Chris Emerson - Did the first UML port to Linux/ppc
 
 
   Harald Welte <laforge at gnumonks.org>  - Wrote the multicast
@@ -4173,7 +4161,7 @@ Note:
   wrote the iomem emulation support
 
 
-  Henrik Nordstrom <http://hem.passagen.se/hno/>  - Provided a variety
+  Henrik Nordstrom http://hem.passagen.se/hno/  - Provided a variety
   of patches, fixes, and clues
 
 
@@ -4208,16 +4196,15 @@ Note:
   submitted patches for the slip transport and lots of other things.
 
 
-  David Coulson <http://davidcoulson.net>  -
+  David Coulson http://davidcoulson.net  -
 
-  -  Set up the usermodelinux.org <http://usermodelinux.org>  site,
+  -  Set up the http://usermodelinux.org  site,
      which is a great way of keeping the UML user community on top of
      UML goings-on.
 
   -  Site documentation and updates
 
   -  Nifty little UML management daemon  UMLd
-     <http://uml.openconsultancy.com/umld/>
 
   -  Lots of testing and bug reports
 
@@ -4390,12 +4377,12 @@ Note:
   work with RH 6.2.
 
   Michael Jennings <mikejen at hevanet.com>  sent in some material which
-  is now gracing the top of the  index  page <http://user-mode-
-  linux.sourceforge.net/>  of this site.
+  is now gracing the top of the  index  page
+  http://user-mode-linux.sourceforge.net/  of this site.
 
-  SGI <http://www.sgi.com>  (and more specifically Ralf Baechle <ralf at
-  uni-koblenz.de> ) gave me an account on oss.sgi.com
-  <http://www.oss.sgi.com> .  The bandwidth there made it possible to
+  SGI (and more specifically Ralf Baechle <ralf at
+  uni-koblenz.de> ) gave me an account on oss.sgi.com.
+  The bandwidth there made it possible to
   produce most of the filesystems available on the project download
   page.
 
@@ -4412,5 +4399,5 @@ Note:
 
   Chris Reahard built a specialized root filesystem for running a DNS
   server jailed inside UML.  It's available from the download
-  <http://user-mode-linux.sourceforge.net/dl-sf.html>  page in the Jail
+  http://user-mode-linux.sourceforge.net/old/dl-sf.html  page in the Jail
   Filesystems section.
-- 
2.24.1

