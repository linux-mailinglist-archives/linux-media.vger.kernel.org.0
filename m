Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C1D455491
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 07:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243238AbhKRGK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 01:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241659AbhKRGKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 01:10:24 -0500
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDC2C061570
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 22:07:24 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id naZpmwrNsBB1QnaZsmbGtL; Thu, 18 Nov 2021 07:07:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637215641; bh=DqqD3iNVd7BHJpY332u4dXeqCQYPIXWk1TL8CNjn4iw=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=DS8SpE/q2PW+nUw8Nr7DNNZpQ9tZzf0raiI/7Hdkhrw+baOQRYybQBrC0AZvUPIMP
         Qz9go6tc1bABdbzvwdUHhW1+JUd4YFw2sP/I/n1hI5QUNTB4k7/syAjfoG7XpWlrhJ
         YI/nGm8Iz0/sgMSTvQepOUL9yhtEQ+zYB0PmBNybr0BdE7oeoCdYsiAuv0/YnW+OXq
         mujas/dqRV1oSLfVsewd+le9CnkoSl5BpcDttMMXed/GQUnm1ap12D2ZM1zkbk7WyC
         E8MymorxkIBtN8Cylq4I3BrWs2OUYeJxIR+Se3wN7Y9qPoxl1vlb3uwvcc4bcsxoft
         Mg3z8TBwWeSWg==
Message-ID: <51c21967daf3c5e9bb37ec5ac098176e@smtp-cloud8.xs4all.net>
Date:   Thu, 18 Nov 2021 07:07:17 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfD42fG/bQYW2zdfNiFjkOYXR6++tygtpVw43yhhbzx48hzSzgqg7yDUNbZKtlW02u8m1DEAr6VRiD5zPfloYdCMrNIBcbQHf0QF1CRz/5oAfvjQ3eqGt
 VQAjJVSJsHDq8EuAiq1poGEsRP4/vvq7wzw52mRGfWNNkQx7HM/fmqJ9NLQvC/b9VDSnbMUAIqWYiw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Nov 18 05:00:15 CET 2021
media-tree git hash:	999ed03518cb01aa9ef55c025db79567eec6268c
media_build git hash:	009b2dd81c96ce392740ea4947e7c0e212e17335
v4l-utils git hash:	79b4354f1c470527ace542fa0e0e9f551aed6c62
edid-decode git hash:	b00755e34eb12aa92416aaf1bb7b02603131afe0
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 8316772c4add75a82a86054e3f1c63b664b6542f
host hardware:		x86_64
host os:		5.14.0-2-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
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
linux-5.15.1-i686: OK
linux-5.15.1-x86_64: OK
linux-5.16-rc1-i686: OK
linux-5.16-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: ERRORS: Final Summary: 3100, Succeeded: 3098, Failed: 2, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
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
