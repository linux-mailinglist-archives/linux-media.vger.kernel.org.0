Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD95317896A
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 05:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgCDEOJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 23:14:09 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43699 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725796AbgCDEOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Mar 2020 23:14:09 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:4d3e:f349:9b5e:9e3a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9LQ6jolNaEE3q9LQ7j3IBg; Wed, 04 Mar 2020 05:14:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583295247; bh=DMDdZcJ+tmwPQr3xUs65XKaF9QfiYSgqkny4PK0qKCE=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=jRriq1LvmF4FLhTK/eD9+fQ4yRlxUCDKIOINkwc+Rx6SW/EjGvGQ+QAUSQutm7pyc
         0IDk03qFalKv8unECyrp+jDdrYDiIPg53ycu32NtMSKJjzCJT3s21kx5TpEILC1600
         BHWGSLir5SerIOz13y0pKAbkzBQURS4aW7Vdz5LtNok/Bx8EKKu5z7qiYYaNq/rTKG
         bgS1FpBer0JgIGHJL0gtRk74RuNr0nWIFw3M+gTdkHBmubQtwxK8Vvmg3exhfyTfZB
         A9/JGxFSJid5b55K0QSHcvCuZ68kG2ofhS0WzlxFI09BKXC2Wb1tOVxxlOAFd7gCKo
         SPWStBapkXoOw==
Message-ID: <1331f249726251e456b8f6bda13b8da6@smtp-cloud7.xs4all.net>
Date:   Wed, 04 Mar 2020 05:14:06 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfOFcB5+o8qhWRvkbQQhlthGHKvXwXtuHFuJJi8gppsI3ZzwBIQQBYbZVYjYhUUqtK3gC/RWBigxtkSCZicN5eiJfb8QDgZh0rmvRWe6qFfudSe5wMptp
 3Gb/CLy0zlhgOoa2F4zSc2lAVedBX7XQwnn+kIBRyb9V5k6WnpjKKEoe/Dz81L1xinLJJEnSWZ3Fj1I317ryS/7iJMPvEfVIy5KY5fgiCIl1ko7MRd19WLdP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Mar  4 05:00:14 CET 2020
media-tree git hash:	8bc8c9ba03c4d4966c2503e189801fbc9130b747
media_build git hash:	680a07be51069bee47a07a4bcf36c5176f1290a4
v4l-utils git hash:	4e555017a19834db66d4772f62c5b382fb374dea
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a415366fdbce7553a6a46799ed0d2f8fb5fffcd9
host hardware:		x86_64
host os:		5.4.0-4-amd64

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
linux-3.10.108-i686: OK
apps: OK
spec-git: OK
virtme: WARNINGS: VM was not running
sparse: OK
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
