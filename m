Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3666F400DDF
	for <lists+linux-media@lfdr.de>; Sun,  5 Sep 2021 05:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbhIEDtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Sep 2021 23:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbhIEDtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Sep 2021 23:49:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::1b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B760CC061575
        for <linux-media@vger.kernel.org>; Sat,  4 Sep 2021 20:48:09 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Mj8WmZ3I0y7WyMj8YmDZMy; Sun, 05 Sep 2021 05:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630813686; bh=4YYFedx/X8ssSZpnk7gjusywuoPhMCbLMnE1BxoJ1Zo=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=J2HbvQaR7ofJFIJL8wVA/B6a88ZizGowtH54f6MCdotTVhpYgrUIqdmMqSROKX6vk
         ZNED8+MKrJnvnspwYTenb9NNA99YxGVteyUyEenOptuWszMHwGa63W6bKwjM3/KHYf
         ePW+ylzmcZ0zK4e4kCSd52qobYDvxkCmBS35+5YpPUsU8CyGzj56t2W2VKp2gH9dy9
         xZoMWFiTU05Hvh0x+U8EKPbrkrK0ci+M1aJAzj+nzF95lZJljeyGKEBopvIsqQO1+I
         +DYt7ET0oOXECJ3DOQ218GE3reODjWG/3ow2SPDUXm7QMsXuk6pV++QBm9zFnD4jTI
         83Rpfrf5JFf5g==
Message-ID: <a9dd39af946e951143664ecfd8508ec8@smtp-cloud8.xs4all.net>
Date:   Sun, 05 Sep 2021 05:48:04 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfB51551VAMgZU/+wlJNiMG0SL3vgZJEAesHrcZJSKUtOppRDZxmaGd6qIYZY6uzGaODZvoIjVOUCxmm0CIY8oFyJxvkLI04P2/2KTLbGNDAYGBxUeNG3
 1WRT9PE6LA5rkFVe9SJbdGVeJg2o+U/muwwjaOCYAh9ln8yiQ0W1Uk+rr1+Tj3rDBHuWnrKew3e2ht43wPuZOZ0cedq2qgd/+dZu5Jee0RgKiqyGNxPxDQSh
 IDbei69tgWtsNJPasZo1Ag==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Sun Sep  5 05:00:11 CEST 2021
media-tree git hash:	9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
media_build git hash:	7253675c65ed84dc294ef25e2af873e8092be48b
v4l-utils git hash:	05a468e033af0e4c775aaa10fe4d02c45de698ae
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-349-gb21d5e09
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7593-g7f4b93661
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 8f230e7be768cbdfab869697ba0a2c622a4a0cae
host hardware:		x86_64
host os:		5.13.11-marune

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-arm-stm32: OK
linux-git-mips: OK
linux-git-arm-pxa: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
linux-git-arm-multi: OK
linux-git-i686: OK
linux-git-x86_64: OK
Check COMPILE_TEST: OK
Check for strcpy/strncpy/strlcpy: OK
linux-4.4.283-i686: OK
linux-4.4.283-x86_64: OK
linux-4.5.7-i686: OK
linux-4.5.7-x86_64: OK
linux-4.6.7-i686: OK
linux-4.6.7-x86_64: OK
linux-4.7.10-i686: OK
linux-4.7.10-x86_64: OK
linux-4.8.17-i686: OK
linux-4.8.17-x86_64: OK
linux-4.9.246-i686: OK
linux-4.9.246-x86_64: OK
linux-4.10.17-i686: OK
linux-4.10.17-x86_64: OK
linux-4.11.12-i686: OK
linux-4.11.12-x86_64: OK
linux-4.12.14-i686: OK
linux-4.12.14-x86_64: OK
linux-4.13.16-i686: OK
linux-4.13.16-x86_64: OK
linux-4.14.246-i686: OK
linux-4.14.246-x86_64: OK
linux-4.15.18-i686: OK
linux-4.15.18-x86_64: OK
linux-4.16.18-i686: OK
linux-4.16.18-x86_64: OK
linux-4.17.19-i686: OK
linux-4.17.19-x86_64: OK
linux-4.18.20-i686: OK
linux-4.18.20-x86_64: OK
linux-4.19.206-i686: OK
linux-4.19.206-x86_64: OK
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
linux-5.4.144-i686: OK
linux-5.4.144-x86_64: OK
linux-5.5.19-i686: OK
linux-5.5.19-x86_64: OK
linux-5.6.19-i686: OK
linux-5.6.19-x86_64: OK
linux-5.7.19-i686: OK
linux-5.7.19-x86_64: OK
linux-5.8.18-i686: OK
linux-5.8.18-x86_64: OK
linux-5.9.16-i686: OK
linux-5.9.16-x86_64: OK
linux-5.10.62-i686: OK
linux-5.10.62-x86_64: OK
linux-5.11.22-i686: OK
linux-5.11.22-x86_64: OK
linux-5.12.19-i686: OK
linux-5.12.19-x86_64: OK
linux-5.13.14-i686: OK
linux-5.13.14-x86_64: OK
linux-5.14.1-i686: OK
linux-5.14.1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2906, Succeeded: 2906, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 2
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Sunday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Sunday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
