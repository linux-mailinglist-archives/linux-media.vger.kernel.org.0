Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C011639CC7A
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 05:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhFFDb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 23:31:29 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38269 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230075AbhFFDb3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 23:31:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pjTklXW2uhqltpjTmlFp7h; Sun, 06 Jun 2021 05:29:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622950178; bh=HLMesqZ5erHu5t9dow6Bgj/5MoISx98oplFgCFgB6uA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=LRuvbbmkV8MQnTYGwFYB4WNxZ/Ib5SY+c1wYFf4LFOV6YSeP9vVywhNd9IUj3DSLY
         UbE0+Ov7GaVb4EpbO95q1tO8o/inGEwmbsi02nR2J2wmg7rMpvASqq7hULkGW5V7Z1
         2dKpHX6rnQ/DGJGhQHEmv2EOJb1N9WkV045Scs+Quv69YZo+gR63hnyNU90yQmnXBO
         YiSFGC4PTmgN2mF44DmG+kfnZUNLtc3MGvGCC94LJJT+oSDSQynnyIo3pXgd8B84ZM
         reUJolv01DAq0w1NxybSCOx4KQ5aKoG1l5PBfd5GyhQUwePS37MY9Qj6govobX7/3d
         MPNVqk8V4YKQQ==
Message-ID: <053058b7cbdf889d4f6bccca140f6a2d@smtp-cloud8.xs4all.net>
Date:   Sun, 06 Jun 2021 05:29:36 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfGpRLlIjbLDNxLDgVVue66KrkZ9tYOG3sGR2hyBQM/YSxNxDp9bIn6oXeP3HN2QqtHkclc0Z3lhulCtEVnVkCOU/JIcbqGezb/qPLM5ZrtweCUiLEhRj
 mXpxtfLcV5qsHwvt9wiaD2fPNCZLlBjcmALb/EQrYJQKEANOPKPaIo3fH5aFOGM0DA6ojcmqNJnPqt3LvFj14N17xHGfpOPeslmwQgXBe0sliGuWtdgNwBP5
 6bH/CD9LxLQukRU2k5+chw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Jun  6 05:00:11 CEST 2021
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
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
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
virtme: WARNINGS: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: ERRORS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
