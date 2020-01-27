Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 206AB149E85
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 05:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgA0E6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jan 2020 23:58:10 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46941 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726670AbgA0E6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jan 2020 23:58:10 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:3881:8f74:9b39:1bb7])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vwTOiIqhyT6sRvwTPi6VP7; Mon, 27 Jan 2020 05:58:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580101088; bh=hY7uVPINhQV8amd7XVAjXJhENpyIdiZLh0NlJvEGCEk=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=R/v3Ukm79vON0oFhWhP/Q32CR5E2LKJpQR59J5IxBIQ6wxJaCVdim24y4UMbixIrK
         pv9czN1mwZ9prQ/5RjcsLkai3EDNnV9sy/CEyDK/M43Xv6oB5prgx2XCz1hdlbzdbF
         R+sCeW7SBTYhsvRWxC60mkhfslIl25BNoHWGv7D3mMo14uSwM+bQmZNZewVhFyQQin
         AizFokVVhqr7DZazilLL+eEU6A0q8dV7Zx/qG5Z1lNGfxfdGs0DSKCDIv2UUc68bGc
         KgjM35p2IJaS9+0qF9JQ49gsLwm6j/8kslH2dVABR5FfPAHx6+08AR6KPbm34D6Uyo
         CZs5G0LHYZJ+A==
Message-ID: <3ac3677178eda9449a5bd1b075776e22@smtp-cloud9.xs4all.net>
Date:   Mon, 27 Jan 2020 05:58:06 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfHTnLJei+iYZIRifsUsscKa11EbtKLjkojKGVRFbFs2EHKsNivYB+uIdy9lrC6rjMEyR4X1CaAvf/357Xd2Z6hDDG+NBhHYZKZ/qAYBZDlbqGvfqzeQt
 dXqECVl3MzkJ48F4Ux+bNOA29//H8TTyqo4u1sLSN0YHid/Q+J3jfDDEZfsVNUD/NcXioC1Iu+WZojj2tzhzDkpVp+h7hbWss7eKMCrdg3NWoOgxBvdUwoMd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Jan 27 05:00:12 CET 2020
media-tree git hash:	1697d98124819aab09b86602978bd4f50e101e2d
media_build git hash:	a79e3bf0b7383ff0aa87ebff715ea4101eea5581
v4l-utils git hash:	5af0730d06247a2de487abf2e00e70b156f1fb82
edid-decode git hash:	a6b199e94e62bb43d5856426187ef62e3851f780
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: eb9b2120da0c807b5a48cb872a43d111a2c3cf06
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
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
