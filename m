Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D7F42776F
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 06:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhJIEwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 00:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIEwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 00:52:04 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B60CC061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 21:50:07 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Z4J8mVhptx7rIZ4JAmD2Fx; Sat, 09 Oct 2021 06:50:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633755004; bh=P4dwT5c/DYS7gsw0AKV9pBJ6nxHP/kggZwRt2k/HQr4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=b+Mv+07Q8lLRTmQ0MH1mklyMxKx9V4gpPJQkOZ+lpZTyA+VkwYrAJgZ6yZasN62LK
         l8BiahhH2ym0hcGCZrRuJarKrnYylYCOw5qNZy8lqgxaYb81vXF/1KX02FeoX6cHeJ
         i9ZmgceQTXy9BwWre/P6uTgPweVk8SYc7vwtK2Yk4F+7c+fWEOGbv2+49+wJ7aaLdb
         2h6mF3cz0xAvnQnoebcEJHkrdOXUREQeFYkz4TOBoqnlMLqWfN9KDTadef+nbUF0e6
         WwyCrHxUDKLbhjz1NFeT1vu4dn+E183ulhOF0YSqApc/L+0GtYhgMBrfwGSFROnLrH
         H38L7SOceMtdg==
Message-ID: <e51f040aa14961493d45c069f8eafe09@smtp-cloud8.xs4all.net>
Date:   Sat, 09 Oct 2021 06:50:02 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfHtA2lEFGW9mmf6Y3TAyqX4zRgJI+t4cbgh49YyjAEae47NfxwB/wQh5mlpPK12wbUy3zkt2EQ/VcOHO1qPC8pkRO2Xrh1g2gI8N4GzceA60N4Vw7HbD
 YbJUSdDfzG5oUNkKECWC6CEb1vok8isB+MG8zNdNsFSYFbQ1DaBAZ8G5MSA5L6v0iN4aH9HtpbFSdRqO/Vdd6LdGtnAMx7JOtIwYf0wah7MrumE1WTajDAmD
 wLn9ycucJ5XdZXjiB84Neg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Oct  9 05:00:11 CEST 2021
media-tree git hash:	fd2eda71a47b095e81b9170c3f8b7ae82b04e785
media_build git hash:	e602a6acc36ed3f6a8ebeb27fae6f32712f1293f
v4l-utils git hash:	493af03f3c576fad69c050d33215d1f4fc0d532d
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7593-g7f4b93661
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b271230dab7e119453a068d347aef2c79d6b74b2
host hardware:		x86_64
host os:		5.13.11-marune

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
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
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
