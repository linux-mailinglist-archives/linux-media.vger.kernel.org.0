Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25F330513D
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 05:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239567AbhA0Eq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 23:46:28 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42069 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239213AbhA0Eex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 23:34:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 4cWPlC6G3vfIs4cWQltXqR; Wed, 27 Jan 2021 05:33:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611722018; bh=Ey+JdFt0sIy+ccjlG6BaG4ZMJC5z+QJd7s4WpTEhdRU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=aihTFXudsSuFxE+j8Jd34AzkRY91GjmTzcYVv/FYHFuTF3icoD00V3bNpF+s4B/vD
         CPKQz03E6egVWSsuqXed+5TIAfduPUjU16Q3dPIWIIO9glsdfQkiof9pbSpDKNMx+d
         s+2XJ414k/YgkpD8iaObZDUxHG0Mk/0vwoe6NA8DGhnSwkmIq0zsvQFw4ZFXMseaNe
         m6mJYiglV8i6NN+zvS68AQPoKbVgHJYEZMEaoWI7Kc4B2tCsokOWctZ77B8yQrD47g
         jUsILXtqgKEZoNW1kgzoyyQIhfkZbvpJL0+Krgd2p3L7T2216DbAuicouvlVVCnWKi
         7LtO3KdOwkkxQ==
Message-ID: <ff07aaef8860fb28fd939f01c5c3a56c@smtp-cloud8.xs4all.net>
Date:   Wed, 27 Jan 2021 05:33:37 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfK8DxMEX8pvQSpGmDyUdYi4ZT07wFSNA8Z3gOS+Gjk2PNep6Qd7bbd63waGlnHwznIptC7YVOGgIkWUSP9hV82RVtNGtLC65bmOLNfCCPKWRIYu+LChQ
 gUpzWFepAfAEsl8Kfg6Xo9wZFH937WHbvU4W/dTak5MRgie2VHsg7yM2Kgqk/4QscJRkejxBGetEN3Sj/vDm+f2+AMRwQO9kDKsqL/GiT1ZSH/rnJAacxGly
 mQazOKnTmYjxeVS9FBO51w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Jan 27 05:00:14 CET 2021
media-tree git hash:	803abec64ef9d31ba068088e90fc20556ab5f605
media_build git hash:	f6e3542673d19355e8e42be40f5fc78431d611c5
v4l-utils git hash:	12d47944e2760e3af7028b4484ef15b0c0763a81
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7087-gdbdb27615
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 01932d8c0f1bcf9780263707cc9aa0af06014d36
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-powerpc64: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: WARNINGS
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
linux-4.4.238-i686: ERRORS
linux-4.4.238-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.238-i686: ERRORS
linux-4.9.238-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.200-i686: ERRORS
linux-4.14.200-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.149-i686: ERRORS
linux-4.19.149-x86_64: ERRORS
linux-4.20.17-i686: ERRORS
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.0.21-x86_64: ERRORS
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
smatch: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
