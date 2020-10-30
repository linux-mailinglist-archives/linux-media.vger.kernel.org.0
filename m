Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E57929FCB7
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 05:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgJ3EdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 00:33:25 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58249 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725379AbgJ3EdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 00:33:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YM6Kkm5uRWvjMYM6MkGCI9; Fri, 30 Oct 2020 05:33:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604032402; bh=+0es4iCwQRgsHBNODRXEjLTPsPUBpWXY15/XsnBfij4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=pMicz8W3FdVHPCTwJN2EJ829FOlRIlBeAD9YoRNMc4hBh4+eKslxWGjnYXSQNGRKE
         FtWNtNo8E18f4oWYxbKcq4U/6hNgfyoovUcmszlqkMlDamAH6e9KxB6KCNnmzw1xHc
         M0IBpnEUoyCMd9nMoP9m8tS5/I2lcgt8cSD2VaD8UbHvrDh3vgaNhLE86wvU9bpuzD
         LFyBUhtuCrLFdsOkq+drvC5vi/OVeB7y4WM00Yhs61kJ7hk2PduzsiZrWpA0ORp/2C
         5DeOTgIr/+YZ1Tdby6JrVPZejr3mnSD3IQyuUNyQWqvNqGUf0q76MP5APIHNw7ovyG
         V9erFTMT8Q2oA==
Message-ID: <ae78f911803fb2806dac4ef5ccce9356@smtp-cloud9.xs4all.net>
Date:   Fri, 30 Oct 2020 05:33:20 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfOxCWwD/e0Y/LmQLj0QFq8LlUtTPdOlbhpJakWD0TcWOIF3bViJhLelZkuT11ugWRtpYmZArwcPCnjM+fnIMUoHbiQHVh/Y7SI6QVv2RbLrvQ4guvh4V
 ijkaULo5yFvrXYr7WaoAESpo3XXlVVAcE4CNltp3u4lfJQahoLLyLm/1zuglfq+tCz8wY4COUVEsDY4cgVgH/rbnA8ShB82TmfgOSrjsOi9r9folLG8hTkDu
 fyuHsL3Fh8e7ze0M3JAXxA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Oct 30 05:00:12 CET 2020
media-tree git hash:	dfe3d19bd092cefb184c6e65b881602c793edd33
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
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-mips: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
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
linux-4.4.238-i686: ERRORS
linux-4.4.238-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.238-i686: ERRORS
linux-4.9.238-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.200-i686: ERRORS
linux-4.14.200-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.149-i686: ERRORS
linux-4.19.149-x86_64: ERRORS
linux-4.20.17-i686: ERRORS
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.0.21-x86_64: ERRORS
linux-5.1.21-i686: ERRORS
linux-5.1.21-x86_64: ERRORS
linux-5.2.21-i686: ERRORS
linux-5.2.21-x86_64: ERRORS
linux-5.3.18-i686: ERRORS
linux-5.3.18-x86_64: ERRORS
linux-5.4.69-i686: ERRORS
linux-5.4.69-x86_64: ERRORS
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
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 3
sparse: OK
smatch: OK

Logs weren't copied as they are too large (6236 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
