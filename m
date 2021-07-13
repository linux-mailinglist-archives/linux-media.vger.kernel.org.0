Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287B33C68D4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 05:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbhGMDRi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 23:17:38 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47941 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231340AbhGMDRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 23:17:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 38sgmQFuKhqx938shmYi5m; Tue, 13 Jul 2021 05:14:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626146087; bh=c+XuE4/AtDSunurHBMQug4a2aMj5O4tiD3EXiPu8DIk=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=cORAJUDRDfBlf0ayg+noNZtqLjDDbTIF7MnZEsbZg4mkJQWl4e3DKH57y47CQ6f2/
         KYbhj/wuFq/yJQMM/BwOeCsAF0WlVTp2XfYqOcpAcigL3L5m4rCBYVlP0LD/eP8NDG
         q/QU5lHdGf82yrReoRLUc59f4AEQJTPxugbUJuYB4eopWvQtCOxXUXkpVveinOGZ6p
         wRN1oBj+w+3YLptQDGeyTn4Sf4YU4RKZuRD7UlS+QZWBOQyN3LgyucxqXlC2q4u+8n
         90BVn/pmUuB8+qOtRbSF4BnShT+pWDcDX79R6CljinkBYUepTZZI49TeKbR3gJILDH
         CnNthV5ytR1fA==
Message-ID: <3f044e01dc653849b72c6f2142b0b24a@smtp-cloud9.xs4all.net>
Date:   Tue, 13 Jul 2021 05:14:46 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfH/IzjFq0VzamXFjtdQJsvfw6BwotzHZUbA0E9tElpnR/a6R4uLpxE2f+pVm5pMWdGynNp572HSa+aXS3RYt2IKYDxjpZK8aKQo6rg14yd/yte9yC//q
 l1swb02Jhgi04V1RNvvWTveRT/qDyGAoWdBDD9HL30KoL8GESwfaQLUOzLk/Dr4TVQyQa0OaKMFBSJgn173ASsXpRSADeed8s29Q6870R7hhLeAq7z2jAgXP
 ADPmE78eWJeMd6xr1HFm4w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jul 13 05:00:25 CEST 2021
media-tree git hash:	e73f0f0ee7541171d89f2e2491130c7771ba58d3
media_build git hash:	dc90f6c653a467465b5deb23d3310577f8ebf218
v4l-utils git hash:	6ffc5248dede6285d76c5ec5680c316f68ff98ca
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7481-g7f50411af
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 328d8f6242d952437e8dfc96047fda207fad8deb
host hardware:		x86_64
host os:		5.10.0-7-amd64

linux-git-sh: WARNINGS
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.258-i686: ERRORS
linux-4.4.258-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.258-i686: ERRORS
linux-4.9.258-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.222-i686: ERRORS
linux-4.14.222-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.177-i686: ERRORS
linux-4.19.177-x86_64: ERRORS
linux-4.20.17-i686: ERRORS
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.0.21-x86_64: ERRORS
linux-5.1.21-i686: ERRORS
linux-5.1.21-x86_64: ERRORS
linux-5.2.21-i686: ERRORS
linux-5.2.21-x86_64: ERRORS
linux-5.3.18-i686: ERRORS
linux-5.3.18-x86_64: ERRORS
linux-5.4.100-i686: ERRORS
linux-5.4.100-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.13-i686: ERRORS
linux-5.8.13-x86_64: ERRORS
linux-5.9.1-i686: ERRORS
linux-5.9.1-x86_64: ERRORS
linux-5.10.18-i686: ERRORS
linux-5.10.18-x86_64: ERRORS
linux-5.11.1-i686: ERRORS
linux-5.11.1-x86_64: ERRORS
linux-5.12.1-i686: ERRORS
linux-5.12.1-x86_64: ERRORS
linux-5.13.1-i686: ERRORS
linux-5.13.1-x86_64: ERRORS
linux-5.14-rc1-i686: OK
linux-5.14-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: VM was not running
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
