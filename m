Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9F12B2B57
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 05:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgKNEly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 23:41:54 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37835 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726166AbgKNEly (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 23:41:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dnNmkLbxJ6LFvdnNnkGnv6; Sat, 14 Nov 2020 05:41:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605328911; bh=7ntGnrHCjBwxNP4TYx25HtZwWr87OluBeJxPATmhrZk=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=QvW29DEZL3HjJ082TjoGG1DoyM1nzRdzAMlh7s8PO22lpVUJsPIWljIB2bfpp+II4
         Ig4EgpBJSN20QT7cVXMf4WxUBihJjsMUPdLCQqtqyG6Rxdei78PU7kNUIP9OHfseCv
         8oU21SlgqXhoh/Aus1YW9D9BR1v5JTe3WO07c7yRANkIOA5+Y83SWkCl8c0NV0rNOl
         5ZKkPU3Ku881DhZJiTM6XuPODbGvAwMBh/gfiDz/iEC3bUMnN8loJ31Z4bS0IJEMTG
         bCvrV7wbmIroRQy9dNIK2lHMORImJjX0b+19AA3+JlrpZ8TPp++MtUiLJ/pYqWix15
         9I73CVtLlUWvA==
Message-ID: <e2617c46a7316d467b2acb407880ab78@smtp-cloud9.xs4all.net>
Date:   Sat, 14 Nov 2020 05:41:49 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfDxsDBQfkpPfc9Fz2wrioc7KGaPp3Op8cI2ifETc6QbKLCjEM/zhuPo/kZ3ABniHccL6LQS4bAk2F9lhddVsUlupqg3058x/lZiGxJm/EyT5JTCC5mKc
 znwhzUFqITFjdjX+PWaM1TEcnjH+m4bRoYrC5wv3HDa/gmBw+n/v6RbTftARqvuQcIzZUEskZmFIuBpbm5LUcgG/QUUh5kE37g88ntGeqN0fcuQIe71dLUO1
 lncEIICTVRlno8eTATN7wg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Nov 14 05:00:11 CET 2020
media-tree git hash:	0ab4f9087ea94ff92dc2ae68180faaf6bd443021
media_build git hash:	bca336c7d6379c723eb388bb9e606db6785a953b
v4l-utils git hash:	57451f856524bf2b02ffe8e43ba2709a72cdd4f5
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 5aabc25fda7a7122487b4bd429b4c635cb4df7d7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
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
linux-5.10-rc1-i686: OK
linux-5.10-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2942, Failed: 1, Warnings: 2
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 1
sparse: OK
smatch: ERRORS

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
