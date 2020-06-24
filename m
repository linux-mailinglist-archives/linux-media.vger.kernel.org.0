Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFA7206AA8
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 05:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388664AbgFXDcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 23:32:46 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:53157 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388187AbgFXDcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 23:32:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id nw9RjezudNb6lnw9TjsCsU; Wed, 24 Jun 2020 05:32:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592969563; bh=JBIhGAaCGNrghdJPFu2fKRg2CeMCnp/K8+cXbqLQRTI=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=hReKE9LQIshb8abyH89WJ2t/pFNUWrQKfSddxOzCZMEK+VYs03qWEgtcKByLTIDaS
         a0hM3WwNKQEZdh7u03PWtMZ3SQw/XHKeEw6pTzmQpMpB+HdyLp+utiAqGKC9vmOTla
         rntvmFqpHy2+lZ7MhMNkTB8e61lYNnJfsqOWQWwIYHDMQorQBxdsjxGok7PI880sSX
         n4IqCtJQI2kdXO6Co2hxi93rC4wgH2KkPHRP2j7qTXEWo0M0/ibqn03KdYLW2SuMY7
         DOLCbcz8l3nRZv5snu9rOiYIr84gqHuAuevzTmCMROYF/wMcpaSbutG/xEe4xewU8P
         l8sAdiEMiAouw==
Message-ID: <1dde18d801dea4629a1d6e277f90f1f0@smtp-cloud8.xs4all.net>
Date:   Wed, 24 Jun 2020 05:32:41 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfOv/pW6YKZT+UrYLSrfJDjBzAIG34oU/sVdQd9sah3N7CmzqO9lr3bfR+50lnVbYvurByZ2HgGoTUwHRo1yCwnMUO+60UWlyFTUDxE79GHLNQBl0deHl
 WbnyKvHMzdf/663I9/MrHbxlHYj6tjtbLVZpQL5DZgNpy9W1O9YcxKfBj/m8eQD4GuFHRCrcpzhe47Osd0QVNjV0CArhCwevAK9Kqn+c6efBE/wblovCLFU+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Jun 24 05:00:12 CEST 2020
media-tree git hash:	e30cc79cc80fd919b697a15c5000d9f57487de8e
media_build git hash:	d90bf09c9b38b7cc89d47d6ec71e2512f257ebe5
v4l-utils git hash:	71cf1bbf5cca09756c4f46a596d658eb5d4392fa
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5540ce1b67f5015886e850a4775d2eace9efe922
host hardware:		x86_64
host os:		5.6.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA
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
linux-5.7.2-i686: OK
linux-5.7.2-x86_64: OK
linux-5.8-rc1-i686: OK
linux-5.8-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 1
sparse: OK
smatch: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
