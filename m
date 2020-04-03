Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D004A19CEE1
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 05:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390362AbgDCDdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 23:33:24 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50169 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388951AbgDCDdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 23:33:24 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:49dd:6c9d:7ebf:e773])
        by smtp-cloud7.xs4all.net with ESMTPA
        id KD56jLEM3Lu1fKD57jW3BR; Fri, 03 Apr 2020 05:33:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585884801; bh=+uTj19nf08qO/FuTSSwl7Dx9tUSt7Fg9m2JxBfXbZv4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=RJIuutlo/7Ok4CrFPeIWq41ZUF64nmDnJ7axAQJUYS8NJiqDgcb0ylCOKJXS+35DB
         KVRiZHgBb9rI64jEJ4YWvZWXktBH5XcqSM+rjkKO33lxhUIFrq7raRtUYb8BxwNMoY
         x+5hpUIdgEUnU4IpzqOgNMPKvUh9CFwblVK1ImMYLanS9HW/UFerkT18ZU1gggVRUM
         bX7sImWfM6Z3TKSv8zXwLXSsETLs5t/lB55ZZW+aXOkhlFCVtT+98xCqJrvCQdjE01
         MgtB/aI7Gq5VomR0szbCXxz1Mqzxj9c3+zQDIgzbVlnp9kGMB+ugibidKY6a/W+2U6
         jxvUYVhcftQVw==
Message-ID: <dd6cc7621fbacfbaf62fd14104d1b393@smtp-cloud7.xs4all.net>
Date:   Fri, 03 Apr 2020 05:33:20 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfAO+E8qpG/e4QcwpqArxH4s36gC+EABTln795AmK7y5rXGR1oO/NwbBacqZgSdBLsg86Hc4NvtkKHNX76Sf/nfE8QIXUSP6eKUUVzE7dZl299eiKX99J
 Eb5F7gBasyaIASINPmfZ7w2E0q+t/5XkjgExO9NKIn1iX7QWn5wDziFvYN0hQD8+Vq3tY/AWEdCpVXiE0QQNUJkhRAxPsZip/HUlY7kofRR0lXNZnDjVAeHy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Apr  3 05:00:11 CEST 2020
media-tree git hash:	2632e7b618a7730969f9782593c29ca53553aa22
media_build git hash:	5e1b2e9e12ffa812f69a15a56786f3e41277bfba
v4l-utils git hash:	38f4ce74275ae4625463f7eec78764715a0b6246
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: cbd8bfbab9e84c54e1f1dcf8c172c400a10126df
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
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
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 0
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
