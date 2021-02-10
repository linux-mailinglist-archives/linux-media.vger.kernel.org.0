Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AE6315E43
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 05:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhBJEkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 23:40:14 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33927 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229690AbhBJEkO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 23:40:14 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9hHmlClRXRVmf9hHnlOF8L; Wed, 10 Feb 2021 05:39:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612931971; bh=fhUCEtCKLmRyKtM4FreDCILtTv9+rEZy2W/iTDmBnZU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=K8D+oWUtISRDWKxbScI3G7kjKtAKZIONFRtt4QwRGKe8VmvvMhtMKz0Z+S6t/If9v
         ilUI97LdyS1LXPqsr6BvlH9uwyqM85VDgMkRWnTZqMBsBN0kXFhByqKXjJRN8JEi3T
         PYCJxLp0pMY0Tj3/fE0AnHtnEPBl8YMH73MmLBzCEhfQ63BTGPEhBMqJw4wjwngx3O
         a6EXrclRXx5KtNwI10Ufnmj1x7rfW4DN8rifYuH89I3Tx0xUmlJLoxLzePay5MRsY5
         /sQsvmlIcpdvEldVoV7lkGGVl3mh2NN+NS3x5tLg9h3QMsCSTyU0jwPipWJj/kpqCZ
         xlDyKRsjK0zjQ==
Message-ID: <1b5828d6f4b15376ea7a58b2b6011ed8@smtp-cloud7.xs4all.net>
Date:   Wed, 10 Feb 2021 05:39:30 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfME6PbtzT+Zygy0dJExeVxVnPVcK97D400G1qTtIFsJwU7Q7mQgAAPZ+K1PkET+a9HZV5298LSS17d7cgqWaTR/bM09nFjas2tWI0cGnUOQD/Mvr5kDN
 sk83IMuJ4LvmWqzrhiUa3oIw3G5bf7wau9AsORw7fZTq7tpztZhFXwx24dnn+I2Zt0Jta31mwL6LCb48tGktpbq71OVlcy4nKee4UbMeS5oV8K4Y/2N+Ko4S
 WQoF3jhmvQiCd1bGdRY40w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Feb 10 05:00:09 CET 2021
media-tree git hash:	7f03d9fefcc55ed4882338126ef1f6b6778ea21f
media_build git hash:	a236fddff61e8357f3070effdf23e9b5f20b26e6
v4l-utils git hash:	733f7a54f79d1e12a8745f0804c8394ed0136eb2
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7349-g7fcfe2595
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e7b822fdb96cb4ba52d3c0c7445d3401649bacd6
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-x86_64: OK
linux-git-i686: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
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
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
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
linux-5.4.69-i686: OK
linux-5.4.69-x86_64: OK
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
linux-5.10.1-i686: OK
linux-5.10.1-x86_64: OK
linux-5.11-rc1-i686: OK
linux-5.11-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
