Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4387019AA
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 22:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjEMUa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 16:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEMUa7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 16:30:59 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001DB26B5
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 13:30:56 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pxvtG-002ccr-TO; Sat, 13 May 2023 20:30:55 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1pxvtC-004qfF-IA; Sat, 13 May 2023 20:30:51 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] dvb fixes and cleanups (#91833)
Date:   Sat, 13 May 2023 20:30:49 +0000
Message-Id: <20230513203049.1155707-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230513195131.2f3ff7d3@sal.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230513195131.2f3ff7d3@sal.lan/
Build log: https://builder.linuxtv.org/job/patchwork/306043/
Build time: 00:29:41
Link: https://lore.kernel.org/linux-media/20230513195131.2f3ff7d3@sal.lan

error: FETCH_HEAD: cannot verify a non-tag object of type commit.

Summary: got 13/24 patches with issues, being 8 at build time, plus one error when buinding PDF document

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
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1972462
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 57 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2858 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-pvrusb2-fix-DVB_CORE-dependency.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0004-media-dvb-usb-az6027-fix-three-null-ptr-deref-in-az6.patch:

   checkpatch.pl:
	$ cat patches/0004-media-dvb-usb-az6027-fix-three-null-ptr-deref-in-az6.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

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

patches/0011-media-dvb_ca_en50221-fix-a-size-write-bug.patch:

   checkpatch.pl:
	$ cat patches/0011-media-dvb_ca_en50221-fix-a-size-write-bug.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:14: WARNING: 'followings' may be misspelled - perhaps 'following'?

patches/0014-media-dvb-core-Fix-use-after-free-due-to-race-condit.patch:

    allyesconfig: return code #0:
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:835 dvb_frontend_stop() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 819
	  Unlocked on: 835
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:2910 dvb_frontend_open() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 2787
	  Unlocked on: 2778,2826,2887,2910
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000032Kb sm_state_count = 1964796
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 59 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2858 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0014-media-dvb-core-Fix-use-after-free-due-to-race-condit.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:165: CHECK: struct mutex definition without comment

patches/0015-media-dvb-core-Fix-use-after-free-due-to-race-condit.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1967992
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 59 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

   checkpatch.pl:
	$ cat patches/0015-media-dvb-core-Fix-use-after-free-due-to-race-condit.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:127: CHECK: struct mutex definition without comment

patches/0016-media-dvb-core-Fix-use-after-free-due-to-race-condit.patch:

    allyesconfig: return code #0:
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:835 dvb_frontend_stop() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 819
	  Unlocked on: 835
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:2910 dvb_frontend_open() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 2787
	  Unlocked on: 2778,2826,2887,2910
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1968007
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 57 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2836 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

   checkpatch.pl:
	$ cat patches/0016-media-dvb-core-Fix-use-after-free-due-to-race-condit.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
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

patches/0017-media-dvb-core-Fix-kernel-WARNING-for-blocking-opera.patch:

    allyesconfig: return code #0:
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:843 dvb_frontend_stop() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 827
	  Unlocked on: 843
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:2918 dvb_frontend_open() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 2795
	  Unlocked on: 2786,2834,2895,2918

   checkpatch.pl:
	$ cat patches/0017-media-dvb-core-Fix-kernel-WARNING-for-blocking-opera.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:20: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report

patches/0019-media-dvbdev.h-do-some-kernel-doc-cleanups.patch:

    allyesconfig: return code #0:
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:843 dvb_frontend_stop() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 827
	  Unlocked on: 843
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:2918 dvb_frontend_open() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 2795
	  Unlocked on: 2786,2834,2895,2918
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2579 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1743)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2598 dvb_register() parse error: OOM: 3000012Kb sm_state_count = 1943986
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2598 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2598 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 63 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2836 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0019-media-dvbdev.h-do-some-kernel-doc-cleanups.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0023-media-dvb-add-missing-DVB-S2X-FEC-parameter-values.patch:

    allyesconfig: return code #0:
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:843 dvb_frontend_stop() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 827
	  Unlocked on: 843
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:2918 dvb_frontend_open() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 2795
	  Unlocked on: 2786,2834,2895,2918
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2491 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2579 dvb_register() error: we previously assumed 'fe1->dvb.frontend' could be null (see line 1743)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2602 dvb_register() parse error: OOM: 3003928Kb sm_state_count = 1953315
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2602 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2602 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 67 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2831 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0023-media-dvb-add-missing-DVB-S2X-FEC-parameter-values.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 6508a50fe84f ("media: dvb: add DVB-C2 and DVB-S2X parameter values")'
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0024-media-dvb-bump-DVB-API-version.patch:

    allyesconfig: return code #0:
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:843 dvb_frontend_stop() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 827
	  Unlocked on: 843
	../drivers/media/dvb-core/dvb_frontend.c: ../drivers/media/dvb-core/dvb_frontend.c:2918 dvb_frontend_open() warn: inconsistent returns '&fe->remove_mutex'.
	  Locked on  : 2795
	  Unlocked on: 2786,2834,2895,2918

   checkpatch.pl:
	$ cat patches/0024-media-dvb-bump-DVB-API-version.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

