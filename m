Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87F02176DDD
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 05:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgCCEMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 23:12:48 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43565 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726974AbgCCEMs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Mar 2020 23:12:48 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:d0e2:a5af:5d0f:8e60])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8yvFjgsGLEE3q8yvGjxXt7; Tue, 03 Mar 2020 05:12:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583208766; bh=4NRxO/3kTWFnKz2D9y7I9v8XltHDsn99RbHcfXgF3FQ=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Qp3s8y3boTfCodr5uZt3VzccggFCY+hWHzWQpRypYZ1+9jVv1Uw2XOL5rTwguasrM
         fPY92PyF+9ariMvVJtxuYfeq/JHXhGCcXtv20RL6Bdg3a6c190uIu6o8pcndHmcLOs
         7uqwZqRRFZ3xxB+Mmijee2kGe5EgTxVNtqb8I2erlg0XPEaN0SDaGRji9fhjo0HTQ3
         ke0NYr0uVW4rulJC0Wpy7TZmoPSaBAVRIQs1WuCCwofi28EfmjXKu6rOoUnzzYdxnU
         kyJL6qSJocdwLhRNKxMVN2ln322Owv7LEdRf6ns/MFGcyVzPAeYPmsaTLK/Z9+xUZs
         rDlgD3vHgdYWQ==
Message-ID: <b546e5fda3ccdfb9706e0665451396cd@smtp-cloud7.xs4all.net>
Date:   Tue, 03 Mar 2020 05:12:45 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4wfHc8JWbFXM9cNuon2BWy4a9LV2ERv8YSl20y3atGGJzgSPL8UkqWUISaE9jTPXE8TrXqgV+qDGgGb0Iq9SB3kIed5L/REq1D02aA2VibeW0KXjUbutth
 hbj5+Kn4Z8LHaNZQe98g/JXizndUCIlEHGb6gBGD4gTyUrT/SIe8S+SIKJ/EzmgA5g5YLD8U0E9E6otFT8Dhv/QRGqYEhG9ankvQE13PUrLMqLkrxbQOIWmS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Mar  3 05:00:08 CET 2020
media-tree git hash:	8bc8c9ba03c4d4966c2503e189801fbc9130b747
media_build git hash:	680a07be51069bee47a07a4bcf36c5176f1290a4
v4l-utils git hash:	4e555017a19834db66d4772f62c5b382fb374dea
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: dd216b9c56c5280b1b5f38b6027a361bcd5d5aa5
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
apps: OK
spec-git: OK
virtme: WARNINGS: VM was not running
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
