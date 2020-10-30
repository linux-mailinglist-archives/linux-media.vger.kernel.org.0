Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549BE2A01C5
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 10:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgJ3Jsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 05:48:47 -0400
Received: from www.linuxtv.org ([130.149.80.248]:59238 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgJ3Jsp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 05:48:45 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYR1Y-0074BK-8J; Fri, 30 Oct 2020 09:48:44 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kYR4V-0000Zt-Pz; Fri, 30 Oct 2020 09:51:47 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11] rkisp1 fixes/changes (#68424)
Date:   Fri, 30 Oct 2020 09:51:47 +0000
Message-Id: <20201030095147.2180-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <613dc41c-7174-7c32-7c28-c05ff1e8348c@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/613dc41c-7174-7c32-7c28-c05ff1e8348c@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/74814/
Build time: 00:14:06
Link: https://lore.kernel.org/linux-media/613dc41c-7174-7c32-7c28-c05ff1e8348c@xs4all.nl

gpg: Signature made Fri 30 Oct 2020 09:12:01 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 5/17 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0009-media-staging-rkisp1-capture-set-default-quantizatio.patch:

   checkpatch.pl:
	$ cat patches/0009-media-staging-rkisp1-capture-set-default-quantizatio.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:11: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0012-media-staging-dt-bindings-rkisp1-drop-i2c-unit-addre.patch:

   checkpatch.pl:
	$ cat patches/0012-media-staging-dt-bindings-rkisp1-drop-i2c-unit-addre.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:10: WARNING: 'unecessary' may be misspelled - perhaps 'unnecessary'?

patches/0014-media-staging-dt-bindings-rkisp1-drop-parent-unit-ad.patch:

   checkpatch.pl:
	$ cat patches/0014-media-staging-dt-bindings-rkisp1-drop-parent-unit-ad.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0015-media-staging-rkisp1-remove-unecessary-clocks.patch:

   checkpatch.pl:
	$ cat patches/0015-media-staging-rkisp1-remove-unecessary-clocks.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:4: WARNING: 'unecessary' may be misspelled - perhaps 'unnecessary'?

patches/0016-dt-bindings-media-rkisp1-move-rockchip-isp1-bindings.patch:

   checkpatch.pl:
	$ cat patches/0016-dt-bindings-media-rkisp1-move-rockchip-isp1-bindings.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
	-:18: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

