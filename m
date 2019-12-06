Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D947F114BC0
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 05:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfLFEz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 23:55:59 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:55199 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726020AbfLFEz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 23:55:59 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:9981:264c:cf64:d437])
        by smtp-cloud8.xs4all.net with ESMTPA
        id d5eli41CW85rjd5emi9QJm; Fri, 06 Dec 2019 05:55:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575608156; bh=ynNioM3prGu/WGbHfE/TiU5uivnA5rwbZJhfCyRHUz4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=vb8jB3OQr2Y1kQYN2D+pdsT+jppM6bxGFBGjsJNysW2WGC1m8Lsjc2N6kVZoWSBWw
         gKiSffBt9oLCesQnE2zmWJ+BVuOMD1Nqfd3W3cFLFIYqsiE0BHcd3aAF+v20gn77Ml
         cMwvZWVjTfj4kPbltb6rHlE7Hq+RwG9/mQqVL8KlxPRtIpQagCA2GvrROBXdXR/g6H
         iWd8Vu7agCaA7TORYqluMwfUFSIbw4JWnkSxTYOmlygXenn78QzhTuj699d38SB9VM
         O0mc0+H4qb40s+Vu6ZQi8/OsOxEL5pfmK8H8nue4RQw/V8nuntXP0/9t/EfMUNtEBz
         a29TQ0g97erjA==
Message-ID: <ff47f199a1220a31973a9cb76eacfdcc@smtp-cloud8.xs4all.net>
Date:   Fri, 06 Dec 2019 05:55:55 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfI3tcFy4xNxwgGStGReLgKtNJmfDSNFCw+UkV40Kdz7f2qU/t412EmlkLiA+26i3Yg3pjl07RP20+IQcuOXR3kD75DfxyXN0TNudRxPJhpdYX50B1xjj
 RguYW794XZPL55HP7YgkajiQivk0kj6gUtobqSZIf0LGs1r5hiWvdXoH51Bzz2PhrTEfWZeJ+kvsEZvi3VtsOv3M2+b/1gVQTjMA8aehZrxp/TrZ3KiHXLxI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Dec  6 05:00:11 CET 2019
media-tree git hash:	dca6b3733a4a46e63603496f544ece8ace541fde
media_build git hash:	efba365ba11b958a6bf6fb4b397942f9461cefca
v4l-utils git hash:	17640cb6820a33ec4651598452d9f4e5798fd6b6
edid-decode git hash:	2ae93f10ba705415c0283f441e6e858cc518c1f0
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6903fe8f5101fc43440b3259290c97d2dd51733d
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
linux-3.16.63-i686: OK
linux-3.16.63-x86_64: OK
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
linux-4.4.167-i686: OK
linux-4.4.167-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.162-i686: OK
linux-4.9.162-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.105-i686: OK
linux-4.14.105-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.28-i686: OK
linux-4.19.28-x86_64: OK
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
linux-5.4-i686: OK
linux-5.4-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2793, Succeeded: 2793, Failed: 0, Warnings: 4
sparse: WARNINGS
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
