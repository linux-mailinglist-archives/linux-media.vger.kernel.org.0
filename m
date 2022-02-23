Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDF24C138E
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 14:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240707AbiBWNGV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 08:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233954AbiBWNGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 08:06:21 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319FF96834
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 05:05:53 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nMrL5-00Dmpq-2o; Wed, 23 Feb 2022 13:05:51 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nMrL3-00E5Wu-11; Wed, 23 Feb 2022 13:05:49 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] amphion video decoder/encoder driver (#80972)
Date:   Wed, 23 Feb 2022 13:05:48 +0000
Message-Id: <20220223130548.3357802-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <10e323b5-4df7-5baf-cb09-628a4cc6864d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/10e323b5-4df7-5baf-cb09-628a4cc6864d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/185410/
Build time: 00:38:50
Link: https://lore.kernel.org/linux-media/10e323b5-4df7-5baf-cb09-628a4cc6864d@xs4all.nl

gpg: Signature made Wed 23 Feb 2022 11:57:39 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 10/11 patches with issues, being 9 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-dt-bindings-media-amphion-add-amphion-video-codec-bi.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-dt-bindings-media-amphion-add-amphion-video-codec-bi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0002-media-add-nv12m_8l128-and-nv12m_10be_8l128-video-for.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)

   checkpatch.pl:
	$ cat patches/0002-media-add-nv12m_8l128-and-nv12m_10be_8l128-video-for.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:86: ERROR: trailing statements should be on next line
	-:87: ERROR: trailing statements should be on next line
	-:100: WARNING: line length of 110 exceeds 100 columns

patches/0003-media-amphion-add-amphion-vpu-device-driver.patch:

    allyesconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_core.o', needed by 'drivers/media/platform/amphion/built-in.a'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_core.o', needed by 'drivers/media/platform/amphion/amphion-vpu.o'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0003-media-amphion-add-amphion-vpu-device-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:80: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:390: CHECK: Macro argument reuse 'inst' - possible side-effects?
	-:390: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:390: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues
	-:393: CHECK: Macro argument reuse 'inst' - possible side-effects?
	-:393: CHECK: Macro argument reuse 'op' - possible side-effects?
	-:393: CHECK: Macro argument 'op' may be better as '(op)' to avoid precedence issues

patches/0004-media-amphion-add-vpu-core-driver.patch:

    allyesconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_mbox.o', needed by 'drivers/media/platform/amphion/built-in.a'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_core.c:24:10: fatal error: vpu_mbox.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_core.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_mbox.o', needed by 'drivers/media/platform/amphion/amphion-vpu.o'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_core.c:24:10: fatal error: vpu_mbox.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_core.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0004-media-amphion-add-vpu-core-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:33: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0005-media-amphion-implement-vpu-core-communication-based.patch:

    allyesconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_v4l2.o', needed by 'drivers/media/platform/amphion/built-in.a'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_v4l2.o', needed by 'drivers/media/platform/amphion/amphion-vpu.o'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0005-media-amphion-implement-vpu-core-communication-based.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0006-media-amphion-add-vpu-v4l2-m2m-support.patch:

    allyesconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_windsor.o', needed by 'drivers/media/platform/amphion/built-in.a'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:20:10: fatal error: vpu_windsor.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_windsor.o', needed by 'drivers/media/platform/amphion/amphion-vpu.o'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:20:10: fatal error: vpu_windsor.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0006-media-amphion-add-vpu-v4l2-m2m-support.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:31: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0007-media-amphion-add-v4l2-m2m-vpu-encoder-stateful-driv.patch:

    allyesconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_windsor.o', needed by 'drivers/media/platform/amphion/built-in.a'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:20:10: fatal error: vpu_windsor.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_windsor.o', needed by 'drivers/media/platform/amphion/amphion-vpu.o'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:20:10: fatal error: vpu_windsor.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0007-media-amphion-add-v4l2-m2m-vpu-encoder-stateful-driv.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0008-media-amphion-add-v4l2-m2m-vpu-decoder-stateful-driv.patch:

    allyesconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_windsor.o', needed by 'drivers/media/platform/amphion/built-in.a'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:20:10: fatal error: vpu_windsor.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_windsor.o', needed by 'drivers/media/platform/amphion/amphion-vpu.o'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:20:10: fatal error: vpu_windsor.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0008-media-amphion-add-v4l2-m2m-vpu-decoder-stateful-driv.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0009-media-amphion-implement-windsor-encoder-rpc-interfac.patch:

    allyesconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_malone.o', needed by 'drivers/media/platform/amphion/built-in.a'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:21:10: fatal error: vpu_malone.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	make[5]: *** No rule to make target 'drivers/media/platform/amphion/vpu_malone.o', needed by 'drivers/media/platform/amphion/amphion-vpu.o'.  Stop.
	make[5]: *** Waiting for unfinished jobs....
	../drivers/media/platform/amphion/vpu_rpc.c:21:10: fatal error: vpu_malone.h: No such file or directory
	compilation terminated.
	make[5]: *** [../scripts/Makefile.build:288: drivers/media/platform/amphion/vpu_rpc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:550: drivers/media/platform/amphion] Error 2
	make[3]: *** [../scripts/Makefile.build:550: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:550: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1831: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0009-media-amphion-implement-windsor-encoder-rpc-interfac.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:22: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0010-media-amphion-implement-malone-decoder-rpc-interface.patch:

   checkpatch.pl:
	$ cat patches/0010-media-amphion-implement-malone-decoder-rpc-interface.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

