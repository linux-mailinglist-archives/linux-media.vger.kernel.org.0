Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D7448F550
	for <lists+linux-media@lfdr.de>; Sat, 15 Jan 2022 06:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiAOF5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jan 2022 00:57:44 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.169]:24301 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiAOF5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jan 2022 00:57:44 -0500
X-KPN-MessageId: 712308ab-75c7-11ec-9abf-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 712308ab-75c7-11ec-9abf-005056abad63;
        Sat, 15 Jan 2022 06:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=subject:to:from:date:message-id;
        bh=48vUxiDk12cc1KiVB1GOwWbzC5IqXcE93lJ3S4Bh5HM=;
        b=e8Xjhhl2gpmqED7IIi8xFINnbhKzd1WE41J2T+ANaQAOH+SlX/DL1uMf5bbtNIZgpxfYw2MSQuWQ4
         kZSq5KzfJFvftO/uMYL+DebeY2gNXpersa7OkL2vUfgC6ZcmSxVDVKbVI6Fa1uo2WPeGVMHcQOvWhW
         60Yly3qOMbYYiStsDMNsDMXOIYC11sCOk6qfmd6tF89IGSed9q/c+n0P6CUvVFiYU+Mv63Il4RQDod
         ZMEw3GbThj2ckUaNUT3UtaBwMBz1PNVV9xMOV8O4wRqB3MKea/zRarM0XOeRSur3hKZ4elPmsK8RdU
         C5R/ny6Lc0nOt7BEA5y5nsyxBRLAkhg==
Message-ID: <0ca359ba-75c8-11ec-b76f-005056ab7584@smtp.kpnmail.nl>
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|GFyz7NmZL1zdrqvpao3DOyH1rQIJZs7uw84lDjw22BYhePgn67XrPOGTr9emZh6
 U5eFutMcScu3rhVWjfLqqTg==
X-Originating-IP: 193.91.129.219
Received: from localhost (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 0c5c8a0c-75c8-11ec-b76f-005056ab7584;
        Sat, 15 Jan 2022 06:57:40 +0100 (CET)
Date:   Sat, 15 Jan 2022 06:57:40 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jan 15 05:00:16 CET 2022
media-tree git hash:	5da908b7af4c3ebd6748069d7223dc7a1a98d834
media_build git hash:	2fa76ec062aeaf93b647edbad1dd606e49fca4b3
v4l-utils git hash:	9f0eab72e17e4167c2d4df790c7e384240ce5c37
edid-decode git hash:	6514c9d9b18160fe9f09d3d70f99dda85d6fca71
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
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
virtme: Warnings: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 2
virtme-32: Errors: Final Summary: 3100, Succeeded: 3089, Failed: 11, Warnings: 0
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
