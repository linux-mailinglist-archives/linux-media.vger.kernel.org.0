Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00E233D015
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 09:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhCPIrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 04:47:42 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48852 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230215AbhCPIrQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 04:47:16 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lM5M9-000qdi-RP; Tue, 16 Mar 2021 08:47:13 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lM5Q0-0007u0-Df; Tue, 16 Mar 2021 08:51:12 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.13] Various fixes (#72313)
Date:   Tue, 16 Mar 2021 08:51:12 +0000
Message-Id: <20210316085112.30335-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2b1c3894-0de4-fdbb-5fd5-004765a5a5ea@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/2b1c3894-0de4-fdbb-5fd5-004765a5a5ea@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/94498/
Build time: 00:09:18
Link: https://lore.kernel.org/linux-media/2b1c3894-0de4-fdbb-5fd5-004765a5a5ea@xs4all.nl

gpg: Signature made Tue 16 Mar 2021 08:27:35 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: AAA7 FFBA 4D2D 77EF 4CAE  A142 1326 E0CD 23AB DCE5

Summary: got 3/14 patches with issues, being 0 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0007-v4l2-ioctl.c-fix-timestamp-format.patch:

   checkpatch.pl:
	$ cat patches/0007-v4l2-ioctl.c-fix-timestamp-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:23: WARNING: Avoid logging continuation uses where feasible
	-:24: CHECK: Alignment should match open parenthesis

patches/0012-media-camera-mx2-Remove-unused-header-file.patch:

   checkpatch.pl:
	$ cat patches/0012-media-camera-mx2-Remove-unused-header-file.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0013-media-camera-mx3-Remove-unused-header-file.patch:

   checkpatch.pl:
	$ cat patches/0013-media-camera-mx3-Remove-unused-header-file.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

