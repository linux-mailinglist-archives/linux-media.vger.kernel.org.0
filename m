Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA8B31D4AD
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 05:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBQEmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 23:42:03 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:60465 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229544AbhBQEl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 23:41:58 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CEeFlgzkFYbfZCEeGloCsj; Wed, 17 Feb 2021 05:41:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613536872; bh=loMcOWqZRf5/KACZhV6mZQuibBFMshyQibVkP/4eQkg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=hmMU/p6H/Q1v3EwHw/Jx4iJYYCF5llx7WxLk2vJ5uu5VAoVrS5oz7G2hRc7YN1ZOE
         91cHhlmcaOPHyq0h4o/NHgFdC+r6vgyIpShsX7wgkKnwOc9th+KLOCr/6CVO3iGg73
         l4Nn6lxDwSokHB99bVIwlH0GNsUz43IOv3ygQkt5h0u2BWXfVn4tYqmyOebdLW5QZu
         XJjE7b0HPxD0ofiV3bmrlo9jyBuk/ADfd+x6CoRuacYl5olWEPUpz9AErW4MeFigIo
         e7wCLDf+82wRAkDiCYAV3fgRm7JGt344dZ/str6aV6SzBrFCr3HEzoRlmaxiU94Ror
         j36eTmEBHKFmg==
Message-ID: <04924280a22d4e6ad00477fcb9f6c04a@smtp-cloud8.xs4all.net>
Date:   Wed, 17 Feb 2021 05:41:11 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfMXA2CLW/DOu/SHPk1IxxyLWNqElQFN1rdzS+3q9THWWIFY+2U1oiC6yc5WT3DoN9ZU/L1B3fWAsY8y4q2By5q1hZvChE/UJGxgzctAnJNo5c3xAcdVQ
 3yju8I2IaB82ZZRqBGGmAMSTLS3FOHWUrX/DOMRLZfJd/OTmRl7DmTxQeNklf1frNUcH9mWu10pbjz2X+sS1IV3BTXQeTe3CYjLNHADxRi7E585yUuNoD0jG
 1k7VBeHt07HGfsEA+QqqPw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Feb 17 05:00:08 CET 2021
media-tree git hash:	8f202f8e9ff38e29694a4bc0a519b4e03c1726ee
media_build git hash:	a236fddff61e8357f3070effdf23e9b5f20b26e6
v4l-utils git hash:	a61064fcef13f38e304fc119aaa910871c38190b
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

linux-git-arm-at91: OK
linux-git-sh: OK
linux-git-arm-davinci: OK
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
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

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
