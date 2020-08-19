Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21200249360
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 05:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgHSDTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 23:19:41 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48073 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726605AbgHSDTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 23:19:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8EdUk07vnywL58EdVkW5dh; Wed, 19 Aug 2020 05:19:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597807177; bh=GzY2Hy+Nj7J8je1zxyQne91WBUHfF3Auii2vvLn5Um4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=ZjEljvYwofPNL5STyH+fi2L7G8pyBIiiyTMoLOcjYrJ+FRCXkXAcLORBfwyGZ+hPI
         mPHXJ5CdCmy8xDSKLsKezJLiSjOp2OBbJHP968PRejWqMHcVEx1ffEdaYjiPCIhqwv
         WuIDWEW/KYJ0j4Y5C74FxKgZ+aeE9dJmEC7OtLXrQEvTvS/rwqbUVSPTtK75pUCjgK
         qZLpM6IaBUWdO6C2ww2CbI86FH0R8+pYb172+WEPd0J7uWF1/YSpZ6aKqxOGOH1vms
         fgR+lRsfvLSTU+I+qxzt9TkQlPQhZLmg/cdtb0dbuVjhcifQSKxvdjx0EFyGzRVI7J
         JLTIFCjfLs3HA==
Message-ID: <f11a05e4e80e218998bad53286b81011@smtp-cloud7.xs4all.net>
Date:   Wed, 19 Aug 2020 05:19:36 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfPfzlRjXLzhGXaVpd8jsV+ZFQJXyoMJOWToEIOBtItRFAXBAL7SJa89vpHZHZsBxIBX2MoSmJ187P3wd+8hBe1LrSNkmKXOEGQssHZBFvF7EkBH8TyqR
 QOpCuRzRiBriUvXrYTMIFuj9df5W2E7am97LJvDag7l96GwYfX1phqWKdsqYmpdMPGm/SoDkSG6rJp+fOtKQEWDU0zSnyonmRKYsW/ToMdsehc2nIuLRIzPo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Aug 19 05:00:14 CEST 2020
media-tree git hash:	9a538b83612c8b5848bf840c2ddcd86dda1c8c76
media_build git hash:	ea2766f182b3a4e03543be2ded0845fca4d4fa80
v4l-utils git hash:	db3112262c84813e0d2d095be020c5ca0ae32e93
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6381-g344ef612
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 1276c1355abc12c391f3d471acc71d55421b87b6
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA
Check for strcpy/strncpy/strlcpy: WARNINGS: found 3 strcpy(), 3 strncpy(), 3 strlcpy()
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
linux-4.4.212-i686: ERRORS
linux-4.4.212-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.212-i686: ERRORS
linux-4.9.212-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.169-i686: ERRORS
linux-4.14.169-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.101-i686: ERRORS
linux-4.19.101-x86_64: ERRORS
linux-4.20.15-i686: ERRORS
linux-4.20.15-x86_64: ERRORS
linux-5.0.15-i686: ERRORS
linux-5.0.15-x86_64: ERRORS
linux-5.1.1-i686: ERRORS
linux-5.1.1-x86_64: ERRORS
linux-5.2.1-i686: ERRORS
linux-5.2.1-x86_64: ERRORS
linux-5.3.1-i686: ERRORS
linux-5.3.1-x86_64: ERRORS
linux-5.4.17-i686: ERRORS
linux-5.4.17-x86_64: ERRORS
linux-5.5.1-i686: ERRORS
linux-5.5.1-x86_64: ERRORS
linux-5.6.1-i686: ERRORS
linux-5.6.1-x86_64: ERRORS
linux-5.7.2-i686: ERRORS
linux-5.7.2-x86_64: ERRORS
linux-5.8.1-i686: ERRORS
linux-5.8.1-x86_64: ERRORS
linux-5.9-rc1-i686: ERRORS
linux-5.9-rc1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: ERRORS
smatch: ERRORS

Logs weren't copied as they are too large (38216 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
