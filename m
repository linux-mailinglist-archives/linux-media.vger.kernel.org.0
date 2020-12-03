Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE79F2CD3F0
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 11:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730258AbgLCKon (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 05:44:43 -0500
Received: from www.linuxtv.org ([130.149.80.248]:52000 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729194AbgLCKon (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 05:44:43 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkm5i-003HqA-54; Thu, 03 Dec 2020 10:44:02 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kkm8s-0007lP-Cz; Thu, 03 Dec 2020 10:47:18 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] Add pine64 keymap (#69683)
Date:   Thu,  3 Dec 2020 10:47:18 +0000
Message-Id: <20201203104718.29802-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203103043.GA13676@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201203103043.GA13676@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/79700/
Build time: 00:03:46
Link: https://lore.kernel.org/linux-media/20201203103043.GA13676@gofer.mess.org

gpg: Signature made Thu 03 Dec 2020 10:22:19 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 1/1 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-rc-add-keymap-for-pine64-remote.patch:

    allmodconfig: return code #512:
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-core.c:32:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	In file included from ../drivers/media/i2c/ccs/ccs.h:19,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:17:
	../drivers/media/i2c/ccs/ccs-data.h:40:1: warning: "/*" within comment [-Wcomment]
	../drivers/media/i2c/ccs/ccs-reg-access.c:207:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:210:11: error: dereferencing pointer to incomplete type ‘struct ccs_reg’
	../drivers/media/i2c/ccs/ccs-reg-access.c:380:37: error: increment of pointer to an incomplete type ‘struct ccs_reg’
	In file included from ../include/linux/kernel.h:14,
	                 from ../include/linux/unaligned/access_ok.h:5,
	                 from ../arch/x86/include/asm/unaligned.h:9,
	                 from ../drivers/media/i2c/ccs/ccs-reg-access.c:12:
	../include/linux/minmax.h:42:2: error: first argument to ‘__builtin_choose_expr’ not a constant
	../include/linux/minmax.h:51:19: note: in expansion of macro ‘__careful_cmp’
	../drivers/media/i2c/ccs/ccs-reg-access.c:388:14: note: in expansion of macro ‘min’
	make[4]: *** [../scripts/Makefile.build:283: drivers/media/i2c/ccs/ccs-reg-access.o] Error 1
	make[3]: *** [../scripts/Makefile.build:500: drivers/media/i2c/ccs] Error 2
	make[2]: *** [../scripts/Makefile.build:500: drivers/media/i2c] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [/var/lib/jenkins/workspace/patchwork/Makefile:1797: drivers/media] Error 2
	make: *** [Makefile:185: __sub-make] Error 2

   checkpatch.pl:
	$ cat patches/0001-media-rc-add-keymap-for-pine64-remote.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:34: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:47: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

