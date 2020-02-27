Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 180B1170FDA
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 05:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgB0E6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 23:58:47 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38775 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728273AbgB0E6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 23:58:47 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:c46:99f1:9c6d:cf2e])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7BG0jBKp9jmHT7BG1jgWi6; Thu, 27 Feb 2020 05:58:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582779525; bh=0qVt+rgF+ej/E4g1JixUxwXkojdQPMms74EvSGp5Prc=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=KmbQUVzktwH+Zq4Lx7oTEPCTn6E0tfoXiiXqP4UrCVGKo0ZTbqaCr36gK25iEWiM+
         55U9T4YGNHmjDHggoKAmOSOtwBYKwONhJ3jXiIR37L3koSQFVmQdHFTUK45AWh3vhr
         lAA8UkJHyobsPYPwH1sJWvaeCpqSNy7ugODtHm3lTGVXXq0yNU3h9Le7vLxNnYVvXd
         xG/xR2nbcQ78QtPHgQuS5lo979LJfX7g/n/ByTJNeCHChJfkGDbHKoGx+LHGkcTcJb
         PcDyasCP//9dx1tVefi38oPP5wuqZyzDklWqI7i+Qw1abCM/Xf9kZ/7f98T7V1RUkJ
         c6YSfzJh4HXdQ==
Message-ID: <edb3bf01db835d71aa04960aabab38e2@smtp-cloud7.xs4all.net>
Date:   Thu, 27 Feb 2020 05:58:44 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfHPA0Xq6OLEF1IZOrgjoxCee2WGoh4xdEcBohYtYGh0/LZqDKagX5gZSWcjQTRDGem9039aJnLHEfEF41TwqeM5UJDf6xd0PJU8pDCKNxI8kgtP8EKXQ
 aLCt89ybSIVWZMC5KEh0/JaTV/jmfrI5xQqJ1nQcaZYGRFoMaX2qQM4k6HBqVUd5nDQ6eOobUJOU2vBoZ3Hwb1kyWK6lJgNgukrRNmvqvrGuMnrAuvywY0wl
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Feb 27 05:00:10 CET 2020
media-tree git hash:	ef0ed05dcef8a74178a8b480cce23a377b1de2b8
media_build git hash:	e3e7c2632a298bb886608a95da5ec40bdb54fd92
v4l-utils git hash:	afb123618b087f3ca2305b84fb004624662e52f0
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 0a0399d66d361fec135a2dc184bd8d12148f35ad
host hardware:		x86_64
host os:		5.4.0-3-amd64

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
apps: OK
spec-git: OK
virtme: WARNINGS: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 1
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
