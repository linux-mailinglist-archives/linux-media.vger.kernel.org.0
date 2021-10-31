Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF490440CB7
	for <lists+linux-media@lfdr.de>; Sun, 31 Oct 2021 05:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhJaEag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 00:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhJaEaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 00:30:35 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64810C061570
        for <linux-media@vger.kernel.org>; Sat, 30 Oct 2021 21:28:03 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id h2RomDhPM030Kh2RsmOOdF; Sun, 31 Oct 2021 05:28:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635654480; bh=2QKwwnDmB04Ecs6iD7MPvI7JBzch1xUvI/P0kP81AqU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=GKMNz9tA/opHkx79qJdssXwmfAeb5Vu/gCLOesVV9p14Utcvt+IMIED1TWxi7qi1U
         3ZSA1Gv6TxRhWlfDYbJiIv9v/+S9hhxtdXxoLdBKCpRtMTZk1ItopqqBzqgCm7I5Y3
         QlKqctuLbUXGWPqyI972NpgeaohqrC5dYtmz2XJVogxbSnGZSbs529bkAsRjRE8Toe
         k5PYrRTygEV8fzc94JlxFiXu1Kj6c39HJZqByQHpUNG117T2LcV7LTgOvUX55LctHN
         akORRYoIpAssxfjunePgJKUZaIuHaH3qc4matUALBlR6998i/ugb6gqMmZOrKzUUNB
         ip1wAWiqNZScw==
Message-ID: <91e71b4a87a73030f228ef949d852259@smtp-cloud9.xs4all.net>
Date:   Sun, 31 Oct 2021 05:27:55 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfGpNF6a6cgy3StOxhSt1RVd2DymL21PqOE7M+lxZE4Un/foyyo6NgoH3uc3Y/po3fBw1qrt6R8Oq//kY2MTKpskrhmHwIZa7gsuIoj+JVu7E5H1VRdDk
 WdnBQkcj4qbVJ/TmtY++mNWZc8+dtgi69J6JSaUchVWOaJaO1qBLoz0MMJOo0hxVvVmsAnfKkEWzbg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Oct 31 05:00:12 CET 2021
media-tree git hash:	b4018f343a8ab4b41d87938400cc01b066fe8ca7
media_build git hash:	c3d4780fa10bc38eb9dc462275fac019c8d693d5
v4l-utils git hash:	24fd9a970d8bc62dc06380009b9683461238a7dc
edid-decode git hash:	67ed12e3ccafd9e125a5eec9349043b523895dc3
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: f1c67b200f199ca44b793327582bb643ecabd35f
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: WARNINGS
linux-4.5.7-x86_64: WARNINGS
linux-4.6.7-i686: WARNINGS
linux-4.6.7-x86_64: WARNINGS
linux-4.7.10-i686: WARNINGS
linux-4.7.10-x86_64: WARNINGS
linux-4.8.17-i686: WARNINGS
linux-4.8.17-x86_64: WARNINGS
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: WARNINGS
linux-4.10.17-x86_64: WARNINGS
linux-4.11.12-i686: WARNINGS
linux-4.11.12-x86_64: WARNINGS
linux-4.12.14-i686: WARNINGS
linux-4.12.14-x86_64: WARNINGS
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: WARNINGS
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: WARNINGS
linux-4.15.18-x86_64: WARNINGS
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: WARNINGS
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: WARNINGS
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: WARNINGS
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
linux-4.20.17-i686: WARNINGS
linux-4.20.17-x86_64: WARNINGS
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
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: WARNINGS
smatch: ERRORS
kerneldoc: WARNINGS

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
