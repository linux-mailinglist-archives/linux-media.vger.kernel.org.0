Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1622D107D
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 13:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgLGMWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 07:22:19 -0500
Received: from www.linuxtv.org ([130.149.80.248]:50508 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726748AbgLGMWT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 07:22:19 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kmFWL-00957a-Df; Mon, 07 Dec 2020 12:21:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kmFZX-0002ZA-5L; Mon, 07 Dec 2020 12:24:55 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.11 or v5.12] Rework RGB and YUV pixel formats (#69836)
Date:   Mon,  7 Dec 2020 12:24:55 +0000
Message-Id: <20201207122455.9823-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <203c4f5f-8d4c-caad-9384-9f55d037ff9e@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/203c4f5f-8d4c-caad-9384-9f55d037ff9e@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/80283/
Build time: 00:10:49
Link: https://lore.kernel.org/linux-media/203c4f5f-8d4c-caad-9384-9f55d037ff9e@xs4all.nl

gpg: Signature made Mon 07 Dec 2020 09:32:27 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 4/16 patches with issues, being 0 at build time

Error/warnings:

patches/0010-media-doc-pixfmt-yuv-Move-all-packed-YUV-formats-to-.patch:

   checkpatch.pl:
	$ cat patches/0010-media-doc-pixfmt-yuv-Move-all-packed-YUV-formats-to-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:204: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0014-media-doc-pixfmt-yuv-Move-all-luma-only-YUV-formats-.patch:

   checkpatch.pl:
	$ cat patches/0014-media-doc-pixfmt-yuv-Move-all-luma-only-YUV-formats-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:35: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0015-media-doc-pixfmt-yuv-Move-all-semi-planar-YUV-format.patch:

   checkpatch.pl:
	$ cat patches/0015-media-doc-pixfmt-yuv-Move-all-semi-planar-YUV-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:32: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0016-media-doc-pixfmt-yuv-Move-all-planar-YUV-formats-to-.patch:

   checkpatch.pl:
	$ cat patches/0016-media-doc-pixfmt-yuv-Move-all-planar-YUV-formats-to-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:527: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

