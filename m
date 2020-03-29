Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 907BE196AD3
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 05:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgC2DS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 23:18:27 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38261 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726316AbgC2DS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 23:18:27 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:782d:78cd:80e2:d116])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IOStjkFlcLu1fIOSujAtaj; Sun, 29 Mar 2020 05:18:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585451904; bh=ELlh2zZKgAJPi5nVJOVRfvG1EBIhyL+jpvGQVCn1Vmo=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=mBhh0mkf2QWRhvEEND9Js/s5ljnzFqZmAAlqOPLXgyUagSw+8pYZ1h1EL9MBf1ga2
         8WdD2byiPLXvqknbg9I7eBFaC9LG3kVUAIaowsZt/NyIbcL3PQhMQX0wBGgrgOzWLx
         VhmUeak2p3Uy+hYsvO8kDaZqj7OegUd5gqU3x3vIHA9/GIbjcKASAcmzNf4ZhJFKJW
         E8g2YpvAwaVEFz6yhGDk9Is0h20LoJ5T8PIKx6guX0YDrSWfYXWSh625utRJDnvAyk
         c6jWgD1WfyOOL3mL3QDl0CSEbX1cYQ0vnDCqhKJ4w3IFRXQwQCQ8hnqgluCVFwBkr2
         /lgcDaWREI0sQ==
Message-ID: <92aabac3a3ee965213decb85a197ad6c@smtp-cloud7.xs4all.net>
Date:   Sun, 29 Mar 2020 05:18:23 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfJyOFnA+y21r80tb16iabwey9mKxH7DuuUzLa2yjwl6k2smgZBlUPqLMpcv0ei1PWLTZumpApGTMehiTjEYdXVemJta4WiWs8krNqpiK6wNjNu4Qx0io
 AYmb4guuUSleQ5XYhr5yw/+wn5tudEB9WU91iStdeLsok/e6UZWAx8yD1n/1201hc20zEqK3oM/GP6t0QjRlMEIfQlIHoIGJRPgY6No35erLVuOo5q880mIh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Mar 29 05:00:08 CEST 2020
media-tree git hash:	ad71693f41aa60217eaf1c29afb49b3aa0a2db5d
media_build git hash:	5e1b2e9e12ffa812f69a15a56786f3e41277bfba
v4l-utils git hash:	81e45d957c4db39397f893100b3d2729ef39b052
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
virtme: ERRORS: Final Summary: 372, Succeeded: 371, Failed: 1, Warnings: 0
virtme-32: ERRORS
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
