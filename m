Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7F83724BA
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 05:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhEDDkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 23:40:39 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36049 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229499AbhEDDkj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 23:40:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dluPlZKrNyEWwdluSlok0M; Tue, 04 May 2021 05:39:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620099584; bh=i0CzZwbAmSCIlxiyE9Fo7xg6qXckHHJLtKAdEKkZVSc=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=vOor+cRHGIuPWWZwwCxA5/BiofAfziKbMauRIoWveSJGII6GkhOFda/U9ggsX0UJB
         lEYCa6fY+8BLgS2DsdRcUrYRZJ88GS7AD8/PCD7zmc9AEAaDnyeixOb88D19Nn+zJK
         VL6zQ2iuqRXHulR25XUThwExC2WytfjA/ccAvi1NAZxXjTMtfS3xYBBSkN5w7q1Dnu
         +yeSZ4tN/llwTo01uk0O21iE2FrL9w16e0tRUR8svGln1teTR6ZQQwcuRwNof+E7WA
         sUEhmdGFpTHO8Ehskvk59x/IfwHIWXaVW+39/qVIbUA2j7q257fCCBH0WiDx2XgWBr
         kXylJ8WE/c3hw==
Message-ID: <1cdfa0453ef29df4b1f611d5ca010400@smtp-cloud7.xs4all.net>
Date:   Tue, 04 May 2021 05:39:41 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfOO1uSMf6rk4ie6vztAiyorvW5EN0KdRGvZ3H66wqUj4J+Aqp7iuFPbs6MFtMcoW63HhiB3o3DiHryMSNm7Yij7ABS+9ciZ7JkD6Ur0vYxVeZ5T9HWz1
 SuOdFdCVNEei+J9/2zk3NNWtg5DfEicsPtBN7p+ScfX4lR2KexF4fGvjGCuVPjAzDbi+t2V/MscAeVPT4pINhSUKoyk2R4ni53tLXJixaCLFiE7rpQMt1TGO
 kJtst9owhqAGuPZP9pExsQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue May  4 05:00:11 CEST 2021
media-tree git hash:	0b276e470a4d43e1365d3eb53c608a3d208cabd4
media_build git hash:	1521b23ea5307bef1ee17489c5323f00891dd52b
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7413-g9bb66fa2d
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3ce9a878c7e648b006568e3fa69a2c4fcd251925
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
linux-4.4.258-i686: OK
linux-4.4.258-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.258-i686: OK
linux-4.9.258-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.222-i686: OK
linux-4.14.222-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.177-i686: OK
linux-4.19.177-x86_64: OK
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
linux-5.4.100-i686: OK
linux-5.4.100-x86_64: OK
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
linux-5.10.18-i686: OK
linux-5.10.18-x86_64: OK
linux-5.11.1-i686: OK
linux-5.11.1-x86_64: OK
linux-5.12.1-i686: ERRORS
linux-5.12.1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2963, Succeeded: 2962, Failed: 1, Warnings: 1
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

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
