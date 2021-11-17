Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A1D4546A0
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 13:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237288AbhKQMwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 07:52:54 -0500
Received: from www.linuxtv.org ([130.149.80.248]:39966 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236920AbhKQMwx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 07:52:53 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mnKNu-00H8RU-7M; Wed, 17 Nov 2021 12:49:54 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mnKNs-00Cy1x-6q; Wed, 17 Nov 2021 12:49:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.17] VP9 codec V4L2 control interface (#78577)
Date:   Wed, 17 Nov 2021 12:49:52 +0000
Message-Id: <20211117124952.3090647-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <f05bda76-2fb0-bdd8-13c3-e52fbdfb7596@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/f05bda76-2fb0-bdd8-13c3-e52fbdfb7596@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/157622/
Build time: 00:37:17
Link: https://lore.kernel.org/linux-media/f05bda76-2fb0-bdd8-13c3-e52fbdfb7596@xs4all.nl

gpg: Signature made Wed 17 Nov 2021 12:05:02 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 8/12 patches with issues, being 6 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-hantro-postproc-Fix-motion-vector-space-size.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2889 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-hantro-postproc-Introduce-struct-hantro_postproc_ops.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/staging/media/hantro/hantro_postproc.c ../drivers/staging/media/hantro/hantro_postproc.c:36:35: warning: symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?

patches/0003-hantro-Simplify-postprocessor.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/staging/media/hantro/hantro_postproc.c ../drivers/staging/media/hantro/hantro_postproc.c:36:35: warning: symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?

patches/0005-media-uapi-Add-VP9-stateless-decoder-controls.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/staging/media/hantro/hantro_postproc.c ../drivers/staging/media/hantro/hantro_postproc.c:36:35: warning: symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?

    allyesconfig: return code #0:
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0005-media-uapi-Add-VP9-stateless-decoder-controls.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:721: WARNING: Avoid logging continuation uses where feasible
	-:724: WARNING: Avoid logging continuation uses where feasible
	-:933: WARNING: line length of 101 exceeds 100 columns
	-:958: ERROR: trailing statements should be on next line

patches/0006-media-Add-VP9-v4l2-library.patch:

   checkpatch.pl:
	$ cat patches/0006-media-Add-VP9-v4l2-library.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:48: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:1161: CHECK: Macro argument reuse 'd' - possible side-effects?
	-:1162: ERROR: Macros with complex values should be enclosed in parentheses
	-:2050: WARNING: Missing a blank line after declarations

patches/0007-media-rkvdec-Add-the-VP9-backend.patch:

   checkpatch.pl:
	$ cat patches/0007-media-rkvdec-Add-the-VP9-backend.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Co-developed-by: should not be used to attribute nominal patch author 'Andrzej Pietrasiewicz <andrzej.p@collabora.com>'
	-:46: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:279: CHECK: Blank lines aren't necessary before a close brace '}'
	-:884: CHECK: Macro argument reuse 'p1' - possible side-effects?
	-:884: CHECK: Macro argument reuse 'p2' - possible side-effects?

patches/0009-media-hantro-Prepare-for-other-G2-codecs.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/staging/media/hantro/hantro_postproc.c ../drivers/staging/media/hantro/hantro_postproc.c:36:35: warning: symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0009-media-hantro-Prepare-for-other-G2-codecs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:70: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0010-media-hantro-Support-VP9-on-the-G2-core.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/staging/media/hantro/hantro_postproc.c ../drivers/staging/media/hantro/hantro_postproc.c:36:35: warning: symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0010-media-hantro-Support-VP9-on-the-G2-core.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:348: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:1250: CHECK: Macro argument reuse 'p1' - possible side-effects?
	-:1250: CHECK: Macro argument reuse 'p2' - possible side-effects?


Error #512 when building PDF docs

