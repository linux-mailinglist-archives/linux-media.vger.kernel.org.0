Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1127C22167
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 05:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbfERDrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 23:47:11 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47651 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726761AbfERDrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 23:47:11 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:68b0:6185:2b9d:33a5])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RqJOhWX7j3qlsRqJPhVILE; Sat, 18 May 2019 05:47:09 +0200
Message-ID: <ee342fd2503efbc6dd9066c136d59621@smtp-cloud7.xs4all.net>
Date:   Sat, 18 May 2019 05:47:06 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfESl2R5LbY1jGDvs/GzxzJF/cu1BLKPdZtNQvZkLZFh6iW5c8y4lGOjW0thmCSLwjAgWvbARVSSTZSiuykbSkobMnYx1HLhAvmrymt0GCA91LIgc2UbQ
 Be0cIXsjzdExS7kDqrI1ymFSY0yX3ubjvfZRctC6I7092XO+lU9FOpfm/T3Dw8IeuRmhO7KbY1s7HCLAh4XA7Z3ItVWGYpVvdmcr0KhpzEIzCEUGNQF7UhWl
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat May 18 05:00:10 CEST 2019
media-tree git hash:	fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
media_build git hash:	78eccfa404ec982e1302930cb7f45756ab404a3c
v4l-utils git hash:	5cd5b668d79134976c9a9d816bddf9412c22de7a
edid-decode git hash:	dc763d7b1a95a74c6d109a03e34ba45315212195
gcc version:		i686-linux-gcc (GCC) 8.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.5.1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 15fd9fb1f474e4e289e8756ebaeab108ad21742a
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
linux-5.0.15-i686: OK
linux-5.0.15-x86_64: OK
linux-5.1.1-i686: OK
linux-5.1.1-x86_64: OK
apps: OK
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
