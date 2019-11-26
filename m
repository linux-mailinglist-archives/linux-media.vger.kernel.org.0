Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC9D2109869
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 05:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbfKZE4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 23:56:05 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41277 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727696AbfKZE4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 23:56:04 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:8483:6050:cda5:1f9a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZStNiDS03jpCOZStOi3wXJ; Tue, 26 Nov 2019 05:56:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574744162; bh=Pk2lhh1LYBoB3xqVmvAEE2KVBrAGRtwhxcXkmcQu/PU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=tESgneFq7Sz+pzFvkLl36bpKKwyUNnDqYKCMZD3bj5e4tnHxE+pyaOXs689n8Wdt/
         NXCaJewT+0vBjkvO+6BJs4ESMYl5PSN4CO7Y/6iLYRB3BX43rOGAdVqwociPBV0dUV
         QbI9OZSH48o8ZQOYczV5kBoM1jCwrlehQpGon5fiREtz11l/Jij8otZJnFLpRvCQwG
         D9OUEAAuj+UqgsgTdx4TthZvspe82rdA/9ltuqL4un61+QzoasuyB9No5Muz2QJlKf
         RXQYWvlzWbGs38bv5+OeihehgplAgAF04pTcQqmDSCfhpjEZiejIyS/DV9eGHJtJxo
         B7hedf5UKgsNA==
Message-ID: <7804df6e7ee582b8ad131fd7fcb59cf1@smtp-cloud7.xs4all.net>
Date:   Tue, 26 Nov 2019 05:56:00 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfEoaZUBFPbdd6rVSdrKlDt1fINbkNMk+hAIxEPPDdjjjljpQEh5LzIDTHjW/tXCRk/ZflDgXNZohWxZmtQ0MLwfv8ZW40n5KlEg4zuWQt/6rLaARLqRY
 P+rgIUaLAEOTs10eLRSbrc+GqLOS74aOVlNCfbaty74dJstFgUAm1uym45Tlj/OzC/dG70hf/L1NDhzThvZAk9AWTAzF9S5TCyrsTaCHg3XlqEam0sdNbxIy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Nov 26 05:00:12 CET 2019
media-tree git hash:	dca6b3733a4a46e63603496f544ece8ace541fde
media_build git hash:	efba365ba11b958a6bf6fb4b397942f9461cefca
v4l-utils git hash:	4e84fc1a0e413ba1a2b598f1df4306045665edbe
edid-decode git hash:	7bbed3aef6da3d83c490788ab45c75c19e180caf
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6903fe8f5101fc43440b3259290c97d2dd51733d
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
linux-5.4-i686: OK
linux-5.4-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2791, Succeeded: 2791, Failed: 0, Warnings: 0
sparse: WARNINGS
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
