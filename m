Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6E710E059
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 05:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfLAEzl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Nov 2019 23:55:41 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:43091 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727169AbfLAEzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Nov 2019 23:55:41 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:6d50:4431:d7d3:7909])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bHGkiBzn3ksqebHGliwXc1; Sun, 01 Dec 2019 05:55:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575176139; bh=BzH5xvbbZH3BKK6gxoUku+GUU3S3idD5HEYhBHBUHSg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=OV4GBtvS/n/3Y3WGUnrsDj2pmis7dkZjv5usvT4ryRUizftNJRhFHi7Gs+/wAghzV
         VoJp6ECvARj5lgBRIAiKop7RXvq3LkfYfbyb1XVz8DjdDhjizLajmSpCCmqRM31zmc
         DTYW6BQsku6JvMNvbGOAE0AxYTQO80UPv0aJQ0Cemb7erNtKPkzufJRNKdX8gxWKVS
         eDxxEB9Lzg9auT8jXhc0lb68+dgxOi5rzD5ElXEvJy8mksPe15SlfXQNNP6+J3Gs+m
         /IIVpp54bdGztkMiUBtfCsRv6bB3m5p7RVeInbLKzm+7FCXK19Ovs9q2uzG8duT0SH
         BW0heGjo1UHog==
Message-ID: <d3becab687a17d3e482c273f3da4317c@smtp-cloud8.xs4all.net>
Date:   Sun, 01 Dec 2019 05:55:38 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfCH654KJJcmFYs5N6W7Vx07LrQbqgOGAb1xtlPr0ZzP8GBqjuQmrYjpsNjM6AZdKxB5NmWGzACa+ehw/3Ur9bl3ii6QCTqA4JfODG04/XkhLRpjnvJyv
 W9L/SqWsCKXrY/mDC8iObdAXQxXrak6FmfPWurgmjGNcoqkEzxfMpnDcwpvyyfglASrdZoCKMePUl7fvHtAzpxMoynpSj9buwpx0k/vAWXYQq4roI1CX0+4z
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Dec  1 05:00:11 CET 2019
media-tree git hash:	dca6b3733a4a46e63603496f544ece8ace541fde
media_build git hash:	efba365ba11b958a6bf6fb4b397942f9461cefca
v4l-utils git hash:	8021c9d3aac0f4446ef5bedd2c53f0c2afbaa752
edid-decode git hash:	71b0be20420bbebcaf9838933a126fe895a3b25f
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6903fe8f5101fc43440b3259290c97d2dd51733d
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
linux-5.4-i686: OK
linux-5.4-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2791, Succeeded: 2791, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
