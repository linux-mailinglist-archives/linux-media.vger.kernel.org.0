Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F925479902
	for <lists+linux-media@lfdr.de>; Sat, 18 Dec 2021 06:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhLRFqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Dec 2021 00:46:10 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.185]:37863 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbhLRFqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Dec 2021 00:46:09 -0500
X-KPN-MessageId: 2e4fd51d-5fc5-11ec-a0ab-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 2e4fd51d-5fc5-11ec-a0ab-005056999439;
        Sat, 18 Dec 2021 06:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=subject:to:from:date:message-id;
        bh=GLMgliNZvuB45s9cSYmO1GsBV6GSt5sQgQuS7JPnMGA=;
        b=dx7B5b5SMs1oUACVGFnBIGv+OYGntVJDkTD0ClQLCvYjEe/+ApT3ttQMFQrig+iA1v79ML301t5jr
         jxmbnuegNzZgkf/AIuJ3diXZQUjMcb/W915bI9DrhKuAaf5J9GP2qVIKz2s3EmwULhLNcgyJpasK7I
         dTTQeJnrFTlD4xJQvE+5G++qVfCEuzDhtFyrYcDBT2P0NBvZaSGnLiGrLzPvghzsm7EiyFXuk6NGpL
         TyuKOBMebVL8t9LO92HEseYxvQYlqXywB5ULOvXzaOpFkfcPYYi1jH5+oCkIQGYwyyW6MU2DabiIl6
         +humwVw2eLiR5JWb8UibMM/7oEcUbKQ==
Message-ID: <da924f50-5fc5-11ec-a83c-00505699d6e5@smtp.kpnmail.nl>
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|Fa3XcRPuMklnHCG5jfDtJ9VJmnH3H1Q5mO71r/cq2nJmh9NlQ6xS16d2iODNsgv
 PhVO3pXcKBcSk/y/o3PD8wg==
X-Originating-IP: 80.101.105.217
Received: from localhost (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id da621203-5fc5-11ec-a83c-00505699d6e5;
        Sat, 18 Dec 2021 06:46:32 +0100 (CET)
Date:   Sat, 18 Dec 2021 06:46:05 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Dec 18 05:00:12 CET 2021
media-tree git hash:	68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
media_build git hash:	7a9f6b78c746e1ad87a8a46736851a3078cd5a92
v4l-utils git hash:	6c905930e8e9bdf485f857ea8aadcaffbfd0943d
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7537-ga9e379d05
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 113d52660b1fa16141bccb95d4bdbd2a4bd90d26
host hardware:		x86_64
host os:		5.15.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
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
linux-5.4.144-i686: OK
linux-5.4.144-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.18-i686: OK
linux-5.8.18-x86_64: OK
linux-5.9.16-i686: OK
linux-5.9.16-x86_64: OK
linux-5.10.62-i686: OK
linux-5.10.62-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
linux-5.15.1-i686: OK
linux-5.15.1-x86_64: OK
linux-5.16-rc1-i686: OK
linux-5.16-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
