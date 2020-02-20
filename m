Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4624B165670
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 05:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgBTE6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 23:58:04 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33257 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727370AbgBTE6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 23:58:04 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:dc05:c6b3:9042:4745])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4duSjVuHujmHT4duTjILRW; Thu, 20 Feb 2020 05:58:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582174682; bh=1tOzPs6Xe+Y5IHRBZ7vafD5uJ/yhprWb0c/Pc9Hzty0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=HfujuOBTf+OCB+nnwRApPH3z5QGJtFLLJs7ygvsfNEJSGtRmG8yciEMsF30+HqJ3h
         AOzwAllnDWJDWUckFDgIkGfo7eR7cBgSWbt+PAOToYDE0VGRUfNenQtjwugy79ffwB
         kM6WsIDdRHX5qF1CrLC3ygR93DcCmU1ji6GsjRIjvkTsEPgMBOqFDkOUAHWeDXIEB9
         Ss2nXf07T3uKLSw+JrhjB7IWCJmXuujR10wH89SogqhMMpiPmfl71QrLHEOngao6qq
         ctNqo5vtBRmasy2wJZLeGC+dT3+NKoqJCiSD5N5N/b7yxuo0ebLjH/zwS9Bfs5FuRV
         gmTTZOWD1QcjQ==
Message-ID: <4987444efd042115d8b31fd2ff5bf617@smtp-cloud7.xs4all.net>
Date:   Thu, 20 Feb 2020 05:58:00 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfPpDi5gkVuy7nv8zF1T4hHyMfzmM2lkNwZ9/xMLAh2hlo026xEiPLOcRw1PnLHWS58BdXWBkYLye5LO9WoRLgQnpWFLW5cFflQwbFwtZmMAIFS1Q7brV
 0SqfQVcGjRfZzxssGM8nNy0EiiU3Odo85UgQDEbVHsOTKsilNIKwr8PgXJ3hbWSwY7Yeell3xpvfbshOLNZkk5Tiq2QjQDKaqTevAmwZlLi8rYMy3+PoGmgh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Feb 20 05:00:11 CET 2020
media-tree git hash:	bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
media_build git hash:	c19c9d0d270d64a158c41764125deef059b7acbc
v4l-utils git hash:	3be1227d699f5c78e263626d97e75c43cd3726d7
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0a0399d66d361fec135a2dc184bd8d12148f35ad
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
virtme: ERRORS: Final Summary: 2943, Succeeded: 2939, Failed: 4, Warnings: 1
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
