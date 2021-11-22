Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6953E45892E
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 06:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhKVGBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 01:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhKVGBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 01:01:15 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C69C061574
        for <linux-media@vger.kernel.org>; Sun, 21 Nov 2021 21:58:04 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id p2L0mopgx1HGJp2L4mx3Np; Mon, 22 Nov 2021 06:58:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637560682; bh=XxilIWSD8YfdRoJ6zNpdEoHE6SfLqM7pQ5keTAnXkDA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=jsk6x72MZLRtUX2ejDtDO+3VoYONdq+uDDGddzpoU6masg9l9VL2cm31BeRKgCSey
         kXK29hQzHJLvNubwi95JgHXEWAeTkW1WviU/spzy39gWX3meXmxsVKFmIOzpKaTvVI
         +BCxdfohrctKdm8YtGBYS1a6lpRCh3p+SgIjBERjaah9A/6Q0XwhHU+8KVq+AIsLRD
         2cde1//2eTVMYPv7YJIMvR2crkccZOOaz1cB06clPmJuzQppVg7jWWiFPC8CZg96E8
         2cuAbV55uNDJBSXNGVb0tyCrQ/E2gdY8NRoN/WqlqEjqeI08+cQJVyKj9520EH4LJ1
         OF4lheNFjlcBA==
Message-ID: <ec7070e898586c84e8ff45c73650cae9@smtp-cloud9.xs4all.net>
Date:   Mon, 22 Nov 2021 06:57:57 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfPXFHeC4CxtIma77+luohbHSu7uRPdL+bycAPHXwLxhwoyURsPuUnJLXYuxytPoIbpnB7g/0zwEZvEKhVE0D6wwnPm7Dv73+ietOqsap+F4L2u/6ViOj
 DirW6xnrVeTYuNGZzpK1G4wma+odeXHTv2Y/xdF3XbB/NorbW0ZYtCCzUUk18wq7Kb1RsQGi0q1shQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Nov 22 05:00:11 CET 2021
media-tree git hash:	e594cda5f8c8e34ac6444166418690c65bbda47f
media_build git hash:	90bf75007a9f73a3bfd144cae29e05229e702035
v4l-utils git hash:	b949cffb419ce76e8a66f83d62f2011c682f94d9
edid-decode git hash:	b00755e34eb12aa92416aaf1bb7b02603131afe0
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 8316772c4add75a82a86054e3f1c63b664b6542f
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm-stm32: OK
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
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

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
