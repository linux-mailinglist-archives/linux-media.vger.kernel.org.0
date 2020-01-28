Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0208014BC07
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 15:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgA1Ouu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 09:50:50 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58578 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgA1N6q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 08:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JFOSr0QNrYyzNYUmVsVjhXctQrvLYwtGUVn2rSqWZhM=; b=bkTUDevZPnUhq4I9dTYl5juXcc
        CxCXii7tQG4s6qSQRkybdnYwPseOaU4pW8fHExfA1SkdizcAWTNVnvFjOIMjbC0sqwCki5p61coSU
        ADBnCy6BeKROYXPIYea5EBFcsJQ3s1TWMxDkgougv7dMCVAxcAmD6Lg2l8T3/nQA7Hek9Iy79JBm6
        sR2lQrkoDPaZhXhSWyaxwL7ZbfpVKuMCx3exZVa1NYTa5oeoefFW6fdXBZaxZTBouiiey67vMEBas
        t11TSfyyyCCeA/styjVmwxmzuYpR7bN4o3J+HOnwSRv9l0gIdzw8Mtj2g2iuhFd2xaY8RveJ8b+BO
        zkgy4oWA==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRO7-0006I2-14; Tue, 28 Jan 2020 13:58:45 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRNq-001BJJ-4n; Tue, 28 Jan 2020 14:58:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-doc@vger.kernel.org, linux-um@lists.infradead.org
Subject: [PATCH 02/27] docs: virt: convert UML documentation to ReST
Date:   Tue, 28 Jan 2020 14:57:58 +0100
Message-Id: <2e4312df98700087b1baa3204ddc0059164af899.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Despite being an old document, it contains lots of information
that could still be useful.

The document has a nice style with makes easy to convert to
ReST. So, let's convert it to ReST.

This patch does:

	- Use proper markups for titles;
	- Mark and proper indent literal blocks;
	- don't use an 'o' character for lists;
	- other minor changes required for the doc to be parsed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/index.rst                  |    1 +
 ...odeLinux-HOWTO.txt => user_mode_linux.rst} | 1703 ++++++++---------
 2 files changed, 787 insertions(+), 917 deletions(-)
 rename Documentation/virt/uml/{UserModeLinux-HOWTO.txt => user_mode_linux.rst} (75%)

diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 062ffb527043..0a8f7fda64ad 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -8,6 +8,7 @@ Linux Virtualization Support
    :maxdepth: 2
 
    kvm/index
+   uml/user_mode_linux
    paravirt_ops
 
 .. only:: html and subproject
diff --git a/Documentation/virt/uml/UserModeLinux-HOWTO.txt b/Documentation/virt/uml/user_mode_linux.rst
similarity index 75%
rename from Documentation/virt/uml/UserModeLinux-HOWTO.txt
rename to Documentation/virt/uml/user_mode_linux.rst
index 87b80f589e1c..98922008be23 100644
--- a/Documentation/virt/uml/UserModeLinux-HOWTO.txt
+++ b/Documentation/virt/uml/user_mode_linux.rst
@@ -1,12 +1,15 @@
-  User Mode Linux HOWTO
-  User Mode Linux Core Team
-  Mon Nov 18 14:16:16 EST 2002
+=====================
+User Mode Linux HOWTO
+=====================
 
-  This document describes the use and abuse of Jeff Dike's User Mode
-  Linux: a port of the Linux kernel as a normal Intel Linux process.
-  ______________________________________________________________________
+:Author:  User Mode Linux Core Team
+:Last-updated: Mon Nov 18 14:16:16 EST 2002
 
-  Table of Contents
+This document describes the use and abuse of Jeff Dike's User Mode
+Linux: a port of the Linux kernel as a normal Intel Linux process.
+
+
+.. Table of Contents
 
   1. Introduction
 
@@ -132,19 +135,19 @@
      15.5 Other contributions
 
 
-  ______________________________________________________________________
-
-  1.  Introduction
+1.  Introduction
+================
 
   Welcome to User Mode Linux.  It's going to be fun.
 
 
 
-  1.1.  How is User Mode Linux Different?
+1.1.  How is User Mode Linux Different?
+---------------------------------------
 
   Normally, the Linux Kernel talks straight to your hardware (video
   card, keyboard, hard drives, etc), and any programs which run ask the
-  kernel to operate the hardware, like so:
+  kernel to operate the hardware, like so::
 
 
 
@@ -160,10 +163,10 @@
 
 
   The User Mode Linux Kernel is different; instead of talking to the
-  hardware, it talks to a `real' Linux kernel (called the `host kernel'
+  hardware, it talks to a `real` Linux kernel (called the `host kernel`
   from now on), like any other program.  Programs can then run inside
   User-Mode Linux as if they were running under a normal kernel, like
-  so:
+  so::
 
 
 
@@ -181,7 +184,8 @@
 
 
 
-  1.2.  Why Would I Want User Mode Linux?
+1.2.  Why Would I Want User Mode Linux?
+---------------------------------------
 
 
   1. If User Mode Linux crashes, your host kernel is still fine.
@@ -204,14 +208,16 @@
 
 
 
+.. _Compiling_the_kernel_and_modules:
 
+2.  Compiling the kernel and modules
+====================================
 
-  2.  Compiling the kernel and modules
 
 
 
-
-  2.1.  Compiling the kernel
+2.1.  Compiling the kernel
+--------------------------
 
 
   Compiling the user mode kernel is just like compiling any other
@@ -220,7 +226,6 @@
 
 
   1. Download the latest UML patch from
-
      the download page <http://user-mode-linux.sourceforge.net/
 
      In this example, the file is uml-patch-2.4.0-prerelease.bz2.
@@ -230,57 +235,33 @@
      such as:
 
      ftp://ftp.ca.kernel.org/pub/kernel/v2.4/linux-2.4.0-prerelease.tar.bz2
-     <ftp://ftp.ca.kernel.org/pub/kernel/v2.4/linux-2.4.0-prerelease.tar.bz2>
-     .
-
-
-  3. Make a directory and unpack the kernel into it.
 
 
+  3. Make a directory and unpack the kernel into it::
 
        host%
        mkdir ~/uml
 
-
-
-
-
-
        host%
        cd ~/uml
 
-
-
-
-
-
        host%
        tar -xzvf linux-2.4.0-prerelease.tar.bz2
 
 
 
-
-
-
-  4. Apply the patch using
-
-
+  4. Apply the patch using::
 
        host%
        cd ~/uml/linux
 
-
-
        host%
        bzcat uml-patch-2.4.0-prerelease.bz2 | patch -p1
 
 
 
-
-
-
-  5. Run your favorite config; `make xconfig ARCH=um' is the most
-     convenient.  `make config ARCH=um' and 'make menuconfig ARCH=um'
+  5. Run your favorite config; ``make xconfig ARCH=um`` is the most
+     convenient.  ``make config ARCH=um`` and ``make menuconfig ARCH=um``
      will work as well.  The defaults will give you a useful kernel.  If
      you want to change something, go ahead, it probably won't hurt
      anything.
@@ -288,13 +269,13 @@
 
      Note:  If the host is configured with a 2G/2G address space split
      rather than the usual 3G/1G split, then the packaged UML binaries
-     will not run.  They will immediately segfault.  See ``UML on 2G/2G
-     hosts''  for the scoop on running UML on your system.
+     will not run.  They will immediately segfault.  See
+     :ref:`UML_on_2G/2G_hosts`  for the scoop on running UML on your system.
 
 
 
-  6. Finish with `make linux ARCH=um': the result is a file called
-     `linux' in the top directory of your source tree.
+  6. Finish with ``make linux ARCH=um``: the result is a file called
+     ``linux`` in the top directory of your source tree.
 
   Make sure that you don't build this kernel in /usr/src/linux.  On some
   distributions, /usr/include/asm is a link into this pool.  The user-
@@ -310,7 +291,7 @@
   corresponding directory in the appropriate kernel pool.
 
   If you don't have the latest kernel pool, you can get the
-  corresponding user-mode sources with
+  corresponding user-mode sources with::
 
 
        host% cvs co -r v_2_3_x linux
@@ -322,10 +303,11 @@
   bug fixes and enhancements that have gone into subsequent releases.
 
 
-  2.2.  Compiling and installing kernel modules
+2.2.  Compiling and installing kernel modules
+---------------------------------------------
 
   UML modules are built in the same way as the native kernel (with the
-  exception of the 'ARCH=um' that you always need for UML):
+  exception of the 'ARCH=um' that you always need for UML)::
 
 
        host% make modules ARCH=um
@@ -337,12 +319,12 @@
   the user-mode pool.  Modules from the native kernel won't work.
 
   You can install them by using ftp or something to copy them into the
-  virtual machine and dropping them into /lib/modules/`uname -r`.
+  virtual machine and dropping them into ``/lib/modules/$(uname -r)``.
 
   You can also get the kernel build process to install them as follows:
 
   1. with the kernel not booted, mount the root filesystem in the top
-     level of the kernel pool:
+     level of the kernel pool::
 
 
        host% mount root_fs mnt -o loop
@@ -352,7 +334,7 @@
 
 
 
-  2. run
+  2. run::
 
 
        host%
@@ -363,7 +345,7 @@
 
 
 
-  3. unmount the filesystem
+  3. unmount the filesystem::
 
 
        host% umount mnt
@@ -386,22 +368,23 @@
 
 
 
-  2.3.  Compiling and installing uml_utilities
+2.3.  Compiling and installing uml_utilities
+--------------------------------------------
 
   Many features of the UML kernel require a user-space helper program,
   so a uml_utilities package is distributed separately from the kernel
   patch which provides these helpers. Included within this is:
 
-  o  port-helper - Used by consoles which connect to xterms or ports
+  -  port-helper - Used by consoles which connect to xterms or ports
 
-  o  tunctl - Configuration tool to create and delete tap devices
+  -  tunctl - Configuration tool to create and delete tap devices
 
-  o  uml_net - Setuid binary for automatic tap device configuration
+  -  uml_net - Setuid binary for automatic tap device configuration
 
-  o  uml_switch - User-space virtual switch required for daemon
+  -  uml_switch - User-space virtual switch required for daemon
      transport
 
-     The uml_utilities tree is compiled with:
+     The uml_utilities tree is compiled with::
 
 
        host#
@@ -423,19 +406,21 @@
 
 
 
-  3.  Running UML and logging in
+3.  Running UML and logging in
+==============================
 
 
 
-  3.1.  Running UML
+3.1.  Running UML
+-----------------
 
   It runs on 2.2.15 or later, and all 2.4 kernels.
 
 
   Booting UML is straightforward.  Simply run 'linux': it will try to
-  mount the file `root_fs' in the current directory.  You do not need to
-  run it as root.  If your root filesystem is not named `root_fs', then
-  you need to put a `ubd0=root_fs_whatever' switch on the linux command
+  mount the file ``root_fs`` in the current directory.  You do not need to
+  run it as root.  If your root filesystem is not named ``root_fs``, then
+  you need to put a ``ubd0=root_fs_whatever`` switch on the linux command
   line.
 
 
@@ -447,14 +432,16 @@
   The kernel will boot up and present you with a login prompt.
 
 
-  Note:  If the host is configured with a 2G/2G address space split
+Note:
+  If the host is configured with a 2G/2G address space split
   rather than the usual 3G/1G split, then the packaged UML binaries will
-  not run.  They will immediately segfault.  See ``UML on 2G/2G hosts''
+  not run.  They will immediately segfault.  See :ref:`UML_on_2G/2G_hosts`
   for the scoop on running UML on your system.
 
 
 
-  3.2.  Logging in
+3.2.  Logging in
+----------------
 
 
 
@@ -468,22 +455,22 @@
 
   There are a couple of other ways to log in:
 
-  o  On a virtual console
+  -  On a virtual console
 
 
 
      Each virtual console that is configured (i.e. the device exists in
      /dev and /etc/inittab runs a getty on it) will come up in its own
-     xterm.  If you get tired of the xterms, read ``Setting up serial
-     lines and consoles''  to see how to attach the consoles to
-     something else, like host ptys.
+     xterm.  If you get tired of the xterms, read
+     :ref:`setting_up_serial_lines_and_consoles` to see how to attach
+     the consoles to something else, like host ptys.
 
 
 
-  o  Over the serial line
+  -  Over the serial line
 
 
-     In the boot output, find a line that looks like:
+     In the boot output, find a line that looks like::
 
 
 
@@ -493,7 +480,7 @@
 
 
   Attach your favorite terminal program to the corresponding tty.  I.e.
-  for minicom, the command would be
+  for minicom, the command would be::
 
 
        host% minicom -o -p /dev/ttyp1
@@ -503,37 +490,41 @@
 
 
 
-  o  Over the net
+  -  Over the net
 
 
      If the network is running, then you can telnet to the virtual
-     machine and log in to it.  See ``Setting up the network''  to learn
+     machine and log in to it.  See :ref:`Setting_up_the_network`  to learn
      about setting up a virtual network.
 
   When you're done using it, run halt, and the kernel will bring itself
   down and the process will exit.
 
 
-  3.3.  Examples
+3.3.  Examples
+--------------
 
   Here are some examples of UML in action:
 
-  o  A login session <http://user-mode-linux.sourceforge.net/login.html>
+  -  A login session <http://user-mode-linux.sourceforge.net/login.html>
 
-  o  A virtual network <http://user-mode-linux.sourceforge.net/net.html>
+  -  A virtual network <http://user-mode-linux.sourceforge.net/net.html>
 
 
 
 
 
 
+.. _UML_on_2G/2G_hosts:
 
-  4.  UML on 2G/2G hosts
+4.  UML on 2G/2G hosts
+======================
 
 
 
 
-  4.1.  Introduction
+4.1.  Introduction
+------------------
 
 
   Most Linux machines are configured so that the kernel occupies the
@@ -546,7 +537,8 @@
 
 
 
-  4.2.  The problem
+4.2.  The problem
+-----------------
 
 
   The prebuilt UML binaries on this site will not run on 2G/2G hosts
@@ -558,13 +550,14 @@
 
 
 
-  4.3.  The solution
+4.3.  The solution
+------------------
 
 
   The fix for this is to rebuild UML from source after enabling
   CONFIG_HOST_2G_2G (under 'General Setup').  This will cause UML to
   load itself in the top .5G of that smaller process address space,
-  where it will run fine.  See ``Compiling the kernel and modules''  if
+  where it will run fine.  See :ref:`Compiling_the_kernel_and_modules`  if
   you need help building UML from source.
 
 
@@ -573,10 +566,11 @@
 
 
 
+.. _setting_up_serial_lines_and_consoles:
 
 
-
-  5.  Setting up serial lines and consoles
+5.  Setting up serial lines and consoles
+========================================
 
 
   It is possible to attach UML serial lines and consoles to many types
@@ -584,22 +578,23 @@
 
 
   You can attach them to host ptys, ttys, file descriptors, and ports.
-  This allows you to do things like
+  This allows you to do things like:
 
-  o  have a UML console appear on an unused host console,
+  -  have a UML console appear on an unused host console,
 
-  o  hook two virtual machines together by having one attach to a pty
+  -  hook two virtual machines together by having one attach to a pty
      and having the other attach to the corresponding tty
 
-  o  make a virtual machine accessible from the net by attaching a
+  -  make a virtual machine accessible from the net by attaching a
      console to a port on the host.
 
 
-  The general format of the command line option is device=channel.
+  The general format of the command line option is ``device=channel``.
 
 
 
-  5.1.  Specifying the device
+5.1.  Specifying the device
+---------------------------
 
   Devices are specified with "con" or "ssl" (console or serial line,
   respectively), optionally with a device number if you are talking
@@ -613,7 +608,7 @@
 
   A specific device name will override a less general "con=" or "ssl=".
   So, for example, you can assign a pty to each of the serial lines
-  except for the first two like this:
+  except for the first two like this::
 
 
         ssl=pty ssl0=tty:/dev/tty0 ssl1=tty:/dev/tty1
@@ -626,13 +621,14 @@
 
 
 
-  5.2.  Specifying the channel
+5.2.  Specifying the channel
+----------------------------
 
   There are a number of different types of channels to attach a UML
   device to, each with a different way of specifying exactly what to
   attach to.
 
-  o  pseudo-terminals - device=pty pts terminals - device=pts
+  -  pseudo-terminals - device=pty pts terminals - device=pts
 
 
      This will cause UML to allocate a free host pseudo-terminal for the
@@ -640,23 +636,23 @@
      log.  You access it by attaching a terminal program to the
      corresponding tty:
 
-  o  screen /dev/pts/n
+  -  screen /dev/pts/n
 
-  o  screen /dev/ttyxx
+  -  screen /dev/ttyxx
 
-  o  minicom -o -p /dev/ttyxx - minicom seems not able to handle pts
+  -  minicom -o -p /dev/ttyxx - minicom seems not able to handle pts
      devices
 
-  o  kermit - start it up, 'open' the device, then 'connect'
+  -  kermit - start it up, 'open' the device, then 'connect'
 
 
 
 
 
-  o  terminals - device=tty:tty device file
+  -  terminals - device=tty:tty device file
 
 
-     This will make UML attach the device to the specified tty (i.e
+     This will make UML attach the device to the specified tty (i.e::
 
 
         con1=tty:/dev/tty3
@@ -672,7 +668,7 @@
 
 
 
-  o  xterms - device=xterm
+  -  xterms - device=xterm
 
 
      UML will run an xterm and the device will be attached to it.
@@ -681,12 +677,12 @@
 
 
 
-  o  Port - device=port:port number
+  -  Port - device=port:port number
 
 
      This will attach the UML devices to the specified host port.
      Attaching console 1 to the host's port 9000 would be done like
-     this:
+     this::
 
 
         con1=port:9000
@@ -694,7 +690,7 @@
 
 
 
-  Attaching all the serial lines to that port would be done similarly:
+  Attaching all the serial lines to that port would be done similarly::
 
 
         ssl=port:9000
@@ -702,8 +698,8 @@
 
 
 
-  You access these devices by telnetting to that port.  Each active tel-
-  net session gets a different device.  If there are more telnets to a
+  You access these devices by telnetting to that port.  Each active
+  telnet session gets a different device.  If there are more telnets to a
   port than UML devices attached to it, then the extra telnet sessions
   will block until an existing telnet detaches, or until another device
   becomes active (i.e. by being activated in /etc/inittab).
@@ -725,13 +721,13 @@
 
 
 
-  o  already-existing file descriptors - device=file descriptor
+  -  already-existing file descriptors - device=file descriptor
 
 
      If you set up a file descriptor on the UML command line, you can
      attach a UML device to it.  This is most commonly used to put the
      main console back on stdin and stdout after assigning all the other
-     consoles to something else:
+     consoles to something else::
 
 
         con0=fd:0,fd:1 con=pts
@@ -743,7 +739,7 @@
 
 
 
-  o  Nothing - device=null
+  -  Nothing - device=null
 
 
      This allows the device to be opened, in contrast to 'none', but
@@ -754,7 +750,7 @@
 
 
 
-  o  None - device=none
+  -  None - device=none
 
 
      This causes the device to disappear.
@@ -762,7 +758,7 @@
 
 
   You can also specify different input and output channels for a device
-  by putting a comma between them:
+  by putting a comma between them::
 
 
         ssl3=tty:/dev/tty2,xterm
@@ -785,14 +781,15 @@
 
 
 
-  5.3.  Examples
+5.3.  Examples
+--------------
 
   There are a number of interesting things you can do with this
   capability.
 
 
   First, this is how you get rid of those bleeding console xterms by
-  attaching them to host ptys:
+  attaching them to host ptys::
 
 
         con=pty con0=fd:0,fd:1
@@ -802,7 +799,7 @@
 
   This will make a UML console take over an unused host virtual console,
   so that when you switch to it, you will see the UML login prompt
-  rather than the host login prompt:
+  rather than the host login prompt::
 
 
         con1=tty:/dev/tty6
@@ -813,7 +810,7 @@
   You can attach two virtual machines together with what amounts to a
   serial line as follows:
 
-  Run one UML with a serial line attached to a pty -
+  Run one UML with a serial line attached to a pty::
 
 
         ssl1=pty
@@ -825,7 +822,7 @@
   that it got /dev/ptyp1).
 
   Boot the other UML with a serial line attached to the corresponding
-  tty -
+  tty::
 
 
         ssl1=tty:/dev/ttyp1
@@ -838,7 +835,10 @@
   prompt of the other virtual machine.
 
 
-  6.  Setting up the network
+.. _setting_up_the_network:
+
+6.  Setting up the network
+==========================
 
 
 
@@ -858,19 +858,19 @@
   There are currently five transport types available for a UML virtual
   machine to exchange packets with other hosts:
 
-  o  ethertap
+  -  ethertap
 
-  o  TUN/TAP
+  -  TUN/TAP
 
-  o  Multicast
+  -  Multicast
 
-  o  a switch daemon
+  -  a switch daemon
 
-  o  slip
+  -  slip
 
-  o  slirp
+  -  slirp
 
-  o  pcap
+  -  pcap
 
      The TUN/TAP, ethertap, slip, and slirp transports allow a UML
      instance to exchange packets with the host.  They may be directed
@@ -893,28 +893,28 @@
   With so many host transports, which one should you use?  Here's when
   you should use each one:
 
-  o  ethertap - if you want access to the host networking and it is
+  -  ethertap - if you want access to the host networking and it is
      running 2.2
 
-  o  TUN/TAP - if you want access to the host networking and it is
+  -  TUN/TAP - if you want access to the host networking and it is
      running 2.4.  Also, the TUN/TAP transport is able to use a
      preconfigured device, allowing it to avoid using the setuid uml_net
      helper, which is a security advantage.
 
-  o  Multicast - if you want a purely virtual network and you don't want
+  -  Multicast - if you want a purely virtual network and you don't want
      to set up anything but the UML
 
-  o  a switch daemon - if you want a purely virtual network and you
+  -  a switch daemon - if you want a purely virtual network and you
      don't mind running the daemon in order to get somewhat better
      performance
 
-  o  slip - there is no particular reason to run the slip backend unless
+  -  slip - there is no particular reason to run the slip backend unless
      ethertap and TUN/TAP are just not available for some reason
 
-  o  slirp - if you don't have root access on the host to setup
+  -  slirp - if you don't have root access on the host to setup
      networking, or if you don't want to allocate an IP to your UML
 
-  o  pcap - not much use for actual network connectivity, but great for
+  -  pcap - not much use for actual network connectivity, but great for
      monitoring traffic on the host
 
      Ethertap is available on 2.4 and works fine.  TUN/TAP is preferred
@@ -926,7 +926,8 @@
      exploit the helper's root privileges.
 
 
-  6.1.  General setup
+6.1.  General setup
+-------------------
 
   First, you must have the virtual network enabled in your UML.  If are
   running a prebuilt kernel from this site, everything is already
@@ -938,7 +939,7 @@
   The next step is to provide a network device to the virtual machine.
   This is done by describing it on the kernel command line.
 
-  The general format is
+  The general format is::
 
 
        eth <n> = <transport> , <transport args>
@@ -947,7 +948,7 @@
 
 
   For example, a virtual ethernet device may be attached to a host
-  ethertap device as follows:
+  ethertap device as follows::
 
 
        eth0=ethertap,tap0,fe:fd:0:0:0:1,192.168.0.254
@@ -978,7 +979,7 @@
 
 
   You can also add devices to a UML and remove them at runtime.  See the
-  ``The Management Console''  page for details.
+  :ref:`The_Management_Console`  page for details.
 
 
   The sections below describe this in more detail.
@@ -995,7 +996,8 @@
 
 
 
-  6.2.  Userspace daemons
+6.2.  Userspace daemons
+-----------------------
 
   You will likely need the setuid helper, or the switch daemon, or both.
   They are both installed with the RPM and deb, so if you've installed
@@ -1011,7 +1013,8 @@
 
 
 
-  6.3.  Specifying ethernet addresses
+6.3.  Specifying ethernet addresses
+-----------------------------------
 
   Below, you will see that the TUN/TAP, ethertap, and daemon interfaces
   allow you to specify hardware addresses for the virtual ethernet
@@ -1023,21 +1026,21 @@
   sufficient to guarantee a unique hardware address for the device.  A
   couple of exceptions are:
 
-  o  Another set of virtual ethernet devices are on the same network and
+  -  Another set of virtual ethernet devices are on the same network and
      they are assigned hardware addresses using a different scheme which
      may conflict with the UML IP address-based scheme
 
-  o  You aren't going to use the device for IP networking, so you don't
+  -  You aren't going to use the device for IP networking, so you don't
      assign the device an IP address
 
      If you let the driver provide the hardware address, you should make
      sure that the device IP address is known before the interface is
-     brought up.  So, inside UML, this will guarantee that:
+     brought up.  So, inside UML, this will guarantee that::
 
 
 
-  UML#
-  ifconfig eth0 192.168.0.250 up
+	  UML#
+	  ifconfig eth0 192.168.0.250 up
 
 
 
@@ -1049,13 +1052,14 @@
 
 
 
-  6.4.  UML interface setup
+6.4.  UML interface setup
+-------------------------
 
   Once the network devices have been described on the command line, you
   should boot UML and log in.
 
 
-  The first thing to do is bring the interface up:
+  The first thing to do is bring the interface up::
 
 
        UML# ifconfig ethn ip-address up
@@ -1067,7 +1071,7 @@
 
 
   To reach the rest of the world, you should set a default route to the
-  host:
+  host::
 
 
        UML# route add default gw host ip
@@ -1075,7 +1079,7 @@
 
 
 
-  Again, with host ip of 192.168.0.4:
+  Again, with host ip of 192.168.0.4::
 
 
        UML# route add default gw 192.168.0.4
@@ -1097,29 +1101,25 @@
   Note: If you can't communicate with other hosts on your physical
   ethernet, it's probably because of a network route that's
   automatically set up.  If you run 'route -n' and see a route that
-  looks like this:
+  looks like this::
 
 
 
 
-  Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
-  192.168.0.0     0.0.0.0         255.255.255.0   U     0      0      0   eth0
+    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
+    192.168.0.0     0.0.0.0         255.255.255.0   U     0      0      0   eth0
 
 
 
 
   with a mask that's not 255.255.255.255, then replace it with a route
-  to your host:
+  to your host::
 
 
        UML#
        route del -net 192.168.0.0 dev eth0 netmask 255.255.255.0
 
 
-
-
-
-
        UML#
        route add -host 192.168.0.4 dev eth0
 
@@ -1131,7 +1131,8 @@
 
 
 
-  6.5.  Multicast
+6.5.  Multicast
+---------------
 
   The simplest way to set up a virtual network between multiple UMLs is
   to use the mcast transport.  This was written by Harald Welte and is
@@ -1142,7 +1143,7 @@
   messages when you bring the device up inside UML.
 
 
-  To use it, run two UMLs with
+  To use it, run two UMLs with::
 
 
         eth0=mcast
@@ -1151,16 +1152,12 @@
 
 
   on their command lines.  Log in, configure the ethernet device in each
-  machine with different IP addresses:
+  machine with different IP addresses::
 
 
        UML1# ifconfig eth0 192.168.0.254
 
 
-
-
-
-
        UML2# ifconfig eth0 192.168.0.253
 
 
@@ -1168,7 +1165,7 @@
 
   and they should be able to talk to each other.
 
-  The full set of command line options for this transport are
+  The full set of command line options for this transport are::
 
 
 
@@ -1186,7 +1183,7 @@
   This is useful when your network does not support multicast, and
   all network connections are simple point to point links.
 
-  The full set of command line options for this transport are
+  The full set of command line options for this transport are::
 
 
        ethn=ucast,ethernet address,remote address,listen port,remote port
@@ -1194,7 +1191,8 @@
 
 
 
-  6.6.  TUN/TAP with the uml_net helper
+6.6.  TUN/TAP with the uml_net helper
+-------------------------------------
 
   TUN/TAP is the preferred mechanism on 2.4 to exchange packets with the
   host.  The TUN/TAP backend has been in UML since 2.4.9-3um.
@@ -1216,7 +1214,7 @@
   kernel or as the tun.o module.
 
   The format of the command line switch to attach a device to a TUN/TAP
-  device is
+  device is::
 
 
        eth <n> =tuntap,,, <IP address>
@@ -1226,7 +1224,7 @@
 
   For example, this argument will attach the UML's eth0 to the next
   available tap device and assign an ethernet address to it based on its
-  IP address
+  IP address::
 
 
        eth0=tuntap,,,192.168.0.254
@@ -1247,10 +1245,10 @@
   There are a couple potential problems with running the TUN/TAP
   transport on a 2.4 host kernel
 
-  o  TUN/TAP seems not to work on 2.4.3 and earlier.  Upgrade the host
+  -  TUN/TAP seems not to work on 2.4.3 and earlier.  Upgrade the host
      kernel or use the ethertap transport.
 
-  o  With an upgraded kernel, TUN/TAP may fail with
+  -  With an upgraded kernel, TUN/TAP may fail with::
 
 
        File descriptor in bad state
@@ -1264,12 +1262,12 @@
   kernel.
 
   These were pointed out by Tim Robinson <timro at trkr dot net> in
-  <http://www.geocrawler.com/> name="this uml-
-  user post"> .
+  <http://www.geocrawler.com/> name="this uml-user post"> .
 
 
 
-  6.7.  TUN/TAP with a preconfigured tap device
+6.7.  TUN/TAP with a preconfigured tap device
+---------------------------------------------
 
   If you prefer not to have UML use uml_net (which is somewhat
   insecure), with UML 2.4.17-11, you can set up a TUN/TAP device
@@ -1277,8 +1275,8 @@
   there is no need for root assistance.  Setting up the device is done
   as follows:
 
-  o  Create the device with tunctl (available from the UML utilities
-     tarball)
+  -  Create the device with tunctl (available from the UML utilities
+     tarball)::
 
 
 
@@ -1291,8 +1289,8 @@
   where uid is the user id or username that UML will be run as.  This
   will tell you what device was created.
 
-  o  Configure the device IP (change IP addresses and device name to
-     suit)
+  -  Configure the device IP (change IP addresses and device name to
+     suit)::
 
 
 
@@ -1303,8 +1301,8 @@
 
 
 
-  o  Set up routing and arping if desired - this is my recipe, there are
-     other ways of doing the same thing
+  -  Set up routing and arping if desired - this is my recipe, there are
+     other ways of doing the same thing::
 
 
        host#
@@ -1313,19 +1311,9 @@
        host#
        route add -host 192.168.0.253 dev tap0
 
-
-
-
-
-
        host#
        bash -c 'echo 1 > /proc/sys/net/ipv4/conf/tap0/proxy_arp'
 
-
-
-
-
-
        host#
        arp -Ds 192.168.0.253 eth0 pub
 
@@ -1338,76 +1326,43 @@
   utility which reads the information from a config file and sets up
   devices at boot time.
 
-  o  Rather than using up two IPs and ARPing for one of them, you can
+  -  Rather than using up two IPs and ARPing for one of them, you can
      also provide direct access to your LAN by the UML by using a
-     bridge.
+     bridge::
 
 
        host#
        brctl addbr br0
 
 
-
-
-
-
        host#
        ifconfig eth0 0.0.0.0 promisc up
 
 
-
-
-
-
        host#
        ifconfig tap0 0.0.0.0 promisc up
 
 
-
-
-
-
        host#
        ifconfig br0 192.168.0.1 netmask 255.255.255.0 up
 
 
-
-
-
-
-
-  host#
-  brctl stp br0 off
-
-
-
-
+       host#
+       brctl stp br0 off
 
 
        host#
        brctl setfd br0 1
 
 
-
-
-
-
        host#
        brctl sethello br0 1
 
 
-
-
-
-
        host#
        brctl addif br0 eth0
 
 
-
-
-
-
        host#
        brctl addif br0 tap0
 
@@ -1417,12 +1372,12 @@
   Note that 'br0' should be setup using ifconfig with the existing IP
   address of eth0, as eth0 no longer has its own IP.
 
-  o
+  -
 
 
      Also, the /dev/net/tun device must be writable by the user running
      UML in order for the UML to use the device that's been configured
-     for it.  The simplest thing to do is
+     for it.  The simplest thing to do is::
 
 
        host#  chmod 666 /dev/net/tun
@@ -1438,14 +1393,14 @@
   devices and chgrp /dev/net/tun to that group with mode 664 or 660.
 
 
-  o  Once the device is set up, run UML with 'eth0=tuntap,device name'
+  -  Once the device is set up, run UML with 'eth0=tuntap,device name'
      (i.e. 'eth0=tuntap,tap0') on the command line (or do it with the
      mconsole config command).
 
-  o  Bring the eth device up in UML and you're in business.
+  -  Bring the eth device up in UML and you're in business.
 
      If you don't want that tap device any more, you can make it non-
-     persistent with
+     persistent with::
 
 
        host#  tunctl -d tap device
@@ -1455,7 +1410,7 @@
 
   Finally, tunctl has a -b (for brief mode) switch which causes it to
   output only the name of the tap device it created.  This makes it
-  suitable for capture by a script:
+  suitable for capture by a script::
 
 
        host#  TAP=`tunctl -u 1000 -b`
@@ -1465,7 +1420,8 @@
 
 
 
-  6.8.  Ethertap
+6.8.  Ethertap
+--------------
 
   Ethertap is the general mechanism on 2.2 for userspace processes to
   exchange packets with the kernel.
@@ -1473,7 +1429,7 @@
 
 
   To use this transport, you need to describe the virtual network device
-  on the UML command line.  The general format for this is
+  on the UML command line.  The general format for this is::
 
 
        eth <n> =ethertap, <device> , <ethernet address> , <tap IP address>
@@ -1481,7 +1437,7 @@
 
 
 
-  So, the previous example
+  So, the previous example::
 
 
        eth0=ethertap,tap0,fe:fd:0:0:0:1,192.168.0.254
@@ -1521,7 +1477,7 @@
 
   If you want to set things up yourself, you need to make sure that the
   appropriate /dev entry exists.  If it doesn't, become root and create
-  it as follows:
+  it as follows::
 
 
        mknod /dev/tap <minor>  c 36  <minor>  + 16
@@ -1529,7 +1485,7 @@
 
 
 
-  For example, this is how to create /dev/tap0:
+  For example, this is how to create /dev/tap0::
 
 
        mknod /dev/tap0 c 36 0 + 16
@@ -1539,7 +1495,7 @@
 
   You also need to make sure that the host kernel has ethertap support.
   If ethertap is enabled as a module, you apparently need to insmod
-  ethertap once for each ethertap device you want to enable.  So,
+  ethertap once for each ethertap device you want to enable.  So,::
 
 
        host#
@@ -1549,7 +1505,7 @@
 
 
   will give you the tap0 interface.  To get the tap1 interface, you need
-  to run
+  to run::
 
 
        host#
@@ -1561,7 +1517,8 @@
 
 
 
-  6.9.  The switch daemon
+6.9.  The switch daemon
+-----------------------
 
   Note: This is the daemon formerly known as uml_router, but which was
   renamed so the network weenies of the world would stop growling at me.
@@ -1577,7 +1534,7 @@
   sockets.
 
 
-  If you want it to listen on a different pair of sockets, use
+  If you want it to listen on a different pair of sockets, use::
 
 
         -unix control socket data socket
@@ -1586,7 +1543,7 @@
 
 
 
-  If you want it to act as a hub rather than a switch, use
+  If you want it to act as a hub rather than a switch, use::
 
 
         -hub
@@ -1596,7 +1553,7 @@
 
 
   If you want the switch to be connected to host networking (allowing
-  the umls to get access to the outside world through the host), use
+  the umls to get access to the outside world through the host), use::
 
 
         -tap tap0
@@ -1610,7 +1567,7 @@
   device than tap0, specify that instead of tap0.
 
 
-  uml_switch can be backgrounded as follows
+  uml_switch can be backgrounded as follows::
 
 
        host%
@@ -1623,7 +1580,7 @@
   stdin for EOF.  When it sees that, it exits.
 
 
-  The general format of the kernel command line switch is
+  The general format of the kernel command line switch is::
 
 
 
@@ -1639,7 +1596,8 @@
   how to communicate with the daemon.  You should only specify them if
   you told the daemon to use different sockets than the default.  So, if
   you ran the daemon with no arguments, running the UML on the same
-  machine with
+  machine with::
+
        eth0=daemon
 
 
@@ -1649,7 +1607,8 @@
 
 
 
-  6.10.  Slip
+6.10.  Slip
+-----------
 
   Slip is another, less general, mechanism for a process to communicate
   with the host networking.  In contrast to the ethertap interface,
@@ -1658,7 +1617,7 @@
   IP.
 
 
-  The general format of the command line switch is
+  The general format of the command line switch is::
 
 
 
@@ -1681,7 +1640,8 @@
 
 
 
-  6.11.  Slirp
+6.11.  Slirp
+------------
 
   slirp uses an external program, usually /usr/bin/slirp, to provide IP
   only networking connectivity through the host. This is similar to IP
@@ -1691,7 +1651,7 @@
   root access or setuid binaries on the host.
 
 
-  The general format of the command line switch for slirp is:
+  The general format of the command line switch for slirp is::
 
 
 
@@ -1716,7 +1676,7 @@
   The eth0 interface on UML should be set up with the IP 10.2.0.15,
   although you can use anything as long as it is not used by a network
   you will be connecting to. The default route on UML should be set to
-  use
+  use::
 
 
        UML#
@@ -1737,10 +1697,11 @@
 
 
 
-  6.12.  pcap
+6.12.  pcap
+-----------
 
   The pcap transport is attached to a UML ethernet device on the command
-  line or with uml_mconsole with the following syntax:
+  line or with uml_mconsole with the following syntax::
 
 
 
@@ -1762,7 +1723,7 @@
   expression optimizer is used.
 
 
-  Example:
+  Example::
 
 
 
@@ -1777,7 +1738,8 @@
 
 
 
-  6.13.  Setting up the host yourself
+6.13.  Setting up the host yourself
+-----------------------------------
 
   If you don't specify an address for the host side of the ethertap or
   slip device, UML won't do any setup on the host.  So this is what is
@@ -1785,19 +1747,15 @@
   192.168.0.251 and a UML-side IP of 192.168.0.250 - adjust to suit your
   own network):
 
-  o  The device needs to be configured with its IP address.  Tap devices
+  -  The device needs to be configured with its IP address.  Tap devices
      are also configured with an mtu of 1484.  Slip devices are
      configured with a point-to-point address pointing at the UML ip
-     address.
+     address::
 
 
        host#  ifconfig tap0 arp mtu 1484 192.168.0.251 up
 
 
-
-
-
-
        host#
        ifconfig sl0 192.168.0.251 pointopoint 192.168.0.250 up
 
@@ -1805,7 +1763,7 @@
 
 
 
-  o  If a tap device is being set up, a route is set to the UML IP.
+  -  If a tap device is being set up, a route is set to the UML IP::
 
 
        UML# route add -host 192.168.0.250 gw 192.168.0.251
@@ -1814,8 +1772,8 @@
 
 
 
-  o  To allow other hosts on your network to see the virtual machine,
-     proxy arp is set up for it.
+  -  To allow other hosts on your network to see the virtual machine,
+     proxy arp is set up for it::
 
 
        host#  arp -Ds 192.168.0.250 eth0 pub
@@ -1824,7 +1782,7 @@
 
 
 
-  o  Finally, the host is set up to route packets.
+  -  Finally, the host is set up to route packets::
 
 
        host#  echo 1 > /proc/sys/net/ipv4/ip_forward
@@ -1838,12 +1796,14 @@
 
 
 
-  7.  Sharing Filesystems between Virtual Machines
+7.  Sharing Filesystems between Virtual Machines
+================================================
 
 
 
 
-  7.1.  A warning
+7.1.  A warning
+---------------
 
   Don't attempt to share filesystems simply by booting two UMLs from the
   same file.  That's the same thing as booting two physical machines
@@ -1851,7 +1811,8 @@
 
 
 
-  7.2.  Using layered block devices
+7.2.  Using layered block devices
+---------------------------------
 
   The way to share a filesystem between two virtual machines is to use
   the copy-on-write (COW) layering capability of the ubd block driver.
@@ -1872,7 +1833,7 @@
 
 
   To add a copy-on-write layer to an existing block device file, simply
-  add the name of the COW file to the appropriate ubd switch:
+  add the name of the COW file to the appropriate ubd switch::
 
 
         ubd0=root_fs_cow,root_fs_debian_22
@@ -1883,7 +1844,7 @@
   where 'root_fs_cow' is the private COW file and 'root_fs_debian_22' is
   the existing shared filesystem.  The COW file need not exist.  If it
   doesn't, the driver will create and initialize it.  Once the COW file
-  has been initialized, it can be used on its own on the command line:
+  has been initialized, it can be used on its own on the command line::
 
 
         ubd0=root_fs_cow
@@ -1896,14 +1857,16 @@
 
 
 
-  7.3.  Note!
+7.3.  Note!
+-----------
 
   When checking the size of the COW file in order to see the gobs of
   space that you're saving, make sure you use 'ls -ls' to see the actual
   disk consumption rather than the length of the file.  The COW file is
   sparse, so the length will be very different from the disk usage.
   Here is a 'ls -l' of a COW file and backing file from one boot and
-  shutdown:
+  shutdown::
+
        host% ls -l cow.debian debian2.2
        -rw-r--r--    1 jdike    jdike    492504064 Aug  6 21:16 cow.debian
        -rwxrw-rw-    1 jdike    jdike    537919488 Aug  6 20:42 debian2.2
@@ -1911,7 +1874,7 @@
 
 
 
-  Doesn't look like much saved space, does it?  Well, here's 'ls -ls':
+  Doesn't look like much saved space, does it?  Well, here's 'ls -ls'::
 
 
        host% ls -ls cow.debian debian2.2
@@ -1926,7 +1889,8 @@
 
 
 
-  7.4.  Another warning
+7.4.  Another warning
+---------------------
 
   Once a filesystem is being used as a readonly backing file for a COW
   file, do not boot directly from it or modify it in any way.  Doing so
@@ -1952,7 +1916,8 @@
 
 
 
-  7.5.  uml_moo : Merging a COW file with its backing file
+7.5.  uml_moo : Merging a COW file with its backing file
+--------------------------------------------------------
 
   Depending on how you use UML and COW devices, it may be advisable to
   merge the changes in the COW file into the backing file every once in
@@ -1961,7 +1926,7 @@
 
 
 
-  The utility that does this is uml_moo.  Its usage is
+  The utility that does this is uml_moo.  Its usage is::
 
 
        host% uml_moo COW file new backing file
@@ -2001,7 +1966,8 @@
 
 
 
-  8.  Creating filesystems
+8.  Creating filesystems
+========================
 
 
   You may want to create and mount new UML filesystems, either because
@@ -2015,13 +1981,14 @@
   should be easy to translate to the filesystem of your choice.
 
 
-  8.1.  Create the filesystem file
+8.1.  Create the filesystem file
+================================
 
   dd is your friend.  All you need to do is tell dd to create an empty
   file of the appropriate size.  I usually make it sparse to save time
   and to avoid allocating disk space until it's actually used.  For
   example, the following command will create a sparse 100 meg file full
-  of zeroes.
+  of zeroes::
 
 
        host%
@@ -2034,9 +2001,9 @@
 
   8.2.  Assign the file to a UML device
 
-  Add an argument like the following to the UML command line:
+  Add an argument like the following to the UML command line::
 
-  ubd4=new_filesystem
+	ubd4=new_filesystem
 
 
 
@@ -2053,7 +2020,7 @@
   etc), then get them into UML by way of the net or hostfs.
 
 
-  Make the new filesystem on the device assigned to the new file:
+  Make the new filesystem on the device assigned to the new file::
 
 
        host#  mkreiserfs /dev/ubd/4
@@ -2077,7 +2044,7 @@
 
 
 
-  Now, mount it:
+  Now, mount it::
 
 
        UML#
@@ -2096,7 +2063,8 @@
 
 
 
-  9.  Host file access
+9.  Host file access
+====================
 
 
   If you want to access files on the host machine from inside UML, you
@@ -2112,10 +2080,11 @@
   files contained in it just as you would on the host.
 
 
-  9.1.  Using hostfs
+9.1.  Using hostfs
+------------------
 
   To begin with, make sure that hostfs is available inside the virtual
-  machine with
+  machine with::
 
 
        UML# cat /proc/filesystems
@@ -2127,7 +2096,7 @@
   module and available inside the virtual machine, and insmod it.
 
 
-  Now all you need to do is run mount:
+  Now all you need to do is run mount::
 
 
        UML# mount none /mnt/host -t hostfs
@@ -2139,7 +2108,7 @@
 
 
   If you don't want to mount the host root directory, then you can
-  specify a subdirectory to mount with the -o switch to mount:
+  specify a subdirectory to mount with the -o switch to mount::
 
 
        UML# mount none /mnt/home -t hostfs -o /home
@@ -2151,13 +2120,14 @@
 
 
 
-  9.2.  hostfs as the root filesystem
+9.2.  hostfs as the root filesystem
+-----------------------------------
 
   It's possible to boot from a directory hierarchy on the host using
   hostfs rather than using the standard filesystem in a file.
 
   To start, you need that hierarchy.  The easiest way is to loop mount
-  an existing root_fs file:
+  an existing root_fs file::
 
 
        host#  mount root_fs uml_root_dir -o loop
@@ -2166,15 +2136,15 @@
 
 
   You need to change the filesystem type of / in etc/fstab to be
-  'hostfs', so that line looks like this:
+  'hostfs', so that line looks like this::
 
-  /dev/ubd/0       /        hostfs      defaults          1   1
+    /dev/ubd/0       /        hostfs      defaults          1   1
 
 
 
 
   Then you need to chown to yourself all the files in that directory
-  that are owned by root.  This worked for me:
+  that are owned by root.  This worked for me::
 
 
        host#  find . -uid 0 -exec chown jdike {} \;
@@ -2183,7 +2153,7 @@
 
 
   Next, make sure that your UML kernel has hostfs compiled in, not as a
-  module.  Then run UML with the boot device pointing at that directory:
+  module.  Then run UML with the boot device pointing at that directory::
 
 
         ubd0=/path/to/uml/root/directory
@@ -2194,41 +2164,35 @@
   UML should then boot as it does normally.
 
 
-  9.3.  Building hostfs
+9.3.  Building hostfs
+---------------------
 
   If you need to build hostfs because it's not in your kernel, you have
   two choices:
 
 
 
-  o  Compiling hostfs into the kernel:
+  -  Compiling hostfs into the kernel:
 
 
      Reconfigure the kernel and set the 'Host filesystem' option under
 
 
-  o  Compiling hostfs as a module:
+  -  Compiling hostfs as a module:
 
 
      Reconfigure the kernel and set the 'Host filesystem' option under
      be in arch/um/fs/hostfs/hostfs.o.  Install that in
-     /lib/modules/`uname -r`/fs in the virtual machine, boot it up, and
+     ``/lib/modules/$(uname -r)/fs`` in the virtual machine, boot it up, and::
 
 
        UML# insmod hostfs
 
 
+.. _The_Management_Console:
 
-
-
-
-
-
-
-
-
-
-  10.  The Management Console
+10.  The Management Console
+===========================
 
 
 
@@ -2240,15 +2204,15 @@
 
   There are a number of things you can do with the mconsole interface:
 
-  o  get the kernel version
+  -  get the kernel version
 
-  o  add and remove devices
+  -  add and remove devices
 
-  o  halt or reboot the machine
+  -  halt or reboot the machine
 
-  o  Send SysRq commands
+  -  Send SysRq commands
 
-  o  Pause and resume the UML
+  -  Pause and resume the UML
 
 
   You need the mconsole client (uml_mconsole) which is present in CVS
@@ -2257,7 +2221,7 @@
 
 
   You also need CONFIG_MCONSOLE (under 'General Setup') enabled in UML.
-  When you boot UML, you'll see a line like:
+  When you boot UML, you'll see a line like::
 
 
        mconsole initialized on /home/jdike/.uml/umlNJ32yL/mconsole
@@ -2265,7 +2229,7 @@
 
 
 
-  If you specify a unique machine id one the UML command line, i.e.
+  If you specify a unique machine id one the UML command line, i.e.::
 
 
         umid=debian
@@ -2273,7 +2237,7 @@
 
 
 
-  you'll see this
+  you'll see this::
 
 
        mconsole initialized on /home/jdike/.uml/debian/mconsole
@@ -2282,7 +2246,7 @@
 
 
   That file is the socket that uml_mconsole will use to communicate with
-  UML.  Run it with either the umid or the full path as its argument:
+  UML.  Run it with either the umid or the full path as its argument::
 
 
        host% uml_mconsole debian
@@ -2290,7 +2254,7 @@
 
 
 
-  or
+  or::
 
 
        host% uml_mconsole /home/jdike/.uml/debian/mconsole
@@ -2300,30 +2264,31 @@
 
   You'll get a prompt, at which you can run one of these commands:
 
-  o  version
+  -  version
 
-  o  halt
+  -  halt
 
-  o  reboot
+  -  reboot
 
-  o  config
+  -  config
 
-  o  remove
+  -  remove
 
-  o  sysrq
+  -  sysrq
 
-  o  help
+  -  help
 
-  o  cad
+  -  cad
 
-  o  stop
+  -  stop
 
-  o  go
+  -  go
 
 
-  10.1.  version
+10.1.  version
+--------------
 
-  This takes no arguments.  It prints the UML version.
+  This takes no arguments.  It prints the UML version::
 
 
        (mconsole)  version
@@ -2342,11 +2307,12 @@
 
 
 
-  10.2.  halt and reboot
+10.2.  halt and reboot
+----------------------
 
   These take no arguments.  They shut the machine down immediately, with
   no syncing of disks and no clean shutdown of userspace.  So, they are
-  pretty close to crashing the machine.
+  pretty close to crashing the machine::
 
 
        (mconsole)  halt
@@ -2357,34 +2323,36 @@
 
 
 
-  10.3.  config
+10.3.  config
+-------------
 
   "config" adds a new device to the virtual machine.  Currently the ubd
   and network drivers support this.  It takes one argument, which is the
-  device to add, with the same syntax as the kernel command line.
+  device to add, with the same syntax as the kernel command line::
 
 
 
 
-  (mconsole)
-  config ubd3=/home/jdike/incoming/roots/root_fs_debian22
+	(mconsole)
+	config ubd3=/home/jdike/incoming/roots/root_fs_debian22
 
-  OK
-  (mconsole)  config eth1=mcast
-  OK
+	OK
+	(mconsole)  config eth1=mcast
+	OK
 
 
 
 
 
 
-  10.4.  remove
+10.4.  remove
+-------------
 
   "remove" deletes a device from the system.  Its argument is just the
   name of the device to be removed. The device must be idle in whatever
   sense the driver considers necessary.  In the case of the ubd driver,
   the removed block device must not be mounted, swapped on, or otherwise
-  open, and in the case of the network driver, the device must be down.
+  open, and in the case of the network driver, the device must be down::
 
 
        (mconsole)  remove ubd3
@@ -2397,7 +2365,8 @@
 
 
 
-  10.5.  sysrq
+10.5.  sysrq
+------------
 
   This takes one argument, which is a single letter.  It calls the
   generic kernel's SysRq driver, which does whatever is called for by
@@ -2407,19 +2376,21 @@
 
 
 
-  10.6.  help
+10.6.  help
+-----------
 
   "help" returns a string listing the valid commands and what each one
   does.
 
 
 
-  10.7.  cad
+10.7.  cad
+----------
 
   This invokes the Ctl-Alt-Del action on init.  What exactly this ends
   up doing is up to /etc/inittab.  Normally, it reboots the machine.
   With UML, this is usually not desired, so if a halt would be better,
-  then find the section of inittab that looks like this
+  then find the section of inittab that looks like this::
 
 
        # What to do when CTRL-ALT-DEL is pressed.
@@ -2432,7 +2403,8 @@
 
 
 
-  10.8.  stop
+10.8.  stop
+-----------
 
   This puts the UML in a loop reading mconsole requests until a 'go'
   mconsole command is received. This is very useful for making backups
@@ -2448,7 +2420,8 @@
 
 
 
-  10.9.  go
+10.9.  go
+---------
 
   This resumes a UML after being paused by a 'stop' command. Note that
   when the UML has resumed, TCP connections may have timed out and if
@@ -2460,9 +2433,10 @@
 
 
 
+.. _Kernel_debugging:
 
-
-  11.  Kernel debugging
+11.  Kernel debugging
+=====================
 
 
   Note: The interface that makes debugging, as described here, possible
@@ -2477,15 +2451,16 @@
 
 
   In order to debug the kernel, you need build it from source.  See
-  ``Compiling the kernel and modules''  for information on doing that.
+  :ref:`Compiling_the_kernel_and_modules`  for information on doing that.
   Make sure that you enable CONFIG_DEBUGSYM and CONFIG_PT_PROXY during
-  the config.  These will compile the kernel with -g, and enable the
+  the config.  These will compile the kernel with ``-g``, and enable the
   ptrace proxy so that gdb works with UML, respectively.
 
 
 
 
-  11.1.  Starting the kernel under gdb
+11.1.  Starting the kernel under gdb
+------------------------------------
 
   You can have the kernel running under the control of gdb from the
   beginning by putting 'debug' on the command line.  You will get an
@@ -2498,7 +2473,11 @@
   There is a transcript of a debugging session  here <debug-
   session.html> , with breakpoints being set in the scheduler and in an
   interrupt handler.
-  11.2.  Examining sleeping processes
+
+
+11.2.  Examining sleeping processes
+-----------------------------------
+
 
   Not every bug is evident in the currently running process.  Sometimes,
   processes hang in the kernel when they shouldn't because they've
@@ -2516,7 +2495,7 @@
 
   Now what you do is this:
 
-  o  detach from the current thread
+  -  detach from the current thread::
 
 
        (UML gdb)  det
@@ -2525,7 +2504,7 @@
 
 
 
-  o  attach to the thread you are interested in
+  -  attach to the thread you are interested in::
 
 
        (UML gdb)  att <host pid>
@@ -2534,7 +2513,7 @@
 
 
 
-  o  look at its stack and anything else of interest
+  -  look at its stack and anything else of interest::
 
 
        (UML gdb)  bt
@@ -2545,18 +2524,14 @@
   Note that you can't do anything at this point that requires that a
   process execute, e.g. calling a function
 
-  o  when you're done looking at that process, reattach to the current
-     thread and continue it
+  -  when you're done looking at that process, reattach to the current
+     thread and continue it::
 
 
        (UML gdb)
        att 1
 
 
-
-
-
-
        (UML gdb)
        c
 
@@ -2569,12 +2544,13 @@
 
 
 
-  11.3.  Running ddd on UML
+11.3.  Running ddd on UML
+-------------------------
 
   ddd works on UML, but requires a special kludge.  The process goes
   like this:
 
-  o  Start ddd
+  -  Start ddd::
 
 
        host% ddd linux
@@ -2583,14 +2559,14 @@
 
 
 
-  o  With ps, get the pid of the gdb that ddd started.  You can ask the
+  -  With ps, get the pid of the gdb that ddd started.  You can ask the
      gdb to tell you, but for some reason that confuses things and
      causes a hang.
 
-  o  run UML with 'debug=parent gdb-pid=<pid>' added to the command line
+  -  run UML with 'debug=parent gdb-pid=<pid>' added to the command line
      - it will just sit there after you hit return
 
-  o  type 'att 1' to the ddd gdb and you will see something like
+  -  type 'att 1' to the ddd gdb and you will see something like::
 
 
        0xa013dc51 in __kill ()
@@ -2602,12 +2578,14 @@
 
 
 
-  o  At this point, type 'c', UML will boot up, and you can use ddd just
+  -  At this point, type 'c', UML will boot up, and you can use ddd just
      as you do on any other process.
 
 
 
-  11.4.  Debugging modules
+11.4.  Debugging modules
+------------------------
+
 
   gdb has support for debugging code which is dynamically loaded into
   the process.  This support is what is needed to debug kernel modules
@@ -2629,7 +2607,8 @@
 
 
   First, you must tell it where your modules are.  There is a list in
-  the script that looks like this:
+  the script that looks like this::
+
        set MODULE_PATHS {
        "fat" "/usr/src/uml/linux-2.4.18/fs/fat/fat.o"
        "isofs" "/usr/src/uml/linux-2.4.18/fs/isofs/isofs.o"
@@ -2641,9 +2620,7 @@
 
   You change that to list the names and paths of the modules that you
   are going to debug.  Then you run it from the toplevel directory of
-  your UML pool and it basically tells you what to do:
-
-
+  your UML pool and it basically tells you what to do::
 
 
                    ******** GDB pid is 21903 ********
@@ -2666,7 +2643,7 @@
 
 
   After you run UML and it sits there doing nothing, you hit return at
-  the 'att 1' and continue it:
+  the 'att 1' and continue it::
 
 
        Attaching to program: /home/jdike/linux/2.4/um/./linux, process 1
@@ -2678,63 +2655,48 @@
 
 
   At this point, you debug normally.  When you insmod something, the
-  expect magic will kick in and you'll see something like:
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-   *** Module hostfs loaded ***
-  Breakpoint 1, sys_init_module (name_user=0x805abb0 "hostfs",
-      mod_user=0x8070e00) at module.c:349
-  349             char *name, *n_name, *name_tmp = NULL;
-  (UML gdb)  finish
-  Run till exit from #0  sys_init_module (name_user=0x805abb0 "hostfs",
-      mod_user=0x8070e00) at module.c:349
-  0xa00e2e23 in execute_syscall (r=0xa8140284) at syscall_kern.c:411
-  411             else res = EXECUTE_SYSCALL(syscall, regs);
-  Value returned is $1 = 0
-  (UML gdb)
-  p/x (int)module_list + module_list->size_of_struct
-
-  $2 = 0xa9021054
-  (UML gdb)  symbol-file ./linux
-  Load new symbol table from "./linux"? (y or n) y
-  Reading symbols from ./linux...
-  done.
-  (UML gdb)
-  add-symbol-file /home/jdike/linux/2.4/um/arch/um/fs/hostfs/hostfs.o 0xa9021054
-
-  add symbol table from file "/home/jdike/linux/2.4/um/arch/um/fs/hostfs/hostfs.o" at
-          .text_addr = 0xa9021054
-   (y or n) y
-
-  Reading symbols from /home/jdike/linux/2.4/um/arch/um/fs/hostfs/hostfs.o...
-  done.
-  (UML gdb)  p *module_list
-  $1 = {size_of_struct = 84, next = 0xa0178720, name = 0xa9022de0 "hostfs",
-    size = 9016, uc = {usecount = {counter = 0}, pad = 0}, flags = 1,
-    nsyms = 57, ndeps = 0, syms = 0xa9023170, deps = 0x0, refs = 0x0,
-    init = 0xa90221f0 <init_hostfs>, cleanup = 0xa902222c <exit_hostfs>,
-    ex_table_start = 0x0, ex_table_end = 0x0, persist_start = 0x0,
-    persist_end = 0x0, can_unload = 0, runsize = 0, kallsyms_start = 0x0,
-    kallsyms_end = 0x0,
-    archdata_start = 0x1b855 <Address 0x1b855 out of bounds>,
-    archdata_end = 0xe5890000 <Address 0xe5890000 out of bounds>,
-    kernel_data = 0xf689c35d <Address 0xf689c35d out of bounds>}
-  >> Finished loading symbols for hostfs ...
+  expect magic will kick in and you'll see something like::
+
+
+     *** Module hostfs loaded ***
+    Breakpoint 1, sys_init_module (name_user=0x805abb0 "hostfs",
+        mod_user=0x8070e00) at module.c:349
+    349             char *name, *n_name, *name_tmp = NULL;
+    (UML gdb)  finish
+    Run till exit from #0  sys_init_module (name_user=0x805abb0 "hostfs",
+        mod_user=0x8070e00) at module.c:349
+    0xa00e2e23 in execute_syscall (r=0xa8140284) at syscall_kern.c:411
+    411             else res = EXECUTE_SYSCALL(syscall, regs);
+    Value returned is $1 = 0
+    (UML gdb)
+    p/x (int)module_list + module_list->size_of_struct
+
+    $2 = 0xa9021054
+    (UML gdb)  symbol-file ./linux
+    Load new symbol table from "./linux"? (y or n) y
+    Reading symbols from ./linux...
+    done.
+    (UML gdb)
+    add-symbol-file /home/jdike/linux/2.4/um/arch/um/fs/hostfs/hostfs.o 0xa9021054
+
+    add symbol table from file "/home/jdike/linux/2.4/um/arch/um/fs/hostfs/hostfs.o" at
+            .text_addr = 0xa9021054
+     (y or n) y
+
+    Reading symbols from /home/jdike/linux/2.4/um/arch/um/fs/hostfs/hostfs.o...
+    done.
+    (UML gdb)  p *module_list
+    $1 = {size_of_struct = 84, next = 0xa0178720, name = 0xa9022de0 "hostfs",
+      size = 9016, uc = {usecount = {counter = 0}, pad = 0}, flags = 1,
+      nsyms = 57, ndeps = 0, syms = 0xa9023170, deps = 0x0, refs = 0x0,
+      init = 0xa90221f0 <init_hostfs>, cleanup = 0xa902222c <exit_hostfs>,
+      ex_table_start = 0x0, ex_table_end = 0x0, persist_start = 0x0,
+      persist_end = 0x0, can_unload = 0, runsize = 0, kallsyms_start = 0x0,
+      kallsyms_end = 0x0,
+      archdata_start = 0x1b855 <Address 0x1b855 out of bounds>,
+      archdata_end = 0xe5890000 <Address 0xe5890000 out of bounds>,
+      kernel_data = 0xf689c35d <Address 0xf689c35d out of bounds>}
+    >> Finished loading symbols for hostfs ...
 
 
 
@@ -2744,7 +2706,7 @@
 
 
   Boot the kernel under the debugger and load the module with insmod or
-  modprobe.  With gdb, do:
+  modprobe.  With gdb, do::
 
 
        (UML gdb)  p module_list
@@ -2758,12 +2720,12 @@
   the name fields until find the module you want to debug.  Take the
   address of that structure, and add module.size_of_struct (which in
   2.4.10 kernels is 96 (0x60)) to it.  Gdb can make this hard addition
-  for you :-):
+  for you :-)::
 
 
 
-  (UML gdb)
-  printf "%#x\n", (int)module_list module_list->size_of_struct
+	(UML gdb)
+	printf "%#x\n", (int)module_list module_list->size_of_struct
 
 
 
@@ -2771,7 +2733,7 @@
   The offset from the module start occasionally changes (before 2.4.0,
   it was module.size_of_struct + 4), so it's a good idea to check the
   init and cleanup addresses once in a while, as describe below.  Now
-  do:
+  do::
 
 
        (UML gdb)
@@ -2786,7 +2748,7 @@
   If there's any doubt that you got the offset right, like breakpoints
   appear not to work, or they're appearing in the wrong place, you can
   check it by looking at the module structure.  The init and cleanup
-  fields should look like:
+  fields should look like::
 
 
        init = 0x588066b0 <init_hostfs>, cleanup = 0x588066c0 <exit_hostfs>
@@ -2801,7 +2763,7 @@
 
   When you want to load in a new version of the module, you need to get
   gdb to forget about the old one.  The only way I've found to do that
-  is to tell gdb to forget about all symbols that it knows about:
+  is to tell gdb to forget about all symbols that it knows about::
 
 
        (UML gdb)  symbol-file
@@ -2809,7 +2771,7 @@
 
 
 
-  Then reload the symbols from the kernel binary:
+  Then reload the symbols from the kernel binary::
 
 
        (UML gdb)  symbol-file /path/to/kernel
@@ -2823,17 +2785,19 @@
 
 
 
-  11.5.  Attaching gdb to the kernel
+11.5.  Attaching gdb to the kernel
+----------------------------------
 
   If you don't have the kernel running under gdb, you can attach gdb to
   it later by sending the tracing thread a SIGUSR1.  The first line of
-  the console output identifies its pid:
+  the console output identifies its pid::
+
        tracing thread pid = 20093
 
 
 
 
-  When you send it the signal:
+  When you send it the signal::
 
 
        host% kill -USR1 20093
@@ -2845,7 +2809,7 @@
 
 
   If you have the mconsole compiled into UML, then the mconsole client
-  can be used to start gdb:
+  can be used to start gdb::
 
 
        (mconsole)  (mconsole) config gdb=xterm
@@ -2857,7 +2821,8 @@
 
 
 
-  11.6.  Using alternate debuggers
+11.6.  Using alternate debuggers
+--------------------------------
 
   UML has support for attaching to an already running debugger rather
   than starting gdb itself.  This is present in CVS as of 17 Apr 2001.
@@ -2886,7 +2851,7 @@
   An example of an alternate debugger is strace.  You can strace the
   actual kernel as follows:
 
-  o  Run the following in a shell
+  -  Run the following in a shell::
 
 
        host%
@@ -2894,13 +2859,13 @@
 
 
 
-  o  Run UML with 'debug' and 'gdb-pid=<pid>' with the pid printed out
+  -  Run UML with 'debug' and 'gdb-pid=<pid>' with the pid printed out
      by the previous command
 
-  o  Hit return in the shell, and UML will start running, and strace
+  -  Hit return in the shell, and UML will start running, and strace
      output will start accumulating in the output file.
 
-     Note that this is different from running
+     Note that this is different from running::
 
 
        host% strace ./linux
@@ -2917,95 +2882,57 @@
 
 
 
-  12.  Kernel debugging examples
+12.  Kernel debugging examples
+==============================
 
-  12.1.  The case of the hung fsck
+12.1.  The case of the hung fsck
+--------------------------------
 
   When booting up the kernel, fsck failed, and dropped me into a shell
-  to fix things up.  I ran fsck -y, which hung:
+  to fix things up.  I ran fsck -y, which hung::
 
 
+    Setting hostname uml                    [ OK ]
+    Checking root filesystem
+    /dev/fhd0 was not cleanly unmounted, check forced.
+    Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.
 
+    /dev/fhd0: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.
+	    (i.e., without -a or -p options)
+    [ FAILED ]
 
+    *** An error occurred during the file system check.
+    *** Dropping you to a shell; the system will reboot
+    *** when you leave the shell.
+    Give root password for maintenance
+    (or type Control-D for normal startup):
 
+    [root@uml /root]# fsck -y /dev/fhd0
+    fsck -y /dev/fhd0
+    Parallelizing fsck version 1.14 (9-Jan-1999)
+    e2fsck 1.14, 9-Jan-1999 for EXT2 FS 0.5b, 95/08/09
+    /dev/fhd0 contains a file system with errors, check forced.
+    Pass 1: Checking inodes, blocks, and sizes
+    Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.  Ignore error? yes
 
+    Inode 19780, i_blocks is 1548, should be 540.  Fix? yes
 
+    Pass 2: Checking directory structure
+    Error reading block 49405 (Attempt to read block from filesystem resulted in short read).  Ignore error? yes
 
+    Directory inode 11858, block 0, offset 0: directory corrupted
+    Salvage? yes
 
+    Missing '.' in directory inode 11858.
+    Fix? yes
 
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-  Setting hostname uml                    [ OK ]
-  Checking root filesystem
-  /dev/fhd0 was not cleanly unmounted, check forced.
-  Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.
-
-  /dev/fhd0: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.
-          (i.e., without -a or -p options)
-  [ FAILED ]
-
-  *** An error occurred during the file system check.
-  *** Dropping you to a shell; the system will reboot
-  *** when you leave the shell.
-  Give root password for maintenance
-  (or type Control-D for normal startup):
-
-  [root@uml /root]# fsck -y /dev/fhd0
-  fsck -y /dev/fhd0
-  Parallelizing fsck version 1.14 (9-Jan-1999)
-  e2fsck 1.14, 9-Jan-1999 for EXT2 FS 0.5b, 95/08/09
-  /dev/fhd0 contains a file system with errors, check forced.
-  Pass 1: Checking inodes, blocks, and sizes
-  Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.  Ignore error? yes
-
-  Inode 19780, i_blocks is 1548, should be 540.  Fix? yes
-
-  Pass 2: Checking directory structure
-  Error reading block 49405 (Attempt to read block from filesystem resulted in short read).  Ignore error? yes
-
-  Directory inode 11858, block 0, offset 0: directory corrupted
-  Salvage? yes
-
-  Missing '.' in directory inode 11858.
-  Fix? yes
-
-  Missing '..' in directory inode 11858.
-  Fix? yes
-
-
-
+    Missing '..' in directory inode 11858.
+    Fix? yes
 
 
   The standard drill in this sort of situation is to fire up gdb on the
   signal thread, which, in this case, was pid 1935.  In another window,
-  I run gdb and attach pid 1935.
-
-
+  I run gdb and attach pid 1935::
 
 
        ~/linux/2.3.26/um 1016: gdb linux
@@ -3022,11 +2949,7 @@
        0x100756d9 in __wait4 ()
 
 
-
-
-
-
-  Let's see what's currently running:
+  Let's see what's currently running::
 
 
 
@@ -3041,7 +2964,7 @@
   reason and never woke up.
 
 
-  Let's guess that the last process in the process list is fsck:
+  Let's guess that the last process in the process list is fsck::
 
 
 
@@ -3052,7 +2975,7 @@
 
 
 
-  It is, so let's see what it thinks it's up to:
+  It is, so let's see what it thinks it's up to::
 
 
 
@@ -3068,8 +2991,6 @@
 
 
 
-
-
   The interesting things here are the fact that its .thread.syscall.id
   is __NR_write (see the big switch in arch/um/kernel/syscall_kern.c or
   the defines in include/asm-um/arch/unistd.h), and that it never
@@ -3081,30 +3002,20 @@
   The fact that it never returned from write means that its stack should
   be fairly interesting.  Its pid is 1980 (.thread.extern_pid).  That
   process is being ptraced by the signal thread, so it must be detached
-  before gdb can attach it:
+  before gdb can attach it::
 
 
 
+    (gdb) call detach(1980)
 
-
-
-
-
-
-
-  (gdb) call detach(1980)
-
-  Program received signal SIGSEGV, Segmentation fault.
-  <function called from gdb>
-  The program being debugged stopped while in a function called from GDB.
-  When the function (detach) is done executing, GDB will silently
-  stop (instead of continuing to evaluate the expression containing
-  the function call).
-  (gdb) call detach(1980)
-  $15 = 0
-
-
-
+    Program received signal SIGSEGV, Segmentation fault.
+    <function called from gdb>
+    The program being debugged stopped while in a function called from GDB.
+    When the function (detach) is done executing, GDB will silently
+    stop (instead of continuing to evaluate the expression containing
+    the function call).
+    (gdb) call detach(1980)
+    $15 = 0
 
 
   The first detach segfaults for some reason, and the second one
@@ -3112,7 +3023,7 @@
 
 
   Now I detach from the signal thread, attach to the fsck thread, and
-  look at its stack:
+  look at its stack::
 
 
        (gdb) det
@@ -3152,14 +3063,14 @@
 
 
 
-  The interesting things here are :
+  The interesting things here are:
 
-  o  There are two segfaults on this stack (frames 9 and 14)
+  -  There are two segfaults on this stack (frames 9 and 14)
 
-  o  The first faulting address (frame 11) is 0x50000800
+  -  The first faulting address (frame 11) is 0x50000800::
 
-  (gdb) p (void *)1342179328
-  $16 = (void *) 0x50000800
+	(gdb) p (void *)1342179328
+	$16 = (void *) 0x50000800
 
 
 
@@ -3175,7 +3086,7 @@
 
   However, the more immediate problem is that second segfault and I'm
   going to concentrate on that.  First, I want to see where the fault
-  happened, so I have to go look at the sigcontent struct in frame 8:
+  happened, so I have to go look at the sigcontent struct in frame 8::
 
 
 
@@ -3211,7 +3122,7 @@
 
 
 
-  That's not very useful, so I'll try a more manual method:
+  That's not very useful, so I'll try a more manual method::
 
 
        (gdb) p *((struct sigcontext *) (&sig + 1))
@@ -3224,7 +3135,7 @@
 
 
 
-  The ip is in handle_mm_fault:
+  The ip is in handle_mm_fault::
 
 
        (gdb) p (void *)268480945
@@ -3236,7 +3147,7 @@
 
 
 
-  Specifically, it's in pte_alloc:
+  Specifically, it's in pte_alloc::
 
 
        (gdb) i line *$20
@@ -3249,7 +3160,7 @@
 
 
   To find where in handle_mm_fault this is, I'll jump forward in the
-  code until I see an address in that procedure:
+  code until I see an address in that procedure::
 
 
 
@@ -3286,21 +3197,21 @@
 
 
   Something is apparently wrong with the page tables or vma_structs, so
-  lets go back to frame 11 and have a look at them:
+  lets go back to frame 11 and have a look at them::
 
 
 
-  #11 0x1006c0aa in segv (address=1342179328, is_write=2) at trap_kern.c:50
-  50        handle_mm_fault(current, vma, address, is_write);
-  (gdb) call pgd_offset_proc(vma->vm_mm, address)
-  $22 = (pgd_t *) 0x80a548c
+    #11 0x1006c0aa in segv (address=1342179328, is_write=2) at trap_kern.c:50
+    50        handle_mm_fault(current, vma, address, is_write);
+    (gdb) call pgd_offset_proc(vma->vm_mm, address)
+    $22 = (pgd_t *) 0x80a548c
 
 
 
 
 
   That's pretty bogus.  Page tables aren't supposed to be in process
-  text or data areas.  Let's see what's in the vma:
+  text or data areas.  Let's see what's in the vma::
 
 
        (gdb) p *vma
@@ -3325,12 +3236,9 @@
 
 
 
-
-
   This also pretty bogus.  With all of the 0x80xxxxx and 0xaffffxxx
   addresses, this is looking like a stack was plonked down on top of
-  these structures.  Maybe it's a stack overflow from the next page:
-
+  these structures.  Maybe it's a stack overflow from the next page::
 
 
        (gdb) p vma
@@ -3338,52 +3246,36 @@
 
 
 
-
-
   That's towards the lower quarter of the page, so that would have to
-  have been pretty heavy stack overflow:
-
-
-
-
-
-
-
-
-
-
-
-
-
-
-  (gdb) x/100x $25
-  0x507d2434:     0x507d2434      0x00000000      0x08048000      0x080a4f8c
-  0x507d2444:     0x00000000      0x080a79e0      0x080a8c94      0x080d1000
-  0x507d2454:     0xaffffdb0      0xaffffe63      0xaffffe7a      0xaffffe7a
-  0x507d2464:     0xafffffec      0x00000062      0x0000008a      0x00000000
-  0x507d2474:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2484:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2494:     0x00000000      0x00000000      0x507d2fe0      0x00000000
-  0x507d24a4:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d24b4:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d24c4:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d24d4:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d24e4:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d24f4:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2504:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2514:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2524:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2534:     0x00000000      0x00000000      0x507d25dc      0x00000000
-  0x507d2544:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2554:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2564:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2574:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2584:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d2594:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d25a4:     0x00000000      0x00000000      0x00000000      0x00000000
-  0x507d25b4:     0x00000000      0x00000000      0x00000000      0x00000000
-
-
+  have been pretty heavy stack overflow::
+
+
+    (gdb) x/100x $25
+    0x507d2434:     0x507d2434      0x00000000      0x08048000      0x080a4f8c
+    0x507d2444:     0x00000000      0x080a79e0      0x080a8c94      0x080d1000
+    0x507d2454:     0xaffffdb0      0xaffffe63      0xaffffe7a      0xaffffe7a
+    0x507d2464:     0xafffffec      0x00000062      0x0000008a      0x00000000
+    0x507d2474:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2484:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2494:     0x00000000      0x00000000      0x507d2fe0      0x00000000
+    0x507d24a4:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d24b4:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d24c4:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d24d4:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d24e4:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d24f4:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2504:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2514:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2524:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2534:     0x00000000      0x00000000      0x507d25dc      0x00000000
+    0x507d2544:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2554:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2564:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2574:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2584:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d2594:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d25a4:     0x00000000      0x00000000      0x00000000      0x00000000
+    0x507d25b4:     0x00000000      0x00000000      0x00000000      0x00000000
 
 
 
@@ -3399,65 +3291,53 @@
   on will be somewhat clearer.
 
 
-  12.2.  Episode 2: The case of the hung fsck
+12.2.  Episode 2: The case of the hung fsck
+-------------------------------------------
 
   After setting a trap in the SEGV handler for accesses to the signal
   thread's stack, I reran the kernel.
 
 
-  fsck hung again, this time by hitting the trap:
+  fsck hung again, this time by hitting the trap::
 
 
 
+    Setting hostname uml                            [ OK ]
+    Checking root filesystem
+    /dev/fhd0 contains a file system with errors, check forced.
+    Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.
 
+    /dev/fhd0: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.
+	    (i.e., without -a or -p options)
+    [ FAILED ]
 
+    *** An error occurred during the file system check.
+    *** Dropping you to a shell; the system will reboot
+    *** when you leave the shell.
+    Give root password for maintenance
+    (or type Control-D for normal startup):
 
+    [root@uml /root]# fsck -y /dev/fhd0
+    fsck -y /dev/fhd0
+    Parallelizing fsck version 1.14 (9-Jan-1999)
+    e2fsck 1.14, 9-Jan-1999 for EXT2 FS 0.5b, 95/08/09
+    /dev/fhd0 contains a file system with errors, check forced.
+    Pass 1: Checking inodes, blocks, and sizes
+    Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.  Ignore error? yes
 
+    Pass 2: Checking directory structure
+    Error reading block 49405 (Attempt to read block from filesystem resulted in short read).  Ignore error? yes
 
+    Directory inode 11858, block 0, offset 0: directory corrupted
+    Salvage? yes
 
+    Missing '.' in directory inode 11858.
+    Fix? yes
 
+    Missing '..' in directory inode 11858.
+    Fix? yes
 
-
-
-
-
-
-  Setting hostname uml                            [ OK ]
-  Checking root filesystem
-  /dev/fhd0 contains a file system with errors, check forced.
-  Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.
-
-  /dev/fhd0: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.
-          (i.e., without -a or -p options)
-  [ FAILED ]
-
-  *** An error occurred during the file system check.
-  *** Dropping you to a shell; the system will reboot
-  *** when you leave the shell.
-  Give root password for maintenance
-  (or type Control-D for normal startup):
-
-  [root@uml /root]# fsck -y /dev/fhd0
-  fsck -y /dev/fhd0
-  Parallelizing fsck version 1.14 (9-Jan-1999)
-  e2fsck 1.14, 9-Jan-1999 for EXT2 FS 0.5b, 95/08/09
-  /dev/fhd0 contains a file system with errors, check forced.
-  Pass 1: Checking inodes, blocks, and sizes
-  Error reading block 86894 (Attempt to read block from filesystem resulted in short read) while reading indirect blocks of inode 19780.  Ignore error? yes
-
-  Pass 2: Checking directory structure
-  Error reading block 49405 (Attempt to read block from filesystem resulted in short read).  Ignore error? yes
-
-  Directory inode 11858, block 0, offset 0: directory corrupted
-  Salvage? yes
-
-  Missing '.' in directory inode 11858.
-  Fix? yes
-
-  Missing '..' in directory inode 11858.
-  Fix? yes
-
-  Untested (4127) [100fe44c]: trap_kern.c line 31
+    Untested (4127) [100fe44c]: trap_kern.c line 31
 
 
 
@@ -3465,7 +3345,7 @@
 
   I need to get the signal thread to detach from pid 4127 so that I can
   attach to it with gdb.  This is done by sending it a SIGUSR1, which is
-  caught by the signal thread, which detaches the process:
+  caught by the signal thread, which detaches the process::
 
 
        kill -USR1 4127
@@ -3474,31 +3354,20 @@
 
 
 
-  Now I can run gdb on it:
-
-
-
-
-
-
-
-
-
-
-
-
-
-  ~/linux/2.3.26/um 1034: gdb linux
-  GNU gdb 4.17.0.11 with Linux support
-  Copyright 1998 Free Software Foundation, Inc.
-  GDB is free software, covered by the GNU General Public License, and you are
-  welcome to change it and/or distribute copies of it under certain conditions.
-  Type "show copying" to see the conditions.
-  There is absolutely no warranty for GDB.  Type "show warranty" for details.
-  This GDB was configured as "i386-redhat-linux"...
-  (gdb) att 4127
-  Attaching to program `/home/dike/linux/2.3.26/um/linux', Pid 4127
-  0x10075891 in __libc_nanosleep ()
+  Now I can run gdb on it::
+
+
+    ~/linux/2.3.26/um 1034: gdb linux
+    GNU gdb 4.17.0.11 with Linux support
+    Copyright 1998 Free Software Foundation, Inc.
+    GDB is free software, covered by the GNU General Public License, and you are
+    welcome to change it and/or distribute copies of it under certain conditions.
+    Type "show copying" to see the conditions.
+    There is absolutely no warranty for GDB.  Type "show warranty" for details.
+    This GDB was configured as "i386-redhat-linux"...
+    (gdb) att 4127
+    Attaching to program `/home/dike/linux/2.3.26/um/linux', Pid 4127
+    0x10075891 in __libc_nanosleep ()
 
 
 
@@ -3506,7 +3375,7 @@
 
   The backtrace shows that it was in a write and that the fault address
   (address in frame 3) is 0x50000800, which is right in the middle of
-  the signal thread's stack page:
+  the signal thread's stack page::
 
 
        (gdb) bt
@@ -3540,58 +3409,48 @@
 
 
 
-
-
   Going up the stack to the segv_handler frame and looking at where in
   the code the access happened shows that it happened near line 110 of
-  block_dev.c:
-
-
-
-
-
-
-
-
-
-  (gdb) up
-  #1  0x1007584d in __sleep (seconds=1000000)
-      at ../sysdeps/unix/sysv/linux/sleep.c:78
-  ../sysdeps/unix/sysv/linux/sleep.c:78: No such file or directory.
-  (gdb)
-  #2  0x1006ce9a in stop () at user_util.c:191
-  191       while(1) sleep(1000000);
-  (gdb)
-  #3  0x1006bf88 in segv (address=1342179328, is_write=2) at trap_kern.c:31
-  31          KERN_UNTESTED();
-  (gdb)
-  #4  0x1006c628 in segv_handler (sc=0x5006eaf8) at trap_user.c:174
-  174       segv(sc->cr2, sc->err & 2);
-  (gdb) p *sc
-  $1 = {gs = 0, __gsh = 0, fs = 0, __fsh = 0, es = 43, __esh = 0, ds = 43,
-    __dsh = 0, edi = 1342179328, esi = 134973440, ebp = 1342631484,
-    esp = 1342630864, ebx = 256, edx = 0, ecx = 256, eax = 1024, trapno = 14,
-    err = 6, eip = 268550834, cs = 35, __csh = 0, eflags = 66070,
-    esp_at_signal = 1342630864, ss = 43, __ssh = 0, fpstate = 0x0, oldmask = 0,
-    cr2 = 1342179328}
-  (gdb) p (void *)268550834
-  $2 = (void *) 0x1001c2b2
-  (gdb) i sym $2
-  block_write + 1090 in section .text
-  (gdb) i line *$2
-  Line 209 of "/home/dike/linux/2.3.26/um/include/asm/arch/string.h"
-     starts at address 0x1001c2a1 <block_write+1073>
-     and ends at 0x1001c2bf <block_write+1103>.
-  (gdb) i line *0x1001c2c0
-  Line 110 of "block_dev.c" starts at address 0x1001c2bf <block_write+1103>
-     and ends at 0x1001c2e3 <block_write+1139>.
-
-
+  block_dev.c::
+
+
+
+    (gdb) up
+    #1  0x1007584d in __sleep (seconds=1000000)
+	at ../sysdeps/unix/sysv/linux/sleep.c:78
+    ../sysdeps/unix/sysv/linux/sleep.c:78: No such file or directory.
+    (gdb)
+    #2  0x1006ce9a in stop () at user_util.c:191
+    191       while(1) sleep(1000000);
+    (gdb)
+    #3  0x1006bf88 in segv (address=1342179328, is_write=2) at trap_kern.c:31
+    31          KERN_UNTESTED();
+    (gdb)
+    #4  0x1006c628 in segv_handler (sc=0x5006eaf8) at trap_user.c:174
+    174       segv(sc->cr2, sc->err & 2);
+    (gdb) p *sc
+    $1 = {gs = 0, __gsh = 0, fs = 0, __fsh = 0, es = 43, __esh = 0, ds = 43,
+	__dsh = 0, edi = 1342179328, esi = 134973440, ebp = 1342631484,
+	esp = 1342630864, ebx = 256, edx = 0, ecx = 256, eax = 1024, trapno = 14,
+	err = 6, eip = 268550834, cs = 35, __csh = 0, eflags = 66070,
+	esp_at_signal = 1342630864, ss = 43, __ssh = 0, fpstate = 0x0, oldmask = 0,
+	cr2 = 1342179328}
+    (gdb) p (void *)268550834
+    $2 = (void *) 0x1001c2b2
+    (gdb) i sym $2
+    block_write + 1090 in section .text
+    (gdb) i line *$2
+    Line 209 of "/home/dike/linux/2.3.26/um/include/asm/arch/string.h"
+	starts at address 0x1001c2a1 <block_write+1073>
+	and ends at 0x1001c2bf <block_write+1103>.
+    (gdb) i line *0x1001c2c0
+    Line 110 of "block_dev.c" starts at address 0x1001c2bf <block_write+1103>
+	and ends at 0x1001c2e3 <block_write+1139>.
 
 
 
   Looking at the source shows that the fault happened during a call to
-  copy_from_user to copy the data into the kernel:
+  copy_from_user to copy the data into the kernel::
 
 
        107             count -= chars;
@@ -3601,10 +3460,8 @@
 
 
 
-
-
   p is the pointer which must contain 0x50000800, since buf contains
-  0x80b8800 (frame 8 above).  It is defined as:
+  0x80b8800 (frame 8 above).  It is defined as::
 
 
                        p = offset + bh->b_data;
@@ -3615,24 +3472,22 @@
 
   I need to figure out what bh is, and it just so happens that bh is
   passed as an argument to mark_buffer_uptodate and mark_buffer_dirty a
-  few lines later, so I do a little disassembly:
+  few lines later, so I do a little disassembly::
 
 
-
-
-  (gdb) disas 0x1001c2bf 0x1001c2e0
-  Dump of assembler code from 0x1001c2bf to 0x1001c2d0:
-  0x1001c2bf <block_write+1103>:  addl   %eax,0xc(%ebp)
-  0x1001c2c2 <block_write+1106>:  movl   0xfffffdd4(%ebp),%edx
-  0x1001c2c8 <block_write+1112>:  btsl   $0x0,0x18(%edx)
-  0x1001c2cd <block_write+1117>:  btsl   $0x1,0x18(%edx)
-  0x1001c2d2 <block_write+1122>:  sbbl   %ecx,%ecx
-  0x1001c2d4 <block_write+1124>:  testl  %ecx,%ecx
-  0x1001c2d6 <block_write+1126>:  jne    0x1001c2e3 <block_write+1139>
-  0x1001c2d8 <block_write+1128>:  pushl  $0x0
-  0x1001c2da <block_write+1130>:  pushl  %edx
-  0x1001c2db <block_write+1131>:  call   0x1001819c <__mark_buffer_dirty>
-  End of assembler dump.
+    (gdb) disas 0x1001c2bf 0x1001c2e0
+    Dump of assembler code from 0x1001c2bf to 0x1001c2d0:
+    0x1001c2bf <block_write+1103>:  addl   %eax,0xc(%ebp)
+    0x1001c2c2 <block_write+1106>:  movl   0xfffffdd4(%ebp),%edx
+    0x1001c2c8 <block_write+1112>:  btsl   $0x0,0x18(%edx)
+    0x1001c2cd <block_write+1117>:  btsl   $0x1,0x18(%edx)
+    0x1001c2d2 <block_write+1122>:  sbbl   %ecx,%ecx
+    0x1001c2d4 <block_write+1124>:  testl  %ecx,%ecx
+    0x1001c2d6 <block_write+1126>:  jne    0x1001c2e3 <block_write+1139>
+    0x1001c2d8 <block_write+1128>:  pushl  $0x0
+    0x1001c2da <block_write+1130>:  pushl  %edx
+    0x1001c2db <block_write+1131>:  call   0x1001819c <__mark_buffer_dirty>
+    End of assembler dump.
 
 
 
@@ -3640,7 +3495,7 @@
 
   At that point, bh is in %edx (address 0x1001c2da), which is calculated
   at 0x1001c2c2 as %ebp + 0xfffffdd4, so I figure exactly what that is,
-  taking %ebp from the sigcontext_struct above:
+  taking %ebp from the sigcontext_struct above::
 
 
        (gdb) p (void *)1342631484
@@ -3657,7 +3512,7 @@
 
 
   Now, I look at the structure to see what's in it, and particularly,
-  what its b_data field contains:
+  what its b_data field contains::
 
 
        (gdb) p *((struct buffer_head *)0x50100200)
@@ -3682,18 +3537,18 @@
 
   The b_page field is a pointer to the page_struct representing the
   0x50000000 page.  Looking at it shows the kernel's idea of the state
-  of that page:
+  of that page::
 
 
 
-  (gdb) p *$13.b_page
-  $17 = {list = {next = 0x50004a5c, prev = 0x100c5174}, mapping = 0x0,
-    index = 0, next_hash = 0x0, count = {counter = 1}, flags = 132, lru = {
-      next = 0x50008460, prev = 0x50019350}, wait = {
-      lock = <optimized out or zero length>, task_list = {next = 0x50004024,
-        prev = 0x50004024}, __magic = 1342193708, __creator = 0},
-    pprev_hash = 0x0, buffers = 0x501002c0, virtual = 1342177280,
-    zone = 0x100c5160}
+    (gdb) p *$13.b_page
+    $17 = {list = {next = 0x50004a5c, prev = 0x100c5174}, mapping = 0x0,
+	index = 0, next_hash = 0x0, count = {counter = 1}, flags = 132, lru = {
+	next = 0x50008460, prev = 0x50019350}, wait = {
+	lock = <optimized out or zero length>, task_list = {next = 0x50004024,
+	    prev = 0x50004024}, __magic = 1342193708, __creator = 0},
+	pprev_hash = 0x0, buffers = 0x501002c0, virtual = 1342177280,
+	zone = 0x100c5160}
 
 
 
@@ -3702,7 +3557,7 @@
   Some sanity-checking: the virtual field shows the "virtual" address of
   this page, which in this kernel is the same as its "physical" address,
   and the page_struct itself should be mem_map[0], since it represents
-  the first page of memory:
+  the first page of memory::
 
 
 
@@ -3719,7 +3574,7 @@
 
 
   Now to check out the page_struct itself.  In particular, the flags
-  field shows whether the page is considered free or not:
+  field shows whether the page is considered free or not::
 
 
        (gdb) p (void *)132
@@ -3739,7 +3594,7 @@
 
 
   In my setup_arch procedure, I have the following code which looks just
-  fine:
+  fine::
 
 
 
@@ -3762,7 +3617,7 @@
 
 
   Stepping into init_bootmem, and looking at bootmem_map before looking
-  at what it contains shows the following:
+  at what it contains shows the following::
 
 
 
@@ -3788,18 +3643,20 @@
 
 
 
-  13.  What to do when UML doesn't work
+13.  What to do when UML doesn't work
+=====================================
 
 
 
 
-  13.1.  Strange compilation errors when you build from source
+13.1.  Strange compilation errors when you build from source
+------------------------------------------------------------
 
   As of test11, it is necessary to have "ARCH=um" in the environment or
   on the make command line for all steps in building UML, including
   clean, distclean, or mrproper, config, menuconfig, or xconfig, dep,
   and linux.  If you forget for any of them, the i386 build seems to
-  contaminate the UML build.  If this happens, start from scratch with
+  contaminate the UML build.  If this happens, start from scratch with::
 
 
        host%
@@ -3811,7 +3668,7 @@
   and repeat the build process with ARCH=um on all the steps.
 
 
-  See ``Compiling the kernel and modules''  for more details.
+  See :ref:`Compiling_the_kernel_and_modules`  for more details.
 
 
   Another cause of strange compilation errors is building UML in
@@ -3824,11 +3681,11 @@
 
 
 
-  13.3.  A variety of panics and hangs with /tmp on a reiserfs  filesys-
-  tem
+13.3.  A variety of panics and hangs with /tmp on a reiserfs filesystem
+-----------------------------------------------------------------------
 
   I saw this on reiserfs 3.5.21 and it seems to be fixed in 3.5.27.
-  Panics preceded by
+  Panics preceded by::
 
 
        Detaching pid nnnn
@@ -3854,17 +3711,19 @@
 
 
 
-  13.5.  UML doesn't work when /tmp is an NFS filesystem
+13.5.  UML doesn't work when /tmp is an NFS filesystem
+------------------------------------------------------
 
   This seems to be a similar situation with the ReiserFS problem above.
   Some versions of NFS seems not to handle mmap correctly, which UML
   depends on.  The workaround is have /tmp be a non-NFS directory.
 
 
-  13.6.  UML hangs on boot when compiled with gprof support
+13.6.  UML hangs on boot when compiled with gprof support
+---------------------------------------------------------
 
   If you build UML with gprof support and, early in the boot, it does
-  this
+  this::
 
 
        kernel BUG at page_alloc.c:100!
@@ -3878,10 +3737,11 @@
 
 
 
-  13.7.  syslogd dies with a SIGTERM on startup
+13.7.  syslogd dies with a SIGTERM on startup
+---------------------------------------------
 
   The exact boot error depends on the distribution that you're booting,
-  but Debian produces this:
+  but Debian produces this::
 
 
        /etc/rc2.d/S10sysklogd: line 49:    93 Terminated
@@ -3897,17 +3757,18 @@
 
 
 
-  13.8.  TUN/TAP networking doesn't work on a 2.4 host
+13.8.  TUN/TAP networking doesn't work on a 2.4 host
+----------------------------------------------------
 
   There are a couple of problems which were
   <http://www.geocrawler.com/lists/3/SourceForge/597/0/> name="pointed
   out">  by Tim Robinson <timro at trkr dot net>
 
-  o  It doesn't work on hosts running 2.4.7 (or thereabouts) or earlier.
+  -  It doesn't work on hosts running 2.4.7 (or thereabouts) or earlier.
      The fix is to upgrade to something more recent and then read the
      next item.
 
-  o  If you see
+  -  If you see::
 
 
        File descriptor in bad state
@@ -3921,8 +3782,8 @@
 
 
 
-  13.9.  You can network to the host but not to other machines on the
-  net
+13.9.  You can network to the host but not to other machines on the net
+=======================================================================
 
   If you can connect to the host, and the host can connect to UML, but
   you cannot connect to any other machines, then you may need to enable
@@ -3930,7 +3791,7 @@
   using private IP addresses (192.168.x.x or 10.x.x.x) for host/UML
   networking, rather than the public address space that your host is
   connected to.  UML does not enable IP Masquerading, so you will need
-  to create a static rule to enable it:
+  to create a static rule to enable it::
 
 
        host%
@@ -3948,7 +3809,7 @@
 
 
   If you can reach the local net, but not the outside Internet, then
-  that is usually a routing problem.  The UML needs a default route:
+  that is usually a routing problem.  The UML needs a default route::
 
 
        UML#
@@ -3972,7 +3833,8 @@
 
 
 
-  13.10.  I have no root and I want to scream
+13.10.  I have no root and I want to scream
+===========================================
 
   Thanks to Birgit Wahlich for telling me about this strange one.  It
   turns out that there's a limit of six environment variables on the
@@ -3987,14 +3849,16 @@
 
 
 
-  13.11.  UML build conflict between ptrace.h and ucontext.h
+13.11.  UML build conflict between ptrace.h and ucontext.h
+==========================================================
 
   On some older systems, /usr/include/asm/ptrace.h and
   /usr/include/sys/ucontext.h define the same names.  So, when they're
   included together, the defines from one completely mess up the parsing
-  of the other, producing errors like:
+  of the other, producing errors like::
+
        /usr/include/sys/ucontext.h:47: parse error before
-       `10'
+       `10`
 
 
 
@@ -4007,7 +3871,8 @@
 
 
 
-  13.12.  The UML BogoMips is exactly half the host's BogoMips
+13.12.  The UML BogoMips is exactly half the host's BogoMips
+------------------------------------------------------------
 
   On i386 kernels, there are two ways of running the loop that is used
   to calculate the BogoMips rating, using the TSC if it's there or using
@@ -4019,15 +3884,17 @@
 
 
 
-  13.13.  When you run UML, it immediately segfaults
+13.13.  When you run UML, it immediately segfaults
+--------------------------------------------------
 
   If the host is configured with the 2G/2G address space split, that's
-  why.  See ``UML on 2G/2G hosts''  for the details on getting UML to
+  why.  See ref:`UML_on_2G/2G_hosts`  for the details on getting UML to
   run on your host.
 
 
 
-  13.14.  xterms appear, then immediately disappear
+13.14.  xterms appear, then immediately disappear
+-------------------------------------------------
 
   If you're running an up to date kernel with an old release of
   uml_utilities, the port-helper program will not work properly, so
@@ -4039,7 +3906,8 @@
 
 
 
-  13.15.  Any other panic, hang, or strange behavior
+13.15.  Any other panic, hang, or strange behavior
+--------------------------------------------------
 
   If you're seeing truly strange behavior, such as hangs or panics that
   happen in random places, or you try running the debugger to see what's
@@ -4057,9 +3925,13 @@
   it and that a fix is imminent.
 
 
-  If you want to be super-helpful, read ``Diagnosing Problems'' and
+  If you want to be super-helpful, read :ref:`Diagnosing_Problems` and
   follow the instructions contained therein.
-  14.  Diagnosing Problems
+
+.. _Diagnosing_Problems:
+
+14.  Diagnosing Problems
+========================
 
 
   If you get UML to crash, hang, or otherwise misbehave, you should
@@ -4074,21 +3946,22 @@
 
   For any diagnosis, you're going to need to build a debugging kernel.
   The binaries from this site aren't debuggable.  If you haven't done
-  this before, read about ``Compiling the kernel and modules''  and
-  ``Kernel debugging''  UML first.
+  this before, read about :ref:`Compiling_the_kernel_and_modules`  and
+  :ref:`Kernel_debugging` UML first.
 
 
-  14.1.  Case 1 : Normal kernel panics
+14.1.  Case 1 : Normal kernel panics
+------------------------------------
 
   The most common case is for a normal thread to panic.  To debug this,
   you will need to run it under the debugger (add 'debug' to the command
   line).  An xterm will start up with gdb running inside it.  Continue
-  it when it stops in start_kernel and make it crash.  Now ^C gdb and
+  it when it stops in start_kernel and make it crash.  Now ``^C gdb`` and
 
 
   If the panic was a "Kernel mode fault", then there will be a segv
   frame on the stack and I'm going to want some more information.  The
-  stack might look something like this:
+  stack might look something like this::
 
 
        (UML gdb)  backtrace
@@ -4107,7 +3980,7 @@
 
 
   I'm going to want to see the symbol and line information for the value
-  of ip in the segv frame.  In this case, you would do the following:
+  of ip in the segv frame.  In this case, you would do the following::
 
 
        (UML gdb)  i sym 268849158
@@ -4115,7 +3988,7 @@
 
 
 
-  and
+  and::
 
 
        (UML gdb)  i line *268849158
@@ -4128,7 +4001,8 @@
   to get that information from the faulting ip.
 
 
-  14.2.  Case 2 : Tracing thread panics
+14.2.  Case 2 : Tracing thread panics
+-------------------------------------
 
   The less common and more painful case is when the tracing thread
   panics.  In this case, the kernel debugger will be useless because it
@@ -4136,7 +4010,7 @@
   do is get a backtrace from the tracing thread.  This is done by
   figuring out what its pid is, firing up gdb, and attaching it to that
   pid.  You can figure out the tracing thread pid by looking at the
-  first line of the console output, which will look like this:
+  first line of the console output, which will look like this::
 
 
        tracing thread pid = 15851
@@ -4145,7 +4019,7 @@
 
 
   or by running ps on the host and finding the line that looks like
-  this:
+  this::
 
 
        jdike 15851 4.5 0.4 132568 1104 pts/0 S 21:34 0:05 ./linux [(tracing thread)]
@@ -4164,7 +4038,7 @@
   14.3.  Case 3 : Tracing thread panics caused by other threads
 
   However, there are cases where the misbehavior of another thread
-  caused the problem.  The most common panic of this type is:
+  caused the problem.  The most common panic of this type is::
 
 
        wait_for_stop failed to wait for  <pid>  to stop with  <signal number>
@@ -4177,7 +4051,7 @@
   debugger is defunct and without some fancy footwork, another gdb can't
   attach to it.  So, this is how the fancy footwork goes:
 
-  In a shell:
+  In a shell::
 
 
        host% kill -STOP pid
@@ -4185,7 +4059,7 @@
 
 
 
-  Run gdb on the tracing thread as described in case 2 and do:
+  Run gdb on the tracing thread as described in case 2 and do::
 
 
        (host gdb)  call detach(pid)
@@ -4193,7 +4067,7 @@
 
   If you get a segfault, do it again.  It always works the second time.
 
-  Detach from the tracing thread and attach to that other thread:
+  Detach from the tracing thread and attach to that other thread::
 
 
        (host gdb)  detach
@@ -4209,7 +4083,7 @@
 
 
   If gdb hangs when attaching to that process, go back to a shell and
-  do:
+  do::
 
 
        host%
@@ -4218,7 +4092,7 @@
 
 
 
-  And then get the backtrace:
+  And then get the backtrace::
 
 
        (host gdb)  backtrace
@@ -4227,13 +4101,14 @@
 
 
 
-  14.4.  Case 4 : Hangs
+14.4.  Case 4 : Hangs
+---------------------
 
   Hangs seem to be fairly rare, but they sometimes happen.  When a hang
   happens, we need a backtrace from the offending process.  Run the
   kernel debugger as described in case 1 and get a backtrace.  If the
   current process is not the idle thread, then send in the backtrace.
-  You can tell that it's the idle thread if the stack looks like this:
+  You can tell that it's the idle thread if the stack looks like this::
 
 
        #0  0x100b1401 in __libc_nanosleep ()
@@ -4257,7 +4132,8 @@
 
 
 
-  15.  Thanks
+15.  Thanks
+===========
 
 
   A number of people have helped this project in various ways, and this
@@ -4274,20 +4150,21 @@
   bookkeeping lapses and I forget about contributions.
 
 
-  15.1.  Code and Documentation
+15.1.  Code and Documentation
+-----------------------------
 
   Rusty Russell <rusty at linuxcare.com.au>  -
 
-  o  wrote the  HOWTO <http://user-mode-
+  -  wrote the  HOWTO <http://user-mode-
      linux.sourceforge.net/UserModeLinux-HOWTO.html>
 
-  o  prodded me into making this project official and putting it on
+  -  prodded me into making this project official and putting it on
      SourceForge
 
-  o  came up with the way cool UML logo <http://user-mode-
+  -  came up with the way cool UML logo <http://user-mode-
      linux.sourceforge.net/uml-small.png>
 
-  o  redid the config process
+  -  redid the config process
 
 
   Peter Moulder <reiter at netspace.net.au>  - Fixed my config and build
@@ -4296,18 +4173,18 @@
 
   Bill Stearns <wstearns at pobox.com>  -
 
-  o  HOWTO updates
+  -  HOWTO updates
 
-  o  lots of bug reports
+  -  lots of bug reports
 
-  o  lots of testing
+  -  lots of testing
 
-  o  dedicated a box (uml.ists.dartmouth.edu) to support UML development
+  -  dedicated a box (uml.ists.dartmouth.edu) to support UML development
 
-  o  wrote the mkrootfs script, which allows bootable filesystems of
+  -  wrote the mkrootfs script, which allows bootable filesystems of
      RPM-based distributions to be cranked out
 
-  o  cranked out a large number of filesystems with said script
+  -  cranked out a large number of filesystems with said script
 
 
   Jim Leu <jleu at mindspring.com>  - Wrote the virtual ethernet driver
@@ -4375,176 +4252,180 @@
 
   David Coulson <http://davidcoulson.net>  -
 
-  o  Set up the usermodelinux.org <http://usermodelinux.org>  site,
+  -  Set up the usermodelinux.org <http://usermodelinux.org>  site,
      which is a great way of keeping the UML user community on top of
      UML goings-on.
 
-  o  Site documentation and updates
+  -  Site documentation and updates
 
-  o  Nifty little UML management daemon  UMLd
+  -  Nifty little UML management daemon  UMLd
      <http://uml.openconsultancy.com/umld/>
 
-  o  Lots of testing and bug reports
+  -  Lots of testing and bug reports
 
 
 
 
-  15.2.  Flushing out bugs
+15.2.  Flushing out bugs
+------------------------
 
 
 
-  o  Yuri Pudgorodsky
+  -  Yuri Pudgorodsky
 
-  o  Gerald Britton
+  -  Gerald Britton
 
-  o  Ian Wehrman
+  -  Ian Wehrman
 
-  o  Gord Lamb
+  -  Gord Lamb
 
-  o  Eugene Koontz
+  -  Eugene Koontz
 
-  o  John H. Hartman
+  -  John H. Hartman
 
-  o  Anders Karlsson
+  -  Anders Karlsson
 
-  o  Daniel Phillips
+  -  Daniel Phillips
 
-  o  John Fremlin
+  -  John Fremlin
 
-  o  Rainer Burgstaller
+  -  Rainer Burgstaller
 
-  o  James Stevenson
+  -  James Stevenson
 
-  o  Matt Clay
+  -  Matt Clay
 
-  o  Cliff Jefferies
+  -  Cliff Jefferies
 
-  o  Geoff Hoff
+  -  Geoff Hoff
 
-  o  Lennert Buytenhek
+  -  Lennert Buytenhek
 
-  o  Al Viro
+  -  Al Viro
 
-  o  Frank Klingenhoefer
+  -  Frank Klingenhoefer
 
-  o  Livio Baldini Soares
+  -  Livio Baldini Soares
 
-  o  Jon Burgess
+  -  Jon Burgess
 
-  o  Petru Paler
+  -  Petru Paler
 
-  o  Paul
+  -  Paul
 
-  o  Chris Reahard
+  -  Chris Reahard
 
-  o  Sverker Nilsson
+  -  Sverker Nilsson
 
-  o  Gong Su
+  -  Gong Su
 
-  o  johan verrept
+  -  johan verrept
 
-  o  Bjorn Eriksson
+  -  Bjorn Eriksson
 
-  o  Lorenzo Allegrucci
+  -  Lorenzo Allegrucci
 
-  o  Muli Ben-Yehuda
+  -  Muli Ben-Yehuda
 
-  o  David Mansfield
+  -  David Mansfield
 
-  o  Howard Goff
+  -  Howard Goff
 
-  o  Mike Anderson
+  -  Mike Anderson
 
-  o  John Byrne
+  -  John Byrne
 
-  o  Sapan J. Batia
+  -  Sapan J. Batia
 
-  o  Iris Huang
+  -  Iris Huang
 
-  o  Jan Hudec
+  -  Jan Hudec
 
-  o  Voluspa
+  -  Voluspa
 
 
 
 
-  15.3.  Buglets and clean-ups
+15.3.  Buglets and clean-ups
+----------------------------
 
 
 
-  o  Dave Zarzycki
+  -  Dave Zarzycki
 
-  o  Adam Lazur
+  -  Adam Lazur
 
-  o  Boria Feigin
+  -  Boria Feigin
 
-  o  Brian J. Murrell
+  -  Brian J. Murrell
 
-  o  JS
+  -  JS
 
-  o  Roman Zippel
+  -  Roman Zippel
 
-  o  Wil Cooley
+  -  Wil Cooley
 
-  o  Ayelet Shemesh
+  -  Ayelet Shemesh
 
-  o  Will Dyson
+  -  Will Dyson
 
-  o  Sverker Nilsson
+  -  Sverker Nilsson
 
-  o  dvorak
+  -  dvorak
 
-  o  v.naga srinivas
+  -  v.naga srinivas
 
-  o  Shlomi Fish
+  -  Shlomi Fish
 
-  o  Roger Binns
+  -  Roger Binns
 
-  o  johan verrept
+  -  johan verrept
 
-  o  MrChuoi
+  -  MrChuoi
 
-  o  Peter Cleve
+  -  Peter Cleve
 
-  o  Vincent Guffens
+  -  Vincent Guffens
 
-  o  Nathan Scott
+  -  Nathan Scott
 
-  o  Patrick Caulfield
+  -  Patrick Caulfield
 
-  o  jbearce
+  -  jbearce
 
-  o  Catalin Marinas
+  -  Catalin Marinas
 
-  o  Shane Spencer
+  -  Shane Spencer
 
-  o  Zou Min
+  -  Zou Min
 
 
-  o  Ryan Boder
+  -  Ryan Boder
 
-  o  Lorenzo Colitti
+  -  Lorenzo Colitti
 
-  o  Gwendal Grignou
+  -  Gwendal Grignou
 
-  o  Andre' Breiler
+  -  Andre' Breiler
 
-  o  Tsutomu Yasuda
+  -  Tsutomu Yasuda
 
 
 
-  15.4.  Case Studies
+15.4.  Case Studies
+-------------------
 
 
-  o  Jon Wright
+  -  Jon Wright
 
-  o  William McEwan
+  -  William McEwan
 
-  o  Michael Richardson
+  -  Michael Richardson
 
 
 
-  15.5.  Other contributions
+15.5.  Other contributions
+--------------------------
 
 
   Bill Carr <Bill.Carr at compaq.com>  made the Red Hat mkrootfs script
@@ -4575,15 +4456,3 @@
   server jailed inside UML.  It's available from the download
   <http://user-mode-linux.sourceforge.net/dl-sf.html>  page in the Jail
   Filesystems section.
-
-
-
-
-
-
-
-
-
-
-
-
-- 
2.24.1

