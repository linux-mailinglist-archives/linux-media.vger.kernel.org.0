Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9948C31E52E
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 05:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhBREmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 23:42:09 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40137 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229720AbhBREmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 23:42:09 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Cb81lCf8LZvk6Cb82l8r1k; Thu, 18 Feb 2021 05:41:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613623286; bh=sUF5EB1Ijr2ImfK7dkmvpcQC1pEp4/MTNC+SlO9s9qY=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=b5qpjqYhabJ5ErQYqMGjYmvz1U5P26suuEnSHC4U3eZngMHYABOVa2PphZFgUXaeD
         08nbxN7bqfOHoG1KNUl8Ni0mOpgIxKdWS1k6zEMeNV9SDcsJmrJzXfCHNEYr/yVdPS
         mh8GfhbNC+nkmVrVlJ8gs5eGIh0yOvJXMDT7+jZUeMuisGTUhVev64tGW45xcLZ5dS
         goheYmikSQKL/hit9taDD6B3FTJJt07fWQGmNWRP0XKMy8WQzet7cwvOiXRT7h7iTR
         nlHCWotdcrsNwtA2Y1Bke8NLUThMk/R2XnkJfLGCRasun5GkMm2nWPj6Uw3iHRFT/D
         D7ZSCX1ZR0UUA==
Message-ID: <c5a2c1b542d8684c95af86698a4f8b9c@smtp-cloud9.xs4all.net>
Date:   Thu, 18 Feb 2021 05:41:25 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfOKyQ2EKv8A/kHFgT454QOtcWFu6m/88ytGjj7Hb2p+qBCObYZ06DNmaVEx7IUkUcZgo5YuyUeUpNcooge+XrSeerw9j/7boN6Oc3au+L3gEeAH1n7Fo
 hPpcm1F+WEZL1pL+NpK9fJqjZKHSD8lddiQLUCOUjEyNbwmILCNCyFBW6HHUtTj+Exw0Ir+xo4RUh/HaIXd3VkT4XcmPmL3NfFTS1hj9bGGoI0CIJljpF5v/
 HUQiF5I4td3FXsz5W/OgGw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Feb 18 05:00:08 CET 2021
media-tree git hash:	8f202f8e9ff38e29694a4bc0a519b4e03c1726ee
media_build git hash:	a236fddff61e8357f3070effdf23e9b5f20b26e6
v4l-utils git hash:	bf8d28efe5a3d2e17e33cb8c865286ffa76a819b
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7349-g7fcfe2595
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e7b822fdb96cb4ba52d3c0c7445d3401649bacd6
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
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
linux-5.10.1-i686: OK
linux-5.10.1-x86_64: OK
linux-5.11-rc1-i686: OK
linux-5.11-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
