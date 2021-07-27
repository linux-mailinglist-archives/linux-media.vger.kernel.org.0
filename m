Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5463D6CFA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 05:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbhG0DE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 23:04:26 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:51277 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234422AbhG0DE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 23:04:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8E1TmWLpJ4Jsb8E1UmXmu7; Tue, 27 Jul 2021 05:44:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627357492; bh=8xjEUwbdfNAA3odeFvg01cUGvtLwlsF0PA4J0KwRo8w=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=h25iF9TOo0z/lkmk5rxe0H80d/YkkoNYj12UJIgc4OET1pgeI/tyhe3APyK2SWfOp
         gP2iOGTe4J6CTI5h/UtKnN7TCIlKrt1x7nKrbggXfcLoylnnv9zf9jUXPkB1viXU26
         G9wUWaBqWIu8gV/eNUcoOl4DTBX7gimxcd0UcANDS5FgCRzePxCeYxQB7TW0vg7EtJ
         MLUyDAuNK3hnxLzxuM/L41uokLNdh38S+2iovGVk2N0gM45gZnNDPAJEYtIHWewlak
         AV6MV60Pv9xA36J4bFAMRge14zFwSQJjNCMn8GItWuNmwmT6pMHM2LlltJ8pVStQGt
         xxc6s8IwM+7XQ==
Message-ID: <d40564cc957079becba4baab25e615b1@smtp-cloud9.xs4all.net>
Date:   Tue, 27 Jul 2021 05:44:51 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfPtXsV6o9NvxM4M2Eq6rz9PhyODgd7kMZk6xgkmI4vAUGQtrtY6soHWReBp4nB4s5JBKCYQwyssG9Dz5Cr/5uk5l8Hvcg94yYVqdYaCRe8lJbsPFGRKj
 uKarmvvyopA0MySTBll8nLW1k2gLLRVgtT5P9zSeMx8pIqKdLIDcVQGXiNGuMRH5An/TB4UO/n5juE/1F0uKZtOSEYODXcx9QVvxHLVQifvER0sRsowsNt4Q
 QgXwSF8i7JnczEuUZHxWRA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jul 27 05:00:08 CEST 2021
media-tree git hash:	e73f0f0ee7541171d89f2e2491130c7771ba58d3
media_build git hash:	bdc3294781a89c69fc05acefd95842b88ffcb4b9
v4l-utils git hash:	a4f2e3a6f306f0bef6664451b44d5a7a18b26803
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7505-gb2467b103
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3611fbd512aa20477d5a0ae9bc2f01b1d3cea05e
host hardware:		x86_64
host os:		5.13.1-marune

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
linux-5.13.1-i686: OK
linux-5.13.1-x86_64: OK
linux-5.14-rc1-i686: OK
linux-5.14-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2989, Succeeded: 2987, Failed: 2, Warnings: 0
virtme-32: OK: Final Summary: 3035, Succeeded: 3035, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
