Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146F12D848C
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 05:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438315AbgLLElq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 23:41:46 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42181 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438306AbgLLElR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 23:41:17 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nwhqk9KDx6PzInwhrkXRNC; Sat, 12 Dec 2020 05:40:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607748032; bh=vHdRvvwpf5EAwjJWQ/Rk7DpATZ8odhavv97NfYeIt6I=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=GgLWYUvPUv+fdhYLxHbZosl8nDAsHUjJQF2CSJNflncomxURqWFWVpPpvnss/vrby
         2gllwl+ml0PEoIu6JlnV1PeqsjMuZjhIOmS7RfUfEx7T2QGHSlHPO5yOFzwWS/5ZRK
         KGEBdvEVCU1ZVzR7jFhnyxGfZfHFYTuyCVSAZtIKejvYPZTv0czJe9lwdcghcaMXDf
         yYacQDNGIuqrRIdCJWmvHyAOAmeqvRwECWeJ5hWOgGvLmxXOvi4VoXpxyMqfYue9nR
         VzDZ2RfO0D4R6PGPlS+aipk2LQ6TYfnceKEwg2s37M9zDX24JDQTX9qi1/o28h6aps
         Tj9YPxptqqixQ==
Message-ID: <9c2ca2488b6003141c9f1724ba0dd663@smtp-cloud9.xs4all.net>
Date:   Sat, 12 Dec 2020 05:40:30 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfO29DsHcW31tLZKb4mcvFFzj4t8zHHQMU6RdL1tMZmfdHlgZFxC0Y44NIbHQrTK70F6Qw9WiBreiaxLbaHF8IsoR9t692A1XuaadvDZWpp0aJrmFM/JH
 xffy1lZEgGzozHLnkmYWkmz8hx+lHvXz0WIgPbboEUo4y8k2LUAxObpmuwHysM2CVS0NaQJu/d68zRrrXf/s0r8TF9kt9E/2CFtmXfxO9e+Ol6R7ZexDLkL7
 wKAWJSBsydJzXavJ+qnECA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Dec 12 05:00:10 CET 2020
media-tree git hash:	7ea4d23293300ca2f225595849a4fe444fb80ea4
media_build git hash:	174c4cc0037aed1f719b91dfc9e9cc09d53de87c
v4l-utils git hash:	e0e4114f971407acfdf1e8173c86e2e08fa01077
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7041-g6193b3b71
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 77c8542b1c2caa2a7e96c4dad0335336b522c616
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-arm-davinci: OK
linux-git-sh: OK
linux-git-arm-at91: OK
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
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: WARNINGS
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: WARNINGS
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: WARNINGS
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
linux-4.20.17-i686: WARNINGS
linux-4.20.17-x86_64: WARNINGS
linux-5.0.21-i686: WARNINGS
linux-5.0.21-x86_64: WARNINGS
linux-5.1.21-i686: WARNINGS
linux-5.1.21-x86_64: WARNINGS
linux-5.2.21-i686: WARNINGS
linux-5.2.21-x86_64: WARNINGS
linux-5.3.18-i686: WARNINGS
linux-5.3.18-x86_64: WARNINGS
linux-5.4.69-i686: OK
linux-5.4.69-x86_64: OK
linux-5.5.19-i686: WARNINGS
linux-5.5.19-x86_64: WARNINGS
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.13-i686: OK
linux-5.8.13-x86_64: OK
linux-5.9.1-i686: OK
linux-5.9.1-x86_64: OK
linux-5.10-rc1-i686: OK
linux-5.10-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 2
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 3
sparse: ERRORS
smatch: ERRORS

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
