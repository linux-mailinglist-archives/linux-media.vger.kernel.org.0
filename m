Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D0D2CC174
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbgLBP6P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 10:58:15 -0500
Received: from www.linuxtv.org ([130.149.80.248]:35974 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgLBP6P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 10:58:15 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkUVV-002CUq-QW; Wed, 02 Dec 2020 15:57:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkUYf-0007e6-8U; Wed, 02 Dec 2020 16:00:45 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: =?UTF-8?q?Re=3A=20=5BGIT=20PULL=20for=20=3D=3Fiso-8859-1=3Fq=3F5=3D2E11=3D5D=3DA0Preliminary=3F=3D=20CCS=20support=20=28=2369628=29?=
Date:   Wed,  2 Dec 2020 16:00:45 +0000
Message-Id: <20201202160045.29346-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201202152857.GW4351@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201202152857.GW4351@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/79587/
Build time: 00:17:00
Link: https://lore.kernel.org/linux-media/20201202152857.GW4351@valkosipuli.retiisi.org.uk

gpg: Signature made Wed 02 Dec 2020 03:22:17 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 25/32 patches with issues, being 23 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-Documentation-ccs-Rename-ccs-regs.txt-as-ccs-regs.as.patch:

   checkpatch.pl:
	$ cat patches/0001-Documentation-ccs-Rename-ccs-regs.txt-as-ccs-regs.as.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0008-ccs-Make-hwcfg-part-of-the-device-specific-struct.patch:

   checkpatch.pl:
	$ cat patches/0008-ccs-Make-hwcfg-part-of-the-device-specific-struct.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:158: CHECK: Comparison to NULL could be written "sensor->hwcfg.strobe_setup"

patches/0010-ccs-Add-CCS-static-data-parser-library.patch:

    allmodconfig: return code #512:
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
	$ cat patches/0010-ccs-Add-CCS-static-data-parser-library.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:36: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:313: CHECK: multiple assignments should be avoided
	-:322: CHECK: Macro argument reuse 'var' - possible side-effects?
	-:322: CHECK: Macro argument 'var' may be better as '(var)' to avoid precedence issues
	-:326: CHECK: Macro argument reuse 'var' - possible side-effects?
	-:326: CHECK: Macro argument 'var' may be better as '(var)' to avoid precedence issues
	-:391: CHECK: Alignment should match open parenthesis
	-:490: CHECK: multiple assignments should be avoided
	-:702: CHECK: multiple assignments should be avoided
	-:1091: CHECK: Lines should not end with a '('
	-:1099: CHECK: Lines should not end with a '('
	-:1107: CHECK: Lines should not end with a '('
	-:1115: CHECK: Lines should not end with a '('
	-:1135: CHECK: Lines should not end with a '('
	-:1143: CHECK: Lines should not end with a '('
	-:1423: WARNING: 'Lenght' may be misspelled - perhaps 'Length'?

patches/0011-ccs-Combine-revision-number-major-and-minor-into-one.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0012-ccs-Read-CCS-static-data-from-firmware-binaries.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0013-ccs-Stop-reading-arrays-after-the-first-zero.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0014-ccs-The-functions-to-get-compose-or-crop-rectangle-n.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0015-ccs-Replace-somewhat-harsh-internal-checks-based-on-.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0016-ccs-Refactor-register-reading-a-little.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0017-ccs-Make-real-to-integer-number-conversion-optional.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0018-ccs-Move-limit-value-real-to-integer-conversion-from.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0019-ccs-Read-ireal-numbers-correctly.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
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
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0020-smiapp-pll-Rename-as-ccs-pll.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0020-smiapp-pll-Rename-as-ccs-pll.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:80: WARNING: It's generally not useful to have the filename in the file
	-:157: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:254: WARNING: It's generally not useful to have the filename in the file
	-:278: CHECK: Prefer using the BIT macro
	-:279: CHECK: Prefer using the BIT macro

patches/0021-ccs-pll-Fix-MODULE_LICENSE.patch:

    allmodconfig: return code #512:
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

patches/0022-ccs-Change-my-e-mail-address.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0023-ccs-Allow-range-in-between-I-C-retries.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0024-ccs-Add-support-for-manufacturer-regs-from-sensor-an.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:324:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:325:32: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:332:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[4]: *** Waiting for unfinished jobs....
	In file included from ../drivers/media/i2c/ccs/ccs-data-defs.h:11,
	                 from ../drivers/media/i2c/ccs/ccs-data.c:15:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-data.c:223:44: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-data.c:296:8: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-data.o] Error 1
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0025-ccs-Use-static-data-read-only-registers.patch:

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
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0025-ccs-Use-static-data-read-only-registers.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: CHECK: Prefer kernel type 'u8' over 'uint8_t'

patches/0026-ccs-Clean-up-runtime-PM-usage.patch:

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
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0027-ccs-Wrap-long-lines-unwrap-short-ones.patch:

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
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0028-ccs-Use-longer-pre-I-C-sleep-for-CCS-compliant-devic.patch:

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
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0029-ccs-Remove-unnecessary-delays-from-power-up-sequence.patch:

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
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0030-dt-bindings-mipi-ccs-Don-t-mention-vana-voltage.patch:

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

patches/0031-dt-bindings-mipi-ccs-Add-vcore-and-vio-supplies.patch:

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
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

patches/0032-ccs-Use-all-regulators.patch:

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
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-quirk.c:14:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2


Error #512 when building PDF docs

