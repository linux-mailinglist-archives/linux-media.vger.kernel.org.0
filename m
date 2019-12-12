Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCB111C516
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 05:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbfLLE4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 23:56:33 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:54205 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727541AbfLLE4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 23:56:32 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud8.xs4all.net with ESMTPA
        id fGWbiolCPTsDefGWciczGU; Thu, 12 Dec 2019 05:56:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576126591; bh=SBvypwM8PqPxe/4Uo24cHNtn4fxPS5sSLMj30mQc8MI=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=EprqtZ5fxYxqIPK9B2/lJAfgRcl6WbIuifgeIYueEQ/8tNCdqphQoSDOTWH8iu0RZ
         dM8+OfF2hjRvQ6ZLPU662Hfmoui6s+AOOWpsfESDHN4byCbfSWCiT9zYzToX1s0054
         N+Glky5m0RXn6mz54w9GGCYccoJL1/GEJFFD4+YC3/Yxyn3ygFA0kf0JDjfnxXi/Yd
         HyBDWs/AgYVzVI+hCBYfSHRCuHAz4QlsctBkyrn1W9Wn/pjykIiJ+lFFfS/0UhlSsf
         VHewpc4ILcz2eM2kl1f9mpxzaazyq2FZGcmjBm9j7P9uCCD0hj1TcVzcrCH5SVyvTH
         /kf3WejMB9qpQ==
Message-ID: <9bc5940bb4908650ca8a7eeefa2632c3@smtp-cloud8.xs4all.net>
Date:   Thu, 12 Dec 2019 05:56:29 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfDnjty8SIGE4f3VN1CPmBbg+v8xyW8zRmXuQRhkwqKNS/VoCsOmEnr4QI/eOt4C0JN2f8+Zq8qBhu2jEtPaMNeanTGT04mFDc7c9DLa1n9CWiJCH1U7g
 jY/PVe4NfA574VHDE+ViRp8uLLGme4CBN0PTi84cFm+2Zfa26JjhWEhkkNH/lc6QR9Je5ajcOUU1YN1XeG2wLPGMp0WoibTKk6pDlu78mu1OztjZjM9dP5S5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Dec 12 05:00:11 CET 2019
media-tree git hash:	2099ef02c6c024751e4d16ace67dd6b910c875e4
media_build git hash:	ccee44dc23da091e884e2cbdeb3b8b2271cc3095
v4l-utils git hash:	e9a7593ec6ae98704ecb35ea64948d34c23a5158
edid-decode git hash:	e719d04077d098eb51d9494f41060eba2419d4bc
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
linux-5.4.2-i686: OK
linux-5.4.2-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2793, Succeeded: 2793, Failed: 0, Warnings: 2
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
