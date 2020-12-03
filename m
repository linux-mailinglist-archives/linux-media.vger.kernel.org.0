Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD0F2CD4B2
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgLCLii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:38:38 -0500
Received: from www.linuxtv.org ([130.149.80.248]:36118 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbgLCLih (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 06:38:37 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkmvp-003MTQ-8q; Thu, 03 Dec 2020 11:37:53 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkmyz-0007pU-8F; Thu, 03 Dec 2020 11:41:09 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Various fixes and a new meson driver (#69706)
Date:   Thu,  3 Dec 2020 11:41:09 +0000
Message-Id: <20201203114109.30055-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <4bfaa4d3-7b04-3b5c-801c-d68f0765646d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/4bfaa4d3-7b04-3b5c-801c-d68f0765646d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/79705/
Build time: 00:07:31
Link: https://lore.kernel.org/linux-media/4bfaa4d3-7b04-3b5c-801c-d68f0765646d@xs4all.nl

gpg: Signature made Thu 03 Dec 2020 11:10:07 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 7/7 patches with issues, being 7 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-gspca-Fix-memory-leak-in-probe.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0002-media-cedrus-Make-VP8-codec-as-capability.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0003-dt-bindings-media-Add-bindings-for-the-Amlogic-GE2D-.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0003-dt-bindings-media-Add-bindings-for-the-Amlogic-GE2D-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0004-media-meson-Add-M2M-driver-for-the-Amlogic-GE2D-Acce.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0004-media-meson-Add-M2M-driver-for-the-Amlogic-GE2D-Acce.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:76: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0005-MAINTAINERS-Add-myself-as-maintainer-of-the-Amlogic-.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0005-MAINTAINERS-Add-myself-as-maintainer-of-the-Amlogic-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: WARNING: Possible repeated word: 'git'

patches/0006-media-rcar-vin-Mask-VNCSI_IFMD-register.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0007-vivid-fix-disconnect-error-injection.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2


Error #512 when building PDF docs

