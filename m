Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73BA1128C96
	for <lists+linux-media@lfdr.de>; Sun, 22 Dec 2019 05:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfLVE4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Dec 2019 23:56:02 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45413 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726486AbfLVE4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Dec 2019 23:56:02 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:18c6:989d:c89b:a5ca])
        by smtp-cloud7.xs4all.net with ESMTPA
        id itHZijOH1apzpitHaiZD1X; Sun, 22 Dec 2019 05:55:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576990559; bh=9HsZwYM/QmtcvQYEuxLXoPTrMNsmQwZEq6732Sd1Y1g=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Ud6INkCxQ6TuF1GNz2pv2ZBxxFiB5/wNWo5qEddYSr/fvXKvS+QoeHeVRj7kCX7hm
         8ltkXskNe9LQio2hWEWg1U6dYePvFytOWUIubzuVX5QQS4BMt7GxvIZPlq8Y2N1p0H
         FTXCInfdBdiW/gPta0XxPnC6BxyRzF8iTq0FLT5nBSnNXq0NiOpGbeOG1uJQZU+deq
         wQHnI+zrl6OoPu7ccgiOA8D9PqoRRGWSprJg9wLCzB7lCXIgY47o5S/xx2OXL8KQRR
         NhCP209wMD8OSa7UVShAJkLM4EDjKqDwBus57jkXdyUdBmD3L3GvWmUS82XnkJRKJB
         EON80WqjLCGpg==
Message-ID: <6de6e03f4515218989299d57e024424f@smtp-cloud7.xs4all.net>
Date:   Sun, 22 Dec 2019 05:55:57 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfDgbwvYOZaE5Exz4Yf1rdRUWg5PkshNKbo3jdTG8R7j8S1R2Y7HkotwgzrOs+HlBRvfcf6sbVdaHdMQKDxqZ4uxIznsICFOQVlsUUvsqq684713ubsr+
 JGOtYmnEK4SdhlnYUW22qq2XAQxRKnJh/V2tiOkmM62tvQk4LnctM/zWkdN8F8fxh0cj+J69lhaAbAyPEvXFk0HAyIoZfwMqUb+EEtCu5heg5NG+VoqHaUBK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Dec 22 05:00:10 CET 2019
media-tree git hash:	0885acd77eb4644fd88f6d9f41e433f4ee9bc37a
media_build git hash:	2555f73ab11b9936171fc31d38498818922c2f7a
v4l-utils git hash:	21c474bfca2d9167489d87a06fa9f1698b3c80bd
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
virtme: ERRORS: Final Summary: 2901, Succeeded: 2900, Failed: 1, Warnings: 0
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
