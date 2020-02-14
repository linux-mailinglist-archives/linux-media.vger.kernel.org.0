Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035E315D14E
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 06:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgBNFBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 00:01:39 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39443 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725308AbgBNFBi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 00:01:38 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2T6djG8f48i432T6ejObaO; Fri, 14 Feb 2020 06:01:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581656496; bh=lgY4S/tP/PwmIYqlzkMtqF+lXCuHuSM7MzQ4vXFrDVU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=p3E5gQPCPD4Q8Hhz2hkpL+4Rnyh/GqZhyfozi7sXyswzp/ndpwNZ/FXa4fIa7oNo2
         ++8i1uBNmxcxvrw7h6kraSR7NyiN8gkxLntzhv6VVajbZHtohSaV9Tvq2Ju0R7M80y
         hRnNlwqX647hfSvvacFrBj2+HY85lCWxGp4Fum1mNnpJMfik3I9C91yvKI1RACpn0U
         DrmR24/cgWVZ1W3xAg68ReqWygmzO8I8eoeqPOZcVf+syJ+UUrOUAkTWTZLndefJ2p
         QLHD2yaacpW7gZL/GAMJzZ9Mf3RHNVD1JxyQtEuMyXSeywMj+NN7mEzw4qF2mK24Hn
         2dbGgmTcjzI4Q==
Message-ID: <d711ee38990be476ad539f657b8fec3f@smtp-cloud8.xs4all.net>
Date:   Fri, 14 Feb 2020 06:01:35 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfOLecswrFdCoUlv6oPBFddnrfCziwyAyBP3Os6strSEgUBvVkZqD5kXfJX09etbXnONCCgTMHVZK9LRzqqOmTcNJRCend61NErv/0fqittvc3p26GG74
 pjTUtxZaPj2m0Z7IJZNwxbo+d2ZmaiOGaIlO7D1deeXggpx9sLHLyxLuXOoacGF9Wsc5pM1s4BhG8WlbkGO7Pt3xr1pimmrdaGdGqLO8+M3pVBVj/Rab8Q0Z
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Feb 14 05:00:11 CET 2020
media-tree git hash:	bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
media_build git hash:	4bc8680a31802ed323238245c41ad9b1cf37bf6a
v4l-utils git hash:	b62d322d4401e6b6e5cbd78cedad9eb69dac1324
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 4287ef28a1c9e25e017297a8b78e13e753dea628
host hardware:		x86_64
host os:		5.4.0-3-amd64

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
linux-3.10.108-i686: WARNINGS
linux-3.10.108-x86_64: WARNINGS
linux-3.11.10-i686: WARNINGS
linux-3.11.10-x86_64: ERRORS
linux-3.12.74-i686: WARNINGS
linux-3.12.74-x86_64: ERRORS
linux-3.13.11-i686: WARNINGS
linux-3.13.11-x86_64: ERRORS
linux-3.14.79-i686: WARNINGS
linux-3.14.79-x86_64: ERRORS
linux-3.15.10-i686: WARNINGS
linux-3.15.10-x86_64: ERRORS
linux-3.16.81-i686: WARNINGS
linux-3.16.81-x86_64: ERRORS
linux-3.17.8-i686: WARNINGS
linux-3.17.8-x86_64: ERRORS
linux-3.18.136-i686: WARNINGS
linux-3.18.136-x86_64: ERRORS
linux-3.19.8-i686: WARNINGS
linux-3.19.8-x86_64: ERRORS
linux-4.0.9-i686: WARNINGS
linux-4.0.9-x86_64: ERRORS
linux-4.1.52-i686: WARNINGS
linux-4.1.52-x86_64: ERRORS
linux-4.2.8-i686: WARNINGS
linux-4.2.8-x86_64: ERRORS
linux-4.3.6-i686: WARNINGS
linux-4.3.6-x86_64: ERRORS
linux-4.4.212-i686: WARNINGS
linux-4.4.212-x86_64: ERRORS
linux-4.5.7-i686: WARNINGS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: WARNINGS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: WARNINGS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: WARNINGS
linux-4.8.17-x86_64: ERRORS
linux-4.9.212-i686: WARNINGS
linux-4.9.212-x86_64: ERRORS
linux-4.10.17-i686: WARNINGS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: WARNINGS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: WARNINGS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: ERRORS
linux-4.14.169-i686: WARNINGS
linux-4.14.169-x86_64: ERRORS
linux-4.15.18-i686: WARNINGS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: ERRORS
linux-4.19.101-i686: WARNINGS
linux-4.19.101-x86_64: ERRORS
linux-4.20.15-i686: WARNINGS
linux-4.20.15-x86_64: ERRORS
linux-5.0.15-i686: WARNINGS
linux-5.0.15-x86_64: ERRORS
linux-5.1.1-i686: WARNINGS
linux-5.1.1-x86_64: ERRORS
linux-5.2.1-i686: WARNINGS
linux-5.2.1-x86_64: ERRORS
linux-5.3.1-i686: WARNINGS
linux-5.3.1-x86_64: ERRORS
linux-5.4.17-i686: ERRORS
linux-5.4.17-x86_64: ERRORS
linux-5.5.1-i686: WARNINGS
linux-5.5.1-x86_64: ERRORS
linux-5.6-rc1-i686: OK
linux-5.6-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2939, Failed: 4, Warnings: 1
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
