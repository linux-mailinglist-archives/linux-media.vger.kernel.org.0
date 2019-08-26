Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A579D490
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 18:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbfHZQ60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 12:58:26 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48927 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbfHZQ60 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 12:58:26 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i2IJx-0002EF-IT; Mon, 26 Aug 2019 16:58:21 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1i2IK3-0003rh-JY; Mon, 26 Aug 2019 16:58:27 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL] media patches
Date:   Mon, 26 Aug 2019 16:58:27 +0000
Message-Id: <20190826165827.14816-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826134529.5db7716b@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/58430/
Build log: https://builder.linuxtv.org/job/patchwork/13382/
Build time: 00:08:06
Link: https://lore.kernel.org/linux-media/20190826134529.5db7716b@coco.lan

gpg: Signature made Mon 26 Aug 2019 10:00:59 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]

Summary: 5 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:

patches/0002-media-vicodec-make-life-easier-for-static-analyzers.patch:7: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0002-media-vicodec-make-life-easier-for-static-analyzers.patch
patches/0003-media-aspeed-video-address-a-protential-usage-of-an-.patch:19: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-aspeed-video-address-a-protential-usage-of-an-.patch
patches/0004-media-ov9650-add-a-sanity-check.patch:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0004-media-ov9650-add-a-sanity-check.patch
patches/0005-media-use-the-BIT-macro.patch:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
patches/0005-media-use-the-BIT-macro.patch:742: WARNING: 'WIAT' may be misspelled - perhaps 'WAIT'?
patches/0005-media-use-the-BIT-macro.patch:743: WARNING: 'WIAT' may be misspelled - perhaps 'WAIT'?
patches/0005-media-use-the-BIT-macro.patch:744: WARNING: 'WIAT' may be misspelled - perhaps 'WAIT'?
patches/0005-media-use-the-BIT-macro.patch:745: WARNING: 'WIAT' may be misspelled - perhaps 'WAIT'?

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-use-the-BIT-macro.patch
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:147: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:156: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:165: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:191: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:204: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:213: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:257: WARNING: line over 80 characters
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:257: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:264: WARNING: line over 80 characters
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:264: CHECK: Prefer using the BIT macro
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:312: CHECK: spaces preferred around that '<<' (ctx:VxV)
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:347: ERROR: trailing statements should be on next line
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:356: ERROR: trailing statements should be on next line
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:370: ERROR: trailing statements should be on next line
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:388: ERROR: trailing statements should be on next line
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:401: ERROR: trailing statements should be on next line
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:410: ERROR: trailing statements should be on next line
patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch:423: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-don-t-do-a-31-bit-shift-on-a-signed-int.patch

