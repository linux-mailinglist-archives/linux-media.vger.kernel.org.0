Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778071EB3D0
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 05:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgFBDgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 23:36:09 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60161 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725793AbgFBDgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jun 2020 23:36:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fxifjffiSNp2zfxigjd3vQ; Tue, 02 Jun 2020 05:36:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591068966; bh=B4n7B8ubAtqNxaC4TLljlyHrtjWTydMQ5In+1pehlpU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=CtYL6OfP96rq1462ix09L78VXHtji8UXE+FoKwAMiN6CTjvtV6Ho83wQIj1+GlKf/
         4AcKuOaJVATw40Rz0jzLGkY70qy942ywHd021LrKIz39LvCFI618e5ZolTxbtz9Lxt
         gXbv8awgCesTxIgsnWk3usuaGsFo80wI/vEPpfXI/frobWCdMDKtY566xLrd8w9Wb7
         mpmB7VbX7QEL0hicIV7/LC73nTnmlAN6lGdlPYTfIuT5fIsSUpfakXYWuDGG2VYGoz
         nuwLPeMXrovo9bJWpqrgipMkJjd+Kbx6cmVpdOSZdArHw7/YR7XJsz3skor3RqzX0G
         ZzuwH+I4559iA==
Message-ID: <6f8a0905c1bc2ea9429ef5d263ab506e@smtp-cloud7.xs4all.net>
Date:   Tue, 02 Jun 2020 05:36:05 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfMRFjET1o7qY93disC047WOfJCs0xTQVMqeK+yTlPSp14Yg638Kp8yAwgzmpEoF+Ky4z6q7jIzRYh5X28mRWuR4XrVnMXF5feB8XLRWdi0vUux82saQi
 WcoMNIJ/BQfK5EofyybNTprK5cH9pjb+e+tL7Io72BXcJ3jfna/UTwlScBSMDqomGX8iXlDf1JiDYOqeMeLz8NdV450EUeQ5jiRXaB4KJjgxQqmzCHmyXUIA
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jun  2 05:00:12 CEST 2020
media-tree git hash:	938b29db3aa9c293c7c1366b16e55e308f1a1ddd
media_build git hash:	7379d9e55aa05cd53f3dceaa5e0278e93db357bd
v4l-utils git hash:	74377da4f5f3b63203c599d5dd75db6af91fdbb9
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0accb575719caa47d8fbc866b11e6f7e7e7787cd
host hardware:		x86_64
host os:		5.6.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: WARNINGS: found 4 strcpy(), 4 strncpy(), 4 strlcpy()
linux-3.10.108-i686: ERRORS
linux-3.10.108-x86_64: ERRORS
linux-3.11.10-i686: ERRORS
linux-3.11.10-x86_64: ERRORS
linux-3.12.74-i686: ERRORS
linux-3.12.74-x86_64: ERRORS
linux-3.13.11-i686: ERRORS
linux-3.13.11-x86_64: ERRORS
linux-3.14.79-i686: ERRORS
linux-3.14.79-x86_64: ERRORS
linux-3.15.10-i686: ERRORS
linux-3.15.10-x86_64: ERRORS
linux-3.16.81-i686: ERRORS
linux-3.16.81-x86_64: ERRORS
linux-3.17.8-i686: ERRORS
linux-3.17.8-x86_64: ERRORS
linux-3.18.136-i686: ERRORS
linux-3.18.136-x86_64: ERRORS
linux-3.19.8-i686: ERRORS
linux-3.19.8-x86_64: ERRORS
linux-4.0.9-i686: ERRORS
linux-4.0.9-x86_64: ERRORS
linux-4.1.52-i686: ERRORS
linux-4.1.52-x86_64: ERRORS
linux-4.2.8-i686: ERRORS
linux-4.2.8-x86_64: ERRORS
linux-4.3.6-i686: ERRORS
linux-4.3.6-x86_64: ERRORS
linux-4.4.212-i686: ERRORS
linux-4.4.212-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.212-i686: ERRORS
linux-4.9.212-x86_64: ERRORS
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: WARNINGS
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
linux-5.7-rc1-i686: OK
linux-5.7-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 6
virtme-32: ERRORS
sparse: OK
smatch: OK

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
