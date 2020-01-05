Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 658651305B4
	for <lists+linux-media@lfdr.de>; Sun,  5 Jan 2020 05:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgAEEqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 23:46:19 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53873 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726240AbgAEEqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jan 2020 23:46:19 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:55e5:9c12:ee5f:5f6e])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nxnriBSy0VPvpnxnsihvXj; Sun, 05 Jan 2020 05:46:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578199576; bh=6LJjgaZo/94pQjTovtNbQuyHIPPc5yJXghji+q3qioE=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=hVSTXEwHJR/3Q62Dc2e4O7d86eg8+ODD8Vmu3iXcTyt7R44F7hxkRLVoBttF6Ganp
         HFnL3D7b+5SSopA6/znZ7pzb6a4m4RviRnFezpb0RkkwtMQxBgA7IUhHsIW4tx6tLK
         WHC5c9POB04hDo8L+SFOJGXN8Ek4HCxrCM3YySPbsAXxXO2pLY8iwu/NstuNCD/I6f
         t/gGOHVRA/JNybUWNQqpY9n1X20oCF/KDaqwWfUDw2k+3jFRC85+Qh7c1QUDq03KlS
         HEmyeQ0aWejIaxzfayzwkX4nGep5wiiKHmhoZfD00IBPYxFZnLcFacbGIAZ/qbL755
         59Hnk7zTs5ajQ==
Message-ID: <15a5ecaddb74f0459db53cbf180f262f@smtp-cloud9.xs4all.net>
Date:   Sun, 05 Jan 2020 05:46:15 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfFI7getwOGxAByJJaHgi6qLvOMt8JXJVWO3egJgWmHnZHyUuv0WHaRs4ddWPW5+bo9iocOFZ1Z698K8ODJt8B3vzuD7mnz2uA0KzUZF7KzGvYImlRPbl
 6GIjubkQBqf/iGTDdWhZFGZorT2fCe9Mmk+wc3lfL7rauRJL7B36ttLTMpniI8JZHCxNtMQqGzYa/GeIOkoyKKN41omQUcYelQPPv+je8W9qKoJwMDlwmBG0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Jan  5 05:00:12 CET 2020
media-tree git hash:	51e40a0dbe53cebe1f4b85bb47e250dc5a89b254
media_build git hash:	2555f73ab11b9936171fc31d38498818922c2f7a
v4l-utils git hash:	934a1b9bebccf9b9e4b390c3ba0198374e4a9199
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
linux-5.0.15-x86_64: WARNINGS
linux-5.1.1-i686: OK
linux-5.1.1-x86_64: OK
linux-5.2.1-i686: OK
linux-5.2.1-x86_64: OK
linux-5.3.1-i686: OK
linux-5.3.1-x86_64: OK
linux-5.4.2-i686: OK
linux-5.4.2-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2901, Succeeded: 2901, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Logs weren't copied as they are too large (4088 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
