Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDFE40F077
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 05:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244078AbhIQDoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 23:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242037AbhIQDoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 23:44:07 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE36DC061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 20:42:45 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id R4lrmZ8fLcSrkR4ltm3JF7; Fri, 17 Sep 2021 05:42:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631850161; bh=YseiUVt03p7sEY6zv+Hz25WbYW0+oiL3TPRh2Hc4Y1I=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=NlqJO2HAvR2FK2T3KwDKk34doJ1KWcA2q1tVOAORU+c29Xeu8Dz0ua7wSYJMSRPib
         kNB7v5Om8B2sYt0A8r0FKRMoeXYON0QrbOmzF5kJvVspxhvn4IDbiOuEDWDM/F/hVZ
         tyAARk+PPLWTJ1b3uIoEWCBkZmxIHLwm77gW6+gPkwe8aujOmSfcbrtcH2fkkab/YG
         TjrgoWZGLnE7xDHHOBtzEu0JtXpRGi0mfSlalj/HoetYxxcmnl14zBv3uQjidUg9pk
         SN8p5+H/3P5t1ihYkPhQpeF3YQSfE68iV74mO8LhcK/hFEhqAU0fTwMAYycMMN4jla
         mJG6TuxwWkZlw==
Message-ID: <a71efc1538b63d4ca0f0f9ebd78c9d55@smtp-cloud9.xs4all.net>
Date:   Fri, 17 Sep 2021 05:42:39 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfEPqHqQ4bpxpU64JCmThw3Lh+XvYValy6jUd7+foA+RdjTusbCigroBWQcx+Ho9+07MLLZJ9yg5KuXtOZhXA8/M0PuIflBACUsfUYRIwOjnbiPlaLQTz
 sqIf4U2tFDRueQdNjYrCzzIa5b1oh5C7Tqv38ncp4Tf/EOBsyrZGj8yE6LBuX8czXlkCdzDVIHda+vQcj+esS/dbBrWzv77JXX7WEJAih3OZ0q9wJe0q/x3S
 S4ReVcpgnik/205ffrQYWw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Sep 17 05:00:14 CEST 2021
media-tree git hash:	6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
media_build git hash:	7253675c65ed84dc294ef25e2af873e8092be48b
v4l-utils git hash:	1874b2d0dfbb8a38b0c8b75a23a4b9a60e52fd6a
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7593-g7f4b93661
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 8f230e7be768cbdfab869697ba0a2c622a4a0cae
host hardware:		x86_64
host os:		5.13.11-marune

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm64: ERRORS
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: ERRORS
linux-4.4.283-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.246-i686: ERRORS
linux-4.9.246-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.246-i686: ERRORS
linux-4.14.246-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.206-i686: ERRORS
linux-4.19.206-x86_64: ERRORS
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
linux-5.4.144-i686: ERRORS
linux-5.4.144-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.18-i686: ERRORS
linux-5.8.18-x86_64: ERRORS
linux-5.9.16-i686: ERRORS
linux-5.9.16-x86_64: ERRORS
linux-5.10.62-i686: ERRORS
linux-5.10.62-x86_64: ERRORS
linux-5.11.22-i686: ERRORS
linux-5.11.22-x86_64: ERRORS
linux-5.12.19-i686: ERRORS
linux-5.12.19-x86_64: ERRORS
linux-5.13.14-i686: ERRORS
linux-5.13.14-x86_64: ERRORS
linux-5.14.1-i686: ERRORS
linux-5.14.1-x86_64: ERRORS
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
