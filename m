Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4AB193744
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 05:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgCZESn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 00:18:43 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47505 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbgCZESn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 00:18:43 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:c46b:a92b:46a7:638e])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HJyZjjZvXBr2bHJybjKACe; Thu, 26 Mar 2020 05:18:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585196321; bh=SvUUGscwG8SeCTmed9wyNgfb2I/SNB7TnjRHYFqEWyo=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=DOA4zh+nAH6sIhDfy0OYcVP8zA2g8kbO3Coa4Xn/8ln8yrOjk8SBU2AuLsLiSE1wS
         N83TO2AZHulJthbHgI4YIExzGCyPpxaAENYk+8bX0ATRkmPYYAQnPyUFNmPjFHE7s8
         7BbduGxQaCgCBQyzLV9cZ72ktRNnzIIHZUhAhtooMvYA2GRoHjeZrWiGHxuTN9ANAt
         kKiEUPeYEYJOqfKrLfY8tt2WduXjby3v54HWSfZgkfVDQtBqeqRfuTBlgEzeA6cjri
         /MzCHf1M7x0cLu8A0VT8pJrntFhmGPH5kPRT8cAfcWfV6MIGfCbDno63aZ+oP1p4Vs
         8J7I9LBjzfIjA==
Message-ID: <241be1d4fcb11a66f9ba080231345c92@smtp-cloud8.xs4all.net>
Date:   Thu, 26 Mar 2020 05:18:39 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfDxQyVayy5yRerzfJ19yI0MkwPeN8/8/IivBauo8H7b5nXSouzxVmJUHazfXWyUT1yLRhGB4IRBTQ8LLzRvhR8wZH6vSOesDb8qGrwH8CMa+n9/wMOMv
 9/BnkG35Ga4Iy6UYckRjOe7h9sDmDcXqEGUqa0jp1oVK9aqS2eg5hZhzfCcndb+khZY3gtGRLnM+j5qImVWIMZoziMVQ2szY0NGzzOxPxNCtE+GnZVdDmg00
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Mar 26 05:00:09 CET 2020
media-tree git hash:	ad71693f41aa60217eaf1c29afb49b3aa0a2db5d
media_build git hash:	5e1b2e9e12ffa812f69a15a56786f3e41277bfba
v4l-utils git hash:	e0d08d6958cfc8d2fbe3fcd482861de93dba8030
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: bce6094eab68fd9c0d5763c4d9e242d8d3732492
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
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
virtme: OK: Final Summary: 372, Succeeded: 372, Failed: 0, Warnings: 0
virtme-32: ERRORS
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
