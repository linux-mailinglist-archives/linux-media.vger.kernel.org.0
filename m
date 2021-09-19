Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01997410995
	for <lists+linux-media@lfdr.de>; Sun, 19 Sep 2021 05:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236301AbhISDqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 23:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235586AbhISDqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 23:46:02 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3C6C061574
        for <linux-media@vger.kernel.org>; Sat, 18 Sep 2021 20:44:36 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RnkkmNwIOpQdWRnknmOsAq; Sun, 19 Sep 2021 05:44:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1632023073; bh=+tOOV2Su2KZ07qkrELlMuqKDfcIzxtIACV1jtDJGiWg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=o+MpUVphKSx753SKlb7gftXIDC02R/Dughbc5HriQqE+ZqC33RcLKEqGdnk9ZcniR
         86vq1KRXVnNA60wTtgSLSdNqGSg81StxxP8HiSUAbx6ljNAjRW65DqfTBfXJ1tylJD
         OztJNNxFzCsdDbMfzU6PVlEBqIrJmu7N/Z6i2S0L12CbBrwa6z4FHl4rgdHBwVGcde
         c9MDTGp94muxvGyH7b4hmlWJm+7mBpsKhzqgv8eoVr1No7TM+Q2JRudoGnGyxRJXR3
         vMz5LPltjauHfzZ4VbPyB0KrTwYqYgkc/RROZdaGRe4EH+/Z6rhHvZ7SmU1p02aig+
         QkyQTsMY7WT7A==
Message-ID: <0ddbda94147b7ad09362607e868f2093@smtp-cloud7.xs4all.net>
Date:   Sun, 19 Sep 2021 05:44:30 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfJR/BmosvHfxaHswMz+SoE5ZGeTvVLtuIJvATzu1m6/dJsVIa52wu9Hx/3oVi2hPsNTqnIYKp+LbdWXmLdZ8kmI62fHRQkshMDNEvU0lKx4Dv58K0mgq
 Mpse4SxNRfZ00vDM98x+biw7AjcTGjPpPNWPkzs0e6IcUju+jNS2uibxDw5ceIu8w3K6voqa0Fg/pphxtESb1E5+1zlB5YIZzQD0zhxUKNyi18dUSf08sKH/
 qHSmdn351OnbZmuL0z9Vvw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Sep 19 05:00:11 CEST 2021
media-tree git hash:	6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
media_build git hash:	19d143dfd9cef88837caca87c456c8776cb0cbed
v4l-utils git hash:	1874b2d0dfbb8a38b0c8b75a23a4b9a60e52fd6a
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
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
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

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
