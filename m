Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066603AC172
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 05:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhFRDma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 23:42:30 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:59919 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229819AbhFRDma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 23:42:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id u5MglsWklhg8Zu5MilVCfS; Fri, 18 Jun 2021 05:40:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623987620; bh=5taosls8YLpyTuhkNX8EbJVAj61chqpdPvxxjLW0toA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=UyR9S8jZcS3XejLcBzxM6NfKKXlYKQmNSozo75Qkw4j/ARPKwut+RXdU+WYQaQLA1
         FO80pc8CTw86pUG6ENWbuIWA4CZPZOTxoBsslyewtr83Fb3/mE0Qd4hNpe3MDJtx5Y
         Oo5Y3YPtDJhkLgaF5LRFb30YvHhT2xhjO7pcN2BAilvVoN200mJEfS+2Me10oiw+Da
         ED01KJNz6ZkXCj/K54Wd7ssbe/fekav56tPu9s6+eY3a2u8QnEfHw+VgNz5WQXRsiu
         rbZV+leS5pQtZdyyCSSzQcYl7qv12AAF9w5uJ9rM3Wjo6XYmO6riGD/A2T2zWjJZFP
         7LO3Q1+AOe9wA==
Message-ID: <5510a54ce6b3cb0781d57fb99e637cce@smtp-cloud9.xs4all.net>
Date:   Fri, 18 Jun 2021 05:40:17 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfFTQkZM5GpTUSgtWp1mbpOqVsBGi8II18H7UVbpRlaN7OrC3zBwexRIMhTfukriqhOVG+uF73hODQsPLlfLiQIekxIh13xObo+9Q/4YktI+vN8LUUcJZ
 5oVnfm6ag05/SCEJfvEduSWV3JXWTSMRdNYinhPpdWvIJIZ6SwA62N+spzAfBrVCarktRkRx3reltBBC3qcbmTajYna+/KAg6l0cAAGicEB3CAPSfBb5ILu1
 LHODQ65RdqfEIY+j1a/GgA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Jun 18 05:00:09 CEST 2021
media-tree git hash:	4c6e0976295add7f0ed94d276c04a3d6f1ea8f83
media_build git hash:	8dab03da8769cd94afc5df1fe14c67400dc2f16e
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7481-g7f50411af
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b010e650519b1cd0d44b110c056ef26ae6ff80a7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
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
linux-5.12.1-i686: OK
linux-5.12.1-x86_64: OK
linux-5.13-rc1-i686: OK
linux-5.13-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
virtme-32: WARNINGS: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 1
sparse: WARNINGS
smatch: ERRORS
kerneldoc: WARNINGS

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
