Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B5015894A
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 05:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgBKE6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 23:58:17 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:56681 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726219AbgBKE6R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 23:58:17 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:59b:9f2a:47ac:4926])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 1Ncjjw1e48i431NckjEP9j; Tue, 11 Feb 2020 05:58:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581397094; bh=28e9kI8Z1kG8yRf9izz1yYUDyeljL09wvudxt2Anlu4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=v54sUESUV4R+E0U3InS2Fkzp8oyygkH+o+Gm1bcTAiLVM1CiAL1d9kcZS8sSPFtm2
         71e3zlq9TBge+dS1yz4R1TadoeLGcl5sRTT7czrpsAyJFuqDY0wzliWUo3s0H+YZUt
         5PkCkIrOXbUvDudkNuC36I7vMyDrVfuDQ5YXEq/W/oycnr5+NhzTjmluKIu/lMhB7/
         +MJS4ZCvy+P1W0tV00MzYJ3s26gommdaTzYlzfebyZhqYE3cRTYy+oFgr5wvrr8fei
         798VBftkbv+nq0ioyDDsoKSKEDK8PBPmNwhLNUy2IXebcoNUX6sumdYr6xdu911fax
         +AYsC6GIFylew==
Message-ID: <c7e2655eb962ed217506deeb36a41c25@smtp-cloud8.xs4all.net>
Date:   Tue, 11 Feb 2020 05:58:13 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfJvjI2yPmxD88no0Cg7BxJ89o0xIre16jqX80PTPLs+BdwfGhANPxYHA4qnVt51u5PO0qVUmllmrb+9At7HFmKDd1JKXcUNKZrZ11H2TOfK87rU9MVGy
 wbLyORaUCNWlYup6xLVLLOuXO8jBvD77tZxqZDrvU7xR/lQ+VmJY1GD9yQfTMZvnveJNWBvdD0HeY9rwlxGdF2I9qLQziejZ06JXar4INey25WMq2gBWumJU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Feb 11 05:00:11 CET 2020
media-tree git hash:	1697d98124819aab09b86602978bd4f50e101e2d
media_build git hash:	7ffbdb070fc7ce309f16549d7ec8a82c8abf6ce8
v4l-utils git hash:	b62d322d4401e6b6e5cbd78cedad9eb69dac1324
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3d3588941cf3abd517734f6448eeaeaa0c61a27f
host hardware:		x86_64
host os:		5.4.0-3-amd64

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
linux-4.4.212-i686: OK
linux-4.4.212-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.212-i686: OK
linux-4.9.212-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
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
linux-5.6-rc1-i686: ERRORS
linux-5.6-rc1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2939, Failed: 4, Warnings: 0
sparse: OK
smatch: OK

Logs weren't copied as they are too large (4120 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
