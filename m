Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F4F3BA6F4
	for <lists+linux-media@lfdr.de>; Sat,  3 Jul 2021 05:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhGCDwD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 23:52:03 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43223 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230051AbhGCDwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Jul 2021 23:52:02 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id zWeklDIkMhqx9zWemlCOYr; Sat, 03 Jul 2021 05:49:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1625284168; bh=l392whzbGhYTFQ+xIC9zidZRdSY2UkYKAjsDIJuSVYs=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=TS65ck78hgxvCaTJQ+F8OR54J1SK/gKW8Dud0hpGyKaLf7AFr1fK0OJQuMxEa1nFA
         GHL5mUY75/qKn2CKwKPjNgqE/ShLIriwgvLehzRQXzm49YC7HHyWzRGJclaJHsbpVb
         oi8HopKTqYiYHCme+2dQRurM67lDNJrlsmIrqiES05HxnKu/Xi9QpecMV3wc9mpqSo
         YWxVYU1BMJMytb+FwCJHW26u8J54PIuX/P3Jt1QzQgbofP73BjrF7026FKfKAlJvbo
         RyD+0bMBwpcEShRwuaNBVCOPThF0TlfozRJsnXgvZUOfQaV8u6hsQDtrv6EOLbop9I
         xuiKPVWsIDY9Q==
Message-ID: <2b5742a4d65c213a802ae75d490e640e@smtp-cloud9.xs4all.net>
Date:   Sat, 03 Jul 2021 05:49:26 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfHmxTa8o3futgbjam4KuSMgr2SE6YpHz2x/ODlP034NQrCBFsmPmUZqYh/uT5b+S0X4Hmvmncygf+nibUYVbvo8Sruhz90fdZ0/plweQ6hnmwQlQnuFZ
 fxnQuMg3zW0U6Jr7i3e74ynTxYoovkUxN4pPU4ZSTbk/zWCuQb1+UMk1U/nyoECn0Zd2+PvXl2uIMz/S3HUDvW0ZQFhZPY0GIGgbHuDL5ZZFGq2PZmdnz9Kz
 EWTtHwJksexlbzjYP0kCWQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jul  3 05:00:15 CEST 2021
media-tree git hash:	50e7a31d30e8221632675abed3be306382324ca2
media_build git hash:	dc90f6c653a467465b5deb23d3310577f8ebf218
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7481-g7f50411af
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 328d8f6242d952437e8dfc96047fda207fad8deb
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.258-i686: OK
linux-4.4.258-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.258-i686: OK
linux-4.9.258-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.222-i686: OK
linux-4.14.222-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.177-i686: OK
linux-4.19.177-x86_64: OK
linux-4.20.17-i686: OK
linux-4.20.17-x86_64: OK
linux-5.0.21-i686: OK
linux-5.0.21-x86_64: OK
linux-5.1.21-i686: OK
linux-5.1.21-x86_64: OK
linux-5.2.21-i686: OK
linux-5.2.21-x86_64: OK
linux-5.3.18-i686: OK
linux-5.3.18-x86_64: OK
linux-5.4.100-i686: OK
linux-5.4.100-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.13-i686: OK
linux-5.8.13-x86_64: OK
linux-5.9.1-i686: OK
linux-5.9.1-x86_64: OK
linux-5.10.18-i686: OK
linux-5.10.18-x86_64: OK
linux-5.11.1-i686: OK
linux-5.11.1-x86_64: OK
linux-5.12.1-i686: OK
linux-5.12.1-x86_64: OK
linux-5.13-rc1-i686: OK
linux-5.13-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 1
virtme-32: WARNINGS: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 5
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
