Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE113224F0
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 05:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhBWElw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 23:41:52 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:37035 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229852AbhBWElv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 23:41:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id EPVTlv5SWfIMiEPVUlt4ys; Tue, 23 Feb 2021 05:41:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614055268; bh=2bDf0nU2OZlD4YH8ipFtncNpmxDJCNvT8oYqp4DWp/U=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=c2nPpm5bNhDbfTlX90XBEZYdwwh02aTL+OE/wzHpUQe1ZGRxiF/DdLvJQ5qXiJzzd
         wuyFyromHH94T3GSbizwLrKCHSFGqWPbhiCm0DnOVlAQ2K82gpZl5ObVkCUQQAJ+x7
         4Tusj4SJ/awUEiXwze8zSa3Vr0tgifr1L82EJkYeqhjpkFM+WE7qaF8uHGBcGuRCGC
         tTQFUBmGzCxMJKn5kz5YwzXGzUoRQ8SLQHimxTR1VuMKoe+2YSxfU2QD+8c2Q02jt2
         dQuNEe9FVTH68IN+c2ybJt7s2pOSxYfCUGzfRBXz63EPWoJSVs4pvIXTuCr/hLoUxX
         O4rdvkfJOlJmg==
Message-ID: <c0a8dcaa8197e28bbb4a55dc3887c3bf@smtp-cloud8.xs4all.net>
Date:   Tue, 23 Feb 2021 05:41:07 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfA+YZKMyE+Rd84EbtB08gZQ4EYXoBng0s8AAky3+STASIAYIwXpEapQi4geY+KUXQndAbv20apsCDGl1OSlyVufsTL93ugBCDKfchDPU94EI15pTOeKw
 7IyKaYPPSCOXIIFmo8387UPWRvzsZqyLlyHetz8LWd+ypYqlP7Y7RM0F7K3NeL+0ZB0m0HC2o4OWNTBbE7TaCmZZGadnvKEe6EmS2HZIy9LVeJ0S0O7IqG8L
 sCW4S4SGS/b3YVbG1iOcVA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Feb 23 05:00:16 CET 2021
media-tree git hash:	8f202f8e9ff38e29694a4bc0a519b4e03c1726ee
media_build git hash:	a236fddff61e8357f3070effdf23e9b5f20b26e6
v4l-utils git hash:	50f3254c2356927e2232f63bcf1b3b49c70cded2
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7349-g7fcfe2595
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e7b822fdb96cb4ba52d3c0c7445d3401649bacd6
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
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
linux-5.4.69-i686: OK
linux-5.4.69-x86_64: OK
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
linux-5.10.1-i686: OK
linux-5.10.1-x86_64: OK
linux-5.11-rc1-i686: OK
linux-5.11-rc1-x86_64: OK
apps: WARNINGS
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
