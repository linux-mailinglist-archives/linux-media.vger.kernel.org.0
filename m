Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AEB40C17C
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 10:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbhIOIPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 04:15:40 -0400
Received: from www.linuxtv.org ([130.149.80.248]:56898 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231610AbhIOIPf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 04:15:35 -0400
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mQQ3c-00B0Fi-A8; Wed, 15 Sep 2021 08:14:16 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1mQQ3Z-009SsR-VM; Wed, 15 Sep 2021 08:14:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v5.15] Fix for IR Toy issue (#77011)
Date:   Wed, 15 Sep 2021 08:14:13 +0000
Message-Id: <20210915081413.2255909-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915075331.GA8620@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210915075331.GA8620@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/139547/
Build time: 00:15:17
Link: https://lore.kernel.org/linux-media/20210915075331.GA8620@gofer.mess.org

gpg: Signature made Wed 15 Sep 2021 07:29:09 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: A624 251A 2608 4A9E D9E4  C8B6 425F 639D 3960 FA9E

Summary: got 1/1 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-ir_toy-prevent-device-from-hanging-during-tran.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #512:
	../drivers/media/cec/core/cec-adap.c: ../drivers/media/cec/core/cec-adap.c:926 cec_transmit_msg_fh() warn: '&data->list' not removed from list
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/rc/ir_toy.c:326:36: error: ‘STATE_RESET’ undeclared (first use in this function)
	../drivers/media/rc/ir_toy.c:326:36: note: each undeclared identifier is reported only once for each function it appears in
	make[4]: *** [../scripts/Makefile.build:271: drivers/media/rc/ir_toy.o] Error 1
	make[3]: *** [../scripts/Makefile.build:514: drivers/media/rc] Error 2
	make[3]: *** Waiting for unfinished jobs....
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2888 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	make[2]: *** [../scripts/Makefile.build:514: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1842: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2

    allmodconfig: return code #512:
	../drivers/media/rc/ir_toy.c:326:36: error: ‘STATE_RESET’ undeclared (first use in this function)
	../drivers/media/rc/ir_toy.c:326:36: note: each undeclared identifier is reported only once for each function it appears in
	make[4]: *** [../scripts/Makefile.build:271: drivers/media/rc/ir_toy.o] Error 1
	make[3]: *** [../scripts/Makefile.build:514: drivers/media/rc] Error 2
	make[3]: *** Waiting for unfinished jobs....
	make[2]: *** [../scripts/Makefile.build:514: drivers/media] Error 2
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1842: drivers] Error 2
	make: *** [Makefile:220: __sub-make] Error 2


Error #512 when building PDF docs

