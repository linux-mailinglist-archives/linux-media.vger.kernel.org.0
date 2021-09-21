Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2DB8412D88
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 05:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhIUDod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 23:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhIUDod (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 23:44:33 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0829EC061574
        for <linux-media@vger.kernel.org>; Mon, 20 Sep 2021 20:43:04 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id SWgNmfLN9pQdWSWgQmVwnl; Tue, 21 Sep 2021 05:43:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1632195782; bh=x4cicU7tbkjsveLbwbCCF2Ur59iRY3wmA4j2OHob9bA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=BKR5DMayAsRbOEmVXwwpTl/+rxP+HaohK530sOCz6nS4yXAwPljzQERNbxJ4b8RT/
         l7+SRsFUA1InJ5IzGl/G8E3FFnSqaRjyLWXC6sv67tcEtBJEz3V2qxoa6DeS16Kqcc
         FeUxF+vlbKwohMZgCmFx4H8A8EBUHtx3hJGx8k0NeHLyABP1AcWYSj/Z4lMMLOoOC0
         sWX36yNMEWOaa7jYgGSE+xTJVnSwnODuqzC/WFpsyrr9D4eYP97flzQGWF8DJt9jtz
         IhpPM7ykFivse9VTenJipHhw+vEguS0PEKUZtLJapVcs1SU/iOHl/yvw5YWgzmQ8O6
         OqZqpaoZ5vj1w==
Message-ID: <0407d806019d53387a0c10396b8a30c5@smtp-cloud7.xs4all.net>
Date:   Tue, 21 Sep 2021 05:42:59 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfPJN2+rQegV/nF+jI0a7BmVz7ie3Dj617qpxd1fQ75CYcHMmIPAD5h5to6Tyz2TS8/I79TfyeI1W+OFRcfRehdJ9Ld6QWOIgy4weogk69rPxFAuoizNB
 PQkhWDcwVBrHqfezSJ9O4tyKov+brubqxZq8zSGNvUG7vJCgouUvEQ2RJ06/aIIgaUkQrHGRcOlRvBFEbOu/4bB3j4l474+PjohWhrtu0fiQuTZ96fnkEpy0
 eBmD3sl4gZTyK7KC5LV0NQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Sep 21 05:00:11 CEST 2021
media-tree git hash:	952aab37b1217fbd9146dbb841ab38fe2477c753
media_build git hash:	19d143dfd9cef88837caca87c456c8776cb0cbed
v4l-utils git hash:	636224902ae1f3c4cee53a0ade62cf508b6b7777
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7593-g7f4b93661
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a9caf2336cee8480a04db9f1adf1d2e6c04e5143
host hardware:		x86_64
host os:		5.13.11-marune

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: ERRORS
linux-4.4.283-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.246-i686: ERRORS
linux-4.9.246-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.246-i686: ERRORS
linux-4.14.246-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.206-i686: ERRORS
linux-4.19.206-x86_64: ERRORS
linux-4.20.17-i686: ERRORS
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.0.21-x86_64: ERRORS
linux-5.1.21-i686: ERRORS
linux-5.1.21-x86_64: ERRORS
linux-5.2.21-i686: ERRORS
linux-5.2.21-x86_64: ERRORS
linux-5.3.18-i686: ERRORS
linux-5.3.18-x86_64: ERRORS
linux-5.4.144-i686: ERRORS
linux-5.4.144-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.18-i686: ERRORS
linux-5.8.18-x86_64: ERRORS
linux-5.9.16-i686: ERRORS
linux-5.9.16-x86_64: ERRORS
linux-5.10.62-i686: ERRORS
linux-5.10.62-x86_64: ERRORS
linux-5.11.22-i686: ERRORS
linux-5.11.22-x86_64: ERRORS
linux-5.12.19-i686: ERRORS
linux-5.12.19-x86_64: ERRORS
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
virtme-32: ERRORS
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
