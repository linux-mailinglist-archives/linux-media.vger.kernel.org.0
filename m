Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654B23DC982
	for <lists+linux-media@lfdr.de>; Sun,  1 Aug 2021 05:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhHADpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Jul 2021 23:45:51 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56771 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229761AbhHADpu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Jul 2021 23:45:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id A2Q0mNUCzW9QyA2Q1mGp7p; Sun, 01 Aug 2021 05:45:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627789542; bh=D18KuHKzSUdpwYHzZiZsw09KMvYtZntTuJ01hmbqiOA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=gvjqSr9qnkUj4sJGepkeA+uEWspCHAjQSbvSEQJgneEsPFzrWhXHXa0MBMVL6p/Ap
         jx461tyFcuIVb2fKSJZVtuIl4tgi+mhYiXGstrdAEcWNPc3hULz3EalOz9SJSGf49i
         uyP1VspP9hJbFssuKh+0rP6aC/SLc4vsXAVNpxHXsa6PdpEnyorPGGWv+biLAv2GC1
         geJzSP4KlWxnYKMKPqlFcwDhIYTwcrNn+yIpUYm9r6kLvLBn+xhm8SJABD7REnzEHC
         XNyIBymaWQsp744uQVUIYtQxw/509SxHx9ku3JAY1/RJ7L0NQgNIYHJwK6DPWqnaVp
         XRhmRINFwGRSA==
Message-ID: <3f188ffca792ee069c129e6e0a14ea1e@smtp-cloud7.xs4all.net>
Date:   Sun, 01 Aug 2021 05:45:40 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfJanQMotXa9Y5Q/be5xt3G+aUrDIGyMmHf/BRvZTSlGl2HZAfArSpmIaECs2/jpGKIzhWPCMkr/R34LCDKSp1dZpLB+lQjcJHUw7kS5WbWuvElkyt+DM
 eOfnHO/a+QOa9qDRjFPlSeEtbHmBmg1kxxj8HEPRgm6FpShRIDgrkUC2/OyC8A2Qzcsh3FKuW8Q+xgLLFn+Ic3ee8b6vhT6C3XIHYT+h31RS5xKnw8enZHod
 nKB1Bd0O58YZ6Jh4Ti/I7w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Aug  1 05:00:13 CEST 2021
media-tree git hash:	c27479d762de4eda72ba9e0aa150d439970f2077
media_build git hash:	bdc3294781a89c69fc05acefd95842b88ffcb4b9
v4l-utils git hash:	c86aab9cc7f1f001502c70a5e342f7816de3a3d6
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
linux-git-arm-pxa: OK
linux-git-mips: OK
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
virtme: ERRORS
virtme-32: ERRORS
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
