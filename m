Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CB4410ED8
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 05:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhITDqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Sep 2021 23:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhITDqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Sep 2021 23:46:39 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646E3C061574
        for <linux-media@vger.kernel.org>; Sun, 19 Sep 2021 20:45:13 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id SAEumsawIcSrkSAEwm9ZBl; Mon, 20 Sep 2021 05:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1632109510; bh=EAhUrqEbxcjIU7sjaYR4ot+N6VF0cETZ8T9fSlVwEPw=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=ZJzgoAB/6hU+RLHognp+zBo43ZZwmldjN+Ojh372TN3TjnbiXvZ9Vt2R3j38Kfivm
         c+A7emtEh8Mit3/TQ9PPtj35ObZYYKfPhJCLfxTkfGqGliLlyVpx2Fr25p2zNjB6OM
         Q563Ge2vDhqtCmGMbYgxU8M+rVmSUEeru9lenWk6jG3zBDB+vfgS1qAZQjVD/81uvx
         /l44cqTML3O9rcWaFQ5Z/USYySv297KQrRXzkdWOpAOZFEOyxM06favjJIb8Hbs7xT
         c/002a1dyjVAUu/eMxU9VZVrQ9l60C5GeU8rw3tKX/XCVza0dgkWqRjR3mgdu0tcay
         53hTPj2DQQ7Bw==
Message-ID: <aaee6bb40850f5c6bb3e2c32f45bff2a@smtp-cloud9.xs4all.net>
Date:   Mon, 20 Sep 2021 05:45:06 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfNzTTfofpF8s5mOtLPNukr/rmBaV9357G3nHf+cimVE42VPuX5mdRA7Krv6km7dMbjsCYrfwvosWdIAYTcKwrFnO+rcP0EW1j3Vpaaro32IBJdnSea3Q
 T61lMEH1VMH2/qT6OJBZ9EEfAQ1gUCkt3BVTGbXdrGJFa5z5Niv5JV2NGEbykiqftnDdYxJF56pR30tkx0ml3Ao9O63onJx7P5fknLUh5yemfjHi3NW9KaDo
 iPgWNhrDYoJnyP90xPuGrA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Sep 20 05:00:17 CEST 2021
media-tree git hash:	6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
media_build git hash:	19d143dfd9cef88837caca87c456c8776cb0cbed
v4l-utils git hash:	636224902ae1f3c4cee53a0ade62cf508b6b7777
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7593-g7f4b93661
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 87e556f547947b56d66732146b55b1913a11cb41
host hardware:		x86_64
host os:		5.13.11-marune

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
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
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
linux-5.4.144-i686: OK
linux-5.4.144-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.18-i686: OK
linux-5.8.18-x86_64: OK
linux-5.9.16-i686: OK
linux-5.9.16-x86_64: OK
linux-5.10.62-i686: OK
linux-5.10.62-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
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
