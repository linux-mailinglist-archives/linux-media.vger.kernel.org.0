Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C01A302148
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 05:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbhAYEli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Jan 2021 23:41:38 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37791 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727083AbhAYEld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Jan 2021 23:41:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3tgFlRE4YiWRg3tgGlevlp; Mon, 25 Jan 2021 05:40:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611549648; bh=WE6nJoG6bubh2EVnvCAMukJAlefe7XYOgefd7UoLKn0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=PmGqPyVjrYKrBl7iuCb1JOXizg6w7BIzJ20tR9n7Nld0WKrA/S5WLu07qEq134v5j
         E/7gMBsYIF7hrRaFTcFZCnFuNnlwVeosHE+GLU+he0wTPsUpekzAU8n/qZZTkSAF4H
         7fHkYCR9qWw/zNuXhCwwrf28xFgFS9UqA7fi/omUulyBkP9apcNZev8I11QC8HncS4
         rHQjqxq/v8TBExmxCdzzkDa/fYsVunWtn7szPA2C1CLNVHUvUj+H76FwaY3bO+KN5f
         /2nE/RakhEO8BQwrua73DzOtBUe6OGAUdiUCbVjKTHxI1+Iv6zzbZs95jR8qtVK1/q
         beYKtsPfymUsQ==
Message-ID: <06247fc65e68a06336468cf9f37c97e5@smtp-cloud7.xs4all.net>
Date:   Mon, 25 Jan 2021 05:40:47 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfFINQpDqJ6cO7IJdRa1u5BX6WgYJKpAcapEZLxRgKFaE/hZA5aN+T7ZHPjPiNL2Tpxq7Q00JpU2gQc062mR8cJbNnggdf2ug6Sp/iXAuYNQfNzx1rPOX
 gKTJ1crNfYK7+01IGfiqc02gGgPjztx/SscqNGMgoCiPnsVBXA74j4rXLVOPdO1BEemjMLlnFvNf5atGzwXNAq5C22jludzV9FHOQa7k7zdxwc5QTr1jZD4F
 uFJp8enZYfblc57WRDz88A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Mon Jan 25 05:00:11 CET 2021
media-tree git hash:	066a94e28a23e04c0e9cb293f9ead56d409d7e41
media_build git hash:	f6e3542673d19355e8e42be40f5fc78431d611c5
v4l-utils git hash:	6053dad4c63a063fcd4714c85fd9dd10fe07f93e
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7087-gdbdb27615
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 01932d8c0f1bcf9780263707cc9aa0af06014d36
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-x86_64: OK
linux-git-i686: WARNINGS
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
linux-5.10.1-i686: OK
linux-5.10.1-x86_64: OK
linux-5.11-rc1-i686: OK
linux-5.11-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: ERRORS

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
