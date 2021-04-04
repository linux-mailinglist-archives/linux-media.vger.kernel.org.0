Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DB435364D
	for <lists+linux-media@lfdr.de>; Sun,  4 Apr 2021 05:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbhDDDjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 23:39:10 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:48863 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236641AbhDDDjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Apr 2021 23:39:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id StbGls8kk43ycStbJlJxju; Sun, 04 Apr 2021 05:39:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617507541; bh=zu9zij3aEDb7Qh81sD8Rst4KfI2l8N5KeI7rikELpP0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=G/sU/Im7J+EbN1bvt/l1CmFx4JyL4RHM7eYwaNWdbpqZlRdYZT7KT4IDRd8oK6rgL
         Cisyt13kG5cgsfGHjNbYF24zgvpRNjfZdvmpG1qF4w2evmtTtz+fGyZIBrqbMUx7R4
         8zS6clDwPaBZl8GaXx0+H7l8BaiWqIeF+p4iKwoLDqbDjm07VIhYKo0AEqWQHxBKA4
         Ou/IYqH2jrdE4T9JBSgLe1Kwm8qgA5jbtDleNnFtjQrO0bWmp2IZ1wIyTwJBzAKvDc
         4XZ83N+9o7xMD3K7rqPanr5o1UXabmwe8ePCEFs8FRl0ki7yUby07FGUvbseojp8Tl
         pGcdGKoqUiERA==
Message-ID: <c7dbbbbdd5ebbefca17a783e7d276671@smtp-cloud9.xs4all.net>
Date:   Sun, 04 Apr 2021 05:38:58 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfLYxDWkrDQZiPI2he8hk9IY9hq1aJ7QMDUclJzZbfi9+mrzYpLrpkT5nHbFCH9LkJRs5L1G+LHX3UhSAkaSAD5eGNNCpmye3crrYAh1IIhFiXPfOJLRR
 LczWnQ6pMZhaoYq8rQPRj3zCisOZ2lXYguvlX4w0B64WCyuiauzJOJvgP0En4ACY/LC9fhZm7Qttg5+kjbnOhAdEwtKuCNx6JJ02dqzQRhweOBi0T2jeQeD5
 hvcKJjCJn3u1fuqakKlVbQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Apr  4 05:00:11 CEST 2021
media-tree git hash:	97b34809ec240d82c82af97626c2071a4062e0e6
media_build git hash:	70188fdddcfedda190f1118529888cd3dc2581d6
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7413-g9bb66fa2d
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3ce9a878c7e648b006568e3fa69a2c4fcd251925
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
linux-git-x86_64: OK
linux-git-i686: OK
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
linux-5.12-rc1-i686: OK
linux-5.12-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
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
