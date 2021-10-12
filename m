Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C28429BF8
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 05:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhJLDbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 23:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbhJLDa7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 23:30:59 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1B9C061570
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 20:28:58 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id a8TEmp5Fdx7rIa8THmKj2K; Tue, 12 Oct 2021 05:28:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634009335; bh=GiJTyR6lhuuKmf5KjDLZTY0b0JI5RCU8wkcyTuupJak=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=voy8qIJHjdpDhgXMihZLKMKurDgsKyZIcKw7x3y9U7VvH1Ukbvfjd3xZnZlhy9f6i
         dQZ4pPGL+e3iHSbsadb7D3Mm0od3onYrSMTtldvLE4klVh6Zx+yvfWlHesD+fkBPVP
         tDqL1+QlNikxqFvK/i0oR/3RsFBL1fo3U2t4dHH1+3pZZjxMRPowir1Y3QswdZeORc
         zbhwXBxoq3T58j4PwG/Nl7X3j5ZeLKSr89pbrld3ciO68jX6MR2UuLpsDypS6cIbUW
         O5zJ74zBlFgfXfgtGgzMYiLHA35Ltvr+z6YQKkpwTxlNJ9Xquiqk8oxb4Rmi9Olxnk
         NV3FMCdtuyhDg==
Message-ID: <3fa4f39255f938b73a6b4cc6398483c2@smtp-cloud8.xs4all.net>
Date:   Tue, 12 Oct 2021 05:28:52 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfKQXi5/YDCvNTk0j6Ce2/0Jgrw+Gu+lobmUw+Irixx3iZeGvLdn9RrlooeuPSN4ZlwwWAAKUTnveWRHUO1cynSTXiWCsNBKmu9/zdoQ30UVFrZC51p6g
 924KZBhf9K7IMUsSO294JtXCh0LA74J1IKBeGLhRE3hL9Afj1lB1/FLzDB3mvNe2QLiQftfI/KBsZA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Oct 12 05:00:13 CEST 2021
media-tree git hash:	fd2eda71a47b095e81b9170c3f8b7ae82b04e785
media_build git hash:	e602a6acc36ed3f6a8ebeb27fae6f32712f1293f
v4l-utils git hash:	493af03f3c576fad69c050d33215d1f4fc0d532d
edid-decode git hash:	84ddf9155376a6044f729ce6a0e60639c26aed2b
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: e4afb8327b212acef552ccf22044f77bd6ca304b
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-powerpc64: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: WARNINGS
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: WARNINGS
linux-4.5.7-x86_64: WARNINGS
linux-4.6.7-i686: WARNINGS
linux-4.6.7-x86_64: WARNINGS
linux-4.7.10-i686: WARNINGS
linux-4.7.10-x86_64: WARNINGS
linux-4.8.17-i686: WARNINGS
linux-4.8.17-x86_64: WARNINGS
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
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

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
