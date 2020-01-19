Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C158A141C05
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2020 05:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgASE4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jan 2020 23:56:04 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35309 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726060AbgASE4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jan 2020 23:56:04 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:7d55:a26b:259:ec12])
        by smtp-cloud7.xs4all.net with ESMTPA
        id t2cxiNbMirNgyt2cziU39n; Sun, 19 Jan 2020 05:56:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579409761; bh=wntmLR5Mokmdqt6rekvLkEnQcZ2d5XHJ+UYSQJFFOIE=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=PWmFCON41mlGJdl4Zn1WtIFBhm4tD3GNNiBHQsv5hIPbldEIRxNOAXLY8IENTRKzX
         zsizNoI9/7/G/aRz+x9cPral4O1nCYscAlzjc6EFFCvksaRg/OyltmRDhHniBwLK9h
         IqkyxuX/cVW36f4N8orwoNO28LJ7IoP/xSn9AsufuNHwomSABAAv/Aa9M/X5lpd5sf
         Fbl9VJ0MkXuayu+zdSvwS6yqBWBUpZipkT8mOjRmrHFITm42g+7O00fBcsl1LrV3x/
         JzLVQGgWZDfjmJ1yS/R2zu0wGnhNq79worBdCRAjmjnIFSf1wWl4LdDXSc9bP9Ep8U
         3hlJawOA7ddKQ==
Message-ID: <e58f572b7f8fdeeb1f38d03e77a37ebc@smtp-cloud7.xs4all.net>
Date:   Sun, 19 Jan 2020 05:55:59 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfE4BEaeVtDWOl48+IArtEfN/8KQkjE7HBJ/XIUxYBj5M1CJ0Pn64/CQqkmZ5cJWcg4na/yb4w64RvefT9BUj7ulSCNndbHZB5f0JJO3oRT1CS2+wXEjk
 Bxtq1pH9+gbQ1SYNXdhKZp3BZYXzINaet4PJhKVkBwZS7eAMnvss36fDF7XWWXNJxEnorYQP8mmqhPMkCMAyPghae+gEyrYHMSQgD5g9feQI+aVm9D+5VOc3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Jan 19 05:00:10 CET 2020
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
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
