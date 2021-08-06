Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0503E223F
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 05:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242705AbhHFDmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 23:42:32 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52551 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231173AbhHFDma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Aug 2021 23:42:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BqkNmhojITTg6BqkPmk3nl; Fri, 06 Aug 2021 05:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628221334; bh=z77uhxeaKdocq3YpDm7vFzcuLec2LMYk3NH0+KZY0No=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=QHaCWeRL0h6sgi8wLMH7uqYi8XD36uY8VkP8OLeV+4Y4gNH2x+Wit3VwDvn7zZTAd
         yijWr5SK/ExCP/a9BvfRI8CYRzincVzILIbm043VbM8xO9Db28Gts8XJ97GwC1+6LC
         7dRXLLlEpeTiU6zOOZQ1IGdaRrz2kqs6tvN2mAMl2dd9/0KctYCixVsjPE0Ux/SuJn
         hRkD+0lCfDYFKuduGjVIxs9duceuE0eoVcPc06NIZ8450yfi2ioziZj38TBUvVFtnn
         ATimnKUBDp+iIcy0Gkm0385JZyKCmR/JP6+YfaMOs/pNL5xgbqNao/z/KwN1RDxsCq
         OZ2Uw5U+Ywp5g==
Message-ID: <de41faaa73219262ec4a7b42c605f39d@smtp-cloud9.xs4all.net>
Date:   Fri, 06 Aug 2021 05:42:11 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfA/OArO4ZgGY1vabqhX5mOMF2vlSnngQGcM1eD+ooWP0jAyt6rykYygJYTFE1tR8r7mF3ax0/lQkSKRceubAMRoaHtAmDj41a9sHaEfEy365dkFHX4fH
 NJABmoQ4vrI7guskaQUBCu++V66HUDBIYuy63yry5UjE42vYB2Bo3MXIaqExM6LbnZEU5pl0kl+C9NtAfNqkRxM1kW0KWvhs0lpepMLnqwNFeihtvnzHcdgi
 E724FkzP7Q1LOs4c9a4MIw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Aug  6 05:00:18 CEST 2021
media-tree git hash:	9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
media_build git hash:	bdc3294781a89c69fc05acefd95842b88ffcb4b9
v4l-utils git hash:	7952c0042ccf549959cf924fbd3e7dd894966e57
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-342-g92ace436
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7532-gde99456f6
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 6703700d637a73d66e094bc62d34c826f353efaa
host hardware:		x86_64
host os:		5.13.1-marune

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
linux-4.4.258-i686: ERRORS
linux-4.4.258-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.258-i686: ERRORS
linux-4.9.258-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.222-i686: ERRORS
linux-4.14.222-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.177-i686: ERRORS
linux-4.19.177-x86_64: ERRORS
linux-4.20.17-i686: ERRORS
linux-4.20.17-x86_64: ERRORS
linux-5.0.21-i686: ERRORS
linux-5.0.21-x86_64: ERRORS
linux-5.1.21-i686: OK
linux-5.1.21-x86_64: OK
linux-5.2.21-i686: OK
linux-5.2.21-x86_64: OK
linux-5.3.18-i686: OK
linux-5.3.18-x86_64: OK
linux-5.4.100-i686: OK
linux-5.4.100-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.13-i686: OK
linux-5.8.13-x86_64: OK
linux-5.9.1-i686: OK
linux-5.9.1-x86_64: OK
linux-5.10.18-i686: OK
linux-5.10.18-x86_64: OK
linux-5.11.1-i686: OK
linux-5.11.1-x86_64: OK
linux-5.12.1-i686: OK
linux-5.12.1-x86_64: OK
linux-5.13.1-i686: OK
linux-5.13.1-x86_64: OK
linux-5.14-rc1-i686: OK
linux-5.14-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: ERRORS
virtme-32: ERRORS
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
