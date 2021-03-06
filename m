Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C002F32F839
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 05:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCFEiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 23:38:02 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36449 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229781AbhCFEhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 23:37:50 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IOhEllicQOruFIOhGlKMLh; Sat, 06 Mar 2021 05:37:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615005466; bh=cGxgjaIcswCjOkm/ngYBSOltVp9SrxkZvwwOTaTL2xw=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=FX9EMyFPJLKUTSCqBn85B8ktsPqrniQEYEiAw6lOLUU3rAGlCvAkK49UVwUoVsP34
         je3SnEKbl5/LU+yrXH0pijyrImhYcroOJ6/ZP4Q4jj2rtPaAvLdZlp7bI/auYHziOT
         FEHMyxEjJJjYog3g8HRDsobQTL/By8exOE97W4IPblbecbxis5ypacw+Q3OLKlCt5C
         npDIwECG0BEXnTThTOAHGqwRyv0vyxKMltK4SGyf0fpjG2XX6yTAGmVUHnRFgKsODG
         R0vmN1zfpByh6YgJjo3ot6raT/AMjC+0TfdbV61aJmCvx+XX8Q5YFlXCfpXSDzoNQQ
         n+plavIQD7Unw==
Message-ID: <27f9913367b4b29fb41621434bd89639@smtp-cloud7.xs4all.net>
Date:   Sat, 06 Mar 2021 05:37:44 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfMLGSn/m24YsK3drHMTvM7O0F3G5QeSfACNMrY5uL5dS5sx5kz2krby2SAVwCJbbtqIGOR2xQ1ZrMj+z92m707CEQUq/STdLEZktnRcYGhO4V2eu0/Vw
 OCFCRtboTA+bksXJFoqBWfbR+3QvWwxlOieCG+JPlw4cpfJDcHIcplT0IowVB+g4ck12fTN/kW4VXJlQVxFgIUS+jgI63//l5QJw0kXPKwcvNZ9lOlVdz+Wu
 b9+RwrtXfQz5D+wKxKeMyg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Mar  6 05:00:11 CET 2021
media-tree git hash:	2842027ffb066b62467fde803ecac8024b0fc51e
media_build git hash:	15e45b4b4577c1d87159511c11a959fbd49d1671
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7413-g9bb66fa2d
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: dc364825a5c13e4eb4c2ad6da1f08a0e67880b58
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-pxa: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-x86_64: OK
linux-git-i686: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.258-i686: ERRORS
linux-4.4.258-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.258-i686: ERRORS
linux-4.9.258-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.222-i686: ERRORS
linux-4.14.222-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.177-i686: ERRORS
linux-4.19.177-x86_64: ERRORS
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
linux-5.4.100-i686: ERRORS
linux-5.4.100-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.13-i686: OK
linux-5.8.13-x86_64: OK
linux-5.9.1-i686: OK
linux-5.9.1-x86_64: OK
linux-5.10.18-i686: OK
linux-5.10.18-x86_64: OK
linux-5.11.1-i686: OK
linux-5.11.1-x86_64: OK
linux-5.12-rc1-i686: OK
linux-5.12-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
