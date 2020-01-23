Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7658F14613B
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 06:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgAWFAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 00:00:50 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:49759 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbgAWFAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 00:00:50 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:1bd:458:b834:7f13])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uUbmiJXMapLtbuUbniOIj0; Thu, 23 Jan 2020 06:00:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1579755647; bh=J9gopQhVShd7mpHC4A+CxOHLcmpCafPGgYDBphkHoFk=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=JeR6g18G2Nbjd9MsvVZO7rVmSQ+oimaGuTRrf4vzdAPK29BJKK0ulpSP65fTSjKrh
         YgGIdb9e6aTVSqVk4qpm3wYzU5wg57YjrT6BiGzwwALcEU8Gb5VpgHH4QkUMIUWZBg
         fqmqpOM+ooxzHM2pjaWL4+8j/iRmmG8f31Vg9nrOM/WuRN5aAqoTX68fQFBkifv0Gn
         4X7+BDJ0lelza8WshnPvANA0dkc7xbKkBWVaTZVHHqAvQhiwY3fO/tfNuRcLNSBcTe
         i1oWwlcxpjBgwPQqbQn3qxaftR+PAK9Vq+2e2z25AgcaEHTMHeHayy/JNo8AGEfG8m
         BqLSlyCI1QQfA==
Message-ID: <3a50b1ec31c87389be5d30e8c9bbbfca@smtp-cloud8.xs4all.net>
Date:   Thu, 23 Jan 2020 06:00:46 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfGYGmIlyisKgfvV0bbFhpHlqcotlkh+hAnEmxnIt6Tk04AKSwbrRgkP+GGg90+dL/AYqDX0xaZB9g66d8vwkSTEKy+fVAJRMPiVZ3W0s7sXuEviS1qgt
 aSpo59HTtEZScpM51lwed/18906A7QXDzfAqQnEYy/J3/mHekZOLCIVAXZ5onPvWbCeNeyuFDaPKMFDiKIzdYjSHvU0jQgJnx6/W6egauGSTwIrV97RpoO5A
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Jan 23 05:00:12 CET 2020
media-tree git hash:	2a0a0bc7020ef7e66c9569d8229d79fa72e3d659
media_build git hash:	a79e3bf0b7383ff0aa87ebff715ea4101eea5581
v4l-utils git hash:	63b02ae9492f89ec2ea5f12e322761361dd28233
edid-decode git hash:	aac70db18dc91135966a7bb7953203596a6aaf10
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
smatch: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
