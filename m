Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CFE33347F
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 05:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhCJEnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 23:43:32 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38177 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231135AbhCJEnX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 23:43:23 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JqgnlC4WdqY4WJqgolfk1X; Wed, 10 Mar 2021 05:43:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615351398; bh=MYYYDbdchE+feRI6USH8hffOPXQjvHp5fUNc9dmseJM=;
        h=Message-ID:Date:From:To:Subject:From:Subject;
        b=Cg7QCEjV6vCKlUILvkIAzzCilf4VpzJJlYkFmk8t1IUaYVS7GXe/e358+yl2CSw4x
         5u7UPia/ZqVm0rutmrgJ9JoW2GlzaE1ADAm6WDRIChzKw2sic17OUfEh/2mzNE7UJg
         O/FiuhQ9xWRIqUduyCw6O9B28Z9EIuSpJD6zbBQyYwQ130Kzsf5losRPCzH+7k+wh3
         PCxaJaWemetX/ZukzoGwo+wjUC6zIK1JS6Oo8PFpyts6ZO7EI/5Binh3/B8gmGu//J
         /xtS876/4ZG5KTq4hEJG+KEn16d3+fRtstCqdWL44SqFeqQ3EIEh9bkjAKGsxzYI3f
         FOgueqAAAZavw==
Message-ID: <1f693c38c7b91197fbacf20fef08a692@smtp-cloud8.xs4all.net>
Date:   Wed, 10 Mar 2021 05:43:17 +0100
From:   "Hans Verkuil" <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
X-CMAE-Envelope: MS4xfILOurkAsvb4kD6cGD1x3nA9ohIW2rj3C6xqSw7Ho1LKDTD5HBoab4miWjRnS9ye7DcCAJpehvQ8LxkU8TCml3FJJb5q502Zmqu/df3QYgeXgGsapj0G
 inpF4ngwEwhAqZo2K3hMQfUJe3C7B+CR/BnPxFpdlYwe4pZ65C+9oBPA0guRjYU0mtC9XTm0ZQNqgmew0AR+AnZ71KgSOE3dkTKw/kQa6Vx25ffsbs01FJEd
 d0BXTNPnVKMQ8aS94p1PLA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the kernels and architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Mar 10 05:00:12 CET 2021
media-tree git hash:	1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39
media_build git hash:	069192365e2cec8b47f6e6701fb2aa50f763c602
v4l-utils git hash:	242ad0b774c726cabaced873864a03a52e99e315
edid-decode git hash:	f20c85d7b4c537e0d458f85c4da9f45cd3c0fbd2
gcc version:		i686-linux-gcc (GCC) 10.2.0
sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
sparse version:		v0.6.3-1-g58d3c1ca
smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
smatch version:		v0.5.0-7413-g9bb66fa2d
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 3ce9a878c7e648b006568e3fa69a2c4fcd251925
host hardware:		x86_64
host os:		5.7.0-1-amd64

linux-git-sh: OK
linux-git-arm-stm32: OK
linux-git-arm-davinci: OK
linux-git-arm-at91: OK
linux-git-powerpc64: OK
linux-git-arm-pxa: OK
linux-git-mips: OK
linux-git-arm64: OK
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
linux-5.12-rc1-i686: OK
linux-5.12-rc1-x86_64: OK
apps: OK
spec-git: OK
virtme: OK: Final Summary: 2963, Succeeded: 2963, Failed: 0, Warnings: 0
virtme-32: OK: Final Summary: 3023, Succeeded: 3023, Failed: 0, Warnings: 0
sparse: WARNINGS
smatch: WARNINGS
kerneldoc: ERRORS

Detailed results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.log

Detailed regression test results are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-32.log
http://www.xs4all.nl/~hverkuil/logs/Wednesday-test-media-dmesg.log

Full logs are available here:

http://www.xs4all.nl/~hverkuil/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

http://www.xs4all.nl/~hverkuil/spec/index.html
