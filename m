Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6987E357AD7
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 05:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhDHDkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 23:40:19 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:60353 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229680AbhDHDkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 23:40:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ULWRlElrv43ycULWUlRyAz; Thu, 08 Apr 2021 05:40:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617853202; bh=TaYPZHGkOj8JUqOJJf3EQx/BfoiWIms3ke6fkd1mVyQ=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=XPpcw/jKVnVmrVEDny/+rwxmeEoB6ViPaMH7D17LY5MDsW557/5W6Png2kOx8V7ae
         FChZ9EDsjBr6EZL+i6GRlDf62oEUKyFhjTJ1D6pJXNvTTL6fRARs/FdWo0I6ykOALA
         sTgdx6BvCJ9v1KF5x/x+Ekgv13nIvGGvQc8lIJBS5fG6gbRc7JhAfGuRvcYDsUbeCq
         ZDnl3pWVMJoVuMAq01E5u+lsJdV41jAfMmwuWaCJprYQ0fanmf22gH017fYp37sVqr
         Rq7Sg3KFepJeNr5aAaInvlK4xmFxZYlheo2gU2XKBD1DjKU5xBN61U3IYCIHk2PuXs
         qphh/ysbK+jew==
Message-ID: <ae2a5e0331b206f67110d307acfac893@smtp-cloud9.xs4all.net>
Date:   Thu, 08 Apr 2021 05:39:59 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfEymNJUWiPAFu6uUVIhoSApOd26sfmYbKa2pVvIISqMNuCDsxZJlnIYsYIxSzCZH5nveZ3P2QHg7pcdG/kClpD12N4FDGh0uDvv/+U/sqAVcWwH/vbW6
 dM5082CcK1pB+0pqPDxoq9igZGv1siRvl8yQOucVhR6HT6KMTYAQ/NOChB2qmo71rMnA+4C7ETlaEOhACjr/BYEoTh8I0fGqE9woptsE4o7Y6PvODloca0ng
 PhiAbhRa4go7twj4ol7Kcg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Apr  8 05:00:11 CEST 2021
media-tree git hash:	c1c1d437b1f0a84de6b53416026f7ea1ef3df996
media_build git hash:	70188fdddcfedda190f1118529888cd3dc2581d6
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7413-g9bb66fa2d
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3ce9a878c7e648b006568e3fa69a2c4fcd251925
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-x86_64: OK
linux-git-i686: OK
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
linux-5.12-rc1-i686: OK
linux-5.12-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

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
