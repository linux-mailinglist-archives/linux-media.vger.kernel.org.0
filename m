Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40F63112245
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 05:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfLDE4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 23:56:11 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37783 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726835AbfLDE4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 23:56:11 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:59d9:226b:2822:2fd5])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cMhriIL2dU9wBcMhsioZ3S; Wed, 04 Dec 2019 05:56:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575435369; bh=RdAZpH4YFCFT+wbWwxZpVvEiwdnaTTPi884tUpXAbD0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=IgHzIKOxcwpXycj2BjePGc+ceQjyLNbswTSu8ISZGvLu/k8sXR59XJEdB9wJZHo5b
         tLQJ2HlzEbe48fHn1r3aC0p4tCs/2nBxJzDftI7yM9HHzEaSsM5tiw0lRf1XmOJgVO
         O2D+brIrQ6/LPqFLnpaiGYTVKXk/ULWsQghRRu+55ll3fB8NVQrmsWTBFTsSyFnqEs
         wJ+OJsbIayOirnHMh9ja6Lq5iE+pyYQtBLls6cKp/l6x1yGEYyMa+PbF/Iovc283je
         9SZiJqEi4QA4Y9y0A+9jJaIN/ylOdcm/uxZ3Q0yaJg5wqKDM1iShmY2wui+QXQQ+q0
         MIMkkvXa67EqQ==
Message-ID: <e4cec0bf118872cecbf442e4cf1a5267@smtp-cloud7.xs4all.net>
Date:   Wed, 04 Dec 2019 05:56:07 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfK22EVkDDBs6OZ3SsGxBPDxNf/nVvh5KankWbmSuWyzssI1HDUX3aRLkl5y0eeq1efqbaqfrJaMfEjUrsKQejv2Fuq8uLg1eVflg/MuMl7FbFkvimaI9
 gCRCORDyEIapZ72xYJu3THEBPjUrgMgEsjnJuuvIzGpGfjQDh3GI84h9+2ys30fTnp1DTo0n2liUksQDE7f2snGGTfqmHyLw4cjZb6g4NbH/0YiVOMLAy3sq
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Dec  4 05:00:13 CET 2019
media-tree git hash:	dca6b3733a4a46e63603496f544ece8ace541fde
media_build git hash:	efba365ba11b958a6bf6fb4b397942f9461cefca
v4l-utils git hash:	af33cc5ef00177edbb45d466faf9061197767f2b
edid-decode git hash:	4e161447d1ef2d6115a5ead939abc1dcf2bf5940
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6903fe8f5101fc43440b3259290c97d2dd51733d
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
linux-5.4-i686: OK
linux-5.4-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2793, Succeeded: 2793, Failed: 0, Warnings: 2
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
