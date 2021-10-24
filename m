Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D632543866E
	for <lists+linux-media@lfdr.de>; Sun, 24 Oct 2021 05:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhJXD1k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 23:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbhJXD1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 23:27:39 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B92DC061764
        for <linux-media@vger.kernel.org>; Sat, 23 Oct 2021 20:25:18 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id eU8EmAZtIUo2HeU8ImE1F2; Sun, 24 Oct 2021 05:25:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635045915; bh=ZPv7d6hUKMhYdW7CWEIYH/3W58tJfjdhAa8P3flzvMc=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=gpPTGEOFuCu6Edg1faUAUadUIpkPaO5zohriTtICvzqyZE38YK0/6MwcptBLKR6PF
         6NeFW3uJXBknXcTm8+OX7wJb1XQ1JTpXZUjDDh8bL740lBda3x6os8DKoFmAWUWrib
         BxJe6cc9ZOxkl+0EYgYIDB8rJlFPrNUDuyb81/vB1wwFJqUhNvgyqRFZWCIaKDylSO
         IpQVjigpFiCSSfuDnBMtAi+1yDS3Cq16/KdJ5RUzJvp7l8I1sL7mNpgh1nGFHp4gxN
         f+Im31LsDGZUyj1DizR30OYXVPGWZbzWSmja3Isqoei4hJiSxsYY/Bp53WVrNQH2b6
         3yM1ZsECg6lgQ==
Message-ID: <bd8a2787f3ade5abcd14cc366d9c3360@smtp-cloud7.xs4all.net>
Date:   Sun, 24 Oct 2021 05:25:10 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfDMgunGFbwqKXBkfkeqxaSMdl5Jkl1OF8mqemQbjrWZJEHNn7MCPccPtkJq1XNU14rBA2pDZLFJz17gFhwa9YOqD1Jw4/GdVoXVg919uB3ygZmdTzU34
 qXIWAK2oYWIdGMCplx7ZsqLJfPwiNhimOgmtj+HzEzXb5o0zgBX18SaDHOv24yhBCP10cXik7mBb8g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Oct 24 05:00:12 CEST 2021
media-tree git hash:	57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8
media_build git hash:	e602a6acc36ed3f6a8ebeb27fae6f32712f1293f
v4l-utils git hash:	2549897336e8af49977f19aa5888d12d9269cbed
edid-decode git hash:	1f2a7af287d9f077a05d524d974503ef131b56dd
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: f1c67b200f199ca44b793327582bb643ecabd35f
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
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
linux-4.4.283-i686: ERRORS
linux-4.4.283-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.246-i686: ERRORS
linux-4.9.246-x86_64: ERRORS
linux-4.10.17-i686: WARNINGS
linux-4.10.17-x86_64: WARNINGS
linux-4.11.12-i686: WARNINGS
linux-4.11.12-x86_64: WARNINGS
linux-4.12.14-i686: WARNINGS
linux-4.12.14-x86_64: WARNINGS
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: WARNINGS
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: WARNINGS
linux-4.15.18-x86_64: WARNINGS
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: WARNINGS
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: WARNINGS
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: WARNINGS
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
linux-4.20.17-i686: WARNINGS
linux-4.20.17-x86_64: WARNINGS
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
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: WARNINGS
smatch: ERRORS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
