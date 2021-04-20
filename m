Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D83D365105
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 05:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhDTDiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 23:38:15 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56439 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229797AbhDTDiP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 23:38:15 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:24e9:9041:dcdf:2969])
        by smtp.xs4all.nl with ESMTPA
        id YhCnlNSD7uz3GYhCplu6PB; Tue, 20 Apr 2021 05:37:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618889863; bh=ajQZRz4AxZuRKBeDERjjP5V30kRl2IkzEKkNpOpxK/c=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=qW93q/DaXLq1BtP15ppmEKFRtmdsDizwzjpP9Nk6K57ww0ssCGQN00T3lTNLA0+pQ
         SMynQBOb7K/aifziKnuURODWIDRQKQVnqT7jQ6SPHf+D3d/GckA+kajFn8gPaVrp+6
         41fWzQJyayMgPLmO20KTNYq4vHWnVAwOrhXpOfz6S4Yh9DUVhmv/L4N32adQOeIK5m
         VSL5vNbmalhxC4OYGaZYaYBxpzbTPQr5w8IhO+wAJTHCCVJJ3MleSCgpVVzWh5XwGp
         wJA18T0pWVlwYhq7k5PGBjLMegAfVUNdlQ7zY98C2nle32GpqSGo/7QvkJFFdmskLf
         rtkdOo2ZMPiVQ==
Message-ID: <f3a0ac260dc8233f3164756319d6a4c5@smtp-cloud8.xs4all.net>
Date:   Tue, 20 Apr 2021 05:37:41 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfC5LEk4zzZZvBJKCUg3+NOkeIdM7NSfrIfjz7YUFLltZxihgRoC5ziSiypOZDFxPL6otm57xSGvJFIMeBKJam8Ga9LVk8PouBn0L8slM06UieBe1Ymoy
 syWQxBfKN6cyPcbdrw3RyAqXsopFH8/yNhx8bwXhjzSiIdS/J2SjV5Qo+NqsfhYfudK6TTLnBR+9IEEvoSZJPnkc0pUXGHPV9+bsSj+NVdYv6ab873eOMRwW
 DCCghJ9CtS2FIE74MeBTww==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Apr 20 05:00:11 CEST 2021
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
linux-5.12-rc1-i686: OK
linux-5.12-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
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
