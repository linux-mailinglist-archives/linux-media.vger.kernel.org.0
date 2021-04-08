Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BCC35806D
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 12:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhDHKSD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 06:18:03 -0400
Received: from www.linuxtv.org ([130.149.80.248]:37978 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229686AbhDHKSD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 06:18:03 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lURjT-00HEAt-Nn; Thu, 08 Apr 2021 10:17:51 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lURnU-0000ds-73; Thu, 08 Apr 2021 10:22:00 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL v2 FOR v5.13] DVB & RC fixes (#73015)
Date:   Thu,  8 Apr 2021 10:22:00 +0000
Message-Id: <20210408102200.2421-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408095617.GA22332@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210408095617.GA22332@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/97817/
Build time: 00:06:21
Link: https://lore.kernel.org/linux-media/20210408095617.GA22332@gofer.mess.org

gpg: Signature made Thu 08 Apr 2021 09:47:18 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 5/11 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0002-media-dvb-usb-remote-fix-dvb_usb_nec_rc_key_to_event.patch:

   checkpatch.pl:
	$ cat patches/0002-media-dvb-usb-remote-fix-dvb_usb_nec_rc_key_to_event.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:18: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0003-media-rc-add-keymaps-for-mecool-kii-pro-kiii-pro-rem.patch:

   checkpatch.pl:
	$ cat patches/0003-media-rc-add-keymaps-for-mecool-kii-pro-kiii-pro-rem.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:49: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0005-media-rc-remove-zte-zx-ir-driver.patch:

   checkpatch.pl:
	$ cat patches/0005-media-rc-remove-zte-zx-ir-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:26: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0009-media-flexcop-avoid-Wempty-body-warning.patch:

   checkpatch.pl:
	$ cat patches/0009-media-flexcop-avoid-Wempty-body-warning.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:43: WARNING: printk() should include KERN_<LEVEL> facility level
	-:61: WARNING: printk() should include KERN_<LEVEL> facility level
	-:80: WARNING: printk() should include KERN_<LEVEL> facility level

patches/0010-media-dvb-usb-avoid-Wempty-body-warnings.patch:

   checkpatch.pl:
	$ cat patches/0010-media-dvb-usb-avoid-Wempty-body-warnings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:38: WARNING: Statements should start on a tabstop
	-:38: WARNING: printk() should include KERN_<LEVEL> facility level
	-:38: WARNING: braces {} are not necessary for single statement blocks
	-:41: CHECK: Macro argument reuse 'func' - possible side-effects?


Error #512 when building PDF docs

