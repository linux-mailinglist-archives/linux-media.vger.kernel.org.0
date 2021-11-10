Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D735A44BD93
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 10:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhKJJIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 04:08:25 -0500
Received: from www.linuxtv.org ([130.149.80.248]:53358 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230141AbhKJJIY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 04:08:24 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mkjY0-0073ll-Kg; Wed, 10 Nov 2021 09:05:36 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mkjXy-002L3a-6s; Wed, 10 Nov 2021 09:05:34 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.16] Three fixes for v5.16 (#78320)
Date:   Wed, 10 Nov 2021 09:05:34 +0000
Message-Id: <20211110090534.557552-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <a5b6d1ca-a38c-924d-fbf2-ee38274f0ef3@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/a5b6d1ca-a38c-924d-fbf2-ee38274f0ef3@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/155598/
Build time: 00:03:17
Link: https://lore.kernel.org/linux-media/a5b6d1ca-a38c-924d-fbf2-ee38274f0ef3@xs4all.nl

gpg: Signature made Wed 10 Nov 2021 08:44:13 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/3 patches with issues, being 3 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-v4l2-core-fix-VIDIOC_DQEVENT-handling-on-non-x.patch:

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

patches/0002-media-videobuf2-dma-sg-Fix-buf-vb-NULL-pointer-deref.patch:

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

patches/0003-cec-copy-sequence-field-for-the-reply.patch:

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

