Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4806B14935A
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 05:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgAYE4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 23:56:53 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55749 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbgAYE4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 23:56:53 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:e50f:6110:669e:6a28])
        by smtp-cloud7.xs4all.net with ESMTPA
        id vDV3i0BbBrNgyvDV4i9GZR; Sat, 25 Jan 2020 05:56:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579928210; bh=dPnMCDcN2VWz47c1cn+Qz65dCnuBSI8EkYwd5od/9d4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=CbdQ9oppEOhw1XUtdUsDyaUltOHOahHb51n/rapu8lg5yPBgkrqxuIfAkzG0n2CQH
         Ck9+oG8+QRsfSQ2euZf6wgnfGf31ZmKOjkpsC+wCIIqTcHw210JixFhXc8SH55SaHq
         9s2hNcImO4uN3JHZ901kWh/FKMHFmR1HTwoUJN7PqY5tIj+pxPQ6P68DC4Tev9Wlho
         7ZlJvlKGy9nrmgxWlTwj8bdcqmMEbMm4PMsaX0cN1q0ekNrKR9atqu6JR2+jVRScAz
         BcbUWpabEPChj1DGin54NFWxh8h4ZDYtliNIPHE0jJyJp95of3s+yUZezjRue/efRE
         j2XgFi4s6A35A==
Message-ID: <e1f74d06613a16e35857bcaa4bdd46e7@smtp-cloud7.xs4all.net>
Date:   Sat, 25 Jan 2020 05:56:49 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfAs3eAl6ByTk7ZgJdnPrCzraie05LNXu6/R1XStGyJXhrn8KFoyPm8jDuOfBKg715YjxEsHjmkwBrW9P7emI0o98FVlE1I9YXCHuYiG9/HLrJz5f8CV9
 mavDJCsQ9Wp7f05JkTQoUL5DSy7zbztEVDXn/YAj3T3OJMEI6Ih4k5k1+5fxzgbapGX7WAXJF4Wn4r2+R9ybgAzlj9NQOCk6EppcQFR4RLD7cbTMucFWW3NR
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jan 25 05:00:13 CET 2020
media-tree git hash:	1697d98124819aab09b86602978bd4f50e101e2d
media_build git hash:	a79e3bf0b7383ff0aa87ebff715ea4101eea5581
v4l-utils git hash:	e7402fb758fd106955c3b7d5a5e961d1cb606f4a
edid-decode git hash:	a6b199e94e62bb43d5856426187ef62e3851f780
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: eb9b2120da0c807b5a48cb872a43d111a2c3cf06
host hardware:		x86_64
host os:		5.2.0-3-amd64

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
linux-3.16.63-i686: OK
linux-3.16.63-x86_64: OK
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
linux-4.4.167-i686: OK
linux-4.4.167-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.162-i686: OK
linux-4.9.162-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.105-i686: OK
linux-4.14.105-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.28-i686: OK
linux-4.19.28-x86_64: OK
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
linux-5.4.2-i686: OK
linux-5.4.2-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
