Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69DB1AD4DA
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 05:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgDQD1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 23:27:54 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56511 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727123AbgDQD1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 23:27:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id PHfSj5gDylKa1PHfTjWvZl; Fri, 17 Apr 2020 05:27:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587094071; bh=0ihJarkYm80Oj6SsMx8oPVtFSk0mZOSUZmKNKndSOV8=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=n7iYwxyqOTI7mC/cU79Aob6aQYO4F8mHCBzeeyTfNgdfoWARbI3nnKK+63xeWUWeg
         81TSTo/Q8RnEzmRtfB9BGd6QUMIkYIq8zEctNsSDC9q1C6r4JVVeEqkoPCUgmPSRnH
         tEKcPrFWD215cbLFHYs52Y5HLVwwUNIjPVub8o+vMIK3+lhc1u9O/W1tZIZO4mU2jg
         qqC214mL853ZyAcfK93At2+lv0g7lpU3QkU/sPbJrFlmjXZSKY+QrS4KWVihDGW7F8
         S2BXJkIr/bYPFT9Jk8tV5XbFdXqxMcxsO96QfpbtD3JFwaiid5Kw2se1DnMkc7zO3B
         WQM+iLBhZolKA==
Message-ID: <f355aca88d8068cb5341bebb24268f93@smtp-cloud8.xs4all.net>
Date:   Fri, 17 Apr 2020 05:27:50 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfPgT6X4ML4aPi9fT86YUTdv0tvGXaPVbFxVvuWBk5+BTxi1y5ldKYDMqJXSktLw6Jg/77hXfdsw1ozrXZBJeBQuXVNA7dfsC+n4FO8ME0Wb9oiWY+jWc
 fuJEI3uJdX9C920VAt4JZYZL2Cc/xEnisD8X1bpRMj8VVF1Y3uG5+SpX2WuivvpqeZ8os59qObyHq3ujrphkAtNLiqe3zILe2p8sbbdnXOEiJaRkwdOfzpkO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Apr 17 05:00:11 CEST 2020
media-tree git hash:	dacca5f0fa69f04c2e70aad9847e8250b459971c
media_build git hash:	7e30d7d726f1fcec3695f82deebf0c0c6cfe51e7
v4l-utils git hash:	ae58f47a8dc31d046b151abc1a2346f53dd1ffc2
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: c66f09bba8d560141228fc2c8d78215906866773
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
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
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
linux-5.7-rc1-i686: OK
linux-5.7-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 5
virtme-32: OK: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
