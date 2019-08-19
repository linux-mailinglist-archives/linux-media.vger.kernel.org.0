Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2043C922BF
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 13:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfHSLv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 07:51:27 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53862 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726594AbfHSLv0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 07:51:26 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hzgBx-0004qs-Ct; Mon, 19 Aug 2019 11:51:17 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hzgC0-0001LP-0F; Mon, 19 Aug 2019 11:51:20 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.4] Various fixes DVB/RC
Date:   Mon, 19 Aug 2019 11:51:19 +0000
Message-Id: <20190819115119.5126-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190819113126.fo3dvsux5eogcq5b@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58279/
Build log: https://builder.linuxtv.org/job/patchwork/12083/
Build time: 00:18:08
Link: https://lore.kernel.org/linux-media/20190819113126.fo3dvsux5eogcq5b@gofer.mess.org
Summary: 7 patches and/or PDF generation with issues, being 0 at build time

gpg: Signature made Mon 19 Aug 2019 11:23:59 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Can't check signature: No public key


Error/warnings:

patches/0003-media-rc-add-keymap-for-Amediatech-X96-MAX-remote.patch:30: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-rc-add-keymap-for-Amediatech-X96-MAX-remote.patch
patches/0004-media-rc-add-keymap-for-Khadas-VIM-EDGE-remote.patch:32: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-rc-add-keymap-for-Khadas-VIM-EDGE-remote.patch
patches/0005-media-rc-add-keymap-for-Tanix-TX3-mini-remote.patch:30: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-rc-add-keymap-for-Tanix-TX3-mini-remote.patch
patches/0006-media-rc-add-keymap-for-Tanix-TX5-max-remote.patch:30: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-rc-add-keymap-for-Tanix-TX5-max-remote.patch
patches/0007-media-rc-add-keymap-for-WeTek-Hub-remote.patch:30: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-rc-add-keymap-for-WeTek-Hub-remote.patch
patches/0008-media-rc-add-keymap-for-WeTeK-Play-2-remote.patch:32: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-rc-add-keymap-for-WeTeK-Play-2-remote.patch
patches/0009-media-rc-add-keymap-for-HardKernel-ODROID-remote.patch:31: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0009-media-rc-add-keymap-for-HardKernel-ODROID-remote.patch

