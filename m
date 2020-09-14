Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB5026833A
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 05:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgINDka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 23:40:30 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36027 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725972AbgINDk0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 23:40:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HfLpkyyCCTSPzHfLrkE2XQ; Mon, 14 Sep 2020 05:40:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600054823; bh=aLPLoj2caV8pHKWRZqHdUJvu2/JhQB8QK8L8YT1yg18=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=hyaFhkX1RzfwxRjm6awQKkxAl4fTQz5Oe9ZtbY4S2kfGAFHRVwv1O7+x88NXJMTHV
         pVicPV7e/yLeKiFU7XDlWAsPC+X6xg46HjHYcP5yKmZMhMJwAXhQ7EEquBFbE50KrB
         PpLuxguNDtp4zUQqYaD7MGKF8ex3P8Yoi9SJ+Mg1xTsslQbre55AcIdbOP8UDNDRg9
         Kw63bPlsYTlAoMIuY1Wk6v75pm6LlgrziYzp0Rjbe3GHf5zhVRz2SocLoWrFcYnaOA
         Z+p0vRPFgU7cfCBsdFcb14gKfPt6NOvDlb55yGU1ZP+A/yLcmzuoXfYNZ7yOcppOlf
         grYBzvhjaBowg==
Message-ID: <f82264bf21626fbcefe5f727c41704cc@smtp-cloud7.xs4all.net>
Date:   Mon, 14 Sep 2020 05:40:21 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfPht/tkmY4gB33pm8ntQ+CpG0xmu9Mi7TGkjxaQUtcusGAQ56zxAPPr10LDluYzVuDcbvVDbVPE9rfPHW5QBKVcq+eSQRkrwyUvshG7T2hQnKPOBJRUO
 YnmxWo5cvGqSCvhkANpE2+oIKc/q3qmhVob4YIxIH+CXOTwfD64txFhWIYTqRV4VOdZRIYc+1LIwGo+8CKxP0CfFt0GufAT//JJgKyItSNt6RM/XjDT2pPuB
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Sep 14 05:00:12 CEST 2020
media-tree git hash:	c4176e12a755d0c761736c14bd2656ffc733eb95
media_build git hash:	9cfb94d2c8b2a38add1762b40bc6d94f62311fab
v4l-utils git hash:	4833a12e78525e4d1a8c1f5da5f9534b857557be
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 65546dfa86f803ba44e908adc14ff4d8174a0fd2
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: WARNINGS
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA VIDEO_TEGRA_TPG
Check for strcpy/strncpy/strlcpy: WARNINGS: found 3 strcpy(), 3 strncpy(), 3 strlcpy()
linux-3.10.108-i686: WARNINGS
linux-3.10.108-x86_64: OK
linux-3.11.10-i686: WARNINGS
linux-3.11.10-x86_64: OK
linux-3.12.74-i686: WARNINGS
linux-3.12.74-x86_64: OK
linux-3.13.11-i686: WARNINGS
linux-3.13.11-x86_64: OK
linux-3.14.79-i686: WARNINGS
linux-3.14.79-x86_64: OK
linux-3.15.10-i686: WARNINGS
linux-3.15.10-x86_64: OK
linux-3.16.81-i686: WARNINGS
linux-3.16.81-x86_64: OK
linux-3.17.8-i686: WARNINGS
linux-3.17.8-x86_64: OK
linux-3.18.136-i686: WARNINGS
linux-3.18.136-x86_64: OK
linux-3.19.8-i686: WARNINGS
linux-3.19.8-x86_64: OK
linux-4.0.9-i686: WARNINGS
linux-4.0.9-x86_64: OK
linux-4.1.52-i686: WARNINGS
linux-4.1.52-x86_64: OK
linux-4.2.8-i686: WARNINGS
linux-4.2.8-x86_64: OK
linux-4.3.6-i686: WARNINGS
linux-4.3.6-x86_64: OK
linux-4.4.212-i686: WARNINGS
linux-4.4.212-x86_64: OK
linux-4.5.7-i686: WARNINGS
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: WARNINGS
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: WARNINGS
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: WARNINGS
linux-4.8.17-x86_64: OK
linux-4.9.212-i686: WARNINGS
linux-4.9.212-x86_64: OK
linux-4.10.17-i686: WARNINGS
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: WARNINGS
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: WARNINGS
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: OK
linux-4.14.169-i686: WARNINGS
linux-4.14.169-x86_64: OK
linux-4.15.18-i686: WARNINGS
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: OK
linux-4.19.101-i686: WARNINGS
linux-4.19.101-x86_64: OK
linux-4.20.15-i686: WARNINGS
linux-4.20.15-x86_64: OK
linux-5.0.15-i686: WARNINGS
linux-5.0.15-x86_64: OK
linux-5.1.1-i686: WARNINGS
linux-5.1.1-x86_64: OK
linux-5.2.1-i686: WARNINGS
linux-5.2.1-x86_64: OK
linux-5.3.1-i686: WARNINGS
linux-5.3.1-x86_64: OK
linux-5.4.17-i686: WARNINGS
linux-5.4.17-x86_64: OK
linux-5.5.1-i686: WARNINGS
linux-5.5.1-x86_64: OK
linux-5.6.1-i686: WARNINGS
linux-5.6.1-x86_64: OK
linux-5.7.2-i686: WARNINGS
linux-5.7.2-x86_64: OK
linux-5.8.1-i686: WARNINGS
linux-5.8.1-x86_64: OK
linux-5.9-rc1-i686: WARNINGS
linux-5.9-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 3
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 2
sparse: OK
smatch: WARNINGS

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
