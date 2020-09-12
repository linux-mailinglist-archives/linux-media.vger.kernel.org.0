Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60683267794
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 05:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgILDoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 23:44:07 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:33135 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbgILDoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 23:44:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GwSIkk87nTSPzGwSJkvUfo; Sat, 12 Sep 2020 05:44:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599882243; bh=zcta02kphC2cIaYACFYffkSiVijtCqzoR4JcFdk8tZg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=XF4zO3+CyrymH5gydexN/l03O582gFKz+Yr9qmEuhkcb/D2MUhWqzxMEuAzdjOuOy
         5fjnWZ4CU6UhdiACl6fRAIfgvuvCisdGZEziAOA+ZcUV6MikIJIE7FmycdCRwtI5XV
         7Phwqvoia+sYSH2K4TPfMp7zRBvfAposz+u6o9RdHdY03lyOH5l6YG4XaWvrp7uTHJ
         6QSmRqkOXrihy3MzqGjU0j0TDKTv7rGKcp7bIwrgkoaqi9l+NLbU9t7nzFOWmMym65
         ygyDcqTsHXlOCbjDx15da9e6KmsgQAiam8JvHroClpgNZsAtdVp0oTvs4UM2xyG4zj
         ioIqWdLA7R+ig==
Message-ID: <d77c463a90c3cd184a7f8a2ea0636c71@smtp-cloud7.xs4all.net>
Date:   Sat, 12 Sep 2020 05:44:02 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfB+wJcPSNIjPraWd6/hz3LDy/RVlKOpsh6pSR09m0+nW2kEl2SHJO1v4rwyNDmEmEWet2rt/rEda4xklt51a20rVJpa0FRnof9C29i+QGFLsLr9NkKEe
 iNHtPd5+SdltjnWeFg/4+XmwVV2A+ORaMDFAPrlszDf4cAvL7M2U+Zt4muJEw4STayiaeywydh4I05N8vDsqiAXIFdMCI1tJ8pu4fCBkH2J2hpBCl07LteeW
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Sep 12 05:00:12 CEST 2020
media-tree git hash:	93c16fabdb74a9c1a427402fc1fe588a45130c5b
media_build git hash:	8c6e4499abb8050121dd6afbdc6dfcc546644a99
v4l-utils git hash:	c3bff22b2cdd9027a28421553d8a19a9df37ebaf
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: de6d6159fd08a7f648f619e6bdfb2b2d6aabb555
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA VIDEO_TEGRA_TPG
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
linux-5.3.1-i686: OK
linux-5.3.1-x86_64: OK
linux-5.4.17-i686: OK
linux-5.4.17-x86_64: OK
linux-5.5.1-i686: OK
linux-5.5.1-x86_64: OK
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
linux-5.7.2-i686: OK
linux-5.7.2-x86_64: OK
linux-5.8.1-i686: OK
linux-5.8.1-x86_64: OK
linux-5.9-rc1-i686: OK
linux-5.9-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 2
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
