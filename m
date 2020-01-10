Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D597213665A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 05:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731384AbgAJEue (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 23:50:34 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35161 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731369AbgAJEue (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 23:50:34 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:44c:93b7:d37c:eb74])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pmFiiVQKArNgypmFjiXVzY; Fri, 10 Jan 2020 05:50:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578631831; bh=M4PRbq5ba1AgnVKrKMzovhZ2ITbWHCBQNxlC3svsUXM=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=KI1JUGcyJaaI4SP+2nrPBQHBT/X2CQ6pBIsUGx4PD+wBCQg0yQaEJFw6n7WUFodCw
         3BQ5IOClpGER4IOPdYcXBD0LgXsHa3YmgVgQ8AyItjY8TgtHHYLY1nhZzH1w337+sJ
         3Joinqv1ypJeg5zXFB/bNK84j1nGjLq1aAnANZdvpYcYan2Kb0+Zd/mrrLsT6GhzdW
         zAMWUxAEWDgRgZnMBhTurqyPhWkW7zsob4Idl88Ah2QnNlKhFAW5n1kaHG49QJtA/r
         HrvZjxKXzM//DLQKAJdsx6TmGtmo0tvsae0s1C8HJCRTVW3IaHeTOU6OcFVLVVAtJU
         mV/y5oqkxVwbA==
Message-ID: <c40580d20fd34af0c1213e3c4d4660b0@smtp-cloud7.xs4all.net>
Date:   Fri, 10 Jan 2020 05:50:30 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
X-CMAE-Envelope: MS4wfP4h/BcD9lHpULu7LjNUvY8hLQiOSaHllzNBeqQtQOCPRodaY6zT8Y0EHYuKK+Ds+hfhRSp7Au/0ATzOnHjDEzC3+SIuoVo4hU74EbyzuMSivPyveBnO
 bft+9SwcSLLEa/157E9LQ69xoG4SHPKz9ulOrDxqZuSn371GarQ6g2CLO/zrcriLoBFwNo/8h4GD2SSnEMG8dMqk7UU9R71gA7FowM7TslN2pRHHA4WmPbkw
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Jan 10 05:00:10 CET 2020
media-tree git hash:	2a0a0bc7020ef7e66c9569d8229d79fa72e3d659
media_build git hash:	63cba23b4a6a0456cdba6fb51103770e2b61faa4
v4l-utils git hash:	ec55a961487b449bedbe07650674b4965814cf07
edid-decode git hash:	e719d04077d098eb51d9494f41060eba2419d4bc
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: eb9b2120da0c807b5a48cb872a43d111a2c3cf06
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
linux-3.16.63-i686: ERRORS
linux-3.16.63-x86_64: ERRORS
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
linux-4.4.167-i686: ERRORS
linux-4.4.167-x86_64: ERRORS
linux-4.5.7-i686: ERRORS
linux-4.5.7-x86_64: ERRORS
linux-4.6.7-i686: ERRORS
linux-4.6.7-x86_64: ERRORS
linux-4.7.10-i686: ERRORS
linux-4.7.10-x86_64: ERRORS
linux-4.8.17-i686: ERRORS
linux-4.8.17-x86_64: ERRORS
linux-4.9.162-i686: ERRORS
linux-4.9.162-x86_64: ERRORS
linux-4.10.17-i686: ERRORS
linux-4.10.17-x86_64: ERRORS
linux-4.11.12-i686: ERRORS
linux-4.11.12-x86_64: ERRORS
linux-4.12.14-i686: ERRORS
linux-4.12.14-x86_64: ERRORS
linux-4.13.16-i686: ERRORS
linux-4.13.16-x86_64: ERRORS
linux-4.14.105-i686: ERRORS
linux-4.14.105-x86_64: ERRORS
linux-4.15.18-i686: ERRORS
linux-4.15.18-x86_64: ERRORS
linux-4.16.18-i686: ERRORS
linux-4.16.18-x86_64: ERRORS
linux-4.17.19-i686: ERRORS
linux-4.17.19-x86_64: ERRORS
linux-4.18.20-i686: ERRORS
linux-4.18.20-x86_64: ERRORS
linux-4.19.28-i686: ERRORS
linux-4.19.28-x86_64: ERRORS
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
linux-5.4.2-i686: ERRORS
linux-5.4.2-x86_64: ERRORS
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2943, Succeeded: 2943, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
