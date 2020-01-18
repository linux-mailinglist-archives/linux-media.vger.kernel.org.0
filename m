Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB84F1415D9
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2020 05:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgARE4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 23:56:24 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:40213 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726897AbgARE4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 23:56:24 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:38d4:d3e1:202c:da17])
        by smtp-cloud9.xs4all.net with ESMTPA
        id sg9kiTgizT6sRsg9lii4W6; Sat, 18 Jan 2020 05:56:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579323381; bh=lZu6D9+cSEksNqp2UEUdvvh4P/sB9zscPp2qQbslb50=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=fDYme5PnSFDho9bx7LLtBR0DK6Y56GtmdiGSzmAOSm6feumTtd+jadJr82tI6xtLa
         P9vMoQw+ORInTDX3hsTBSBZSUYO67IewEeOkgiN0NuEzZ6xxTaatezpQRwuEZp8qRP
         N8I40FEKRavIJV/G73jwzdPOZZr+bafwj39MrHeBApe6dOXASnDwRvqGWdWeFKRQdy
         VyiHF8dOQyH9dtC1Q9ANbMmGt1Cw5jYI0jM/FzL6BmudO57Ay5txJDCj2DGFfJ98bf
         SQYj3mfrvhb8HgTkgSDUhMww3MEqsFuWBtxjkwKkx5hgm1YdmcjuQAJLKB5tSO+yb2
         rOXIR1aK6DpEA==
Message-ID: <96c8659ecc0c129c8e08f63480c748c4@smtp-cloud9.xs4all.net>
Date:   Sat, 18 Jan 2020 05:56:20 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfMCD4ZLt4JnWarEFLSzcXsfCvbUjxxQVXHUQbcddCDwSt+hehEYtU6mLBZ/iR5wWCAQhvwQI+EOwifdKNJ8uggLIQKqKng1kDgWligXD7F02LXyLg+5W
 +ZV84hM7GQhrKoiMA7DK6pia3KQuslCve14VVoMUHguDCqFBlKmt2NMimNMrgDlqZPf3vHRED/1bWF9rNUm/YPzyQzYOAoLyQW01esmylSacZdRfhnYXKl/u
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jan 18 05:00:11 CET 2020
media-tree git hash:	2a0a0bc7020ef7e66c9569d8229d79fa72e3d659
media_build git hash:	a79e3bf0b7383ff0aa87ebff715ea4101eea5581
v4l-utils git hash:	ec55a961487b449bedbe07650674b4965814cf07
edid-decode git hash:	3910b4cb0841d2eafa64ba53e5b9781a2711efcc
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: eb9b2120da0c807b5a48cb872a43d111a2c3cf06
host hardware:		x86_64
host os:		5.2.0-3-amd64

linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-multi: OK
linux-git-arm-pxa: OK
linux-git-arm-stm32: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-mips: OK
linux-git-powerpc64: OK
linux-git-sh: OK
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
linux-3.16.63-i686: OK
linux-3.16.63-x86_64: OK
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
linux-4.4.167-i686: OK
linux-4.4.167-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.162-i686: OK
linux-4.9.162-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.105-i686: OK
linux-4.14.105-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.28-i686: OK
linux-4.19.28-x86_64: OK
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
linux-5.4.2-i686: OK
linux-5.4.2-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2942, Failed: 1, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
