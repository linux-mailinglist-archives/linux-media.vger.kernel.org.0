Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32280224ED5
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 05:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgGSDTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 23:19:53 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:52177 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726284AbgGSDTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 23:19:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id wzrgjObfENPeYwzrijh9Ed; Sun, 19 Jul 2020 05:19:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595128790; bh=FJs7/SkAv50u+/iACmlJfcq+KFPo5W2/ljZD2MjwA1Q=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=SJ5g3XhZ/5FUBlsqmqegQu0djPWS83OfbgxXpFm13kF6mmj5oB59PMXDS4sunutux
         M8vNV4QVC4NcJ550wCxz1ftx6Pj395xtfX8yH4H3HZf8ZOrSY4hTSe524HbLAfWvVl
         fINJvW1eXDA1Hgf4sjy0kmHVqcQ1QdJGuEdx8Ogv0EXFqPo8ozUPOnsDK8/0wDbM+m
         91UVo/OX3BTd34kSAJTgctUxVo1+SA2s+t0/x80aLbi3/EHyJcDgbKw+Xbzu2PZW2s
         gSYA+OygYYJqQHClq9DOqDhV55t0OYLKyGi8UaZmgVhNmNm7EZpWPjczt1W85Cxo3z
         TmzVVUwd0ZYPA==
Message-ID: <3f6ff3f537b1fae8a5f219eebaab22fb@smtp-cloud8.xs4all.net>
Date:   Sun, 19 Jul 2020 05:19:48 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfJF88105gC+QzKgL+HglD2zvTC3xL3FrpiVD/tzKsZX2jGYE3KPWqo4SZFwLZDgGG+38bRKaAZcvSi3Gt2aNJJRTSf0aLOscClycQf11akX5XXRSYDX5
 7UP3J1rKeurbyDKABPseZ+QM6WdztYgbxTZmwlSsFVmTxzfdWmw0DCFgyAd7ZutARFtQQrXXFi8XztCAozSIuiwOcO+1LUDRO1nbqN/cli7G7KI/AecZ9WVE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Jul 19 05:00:10 CEST 2020
media-tree git hash:	6f01dfb760c027d5dd6199d91ee9599f2676b5c6
media_build git hash:	3b826169bba299e5a7352f79759f3c67a4c9fb7a
v4l-utils git hash:	235bc1efe15518d48cfe81ae3e7983ad1d2cd9f2
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6381-g344ef612
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5540ce1b67f5015886e850a4775d2eace9efe922
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA
Check for strcpy/strncpy/strlcpy: WARNINGS: found 3 strcpy(), 3 strncpy(), 3 strlcpy()
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
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
linux-5.7.2-i686: OK
linux-5.7.2-x86_64: OK
linux-5.8-rc1-i686: OK
linux-5.8-rc1-x86_64: OK
apps: ERRORS
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: OK
smatch: ERRORS

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
