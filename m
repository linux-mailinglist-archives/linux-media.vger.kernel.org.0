Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035A52AA26B
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 05:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgKGEmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 23:42:01 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48763 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726880AbgKGEmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 23:42:00 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bG32kP7sbNanzbG34kuYLd; Sat, 07 Nov 2020 05:41:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604724118; bh=7YSjYbiqimXdBUcHSGZ69t72pBcODN5dBFC90PWtVP0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=nAVkSYa96Yyb6CDiSr/+UMrhDZ/b26ykRaDZbvhnrVmVZTUSu8cgIECr4R/DB0Cnd
         /DUPHQ9GeuYAYcFwhbIU/SvZ4IOmBVH0+4yTJ/KpJC1nUfoIErdARAXn8Faob7qnma
         38PoNwLrBOkNDLe3ijVS3YZ/Vh2qNTYk+9Kiy5QTI6z6FSqTM9lU2im31WBw8sna2w
         u3xlphsxaTlLp9EdninNfAhJHGkGPyeZCEsUaZSaWty5ULVc2nnFzYY0eLyAErlFfh
         /q9WwvbVbrRODYgdcrcEOP3obQRisJFuuB7FLtac72A+27J6s94gCXUo1uZ/s4ISWt
         Eca2MOkZuMW7w==
Message-ID: <4f3f4d99f50e736ff7c9ca536e8a48e2@smtp-cloud8.xs4all.net>
Date:   Sat, 07 Nov 2020 05:41:56 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfO6zCj0gLe2g9HPRInxf5ZaBKiEuiBhG7tO6inRhJkUB4LLO95Dm4hQCLLSYFAZxgfKLrH43pYlHChF3Zp1lE8T2GtP+1PpQlVmiXMNn0owkiXih3Uuv
 L3ljq4TKm3RaEulAZ0TGYAOR6kpmpK2eq/0yaDfzX6LMzXXyctqGlkHNhxY8PpnpDsJaB0YGSMpsYZy2EeeidhH7SpbkXhVYabq+Cioncq9bd1w4sRWDK6VD
 JLMJYnXVaR5zaDCHRMqOiw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Nov  7 05:00:13 CET 2020
media-tree git hash:	0ab4f9087ea94ff92dc2ae68180faaf6bd443021
media_build git hash:	f35757b57d73086429b0b3a8ebfacbf3f4df8c56
v4l-utils git hash:	57451f856524bf2b02ffe8e43ba2709a72cdd4f5
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5aabc25fda7a7122487b4bd429b4c635cb4df7d7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-powerpc64: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-3.10.108-i686: OK
linux-3.10.108-x86_64: ERRORS
linux-3.11.10-i686: OK
linux-3.11.10-x86_64: ERRORS
linux-3.12.74-i686: OK
linux-3.12.74-x86_64: ERRORS
linux-3.13.11-i686: OK
linux-3.13.11-x86_64: ERRORS
linux-3.14.79-i686: OK
linux-3.14.79-x86_64: ERRORS
linux-3.15.10-i686: OK
linux-3.15.10-x86_64: ERRORS
linux-3.16.81-i686: OK
linux-3.16.81-x86_64: ERRORS
linux-3.17.8-i686: OK
linux-3.17.8-x86_64: ERRORS
linux-3.18.136-i686: OK
linux-3.18.136-x86_64: ERRORS
linux-3.19.8-i686: OK
linux-3.19.8-x86_64: ERRORS
linux-4.0.9-i686: OK
linux-4.0.9-x86_64: ERRORS
linux-4.1.52-i686: OK
linux-4.1.52-x86_64: ERRORS
linux-4.2.8-i686: OK
linux-4.2.8-x86_64: ERRORS
linux-4.3.6-i686: OK
linux-4.3.6-x86_64: ERRORS
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: ERRORS
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: ERRORS
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: ERRORS
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: ERRORS
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: ERRORS
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: ERRORS
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: ERRORS
linux-4.20.17-i686: OK
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: OK
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
linux-5.10-rc1-i686: OK
linux-5.10-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 2
sparse: OK
smatch: ERRORS

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
