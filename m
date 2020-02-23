Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3B721695D4
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2020 05:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgBWE5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Feb 2020 23:57:51 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:60573 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727093AbgBWE5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Feb 2020 23:57:51 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:94e:9281:27be:100a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5jKtjlrarjmHT5jKujPbLK; Sun, 23 Feb 2020 05:57:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582433869; bh=JSwJDzJNXEFLgnJRpBxc9Dr5YZPYvM4bY4QVvE7aXnQ=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=hGOr8D1+AH+llLGuwmmspTnq6euRfEE5cxCyXm14qFF73j6QdVZQ8aEabdTFThUaF
         BDu/AqtoKu3sBAGzvIQrzSTLxJ+yN+N+pQYnf3ViVsX/oi7wemYQOS2/SKjiHWdK6N
         oOARyC/OroP2euo01KO+4BU4kN5j/4aGtO35itfRq2aqE3WHyLhyHBcIsTMdqaKjj2
         EXeCu9nbu1O3gC+rkB+qZULXfV6waMz+fIvNWDeWSLHK5nG57wLkr6k7OFDcvBeaF1
         Dxt4iNliaPcwOJTj53KSNJTTqjyBdmIKqyxoWX26/Ay/BRvdDkDPw4v7xK5OwlGCvN
         39ezx7Sq95wPQ==
Message-ID: <b054854d3960df0b35296608702a14a2@smtp-cloud7.xs4all.net>
Date:   Sun, 23 Feb 2020 05:57:47 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfB/XoTzdCO+E4+0yVN/13/KR56vm8Glsb7FMJEk4bAGYMhS4mSyJZtGJ5aGd4+JCN3+0GamglOiaeiB0KBpIi3Si8W1TR348CtqStQw8YfbGM2I6VCe5
 wmSgxhX0MJkj+OJLG71XHl0hI2Nfn9abG/TKiWGlhOPe/5ndMOrSXtrsplBTxf+xQ8ww29Qfn/YScJf5tEsKee6dkm5/PKDapnGdp1llwq57M40zbHnYO+Iz
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Feb 23 05:00:12 CET 2020
media-tree git hash:	bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
media_build git hash:	c19c9d0d270d64a158c41764125deef059b7acbc
v4l-utils git hash:	e8dca9e7be75ff4433425108237922dc4b7d8f4d
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0a0399d66d361fec135a2dc184bd8d12148f35ad
host hardware:		x86_64
host os:		5.4.0-3-amd64

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
virtme: ERRORS: Final Summary: 2943, Succeeded: 2939, Failed: 4, Warnings: 12
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
