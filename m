Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFBB29E528
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 08:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731147AbgJ2Hwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 03:52:54 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58831 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731176AbgJ2Hwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 03:52:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id XzickGbfJTPdiXziekxSgU; Thu, 29 Oct 2020 05:39:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603946364; bh=30NzcofwIDGzbDu+sa8pDDSaPNAO4UeqbO4gkoiVerM=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=gXLws0KQLlarWNVu8iiQ0QJ0VbW6dvA5wuLAaXJF31yEfyKfszZmMozjJmiOONLTQ
         JWubvAMBjLe5VnxZ3mhtnSowuEEodAJjTG5RICOZMHprE6BbV4eEVHyNRfGCIIahrL
         1u/e3j/munBB4q20Aj5fICw6XPuPUyJbBtWSuHJQ+qNMBxGAXeuXb7CC7N4ZPCBXWA
         pk/06XOvd+/LBo/cMX5jf8LOuFICw1G1dCUNcnpYpOCbIbcVEOCG34E88f+InFvWrH
         liM9uej++z/e0oYv/XJuUymESAC28a8i6H5BOmbU30uoAbLUNb98z52asT+QHHvyQ6
         pYLr1dVhCTmCg==
Message-ID: <76edb6352b3b5438fde9938171c49df8@smtp-cloud8.xs4all.net>
Date:   Thu, 29 Oct 2020 05:39:22 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfAaqnRXuGKH8QEedddyoZxDu7TQzu7wEQh8cIGZj+GIbkyjHqySU4LWlEQsPe2wm65+K9SQM3ym/2gvzjLcZK3b3+4m26tcOLZpKyn2iEdy2H0jchTSs
 cNAAQP17onmR8gznQ6puxrdpzx4QUGVUt77YJ5TccYDUsbSBOZt/NfK5qGB3gzT781SvgF2eClGCrjbpds9v3OzIlluODXkDJDNvLCR7j+ruX7hNaoSCtIyG
 9yCw4TRBkvAYF51DrOmV7A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Oct 29 05:00:22 CET 2020
media-tree git hash:	ce8bfbe73f1dac59377e1690c302e8e7b0662eba
media_build git hash:	e0136eadb6f4c24b7f8fcb50ef4d4d5ffb2af31d
v4l-utils git hash:	7ab86eba54233fa31344501134b1c1ab7f10c535
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
linux-git-powerpc64: OK
linux-git-arm-davinci: OK
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
linux-5.10-rc1-i686: WARNINGS
linux-5.10-rc1-x86_64: WARNINGS
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: ERRORS: Final Summary: 2779, Succeeded: 2778, Failed: 1, Warnings: 0
sparse: OK
smatch: OK

Logs weren't copied as they are too large (6232 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
