Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB9E131EB9
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 05:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgAGE5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 23:57:14 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46975 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727496AbgAGE5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 23:57:14 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:dc7b:bddb:dd87:cf35])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ogvWizM8rFqKBogvYiNDrd; Tue, 07 Jan 2020 05:57:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578373032; bh=QLm2a19AmYwXqn3E4X1a140czi2SZOr/Sr7zEnuhH00=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=ast0sQ6E0CL1K5L3Ysvz/iFUu/BV87QMJwa7DLaghuB/3Prs18RZsJYbs3FMN5ivZ
         VcCa2H+ch94cu7queUmEGHoyUSHB9lEbWMk9QnPdT7U4O8iPtB9WppCf4CbTXm3jiG
         oww9Ibv0gn1KlVTMuqDntaQWRaVbNdKaorGi77SnM3RcQTcZY9tRjQcOHP77V99jHJ
         tYzWaQh24Rur83BpdEb0TyVCTOtqg6XbdIvegcv1SD9aq/AtAT3sWq0Htvo77KLtXr
         FyWeGvK3yON6PHTB3QXNcSEFbQwhrdQd/wYg1Gp/ALnx2rad6UWEmGrNOspNZPbs0T
         nG5rS1Gw8bKFA==
Message-ID: <c004877f86e3b9b13d0e82c2ade000b5@smtp-cloud8.xs4all.net>
Date:   Tue, 07 Jan 2020 05:57:10 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfE0jMk6DvaY9fxYQ3Q4LJ1E70eEQhRTr0FVzqH3iZnxaLYSIYHWzdHHdJiec6yuxPM3hzrvORXXcu9yOex59ghwr5BkxePCTjG/CuB91PQGk4cHSgJxq
 PAzik/c5l3ANQn7dRw19dOMo9nQN4Q3rc/yH3QxfpYcixtnKcJ4lN/XkRPO70HxI/NWd8qDEv7l0FfapmOR/r6oapHatTtu53ES7pMZeAlNBE1Tsd0rF/nqi
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jan  7 05:00:10 CET 2020
media-tree git hash:	51e40a0dbe53cebe1f4b85bb47e250dc5a89b254
media_build git hash:	9130b5f6a4375b19dbd5398b2a4f73cf0921eaf5
v4l-utils git hash:	232f5ef0a94915bf4565909c0219396192b31328
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
linux-3.16.63-i686: OK
linux-3.16.63-x86_64: OK
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
linux-4.4.167-i686: OK
linux-4.4.167-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.162-i686: OK
linux-4.9.162-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.105-i686: OK
linux-4.14.105-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.28-i686: OK
linux-4.19.28-x86_64: OK
linux-4.20.15-i686: OK
linux-4.20.15-x86_64: OK
linux-5.0.15-i686: OK
linux-5.0.15-x86_64: OK
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

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
