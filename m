Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 615BB18DDDE
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2020 05:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgCUEgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Mar 2020 00:36:39 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39255 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725763AbgCUEgj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Mar 2020 00:36:39 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:f9fa:4b7a:4c40:fc02])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FVsCjB2zqBr2bFVsEj19eK; Sat, 21 Mar 2020 05:36:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584765398; bh=cnCvsOCoSFVSPo9vtgRl8D67b3dtGHIoiLrVuwWTKg8=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=SIXCMXm517+MpPj4U4wOWLU4mCCBVNLJ1aaWxKgv9SCXM08U3AHk2u+pvniDcKtax
         32SzeXG/pk4cTXE6236Y70DGv30Jcr5vVrTdInH7q0F2JCqUcwMtc/Usy4Qo+LHRQR
         GzUCmsdK1hZvIMIWlUox1/PKKTON7w2PcHwmN96ajQgkbGYx5+x2iLkx/35PzoL7BP
         Hil+3dk+vrKTiukc+mG1jEcKq+CYkQgLc24VyCV/xJgiFTsm6oBPDCw4LPX13B1ciF
         /dYXZwrcZsoB3N65MQhVq6MLyLHSJ/7sfa0oc8zjkM9dLSWXcL0oLlU43aSdA3Djxf
         2Fa7QoEtNXNgg==
Message-ID: <3e060f2cdcf3a522515ca9dd04ed6c99@smtp-cloud8.xs4all.net>
Date:   Sat, 21 Mar 2020 05:36:36 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfCrItJUZV9+19SHDYwq006ciBeAJwViQFr+Qo+8lvV219hcXDyymkQd/RyWM+SPAhgoYmMCwSVDcq9mK8MPJ1lGn/91yBrpBfRBXJ4mV3G5+fSmjdedJ
 /RVkWojlaNHhXpFWGjjTad3wngUObOq0qr+feg1Z38XKx9pL7MTjiOGbMQ4LynmyZLZIChx6uzqwJ2yQDD1dUSUQsrIiadj4Bn6HAcij2ON8z6/qBB2wXg0p
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Mar 21 05:00:10 CET 2020
media-tree git hash:	af72bc8cd6ab32be2105129f05eb4502f45577df
media_build git hash:	5e1b2e9e12ffa812f69a15a56786f3e41277bfba
v4l-utils git hash:	fa0e9cde7e847601b550868e535965ea058b68ab
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: d2e7fbcfb9978b0d30f96056c21718f3dbd96598
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
linux-5.6-rc1-i686: OK
linux-5.6-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
virtme-32: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
