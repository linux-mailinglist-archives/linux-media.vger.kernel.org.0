Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD8F43AA9F
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 05:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbhJZDNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 23:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbhJZDNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 23:13:44 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2913FC061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 20:11:20 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id fCrqmJRgQFfMifCrumVaqs; Tue, 26 Oct 2021 05:11:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635217878; bh=Ur/BXSbiUwuSQBoRfhNrmBf3hAD8ZUjsOM+Zjb+rHCw=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Nbwcj88LLmkaNbNNMjC1FjefSGbj9hfF4bwL1Mokr6KCUucrvXDfNkOoSBUNcGeMk
         lL3M4wO1h9woBESXiR8yw4eNZENjnNn1EtMQCR+2fiClXVfsr+rrUjwGVRprg+NVDW
         XWjTqDzRqTJrSeeiGEk2/Fp4xyWk3C/SDawaFaC7gUg9XagTcsld7QXL1V/LuEunuR
         +I9UbfJhS/YYgCnanBvzawWe+5Qbv3gwSjE376S1yjAg48JvcRP/ri19CVc42mMz0u
         ntFbG0+7HxXFf/jjUZw1pTGZRqPrHyxtkZCf1fKx+OCBwtDCxiF1M43q6yjfn3wCx/
         csr6ZInd+ZJUw==
Message-ID: <ef4e3657fc84c7f84f5fad90aac94a09@smtp-cloud8.xs4all.net>
Date:   Tue, 26 Oct 2021 05:11:14 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfJMzJL86sVcyJ6+QwaA6S67ygkq6rDmjPtsGl0DcSfiII3JGYJZFiHAswkhXGJPrTg7NmU+ouHFACj6491nJOO8ygqWIIVd3g9C5TbHJPdS1eFRXLapJ
 JTvdx8w8+8MVs+lUm+vXhzUEI6TeGzTCPoODPIZWt6SLFBlvBZsnbCW5R/mlLheQyx2qsXxYINwHng==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Oct 26 05:00:13 CEST 2021
media-tree git hash:	bdbbd511ef0cf414b3bad89dd8fd7b6a169b4a5e
media_build git hash:	e602a6acc36ed3f6a8ebeb27fae6f32712f1293f
v4l-utils git hash:	2549897336e8af49977f19aa5888d12d9269cbed
edid-decode git hash:	1f2a7af287d9f077a05d524d974503ef131b56dd
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: f1c67b200f199ca44b793327582bb643ecabd35f
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-pxa: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
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
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.246-i686: ERRORS
linux-4.14.246-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.206-i686: ERRORS
linux-4.19.206-x86_64: ERRORS
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
linux-5.4.144-i686: ERRORS
linux-5.4.144-x86_64: ERRORS
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.18-i686: ERRORS
linux-5.8.18-x86_64: ERRORS
linux-5.9.16-i686: ERRORS
linux-5.9.16-x86_64: ERRORS
linux-5.10.62-i686: ERRORS
linux-5.10.62-x86_64: ERRORS
linux-5.11.22-i686: ERRORS
linux-5.11.22-x86_64: ERRORS
linux-5.12.19-i686: ERRORS
linux-5.12.19-x86_64: ERRORS
linux-5.13.14-i686: ERRORS
linux-5.13.14-x86_64: ERRORS
linux-5.14.1-i686: ERRORS
linux-5.14.1-x86_64: ERRORS
linux-5.15-rc1-i686: ERRORS
linux-5.15-rc1-x86_64: ERRORS
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
