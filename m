Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D1411A3A8
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 06:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLKFIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 00:08:42 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54825 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725768AbfLKFIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 00:08:42 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id euEoiTwiSapzpeuEpiOlnL; Wed, 11 Dec 2019 06:08:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576040919; bh=xwT8KuxGQvxj83EyYlkN9tgOWAeAnjkZOsOONVsKK4c=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=U78f8VKzEiVFQkGwlQj0bHZHaqg8EnDCZFboyZcMRvzVsRMm6Am7zNLfATrvM2q38
         dSCdoPjxzUdGZtJMDSLPoJ1O5AdA8TVZZ5cO1oGtABiI8u6qYb3hqrHyPiAw7v6wrt
         RSqI1l3pZbYtURqNz6rxeNYotZPynaxyIcRNQI6O/nlzUyoG2GCwESWeCgd/ZzgfVo
         KhXY8xVXAxwWbRrTqMhjR+e+2c40y3V2porVqGK/6Xn//dCaSvNu85SrNRWd2VzlYU
         dxnVz3PpB4ZZlDFn7/UvzIwGor1KwoiDDKxZk+ejEP5vUXv+NP7yYeutm4ZMmkZNRn
         qTWXII+jTv1ww==
Message-ID: <66864b645d50a0988be36b380eca66bc@smtp-cloud7.xs4all.net>
Date:   Wed, 11 Dec 2019 06:08:38 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfNrwuCLSsjTM99AUa96gUB3WhG7jx8likBOWmxY7r2YJ19Vjp0agdN0H5RBrXCoOIgn33YO7ehcYAZNKLEilUTRvVZqQCVqcuyzTd2UC5Bga0VgiSFl+
 Fp1G+tgbpVDEnv26XFOUWp5DU/v39/gyAjLnPhs7aNxsOU4fhHuaVHTHWBjsMONCZ4sFWiDLhL+bL4KJTujJKTfn5+ki8lI+fruo3YDYR41nyTZtZocmDFNt
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Dec 11 05:00:10 CET 2019
media-tree git hash:	2099ef02c6c024751e4d16ace67dd6b910c875e4
media_build git hash:	ccee44dc23da091e884e2cbdeb3b8b2271cc3095
v4l-utils git hash:	cb0ec2fd537333a62fa0d8e4acded7442851e956
edid-decode git hash:	e719d04077d098eb51d9494f41060eba2419d4bc
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
linux-5.4.2-i686: OK
linux-5.4.2-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2793, Succeeded: 2793, Failed: 0, Warnings: 3
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
