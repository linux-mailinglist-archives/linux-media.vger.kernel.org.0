Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9992B2A3B7F
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 05:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgKCEsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 23:48:05 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38373 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725858AbgKCEsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 23:48:05 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ZoEjkN2eNMseXZoEkk27Cu; Tue, 03 Nov 2020 05:48:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604378883; bh=y4Vz8BdDh0T5nCO9jBHTQ/wsoxkMx3oCRb78ix0uz8M=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=lflAEvpb/LcCYHMWrSgLA4nIeCypJaCpoZMiEroQFxpKGjw6tmGeX/Hb++ndXZL8X
         y7AGJ7IFaGUFtdmtoWhZMKVgl8knVsGz9BC+++Bw0u0s1dZU4y75a5pnQuWiFYNdPz
         BwYs0PyHpHCvn0tmR/DWezVjgrDPWJL7rjv6JIYGWI4z3EW75VklHbndYodNk9qdIk
         F5xFwK6J0lpdEtmPyoywToe2cb5pGySjbLvb1F1wFewDNyi7mBaWLKAfsIKyOROQU/
         G5PqmnVJyP+csnAnha1zliSOwTzaVzvr0mr0p1jGhJ7iByLMhC7eVRSD7dwk4nXvyV
         8FkSxqw6ZYpTg==
Message-ID: <5bb52960f19dae84176b77b46e8cddb7@smtp-cloud8.xs4all.net>
Date:   Tue, 03 Nov 2020 05:48:01 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfDLzBNeP11jm/+rWqJkVqP8ogb6XtGwLjyfmzCUwz3Zh/Des6/YTBz3PaFGWgGeICbvYJqaN7YD+Kj5vCr8cWJlf/L9p4Mqwe1lUGl+/xm6KYlZXIpJO
 DRSiUI48/N1j/sEcnoBownsMc7oeroOpvBevjpo7J810RvCPXkT+OEbqUzDhosOVXMW4s8dVZPblBAQ2jHzLpDiJKnyVsa/svMUwfMzalLMmUvZuZt3Hezd8
 Pb7Bi69II1t0FM8Qipat5g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Nov  3 05:00:11 CET 2020
media-tree git hash:	dfe3d19bd092cefb184c6e65b881602c793edd33
media_build git hash:	bb0421630712dd7c4c72808d390305cae025876d
v4l-utils git hash:	225c6c2a17bec0e07c13ebb891e062ccef051180
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5aabc25fda7a7122487b4bd429b4c635cb4df7d7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-pxa: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-davinci: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
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
linux-5.10-rc1-i686: OK
linux-5.10-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: ERRORS: Final Summary: 2779, Succeeded: 2778, Failed: 1, Warnings: 0
sparse: OK
smatch: OK

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
