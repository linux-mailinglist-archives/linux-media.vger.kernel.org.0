Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE4533F2F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 08:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFDGsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 02:48:43 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55515 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726410AbfFDGsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 02:48:42 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y3FNhQR7EsDWyY3FQhvFUT; Tue, 04 Jun 2019 08:48:40 +0200
Subject: Re: cron job: media_tree daily build: OK
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
References: <86cccbb922d18c772d757b9aa622f05c@smtp-cloud9.xs4all.net>
Message-ID: <58e6967d-5cdd-f4ff-5baa-96fccfbaefd2@xs4all.nl>
Date:   Tue, 4 Jun 2019 08:48:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <86cccbb922d18c772d757b9aa622f05c@smtp-cloud9.xs4all.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMq2v0xupXNjNXe/yi1woN7nq0l8doApzRiQQ5uXbHOehrY1GfuYY66znie9k09trcyRRqgnAWmuQVbUCHzPtXvef1nLJHxuGZ+ns6oQfzNBAtRkscQr
 4qyTEDjYOL3p5ygV1B4c+WE02UXiHu3unxr0wXu3eVFk+91AAWPvGIBomuP+X+9jAnwdG6nwoBkblQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Some comments below about changes to the daily build:

On 6/4/19 5:52 AM, Hans Verkuil wrote:
> This message is generated daily by a cron job that builds media_tree for
> the kernels and architectures in the list below.
> 
> Results of the daily build of media_tree:
> 
> date:			Tue Jun  4 05:00:11 CEST 2019
> media-tree git hash:	0864c9ce8fe83eadfd21b08e98997111d091660c
> media_build git hash:	d121a2bedf6dd541c6182041142ec54fd94760ab
> v4l-utils git hash:	4509a09beb1cca754347dc139eecdc4ad7efaa93
> edid-decode git hash:	dc763d7b1a95a74c6d109a03e34ba45315212195
> gcc version:		i686-linux-gcc (GCC) 8.3.0
> sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
> sparse version:		0.6.1-rc1
> smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
> smatch version:		0.5.1
> build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
> build-scripts git hash: 9bdb4578f080fb0fdd1eaa730556810fc68105c1
> host hardware:		x86_64
> host os:		4.19.0-4-amd64
> 
> linux-git-arm-at91: OK
> linux-git-arm-davinci: OK
> linux-git-arm-multi: OK
> linux-git-arm-pxa: OK
> linux-git-arm-stm32: OK
> linux-git-arm64: OK
> linux-git-i686: OK
> linux-git-mips: OK
> linux-git-powerpc64: OK
> linux-git-sh: OK
> linux-git-x86_64: OK
> Check COMPILE_TEST: OK
> Check for strcpy/strncpy/strlcpy: OK
> linux-3.10.108-i686: OK
> linux-3.10.108-x86_64: OK
> linux-3.11.10-i686: OK
> linux-3.11.10-x86_64: OK
> linux-3.12.74-i686: OK
> linux-3.12.74-x86_64: OK
> linux-3.13.11-i686: OK
> linux-3.13.11-x86_64: OK
> linux-3.14.79-i686: OK
> linux-3.14.79-x86_64: OK
> linux-3.15.10-i686: OK
> linux-3.15.10-x86_64: OK
> linux-3.16.63-i686: OK
> linux-3.16.63-x86_64: OK
> linux-3.17.8-i686: OK
> linux-3.17.8-x86_64: OK
> linux-3.18.136-i686: OK
> linux-3.18.136-x86_64: OK
> linux-3.19.8-i686: OK
> linux-3.19.8-x86_64: OK
> linux-4.0.9-i686: OK
> linux-4.0.9-x86_64: OK
> linux-4.1.52-i686: OK
> linux-4.1.52-x86_64: OK
> linux-4.2.8-i686: OK
> linux-4.2.8-x86_64: OK
> linux-4.3.6-i686: OK
> linux-4.3.6-x86_64: OK
> linux-4.4.167-i686: OK
> linux-4.4.167-x86_64: OK
> linux-4.5.7-i686: OK
> linux-4.5.7-x86_64: OK
> linux-4.6.7-i686: OK
> linux-4.6.7-x86_64: OK
> linux-4.7.10-i686: OK
> linux-4.7.10-x86_64: OK
> linux-4.8.17-i686: OK
> linux-4.8.17-x86_64: OK
> linux-4.9.162-i686: OK
> linux-4.9.162-x86_64: OK
> linux-4.10.17-i686: OK
> linux-4.10.17-x86_64: OK
> linux-4.11.12-i686: OK
> linux-4.11.12-x86_64: OK
> linux-4.12.14-i686: OK
> linux-4.12.14-x86_64: OK
> linux-4.13.16-i686: OK
> linux-4.13.16-x86_64: OK
> linux-4.14.105-i686: OK
> linux-4.14.105-x86_64: OK
> linux-4.15.18-i686: OK
> linux-4.15.18-x86_64: OK
> linux-4.16.18-i686: OK
> linux-4.16.18-x86_64: OK
> linux-4.17.19-i686: OK
> linux-4.17.19-x86_64: OK
> linux-4.18.20-i686: OK
> linux-4.18.20-x86_64: OK
> linux-4.19.28-i686: OK
> linux-4.19.28-x86_64: OK
> linux-4.20.15-i686: OK
> linux-4.20.15-x86_64: OK
> linux-5.0.15-i686: OK
> linux-5.0.15-x86_64: OK
> linux-5.1.1-i686: OK
> linux-5.1.1-x86_64: OK
> linux-5.2-rc1-i686: OK
> linux-5.2-rc1-x86_64: OK
> apps: OK
> spec-git: OK
> virtme: OK: Final Summary: 1963, Succeeded: 1963, Failed: 0, Warnings: 0

Oops, this is wrong, I should get warnings here. It turned out to be
a bug in a script that I've now fixed.

> sparse: OK
> smatch: OK

Since the sparse and smatch checks now produce no warnings, I've
enabled the 'warning' check for this: so if they produce one or more
warnings in the future, the result of the daily build will also change
to WARNINGS. I've ignored this in the past but it's now time to check
for this.

> 
> Detailed results are available here:
> 
> http://www.xs4all.nl/~hverkuil/logs/Tuesday.log
> 
> Detailed regression test results are available here:
> 
> http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media.log
> http://www.xs4all.nl/~hverkuil/logs/Tuesday-test-media-dmesg.log
> 
> Full logs are available here:
> 
> http://www.xs4all.nl/~hverkuil/logs/Tuesday.tar.bz2
> 
> The Media Infrastructure API from this daily build is here:
> 
> http://www.xs4all.nl/~hverkuil/spec/index.html
> 

The daily build script is now also smarter about mailing the result:
if there were no changes whatsoever, it will mail the results to me
only, not to the mailinglist.

Regards,

	Hans
