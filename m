Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EBF42C111
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 15:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbhJMNN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 09:13:27 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44608 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234870AbhJMNN1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 09:13:27 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mae2U-000RT9-Un; Wed, 13 Oct 2021 13:11:22 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mae2S-003qxR-9B; Wed, 13 Oct 2021 13:11:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.16] ir fixes (#77710)
Date:   Wed, 13 Oct 2021 13:11:19 +0000
Message-Id: <20211013131119.918507-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013124551.GA25487@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20211013124551.GA25487@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/147622/
Build time: 00:17:15
Link: https://lore.kernel.org/linux-media/20211013124551.GA25487@gofer.mess.org

gpg: Signature made Wed 13 Oct 2021 12:42:45 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: A624 251A 2608 4A9E D9E4  C8B6 425F 639D 3960 FA9E

Summary: got 2/2 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-ir_toy-assignment-to-be16-should-be-of-correct.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor() warn: missing error code 'ret'
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:627 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 623)

patches/0002-media-sir_ir-remove-broken-driver.patch:

   checkpatch.pl:
	$ cat patches/0002-media-sir_ir-remove-broken-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:56: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

