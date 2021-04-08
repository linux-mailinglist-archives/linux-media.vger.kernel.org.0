Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E99357F10
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhDHJYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:24:04 -0400
Received: from www.linuxtv.org ([130.149.80.248]:32818 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhDHJYE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 05:24:04 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lUQtE-00HAw1-Kh; Thu, 08 Apr 2021 09:23:52 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lUQxF-0004lt-1f; Thu, 08 Apr 2021 09:28:01 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] DVB & RC fixes (#73011)
Date:   Thu,  8 Apr 2021 09:28:00 +0000
Message-Id: <20210408092800.18300-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408091421.GA22127@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20210408091421.GA22127@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/97812/
Build time: 00:06:27
Link: https://lore.kernel.org/linux-media/20210408091421.GA22127@gofer.mess.org

gpg: Signature made Thu 08 Apr 2021 08:57:37 AM UTC
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
	-:41: ERROR: space required after that ',' (ctx:VxV)
	-:54: ERROR: space required after that ',' (ctx:VxV)

patches/0010-media-dvb-usb-avoid-Wempty-body-warnings.patch:

   checkpatch.pl:
	$ cat patches/0010-media-dvb-usb-avoid-Wempty-body-warnings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:37: ERROR: space required after that ',' (ctx:VxV)
	-:37: ERROR: space required after that ',' (ctx:VxV)
	-:38: ERROR: space required after that ',' (ctx:VxV)
	-:38: ERROR: space required after that ',' (ctx:VxV)


Error #512 when building PDF docs

