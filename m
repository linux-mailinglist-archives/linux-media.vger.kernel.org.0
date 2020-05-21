Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52ECC1DC5CB
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 05:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgEUDna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 23:43:30 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49873 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728228AbgEUDnV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 23:43:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bc73jg9tKdPgTbc74jOWf5; Thu, 21 May 2020 05:43:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590032598; bh=tvq9txR4S0sIdRRuCd3Cgl+QJQOxbxKs53iPjJcl7f8=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=wOyGBLawE5SYcwe2A+lv8LVvbrx22Kl9ZEb2hQIN7w7UgC4HG1LyHd+ino8OUPzq/
         oIkGCpeMwtQl+76kYXR20BMp2nQtVqzJWwRm/iH6/MWfGKuYdrFn/nc/9IBtNdhaNW
         pVpDJtjaTTO0K+4fchX2DT7lFpqKSU5z0SY/VALJJ9shGNP41Mwc0xGcuuwYRDZkBN
         iePvARVGrRrfXIltOVsxGNLZNfeC9bV1zrs/o7aSnx47PfkOMeb6ir9hSQY5/8+pYM
         CNeZthuxB1xwweXvI7nvDjQOS/4+VL5SaI/J8VYO5+wND9xGNWpgGyUnNxNSp+sOtP
         3PHW/Wm/gyOYw==
Message-ID: <d98d239c5bd873c150c7a93b040ce4cf@smtp-cloud8.xs4all.net>
Date:   Thu, 21 May 2020 05:43:17 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfK6uJKbtPCKnL7F54yhmBDnM/4KG/BvhygSsZrBzAeW7pvc7lncCiVNHFXJEyTRxXzDy6z/U6Sye0Fcj9WLpnEWZWtErAxar8CCoLzyB/Hd9ye5Q9+8U
 dcUyf3BoOu/a/1VCnOFh4yi07ys+HnH6PYC6E9+gPvJSs97f8g9d5gacRiIxiYvO9QLRLlc25v/qZiG5UtPjDT4Vz2Bl9XZHkqinYrHZc4qNY6wPiI92rGl0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu May 21 05:00:10 CEST 2020
media-tree git hash:	960b2dee908b0fc51cf670841de13b40b44aaaae
media_build git hash:	28a109580ca69b3cc1c2f2ae62248e9fe067cb4c
v4l-utils git hash:	131840f30c48b0f63d4a065fca628248d8fc0eda
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0accb575719caa47d8fbc866b11e6f7e7e7787cd
host hardware:		x86_64
host os:		5.6.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: WARNINGS: found 4 strcpy(), 4 strncpy(), 4 strlcpy()
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
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.169-i686: ERRORS
linux-4.14.169-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.101-i686: ERRORS
linux-4.19.101-x86_64: ERRORS
linux-4.20.15-i686: ERRORS
linux-4.20.15-x86_64: ERRORS
linux-5.0.15-i686: ERRORS
linux-5.0.15-x86_64: ERRORS
linux-5.1.1-i686: ERRORS
linux-5.1.1-x86_64: ERRORS
linux-5.2.1-i686: ERRORS
linux-5.2.1-x86_64: ERRORS
linux-5.3.1-i686: ERRORS
linux-5.3.1-x86_64: ERRORS
linux-5.4.17-i686: ERRORS
linux-5.4.17-x86_64: ERRORS
linux-5.5.1-i686: ERRORS
linux-5.5.1-x86_64: ERRORS
linux-5.6.1-i686: ERRORS
linux-5.6.1-x86_64: ERRORS
linux-5.7-rc1-i686: ERRORS
linux-5.7-rc1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 5
virtme-32: ERRORS: Final Summary: 2779, Succeeded: 2778, Failed: 1, Warnings: 1
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
