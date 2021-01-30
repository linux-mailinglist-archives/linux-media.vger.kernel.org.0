Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEAC73091E4
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 05:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhA3EnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jan 2021 23:43:00 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55707 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233585AbhA3Eic (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jan 2021 23:38:32 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 5i0almpo1W4yN5i0clR5Gd; Sat, 30 Jan 2021 05:37:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611981438; bh=PPGcnEduBcASHkX7k0OWQtVDTdB4Yy6VQc5dEFcr2a0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Cn+HxWLJe4EEwKKoy22JFrECILe9utDYe/Xhk1T2zQ3wdtrEenWIKIVZdtVirhAb8
         BphdbOA8xR1rl7wA8UnoaFWt/az0d3g0hurAIVmAnzUZbkBMsA9OIqQ5reNvwAea82
         yGHIdTcJOdtKfbpt/wbdiQgHV/Jtk3gaDSOsRZBrls21WkDfzLexFcckW2HwXF6L6x
         FTclYZYVpxRYmGe8bpSVgQn7+Wa00LHSKYyR1kqZQPeixk3KsdG17cGu6c+SbtcXQe
         Q9A8C6bsdqcNLdjvWZbe8xsfg+1ReUxXjXwrWeKS5DcVXMMX4S8VYJWYGux/EeraYp
         aD5Gsp23DZE2Q==
Message-ID: <a5dd3ab128de4f56ebd9b651bd884bd6@smtp-cloud8.xs4all.net>
Date:   Sat, 30 Jan 2021 05:37:16 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfMFoQcCwvcAll5ZiZXLbTvtqzWl9xJG63rvwzcZ1Qr2GXKtUnu+ELmEXc5P4TDgrK9U/xEzoi6xJlqMgOrjma9CcuLUsG+QqnyzeP4ns2G2HOhAkq/K4
 JEmgdYddWcp/9uhvvkCT2yEhM0ndaECcodvdHzanR1DizZ/lYWtpeXsib3nAHp7KrC9runHQjfCT83+B2li/XVet8zauZn+CzgnBicZi6ZD0DrxSxhC69UfM
 hv1W5XyRT9AZKEz3e+v5pg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jan 30 05:00:09 CET 2021
media-tree git hash:	f0ddb4e9911665b9ad68fe94e0faaaff5953902e
media_build git hash:	e980c694ef8ab2b472ecc26edaf97af214e587aa
v4l-utils git hash:	70404b870f12165278fe9ee9b3d6c7932478eb83
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7087-gdbdb27615
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
smatch: OK

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
