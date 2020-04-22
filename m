Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177161B3597
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 05:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgDVDgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 23:36:24 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42661 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726228AbgDVDgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 23:36:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id R6BPjqdO7lKa1R6BQj4b7P; Wed, 22 Apr 2020 05:36:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587526580; bh=kyxnl5XzmG2RgNFLqzq642uVoiIt+TH7Ne/O93cMVN8=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=mS1p2bTWqoTD1Z5+Wvw4kMIN1cMtV2sPdypJTwIWcl/UX+tQeRlFbVHAYHQ7s8K1s
         VVqcakEN90I3AIdMr9dcbrMp+gQoRC1YoQ23i0eT1EUrE+vo6WAo4QmuX1H2+8W4lB
         GkYJD17PDRBhWtXHZMcUG81ewKNBcj0UqXd5lp+Ujw7xMY8gbMRNKWq0e7dzm/F2gL
         6l3WJzWXK4EYDKCjENBUDUytQ/spE/gprY2rzyM38bOQ2ZukMVdt7FegwJs6R+Y9y5
         R8w57gLDtTZNjkZ/eemtH7MmxTLcTqUwzsW8JpjmHIg/paEXoUC5HxULcYzjtyc6tv
         XYO25R0s5g3mg==
Message-ID: <721f65fdaaea3df7c16ec403a5ec58b1@smtp-cloud8.xs4all.net>
Date:   Wed, 22 Apr 2020 05:36:19 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfIVb0IY10BBYL+6ZNoKboWDSeWif+nnPtjFOTjopr2MqYZwhgCvVuZrIus9euF8BY6L5Rs3/WYxkf7jpJpZ79EtCYR9RA41uENIIGPtuaOZ78T8PCFaq
 r4M9WUHWhNRYlU9TJZ073XMbFKNJwi71m0NYCUha06ICRZ6rwboKKGZzb7efhZ7/88NiAjJbOckubQ//Mx8/dSL1HPT/hC/kRVhqd/Pa3sohNnfVEt0TjOTv
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Apr 22 05:00:10 CEST 2020
media-tree git hash:	b2965c912a3dbc40821cd27fa5548ae9a086a375
media_build git hash:	00e63b78326bfe320582189b774381edbf4ad070
v4l-utils git hash:	9c3d3fde6b5c5102293edbb25d1f4a73d39dc04e
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: ea95b3c30d6328a869ed67f518963895c2ded39d
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-powerpc64: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm-multi: ERRORS
linux-git-arm64: ERRORS
linux-git-i686: ERRORS
linux-git-x86_64: ERRORS
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
linux-5.4.17-i686: OK
linux-5.4.17-x86_64: OK
linux-5.5.1-i686: OK
linux-5.5.1-x86_64: OK
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
linux-5.7-rc1-i686: OK
linux-5.7-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 2
virtme-32: OK: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 0
sparse: ERRORS
smatch: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
