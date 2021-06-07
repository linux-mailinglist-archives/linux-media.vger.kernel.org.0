Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0541E39D37E
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 05:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhFGDcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 23:32:22 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41271 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230127AbhFGDcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 6 Jun 2021 23:32:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id q5y7lispchg8Zq5y9l4HyM; Mon, 07 Jun 2021 05:30:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623036630; bh=+6qSAMbsszO4r7PuY9GAWbwfEug7/H2m/5Rhp+twifU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Rlaft2NznZZx2vsuMeq02n0KgEWVfA52vwoMJpEhmhZoKapqvVEHTNZS8BTM25xmh
         3tXE95OadG96iUU94Rldm+b7cs2zAjWqMhz+oagSepgFFV+jAwKQ6WP0IpB0ZEQo7L
         TcyGBVcZUbgaZEdHBJD4xE9q6wsA8oXArt7DsNNlCvcwKw3YnlB8F0j1MxZv02r4YH
         +ni2z2JhYJB4iE+y3slqnjWHqkfnITAKKCULtOERnoxLUBOZYMjg9poEtYtnFWxB8k
         WDV1zYPJSXUwnFNS6WtO7zyyPT1tamgsxcG8UvOpWLYIVdMq9+Pxe46wOnbh5fIyAu
         pmhmfJeeaXEiA==
Message-ID: <2c1b21588e96d2144f97b2c26e7013eb@smtp-cloud9.xs4all.net>
Date:   Mon, 07 Jun 2021 05:30:27 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfF60r13A2Nsv8AhP2i4CwShTq5sro81BympXliYzzYY9vQYGee5mZ4dmMwJQmEoleAoRxJGZpEzTBzf0Vaw7AZshrLgJWpLLj5KDICmLMOIeWM2YEVlH
 V9xPvwGWJUSQh9o3xtw0n6C5WGTZphLIgwe43mOJgrUf8PeHJUPsEg8xGnoL96J5hXPTjua+8aBEeLkBEkn0iuEf/VMP9JngMhSRcEJ+TWJKWYIyWDCZok2E
 0zlcvhiGSi2tZfGBlMBuMw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Jun  7 05:00:11 CEST 2021
media-tree git hash:	c11669f738f48c7b3cf3b7ec700af33e1566d9c3
media_build git hash:	b85393d37cdac84cb846802f0d62259aa679c994
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7445-g58776ae33
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b010e650519b1cd0d44b110c056ef26ae6ff80a7
host hardware:		x86_64
host os:		5.7.0-1-amd64

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
linux-4.4.258-i686: ERRORS
linux-4.4.258-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.258-i686: ERRORS
linux-4.9.258-x86_64: ERRORS
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
linux-5.1.21-i686: ERRORS
linux-5.1.21-x86_64: ERRORS
linux-5.2.21-i686: ERRORS
linux-5.2.21-x86_64: ERRORS
linux-5.3.18-i686: ERRORS
linux-5.3.18-x86_64: ERRORS
linux-5.4.100-i686: ERRORS
linux-5.4.100-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.13-i686: ERRORS
linux-5.8.13-x86_64: ERRORS
linux-5.9.1-i686: ERRORS
linux-5.9.1-x86_64: ERRORS
linux-5.10.18-i686: ERRORS
linux-5.10.18-x86_64: ERRORS
linux-5.11.1-i686: ERRORS
linux-5.11.1-x86_64: ERRORS
linux-5.12.1-i686: ERRORS
linux-5.12.1-x86_64: ERRORS
linux-5.13-rc1-i686: ERRORS
linux-5.13-rc1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: ERRORS
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
