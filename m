Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC5E11FDB2
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 05:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfLPE4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 23:56:15 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:44479 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726437AbfLPE4P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 23:56:15 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:319d:6a65:b2d0:e9e9])
        by smtp-cloud9.xs4all.net with ESMTPA
        id giQVixia5GyJwgiQWi6Iy4; Mon, 16 Dec 2019 05:56:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576472172; bh=acfpPpWH/dijt1lYZnLGoytet4dwWaRVGf18LK5Pi3s=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=F6p/0eehlfBbDW9vlsy1rpyt6O7V9poAa2oBW2fjVxU4Y8p+vnDTt2V5Vf+fMaCTl
         KfVZs0Ck6973fPHGOu/lFke8Psjm/ec80xzAsEukOnDKGQQgz+ABIlLhRUsc6ekxm/
         SKSbQpdP6EftDJOSFw6YnT9mJTUK7hvL/sIZ5ifo38quOX6C9AB2yq7VQK+yxsr292
         kKwv65iHuJbiyl3TGG9dBW5PNPAtxNr5JRoMa5oXlD0A+t28JccP1c+ZmQFNXIzm4j
         dM8AVNroa8wMPXAXHEFE+7D/XnA/4ysdpdpAtk3G5akFULrxkYmJIkwKmFDgCNEOUm
         Ymn5REzihvgWA==
Message-ID: <7ab79684dbba9aeada4f6c35bd3f61ed@smtp-cloud9.xs4all.net>
Date:   Mon, 16 Dec 2019 05:56:11 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfM+vJtcocEelWGABQc0/YMVu7+Xyg514k8Mr8U9QvHee1aflCo43Rkv+GVMZ8aSGu4qmQGRVt67NqLocku3v0W5pf4SnVs59n0lIyT0YuAQIzC4oH1oV
 oMAIk1OkSt4KQUWkOsgsJTl8wjpCpipIlN0CV1TSn/hEl9vbV68l6xknkgqVdIVMMwVBKQyxQwLKHcPembzEsKim5q6TsNkOPSeGohrAWWSqyHlAMpdWIMoR
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Dec 16 05:00:13 CET 2019
media-tree git hash:	da090bf60370c9ad6ede4e76adbf37ce79b84791
media_build git hash:	2555f73ab11b9936171fc31d38498818922c2f7a
v4l-utils git hash:	de3eac45d893a183ca1f98279399bbfda650d54d
edid-decode git hash:	e719d04077d098eb51d9494f41060eba2419d4bc
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 2bba801e0e7dfc02308d972580fab46d27aaaffe
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
virtme: ERRORS: Final Summary: 2901, Succeeded: 2889, Failed: 12, Warnings: 2
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
