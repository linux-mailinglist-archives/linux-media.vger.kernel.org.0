Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3435C2E8642
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 05:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbhABEOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jan 2021 23:14:07 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:45481 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727171AbhABEOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Jan 2021 23:14:07 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vYI7k3RbMjgqfvYI8kOFDv; Sat, 02 Jan 2021 05:13:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1609560804; bh=u9/+rd04qJoh/pjKF9OTdufb3brdlvIUL4/uthffJXM=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Ia4j+xrYTDw347d7SAIvGAaCfEAMeZgwW2Lxj/pmfNrwrgmp6DSEvpmHQwTK5WpEW
         35T3eQJrpTpeJQQjKPeFQ/KJcKEi0R+HvNdtlXY6BMCXAAbdX8u8WAJEWq96O/EzCn
         nV6v1i7dNTxChAzSSVPd12gwhbGIVgBCSDaLhaSAOvVHvSFqIaW5qh37cR1Nbol6qX
         3q5o669pR98TWCozVkq2h37Nc+7fGX3jOFnaoqgzZLhqSlmsIRxli+IXzWqmOBNe1s
         as4WgSzMnzIM+UYFPjyCCxsED3ABhf4+kCDomrm1x9ByTYvcIg6JFJJ4nE70Xv3ueI
         e67uhdu9NeOwQ==
Message-ID: <32951ab6187e977a828364ff86b5274d@smtp-cloud9.xs4all.net>
Date:   Sat, 02 Jan 2021 05:13:23 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfE8GWCz6Sph4/s9t+DjmPHUvgGMi/dR5VsrIpeY7WQS2Q0IMIWtbsUkaVquOOKGouBwiXzU8fVfvE/i5El1Ub4hmDBG8GtBWaeuQzdUY1AWOyLeKSRag
 gZ0SVOAUh+y5Bm8spyZx96NrxOdMbSAq8TWn+vdWl2u4Yf7jEg0qnONw5WYtIiZ3dANgLBIfUwyzSkEEY0hVzyKklPR5z//twggjpBESCHYtNuvRe1cIbMgH
 nCMI5QBuTOTqK5CuAPHbwA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Jan  2 05:00:14 CET 2021
media-tree git hash:	5c8fe583cce542aa0b84adc939ce85293de36e5e
media_build git hash:	174c4cc0037aed1f719b91dfc9e9cc09d53de87c
v4l-utils git hash:	e0e4114f971407acfdf1e8173c86e2e08fa01077
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7047-g72fa1e990
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 77c8542b1c2caa2a7e96c4dad0335336b522c616
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
linux-5.5.19-i686: ERRORS
linux-5.5.19-x86_64: ERRORS
linux-5.6.19-i686: ERRORS
linux-5.6.19-x86_64: ERRORS
linux-5.7.19-i686: ERRORS
linux-5.7.19-x86_64: ERRORS
linux-5.8.13-i686: ERRORS
linux-5.8.13-x86_64: ERRORS
linux-5.9.1-i686: ERRORS
linux-5.9.1-x86_64: ERRORS
linux-5.10.1-i686: ERRORS
linux-5.10.1-x86_64: ERRORS
linux-5.11-rc1-i686: OK
linux-5.11-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
virtme-32: ERRORS: Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0
sparse: WARNINGS
smatch: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Saturday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
