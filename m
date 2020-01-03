Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E9212F3F0
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2020 05:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgACE42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 23:56:28 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59613 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725890AbgACE41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jan 2020 23:56:27 -0500
Received: from localhost ([IPv6:2001:983:e9a7:1:5c8e:dba5:8c1c:1972])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nF0ZiSHdJGyJwnF0aiilfx; Fri, 03 Jan 2020 05:56:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578027384; bh=2lztsQBnqkaBNVg0MudWCbJ7Wb4eO21aYBtoOIMTFqk=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=TloBcgBzFdPO9nSCbMqIQDHJbVZ7OJhev4GbzUER5KpG2ZvmP7FZl3HGWUVHIbAnQ
         BrVjTqGs3lVY7Vc305ja4nFwBTz9Vtcka4qkmvj4ihYBI8RrT4E1C4ctIdloBtyHo3
         0sax+aRPc4MoSSRJb29MA9ag6YbkDn7EdfxbQGUF6ZD8ZHb61twQIiYBZAWSBSpOUI
         /TJqK+CRh0VsJjxNvtKVZt0XZTIwXB33G4Ykg/efExYjNZq/YKS8u8qH8efdX9f2sW
         ZBlfwzM5I1SQXUkFXPmUfnVJoJhdmS3LBpzG8zSjhvxrWFcAlY3v8eJuYss3f9gvsY
         7rM8jJLQepAFw==
Message-ID: <540d3738cdd6ed6023036b5d6d6a5d4b@smtp-cloud9.xs4all.net>
Date:   Fri, 03 Jan 2020 05:56:23 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: OK
X-CMAE-Envelope: MS4wfIVQFqGoBAie0HLXOEl+7JumGfho2JsH2BbwFXXQb2Sff2G4y3hu6ijBYX7nfZ1Rpux9csGm6Cb9o5qMNicpFeF/pOP75IT388JMTAbIknAsmdL9SUHE
 kH3gqfZ+QrteNPb2gEBvraYu2/RUnZ8lH2gN3d4I4F7N1Y02/7mu8EmaATH4tgxjCJHzle8PYKouykgfN9X371uWXTb6tbIUeGZegxAT+l8v0ytnELVYcLZk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Fri Jan  3 05:00:10 CET 2020
media-tree git hash:	0885acd77eb4644fd88f6d9f41e433f4ee9bc37a
media_build git hash:	2555f73ab11b9936171fc31d38498818922c2f7a
v4l-utils git hash:	934a1b9bebccf9b9e4b390c3ba0198374e4a9199
edid-decode git hash:	e719d04077d098eb51d9494f41060eba2419d4bc
gcc version:		i686-linux-gcc (GCC) 9.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		0.6.1
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		0.6.1-rc1
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 2bba801e0e7dfc02308d972580fab46d27aaaffe
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
linux-5.4.2-i686: OK
linux-5.4.2-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2901, Succeeded: 2901, Failed: 0, Warnings: 0
sparse: OK
smatch: OK

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Friday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Friday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
