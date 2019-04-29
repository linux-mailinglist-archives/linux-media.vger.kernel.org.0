Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04B96DADD
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 05:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbfD2DsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Apr 2019 23:48:01 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35271 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726758AbfD2DsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Apr 2019 23:48:01 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:3ded:7004:9348:7420])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KxGohG5K3b8gSKxGph5QVP; Mon, 29 Apr 2019 05:47:59 +0200
Message-ID: <5ed5c0cd08b585456d9edd10240c255f@smtp-cloud8.xs4all.net>
Date:   Mon, 29 Apr 2019 05:47:58 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfPHrnO1WMPHCgK1pO6acsesSS652iEL8RHzyNfHBKdNfUrtzOvBBrY79a+q95uYQSHlaOX9wAjn4DfU9mRN1F0sB8IkKX39FlMeGAHPZ/wytv4RT4rBJ
 kYHnvp3OCwZMsWSbCKm7PlULMu3qXMex4MIevkUF766OAuWZStjHpJqdEnJ5RmuEykJ+pXmJwg89niOP2q1aZA/jM4BrmGRCoSYveCpBPKB0uTeya1Zu8OGj
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Apr 29 05:00:10 CEST 2019
media-tree git hash:	7afa8db323e37b9174cf78a1c9ab0ae7a9f5e7dd
media_build git hash:	78eccfa404ec982e1302930cb7f45756ab404a3c
v4l-utils git hash:	5fc75842ff3f948cc90d96e0c22a4128f21f66df
edid-decode git hash:	dc763d7b1a95a74c6d109a03e34ba45315212195
gcc version:		i686-linux-gcc (GCC) 8.3.0
sparse repo:                   https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:                   https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.5.1
host hardware:		x86_64
host os:		4.19.0-4-amd64

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
linux-git-x86_64: WARNINGS
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
linux-3.16.63-i686: OK
linux-3.16.63-x86_64: OK
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
linux-4.4.167-i686: OK
linux-4.4.167-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.162-i686: OK
linux-4.9.162-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.105-i686: OK
linux-4.14.105-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.28-i686: OK
linux-4.19.28-x86_64: OK
linux-4.20.15-i686: OK
linux-4.20.15-x86_64: OK
linux-5.0.1-i686: OK
linux-5.0.1-x86_64: OK
linux-5.1-rc1-i686: OK
linux-5.1-rc1-x86_64: WARNINGS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 1963, Succeeded: 1963, Failed: 0, Warnings: 12
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
