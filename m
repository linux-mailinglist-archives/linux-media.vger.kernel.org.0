Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2806B31993E
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 05:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhBLEjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 23:39:19 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58463 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229710AbhBLEjB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 23:39:01 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id AQDhlGDo9YbfZAQDilfSKA; Fri, 12 Feb 2021 05:38:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613104698; bh=INrZFoTtt4LfInoCwwK5f0gTnP7pO30SR3JSpeU4VsE=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=KVMjL70uhfFDqHjau9ApI/wruglJDJZZ4Eob/jLoMhqULhzmDxlXWDEQ+doEercXc
         63xvCz3WXECnoUqDDvyg5nthbnnWCq8DmvxUgP2AMMjY0iLibKwkRdZxpkHbmbbB56
         tY2zTmfJ/K1EMJZ4bfQufgrJQ6gqzeuqw9PE0eyhVCU44WdQaNTL1jhz+qGVkLPwFo
         tP3zd03KfrtD2HqaoOnuQKfOMZ2IWkuVYsEiveiwwKT5+B8xIzuM7F89UAQNCr4qQN
         mvn04qovMjM9tDzv5gjFudklDQizrEoVYS9nFTaTmVm/e5LSvzrhgBTT1AcZcs4iM9
         G36FXRNO7r5WQ==
Message-ID: <e03d124a820e8378fee50ae9d3efc714@smtp-cloud8.xs4all.net>
Date:   Fri, 12 Feb 2021 05:38:16 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfLKLcnf3diWdlASF8QBnctAgYElpyIIWlJ2wxGFNNat79QyAcY8Kuomz30qINODaW1ed2p7DWBqzKVahrYnwiluNptDaZlbNPTTrSr2dCGkQPiLqE+5R
 02328oqGsZLjxZ3Yjq4xHYuEBxQtV09XMdlmiDvwt+pJRTPFWpsra3UfK5OW/65qV5cOCtUA/Y0UQ5cJQKidRlqDk0VU5hZGKyUYzxOq37Snu8vQURtzKbdV
 6DbkZW04P5Wey5PzTemM+A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Feb 12 05:00:11 CET 2021
media-tree git hash:	ce79aecf608469b8b8e422928e6fca50b6ca7133
media_build git hash:	a236fddff61e8357f3070effdf23e9b5f20b26e6
v4l-utils git hash:	733f7a54f79d1e12a8745f0804c8394ed0136eb2
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7349-g7fcfe2595
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e7b822fdb96cb4ba52d3c0c7445d3401649bacd6
host hardware:		x86_64
host os:		5.7.0-1-amd64

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
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
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
linux-5.4.69-i686: OK
linux-5.4.69-x86_64: OK
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
linux-5.10.1-i686: OK
linux-5.10.1-x86_64: OK
linux-5.11-rc1-i686: OK
linux-5.11-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
