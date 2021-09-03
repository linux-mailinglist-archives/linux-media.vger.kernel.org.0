Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721933FF929
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 05:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241891AbhICDpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 23:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhICDpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 23:45:41 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5944C061575
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 20:44:40 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id M084mLJ0iy7WyM085m9HbA; Fri, 03 Sep 2021 05:44:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630640677; bh=KNZKxxs33gs8KD38g8NOKPUOAoUrG+rza2h2cZEKGmc=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=DMVvl9poJaKXbjWxD3kq0DM5cxUAixc/ARGw026ek+4MQuJLWeUuSufzBZ40vv5sH
         BguJo+jzkxs7Udls0Wbn4/9ZH7dlvOmSeeNqKVkOfxOKrRrc38GoeT60aM+2L3Ztaw
         Ybl2k69z2rxEL2EWlP65/xuW+bepyQvjxw7ns6pIaxs94XMzJ2fBI1Ufgcm8Np9ls0
         etvD7Tv1dxQDK7TT0CztBgyd+LUI3TT3T+qBfrGd2X4POmp4mRsLmeuFMFDJyTkiQ9
         wH5s4/UxGIGsHT23yz6fKwBu3akmd3UkE+lPDVa04Jl+AFsd7Qe1wsKf/ePPYU6etr
         APsKrcfylnD2g==
Message-ID: <423b92b6661e8e8bb5ba172ec17b25f7@smtp-cloud8.xs4all.net>
Date:   Fri, 03 Sep 2021 05:44:36 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfP1yYaPsFcHD2ExkeuP5a8NFZO8EK7X4Xd2VBCRoogkKTfv5irf0/F3si0qOPdh8JcnCNu+lQPXelwzHcvquu3lI+3I2dtjhXnLdY5xKz14zPCQ4UQIZ
 oAlGkfyVKFeowZk2abiBtY/RO2erIyUc1bUpHPRw/QcA6pGXHk5b5o0Fs+iiaC8lhMLLtUZ/ag1tN6QqxEwv0+EfDLQltcFmhDustQC6jm2q8v3HhJsoVX6+
 ZwCAmPCwDq0Z6MHfdRh/1Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Sep  3 05:00:13 CEST 2021
media-tree git hash:	9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
media_build git hash:	7253675c65ed84dc294ef25e2af873e8092be48b
v4l-utils git hash:	7c1f86e3a70c1074929a10c0379f6a7a71a8a000
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7561-gd7ccaee39
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 8f230e7be768cbdfab869697ba0a2c622a4a0cae
host hardware:		x86_64
host os:		5.13.11-marune

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
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
linux-5.13.1-i686: OK
linux-5.13.1-x86_64: OK
linux-5.14-rc1-i686: OK
linux-5.14-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
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
