Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A254E336B33
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 05:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhCKEkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 23:40:13 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49617 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230052AbhCKEkG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 23:40:06 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id KD7DlMR7sOruFKD7Elae8V; Thu, 11 Mar 2021 05:40:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615437605; bh=Bm2K+AoIVpDSFL+N8ALQCyuAIc1vbeK+MUAo1TgJpZc=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=OVk22ZckY30OXv7uP+xhOFBDmBrHfmRqqiMSD+dcPTVmG+/FEYdTCS9qXeOFy1ua9
         rR/fOmXGiO1p7ZR5OX3v6nk6bNjz/SuttOglHwQ43a9iD6YkjLRpDZlqyXrfoCHdzy
         DtHHnW/GefyaYFKcVSSkeofKmCEOlZdR/66eM9HkpV1eVXt1RyXWl7PzG9YjY9j8rq
         1lfQhgNopi7UGrS81HNGoh4x8epEc1duv5V6SP/tQBFVVRo0X4MaGO+6gxY0FC5I7D
         kt/6Cp2h57VupR5dPbZdOHQnLj8pB7oKF7drdqoEJShhoMQuDoEDVwc6zphnxNmpMr
         1Tvg33CDki+FA==
Message-ID: <2e57087cb56022c0b50dfec8975496af@smtp-cloud7.xs4all.net>
Date:   Thu, 11 Mar 2021 05:40:03 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfOLZ2iUcHBQg1X7q3JM19x9Hfb3pdFbAmyJq1dD/7s+4U1swBQdbtlQCMM3WKjrX7L6vB5L13P+F3sdf/ZfBR8DWtmunBH42qqQ2GIrJGel1ZutsvKT9
 mude/vRkziNlcdj8V4mbR6vMvYN743QjrjaxTI2oPg/PgXZLA+5ChjF0FwXJBaxFoUkd+wybJLik0EypR0KajI+9p7vq9DFzABLyHdn+pax85G02UvCUau0L
 v2l6e9FcY+IDK+M3Uhp7Ww==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Mar 11 05:00:12 CET 2021
media-tree git hash:	1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39
media_build git hash:	069192365e2cec8b47f6e6701fb2aa50f763c602
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7413-g9bb66fa2d
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3ce9a878c7e648b006568e3fa69a2c4fcd251925
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.258-i686: OK
linux-4.4.258-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.258-i686: OK
linux-4.9.258-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.222-i686: OK
linux-4.14.222-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.177-i686: OK
linux-4.19.177-x86_64: OK
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
linux-5.4.100-i686: OK
linux-5.4.100-x86_64: OK
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
linux-5.10.18-i686: OK
linux-5.10.18-x86_64: OK
linux-5.11.1-i686: OK
linux-5.11.1-x86_64: OK
linux-5.12-rc1-i686: OK
linux-5.12-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: ERRORS: Final Summary: 3023, Succeeded: 3022, Failed: 1, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: ERRORS

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
