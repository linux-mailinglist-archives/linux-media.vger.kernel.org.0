Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF7D77AA34
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 19:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjHMRHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 13:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjHMRHj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 13:07:39 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED49CE63
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 10:07:37 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qVEYw-00Ghte-LO; Sun, 13 Aug 2023 17:07:35 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qVEYu-006ZW9-0R;
        Sun, 13 Aug 2023 17:07:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.6-1 (#94033)
Date:   Sun, 13 Aug 2023 17:07:31 +0000
Message-Id: <20230813170731.1566488-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <9fbc59f1-abb5-8966-8810-a3b8f57775fc@redhat.com>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/9fbc59f1-abb5-8966-8810-a3b8f57775fc@redhat.com/
Build log: https://builder.linuxtv.org/job/patchwork/330488/
Build time: 00:11:03
Link: https://lore.kernel.org/linux-media/9fbc59f1-abb5-8966-8810-a3b8f57775fc@redhat.com

gpg: Signature made Sun 13 Aug 2023 03:37:31 PM UTC
gpg:                using RSA key BAF03B5D2718411A5E9E177E92EC4779440327DC
gpg:                issuer "hdegoede@redhat.com"
gpg: Good signature from "Hans de Goede <hdegoede@redhat.com>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: A1EA 0673 EAD8 B74F 17D2  B9E1 7C31 E21A 98D2 1E0D
     Subkey fingerprint: BAF0 3B5D 2718 411A 5E9E  177E 92EC 4779 4403 27DC

Summary: got 41/41 patches with issues, being 41 at build time

Error/warnings:

patches/0001-media-atomisp-ia_css_debug-Removed-unused-codes-for-.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2771 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1968657
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 52 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

patches/0002-media-atomisp-Removed-unused-HAS_WATCHDOG_SP_THREAD_.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0003-media-atomisp-sh_css_internal-sh_css_params-Unifying.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0004-media-atomisp-Fix-missing-v4l2_fh_release-in-atomisp.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0004-media-atomisp-Fix-missing-v4l2_fh_release-in-atomisp.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report

patches/0005-media-atomisp-Clamp-width-to-max-1920-pixels-when-in.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0006-media-atomisp-Change-atomisp_enum_framesizes-too-sma.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0007-media-atomisp-Add-some-higher-resolutions-to-atomisp.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0008-media-atomisp-Remove-support-for-custom-run-mode-v4l.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0009-media-atomisp-Remove-v4l2_ctrl_s_ctrl-asd-run_mode-c.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0010-media-atomisp-ia_css_debug-Removed-debug-codes-for-d.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0011-media-atomisp-Make-two-individual-enum-to-define-the.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0011-media-atomisp-Make-two-individual-enum-to-define-the.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:482: CHECK: Lines should not end with a '('
	-:483: WARNING: please, no spaces at the start of a line
	-:484: WARNING: please, no spaces at the start of a line
	-:485: WARNING: please, no spaces at the start of a line

patches/0012-media-atomisp-Included-both-input-system-headers.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0013-media-atomisp-css_2401_system-Remove-ifdef-ISP2401-t.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0014-media-atomisp-isys-Removed-if-defined-ISP2401-to-mak.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0015-media-atomisp-hive_isp_css_common-Removed-if-defined.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0016-media-atomisp-pipeline-Removed-if-defined-ISP2401-to.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0017-media-atomisp-ifmtr-Removed-if-defined-ISP2401-to-ma.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0018-media-atomisp-Compile-the-object-codes-for-a-generic.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0019-media-atomisp-rx-Removed-if-defined-ISP2401-to-make-.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0020-media-atomisp-isys_init-Initiate-atomisp-in-a-generi.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0021-media-atomisp-Remove-empty-isys_public.h.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0021-media-atomisp-Remove-empty-isys_public.h.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0022-media-atomisp-Remove-aliases-for-MIPI_FORMAT_2400_CU.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0023-media-atomisp-Mark-ia_css_isys_240-_init-static.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0024-media-atomisp-ia_css_raw.host-Remove-ifdef-ISP2401-t.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0025-media-atomisp-binary-Removed-ifdef-ISP2401-to-make-d.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0026-media-atomisp-hive_isp_css_include-Removed-ifdef-ISP.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0027-media-atomisp-atomisp_compat_css20-Removed-ifdef-ISP.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0028-media-atomisp-sh_css_mipi-Removed-unused-code-ia_css.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0029-media-atomisp-sh_css-Removed-ifdef-ISP2401-to-make-t.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0030-media-atomisp-sh_css_sp-Remove-ifdef-ISP2401-to-make.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0031-media-atomisp-sh_css-Removed-ifdef-ISP2401-to-make-d.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0031-media-atomisp-sh_css-Removed-ifdef-ISP2401-to-make-d.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:101: WARNING: line length of 113 exceeds 100 columns
	-:108: CHECK: Lines should not end with a '('

patches/0032-media-atomisp-sh_css-Renamed-sh_css_config_input_net.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0032-media-atomisp-sh_css-Renamed-sh_css_config_input_net.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:156: CHECK: Unnecessary parentheses around 'stream->config.mode == IA_CSS_INPUT_MODE_SENSOR'
	-:156: CHECK: Unnecessary parentheses around 'stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR'

patches/0033-media-atomisp-sh_css-Removed-ifdef-ISP2401-to-make-c.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0033-media-atomisp-sh_css-Removed-ifdef-ISP2401-to-make-c.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:68: CHECK: Lines should not end with a '('
	-:69: WARNING: line length of 104 exceeds 100 columns
	-:78: WARNING: line length of 124 exceeds 100 columns
	-:79: WARNING: line length of 110 exceeds 100 columns
	-:79: WARNING: Too many leading tabs - consider code refactoring

patches/0034-media-atomisp-sh_css-Removed-ifdef-ISP2401-to-make-t.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0035-media-atomisp-atomisp_v4l2-Removed-unnecessary-code.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0036-media-atomisp-Simplify-some-if-IS_ISP2401.-statement.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0037-media-atomisp-Drop-ia_css_debug_dump_debug_info-and-.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0038-media-atomisp-Drop-VIDEO_ATOMISP_ISP2401-Kconfig-opt.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0039-media-atomisp-gc0310-Stop-setting-v4l2_subdev.fwnode.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:446 gc0310_s_stream() warn: missing error code 'ret'
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0040-media-atomisp-Disable-VCM-for-OV5693-for-now.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

patches/0041-media-atomisp-Drop-atomisp-ov5693-sensor-driver.patch:

    allyesconfig: return code #512:
	In file included from ../include/linux/string.h:254,
	                 from ../include/linux/bitmap.h:11,
	                 from ../include/linux/cpumask.h:12,
	                 from ../arch/x86/include/asm/paravirt.h:17,
	                 from ../arch/x86/include/asm/cpuid.h:62,
	                 from ../arch/x86/include/asm/processor.h:19,
	                 from ../arch/x86/include/asm/cpufeature.h:5,
	                 from ../arch/x86/include/asm/thread_info.h:53,
	                 from ../include/linux/thread_info.h:60,
	                 from ../arch/x86/include/asm/preempt.h:9,
	                 from ../include/linux/preempt.h:79,
	                 from ../include/linux/spinlock.h:56,
	                 from ../include/linux/mmzone.h:8,
	                 from ../include/linux/gfp.h:7,
	                 from ../include/linux/slab.h:16,
	                 from ../drivers/staging/media/atomisp//include/hmm/hmm.h:26,
	                 from ../drivers/staging/media/atomisp/pci/sh_css_params.c:26:
	In function ‘fortify_memcpy_chk’,
	    inlined from ‘sh_css_store_sp_group_to_ddr’ at ../drivers/staging/media/atomisp/pci/sh_css_params.c:3736:3:
	../include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
	cc1: all warnings being treated as errors
	make[7]: *** [../scripts/Makefile.build:243: drivers/staging/media/atomisp/pci/sh_css_params.o] Error 1
	make[7]: *** Waiting for unfinished jobs....
	make[6]: *** [../scripts/Makefile.build:477: drivers/staging/media/atomisp] Error 2
	make[5]: *** [../scripts/Makefile.build:477: drivers/staging/media] Error 2
	make[4]: *** [../scripts/Makefile.build:477: drivers/staging] Error 2
	make[3]: *** [../scripts/Makefile.build:477: drivers] Error 2
	make[2]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:2020: .] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:234: __sub-make] Error 2
	make: *** [Makefile:234: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0041-media-atomisp-Drop-atomisp-ov5693-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:63: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

