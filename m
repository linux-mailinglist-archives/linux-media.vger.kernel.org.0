Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64153989F2
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 05:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729135AbfHVDrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 23:47:51 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60437 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727894AbfHVDrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 23:47:51 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:25e9:64d9:8b5c:977a])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 0e4hiXE53zaKO0e4ii1Yq8; Thu, 22 Aug 2019 05:47:49 +0200
Message-ID: <b77f65cae3cd2c4810a78e4595abce4a@smtp-cloud9.xs4all.net>
Date:   Thu, 22 Aug 2019 05:47:47 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfGH5gTTRZ69zEvVOP/YQkS7cDqrz+YZviJ1VdEGJVY7XSKO2OquuXKWr0RTjfQn7ct1XyE2eV1bCH31K4/9JxlhGH3OhwhoDL11yQLAVx2WiCjZ4ANWK
 2r+pXt3FjYGzrzHN/UtZm9M2kZ0iJOj4zxR0PzszxIRrGioL3p/V8/ys6TZi9F41WvJJCEdcuUY8li14wvcnUIVHuu6NxTRYH3gk/mtr9OIVGKlcrfUHZMi/
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Aug 22 05:00:10 CEST 2019
media-tree git hash:	01faced6f65d0224bf6ce1262a4137771e28519f
media_build git hash:	301385c12da9b80ecb9c127d4a7ca9d4bc8ba781
v4l-utils git hash:	2350a23b92ff94967e20c09687b4c5692e989cf7
edid-decode git hash:	0932deee88928f110b5a74851c173ad895f75863
gcc version:		i686-linux-gcc (GCC) 8.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.5.1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e9d091e930792735d129a821a09b7c85311d055f
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
linux-3.16.63-i686: ERRORS
linux-3.16.63-x86_64: ERRORS
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
linux-4.4.167-i686: ERRORS
linux-4.4.167-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
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
linux-5.2.1-i686: OK
linux-5.2.1-x86_64: OK
linux-5.3-rc1-i686: OK
linux-5.3-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2327, Succeeded: 2327, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
