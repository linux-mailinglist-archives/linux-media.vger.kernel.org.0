Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B968D339EAF
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbhCMOwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhCMOvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:51:48 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327E9C061574
        for <linux-media@vger.kernel.org>; Sat, 13 Mar 2021 06:51:48 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id m7so6134617qtq.11
        for <linux-media@vger.kernel.org>; Sat, 13 Mar 2021 06:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=H0C4X24D3kuU76q6uKQU00KMZsY2eN3yhU4UepqH3gY=;
        b=pqtS3M/t92j41vdLyDalmI3jp67tucaVnosDAdZDool565IlqpVC9d6nK1SYVSS+UG
         +7sh4jyBRNosTFP3JW6i80jtWE+h1k683FLfsgbwvBRWZRy0BYkSyU4fToOKZQ/kJnGw
         EeV5bmvpXfts02nm5ixxrndiQzaNwLalr9HFnz6dl3Ecn8sphJ2mQViU2OG9yQ8YGzvq
         e0hE2DYvbL8IvI/GvDPpY+Jx2LABCPe4HlDB2kTrbttWueeDyiicA3q4XjrxPmjKD0wf
         cLQC44gszPr2glFQ7zzSOARuymB9CZtI75LD+VqKfJlLWzvg5J0pJMaJOLwxmj1Tj6Xe
         EU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=H0C4X24D3kuU76q6uKQU00KMZsY2eN3yhU4UepqH3gY=;
        b=At2EZXx2/RKJIQQ36VQ9WuY6uzcqda4et9fhB2gU/7tFwM3qdFXOxhdHyBJt8V/M5q
         OzyMNVOAZ6dBDxzigpZ7e0stiGfq/ryWvv/OGFnoA/sAEg1e164YMEawULB8Bd69DvZr
         aCjtTX3ikxr0EB98LprXqirtBKWC/HJPXmHONR5vmwtRsQifdCdGYp2PbLaKECdUBt25
         s0Ja24SfuDBTgPX76rcXjv42ufjqrHKwpC4QeNBJjZOUBJhQIYeCD+KVpx/X+0c8uueZ
         gcLRChljvrzmEGdDbUXlASajw8xAxHWRT72io2SJ8RngUGOQnlPIs+A62fXhWNQuV8Ml
         pB3A==
X-Gm-Message-State: AOAM5322FycDnm/5tOerMeBpQKUoOfIfI98bUHdPz6RvYYXsXKrUZET5
        o1R6kB3YrJAmmrY5G7aGTHTZLJFOhQ+rjA==
X-Google-Smtp-Source: ABdhPJzeCem5c+5kfGfH9utwXFjkylfuRPEXicCDRnjAPeaqlyaGKZATPK9foWq3WIhRnrbW/SN+jw==
X-Received: by 2002:ac8:66d6:: with SMTP id m22mr16203771qtp.56.1615647107084;
        Sat, 13 Mar 2021 06:51:47 -0800 (PST)
Received: from [192.168.80.12] ([24.105.64.120])
        by smtp.gmail.com with ESMTPSA id c5sm6862390qkl.21.2021.03.13.06.51.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Mar 2021 06:51:46 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   Vincent Fortier <th0ma7@gmail.com>
Subject: [PATCH 1/2] media_build: CROSS_COMPILE variable environment and
 disable rmmod.pl
Message-ID: <28d6325e-9fd6-f442-bac3-4f5b2b529c48@gmail.com>
Date:   Sat, 13 Mar 2021 09:51:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

The current framework seems to presume the build is occurring over a 
native environment by default.  In order for it to work using 
cross-compiler toolset, calls to scripts/rmmod.pl needs to be removed 
(in lack of finding another option) as otherwise it fails over various 
insmod,rmmod command execution which are totally unecessary.  The 
following patch 1/2 disable this by adding a CROSS_COMPILE variable 
environment.  This allows calls to cross-compile the media drivers using 
the spksrc SynoCommunity framework for the various media_build stages using:

$(RUN) CROSS_COMPILE=y make allyesconfig
$(RUN) LDFLAGS="" CROSS_COMPILE=y make -j`nproc` MAKEFLAGS=
$(RUN) CROSS_COMPILE=y make install DESTDIR=$(INSTALL_DIR)/$(INSTALL_PREFIX)

Signed-off-by: Vincent Fortier<th0ma7@gmail.com>

---

diff -uprN ../linuxtv.orig/v4l/Makefile v4l/Makefile
--- ../linuxtv.orig/v4l/Makefile    2021-02-08 10:24:43.000000000 +0000
+++ v4l/Makefile    2021-03-13 14:39:19.674250245 +0000
@@ -51,13 +51,17 @@ default:: prepare
      @echo Kernel build directory is $(OUTDIR)
      $(MAKE) -C ../linux apply_patches
      $(MAKE) -C $(OUTDIR) M=$(PWD) $(MYCFLAGS) modules
+ifneq ($(strip $(CROSS_COMPILE)),y)
      ./scripts/rmmod.pl check
+endif
  #    $(MAKE) checkpatch

  mismatch:: prepare
      @echo Kernel build directory is $(OUTDIR)
      $(MAKE) -Wfatal-errors -C $(OUTDIR) M=$(PWD) $(MYCFLAGS) 
CONFIG_DEBUG_SECTION_MISMATCH=y modules
+ifneq ($(strip $(CROSS_COMPILE)),y)
      ./scripts/rmmod.pl check
+endif

  # Anything in this target shouldn't be build in parallel.
  prepare:: config-compat.h Makefile.media links
@@ -66,9 +70,16 @@ prepare:: config-compat.h Makefile.media
  # Object specific rules

  # Targets which don't need Makefile.media's rules
+ifneq ($(strip $(CROSS_COMPILE)),y)
+no-makefile-media-targets := %config clean distclean snapshot snap \
+    tarball release %links \
+    start insmod load stop rmmod unload reload \
+    card% update push %commit help debug cx88-ivtv lxdialog
+else ifeq ($(strip $(CROSS_COMPILE)),y)
  no-makefile-media-targets := %config clean distclean snapshot snap \
-    tarball release %links start insmod load stop rmmod unload reload \
+    tarball release %links \
      card% update push %commit help debug cx88-ivtv lxdialog
+endif

  # Targets which don't need .myconfig to exist, to keep us from 
including it
  no-dot-config-targets := $(no-makefile-media-targets) %install remove
@@ -188,7 +199,11 @@ ifeq ($(inst-m),)
    inst-m    := $(obj-m)
  endif

+ifneq ($(strip $(CROSS_COMPILE)),y)
  v4l_modules := $(shell /sbin/lsmod|cut -d' ' -f1 ) $(patsubst 
%.ko,%,$(inst-m))
+else ifeq ($(strip $(CROSS_COMPILE)),y)
+v4l_modules :=
+endif

  #################################################
  # locales seem to cause trouble sometimes.
@@ -416,7 +431,9 @@ old-install:: rminstall
      -install -d $(DEST)
      -install -m 644 -c $(inst-m) $(DEST)

+ifneq ($(strip $(CROSS_COMPILE)),y)
      /sbin/depmod -a ${KERNELRELEASE}
+endif

  #################################################
  # Tree management rules
diff -uprN ../linuxtv.orig/v4l/scripts/make_makefile.pl 
v4l/scripts/make_makefile.pl
--- ../linuxtv.orig/v4l/scripts/make_makefile.pl    2021-02-08 
10:24:43.000000000 +0000
+++ v4l/scripts/make_makefile.pl    2021-03-13 14:39:47.238414024 +0000
@@ -258,7 +258,10 @@ while (my ($dir, $files) = each %instdir
      print OUT "fi;\n\n";
  }
  print OUT "\t@echo\n";
-print OUT "\t/sbin/depmod -a \$(KERNELRELEASE) \$(if \$(DESTDIR),-b 
\$(DESTDIR))\n\n";
+print OUT "ifneq (\$(strip \$(CROSS_COMPILE)),y)\n";
+print OUT "\t/sbin/depmod -a \$(KERNELRELEASE) \$(if \$(DESTDIR),-b 
\$(DESTDIR))\n";
+print OUT "endif\n";
+print OUT "\t@echo\n";

  # Creating Remove rule
  print OUT "media-rminstall::\n";

