Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A306117F38
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 05:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfLJEuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 23:50:12 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40259 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726819AbfLJEuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Dec 2019 23:50:12 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:24a2:c16a:c077:2b13])
        by smtp-cloud8.xs4all.net with ESMTPA
        id eXTLib20dTsDeeXTMiUhGu; Tue, 10 Dec 2019 05:50:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575953410; bh=Io2APhuBa1UGK7at0njfdsLgkBewgbbeXHLtUHVcucA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=oLdY48YNPGC4YqRZtRlU7keYWEfUTKo+WXGQ6GP68/xE/QhoxnxdpbhUCKuPSo8AR
         2P8riBhVp4zM08NFEALR3jeSfwTa/BfwUB288RMhzp+zsQjkcTLisUBxzOGnGI1nje
         aDxEdTTI7s+//2MdvVo7+zNWNcTgCZV/AT9xSMnIxO/lEUPziu5vdhO75WFICN+w1I
         y88zd6Wsz05uYngNvYSovG/yfQ3TRNHpcxPcXSBH7DGgiydO8qfqEx4azDq+cTTzCV
         34rxdp5RlW4r0xu/H3X/T3NEJ/5If117n+Tw7c8lyZjTNjzB7XRc+av6knebc6E6Gv
         TeFIgrTCK9m8Q==
Message-ID: <d4052e1733432f37a92079a64b4eee8f@smtp-cloud8.xs4all.net>
Date:   Tue, 10 Dec 2019 05:50:07 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfG0NhWdBGo1GwjnKtBLSdgWdCN1XA8t1ODt7CdIts0JndhZArcV7gx3c2NSiZnfBXTdEyDfXhjP1w+lCqrmQxMB7N3IffTBxaDtFpmOWLKHhZBe1O09P
 Oo/L5lB9VQfSPvn2cwoZP5mwXTv5vDfVTgwDjdNcR3Eka84K4yWjeCfs1jwqtkcVu4mRMALmZpbaOEEN9oEVXtnzMDFOQHISeZ/l1xfFREd9xjm01JIi+rum
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Dec 10 05:00:18 CET 2019
media-tree git hash:	2099ef02c6c024751e4d16ace67dd6b910c875e4
media_build git hash:	efba365ba11b958a6bf6fb4b397942f9461cefca
v4l-utils git hash:	cb0ec2fd537333a62fa0d8e4acded7442851e956
edid-decode git hash:	e719d04077d098eb51d9494f41060eba2419d4bc
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
linux-3.10.108-i686: ERRORS
linux-3.10.108-x86_64: ERRORS
linux-3.11.10-i686: ERRORS
linux-3.11.10-x86_64: ERRORS
linux-3.12.74-i686: ERRORS
linux-3.12.74-x86_64: ERRORS
linux-3.13.11-i686: ERRORS
linux-3.13.11-x86_64: ERRORS
linux-3.14.79-i686: ERRORS
linux-3.14.79-x86_64: ERRORS
linux-3.15.10-i686: ERRORS
linux-3.15.10-x86_64: ERRORS
linux-3.16.63-i686: ERRORS
linux-3.16.63-x86_64: ERRORS
linux-3.17.8-i686: ERRORS
linux-3.17.8-x86_64: ERRORS
linux-3.18.136-i686: ERRORS
linux-3.18.136-x86_64: ERRORS
linux-3.19.8-i686: ERRORS
linux-3.19.8-x86_64: ERRORS
linux-4.0.9-i686: ERRORS
linux-4.0.9-x86_64: ERRORS
linux-4.1.52-i686: ERRORS
linux-4.1.52-x86_64: ERRORS
linux-4.2.8-i686: ERRORS
linux-4.2.8-x86_64: ERRORS
linux-4.3.6-i686: ERRORS
linux-4.3.6-x86_64: ERRORS
linux-4.4.167-i686: ERRORS
linux-4.4.167-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.162-i686: ERRORS
linux-4.9.162-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.105-i686: ERRORS
linux-4.14.105-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.28-i686: ERRORS
linux-4.19.28-x86_64: ERRORS
linux-4.20.15-i686: ERRORS
linux-4.20.15-x86_64: ERRORS
linux-5.0.15-i686: ERRORS
linux-5.0.15-x86_64: ERRORS
linux-5.1.1-i686: ERRORS
linux-5.1.1-x86_64: ERRORS
linux-5.2.1-i686: ERRORS
linux-5.2.1-x86_64: ERRORS
linux-5.3.1-i686: ERRORS
linux-5.3.1-x86_64: ERRORS
linux-5.4.2-i686: ERRORS
linux-5.4.2-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2793, Succeeded: 2793, Failed: 0, Warnings: 2
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
