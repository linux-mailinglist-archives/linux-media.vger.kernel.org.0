Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04D751752C8
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCBEpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:45:02 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:51763 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726811AbgCBEpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Mar 2020 23:45:01 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:9ee:be12:9325:898a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8cwsjZ9NGEE3q8cwtjrsUn; Mon, 02 Mar 2020 05:44:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583124299; bh=JPz94A4SrZ/JmUp9phEoIEeoPJp4N+iizdbmzc0CrQ8=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=soj1sjYrkOlyJBNqoOVwKaKv0rCdPmN/EmmCqApNHl0zZt+oJIl1oW+GkR/MmyfzS
         2wD+VQNaQaJmR8FZSnGqhgVDKMhUjmCLqnbJ9bGmXQdJlQg9s2CmVUMH9M1+GMm2Ki
         YDOM3MxTSbxLhfrkUjG+iXWmasvAh/79O044XqfHA1R3IZZ9iVzYtb2XyKM9z/vkqy
         zyrDleGsBjSGJIVR9+SDLKSEYRFekIO/mdWd8WUVhPZRsZOkgUaMIOnwcnAG78h4MM
         CoyXvsLgD7NvfmZOsPHIzFcCElRjyHDGQsEjWpwqEfbFXodyFnDG9TpuZq1CVDNSfe
         qsG73L7GolYHQ==
Message-ID: <8c3538dc1d6a9ab74de9132a5c3d121a@smtp-cloud7.xs4all.net>
Date:   Mon, 02 Mar 2020 05:44:58 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfJpbP2k5c35x8AIh9t2vONUxEISNHvstdhPGXhrGlPbj2aYVx/pTHO33konaxRMf2tfa1bIZn+9MYWWRj0+lHvmMpdqMLlDhxUuZON4yopYvnJxQUoUd
 NfURllytGXMmS8/KcPS7b0bhvcA+M+jpbaWuVexMStJ1dcoclRJE+sfTcwoRNJI7MzNvAnvSDTZg970QUR3/zmmAoUBQgbsq0oOjH1uvqzJNj5QRtdh/OvVd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Mar  2 05:00:16 CET 2020
media-tree git hash:	bd59f412d17f81a41e35c884d3caacf34c9e4940
media_build git hash:	e3e7c2632a298bb886608a95da5ec40bdb54fd92
v4l-utils git hash:	4e555017a19834db66d4772f62c5b382fb374dea
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3fc59a2ca2e30c46ffc01ef267e1098f330678c7
host hardware:		x86_64
host os:		5.4.0-4-amd64

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
linux-3.16.81-i686: ERRORS
linux-3.16.81-x86_64: ERRORS
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
linux-4.4.212-i686: ERRORS
linux-4.4.212-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.212-i686: ERRORS
linux-4.9.212-x86_64: ERRORS
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

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
