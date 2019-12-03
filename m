Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70BD010F66C
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 05:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfLCEze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 23:55:34 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:32969 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726480AbfLCEze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Dec 2019 23:55:34 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:30bd:1e6a:5e65:e36f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id c0DiiQrVRksqec0Dji712H; Tue, 03 Dec 2019 05:55:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575348931; bh=JNisH+MC1ZaYpMlZlzwy/9U4/nzhnFrwqbwxTrjN3wU=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=SOaAmalh3isJI1E4l1vCchmSV60G7taNYQVUeLtnfHczgMohh6eh0ODgWlfMFWLhr
         J9hT+ekB1+2QGTLgiaIUlP/PqwLdMh5StBq5uSXwCEsWn4A1Xxml+4c+BsvtjMQum7
         3dOYheFS1fuS4HOqzULFGw0RJ5ZBiiOYu02DdUDlYgtTGHTFlBITngbf4D8VSdRUn8
         VNOMHwRPPZysXjq4DmcF0JoNUj6svnDwPIxKfAd+GGS8+iFolyl0GrUMfou/m0ZR9G
         +XmVwQ1vlS1vRp5Sg/mamHN3/7rFTJTGh4UsSvghgukGGw2Fij6r68gasngJsBI7Az
         /9PB/wisZ0+GQ==
Message-ID: <3fcbf6f7dc51338c627e38b51daf6b64@smtp-cloud8.xs4all.net>
Date:   Tue, 03 Dec 2019 05:55:30 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfFzQZ2ldDAqazyLt/ZY0MqcjnHk4qWLhcDJyL4niQV+zKfqEnk+czr0q/RrUjsbXm7zSdvIg+rJLzHN0BO75+/41A4g2PAlA090rTd6WdOA7kI54GnTK
 eHp+VCUxVeamgDb+cF3EYyLY0EVgSbZyA/InCu+2ngOq8pVClcjolxo1Y/j7BS7ariVJUeiU50rn1Da8vGAWx613up6zVidWuxchPd8HSClpcEhxe1f5JLic
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Dec  3 05:00:13 CET 2019
media-tree git hash:	dca6b3733a4a46e63603496f544ece8ace541fde
media_build git hash:	efba365ba11b958a6bf6fb4b397942f9461cefca
v4l-utils git hash:	8021c9d3aac0f4446ef5bedd2c53f0c2afbaa752
edid-decode git hash:	432c744fa3636c99bf6330970e470d031be1868f
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
