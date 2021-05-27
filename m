Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A5D392574
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 05:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhE0Dbt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 23:31:49 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:59087 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234222AbhE0Dbq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 23:31:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id m6imlZEDdVN4km6iolNBuG; Thu, 27 May 2021 05:30:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622086211; bh=vxd5OeN7wKZNYLZlfqfcFMoAJ3hcxL4YoeGTGoTM0z4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=epQOj0hozo/2AlS7NumO2xHYnAQ83UqcJndTWksSQdRHc5Y20VXnJ9vh9heEchZaH
         Cqw4KjNJ7N6Z1lAY4IkSsS87Wkxn/tFAdzQWmjEN/8j0tMb5aLy/4ZetRQwIl1VXhV
         rDoavLxdCVmIV28WoZuBj6zx33wRZFqRtkpcgTnfeRIrgGVkl0C+w7UJ77rqOszR1W
         eP8DONIB7kvAERLN8LyXQnpZ++sm8Qj5IiE90LoqeqRWnNFb4XflSZJ2Ytdg0qtxVb
         5k42aFAbUczQ3N3yh125QEQSdfu5ntJ8kiIlAuTCB176nLmIMzJMHe5t8BPW9Duc9o
         pLHkNVGzuY/yg==
Message-ID: <fa173cf3cf68fd2963c8d568ee5a3255@smtp-cloud9.xs4all.net>
Date:   Thu, 27 May 2021 05:30:08 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfAs009PlO0lcG8c2xjZrfrcR2J9cTnxQ1EEK5WWz0XIx08tRegBpzDc0DO4cMOfTtwfzUTsqU9n+Gipf7IZWTvAiMwpePNeniIq18QHzTfiGwPiiAA5E
 MdkOJD+8Cf5ULPVYXjkFuMeith7Mh8oUNALEHCdjcFJQQ0c7dblZcGrb/okEcuEqDsM4sZ7D0v3f5KBQIWf7nZ5QO8qV4E95uuw8lNwJI30o7tLFNh3Olu4U
 bvTLkIWQT8zkWpCoascJUA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu May 27 05:00:09 CEST 2021
media-tree git hash:	71c689dc2e732d4cb190aaf0edea73116b1611bd
media_build git hash:	fe2dddd7a72848ec66131d15c4f1893db7daf84b
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
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
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
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
