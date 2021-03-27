Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF29334B611
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 11:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhC0KVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 06:21:30 -0400
Received: from www.linuxtv.org ([130.149.80.248]:38498 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhC0KVa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 06:21:30 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lQ64O-000IFy-R2; Sat, 27 Mar 2021 10:21:28 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lQ68K-0005qu-1n; Sat, 27 Mar 2021 10:25:32 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Various fixes (#72675)
Date:   Sat, 27 Mar 2021 10:25:31 +0000
Message-Id: <20210327102531.22455-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b2a45eb6-df13-05e3-c24b-6025bb41fd04@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/b2a45eb6-df13-05e3-c24b-6025bb41fd04@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/96091/
Build time: 00:04:23
Link: https://lore.kernel.org/linux-media/b2a45eb6-df13-05e3-c24b-6025bb41fd04@xs4all.nl

gpg: Signature made Sat 27 Mar 2021 10:06:41 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/7 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0003-vivid-update-EDID.patch:

   checkpatch.pl:
	$ cat patches/0003-vivid-update-EDID.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0006-media-exynos4-is-Fix-kernel-doc-entries-in-fimc-is.h.patch:

   checkpatch.pl:
	$ cat patches/0006-media-exynos4-is-Fix-kernel-doc-entries-in-fimc-is.h.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0007-media-s5p-mfc-Fix-kernel-doc-entries-in-s5p_mfc_comm.patch:

   checkpatch.pl:
	$ cat patches/0007-media-s5p-mfc-Fix-kernel-doc-entries-in-s5p_mfc_comm.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:8: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

