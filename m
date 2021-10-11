Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001AE4289C7
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 11:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235559AbhJKJkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 05:40:41 -0400
Received: from www.linuxtv.org ([130.149.80.248]:54044 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235500AbhJKJkk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 05:40:40 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mZrlX-00EwNS-Fj; Mon, 11 Oct 2021 09:38:39 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mZrlU-00DqYO-Ap; Mon, 11 Oct 2021 09:38:36 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] Allegro fixes/enhancements (#77656)
Date:   Mon, 11 Oct 2021 09:38:35 +0000
Message-Id: <20211011093835.3300234-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <710cddfc-e3c3-0cf3-d2f9-c38ef6ca8b1a@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/710cddfc-e3c3-0cf3-d2f9-c38ef6ca8b1a@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/147010/
Build time: 00:41:54
Link: https://lore.kernel.org/linux-media/710cddfc-e3c3-0cf3-d2f9-c38ef6ca8b1a@xs4all.nl

gpg: Signature made Mon 11 Oct 2021 08:44:58 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 5/13 patches with issues, being 5 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-allegro-ignore-interrupt-if-mailbox-is-not-ini.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SPARSE:../drivers/media/rc/ir_toy.c ../drivers/media/rc/ir_toy.c:321:20: warning: incorrect type in assignment (different base types)
	SPARSE:../drivers/media/rc/ir_toy.c ../drivers/media/rc/ir_toy.c:321:20:    expected restricted __be16 [usertype]
	SPARSE:../drivers/media/rc/ir_toy.c ../drivers/media/rc/ir_toy.c:321:20:    got int
	../drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor() warn: missing error code 'ret'
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:627 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 623)
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting

patches/0006-media-allegro-add-control-to-disable-encoder-buffer.patch:

    allyesconfig: return code #0:
	../drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor() warn: missing error code 'ret'
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:627 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 623)
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0006-media-allegro-add-control-to-disable-encoder-buffer.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:115: CHECK: Alignment should match open parenthesis

patches/0010-media-allegro-extract-nal-value-lookup-functions-to-.patch:

    allyesconfig: return code #512:
	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: ‘enum v4l2_quantization’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: ‘enum v4l2_xfer_func’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: ‘enum v4l2_ycbcr_encoding’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:277: drivers/media/platform/allegro-dvt/nal-hevc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:540: drivers/media/platform/allegro-dvt] Error 2
	make[3]: *** [../scripts/Makefile.build:540: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:540: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1868: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: ‘enum v4l2_quantization’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: ‘enum v4l2_xfer_func’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: ‘enum v4l2_ycbcr_encoding’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:277: drivers/media/platform/allegro-dvt/nal-hevc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:540: drivers/media/platform/allegro-dvt] Error 2
	make[3]: *** [../scripts/Makefile.build:540: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:540: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1868: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0011-media-allegro-write-correct-colorspace-into-SPS.patch:

    allyesconfig: return code #512:
	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: ‘enum v4l2_quantization’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: ‘enum v4l2_xfer_func’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: ‘enum v4l2_ycbcr_encoding’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:277: drivers/media/platform/allegro-dvt/nal-hevc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:540: drivers/media/platform/allegro-dvt] Error 2
	make[3]: *** [../scripts/Makefile.build:540: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:540: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1868: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: ‘enum v4l2_quantization’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: ‘enum v4l2_xfer_func’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: ‘enum v4l2_ycbcr_encoding’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:277: drivers/media/platform/allegro-dvt/nal-hevc.o] Error 1
	make[5]: *** Waiting for unfinished jobs....
	make[4]: *** [../scripts/Makefile.build:540: drivers/media/platform/allegro-dvt] Error 2
	make[3]: *** [../scripts/Makefile.build:540: drivers/media/platform] Error 2
	make[2]: *** [../scripts/Makefile.build:540: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1868: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

patches/0012-media-allegro-nal-hevc-implement-generator-for-vui.patch:

    allyesconfig: return code #512:
	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: ‘enum v4l2_quantization’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: ‘enum v4l2_xfer_func’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: ‘enum v4l2_ycbcr_encoding’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:277: drivers/media/platform/allegro-dvt/nal-hevc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:540: drivers/media/platform/allegro-dvt] Error 2
	make[3]: *** [../scripts/Makefile.build:540: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:540: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1868: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2

    allmodconfig: return code #512:
	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: ‘enum v4l2_quantization’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: ‘enum v4l2_xfer_func’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: ‘enum v4l2_ycbcr_encoding’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
	cc1: all warnings being treated as errors
	make[5]: *** [../scripts/Makefile.build:277: drivers/media/platform/allegro-dvt/nal-hevc.o] Error 1
	make[4]: *** [../scripts/Makefile.build:540: drivers/media/platform/allegro-dvt] Error 2
	make[4]: *** Waiting for unfinished jobs....
	make[3]: *** [../scripts/Makefile.build:540: drivers/media/platform] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:540: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1868: drivers] Error 2
	make: *** [Makefile:219: __sub-make] Error 2


Error #512 when building PDF docs

