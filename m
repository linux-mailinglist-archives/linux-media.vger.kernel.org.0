Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9F61D2580
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 05:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgENDlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 23:41:06 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47079 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725932AbgENDlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 23:41:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Z4k1jWEBg8hmdZ4k3jW2o3; Thu, 14 May 2020 05:41:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589427663; bh=2J9hlTuO2sWWSnvdvtmzqnYSBSoP1U0kMEcGAdjlov0=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=iD40qJgodl239vp8dSffapl67LJHIlLB2HekuQj2FeexGJknBEMj8joVthJys8Fnd
         wBlhAgYXkZkU6ENZrejw7VzO4vkyF5YpQvW4GvIct24xRXpKbtQar4aFR9XIhZ6q77
         ESYFNz1ZyZRHefYeeRBwFISi+PIh3in6JYEoN2Mt2Dyi5uSyw2n1fCpHU+oNUAI8Sb
         5ZmQvYteNU+xhGkMhql6Uaie3lm7JcSXbKK1StnSPBpmC7sSiVATh7xA2UL2l4lar7
         EvUPobphuxs04khAPC+YvYBq9zJufC5ZtQOv/HKNQ8CgvNRHEnVYreHPtEflobTAhP
         P4YNOfToUbo4A==
Message-ID: <bddfcbd928a1f2bf9b72df54420fa0bf@smtp-cloud9.xs4all.net>
Date:   Thu, 14 May 2020 05:41:01 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfGFDg6Iqx1o7+u/TvKk6unVW/pKzf9vzuqnjRdB3j5O4UMnTxGyozgWtpUMEBiio+pzgPl7rd8eGfkK6tnuxLtO/4ShsiQ4OBwZ45+tek+H6n4IFaAMw
 5D43Qw1A8GNIGAo4PF5ocMvvdnwg2sDFfhYXHYTfRZlwzV16bLB27g7bvjSjC0wxaBU/H0pckMf3QVzcd4W/ZFJn2E0nJBw9sz6O4usRvIPNv3BbeICi0Nfl
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu May 14 05:00:09 CEST 2020
media-tree git hash:	43c4dc3f59e75f3a8b726c4c90cb894c3780e91c
media_build git hash:	2f75e0d4330da180166ebcd104560d471a1599b6
v4l-utils git hash:	bbdc0269bf49aa8dd8259d0c31efff2366f6647f
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 7bc5ca34b446a30a7e19688e9a1e68e905cb8ff4
host hardware:		x86_64
host os:		5.6.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
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
linux-5.6.1-i686: OK
linux-5.6.1-x86_64: OK
linux-5.7-rc1-i686: OK
linux-5.7-rc1-x86_64: OK
apps: WARNINGS
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: OK: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
