Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D6018E667
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2020 05:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgCVEdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 00:33:45 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34549 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725554AbgCVEdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 00:33:45 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:f832:7b5:d17a:ff89])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FsIwj1itaLu1fFsIxjptOr; Sun, 22 Mar 2020 05:33:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584851623; bh=paBVOuJMwLTo9Vpk7U6fsECk8Wm1dp45BzljK43cbg4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=KIOuacP1fxycAg4O29Hr8SIkeRNIHZO58a7opLblPSb8HmSnnA5HceZEGXPbCM/b/
         DTgxw5AtFsYUo3yHvGkX1boFPxP8Rd4NSGZV8rgVJkJkY9n4TKPbdjACy6FyEPWLCK
         r9Mrk6uRMwe6/noGNWeblnjtug8U0ELHCFTkEwG+s1Nsk1m7SDRTvheF5OX/cHjIfh
         ZKzSAJnHN5j0gwS7EPFbl5l6KR6+13DNeOWeVVbkeyGiprP8J90QHqyVe6/7VKdIvH
         x2RJ4mvo6DWuj9epvqG/lnyAxHx3apuSiY681P5DKgwTcGMCXm51XGjpSGRu6YFJnm
         Gl6gRuYkI2K5w==
Message-ID: <38977ef5803566738e5e2069902ef617@smtp-cloud7.xs4all.net>
Date:   Sun, 22 Mar 2020 05:33:42 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfB0B7drSWKrz9CRkoBQYeqoQiQE689YQT3+/U7yLsgiQLq0c0Zb9kH77w374wLd0s7IXToJ4nLo5l1+uOc9/Y0hQKVEPTmZfakrImVOZGO8re8fqIWN9
 48nzVekoqfnEY5Wr1tHM27ElWcuLeLRpTHOR/+RGq843xPwl8anrB8Ds6oDx7OwvpuaJ0lCGrD+2LfguZGDUrrG/APdsJEP5TeogE5+94yw+9sCUiNzdUlQg
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Mar 22 05:00:09 CET 2020
media-tree git hash:	af72bc8cd6ab32be2105129f05eb4502f45577df
media_build git hash:	5e1b2e9e12ffa812f69a15a56786f3e41277bfba
v4l-utils git hash:	e4f587a68cf5e896ba1ff1f205281ba870c7d58e
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: d2e7fbcfb9978b0d30f96056c21718f3dbd96598
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-x86_64: OK
linux-git-i686: OK
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
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 1
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
