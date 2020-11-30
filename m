Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E2F2C7D96
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 05:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgK3ElA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 23:41:00 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:53929 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726415AbgK3ElA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 23:41:00 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id jaz2krcHIN7Xgjaz3kgvSn; Mon, 30 Nov 2020 05:40:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606711218; bh=Xfn3Uyv43tQSgoyetI2EYntUUXGlaqcvFhV+D39iVbc=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=TZGgwi1+wAjKbYpbOjDm3SL8G4b8twAPgmUNqG1BYAVRDWLXZR15+T0k9gDVNAk2j
         h73HuNgMH6qEMU9EwgmJX32OTPNWbfyV3VporY8DwoHb2Eezxv81RtsEIdQ0JMuyRp
         +0eqQw/+tUZns3Bci7ABYMM0MX1/EHYgh8eXrpQNcsv0CBcNMK7s3qkGYF+zVklAib
         1d0zzuNYEY3gsWKvRYBhvkIzjqVDX7UHhDKUU55Cmk9qC6kE5z46npzf+32xlcpVQY
         ee0FJrx6eA0hEHWWElo7CLTot6vnJRfbtzq6yjjwbXlhx70J9L0DQQ2QaNQ13pN0Si
         F64b67w9nHPpw==
Message-ID: <65ad0cc286213442a00961e935932040@smtp-cloud7.xs4all.net>
Date:   Mon, 30 Nov 2020 05:40:16 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfNxZgYEq4pgA9VIf8mSThkZE2D/wPr+FwZi///m/PLFcJ1bFqkV1FYRmWcFajmNhefFzUdG+DE3+RfEoxHH99YqksnExDi50FtDXjF58uPj7zfAjEOJ+
 62bd1jinVj2QN5Gp9xXD3z0iqvoOFc6uMj4Kunkpn80e+xTmpzkOa3fSh3XzIuVO0YibhiZOk7svPXdREIrTqTKi+X6gsw/FNHvd+OhvwVtJ2CzCkgeITduK
 SU88rIf/zqkLTaqLxnyfqg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Nov 30 05:00:13 CET 2020
media-tree git hash:	a3f132df0e5f25399c9592c2d14997975ddbf290
media_build git hash:	efebcbca1e44be2502829ae9bd9a9ff90b90e310
v4l-utils git hash:	11da65eee7a271bba3f21d8117cdac428fe3a91e
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 63a52153f10bfed851877e415b3507560c94cfd1
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-arm-davinci: OK
linux-git-sh: OK
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
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 3
sparse: OK
smatch: WARNINGS

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
