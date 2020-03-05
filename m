Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06E4179E9A
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 05:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgCEE3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 23:29:23 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34243 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725844AbgCEE3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 23:29:23 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:7c2d:3b2e:4be4:20a2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9i8NjuwKTEE3q9i8Oj7Iy7; Thu, 05 Mar 2020 05:29:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583382561; bh=7lpOecpNBbz2HwJmWj2H+EnCy75NG1QfpUeIEuKldUU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=prw+pp95KmC6ewHGS8LTWUqs3f5XEqYDbFNGGuGzjEEcLb6QB9qhcvdaXpMdgLf4y
         tJe81pqpDSHdOa9phdHljUoLSFVJCZ3kXCccRjYTfpKalBNQEZiiGmybH55LKJXskU
         IMc9YADhxWa2XCdP3gOiRq2jnrKN1s33feEEthK0it3g8svazKRqE4j0m+cm4IUWCU
         uw291r/Ct7/0LUM2gxaB4c5ipnXcKwQ2BSM4HygVeEVBmAVjZeM8RwMkfedsCMdQeL
         NSKg+U+cVy9zyLQK/MAaJWIIeY1XkN6tslOEGn+pqGZ3TmDCEEtTyyTM/jKPasKCHy
         f8loQRDsIPHwQ==
Message-ID: <9744155992631be32f0d01584fe72ae0@smtp-cloud7.xs4all.net>
Date:   Thu, 05 Mar 2020 05:29:19 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfL3KORVDPG+QTbeM8e6nKr9JKq10RNV2SvQriE065NbgCzSCbwWRMl+TRVq7Ov43b1X9QGlRhfwYNhIV59m4au/sYH97Xhgh0CgFCvZ9DLCImlhISZXs
 MG+xgjn5HhRVtOv9ZOjPzAGX10yqVMStqLJ8s7IN0eL+FlZoFu4HKxaYXTdL/lAbdYeNFXvoDnb+f7NVnrylB+pOuhPQJ5c+IeolGBzJjEe6A7gVAVdBE4Wl
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Mar  5 05:00:08 CET 2020
media-tree git hash:	8bc8c9ba03c4d4966c2503e189801fbc9130b747
media_build git hash:	680a07be51069bee47a07a4bcf36c5176f1290a4
v4l-utils git hash:	411915c09c56f1346b5f2f4f522c92637c56996b
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a415366fdbce7553a6a46799ed0d2f8fb5fffcd9
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
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
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
