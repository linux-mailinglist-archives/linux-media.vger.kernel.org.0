Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CF737F1BE
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 05:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhEMDsk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 23:48:40 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44545 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230514AbhEMDsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 23:48:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id h2JllsDjcWkKbh2Jrlbd8H; Thu, 13 May 2021 05:47:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1620877647; bh=qs5TfgBhAPQo1a0GCwRGjMAFPJEqxzqsJ+GzOIwsNLE=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=SuWaBnnyumfxbbCEiBxAd62clIn9eJgiXIiz0+Y19OZMOIejsXS2Am91LIDAOEV01
         x+Hsy+6R57ybyUNJ2s38EfVKyRV+x4sI1QcoDSQ/vMFDF8/bK3Cx4VS7PFbEkNQCju
         9Ojy2yVkLWo27ygwE0bOQcEfUfrP9MH09s3MInYVViw/zSyangQ6rak7qoxBYaD2Cy
         O8K8TIniFYLbmQW5FQdQB3rvGArgMkn/phmCGfj940/OHPnYboolFDtWDTA0/kKpX8
         dj3Xp7Mm7b840tvzU4yDhZjExCFEfY0CzAks+zjVVIWO5+nSRRMXOHcsgJqnGx4c2b
         eOoV7BDIsU4YA==
Message-ID: <dd6b57134972a5f1081d06f174706d91@smtp-cloud8.xs4all.net>
Date:   Thu, 13 May 2021 05:47:21 +0200
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfCXj2iUjJD1FqQ4hcyQLC+wUbx5uBW7IhSgLViubgpyGl/vN8wOBF6TMR5YVPqodPx+OZj+Gi4wcVAWwIZHSBQaXUyQ0FBnhHJX9grfJwyCUHlNTN3z3
 aU4rUr2u8K4NJl2dw6FnoQSzAfGPQfLvNksFE6qoYOAUmVp9JAIQi2FvA3QETfoFtCArlCKXHlF3V44m1YC0O4XUbsawOVba1YOe0jqXR0fBz5TK/GO0Rgdq
 I9vay3EIUOiTftRMiCybcA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Thu May 13 05:00:08 CEST 2021
media-tree git hash:	73edc4da40635774100d0eb9ca2e6476e3b2b470
media_build git hash:	fe2dddd7a72848ec66131d15c4f1893db7daf84b
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
linux-git-arm-at91: OK
linux-git-arm-davinci: OK
linux-git-mips: OK
linux-git-arm-stm32: OK
linux-git-arm-pxa: OK
linux-git-arm64: WARNINGS
linux-git-powerpc64: OK
linux-git-arm-multi: WARNINGS
linux-git-i686: WARNINGS
linux-git-x86_64: WARNINGS
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
linux-5.12.1-i686: OK
linux-5.12.1-x86_64: OK
linux-5.13-rc1-i686: OK
linux-5.13-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
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
