Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49437EF3D
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 05:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbfD3DsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 23:48:11 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60529 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729933AbfD3DsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 23:48:10 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:959f:feab:ac12:aa61])
        by smtp-cloud7.xs4all.net with ESMTPA
        id LJkVhyhuYZVjxLJkWhvovw; Tue, 30 Apr 2019 05:48:08 +0200
Message-ID: <6681f5be841b1656fb0f4b2e244462fb@smtp-cloud7.xs4all.net>
Date:   Tue, 30 Apr 2019 05:48:07 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfPcKNNXFnz+xJS10a7Tv7SAGIQKUsnK10AXChTz6M6ntWG9HyA8KrchxOXdfLpQzQvAwPpY4w22M6A9hCkHUu0EIVEikHvksCRsc8ssmOMqBWpSPcb9V
 zRXbxlQnQ8EJx1/fon2xmwHs4MOma/iDf6n/P5Rz4GoP2kx6zRTPQPnNVPrBpVrpNlJeEq8PSB3mJ9BenvE+a0l8K2PFvL0WYSG6xsWUTvKhJDMOuiaVQCP0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Apr 30 05:00:18 CEST 2019
media-tree git hash:	7afa8db323e37b9174cf78a1c9ab0ae7a9f5e7dd
media_build git hash:	78eccfa404ec982e1302930cb7f45756ab404a3c
v4l-utils git hash:	851fc5c8a1543e19bd777e3588269a60b94b924f
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

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
