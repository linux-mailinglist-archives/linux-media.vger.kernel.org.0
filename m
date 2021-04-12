Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC60135B8FB
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 05:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236250AbhDLDkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 23:40:36 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50371 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235386AbhDLDkT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 23:40:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VnQVlrBrHgIC3VnQXlGUYS; Mon, 12 Apr 2021 05:39:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618198793; bh=2Gp6T3HAG7QuWUEgFLAO8j5tjfDsrGXuBA068AxumIs=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Afjt4D6hb+JG0ojD1bmtcUypWO7vS/THOrZyn05arMsUHJk4oAVvS4GCgG9a/hsYb
         CygvtBPW/4D3oI+MKPdOZq1Qjik4/OyM/B8pPmhsrqsiBoHRldb5NitCOMDmT8PPdl
         eCaC0I8oGdpJgeobDCXo4zhL38sKwbF3qE7J+XfPHNKmpjPupUQqK01AbV47LJM8FO
         0j3k1OAmuhPWwEkYlTWT1JjiZOow05IjeZ1Bq1GvbLbzSSbAeXDwfZUNe514RjrM46
         ZdtvuBZp4x6BjVirqwL3e84e2ErjWyZJX4IqvFSQTSlKYV7CscWRnwHtFIDUtjzNqI
         qYAWC2uvlovfw==
Message-ID: <1d54800691335992f26758ffd3ea60e7@smtp-cloud8.xs4all.net>
Date:   Mon, 12 Apr 2021 05:39:51 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfNqNeMSEE95PZSrZDzTGm3w0qDcM7uk3ZyqtQp2nfnZKui8X6Xfjz53e84czxhwixau7KQErpmW6U5sNIw7XWzsvcI0ObBo+s9V2SHdq8Q5ykqzSyOsD
 aPwJ/6DentHMTGi+wGF/rbH4AdRLP5D5KkMREL9iujCw5PTiPygjIej7ApYmZmjgxPfqagQQs2v64UHn1GAf02XZoukI8UsclMcxiu+5RGx3oA4shy2PeqM6
 Udd8hMis7VxFxmORtV14Vw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Apr 12 05:00:10 CEST 2021
media-tree git hash:	4f4e6644cd876c844cdb3bea2dd7051787d5ae25
media_build git hash:	1521b23ea5307bef1ee17489c5323f00891dd52b
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
linux-5.12-rc1-i686: OK
linux-5.12-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
