Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8F144BE4D
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhKJKPJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 05:15:09 -0500
Received: from www.linuxtv.org ([130.149.80.248]:37018 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhKJKPI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 05:15:08 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mkkaZ-00789f-OB; Wed, 10 Nov 2021 10:12:20 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mkkaX-002wbB-OP; Wed, 10 Nov 2021 10:12:17 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.17] Various fixes/enhancements (#78322)
Date:   Wed, 10 Nov 2021 10:12:17 +0000
Message-Id: <20211110101217.701863-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <734bd659-3f59-63a1-dbf8-28e50ff733e4@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/734bd659-3f59-63a1-dbf8-28e50ff733e4@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/155611/
Build time: 00:05:02
Link: https://lore.kernel.org/linux-media/734bd659-3f59-63a1-dbf8-28e50ff733e4@xs4all.nl

gpg: Signature made Wed 10 Nov 2021 10:02:56 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 19/19 patches with issues, being 19 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-aspeed-fix-mode-detect-always-time-out-at-2nd-.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make[1]: *** [include/config/auto.conf.cmd] Deleting file 'include/generated/autoconf.h'
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make[1]: *** [include/config/auto.conf.cmd] Deleting file 'include/generated/autoconf.h'
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0002-media-gspca-Make-use-of-the-helper-macro-kthread_run.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0003-media-tw5864-Simplify-tw5864_finidev.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0004-media-tw5864-Disable-PCI-device-when-finished.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0005-media-s5p-mfc-Use-bitmap_zalloc-when-applicable.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0006-dt-bindings-adv748x-Convert-bindings-to-json-schema.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0006-dt-bindings-adv748x-Convert-bindings-to-json-schema.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:32: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:150: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0007-media-em28xx-fix-memory-leak-in-em28xx_init_dev.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0008-media-docs-Fix-newline-typo.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0009-cec-ioc-receive.rst-clarify-sequence-and-status-fiel.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0010-v4l2-ioctl.c-readbuffers-depends-on-V4L2_CAP_READWRI.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0011-media-mtk-vcodec-Align-width-and-height-to-64-bytes.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0012-media-drivers-index.rst-add-missing-rkisp1-entry.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0013-media-aspeed-Update-signal-status-immediately-to-ens.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0014-media-stm32-dma2d-fix-compile-errors-when-W-1.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0015-media-stm32-dma2d-fix-compile-testing-failed.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0016-media-mtk-vcodec-vdec-remove-redundant-pfb-assignmen.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0017-media-correct-MEDIA_TEST_SUPPORT-help-text.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0018-media-mtk-vpu-Remove-redundant-flush_workqueue-calls.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0019-media-mtk-vcodec-Remove-redundant-flush_workqueue-ca.patch:

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allyesconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	../arch/x86/Makefile:142: CONFIG_X86_X32 enabled but no binutils support
	gcc: error: unrecognized command-line option ‘-Wcounterexamples’
	gcc -Wcounterexamples -fno-diagnostics-show-caret: unknown compiler
	scripts/Kconfig.include:44: Sorry, this compiler is not supported.
	make[3]: *** [../scripts/kconfig/Makefile:77: syncconfig] Error 1
	make[2]: *** [../Makefile:616: syncconfig] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:729: include/config/auto.conf.cmd] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

