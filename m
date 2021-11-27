Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6695845FCFF
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 07:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239817AbhK0GFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 01:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbhK0GDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 01:03:07 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFDFC061756
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 21:58:55 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qqjJmGnBl1HGJqqjbm5njh; Sat, 27 Nov 2021 06:58:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637992731; bh=jVtVzPcre3TA6rGNZZlIcWdMnNzfIpTGFhziJLFkCWw=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Z0ZPS9xuUViQwH7VodJUc4r0ctCmu7ok4sq/9/9pl9XuC7tPnb4/ff/dvQZ9GLTMQ
         MbH/ff5a+78tAzcV18XmxsOdoCxqyNi7rWtlp1kDAXvpXEmxvG7VMoWI3xqNmQKevK
         bhCwXXC0pwotDkTEVJrCXI0LV69+AleKXA5uiljHu15lDYThJ2qY1avbXbmisj3WHx
         wJVO3RXkhJRarEY55GKSKoeHXCm7/uWHwqM4ZgzGeupmQ6AtBOdxo5eLoAQFWd3Aia
         6ou/zdd/G50AwYl9mWotUrOAtSm6iPcqrUJV9bTiBhmPib2fbH/sbwqHaLB03UV+VV
         a3nje/VCO0zGw==
Message-ID: <924f3d43752ef4b38b80e13bdc926cad@smtp-cloud9.xs4all.net>
Date:   Sat, 27 Nov 2021 06:58:33 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfI8QVGdwMtT0Z+AcWw/+xqYAJ1h2GqBhZQcOmT1Bd2ZHgCMbjIzlhN/RlHA5MCygTdO9d6UN/NOeJoF8pf9JrSlEzVcl80m47QsEDtiLmHMXYUEOtge3
 QPvBpC2Z81es8aiE/fpscJDxckF+4CTCEv1Ipefl4Ado7tMgiOgME+sArsu83DduhWneJ6i++rwv6A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Nov 27 05:00:13 CET 2021
media-tree git hash:	b1b447e2f3e1ec0c3e9716f4f74d056461f69ab3
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
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
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
virtme-32: ERRORS: Final Summary: 3100, Succeeded: 3089, Failed: 11, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

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
