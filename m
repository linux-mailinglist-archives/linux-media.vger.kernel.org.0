Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E2A701C8B
	for <lists+linux-media@lfdr.de>; Sun, 14 May 2023 11:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbjENJWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 May 2023 05:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjENJWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 May 2023 05:22:16 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4514FD7
        for <linux-media@vger.kernel.org>; Sun, 14 May 2023 02:22:14 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1py7vg-002oot-8w; Sun, 14 May 2023 09:22:12 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1py7ve-007l3a-7U; Sun, 14 May 2023 09:22:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2] dvb fixes and cleanups (#91834)
Date:   Sun, 14 May 2023 09:22:09 +0000
Message-Id: <20230514092209.1849135-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230514073730.050d4d16@sal.lan>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230514073730.050d4d16@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/306126/
Build time: 00:00:14
Link: https://lore.kernel.org/linux-media/20230514073730.050d4d16@sal.lan

error: FETCH_HEAD: cannot verify a non-tag object of type commit.

Summary: got 10/24 patches with issues, being 6 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-pvrusb2-fix-DVB_CORE-dependency.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1973994
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 57 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-pvrusb2-fix-DVB_CORE-dependency.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0005-media-dvb-usb-v2-ec168-fix-null-ptr-deref-in-ec168_i.patch:

   checkpatch.pl:
	$ cat patches/0005-media-dvb-usb-v2-ec168-fix-null-ptr-deref-in-ec168_i.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0006-media-dvb-usb-v2-ce6230-fix-null-ptr-deref-in-ce6230.patch:

   checkpatch.pl:
	$ cat patches/0006-media-dvb-usb-v2-ce6230-fix-null-ptr-deref-in-ce6230.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0008-media-dvb-usb-digitv-fix-null-ptr-deref-in-digitv_i2.patch:

   checkpatch.pl:
	$ cat patches/0008-media-dvb-usb-digitv-fix-null-ptr-deref-in-digitv_i2.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0014-media-dvb-core-Fix-use-after-free-on-race-condition-.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2831 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1965893
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 59 seconds

   checkpatch.pl:
	$ cat patches/0014-media-dvb-core-Fix-use-after-free-on-race-condition-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:185: CHECK: struct mutex definition without comment

patches/0015-media-dvb-core-Fix-use-after-free-due-on-race-condit.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1963085
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 55 seconds

   checkpatch.pl:
	$ cat patches/0015-media-dvb-core-Fix-use-after-free-due-on-race-condit.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:127: CHECK: struct mutex definition without comment

patches/0016-media-dvb-core-Fix-use-after-free-due-to-race-at-dvb.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2858 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000032Kb sm_state_count = 1966723
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 57 seconds

   checkpatch.pl:
	$ cat patches/0016-media-dvb-core-Fix-use-after-free-due-to-race-at-dvb.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:24: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
	-:25: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
	-:49: WARNING: struct file_operations should normally be const
	-:58: WARNING: space prohibited between function name and open parenthesis '('
	-:58: ERROR: do not use assignment in if condition
	-:80: CHECK: Alignment should match open parenthesis
	-:91: CHECK: Comparison to NULL could be written "!dvbdevfops"
	-:99: CHECK: Prefer kzalloc(sizeof(*new_node)...) over kzalloc(sizeof(struct dvbdevfops_node)...)
	-:110: WARNING: space prohibited between function name and open parenthesis '('
	-:131: WARNING: space prohibited between function name and open parenthesis '('
	-:155: WARNING: space prohibited between function name and open parenthesis '('
	-:176: WARNING: space prohibited between function name and open parenthesis '('
	-:214: WARNING: space prohibited between function name and open parenthesis '('
	-:238: WARNING: struct file_operations should normally be const

patches/0019-media-dvbdev.h-do-some-kernel-doc-cleanups.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2846 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000020Kb sm_state_count = 1965253
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 59 seconds

   checkpatch.pl:
	$ cat patches/0019-media-dvbdev.h-do-some-kernel-doc-cleanups.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0023-media-dvb-add-missing-DVB-S2X-FEC-parameter-values.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2858 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1963386
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 58 seconds

   checkpatch.pl:
	$ cat patches/0023-media-dvb-add-missing-DVB-S2X-FEC-parameter-values.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 6508a50fe84f ("media: dvb: add DVB-C2 and DVB-S2X parameter values")'
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0024-media-dvb-bump-DVB-API-version.patch:

   checkpatch.pl:
	$ cat patches/0024-media-dvb-bump-DVB-API-version.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

