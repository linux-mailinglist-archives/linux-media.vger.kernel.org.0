Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74D701568EA
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2020 06:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgBIFR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 00:17:27 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53829 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725796AbgBIFR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 9 Feb 2020 00:17:27 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:2180:8763:f2b9:fb88])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 0eyAj17MWVuxO0eyCjpUj2; Sun, 09 Feb 2020 06:17:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581225444; bh=i0SqaF/Xdz0Eisr8aJQnGhamunhMuenMdFeV6TeXRdg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=WBkikaPj6vPrjgPnKIoLc0uBxpLBB4tHF3RnB7fu3wkTkQGaK+clVDzriDHy7c0t8
         ++459qqRS2B5NLbEJB+1wfXe1WCgm4Fdy4VUQt/CSAh3BxQFJeNgccmAdLQFCLVS6h
         O1RytIs0zkS3muAReBeu/ybEQ3lvtSTjMgYP+DWPpMeJeFCW9IiWIemnaPYOiX8VTQ
         aPM1akPadXXIYwE98xit4TlTtxyfHpyXp7nyouNi6wTKRpktl+RBYZzuVAU2zCTftf
         9d26/SchWuzkjHqvWozyd2KJz2TWRbfq2FaHml8zF4nINrgmauFva97unwM04A7O/V
         fiVtlLTLJj5kg==
Message-ID: <41042f0ca0bed16b3c2fbfe80fb0c178@smtp-cloud7.xs4all.net>
Date:   Sun, 09 Feb 2020 06:17:22 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfBsPwxO5o5og2Vmh+VQrPaZAI5LoBbU8N1290LNf5Hk9SfiOlkH6jdyIbMoBFht2PvA6ZWzp9G+22hNVtSEL0//k5REp9DAejIMNU2iVoMmthZGHHfqO
 8wJ9Kegq5QYQY8n+jW2NFbbWlHkisMqEvWl2KdsiXeRzsmGachQOi55mmVMbhRolWKWnUGLNR+ktYtrG94k8+iaICvCYzNY0IAllKRpfDrxgTPET6dLOfKNz
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Feb  9 05:00:13 CET 2020
media-tree git hash:	1697d98124819aab09b86602978bd4f50e101e2d
media_build git hash:	7b37031dca3e3af4b8416e028dc0e10a37ca99c7
v4l-utils git hash:	67962f1277b483060a16b80cbe79fac56d4e2cc6
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3d3588941cf3abd517734f6448eeaeaa0c61a27f
host hardware:		x86_64
host os:		5.2.0-3-amd64

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
linux-4.4.212-i686: ERRORS
linux-4.4.212-x86_64: ERRORS
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
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2939, Failed: 4, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
