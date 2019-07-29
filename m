Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF038783B3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 05:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfG2Dlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jul 2019 23:41:50 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:33725 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbfG2Dlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jul 2019 23:41:50 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:e485:2aba:cb7a:ed84])
        by smtp-cloud9.xs4all.net with ESMTPA
        id rwXihccAxAffArwXjhfVqU; Mon, 29 Jul 2019 05:41:48 +0200
Message-ID: <a2b34e2b8f7afb0154091402c7bd1fd5@smtp-cloud9.xs4all.net>
Date:   Mon, 29 Jul 2019 05:41:46 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfICzLFzX71BJ3h5lUX/VN4AZXj0FMDQxeJ8kqiJU25nzc61LHqaglETk6mDs8H3uUHJVW46ISmIICglEF9U7qAcKN3+K/zHBh4+lFAl9cHA8zq9/Ce7U
 I9f9ZbkL2yqiL+CTNFxlM7zNOjnPOprqwPq5jlM1mWzCObyTsvpCkGPvAxre5zLdEThPDTeQuHGnWm9TuAtNQa1zTo2QmQwZbdC1nc4x4nsfO0L4MDCP8CH+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Jul 29 05:00:15 CEST 2019
media-tree git hash:	a8f910ec66583bfb61558c3f333195b3960d832d
media_build git hash:	5158c420e7a0929fa58c56ac437e274e8b1c37d1
v4l-utils git hash:	f17d23f7a1fb0735f1d07d984ee9ab10e544efa5
edid-decode git hash:	42f5fa4ed99b669da4b4169a42eca7dbf5a293c7
gcc version:		i686-linux-gcc (GCC) 8.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.5.1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 67d626b059f807573d76221f4d2e8113e6c4339a
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
linux-3.15.10-i686: ERRORS
linux-3.15.10-x86_64: OK
linux-3.16.63-i686: ERRORS
linux-3.16.63-x86_64: OK
linux-3.17.8-i686: ERRORS
linux-3.17.8-x86_64: OK
linux-3.18.136-i686: ERRORS
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
linux-5.3-rc1-i686: OK
linux-5.3-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
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
