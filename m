Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B007EA990B
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 05:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfIEDwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 23:52:46 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47277 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725965AbfIEDwq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 23:52:46 -0400
Received: from localhost ([IPv6:2001:983:e9a7:1:c91f:b9db:b779:3284])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 5ip7iB1oiMK4h5ip8iFqZ7; Thu, 05 Sep 2019 05:52:43 +0200
Message-ID: <a3113f28eb6de689523f88bf54d83ac3@smtp-cloud8.xs4all.net>
Date:   Thu, 05 Sep 2019 05:52:41 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfGB8qipYNlzsZW6KhKWm/JhpfWhJl4O1FSZTns558pfCF42EEjV5fHt6rPg3Wmt4r55gnfdRCKQQPv/pB2R9adJDzOXRYA4VY4xbnWHnf5TFKf396LzQ
 UGfaEdy/1aU/VvTN3ITz6BVt0yLRUIn84bc+JoR5UFCMHm27+5gBVu2he91saRHjMmLIOe4MrszU6UkTAegGoZSPAmoqNbcD2eYUBAFfoKfjM94G+kP+1sf7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Sep  5 05:00:13 CEST 2019
media-tree git hash:	20a438d53fd9d12a894161bc56cbeab7a9993c39
media_build git hash:	d75b29db1297d2475227cc8bada843542271e40d
v4l-utils git hash:	dd79397d3abf1be875224aad3b62efab53457a73
edid-decode git hash:	0932deee88928f110b5a74851c173ad895f75863
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1-rc1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.5.1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 8634894b41454ef4215a3d4fd503305c720e761a
host hardware:		x86_64
host os:		4.19.0-4-amd64

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
linux-3.16.63-i686: WARNINGS
linux-3.16.63-x86_64: WARNINGS
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
linux-4.4.167-i686: WARNINGS
linux-4.4.167-x86_64: WARNINGS
linux-4.5.7-i686: WARNINGS
linux-4.5.7-x86_64: WARNINGS
linux-4.6.7-i686: WARNINGS
linux-4.6.7-x86_64: WARNINGS
linux-4.7.10-i686: WARNINGS
linux-4.7.10-x86_64: WARNINGS
linux-4.8.17-i686: WARNINGS
linux-4.8.17-x86_64: WARNINGS
linux-4.9.162-i686: WARNINGS
linux-4.9.162-x86_64: WARNINGS
linux-4.10.17-i686: WARNINGS
linux-4.10.17-x86_64: WARNINGS
linux-4.11.12-i686: WARNINGS
linux-4.11.12-x86_64: WARNINGS
linux-4.12.14-i686: WARNINGS
linux-4.12.14-x86_64: WARNINGS
linux-4.13.16-i686: WARNINGS
linux-4.13.16-x86_64: WARNINGS
linux-4.14.105-i686: WARNINGS
linux-4.14.105-x86_64: WARNINGS
linux-4.15.18-i686: WARNINGS
linux-4.15.18-x86_64: WARNINGS
linux-4.16.18-i686: WARNINGS
linux-4.16.18-x86_64: WARNINGS
linux-4.17.19-i686: WARNINGS
linux-4.17.19-x86_64: WARNINGS
linux-4.18.20-i686: WARNINGS
linux-4.18.20-x86_64: WARNINGS
linux-4.19.28-i686: WARNINGS
linux-4.19.28-x86_64: WARNINGS
linux-4.20.15-i686: WARNINGS
linux-4.20.15-x86_64: WARNINGS
linux-5.0.15-i686: OK
linux-5.0.15-x86_64: OK
linux-5.1.1-i686: OK
linux-5.1.1-x86_64: OK
linux-5.2.1-i686: OK
linux-5.2.1-x86_64: OK
linux-5.3-rc1-i686: OK
linux-5.3-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2327, Succeeded: 2327, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Logs weren't copied as they are too large (81500 kB)

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
