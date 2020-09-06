Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E26225EC56
	for <lists+linux-media@lfdr.de>; Sun,  6 Sep 2020 05:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgIFDal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Sep 2020 23:30:41 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38453 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728327AbgIFDak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Sep 2020 23:30:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ElO1klY6KgJnQElO2kZYos; Sun, 06 Sep 2020 05:30:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599363038; bh=ggY25+oIYtERncUGD/lcig7qiJYVhR89IXyKaWu/exE=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=fInxpDNQIErWO5Lu9GLzO2WdtKq8cclBl/M3EABEUHA9zpQLHMZMp9LY8+0/rledq
         1Zpmrz1Kh6n0q9pX+xcvWylwbOxxfrBikcWqbOzn8v+VlrtL/YXlzbLs42XwmNxSGD
         xIh2n8VK3CEuq3pWijcsVcDBI1deZukFgFsYcMZQsn0jDXuZfaE5h5HSO8QdDIlZTd
         z1Tt0NCkwYrqB6aALFxi3IdzCDhpPU4grHoRSEQv5PZp7y5OE7XjOUV/qtExPF9sYu
         oWRDmiodKwAVbKrTa2yiUpq6T2EAPl7MzV2DmwmFIP4utkzi05u1TBdjmliDgJs+Bz
         HW7KsWNjAWAbg==
Message-ID: <ca7c1527b52301eed24973377e963c25@smtp-cloud8.xs4all.net>
Date:   Sun, 06 Sep 2020 05:30:37 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfHS7ypwYlhTe1zeznWXaLYY4mUAMi1bM7skngg7mKL7Zb3/KJsmDU/U+D8lZqZIxWChYFOYrwveni+F9+X5p06Ouqpik8GjObjoFUhID2IPO9xO8auYO
 WTRA90H0MjNSHzrbvwOE1OhJ/ziEO7D15VZdlF81D3zybA+zq8BK7gcdBjn5QXxJu9QtwxefahxvteNmGjBzXnemUt8GmRwD+uYLT+MwVNu+ba/3bBwU9YCK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Sep  6 05:00:12 CEST 2020
media-tree git hash:	75992a4418b6c51d4da9c99aac7d92ab29148196
media_build git hash:	a20bdff25e6827e9f03f2476d4795df1c8ee4913
v4l-utils git hash:	79918a591a9ad362f107795ee4046d39e6dfcb67
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6784-g0b1e8107
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: de6d6159fd08a7f648f619e6bdfb2b2d6aabb555
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
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA VIDEO_TEGRA_TPG
Check for strcpy/strncpy/strlcpy: WARNINGS: found 3 strcpy(), 3 strncpy(), 3 strlcpy()
linux-3.10.108-i686: ERRORS
linux-3.10.108-x86_64: ERRORS
linux-3.11.10-i686: ERRORS
linux-3.11.10-x86_64: ERRORS
linux-3.12.74-i686: ERRORS
linux-3.12.74-x86_64: ERRORS
linux-3.13.11-i686: ERRORS
linux-3.13.11-x86_64: ERRORS
linux-3.14.79-i686: ERRORS
linux-3.14.79-x86_64: ERRORS
linux-3.15.10-i686: ERRORS
linux-3.15.10-x86_64: ERRORS
linux-3.16.81-i686: ERRORS
linux-3.16.81-x86_64: ERRORS
linux-3.17.8-i686: ERRORS
linux-3.17.8-x86_64: ERRORS
linux-3.18.136-i686: ERRORS
linux-3.18.136-x86_64: ERRORS
linux-3.19.8-i686: ERRORS
linux-3.19.8-x86_64: ERRORS
linux-4.0.9-i686: ERRORS
linux-4.0.9-x86_64: ERRORS
linux-4.1.52-i686: ERRORS
linux-4.1.52-x86_64: ERRORS
linux-4.2.8-i686: ERRORS
linux-4.2.8-x86_64: ERRORS
linux-4.3.6-i686: ERRORS
linux-4.3.6-x86_64: ERRORS
linux-4.4.212-i686: ERRORS
linux-4.4.212-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
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
linux-5.1.1-i686: ERRORS
linux-5.1.1-x86_64: ERRORS
linux-5.2.1-i686: ERRORS
linux-5.2.1-x86_64: ERRORS
linux-5.3.1-i686: ERRORS
linux-5.3.1-x86_64: ERRORS
linux-5.4.17-i686: ERRORS
linux-5.4.17-x86_64: ERRORS
linux-5.5.1-i686: ERRORS
linux-5.5.1-x86_64: ERRORS
linux-5.6.1-i686: ERRORS
linux-5.6.1-x86_64: ERRORS
linux-5.7.2-i686: WARNINGS
linux-5.7.2-x86_64: WARNINGS
linux-5.8.1-i686: WARNINGS
linux-5.8.1-x86_64: WARNINGS
linux-5.9-rc1-i686: WARNINGS
linux-5.9-rc1-x86_64: WARNINGS
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
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
