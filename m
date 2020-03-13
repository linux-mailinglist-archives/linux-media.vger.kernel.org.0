Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F2B184009
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 05:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCMEdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 00:33:35 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:42963 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726208AbgCMEdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 00:33:35 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:854f:e244:406:37fd])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Cc0pjeXEY9Im2Cc0rjoIv4; Fri, 13 Mar 2020 05:33:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584074013; bh=nKds90v5VOrIaInmHwg8r0mby5IPYlBNK+BMJlXvY50=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=KDQjPR6l/WQv5uwynGeJJLjyYRCb+5pG1TolIN+yEqCGODNB9Ab4inZz8LjmMjoV/
         cYbN+GE9daNFBSyFYFODPbf2HtTf/8IOyo6N/6wHXSsNoM6t8YBdQn9Ozi/kW/AmY+
         ACgi2ZaliPdiQtKwvjaJPSTrmqXaJ+XJm/ZJXRroNT+k7c0WMrvUZJaHShKTedF/s6
         7VaxQklSPorZo4ePMG1/HjI8XqunXzAUGXuBRx/Gae6j1ay5ipb1AxV0eXH+ZIE6oA
         T9uJdzELQYcHTiWwa88dVgLiojoj5ycXrPkEZoy0x6KnQqm6NQxv/4v5ZNUpH52P0I
         nOtT5/HvgO9Bw==
Message-ID: <ad61dff8c573f5d9e7d984f6cab03368@smtp-cloud9.xs4all.net>
Date:   Fri, 13 Mar 2020 05:33:31 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfIgiRW9favYxLe4vNEkrl3QZMInTHer8SD2Y9J0pp4rML9k90mKk8YjhvJcaR9V/KeHTcbNbIzrU3j3rJ+SYLc9yiaGaaOXxwbWZjdhIeM6EQG4vEMc8
 k0tDwvSSo0+QBdhjASjtwnVfGderTUJ5fVehN5nbmsA/d8+p0wIIg6MwXHG+MMxaxQ6oPP8HNOlXFyNsHStz2eG4QJRfO64eXsu4XU0bEnL8QnTe2n95GkSt
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Mar 13 05:00:10 CET 2020
media-tree git hash:	2a9c226da9aa997d862a22292279e806114a9db8
media_build git hash:	21551d274cb113d000f980ce5635ad441e182a92
v4l-utils git hash:	6ba235f7259281ab6326a1cc84c6231cbbfc1071
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a9a31a4bbe5628b0da1fbc7ade073443848f3adb
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
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
linux-3.16.81-i686: OK
linux-3.16.81-x86_64: OK
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
linux-5.6-rc1-i686: ERRORS
linux-5.6-rc1-x86_64: ERRORS
apps: WARNINGS
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
