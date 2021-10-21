Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACD44358F2
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 05:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhJUD0x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 23:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhJUD0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 23:26:53 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A006FC06161C
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 20:24:37 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dOgumgteZUo2HdOgzm32B8; Thu, 21 Oct 2021 05:24:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634786673; bh=V6RGUF1dX2p15WZ1BCf8nMzyhZPIfltvtmb3/fH5BS4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=TE3Wx9zpvYs4BkzuC+h3S+FmF7V2GJ5H4JN3/b0NjYfZxrl38GZVnqZInia1XVtly
         JHjHZn876aFgOzmw9njgLcVvmukaR9yVAamJSScbrT7yKDKr7TxkDwcE1pi8snbLTn
         N8BKzOBvRppDwkbT6NtDTClUz/HMa3Fob2qr57zCYvfoeVLKEurUxWcVknK/rnRJDT
         AqabIEIWoOMqL9DRBCu4uPsCk4Mdf8I8JgSL2wvlzegLX1AVI2WULk3jAasZ8c+rCo
         aC7O51GOTcQngxsPmIhtrrQmB6FrmQXYiMYWa/PrQb1xpMEFy1uOgOSZmx+jXCsphx
         WItx5QNTpdUIQ==
Message-ID: <451b82e116c762dfa96ca65e4be12e16@smtp-cloud7.xs4all.net>
Date:   Thu, 21 Oct 2021 05:24:28 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfDq3mVTGzPToOrIxwPq/DQKNn4kzsNyBysnTS5uI3JNBFI9dbOzK6n7lFuSLAw++E0O4pUS6GiY28Bwcay6cjFh2lvuYavboX6zuqRcvb26HWP3K9JQF
 dzmnvFzTno2xVUHzpJhStTkuuAb9VGIE0aCjniDjS4u0+u3Hj0j0gXVtkxNskBNfaSvaxZgYodgD3Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Oct 21 05:00:12 CEST 2021
media-tree git hash:	b35d3fea2a39c040ae1787d9544b24e5343b0645
media_build git hash:	e602a6acc36ed3f6a8ebeb27fae6f32712f1293f
v4l-utils git hash:	9f1d1e0cf8dbdcfb8bc6d817734d85417960a054
edid-decode git hash:	1f2a7af287d9f077a05d524d974503ef131b56dd
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3e03ddc26ffb1808285327d1a7fb2038379d04a2
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: ERRORS
linux-4.4.283-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.246-i686: ERRORS
linux-4.9.246-x86_64: ERRORS
linux-4.10.17-i686: WARNINGS
linux-4.10.17-x86_64: WARNINGS
linux-4.11.12-i686: WARNINGS
linux-4.11.12-x86_64: WARNINGS
linux-4.12.14-i686: WARNINGS
linux-4.12.14-x86_64: WARNINGS
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: WARNINGS
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: WARNINGS
linux-4.15.18-x86_64: WARNINGS
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: WARNINGS
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: WARNINGS
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: WARNINGS
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
linux-4.20.17-i686: WARNINGS
linux-4.20.17-x86_64: WARNINGS
linux-5.0.21-i686: OK
linux-5.0.21-x86_64: OK
linux-5.1.21-i686: OK
linux-5.1.21-x86_64: OK
linux-5.2.21-i686: OK
linux-5.2.21-x86_64: OK
linux-5.3.18-i686: OK
linux-5.3.18-x86_64: OK
linux-5.4.144-i686: OK
linux-5.4.144-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.18-i686: OK
linux-5.8.18-x86_64: OK
linux-5.9.16-i686: OK
linux-5.9.16-x86_64: OK
linux-5.10.62-i686: OK
linux-5.10.62-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
linux-5.15-rc1-i686: OK
linux-5.15-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: WARNINGS
smatch: ERRORS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
