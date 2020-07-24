Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B3722BC66
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 05:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgGXDTR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 23:19:17 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51429 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726437AbgGXDTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 23:19:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id yoErjI6SYywL5yoEsjROSr; Fri, 24 Jul 2020 05:19:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595560755; bh=D92CIS2OZHdHHLbQg1U2lFqTkHplJnt8dD8nTN8UsPU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=FSUAFb1XzT09xKGSoXlYKJf2CtwreuAJHxuWm/XRTW2M9Ytre6zhwM5hGyH5QAff8
         E/cazwa3OGOSITr5scMXW53wQqdR03GosOesyhX9qOIVx/hrL5HJljw+OhsjYn+i+X
         lcUzIaso1wnMewXb+8pVdtmH5uvDIDnOBx4LbpRbqLbX93drouQILk9gn0LNvpAGuY
         46nfZR7DW8YVNCLE8UOoheXUBvf+kCHD40do7m/htjhhmeGcIWyTRy6EmOiRhP/KoY
         4/VNc3dCqv/3BvE95qZS6F1scDSdcMIgEtVg+aWpj8KeltmXTXO7kVqnyW3sWKNv3s
         0w2TwvLVrxpYQ==
Message-ID: <5b79c469b13c675377fe091fc23c11b7@smtp-cloud7.xs4all.net>
Date:   Fri, 24 Jul 2020 05:19:13 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfPCcFllQMyKAvip1ybVp67kMjwH/83DACR9kKOW0DzpMfFJrWHNpADDmcYyiP5gEt5AIE29YehRwAM5If4sOevigPDYXKxJZc0f+E3nvrAdziJHLky1L
 nHuGlmZSVPn5hhhSOnGun6nnSzLXZkhboP+w16FF4xYWNf3h+Av8+iW2sZ/4umPD23IP9oJU0BnxAEtX+cY/hXSQ5jQyn0f0UvpKrJ43w7d14g88ipbucAJ0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Jul 24 05:00:10 CEST 2020
media-tree git hash:	8f2a4a9d5ff5202d0b3e3a144ebb9b67aabadd29
media_build git hash:	ea2766f182b3a4e03543be2ded0845fca4d4fa80
v4l-utils git hash:	df6ffb4df75c758b1ebef9e05d6490b370e781ae
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6381-g344ef612
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 1276c1355abc12c391f3d471acc71d55421b87b6
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
linux-5.3.1-i686: WARNINGS
linux-5.3.1-x86_64: WARNINGS
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
apps: OK
spec-git: OK
virtme: WARNINGS: VM was not running
sparse: WARNINGS
smatch: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
