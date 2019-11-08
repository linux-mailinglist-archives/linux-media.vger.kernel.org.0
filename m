Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B4CF4876
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 12:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387515AbfKHL5K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 06:57:10 -0500
Received: from www.linuxtv.org ([130.149.80.248]:51296 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391048AbfKHLpM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 06:45:12 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iT2hO-0000KO-Gn; Fri, 08 Nov 2019 11:45:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iT2i0-0003EJ-68; Fri, 08 Nov 2019 11:45:44 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.5] DVB/RC fixes (3nd)
Date:   Fri,  8 Nov 2019 11:45:44 +0000
Message-Id: <20191108114544.12374-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108112041.GA14408@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/59959/
Build log: https://builder.linuxtv.org/job/patchwork/23976/
Build time: 00:15:31
Link: https://lore.kernel.org/linux-media/20191108112041.GA14408@gofer.mess.org

gpg: Signature made Fri 08 Nov 2019 09:11:23 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: 1 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-rc-add-keymap-for-Beelink-GS1-remote-control.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-rc-add-keymap-for-Beelink-GS1-remote-control.patch
patches/0004-media-rc-add-keymap-for-Beelink-GS1-remote-control.patch:33: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.txt
patches/0004-media-rc-add-keymap-for-Beelink-GS1-remote-control.patch:46: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
patches/0004-media-rc-add-keymap-for-Beelink-GS1-remote-control.patch:52: WARNING: 'ment' may be misspelled - perhaps 'meant'?
patches/0004-media-rc-add-keymap-for-Beelink-GS1-remote-control.patch:134: WARNING: 'ment' may be misspelled - perhaps 'meant'?

