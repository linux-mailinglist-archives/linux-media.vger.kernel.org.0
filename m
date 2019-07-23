Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 576177104C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 06:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbfGWEDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 00:03:19 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:35423 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725862AbfGWEDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 00:03:19 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:3444:3aa3:41f9:652])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pm1Ehd4OxuEBxpm1Fhm28K; Tue, 23 Jul 2019 06:03:17 +0200
Message-ID: <d56d983deb24b7066402036193824394@smtp-cloud9.xs4all.net>
Date:   Tue, 23 Jul 2019 06:03:16 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfC7x/r2QwlM0xWBA2Zwy4RdbybhRqKW3v8iVwUthl47rZyay7OIZ+PGYlT19snMjKLaYUtqtU2P6u/xenbP1hwSYNOGD52ZPSCMiTYlkxI6syJ/rK2Vi
 bQpkS0V+0PKpLCBmfH8t+lwJO3WPIvynIm/yXxerylZz2tfK4cgzj+TU4DuKdrPn2MIqbTLn7bfPrgS2mc9oCzry0Rj5NqKQNasI4VkQvzwEehD09BLP+vUq
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jul 23 05:00:13 CEST 2019
media-tree git hash:	66193b24514c91aeda88da744554b2665471aeae
media_build git hash:	c5884d3b03606ebdbf64417fcdfd274cbcc0b4e4
v4l-utils git hash:	6b63111c71eb2837195962d510c510b83c3821f0
edid-decode git hash:	15df4aebf06da579241c58949493b866139d0e2b
gcc version:		i686-linux-gcc (GCC) 8.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.5.1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 2382c744834df83c5de61d43d7ed295f050f0599
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
linux-5.2.1-i686: OK
linux-5.2.1-x86_64: OK
linux-5.3-rc1-i686: WARNINGS
linux-5.3-rc1-x86_64: WARNINGS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2165, Succeeded: 2165, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Logs weren't copied as they are too large (4292 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
