Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 446EA17EFB8
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 05:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgCJEeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 00:34:15 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56503 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725865AbgCJEeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 00:34:15 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:d89a:50e1:4500:1d37])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BWapjLaaHEE3qBWaqjL4IA; Tue, 10 Mar 2020 05:34:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583814852; bh=ZE+7C1BzVZR01IE1RQEWsLaK9fcDENnmMjYUF5eEQKI=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=bkyagftZ+3RiooD1NBk0bmYJHnKf6+hAnKhvVuO8l2Jlnaz2qPc9716XQTPnj61Qa
         vgITfqYR8nh4By+EfNsu5aGcrtzTFuH4NptWZ6pYpFK22kyBk+fJnsJJCQo49gurmn
         CV6lL7eB5i+7loM8UhHgJDRmkwj2vezW/xWKecrmNbPRBb2x3VTjP0+9gZ3zj9dACV
         2rO2eifk2FdoRrNaQEK8xB4fG7sr2GiphGV5stptjqqxV9uiBAaiPJ7PYQ9YXEgFYo
         aIV0OvqrIBaZXM3QPyCx9DK3kh2kRyM72BIUY133yAWEnAJIZbADtpyLF0BPTlDDUV
         L/Vf3wc9mzx/g==
Message-ID: <b2cdcbcad9f43174b77ce3cbe1cb5b59@smtp-cloud7.xs4all.net>
Date:   Tue, 10 Mar 2020 05:34:11 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfHTY5QZPFyoIstzJtKVJ0JCUZG4vd3fIbnUwVOEwj79MoGeqTQPd7VmNBWFhekkyYi0qPsisbKYreiDw4308JApTM6L0XlmLTDimu7zbFQd49sHr/cYH
 p2WYkXj4S++N3w2XchZqKCvBnyWIHoD3DEgQbNONCZGSWPY+A56/Fwh05yYsL1e6P0kmZ9Cwl3FR2fHa0xVDdYyMITHEYCywLnbyUnEUv/99zQ7DKUjgDH5c
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Mar 10 05:00:09 CET 2020
media-tree git hash:	00c43088aa680989407b6afbda295f67b3f123f1
media_build git hash:	6c715bb60eb5f601ae3fe59a5ec772300a5ddb2a
v4l-utils git hash:	8c1c41e9131fc80be553990b3bfe0d16a39c5658
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a9a31a4bbe5628b0da1fbc7ade073443848f3adb
host hardware:		x86_64
host os:		5.4.0-4-amd64

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
linux-5.6-rc1-i686: OK
linux-5.6-rc1-x86_64: OK
apps: WARNINGS
spec-git: OK
virtme: OK: Final Summary: 2779, Succeeded: 2779, Failed: 0, Warnings: 0
sparse: OK
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
