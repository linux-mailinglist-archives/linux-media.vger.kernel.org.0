Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F366E31041F
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 05:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhBEEkP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 23:40:15 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47127 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229586AbhBEEkO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 23:40:14 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7stvlKYIvefbk7stwlsuZC; Fri, 05 Feb 2021 05:39:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612499965; bh=mFVTbZeQ5shKSdhwqZF14OZ77SS/m4xz/qsO3OlMKac=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=ffXqdO7jM3OLBlmis6+FT7T93pjtILyqy9RaDd50ScofZfNZR+DZ8ZgXDI8rQBPcg
         sfB8A1zsLlX82q8op+63DqekLbb7BH8fKY+LD3zl+s7cf6Lt472sgnkQ64nw9dM7cD
         HCzCwx1WOatSr+QPIhRB40lCe2Z1uAcitiwaLIGXEDsn63TERuoQ4IeUOmLl9oM+Ha
         r2QgfkiIsBcyVdhQTPzT/yxTwbvoSEx1NGGTYtUBatUBmpkkUvyfaCzkfMwv/X/qM4
         zN67xmqS1LIlp9uoARD668gxC9tDIYR++KcenE6IAGLz/Kmab/C19Jl5RYcmdQy/TD
         Xt0QitAxvwYJg==
Message-ID: <2d24109dd5c88a94d6f69569c9dbe101@smtp-cloud7.xs4all.net>
Date:   Fri, 05 Feb 2021 05:39:23 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfEsaX5HhmqaFOYvvrpf6y+svAkY+YZE5H0C/h0MrYbksjYvL6pwVDewCvBTf352HGsZZOw6zt5A4ztlXwMlb41cSgYI93kuhZt8pSogr7vVeiYs+rfIn
 XzXGDZy65tH76+FbBV+dgqLTvejzRb+qYsQhqyeBKQ6xI2E+6JcBnBINa7zrEOanU302/DlMAG5rSIFQJgaLZxZyKS/nA297lV99f/mllWGx8MNAcTF9MTES
 oKVSLFRMAkjOaqe/rkWbbQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Feb  5 05:00:10 CET 2021
media-tree git hash:	0b9112a58836ad6a7e84eebec06a2de9778b7573
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
Check for strcpy/strncpy/strlcpy: WARNINGS: found 0 strcpy(), 1 strncpy(), 0 strlcpy()
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
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

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
