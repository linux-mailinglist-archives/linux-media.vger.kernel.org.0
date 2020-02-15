Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A703015FC9E
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 06:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgBOFAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 00:00:44 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49921 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725271AbgBOFAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 00:00:44 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2pZIjTRTNP9a92pZJjMW7c; Sat, 15 Feb 2020 06:00:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581742841; bh=sGD4sYzkS12bVtj8r3DUBvwtmO8oVswKHe1rIGePx/w=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=LYH18e3ysSZaAXCDyeIr8OUwoZnhbMVmNzdOFYZutCQrBt8TECufli29I1ZLVFx3C
         yz7A+4MI+DldMGcNmyGT7zNKRxIHZDR371/Psb3QBcbrEuB1KT+MLs0cnr78bRVXfm
         4/Z5x3fNB3vBiVA0ivAtZevDzbSHyAtPRUupzgAQhCbQMnBx9CcF7M0d1rhcyDXgI2
         YRe/l0ud/begzMpzse39nubZ2QEtc/F/tHricyeAammXbJLGSZH69taMNnO9vl9X5/
         NXUG9AjD2bmvbeGJ4WMjlBXoM4zQAS9caBTEtMSu7NCT+NC5AMlDT9AYHmxwEr0oy7
         5hydsSkhn4Giw==
Message-ID: <91070efe03a2a00e2504ce4ed7307f33@smtp-cloud7.xs4all.net>
Date:   Sat, 15 Feb 2020 06:00:40 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfP5nfjJLFb8BX3AI+ZA4fkWuBtPQ9Z8d01yE+Mii34WrVfRgEJiSsenUBsR1ImrIME+eiayN4oBGeO4ye6fL5yj021ohq93eM/NiXbAo+yzgrPOYCteH
 m4s4ran16AALpVZmsxxoQ9EpbLIox/CteEe8EjmwFXjo4ODJqJRrQ+64+hgO+venZONYcYn9cp/G4YCN99AoiacsivMHq1rbUA6bLOkNbQlgQGAYBR6aqWfB
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Feb 15 05:00:11 CET 2020
media-tree git hash:	bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
media_build git hash:	c19c9d0d270d64a158c41764125deef059b7acbc
v4l-utils git hash:	b62d322d4401e6b6e5cbd78cedad9eb69dac1324
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
virtme: ERRORS: Final Summary: 2943, Succeeded: 2939, Failed: 4, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
