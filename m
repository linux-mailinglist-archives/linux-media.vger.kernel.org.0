Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B113E3302
	for <lists+linux-media@lfdr.de>; Sat,  7 Aug 2021 05:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhHGDoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 23:44:08 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51793 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230144AbhHGDoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Aug 2021 23:44:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id CDFVmjDa94SnACDFWmfxiU; Sat, 07 Aug 2021 05:43:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628307830; bh=ZU+LLLGH/SabZ0E6jcfVET2RGM3vKDkjDF1ev1YOOv8=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=gAlRm929uHV03E6Z/ZQRCjnY1IuDUdPCU2IYezm0q1QKyWCucuhf/2uc8sMNLR5T8
         PDR08MGLLoqZ2cFcsTcmBGwZx4HiCxqs4Ng/uSuzC5uZnLs4a72nQl36JL3gasGuJk
         BNs29kES43xWj0534iJNEQFrJqFKJ0flDYlem8hjqYxt5TVEJclai+VEH/ZebGSNFb
         G2hduCajh13JYzNWhZNRDY1jUHKA1hEsyhqPc7d9nNrcGeCxCQITHRH7Q5LU1AQ3//
         mzMFYZh9W2H4D6qntq98N02H4hSnSp3CRP8g+UDbCKsMECw21K7JMnS1Xe+fo/zhDp
         SwEz7gT5kfczQ==
Message-ID: <f2d9a88c278b124959562a0673a3b711@smtp-cloud7.xs4all.net>
Date:   Sat, 07 Aug 2021 05:43:48 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfO+k3OJdQwAO5nCiZPbIQ3xvtVsL21A6sJ+BX8dREZ7IgnQF0MimJ/4xfRrdsNZZdLXRj/AUUnVjD/qLNdiH4eiL+Zyc9rE5XpXPTPqZrgWPGCMPrBLk
 H89jMDgXo/l5KQS4VaZ0g9QSk24Pc77LmVvpI8ZCNyls8B955N1JUqqJHQPhsln2A1GilG6Nb5Kcu9bJdXiQRIT6V+ndGoMdJiBPEBzQZHmElggJwWnO/Ais
 1zgHFqndUFvztxYfAnvLnQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Aug  7 05:00:13 CEST 2021
media-tree git hash:	9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
media_build git hash:	b90a15c5094f88c53fdeff025d9bb6a7716a5ef8
v4l-utils git hash:	7952c0042ccf549959cf924fbd3e7dd894966e57
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7532-gde99456f6
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
virtme: ERRORS: Final Summary: 2989, Succeeded: 2987, Failed: 2, Warnings: 1
virtme-32: OK: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
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
