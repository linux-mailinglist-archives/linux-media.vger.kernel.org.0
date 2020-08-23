Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37CC24EB11
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 06:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgHWDk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Aug 2020 23:40:57 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59123 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725834AbgHWDk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Aug 2020 23:40:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9gsHkapPWywL59gsIkf95s; Sun, 23 Aug 2020 05:40:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1598154054; bh=Zdlz0dzxkjZGha69nwHU4n9TBMjB7vaqQIX56joXF2E=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=PFfZ4dVtrSOJWckCEsu6pHJRETlzkim8iNOfY7tVK0+4MeE+jFzq4gWZs9M3OPQyr
         aIfZA031azQBIqKKYE4+67oYaWpHijeK3szUqKwwkYh1Kg7/bsNTLV63XDiqgLlt3R
         sQ/DNOkpaJdBHHITBf8vpwIby7pv6wd5OmzWY4JbvN/rHvAUjeUa/paBXEtbK9dzlb
         vydE0RwpKlVPxsbo+1WcF29vcPUoof2zAAMWln5jtgdFPh5/OKJDAt+ek2a2iVMv0h
         1+z3tsP2P/32Gz/OKvfPDRLwE368KjPSrivyeXk2MOeLRopcdUqlbZTffzwx7jTQtK
         ffhgjgun4yIrw==
Message-ID: <81a7e25a299be357209bfd63cc667640@smtp-cloud7.xs4all.net>
Date:   Sun, 23 Aug 2020 05:40:53 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfNT62+lSV/fiNq8/qnqT2zzEIwtrpmJoL31UAR1tnuvct5oUH0Hpf93ZTWTxnXBN24HZ6xe+mCx9P8UyPFTqU4cynjkaOhsG3z9rHgrpvSSOPl0/pH24
 HIJj5uMc4tKAYik7lZ2sjrZVSUhk2dsjNIgMHtSm9zfaaSpf5H0rsgC6Xep1a4KUywZYVPbIDnKG0b7NQItSDQ9kh6dfogGV/yTAcd8Xscp/GDb8CgEILPMS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Aug 23 05:00:11 CEST 2020
media-tree git hash:	9a538b83612c8b5848bf840c2ddcd86dda1c8c76
media_build git hash:	61b62a2d779ff205ed5067b84773d03fdb83ed83
v4l-utils git hash:	89f66ef308e16a51090cf5682e74c6f4130a024d
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6784-g0b1e8107
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0b48805d84eaf0fbb9b2b8bbe8f7cbf7dba4e020
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA
Check for strcpy/strncpy/strlcpy: WARNINGS: found 3 strcpy(), 3 strncpy(), 3 strlcpy()
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
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
linux-5.7.2-i686: OK
linux-5.7.2-x86_64: OK
linux-5.8.1-i686: OK
linux-5.8.1-x86_64: OK
linux-5.9-rc1-i686: OK
linux-5.9-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 3
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 4
sparse: OK
smatch: ERRORS

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
