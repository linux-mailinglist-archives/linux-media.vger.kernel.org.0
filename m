Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC46946E239
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 06:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhLIGC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 01:02:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbhLIGC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 01:02:26 -0500
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5797C061746
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 21:58:53 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id vCRvmIydShsVfvCSAm6dre; Thu, 09 Dec 2021 06:58:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1639029530; bh=fgiil+ddqNOxhLp/id4HBAtYVambxKLiQXniTUYtUt4=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=TwcmlB+MvzZRzCgaYGa1EOAwSnEfCp1TEUB8+gYbq5fK66EwQYNEoA/CYzYzpps13
         vly7136n5qB/6oewryb/ae65E0zOlo/ex8+DdJ0OD7F8ZwV24tfX0gFWzX53jAlrB5
         7qIdiORr+s4wDAg/PWgM7tyqDL5DVbA9w/nzRN/bYwq4oKRx8c8QEAH5WLMRUnXUVz
         mS0CI37p4v04TUXTQV0tieQvNeL+6Z7ethP1ytr0MAF6tclFlvcpNffEQWZu+dpd0v
         VcWbWzqiBPlw5K+o6vmLaaxV8lx8RfSO0n9wX0q67Vffu4ZH0bF8FdD6+vvnvRThAi
         2prnaMoKz019Q==
Message-ID: <2dc4640838faee0ce20c3d2934730a1a@smtp-cloud8.xs4all.net>
Date:   Thu, 09 Dec 2021 06:58:35 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfHnC6HTX6+WmmT41w+khFurLDVzsXFXAl+u7o7r9N8MAwPqC4TS4+3ID2CAlJCbiQcb+zwAILAxV5CiRlImayvyFu5fyTK6/06ELurpiFG4X/w7otfgD
 WzVaS81H8F9kJ7J+4FJqD/uTe0CzV1F6jUNUxsZh2JkqwPHssHUFpkkA/4YPKjuGKgHtB4TE2tIcfQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu Dec  9 05:00:10 CET 2021
media-tree git hash:	9b4d7b5c81a2578e080da33b5cddc3149fa611aa
media_build git hash:	c5c30e768ef3b757da479220d7a389470c3ad978
v4l-utils git hash:	85ed37cf472bb4f67702fb8d42992f164c36a007
edid-decode git hash:	b00755e34eb12aa92416aaf1bb7b02603131afe0
gcc version:		i686-linux-gcc (GCC) 11.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.3
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.3
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 72fe2e990921b3757e47e6f3ea4ce8c076021161
host hardware:		x86_64
host os:		5.15.0-2-amd64

linux-git-sh: OK
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm-multi: OK
linux-git-arm64: OK
linux-git-powerpc64: OK
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
linux-5.15.1-i686: OK
linux-5.15.1-x86_64: OK
linux-5.16-rc1-i686: OK
linux-5.16-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2989, Succeeded: 2989, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3100, Succeeded: 3100, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: WARNINGS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Thursday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Thursday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
