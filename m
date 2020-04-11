Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC8511A4DA2
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 05:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgDKDfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 23:35:03 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51021 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726659AbgDKDfD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 23:35:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id N6v7jFh26lKa1N6v8jxfPN; Sat, 11 Apr 2020 05:35:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1586576102; bh=tjdu0bLkCYNRckjSv2Io86NbB84OQZZL+KS748IA1jw=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=P2eeXqJ1W1rdNg3b/d8N2x2oz70pM0KTyY7GzANx5klkENJleAKjxO7lnOscyrwo4
         D5E2GqsYqAblr8Q4F+e1JUtwjkQmN0qpIQPXHKjy5UCiMQ31HcQH8bezlxSoGhOBQv
         BwDZbxrS3rCoycXDztkf3XHZOaXIS7KCn2pVAHTd87/AYbwT3hYoeOjSeGksvJRwNH
         PZ6WDrO8OwKW8eHUL/9nSVOWfLoaeIKVOv23LxQ6ry/38IFiaiz8JDhdhuv+hFgJSQ
         qvRFubVyfogaUusvvrmFR5JbppFz3pvzZM5u4+2VR5ltQFX25ZrkI96hpC0k8alUTP
         u1tHf+CoQFDGQ==
Message-ID: <90e656b0a6e6aa3bc20ea707acc77bea@smtp-cloud8.xs4all.net>
Date:   Sat, 11 Apr 2020 05:35:01 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfNDEW/s1PaYp61EjmkDN4P9CHuPbqgYHHaEqHLk9KsbhUEFqW6sMxVg3exJRKUMGNe/gEWkyJFvvawTWGiODyw5ng3jo7VbPEJQA6+eEumJ7PG8iQJHe
 M39j5IpTyotnLHREBP14+/bVlPe4v5Y9SwAJI8hXmAgWpBo5OF4Tg1w9C/iafOqegR9zwwBX+xpLbkfklnOpvNuNVkIkIpHtU+kBsQPoflhCYPu7CYmYDwsG
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Apr 11 05:00:10 CEST 2020
media-tree git hash:	2632e7b618a7730969f9782593c29ca53553aa22
media_build git hash:	5e1b2e9e12ffa812f69a15a56786f3e41277bfba
v4l-utils git hash:	8b7e6ce9367fe09ca9398b5f3cc75bba2598b162
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: cbd8bfbab9e84c54e1f1dcf8c172c400a10126df
host hardware:		x86_64
host os:		5.4.0-4-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
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
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2942, Failed: 1, Warnings: 0
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 1
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
