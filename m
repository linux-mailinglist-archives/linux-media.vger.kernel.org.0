Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C56C194FFA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 05:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgC0ESL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 00:18:11 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:32803 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbgC0ESK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 00:18:10 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:b108:5f4d:7b2b:f9d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HgRbjXWTdLu1fHgRcj5FAG; Fri, 27 Mar 2020 05:18:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585282688; bh=xiUwVxJXcq4d4bOhu9ykdBjIU1Sr6U+9MnVUcX/2p3c=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=drXZJoHeKiz7DTjAouPR01fi66n9WIm9GaoFJaeV44UibN/OnSI1WSJEM9bVMHTGG
         k87nxymuKG6HoYQQg0tF82O0FtNI4HCn3Z0oyjlNMj8z13JpDhKSGAZo2B626R0Jdo
         RaUTg34zYkarJfe7SYJcYXZ+XUf+9e+Rp+XSLdEW8iLbM8BgrWuZhddmJsEPT7zdcf
         LePbdWjQm5NzvkZHMnNpVJ35uddSkXbUsBc1c9VZCK/9XcN4845Wd7WWevKwcp3TJn
         3MSonOxcmp6bhPRN/NyGmaXoV6NaasGilBDyO+XzdlS7jIW+mMex16pquJUE2M0DRM
         nlV6M92w5cIyQ==
Message-ID: <1c9e04b3ab24bcd0a76bd2caa6409800@smtp-cloud7.xs4all.net>
Date:   Fri, 27 Mar 2020 05:18:07 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfO+deNrDuJja+iV2E2tIN0Tnvjd0Ohndu/666ilNZ3YXrg0AB53ntZ/dLggcWY3f9nDaeZZ3PkGu4DZZqJ+r87TNvrtqlgo9EkqjlsW+wI1IuThcMLaX
 h12vxLX16BCvKz4EoXENMVVg6UQezEU9uwceHS6dyNhbs9Uei/bDkVvRPZc9niOE3Z332KcXv6KIR3/kHts5z0YJCRCQu4xoqZUeqEnJCuSL9WZsWO95mPZO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Mar 27 05:00:08 CET 2020
media-tree git hash:	ad71693f41aa60217eaf1c29afb49b3aa0a2db5d
media_build git hash:	5e1b2e9e12ffa812f69a15a56786f3e41277bfba
v4l-utils git hash:	81e45d957c4db39397f893100b3d2729ef39b052
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: bce6094eab68fd9c0d5763c4d9e242d8d3732492
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm64: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
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
virtme: OK: Final Summary: 372, Succeeded: 372, Failed: 0, Warnings: 0
virtme-32: ERRORS
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
