Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4889C3D862E
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 05:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbhG1DpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 23:45:06 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:50717 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233437AbhG1DpF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 23:45:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8aVBme4NS4Jsb8aVDmZwlt; Wed, 28 Jul 2021 05:45:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627443903; bh=UPv5t5dyz0eo4Fs+D2K4kqoGTgG8Oa2hWg0Zl/wBPNA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=WSUidUn13GZYHpCtz0rGXo9E4zjDJjglmusG6QsFOuimx6l5xUK3UbVQraoGxvUK9
         5Ma4kVuY0uE7cUNp4WYsuCMKwNmBgVdNXfSQDILdKx5hJcqIWx3lXYsxuo9jIdMpAU
         CxpESZozwUn0BzYPd4ewu+m3QIdF3pBHkov+KBDkU3vP0yP71d3J1nvZ1fB+iLu/0n
         uhPKJg4Zclr3aq2kW/JpRAn9HOQxVJ2Qmc70ynm/3Vxqi1dVQcqeSiIzqtDf3UV8sb
         L6EIFncxwRbkbm5WIW2LWRP1KppDaVBykqMM/KhDaJYNTMXT26QQL5z06mAlli+3Gl
         0c6IRA7Af69vA==
Message-ID: <7b88138d674b20135f07292df8779ac8@smtp-cloud9.xs4all.net>
Date:   Wed, 28 Jul 2021 05:45:01 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfLfWNZ1gXoBnJe3WavzvdNbDnsJI8G7jA4koiLLt6xC6GHzP611ixh6UhUo0zYboMSvzx9C3rOUrb1/pfJpXvQkAShwF6NVP+dUzj/s/ykxWIAxtGBiA
 nXKwryI1CpCKlHvtG3OWBhicHbsJOgr3uFf4xK3xMwFuUSyuNzYQV4bYJMXG5AhIF9H+QBBcadVnnUaiz334J6D6o3cEog2cAEAVzzT23QWEi4Zk01JcVkVO
 ZV+owa4ji38A1Vi+9Ap9CQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Jul 28 05:00:11 CEST 2021
media-tree git hash:	e73f0f0ee7541171d89f2e2491130c7771ba58d3
media_build git hash:	bdc3294781a89c69fc05acefd95842b88ffcb4b9
v4l-utils git hash:	a4f2e3a6f306f0bef6664451b44d5a7a18b26803
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7505-gb2467b103
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6703700d637a73d66e094bc62d34c826f353efaa
host hardware:		x86_64
host os:		5.13.1-marune

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
virtme: ERRORS: Final Summary: 2989, Succeeded: 2987, Failed: 2, Warnings: 0
virtme-32: OK: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
