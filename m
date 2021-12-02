Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60DF9465DFD
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 06:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344972AbhLBGAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 01:00:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhLBGAw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 01:00:52 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A039C061574
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 21:57:30 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sf5ymfJa9f6qjsf5ymFXHh; Thu, 02 Dec 2021 06:57:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638424647; bh=JspbDFTfkruxHVgFgOWrcwl0jDsblcntHF5j3jbS3g4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Fhoyqintazm7rvIzmc8vRreIWq+z+zQyfJEgi4kyh30HPMtkFG0XkSrsSRuT9lXD9
         dIMriBPDATr5WogO/etzFbIUCchq36QFKbUDex7oOV17ajEzIRlulf/9Y/thQybmMm
         K05o8G4B5KCNHcay+gSerxSgGyyt+pAfGJCugxM0rSYqliGUWCPRjAffw9FiLbI9F9
         Ut5AQpMLsQZvIwvF2Ba2tDwClOG7guZq1H6d30spsf1NGiVPzKUqBNxYJF0AEKSNbL
         DaHdQcioK6lMoZ1cG9XvYGC/rVwT48ujo4Knejxe3khjAmuo2eN8KbKqUEpa3NlRVS
         +mcOKs5NgEycQ==
Message-ID: <3c5d1193344b5abee16bd6f029eb5a67@smtp-cloud7.xs4all.net>
Date:   Thu, 02 Dec 2021 06:57:25 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfOiD11qWY2mcAhWxnObit02BDxgeUwuWDscGy8lamRCs9XRGdMI15sCc3AhSzH26s3z5hTyy/2DGiev449YBatE26L0/sZlA47nHvCVJgVnz3WIol0aF
 4EeGiAcZAo6QqEaS8wIrbJZuxF5iuhrCQ72BD1aEwK2k7eSm29/cI9Z8cET2N2xwX7XEOiCgPPmpHw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Dec  2 05:00:11 CET 2021
media-tree git hash:	8cc7a1b2aca067397a016cdb971a5e6ad9b640c7
media_build git hash:	90bf75007a9f73a3bfd144cae29e05229e702035
v4l-utils git hash:	c01c6f78adde6ecfd0ef800e381aed27bea7808b
edid-decode git hash:	b00755e34eb12aa92416aaf1bb7b02603131afe0
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 7696c77a86087f681c8864e9ed957938d5b69aaf
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
linux-4.20.17-i686: OK
linux-4.20.17-x86_64: OK
linux-5.0.21-i686: OK
linux-5.0.21-x86_64: OK
linux-5.1.21-i686: OK
linux-5.1.21-x86_64: OK
linux-5.2.21-i686: OK
linux-5.2.21-x86_64: OK
linux-5.3.18-i686: OK
linux-5.3.18-x86_64: OK
linux-5.4.144-i686: OK
linux-5.4.144-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.18-i686: OK
linux-5.8.18-x86_64: OK
linux-5.9.16-i686: OK
linux-5.9.16-x86_64: OK
linux-5.10.62-i686: OK
linux-5.10.62-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
linux-5.15.1-i686: OK
linux-5.15.1-x86_64: OK
linux-5.16-rc1-i686: OK
linux-5.16-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
