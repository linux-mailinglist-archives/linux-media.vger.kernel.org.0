Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B13617B599
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 05:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgCFE3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 23:29:39 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33561 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727389AbgCFE3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Mar 2020 23:29:38 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:6001:5f9a:7b94:512])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A4cBjnRKK9Im2A4cCjC6bb; Fri, 06 Mar 2020 05:29:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583468976; bh=ld9SPaNPLTnW0yFJWWQEmhtcW4yrr1uFDpIif3F8G5I=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=M/T4q69VY5BLs4gubhP4tejvoMgmN9wr18fGrHvZC9TeUGChZflijGRugwZLsy67i
         59M+7VviPdl7PlYP77QKoKHPq9IxaB7RHqJb0O9KTl2R55zXn4HdMGaHUno0znx5H5
         YKiMbAma0sro4ffvAXcz0nhg9QWD//6MksuWSE1fr5KksdhO+InpAgUYrkIoLv9QoE
         qKRcwUHFGo75/dju9DT2JH8u3oWTxqSYqRlfdBEj95Ugl6Wncry2doviRjsVEAV5hX
         7yPnFSPwfj8wsb5rGWC+mPUhm6I47CSfaPufuw+MPD/PUROfdID/VsdJFirLyc1Joi
         B4Zt88XFegobA==
Message-ID: <7976e0ddfcadbcef02335ac5f740252d@smtp-cloud9.xs4all.net>
Date:   Fri, 06 Mar 2020 05:29:35 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfN/KOLerXgIg7UQFUWje4KdGlCQRWOMtVzYKiRk66gObPVT9VDD8YNDN5nG2Cj29zFS148P5A9QXIpp07SR/b865+gfaKDGwGeJm44DqhuUy/c5+lGmY
 gLzTpI8bieoY+nBelSlOxwwQNteU+alglgR7eo+q333m/I77EzzmyPAmePhLxgo0uuLqKl52DoQgkATDP1WpYfgxBsLxqXEszui5R4QqQ46aDBjl3XKVEzgJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Mar  6 05:00:09 CET 2020
media-tree git hash:	00c43088aa680989407b6afbda295f67b3f123f1
media_build git hash:	680a07be51069bee47a07a4bcf36c5176f1290a4
v4l-utils git hash:	411915c09c56f1346b5f2f4f522c92637c56996b
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a415366fdbce7553a6a46799ed0d2f8fb5fffcd9
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-3.10.108-i686: ERRORS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
