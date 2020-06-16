Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D459D1FA712
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 05:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgFPDct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 23:32:49 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:44349 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725985AbgFPDct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 23:32:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id l2L7j6p8kK7ldl2L8jU2Fi; Tue, 16 Jun 2020 05:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592278366; bh=mc2pqYPJZgwkq313uXIj/+GwAoWWmu9v27p3cZuNJlQ=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=BrC1Gbelo4Yt3io7ihImlD/U5Gu6VGRbwO1Cm0CKQjoIwqDNanpKE3NrFBuK/msYd
         vDc2xmdYkatXIDMJ6pcYGX3G14XDWpgueHr7k6KzvX8FMhf4q5NRFfBgsfr3xbpuLe
         PZj1IsrztsvbL7dUjCPLBrY1iYEF/CO4JwI0UIfZqKFcqvyEonnHIdKYhA+xEu1CM2
         7Zz2iv35iaCsmaOp7QItHxyl3dzW82UpHO+k3uhTijeqdciRF34IgROyRRPFf1AQvr
         C4aCFH8wAVeZ0aPwL5ixKjwsQiBXKs46bKN9k6WSkF4KXrKZzT1KQ9Ri2COTbWstXf
         ILehpVOWrDwhA==
Message-ID: <6db270a9a165cd6f8969a0c9db5c8720@smtp-cloud9.xs4all.net>
Date:   Tue, 16 Jun 2020 05:32:44 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfB/LF1ITv4PscYIpOLhyxDGdheIeyJocT/ZGepN7sQKuz3OnVJlvej3oCVf5fhiJnqAoujWVSeOAhTKtKWqu3hOH89CKj6vIxrDkxo+UBX6xiuA5fn2d
 N/dN0uqc220e/ElgYkCb1vrFFgzPrWsOYN4qG7DzJaRbXSs7SYgRmtSphPdMca+1atR39jjfk/+3jx3wzcvQRHPqZ6iBLi6K5KKUax1ewHeeg9RuP/DgOIh7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jun 16 05:00:10 CEST 2020
media-tree git hash:	b3a9e3b9622ae10064826dccb4f7a52bd88c7407
media_build git hash:	337283131d6117aa9b0c0c62d32e323da54a9359
v4l-utils git hash:	de91e870c2355e0fe754176563660b92b8ee040b
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.3.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 177b105719ea6cf8da0f80517eb48db12ec9580c
host hardware:		x86_64
host os:		5.6.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: WARNINGS
linux-git-x86_64: OK
Check COMPILE_TEST: WARNINGS: VIDEO_TEGRA
Check for strcpy/strncpy/strlcpy: WARNINGS: found 4 strcpy(), 4 strncpy(), 4 strlcpy()
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
linux-4.4.212-i686: ERRORS
linux-4.4.212-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.212-i686: ERRORS
linux-4.9.212-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.169-i686: ERRORS
linux-4.14.169-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.101-i686: ERRORS
linux-4.19.101-x86_64: ERRORS
linux-4.20.15-i686: ERRORS
linux-4.20.15-x86_64: ERRORS
linux-5.0.15-i686: ERRORS
linux-5.0.15-x86_64: ERRORS
linux-5.1.1-i686: ERRORS
linux-5.1.1-x86_64: ERRORS
linux-5.2.1-i686: ERRORS
linux-5.2.1-x86_64: ERRORS
linux-5.3.1-i686: ERRORS
linux-5.3.1-x86_64: ERRORS
linux-5.4.17-i686: ERRORS
linux-5.4.17-x86_64: ERRORS
linux-5.5.1-i686: ERRORS
linux-5.5.1-x86_64: ERRORS
linux-5.6.1-i686: ERRORS
linux-5.6.1-x86_64: ERRORS
linux-5.7-rc1-i686: ERRORS
linux-5.7-rc1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: ERRORS: Final Summary: 2943, Succeeded: 2941, Failed: 2, Warnings: 1
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 4
sparse: WARNINGS
smatch: ERRORS

Logs weren't copied as they are too large (1404 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
