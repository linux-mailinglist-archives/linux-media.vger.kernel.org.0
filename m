Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9EE45441A
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbhKQJsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:48:54 -0500
Received: from www.linuxtv.org ([130.149.80.248]:45352 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235381AbhKQJsy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:48:54 -0500
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mnHVq-00GxbT-UU; Wed, 17 Nov 2021 09:45:54 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mnHVo-00BSRr-2J; Wed, 17 Nov 2021 09:45:52 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.17] Various fixes/enhancements (#78541)
Date:   Wed, 17 Nov 2021 09:45:51 +0000
Message-Id: <20211117094551.2730917-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <21f4ea07-24ea-7b8c-18a3-e69c0dbb095d@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/21f4ea07-24ea-7b8c-18a3-e69c0dbb095d@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/157592/
Build time: 00:21:57
Link: https://lore.kernel.org/linux-media/21f4ea07-24ea-7b8c-18a3-e69c0dbb095d@xs4all.nl

gpg: Signature made Wed 17 Nov 2021 09:15:33 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [unknown]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 2/13 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-mtk-vcodec-enc-add-vp8-profile-ctrl.patch:

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
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0008-media-pvrusb2-fix-control-message-timeouts.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting

   checkpatch.pl:
	$ cat patches/0008-media-pvrusb2-fix-control-message-timeouts.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:44: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)
	-:53: ERROR: space required after that ',' (ctx:VxV)


Error #512 when building PDF docs

