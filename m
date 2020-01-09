Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8485D135242
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 05:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgAIEsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 23:48:18 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42851 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726913AbgAIEsS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 23:48:18 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:e97c:8480:93a7:977])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pPjyiegmCT6sRpPjziJIoq; Thu, 09 Jan 2020 05:48:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578545295; bh=BuJBA2v+T/vagmCoya6q3HLM1hmzXY9Sh3XV/2jEkxg=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=pNRJ1hmKCr87rJesCfR+K177D2I7Tgr15dLdu+Jh2B0SlmMlIm/4cJj8sse4Y98S+
         8zbfXU55g6rPZGR7EDaWdJENLvX953XGwf6SG3UDYYO7UTZm9prHnCh7oMp0PXFw9k
         wIxLe9duYnUMgAVx42x6Qol51+dMuNPhPUpPwuAprIsc+i7BYwYb+e0ajLDTIjEjL9
         t1r6pT1x2BboXd7uzRiGqWWzZbo9LQ94V9UOJ4YrTrk10iKPKMW9BDTmIvoZjKm8VN
         jYN45kqGvM0pZRQXQWKaVDJgMqAEiczP6B4jKlltoKvxc9vGVyOYgwqPP1NoXMUgcY
         5BgKftLG+dMgg==
Message-ID: <507dc56eb920b8712b237c1c79808fa5@smtp-cloud9.xs4all.net>
Date:   Thu, 09 Jan 2020 05:48:14 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfIlnChU1nZ1TVtSAn/mKzoa40Ml7Hdee7zuFsPgbnXCpL3kMl4yqUv0nBuKVJfaPYwL0/yP7vXJeeU6q46xoUaEIgwu28PP2baLnO1IVb6lbjXcwJoH8
 C4UeJGhsIegEBaDHC2C4p7d/8R4dEjDAK6oQqHDKuSMeVQWBUC93uz/5iZPpPYOh9sfGe3H5urWmHuxcxobIJwNdTop2mIw5PKm/JaG2CNmsFC82ZM1fD3az
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Jan  9 05:00:12 CET 2020
media-tree git hash:	e6111647934562849ba052052ffbc673b935a9fe
media_build git hash:	9130b5f6a4375b19dbd5398b2a4f73cf0921eaf5
v4l-utils git hash:	ec55a961487b449bedbe07650674b4965814cf07
edid-decode git hash:	e719d04077d098eb51d9494f41060eba2419d4bc
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 2bba801e0e7dfc02308d972580fab46d27aaaffe
host hardware:		x86_64
host os:		5.2.0-3-amd64

linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-multi: OK
linux-git-arm-pxa: OK
linux-git-arm-stm32: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-mips: OK
linux-git-powerpc64: OK
linux-git-sh: OK
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
linux-3.16.63-i686: ERRORS
linux-3.16.63-x86_64: ERRORS
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
linux-4.4.167-i686: ERRORS
linux-4.4.167-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.162-i686: ERRORS
linux-4.9.162-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.105-i686: ERRORS
linux-4.14.105-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.28-i686: ERRORS
linux-4.19.28-x86_64: ERRORS
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
linux-5.4.2-i686: ERRORS
linux-5.4.2-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Logs weren't copied as they are too large (928 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
