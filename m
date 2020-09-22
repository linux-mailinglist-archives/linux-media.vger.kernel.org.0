Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C980927395E
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 05:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgIVDmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 23:42:33 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43799 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726098AbgIVDmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 23:42:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id KZCGkEERWho4zKZCHklWDL; Tue, 22 Sep 2020 05:42:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600746149; bh=wp7l3pSR/DsIIIXEoH487w/12vv8RmdiAc1tJT8OLYs=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=JvAasUu1rGu/EyXLW8RgXabVkNlEQts5jCwsq0Pd1L1MfdhGIZWQl5q4fGhbEyLyI
         feK0FUgxq2MIJJ4A4ZipsBuLjlfzB65GyZwWJprQJIuL6B+hMnia+12ch9uUSrUSl2
         8JJBd5qsnziziw1oqgyZjZkLIDiKZXe4pmpjJKjS6Qo9rwhGlkMz08WPpeKdSVh7xk
         sp+DtfO8cceno8krOKDwN726qI0Oum45jRI3GZQV5yJ/WSE+WdkwpNLbQtge9iY9ic
         rFug2Yw+vHv16RyKFk6QCABbt4xcZ7xqZJSZwnmwsmgs2BLHVHVHGmOKjHlF7OkNLC
         A5A0DTIH1Er3Q==
Message-ID: <97b4f00158807c739c5da568004066a7@smtp-cloud7.xs4all.net>
Date:   Tue, 22 Sep 2020 05:42:28 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfIoWpQ2rqI/gl9kx3WsA9u94GWlMiZqAeODTdMgZ6gbpLitOwe3hMLzYk2+EHUlO6yHwz6rIUMmllbf9h+Xg5wQSkJ1mYXar6BFEYBqCKqFbbbEgD//m
 hI1KMTcK/b9tXB1xiUcl3xs335DFPHqc4frX+e8B8unda9f+Wnr4OUnPANAf/rd3xC1rhdvBg2DqAeOjqLqRv6kQtwmxzVcEub2XaduqG7vu8J5haSdb+/z7
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Sep 22 05:00:19 CEST 2020
media-tree git hash:	9e76f2cff7a17af92c819ca0489ec5399f8367f7
media_build git hash:	efbdeecfc21ff8abcabc84c77fe8dfbefa2d657a
v4l-utils git hash:	ea16a7ef13a902793a5c2626b0cefc4d956147f3
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 36eaed7193020584cb96f64ed10d3481a5b84bfa
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA VIDEO_TEGRA_TPG
Check for strcpy/strncpy/strlcpy: WARNINGS: found 0 strcpy(), 0 strncpy(), 1 strlcpy()
linux-3.10.108-i686: WARNINGS
linux-3.10.108-x86_64: WARNINGS
linux-3.11.10-i686: WARNINGS
linux-3.11.10-x86_64: WARNINGS
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
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 2
sparse: OK
smatch: OK

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
