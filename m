Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F48639C57E
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 05:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhFEDbn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 23:31:43 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53395 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229726AbhFEDbm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Jun 2021 23:31:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pN0RlWggshg8ZpN0Tl1eKN; Sat, 05 Jun 2021 05:29:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622863793; bh=CMdnNUbBTCO1DY/NQrTOKDPrKVbMB/9YwKFHfFrOd04=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=X1oyafjlXNV0ntgHAdmFDkqfKNQqUw+H6HIAZK5MglukgURsNgNo2nwOp6pCR8Hf2
         cNhu8U3EWls0L41RAb6Fsqm9lk0WuQb/zjO5hjH6FhMjpI/pFtzRdLsG7uq+sfwrij
         JHPI32K9IpNn1SGQjHTsvwmHXAfqpa6blgts4UdcKW4xoDUbUn5NwMYqZDtHP/1Ioe
         OcdmKTZ0kx7RZEnlcz2njfHGbKqDGl8voTmu1Gz0A4enyp5dl1D9mennfNXHhmOsB8
         8JHG3QANeNHipKJOBJoPiUCt8eLzme0Jo/prGM1btQrI8iZfjyVVztyfBZ4Mu3BKgJ
         xggkDDpzmxiww==
Message-ID: <89e9285a90ae34c0e88b41cb19cc25f9@smtp-cloud9.xs4all.net>
Date:   Sat, 05 Jun 2021 05:29:51 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfB2fXKp0DeanUAbH0zptSxgEpKam3XySSf0dc8xUoCFDiZnZc8gh5oPs7XP+C0M8iHq9E2DU43fFsa3MD+boBhaB2RL//D368COokYsdVfUjhEIQysuw
 2aDxhvPJqKmDq9O2mRLRfYvdfy0omlXOuS/ZX+nV02p1xaQc8FXf+8KKz6iCnmqtg+7ZhJXGqOb9IXq51MfL6Y2JDY7fRdME3lxLrSCsl1JYVA9G/1cMVslg
 AwIM2U8ONZoVtUuq+S0FMg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jun  5 05:00:13 CEST 2021
media-tree git hash:	c11669f738f48c7b3cf3b7ec700af33e1566d9c3
media_build git hash:	b85393d37cdac84cb846802f0d62259aa679c994
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7445-g58776ae33
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b010e650519b1cd0d44b110c056ef26ae6ff80a7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.258-i686: ERRORS
linux-4.4.258-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.258-i686: ERRORS
linux-4.9.258-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.222-i686: ERRORS
linux-4.14.222-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.177-i686: ERRORS
linux-4.19.177-x86_64: ERRORS
linux-4.20.17-i686: ERRORS
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.0.21-x86_64: ERRORS
linux-5.1.21-i686: ERRORS
linux-5.1.21-x86_64: ERRORS
linux-5.2.21-i686: ERRORS
linux-5.2.21-x86_64: ERRORS
linux-5.3.18-i686: ERRORS
linux-5.3.18-x86_64: ERRORS
linux-5.4.100-i686: ERRORS
linux-5.4.100-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.13-i686: ERRORS
linux-5.8.13-x86_64: ERRORS
linux-5.9.1-i686: ERRORS
linux-5.9.1-x86_64: ERRORS
linux-5.10.18-i686: ERRORS
linux-5.10.18-x86_64: ERRORS
linux-5.11.1-i686: ERRORS
linux-5.11.1-x86_64: ERRORS
linux-5.12.1-i686: ERRORS
linux-5.12.1-x86_64: ERRORS
linux-5.13-rc1-i686: ERRORS
linux-5.13-rc1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: ERRORS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
