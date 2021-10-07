Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B68425257
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 13:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241108AbhJGL5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 07:57:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:49022 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241074AbhJGL5D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 07:57:03 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mYRzP-0098iR-DJ; Thu, 07 Oct 2021 11:55:07 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mYRzN-001Hm4-9t; Thu, 07 Oct 2021 11:55:05 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 5.16] Last DVB fixes (#77535)
Date:   Thu,  7 Oct 2021 11:55:04 +0000
Message-Id: <20211007115504.306606-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211007113052.GA11952@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20211007113052.GA11952@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/145894/
Build time: 00:17:52
Link: https://lore.kernel.org/linux-media/20211007113052.GA11952@gofer.mess.org

gpg: Signature made Thu 07 Oct 2021 11:20:33 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: A624 251A 2608 4A9E D9E4  C8B6 425F 639D 3960 FA9E

Summary: got 2/5 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-mb86a20s-make-arrays-static-const.patch:

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
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-encoder.c: ../drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting

patches/0003-media-rtl2832_sdr-clean-the-freed-pointer-and-counte.patch:

   checkpatch.pl:
	$ cat patches/0003-media-rtl2832_sdr-clean-the-freed-pointer-and-counte.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Non-standard signature: 'Asked-by:' - perhaps 'Acked-by:'?


Error #512 when building PDF docs

