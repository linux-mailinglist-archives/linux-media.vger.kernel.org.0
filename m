Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313272AA917
	for <lists+linux-media@lfdr.de>; Sun,  8 Nov 2020 05:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgKHEiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Nov 2020 23:38:20 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57241 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbgKHEiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Nov 2020 23:38:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bcT2kSRWoRiwVbcT3kScZT; Sun, 08 Nov 2020 05:38:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604810298; bh=2GRvBjlfW6HQFZB43ptlirQxlHzJfgO7UuPVVO/ZXNk=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=YlniOz9GYOcyulEGn9Gyhqasm/QytyT7zMa8jzOvI9WTdmydH0v5t00F6JuRIumj9
         rEdd9/IZEjXOjIUFq0I0H7CfSkYFMiUm/LXGSlXxEA4InPeziEWpEm65m/82xV7XiY
         d8XChIm6O5IFv6coNr1PMUkL2vCBvK7jRH9cRhNhYTw4TnkEK8mcVDJtLcd0CIFw0n
         rI8l/Qk5GGR+847iQljH4Ho4RA3BaDy7RUJF0/RWtHROva9ItIT0s4wY2sywGzQxmc
         is2CHjf/ia3/0rXaDfvTRaKI1fzKVTCzCxioGutZlBXbQYDm0fduXv10Pt9jJOTQSM
         rtf4aP/IQUtOw==
Message-ID: <84ae54fc3e4f5a835837eb20b7e60e46@smtp-cloud7.xs4all.net>
Date:   Sun, 08 Nov 2020 05:38:16 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfCuSFSLwHPLkm4JrtWIav1dMWTszx8Szn4DzOKIHBUcNPNOVf1WhUMORuRUcVGFUuruvOSr2LBXPpHXPx85rRKE2k8tGA+PG9iceKsEV9P6yo1C+L9zY
 NMqalKVZ051GeZvtU2aMLUNHmUwu/JjkqhXrT9jQAgnsITJcCLebCUUoQ9APrOGDNHulbYaxK82ADgQWClS0vvCCqWr2KNcLN4zw+JAt4CEZ8/dmcetJKK73
 wK9qO10ohM1O8GNyApxHhQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Nov  8 05:00:14 CET 2020
media-tree git hash:	0ab4f9087ea94ff92dc2ae68180faaf6bd443021
media_build git hash:	408180421c5e0dc4aa760e6f2348daabc757730d
v4l-utils git hash:	57451f856524bf2b02ffe8e43ba2709a72cdd4f5
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5aabc25fda7a7122487b4bd429b4c635cb4df7d7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
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
linux-3.10.108-i686: OK
linux-3.10.108-x86_64: ERRORS
linux-3.11.10-i686: OK
linux-3.11.10-x86_64: ERRORS
linux-3.12.74-i686: OK
linux-3.12.74-x86_64: ERRORS
linux-3.13.11-i686: OK
linux-3.13.11-x86_64: ERRORS
linux-3.14.79-i686: OK
linux-3.14.79-x86_64: ERRORS
linux-3.15.10-i686: OK
linux-3.15.10-x86_64: ERRORS
linux-3.16.81-i686: OK
linux-3.16.81-x86_64: ERRORS
linux-3.17.8-i686: OK
linux-3.17.8-x86_64: ERRORS
linux-3.18.136-i686: OK
linux-3.18.136-x86_64: ERRORS
linux-3.19.8-i686: OK
linux-3.19.8-x86_64: ERRORS
linux-4.0.9-i686: OK
linux-4.0.9-x86_64: ERRORS
linux-4.1.52-i686: OK
linux-4.1.52-x86_64: ERRORS
linux-4.2.8-i686: OK
linux-4.2.8-x86_64: ERRORS
linux-4.3.6-i686: OK
linux-4.3.6-x86_64: ERRORS
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: ERRORS
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: ERRORS
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: ERRORS
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: ERRORS
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: ERRORS
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: ERRORS
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
linux-5.10-rc1-i686: OK
linux-5.10-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 1
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
