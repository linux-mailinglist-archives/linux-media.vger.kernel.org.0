Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E879A3129C0
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 05:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBHEex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Feb 2021 23:34:53 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39869 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229615AbhBHEew (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Feb 2021 23:34:52 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8yFQleI2Zefbk8yFRl2m5u; Mon, 08 Feb 2021 05:34:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612758845; bh=iAwAXiNeemaG96wBkkzsdMSIoK2B5d6h1VhUMs2dDj0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=QQsbYXv4c0iMWLdgUPUVBW3knVcP1+73tfAiydh46vi/ehZty3gDXtYZS1hpY5f4c
         wfSa8Qufm170su9jdVipdw+ON5yP57/6vbBuqn14YPx1GcKiOrSg/j5qbqzp1L25ZJ
         deU3XtBG5yfCNjGvg52X4Ir4cH0r6xtiXKWIJpOTQFBozD2g6ZM4GwHXd50t1uR24H
         pTL0peWH/w8o7mennCwIwudPpiZRfUOLsEk2JuxYeEPa7Llz9jowYvOsF/mGg9Om3h
         s82yyEklC7kA3rsTT4VEV7FwKt3bbu8MxtHfUbHm/X0lWoGwG5He5FLpEifhJjZxsa
         bdXCEvzpr1ZCg==
Message-ID: <761687537b8329eec19d4371ed46be6b@smtp-cloud7.xs4all.net>
Date:   Mon, 08 Feb 2021 05:34:04 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfMg9J2cTv8URJXT+nXfW/Ye58GFUNvggjuh0jPmsOm89cFoAEgGTZn3bE8Nk6WOe4bM7EzpmAiwaO1qrRBSHtaSY/JA+X8GaLL7DUP/qxxVd0G5iYrsP
 6kPYmMF9ZNKCivlOvmyGv/QRABJto3i5eyXySjcSe1gbdy2m2aZfLSD3XqlyUv0z5YFIxedPKMaU8v2SkyVHDeUCQ5HU24FJZnZ1yblFc62xT+CWMvhX5Yd/
 ZqZczMIQYExLwUHYNfZDIQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Feb  8 05:00:10 CET 2021
media-tree git hash:	9746b11715c3949241e2d88cb9057da4adab7e02
media_build git hash:	e980c694ef8ab2b472ecc26edaf97af214e587aa
v4l-utils git hash:	733f7a54f79d1e12a8745f0804c8394ed0136eb2
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7349-g7fcfe2595
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e7b822fdb96cb4ba52d3c0c7445d3401649bacd6
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
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
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
linux-5.10.1-i686: OK
linux-5.10.1-x86_64: OK
linux-5.11-rc1-i686: OK
linux-5.11-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Monday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Monday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
