Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BA2285721
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 05:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgJGDiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 23:38:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45307 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725981AbgJGDiX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 23:38:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Q0HUkPtsnv4gEQ0HVkKTlW; Wed, 07 Oct 2020 05:38:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602041901; bh=/cFV0ijZPsQE/73pbkj7OD57/jy59whcMFGfyb/yBaA=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=bqv344lut/+gB4WSICCJfVkhARYGzbsdoEld77/uy4QW64F0T4Nvwmk1ESDOlZB3b
         sMGfsvL9Fzgja2CR1bafNSV+iw9Kshf6oVbVlsPoNiyiKFClc4aI2qfxfjpSxKzJRI
         Fxuqv0VLZ+KmlS4CDEDZFjbrB4b3HMbzhSGF6OSpdVda/rmoO4XURKw503zmw9Yl4B
         IXaNDCtCWr0gd3QR4sWvyTh7EGNLU6KEri/YzTq4pYrIeEna86eYOaae/OHIl7U0Oi
         h7SVMbfHtZXGJV8uaF2bIkMtlt6VGIjYpq5F0Z2q7DGTcBP2xRprQbkMQcvWchGNp6
         ANg0oAQUn22cw==
Message-ID: <5bd1e03786aa86a7aa7aea90b6d1f448@smtp-cloud7.xs4all.net>
Date:   Wed, 07 Oct 2020 05:38:19 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfEVei6yshlq/E5b3AhYTgC1dw2MGIccNAtm5qEFoUSsFNkmvjcfg14/C8uqjKcqW9VHPKz8WRQ5rHCS7+03E8sddhmOrdqreeiJyCzeto91maHJlnx2N
 h3YhJkyQ4qsoAKGNrTllXG9QGx/VimNgug0BSUppjWROs4EMrWBpWMaa6fMNHY4pC68nD0rlQL9S9n1L1//ZcgpDU011th8EZy1tL5vjKbebrU77yJSGZCW2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Oct  7 05:00:18 CEST 2020
media-tree git hash:	463c43fcd97e493d8a17242f4f000c86fe642ed6
media_build git hash:	e0136eadb6f4c24b7f8fcb50ef4d4d5ffb2af31d
v4l-utils git hash:	28df3d403be3d7769d7b10cda3e372a0dbbfa410
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.2-1-gfebba84c
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-6793-g0248ebb06
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 9783287347a0d95925f345313520f04869f439ab
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-powerpc64: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-3.10.108-i686: WARNINGS
linux-3.10.108-x86_64: WARNINGS
linux-3.11.10-i686: WARNINGS
linux-3.11.10-x86_64: WARNINGS
linux-3.12.74-i686: WARNINGS
linux-3.12.74-x86_64: WARNINGS
linux-3.13.11-i686: WARNINGS
linux-3.13.11-x86_64: WARNINGS
linux-3.14.79-i686: WARNINGS
linux-3.14.79-x86_64: WARNINGS
linux-3.15.10-i686: WARNINGS
linux-3.15.10-x86_64: WARNINGS
linux-3.16.81-i686: WARNINGS
linux-3.16.81-x86_64: WARNINGS
linux-3.17.8-i686: WARNINGS
linux-3.17.8-x86_64: WARNINGS
linux-3.18.136-i686: WARNINGS
linux-3.18.136-x86_64: WARNINGS
linux-3.19.8-i686: WARNINGS
linux-3.19.8-x86_64: WARNINGS
linux-4.0.9-i686: WARNINGS
linux-4.0.9-x86_64: WARNINGS
linux-4.1.52-i686: WARNINGS
linux-4.1.52-x86_64: WARNINGS
linux-4.2.8-i686: WARNINGS
linux-4.2.8-x86_64: WARNINGS
linux-4.3.6-i686: WARNINGS
linux-4.3.6-x86_64: WARNINGS
linux-4.4.238-i686: OK
linux-4.4.238-x86_64: OK
linux-4.5.7-i686: WARNINGS
linux-4.5.7-x86_64: WARNINGS
linux-4.6.7-i686: WARNINGS
linux-4.6.7-x86_64: WARNINGS
linux-4.7.10-i686: WARNINGS
linux-4.7.10-x86_64: WARNINGS
linux-4.8.17-i686: WARNINGS
linux-4.8.17-x86_64: WARNINGS
linux-4.9.238-i686: OK
linux-4.9.238-x86_64: OK
linux-4.10.17-i686: WARNINGS
linux-4.10.17-x86_64: WARNINGS
linux-4.11.12-i686: WARNINGS
linux-4.11.12-x86_64: WARNINGS
linux-4.12.14-i686: WARNINGS
linux-4.12.14-x86_64: WARNINGS
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: WARNINGS
linux-4.14.200-i686: OK
linux-4.14.200-x86_64: OK
linux-4.15.18-i686: WARNINGS
linux-4.15.18-x86_64: WARNINGS
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: WARNINGS
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: WARNINGS
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: WARNINGS
linux-4.19.149-i686: OK
linux-4.19.149-x86_64: OK
linux-4.20.17-i686: WARNINGS
linux-4.20.17-x86_64: WARNINGS
linux-5.0.21-i686: WARNINGS
linux-5.0.21-x86_64: WARNINGS
linux-5.1.21-i686: WARNINGS
linux-5.1.21-x86_64: WARNINGS
linux-5.2.21-i686: WARNINGS
linux-5.2.21-x86_64: WARNINGS
linux-5.3.18-i686: WARNINGS
linux-5.3.18-x86_64: WARNINGS
linux-5.4.69-i686: OK
linux-5.4.69-x86_64: OK
linux-5.5.19-i686: WARNINGS
linux-5.5.19-x86_64: WARNINGS
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.13-i686: OK
linux-5.8.13-x86_64: OK
linux-5.9-rc7-i686: OK
linux-5.9-rc7-x86_64: OK
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
virtme-32: WARNINGS: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 1
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
