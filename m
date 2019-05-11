Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFA691A66B
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2019 05:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfEKDqm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 23:46:42 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:34407 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728255AbfEKDqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 23:46:42 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:2dea:e21e:760a:b215])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PIy7hlbazsDWyPIy8heFVS; Sat, 11 May 2019 05:46:40 +0200
Message-ID: <e7a683256e4fb8f8f3d6715217c60df4@smtp-cloud9.xs4all.net>
Date:   Sat, 11 May 2019 05:46:39 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfHzCbLtU92VVmfBf7wmeL3HWeTipvkfFPNgiURgMoTpSmk6jG4KacrKJmFCZIf3e4NAeAq5MsgUtaJzxt1JYI0U64qim1T3nupkVPuNFdUX6hnpxHfwp
 7IDBwl/Zh+A/WxbkYbiVux5v3osxbVcoFwPRDARG9BLgoz5gkTudp1J1d4+wUcsoZzfj9bEJy3PM7aw203GF32E6cQAk5d4BLQpKFMJeNXSAUW2/h+vGiBjT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat May 11 05:00:10 CEST 2019
media-tree git hash:	1199fa8c0ddd34dae6d72b653b27dfb3554e9b57
media_build git hash:	78eccfa404ec982e1302930cb7f45756ab404a3c
v4l-utils git hash:	0d61ddede7d340ffa1c75a2882e30c455ef3d8b8
edid-decode git hash:	dc763d7b1a95a74c6d109a03e34ba45315212195
gcc version:		i686-linux-gcc (GCC) 8.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.5.1
host hardware:		x86_64
host os:		4.19.0-4-amd64

linux-git-arm-at91: ERRORS
linux-git-arm-davinci: ERRORS
linux-git-arm-multi: ERRORS
linux-git-arm-pxa: ERRORS
linux-git-arm-stm32: ERRORS
linux-git-arm64: ERRORS
linux-git-i686: ERRORS
linux-git-mips: ERRORS
linux-git-powerpc64: ERRORS
linux-git-sh: ERRORS
linux-git-x86_64: ERRORS
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
apps: WARNINGS
spec-git: OK
virtme: OK: Final Summary: 1963, Succeeded: 1963, Failed: 0, Warnings: 12
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
