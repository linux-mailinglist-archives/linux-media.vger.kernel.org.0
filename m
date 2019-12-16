Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2716B120F31
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 17:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfLPQSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 11:18:33 -0500
Received: from www.linuxtv.org ([130.149.80.248]:47874 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbfLPQSd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 11:18:33 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1igt4Q-00HSH4-JT; Mon, 16 Dec 2019 16:18:06 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1igt5h-0005yV-M7; Mon, 16 Dec 2019 16:19:25 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.6] y2038 safety in v4l2
Date:   Mon, 16 Dec 2019 16:19:25 +0000
Message-Id: <20191216161925.22916-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <362c4787-e114-1b90-66e2-f9a1cbafe567@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/patch/60777/
Build log: https://builder.linuxtv.org/job/patchwork/29469/
Build time: 00:38:59
Link: https://lore.kernel.org/linux-media/362c4787-e114-1b90-66e2-f9a1cbafe567@xs4all.nl

gpg: Signature made Mon 16 Dec 2019 03:12:40 PM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: 5 patches and/or PDF generation with issues, being 0 at build time

Error/warnings:


Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:71: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:72: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:73: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:74: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:75: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:76: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:77: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:78: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:79: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:80: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:81: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:82: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:83: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:84: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:85: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:86: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:87: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:88: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:89: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:90: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:91: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:92: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:93: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:94: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:95: ERROR: trailing statements should be on next line
patches/0003-media-v4l2-core-compat-ignore-native-command-codes.patch:96: ERROR: trailing statements should be on next line

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-v4l2-core-fix-VIDIOC_DQEVENT-for-time64-ABI.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0005-media-v4l2-core-fix-VIDIOC_DQEVENT-for-time64-ABI.patch
patches/0005-media-v4l2-core-fix-VIDIOC_DQEVENT-for-time64-ABI.patch:62: WARNING: Avoid logging continuation uses where feasible
patches/0005-media-v4l2-core-fix-VIDIOC_DQEVENT-for-time64-ABI.patch:63: CHECK: Alignment should match open parenthesis

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-v4l2-core-fix-v4l2_buffer-handling-for-time64-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0006-media-v4l2-core-fix-v4l2_buffer-handling-for-time64-.patch
patches/0006-media-v4l2-core-fix-v4l2_buffer-handling-for-time64-.patch:47: WARNING: Avoid logging continuation uses where feasible
patches/0006-media-v4l2-core-fix-v4l2_buffer-handling-for-time64-.patch:48: CHECK: Alignment should match open parenthesis
patches/0006-media-v4l2-core-fix-v4l2_buffer-handling-for-time64-.patch:174: CHECK: Please use a blank line after function/struct/union/enum declarations

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-v4l2-core-fix-compat-VIDIOC_DQEVENT-for-time64.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0007-media-v4l2-core-fix-compat-VIDIOC_DQEVENT-for-time64.patch
patches/0007-media-v4l2-core-fix-compat-VIDIOC_DQEVENT-for-time64.patch:98: WARNING: space prohibited between function name and open parenthesis '('
patches/0007-media-v4l2-core-fix-compat-VIDIOC_DQEVENT-for-time64.patch:98: ERROR: Macros with complex values should be enclosed in parentheses
patches/0007-media-v4l2-core-fix-compat-VIDIOC_DQEVENT-for-time64.patch:108: ERROR: trailing statements should be on next line
patches/0007-media-v4l2-core-fix-compat-VIDIOC_DQEVENT-for-time64.patch:123: WARNING: line over 80 characters

Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:
$ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch
patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:84: WARNING: line over 80 characters
patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:247: WARNING: line over 80 characters
patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:332: ERROR: trailing statements should be on next line
patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:336: ERROR: trailing statements should be on next line
patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:338: ERROR: trailing statements should be on next line
patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:346: WARNING: line over 80 characters
patches/0008-media-v4l2-core-fix-compat-v4l2_buffer-handling-for-.patch:346: ERROR: trailing statements should be on next line

