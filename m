Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69A2356217
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 05:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348424AbhDGDqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 23:46:50 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56243 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344405AbhDGDqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 23:46:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Tz9JlJM5zgIC3Tz9Ll5TdR; Wed, 07 Apr 2021 05:46:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617767199; bh=voP+L9gvIZLir1447NX9eI05dkpfcpFmAhcDcQ+NSvg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=LFNzYwMzdZbNeN4/lv7ra2SceDrKh7oAIqYaZwkeWm5t0Wj+ahSd0zZmCwjMi+4wd
         OvvvCFMbFNipKHZafh1uJ9QZtugZPla3YCUA0zxwSwKUf7s4rO+p5vkcI95AJk7kem
         CAX6B6tCvqHKaEHnPFovUlul8jNUDzhL+4QoVpVS7fFcG2Bijb7nhhh4slfJLt86/s
         rheSsdRFbrjmnXX01ryULTed2HcI4WviWQWmPb7ALQ3LouJD5b/yAkjeXiW6/WQGXY
         RpCVOTb7+c9jyXb4Gv3/xuvLAFp6Df14p+sqpvxDlDnekgrS/MeAndHuJWOkl48lvp
         OYsQAvwwIY4UA==
Message-ID: <3876f68d8928a065aa43bb55bd51ff6e@smtp-cloud8.xs4all.net>
Date:   Wed, 07 Apr 2021 05:46:37 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfNG83OqAc92RIi1akAfTEe9LPPt0xrjcdI/lg1cY7YHGTA+u/CSJsGnMGxlNhvWgtQU7+p83PVNJi69g9UEqya26zRsziSkR1l5+4GyrvBIcLSROCHJM
 9YvMyQLBLSxh2mWJSGafa8QNS7aeSSumJYqMZVGrKV7kpbwEVoKDNZpTQFHjkNuWIIrLBfxh27XNmOTxJUR9oBNUMuf68pugvI8M7IJ4J9xDwgdGRoEcOWA/
 hmk+9dm/m/Va4dG6EKcZLw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Apr  7 05:00:12 CEST 2021
media-tree git hash:	7acc54ed6061c9219774d1897efa34c6304ffda8
media_build git hash:	70188fdddcfedda190f1118529888cd3dc2581d6
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
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
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

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
