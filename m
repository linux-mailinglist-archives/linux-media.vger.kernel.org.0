Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62E516F6DB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 06:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgBZFN3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 00:13:29 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35591 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726928AbgBZFN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 00:13:28 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:3dfe:f008:611d:ab27])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6p0fj3sSgjmHT6p0gjabML; Wed, 26 Feb 2020 06:13:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582694006; bh=wAEA7G5h6yhgySSZBoGOisk1Lt7dPOcHpm+zj3P4e3g=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=acceuVwzHPq0uwcY0ZUrwsja9yOh11M4QxqRP4LJ1yjHBDLiGdGrnmMAMR7fREhHn
         MBPLk+gs+PGO70psGcvAVfnlBdkzK/4xY+aAErG1hGZoxjn0A2UlUuPXseMe9Ztlt9
         5f/Ltmv9NrPzn2SksU9xwGi9KioLx7ConwCzSpVl7lspSZEgbLMX1TGsHfn5Rmr8mu
         zLTPAVcnEQgiVdrEgdeARxJsdMxY9kTSCsP5j18SIo/Ui/ySvJvezFp8BqkcCnt+ZQ
         mcppFm18DoE1cIp43fOF2Blx1GQp/htNoxFdgVu3ulcP5k12Ndvq4vTuZGv13EnFXW
         WaanwU2iqd3VQ==
Message-ID: <cac98313dda8e0129f8dd80a36cb16aa@smtp-cloud7.xs4all.net>
Date:   Wed, 26 Feb 2020 06:13:25 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfMLcxrzPjclPRa3N0B09xtSjz0+L2WwMA9kvUJCMwG7n7u3wuliduPshVArtWCo4AZlvZYUngZERuZZBRt6G8o3RNLMcHxzvWTtfxvY/MY7U/bf9qcXe
 7qZlxgYs6n3xQB7BKL4HI3B/wEKj+vhkhA2Uyit+Jp9t2UnazJH4gyMvh1C4N170QNCQ/sVset5SnTWR4tZCKu7H4PzjbhPhxsRW8eCu0R3l1klJ+HJsWIbr
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Feb 26 05:00:10 CET 2020
media-tree git hash:	ef0ed05dcef8a74178a8b480cce23a377b1de2b8
media_build git hash:	e3e7c2632a298bb886608a95da5ec40bdb54fd92
v4l-utils git hash:	e44e9a916a23952c81dc08d9e09c33b1929ce262
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0a0399d66d361fec135a2dc184bd8d12148f35ad
host hardware:		x86_64
host os:		5.4.0-3-amd64

linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-multi: OK
linux-git-arm-pxa: OK
linux-git-arm-stm32: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-mips: OK
linux-git-powerpc64: OK
linux-git-sh: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-3.10.108-i686: OK
linux-3.10.108-x86_64: OK
linux-3.11.10-i686: OK
linux-3.11.10-x86_64: OK
linux-3.12.74-i686: OK
linux-3.12.74-x86_64: OK
linux-3.13.11-i686: OK
linux-3.13.11-x86_64: OK
linux-3.14.79-i686: OK
linux-3.14.79-x86_64: OK
linux-3.15.10-i686: OK
linux-3.15.10-x86_64: OK
linux-3.16.81-i686: OK
linux-3.16.81-x86_64: OK
linux-3.17.8-i686: OK
linux-3.17.8-x86_64: OK
linux-3.18.136-i686: OK
linux-3.18.136-x86_64: OK
linux-3.19.8-i686: OK
linux-3.19.8-x86_64: OK
linux-4.0.9-i686: OK
linux-4.0.9-x86_64: OK
linux-4.1.52-i686: OK
linux-4.1.52-x86_64: OK
linux-4.2.8-i686: OK
linux-4.2.8-x86_64: OK
linux-4.3.6-i686: OK
linux-4.3.6-x86_64: OK
linux-4.4.212-i686: OK
linux-4.4.212-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.212-i686: OK
linux-4.9.212-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.169-i686: OK
linux-4.14.169-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.101-i686: OK
linux-4.19.101-x86_64: OK
linux-4.20.15-i686: OK
linux-4.20.15-x86_64: OK
linux-5.0.15-i686: OK
linux-5.0.15-x86_64: OK
linux-5.1.1-i686: OK
linux-5.1.1-x86_64: OK
linux-5.2.1-i686: OK
linux-5.2.1-x86_64: OK
linux-5.3.1-i686: OK
linux-5.3.1-x86_64: OK
linux-5.4.17-i686: OK
linux-5.4.17-x86_64: OK
linux-5.5.1-i686: OK
linux-5.5.1-x86_64: OK
linux-5.6-rc1-i686: OK
linux-5.6-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
