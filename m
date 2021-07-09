Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376903C1DEA
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 05:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhGIDuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 23:50:17 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:59655 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230462AbhGIDuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Jul 2021 23:50:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 1hUBmzK4ihqx91hUCmQqLA; Fri, 09 Jul 2021 05:47:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625802452; bh=hfPUi2KKh2zY0W5KKeO7vjRGxMXlZJJO8z3BOmP4Fco=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=KoSgMVOLj/i07PaFVeqV7+gT1W52AhhGh4TDPN4A2HiMH6fC9U91+gqQNXr22ZOmd
         snLi4J+yD7zXZT6YOJlmB9vKyeJtJeL7+IIIOidsxn9HAfLPKg4I7GvQdMvmJCZSs/
         awLoD8mCyqdvY7+QIE3d480BGRlADS549dt2xPFfItnxjRNF0kCX7Dn7HdcjSCYkBi
         NVVPEUVD0kE0AMgcsRdccyukLmY2yNVV+MzP9tAbEADpWBWVIpDzAarTPkyogxoeQe
         A99/1Qr/kqheNjzgbm9h2/Sqtu2N7L7OTq181USsXh4OXUrQdlSzHM5m/+b1qX3CZF
         Y84Y6hkUIPhxA==
Message-ID: <c13419711326bf8959f71b656158b19d@smtp-cloud9.xs4all.net>
Date:   Fri, 09 Jul 2021 05:47:31 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfPJkuTw/Eum/UkasQfapSux/lc1qYTfqvG0320CCNySUWClBotlAz5/Peso6pTxDFzoGFNJwRWm1oJuYR+zyFaePirjdnSKfYl3aYVwHd9ivoBJLzcK6
 Xsvlc1FmRhEz2fBZHdQ49FC1AXMSfWib+fHgC0+CKlSd7JxeLGOwA4G/r01MT6eITAcnrgm2o1VLOAYtE/MABvAYKSLDQzuO3uK7BI3sL7gWEEapCQr23Wt3
 16j6Jh8NP2J+NUUGTimxvw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Jul  9 05:00:13 CEST 2021
media-tree git hash:	50e7a31d30e8221632675abed3be306382324ca2
media_build git hash:	dc90f6c653a467465b5deb23d3310577f8ebf218
v4l-utils git hash:	6ffc5248dede6285d76c5ec5680c316f68ff98ca
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7481-g7f50411af
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 328d8f6242d952437e8dfc96047fda207fad8deb
host hardware:		x86_64
host os:		5.10.0-7-amd64

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
linux-5.13-rc1-i686: OK
linux-5.13-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 2
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
