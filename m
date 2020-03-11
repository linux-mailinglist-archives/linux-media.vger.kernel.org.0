Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99419180EF4
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 05:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgCKEeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 00:34:22 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:44761 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725958AbgCKEeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 00:34:22 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:6904:4109:ccc3:6732])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Bt4UjOOzt9Im2Bt4VjcOax; Wed, 11 Mar 2020 05:34:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583901259; bh=Kj419aI8WRkCDE2HEwk2fBtpvaP0mCHH8ocAYvCcVqc=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Yrlkmx8ftGIl5jcNnz/11TO8h1SPvhr6KkVFwS1F/wf8QviAuO3UC1JEnbojfUWyq
         3tNsE8ZYYnEG9Werw2dYDJNPI2GqRTuw4bcQSLACFff9KXnsMuTqtMvmktEWMIJ+Ab
         f4WQV3W5zB2n3Y2OVhDtuMYcfX8iOjh0cTmBL+Sxt4iCx043FVhz1rPabSpXnncjd2
         +6HszvZXbXW6lI+19gddlh+alZowMxwbz0ZTMnyOfkOIRTEgLL5aQ2PNKe1g9EjE0g
         9xb4VRHIAQVosc625WKpR/2qogUoN2PxKQk5hqabQQToTY+gYdPfNoY0hcPStB8oeV
         7I8UzlkXJTVaw==
Message-ID: <ec8aab68c3146d8a0e153cfaa84e9ff4@smtp-cloud9.xs4all.net>
Date:   Wed, 11 Mar 2020 05:34:18 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfCDV2lQ+m8dDQfO7wKdM7lP4ml3KQ9Ka7MLnm/6ZAf2Zwu4nxftmPHEBuYF2b0+0zxIvcn4bFNNAg62qHiQlcSWRAPTgk0zRMS8GmBlljsY9mkU3FGZ7
 GYnkP5MRBws0szXOBBmQn+IxId2CJ7/tHMaMyPQTZzgAbNqHcOMJepKWtqUYKAgZcSwlyuVhU5pCGjTAIatyjkEl+exGrlmHnNz8wloJ0rFztXTbZ1E/tStP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Mar 11 05:00:09 CET 2020
media-tree git hash:	00c43088aa680989407b6afbda295f67b3f123f1
media_build git hash:	6c715bb60eb5f601ae3fe59a5ec772300a5ddb2a
v4l-utils git hash:	257a454a1499ab8dbb23ff31912b2a7f61b867ee
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a9a31a4bbe5628b0da1fbc7ade073443848f3adb
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
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
linux-4.2.8-i686: OK
linux-4.2.8-x86_64: OK
linux-4.3.6-i686: OK
linux-4.3.6-x86_64: OK
linux-4.4.212-i686: OK
linux-4.4.212-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.212-i686: OK
linux-4.9.212-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.169-i686: OK
linux-4.14.169-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.101-i686: OK
linux-4.19.101-x86_64: OK
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
linux-5.4.17-i686: OK
linux-5.4.17-x86_64: OK
linux-5.5.1-i686: OK
linux-5.5.1-x86_64: OK
linux-5.6-rc1-i686: OK
linux-5.6-rc1-x86_64: OK
apps: WARNINGS
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2942, Failed: 1, Warnings: 1
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 1
sparse: OK
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
