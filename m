Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DECE11300D2
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 05:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgADEsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 23:48:06 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:48419 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725862AbgADEsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jan 2020 23:48:05 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:3503:307a:c91e:8612])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nbM2iXLaDGyJwnbM3iksAY; Sat, 04 Jan 2020 05:48:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578113283; bh=21xcyLACzkm0NS6sUSX71GIfKbO9AhQ/lKSLSaXlRWo=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=HGXraJbfXFio7pm+smQqDQKoloLisRbxkP0pYZw69aQMgHy4AhjBr4Wq2A0XUC/hU
         9voLQpc/ZWUNvns1hrgHjK/JjZQTSPAyoxPVYoKQgjMqvGVo4590QOk0rqwM8KrqNZ
         L54tUxGYY+UceOCCVTBKqiuDcCd+7gL6H8QcRzlD8QMsVONVkosFSaxgr0mHLTyEPd
         zlwj0AU5p63jTuM41+n/5rqKFKzHQNBEGJ0gmJIAHKR7i4bEkABuLdLFDmEraKOK/j
         coYAapZSBSxkJ9tATyPdTzrj8IBq0q4cPWgTLi27zO2cacm/aUpaCA1n0sBWkCGe0m
         hl/bqMFYt+eUQ==
Message-ID: <82be65c8db0b48f106207c253da4330b@smtp-cloud9.xs4all.net>
Date:   Sat, 04 Jan 2020 05:48:02 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfFfaqZ+lbrqhfB4wP2I6lX4jt9ZUH8twOS3HoaRXzUCxnEUEO7/qv3ddBt8b7z1kyPweBFPQzIK1Xn3BMcypC/ztwHPtv4gcqxb2vpkCTEncy/97I2xN
 rQfLAukVeyfeNAOaVMHkfT+FEGcJdf+z82/cpVWRiaEo/eRaT7Ug6ogHxb5g+XOgUpQ4V9TV0MD8fL0ADpzyBXTgAwO4wEYtcaX10Z/QC6js1F2GY0sjjC4T
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jan  4 05:00:11 CET 2020
media-tree git hash:	22ad4e05585cb50c486b05bdaa4b4a4686074ff7
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

Logs weren't copied as they are too large (4164 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
