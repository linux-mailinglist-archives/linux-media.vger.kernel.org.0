Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEC63E0CE0
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 05:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238572AbhHEDpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 23:45:42 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59807 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238537AbhHEDpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Aug 2021 23:45:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BUJxmofzAW9QyBUJymSK06; Thu, 05 Aug 2021 05:45:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628135127; bh=lA58yaS8MRcZgcfWw3urmvDcxfn1WEmZwJ/Eypm4tgM=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=eC96UGRH4OYATxV3J7g4BC5cHFGn/ndAlEkSS4johb3UGcR2OQIyWJ4XgQDRgsWhK
         B1GwKwulEqo2s7aREK8ZEwGahPXvLYVjNwLzs8o7aGN1mZoEFQS8bb1HicgBez/avN
         Uuz4MG4B1NkQoLraZSiPe4tIxcwHkY3HZYNLs43AVv0b1/JEfZBtqsSHP7QZiLx6I9
         S9WDo4oPxFH1C3Mh/4qzxEkfqqq88BC0nOK69yi80Whqjq1yGSIbgO+OXY6WyTjCd7
         WYS1oPFVAI95CriXUdlxGqdC9eMwPTANYx6Ui2SEKKiiOLfaB+qF0aMOYC0x/CtH1o
         3H0dzEyV9Wm4Q==
Message-ID: <7f32bd23414328ee8c351cd39ede54c7@smtp-cloud7.xs4all.net>
Date:   Thu, 05 Aug 2021 05:45:25 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfA+WePojz/1yDWIuUso1a7k4W3IC6ezS4NoAquGKcPyXk8nuIL7PbrIh202srKs5bhTEuMsCrEi30rOhVkH1W/ZIFOnsG3OQ/OgLn0nyfouPJMULutb2
 620AifT1ko40hqnA5AyqNojtCwn5na2NbQr1ybkXR2lapzHTLFtYqDVCVLnerwDyBToWaQqPMoG989xluaut3pvBohxOfGdxgCfjcvmZ1JUmKs8GzFkjPr3u
 eJKiQSa1Fi2vq908OY5bag==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Aug  5 05:00:13 CEST 2021
media-tree git hash:	bfee75f73c37a2f46a6326eaa06f5db701f76f01
media_build git hash:	bdc3294781a89c69fc05acefd95842b88ffcb4b9
v4l-utils git hash:	7952c0042ccf549959cf924fbd3e7dd894966e57
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7505-gb2467b103
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6703700d637a73d66e094bc62d34c826f353efaa
host hardware:		x86_64
host os:		5.13.1-marune

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: 
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
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
linux-5.12.1-i686: OK
linux-5.12.1-x86_64: OK
linux-5.13.1-i686: OK
linux-5.13.1-x86_64: OK
linux-5.14-rc1-i686: OK
linux-5.14-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2989, Succeeded: 2987, Failed: 2, Warnings: 0
virtme-32: OK: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
