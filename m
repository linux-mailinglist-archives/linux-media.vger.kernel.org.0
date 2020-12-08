Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC332D222E
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 05:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgLHEl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 23:41:26 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40791 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726028AbgLHEl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 23:41:26 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mUnqkKOJHarN7mUnrk1WfT; Tue, 08 Dec 2020 05:40:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607402443; bh=9dKlcTbeTRRmMvAsPGVKrmfWfSKyXA5+lVgNLiPTrME=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=f6yfKfLc2Twg8eGiDUYmsv1fR9JI9lGCk2Fb90is7pWhg7SoCnv0JYHPCcjobtJPD
         KEf6MRPGyLELdJPDwptClQJ/EnRZnqBuIkc60M4kq62mWSM3oLgKA6wf2daPTMdmhv
         +Q+eOu+HvJL1Sb2pcrTJ+X0pimizlnjJp7rICFh9J9Ez/M0R1i0akwL6OA5MDmw/LT
         /umQOSi+eZRteQ2r0g3QXZ3MMCBy0r8wElgOPjhY5iq/tkMlQULg1saoOquWXg9azO
         FfFZ1uE/zxjpSqsYDpLJvlN3ee/1+1xGMEWV3NnNYdP6y/s4g/DxSLhzXGraBueqIZ
         9/IIn2EB0Hk1g==
Message-ID: <1ac32d6b40934258a8792e349eba54cb@smtp-cloud9.xs4all.net>
Date:   Tue, 08 Dec 2020 05:40:42 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfIE5zrYX1PtddMYej6A4yaKs/BgSUJF1lDJDHdquubW7l3dOBU+Z8PwxEUrZX7HIoY1nCefNvnrBDWCb2pY5T5C6NWsuJpQSuqkDxeBnuwlyOsWqjMpz
 brvCU7doSEx1+mmRRGisVoFJjxUeG6zZnoP9qgOBkHwmYLboNnR0NLQg4wBAZfNB4KJFb/IKaCs5nQAVGommQHggp5i5tyYBzNzZd4wNbz+S9b9DVCXTmLdu
 1tfPVS61hCrans7RcRAmFw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Dec  8 05:00:13 CET 2020
media-tree git hash:	7ea4d23293300ca2f225595849a4fe444fb80ea4
media_build git hash:	7263ea8c29df8c6d5c903de0b1e50d1dbf9bf80d
v4l-utils git hash:	56175f62bef28490aac748ca2edbc5908df928ff
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7041-g6193b3b71
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 77c8542b1c2caa2a7e96c4dad0335336b522c616
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
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
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: OK
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: OK
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: OK
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
linux-4.20.17-i686: WARNINGS
linux-4.20.17-x86_64: WARNINGS
linux-5.0.21-i686: WARNINGS
linux-5.0.21-x86_64: WARNINGS
linux-5.1.21-i686: WARNINGS
linux-5.1.21-x86_64: WARNINGS
linux-5.2.21-i686: WARNINGS
linux-5.2.21-x86_64: WARNINGS
linux-5.3.18-i686: WARNINGS
linux-5.3.18-x86_64: WARNINGS
linux-5.4.69-i686: OK
linux-5.4.69-x86_64: OK
linux-5.5.19-i686: WARNINGS
linux-5.5.19-x86_64: WARNINGS
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
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 2
sparse: ERRORS
smatch: ERRORS

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
