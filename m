Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7E5C17CBEA
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 05:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgCGE3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 23:29:24 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42987 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726674AbgCGE3Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 23:29:24 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AR5VjvjP09Im2AR5WjIG4n; Sat, 07 Mar 2020 05:29:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583555362; bh=AUIq4+vJU9OtuD52Ti35t6ZOR+4EHOioJY+gcokkNKA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=HY190ZGCGb0e0hDSBQ/xd/Rnn9EwHfIOBjGGP+b6KG6CLrXw+xKHph2KF8cCif15k
         86L2X7qnBlrnQk1aWU6CD/5TDsUEPjRbFwyP/5UV8bwVAqCx8izKnV1YeqD27FkYor
         6uEt9N+Z9krVOAH2dTybhpbQIwl1uZyiUqUJJugfahTETgU9AxbxsREbE6roITHb1L
         nQZ2xvFClAh3gRUty3VFcE6r/+96uoJ2pOPUHfZEePTXk+P05EKjFiEIEfF8RSMu0C
         JKBo0vWz9YXZ15r6VpZTBrUOwKZ/dxqdqf2uhgpGBWNHHvL90yEHO68h8YycDq4Uxy
         CIG/uPcyQ/srg==
Message-ID: <9d5a60ce1bad81f754f12d6be0d4e895@smtp-cloud9.xs4all.net>
Date:   Sat, 07 Mar 2020 05:29:20 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfI1UpJW/gJkRBd8SVCj2b6FJ64K1J6HJNN53rrx5DdnqMVKqFX3Lx1P5kU5YEtye5yrexSvZeKrH6JWuTLUNs9d/gJ4cr6onPVlFYqqCVt3LZkwB6vJZ
 ipXhDCWgpPKbRG83UjwXauKAFV5OBza7sXZmQGUhBN6Ad6l/7t1eV2T2ZavtGPrrzHjcqnqh5i5rI+u2nCl69rXGPBWlWyWOnUqNLtlOFVvGwYHPcSYoTwO7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Mar  7 05:00:09 CET 2020
media-tree git hash:	00c43088aa680989407b6afbda295f67b3f123f1
media_build git hash:	6c715bb60eb5f601ae3fe59a5ec772300a5ddb2a
v4l-utils git hash:	411915c09c56f1346b5f2f4f522c92637c56996b
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e32048c973b190b4fd04e7c9ccc025b2b6c30a63
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
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
sparse: OK
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
