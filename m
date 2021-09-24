Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74AD4416B0A
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 06:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237144AbhIXEpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 00:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhIXEpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 00:45:45 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C914AC061574
        for <linux-media@vger.kernel.org>; Thu, 23 Sep 2021 21:44:12 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Td4Bm7a3bISvdTd4DmvdDd; Fri, 24 Sep 2021 06:44:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1632458650; bh=3GapXoQaECQpHQszJL2A5ppVn9OylyS5f2W9a6SaK/g=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Og6svKm9QaH3wFVF+M5mRBUpuoyI+pJ9zxBGL/Qe7hEJRrSLRwXUyHKtXl9yLLhXg
         UXqzcRTFAoNlHPpzNsj4/h5LszdXrIFgSSqW4tVN2XGntcPxAfpHhjQkLTvu1FfUdR
         fYWqeFB/J211GAdcDwiT4H8GOCoT1jjD837WNdNK1rUPwqHjL+SyLG51AmTVhUmxx1
         YHBw40TNeeHjm8IxdNzYnMdAkXvG5BznsodVbN/eoQwOBCcUHPo/X+FoIHIwABkqpI
         yifDGXY7kNamOvOktZCarFrLupfVKik0faZ6/8o96hwcYkofdO3kx+EoG1XwF56HkI
         OeSaYoS9XYerw==
Message-ID: <99e8e2ec5d492e964b15567eb9f3b2eb@smtp-cloud7.xs4all.net>
Date:   Fri, 24 Sep 2021 06:44:07 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfMCXX6MgiyCpdbWvOBuJ3hxSh5Zk4hjcVxwlhk8x84Y2mhK40OfftWSQgvr5b3VC/lK/NhqAt2Ty/yowMGF5DqwvFAZ1CsxvhLoJsWZjkqwHNsL129VS
 /qRwev1efhAihu/Sq2FE85xeLYtha/6AzxSOyLpiY4FVJ7/oQ5Db+pmpcd+MQt3bWbCstan1F6//z0RT37UeXpqtXv05DbEqDIUkcMV7PA1cM5pXZcIgl3Rl
 Njmuj1dBdGMRIPw2at779w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Sep 24 05:00:10 CEST 2021
media-tree git hash:	952aab37b1217fbd9146dbb841ab38fe2477c753
media_build git hash:	61bc2cc71b936c10997da04d61ea655e706e78d6
v4l-utils git hash:	80a766cdcb1b8c395bdf03f67a18f0b9300cdff3
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7593-g7f4b93661
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b271230dab7e119453a068d347aef2c79d6b74b2
host hardware:		x86_64
host os:		5.13.11-marune

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
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
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
linux-4.20.17-i686: OK
linux-4.20.17-x86_64: OK
linux-5.0.21-i686: OK
linux-5.0.21-x86_64: OK
linux-5.1.21-i686: OK
linux-5.1.21-x86_64: OK
linux-5.2.21-i686: OK
linux-5.2.21-x86_64: OK
linux-5.3.18-i686: OK
linux-5.3.18-x86_64: OK
linux-5.4.144-i686: OK
linux-5.4.144-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.18-i686: OK
linux-5.8.18-x86_64: OK
linux-5.9.16-i686: OK
linux-5.9.16-x86_64: OK
linux-5.10.62-i686: OK
linux-5.10.62-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
