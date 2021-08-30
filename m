Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565C03FB00E
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 05:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhH3Dpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Aug 2021 23:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhH3Dpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Aug 2021 23:45:41 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4AAC061575
        for <linux-media@vger.kernel.org>; Sun, 29 Aug 2021 20:44:47 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KYDymsuEiy7WyKYE0mxvvg; Mon, 30 Aug 2021 05:44:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630295084; bh=blP8gtQB1E8f6REXJcxotFfzv/Q/mi1DpBlE+5vK3hk=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=cTev9itEuCCIZ+b5fIAQ+eU9JXYxIPO0GVJ4vHMyWPAoVH1iJrPMmAtvbigNhv9y3
         Hhvj7qop9xEoVM5TwYiT+0vVEskzuberCjGVrpjtW7dUdRwtNdXkN+Y6z2A1Awt1ES
         IRlUqkGvQu3yKdBy98VdPdO8vRsJkOpVWhsfHkBsePpRsj/1iQKX43SE5vwzh4BtcK
         l6/yY7sF6jcmOdBIk2E0sB4v4voxwEU1iYZKvkRSrZw8X1UYN54SztkYYk5z6+xFuw
         JHE9uY1iJLVQnsQWt5033FcOFOPZ7AyGo8O5q9yengLjkpeyEZAuEABNvKpLjOVtqC
         zFVGD4b8wteuA==
Message-ID: <2efbaeb8214f59a0d55a95e180f2e3a8@smtp-cloud8.xs4all.net>
Date:   Mon, 30 Aug 2021 05:44:42 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfLQe3djnX4qQnMulmuzUH7tlJxaa1EE5AXHd/ui+bnclabnMu9R1M+OWNzeljPfIG/z0sjjZrmH2PF3Km7UDFU+p9xGsuMtzy0yoyHPVwhqhni8bZIXn
 x93CGWe4hev7+LqvO/xyMQA6AZwOfmcQQ0R5lm1XaAF8FbKhifeZERZ28ffc6z96ZUmX6GBtmoma1I4nhW3zXh45ShSj/bmJMBED8NZoBYufg3R6wcPosfo2
 ePYeogAOSw/zKCNsEpWGGw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Aug 30 05:00:10 CEST 2021
media-tree git hash:	9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
media_build git hash:	7253675c65ed84dc294ef25e2af873e8092be48b
v4l-utils git hash:	22466798f9a9044fa20ae3bb367d9fc29d37e054
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7532-gde99456f6
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6703700d637a73d66e094bc62d34c826f353efaa
host hardware:		x86_64
host os:		5.13.11-marune

linux-git-sh: OK
linux-git-arm-at91: 
linux-git-arm-davinci: OK
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
linux-4.4.258-i686: OK
linux-4.4.258-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.258-i686: OK
linux-4.9.258-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.222-i686: OK
linux-4.14.222-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.177-i686: OK
linux-4.19.177-x86_64: OK
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
linux-5.4.100-i686: OK
linux-5.4.100-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.13-i686: OK
linux-5.8.13-x86_64: OK
linux-5.9.1-i686: OK
linux-5.9.1-x86_64: OK
linux-5.10.18-i686: OK
linux-5.10.18-x86_64: OK
linux-5.11.1-i686: OK
linux-5.11.1-x86_64: OK
linux-5.12.1-i686: OK
linux-5.12.1-x86_64: OK
linux-5.13.1-i686: OK
linux-5.13.1-x86_64: OK
linux-5.14-rc1-i686: OK
linux-5.14-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 3
virtme-32: OK: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
