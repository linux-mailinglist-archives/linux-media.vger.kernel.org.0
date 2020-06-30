Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1105020EC15
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 05:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbgF3Dh0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 23:37:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:55325 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728949AbgF3Dh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 23:37:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id q75Ej3iolxmkVq75Gjvu07; Tue, 30 Jun 2020 05:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593488242; bh=rIzyu9VP+/iiDKFeNZepL2k0wh9wW1xIEsVktXj6uJU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=lySbKbsOtppwFfXaqzBR14qRtNRuad1E3uYDdsMjIp4+3qO5FCwDW9Tx/oqhSFL1j
         zWMW/9DQVhXeOxAWobrqi41DJaxrq3UgD0fqTzMdc8yzfcIRqPCbyXhTQlSMvUn28K
         YxWENyzKakz+MH4FZVH71TPe/saHdkfrjs0XpyHhw1D5fvrQYGjgsXeydDWeuQpzTb
         wu1l3nDDNp72Z5E2HyYhJPGgAiWiGW9WbcIfqr8CymSD0MTXMogOei9o96HmoSJq6C
         Fdu90FyLeG/vrRUyTS4pcyRZtFuuRJYW0t4KkDudYYgk/6UoC5BHvsuf8O/cR/THb+
         e+VarhvQ/JMiQ==
Message-ID: <e9efb40bc8366b70dbf0aa6881b97b87@smtp-cloud7.xs4all.net>
Date:   Tue, 30 Jun 2020 05:37:20 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfJEa3ce11XkLnzZ/iMb/Hic4jW8fimlYiOdG8u6ED2mcVDuR3LraHb0UpIA6AuqW3aWNF4p6Vl0+DeBT/ozlLGmd1CqstBB7Zd1XSd2jeDF2hhJYfgUC
 4AywRi7KyUwXqevO++ZAELkvenbVX6oznB4xUeJvZ7ioHOJz6Uh8GdAKnLscccFV6RDVu6UeVXYlyjOTbP4oaB6IJoUnsEYM556xF2JFGnx9UkOZdpfMYZQd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jun 30 05:00:10 CEST 2020
media-tree git hash:	e30cc79cc80fd919b697a15c5000d9f57487de8e
media_build git hash:	39a7ce1e32308668ff1493247747e26b4367c6fe
v4l-utils git hash:	eb147329b96b5d8f8f3638a159d1b3bcec22f0f0
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6154-g2f65f604
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5540ce1b67f5015886e850a4775d2eace9efe922
host hardware:		x86_64
host os:		5.6.0-1-amd64

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
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA
Check for strcpy/strncpy/strlcpy: WARNINGS: found 4 strcpy(), 4 strncpy(), 4 strlcpy()
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
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
linux-5.7.2-i686: OK
linux-5.7.2-x86_64: OK
linux-5.8-rc1-i686: OK
linux-5.8-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
virtme-32: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
sparse: OK
smatch: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
