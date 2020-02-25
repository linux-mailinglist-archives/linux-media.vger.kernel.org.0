Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54B8616B8B4
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 06:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbgBYFEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 00:04:31 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42455 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725783AbgBYFEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 00:04:30 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:b5c0:8b5c:4702:aede])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 6SORjkrXByIme6SOSj6W2N; Tue, 25 Feb 2020 06:04:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582607068; bh=bsOqA3/RkVmjCELA5kqjjvnTdqvQrxpUtoAOFW4JY7Q=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=VX+XZlSii7uXJDKva0OspCpzYSjXiv3d78Jv0rPacJkn9m3BCSGWG0ourF0LB0gvO
         4GHywM7YkzQfx/wmwuxqmgeLij09juIUwAeeIlubIKA0RR8Whny7BQ9v0Y0g1TZsV8
         hLFK55p9T4CpqGjW4XwHEa2396ijfO+93iWYMMHHemlxAHV+/hoOyHuu3cNFaYA4fU
         bqgxfHp9bvTmmk/tJlEMuX7mvWWg4wbNybmSUXnofhOu0DUpMKI96kJMf2Q5337554
         fjuW8bTHQOp90D237yqV+STdCSMZ09mAYi66DU1tdkeVSkR3x2ZyUjp/yvV0Ub1s8l
         wAi1xQZh0MuWw==
Message-ID: <f7c7398c1f225df10b2a9f793f0614a0@smtp-cloud9.xs4all.net>
Date:   Tue, 25 Feb 2020 06:04:27 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfMt6mDvG9vMu4fkpr8oLRUm/3/ZCtKA5BrOZVEZ3bz3i568zrAo558KTtaNfFA3yk3Vpw0VCSo1fvGE4oFyDquxfh9U3CQiPgQVkurEcqCdd2+xdPjLR
 rTg3+ZQ0ARTBNUEeC5ac1AvRDl1Oj6Nf+w8tjS2v3TH+0mSjZRKpH9E68WU84kVEviSZnkRdi0V4dNbNCDuU8VZhpyiX6wBoO7zLTNIT+ma4/YAQWEtfRD6C
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Feb 25 05:00:12 CET 2020
media-tree git hash:	ef0ed05dcef8a74178a8b480cce23a377b1de2b8
media_build git hash:	c19c9d0d270d64a158c41764125deef059b7acbc
v4l-utils git hash:	d0e91147795b02289e349005c5f765fc3485821f
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
linux-3.17.8-i686: ERRORS
linux-3.17.8-x86_64: OK
linux-3.18.136-i686: ERRORS
linux-3.18.136-x86_64: OK
linux-3.19.8-i686: ERRORS
linux-3.19.8-x86_64: OK
linux-4.0.9-i686: ERRORS
linux-4.0.9-x86_64: OK
linux-4.1.52-i686: ERRORS
linux-4.1.52-x86_64: OK
linux-4.2.8-i686: ERRORS
linux-4.2.8-x86_64: ERRORS
linux-4.3.6-i686: ERRORS
linux-4.3.6-x86_64: ERRORS
linux-4.4.212-i686: ERRORS
linux-4.4.212-x86_64: ERRORS
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.212-i686: ERRORS
linux-4.9.212-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.169-i686: ERRORS
linux-4.14.169-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.101-i686: ERRORS
linux-4.19.101-x86_64: ERRORS
linux-4.20.15-i686: ERRORS
linux-4.20.15-x86_64: ERRORS
linux-5.0.15-i686: ERRORS
linux-5.0.15-x86_64: ERRORS
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
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
