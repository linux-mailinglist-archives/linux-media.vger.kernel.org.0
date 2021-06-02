Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47116397F99
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 05:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhFBDm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 23:42:56 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57963 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229625AbhFBDmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Jun 2021 23:42:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oHkjlB34zEXL0oHkmlvt5r; Wed, 02 Jun 2021 05:41:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622605272; bh=IGPculyjseYVMOEO71L1i/4lt3Dw6XN/FZkOdM18EhY=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=E2I3u0xkXDYaTnniV0SpEM4hctLbfC96otOGn2SVRHAYmvEfVTVfIkKfwq0SIUkvM
         ebWO5PaMS+siNd1roRWQCQ3nDGSi7NR7AaO6GPnCnrG35ySpaaFhU3hq0VqEilySlx
         1UzE3hQwI5hnactW4VhNNgcPksy0EOxYDxRN15hBZ6Qxk6Ug4GbchRgtdv8LeB4++D
         1PtqKbwo6JJorBvhuVKkXrJijotDy23DoNxuFsrAEIO4BcMSF1wIcHMGqI2gJaCDaZ
         cudnI3i4zByfzITU/++cP0/QeledR9Lt/E7VuohvRVcPLDqGJjZJLJqjoeshcZwote
         m+VcImthq98oA==
Message-ID: <7063d8a251ec836b7efe047a4e2fae8d@smtp-cloud9.xs4all.net>
Date:   Wed, 02 Jun 2021 05:41:09 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfFVBbb49Rp5l8QcoUdl6BomOvfOwwzYxJApPpwp/D7GBK/7/16zyB4tO14THcK+wos51s3IfI1jAmbrSTpF7Wjowa+kzFX50fW5xfmyVCzqksAdzr9K+
 QIX0i7tVPUCxFDPMLB5OyZxLG1z8JaJH+RtXKb/eeREKbAa8i85r7N1/h0CC9q8mqobYmcPC7u0cN1OlbbQ4+6Cqk8YxPwNNelSSBOrYVN9J8H9N9YcrxoEO
 q6e+ieNaAjFU8euIjNsIRg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Jun  2 05:00:08 CEST 2021
media-tree git hash:	71c689dc2e732d4cb190aaf0edea73116b1611bd
media_build git hash:	b85393d37cdac84cb846802f0d62259aa679c994
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7445-g58776ae33
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b010e650519b1cd0d44b110c056ef26ae6ff80a7
host hardware:		x86_64
host os:		5.7.0-1-amd64

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
linux-5.12.1-i686: OK
linux-5.12.1-x86_64: OK
linux-5.13-rc1-i686: OK
linux-5.13-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2963, Succeeded: 2959, Failed: 4, Warnings: 0
virtme-32: ERRORS: Final Summary: 3023, Succeeded: 3022, Failed: 1, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
