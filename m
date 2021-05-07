Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A521B375F36
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 05:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbhEGDlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 23:41:04 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35913 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231216AbhEGDk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 23:40:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id erLElaTfiWztCerLKlQElv; Fri, 07 May 2021 05:39:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620358798; bh=cINuFt71s+tNG4iuvEfWBtxd/+AkwzKWfyhTHMpP7Cs=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=D1Odo/DYYkzQ5WIgkBhe0nfmd4RKT3qOagPGQ9QqrULlepp5p5HN8Lozz90vBV7ec
         JJCys6lL9vT9lOvkqseL0c3glg6pkFu83A2gO/do448CitE9DWKRW5JA0QvrSpU6RO
         JTjBJmGblFiKOrf9pflV9pbp1mc5groyf9/AwmeY2xpyk45o/X7TgsoMkrXH/zX7QR
         KhnhiStoUaIWEkNwQxRTu5b6ch9DZvquHQZJpIp/+6BhLGBFeG8ZyTisr9C9zsS1Eo
         f2OiBnn5bdIuPQcgo2UBeILpxPPxJs4cyIZMgeFEzPvEiOojdWBEcnNQTMyFycYFkm
         iFlA3qgGP1SLQ==
Message-ID: <62512cf350402c7d0fbd8e832ef31772@smtp-cloud9.xs4all.net>
Date:   Fri, 07 May 2021 05:39:52 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4xfOwkc5tylyXG7MSDiGncF+ACBv8ZyBP/8A4RIjESEAfH1JKb/OYOAnIxpZvzLjy1Jv9dYLOnmLJcXar/ZH7TaHgwP06+dRpU6Uu4/tjQiWEOQUO7B5Tg
 96zeLlu0P4suRsZoGRm0z4VOWUXPflgtZCugb1w2frr3wggbNLCtWsvDJxy3FjCg4QGEAz36cRnill3Roa02Y3QXK6kYpHar4AlgCdF4MFk69YExN5mDNxoq
 +kEP8SSJETGuE8C6PVGu5A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri May  7 05:00:12 CEST 2021
media-tree git hash:	0b276e470a4d43e1365d3eb53c608a3d208cabd4
media_build git hash:	1521b23ea5307bef1ee17489c5323f00891dd52b
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7413-g9bb66fa2d
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: b010e650519b1cd0d44b110c056ef26ae6ff80a7
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-x86_64: OK
linux-git-i686: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.258-i686: OK
linux-4.4.258-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.258-i686: OK
linux-4.9.258-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.222-i686: OK
linux-4.14.222-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.177-i686: OK
linux-4.19.177-x86_64: OK
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
linux-5.12.1-i686: ERRORS
linux-5.12.1-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
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
