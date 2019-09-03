Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5AD7A619E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 08:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfICGkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 02:40:25 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60437 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725919AbfICGkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 02:40:25 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 52UGiFHGZxNy052UJicAd5; Tue, 03 Sep 2019 08:40:23 +0200
Subject: Re: cron job: media_tree daily build: ERRORS
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
References: <a57dda1c01e4961d4c27d9b70723e052@smtp-cloud7.xs4all.net>
Message-ID: <de111f26-c190-05b9-d76e-6013007023cd@xs4all.nl>
Date:   Tue, 3 Sep 2019 08:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a57dda1c01e4961d4c27d9b70723e052@smtp-cloud7.xs4all.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBs6FaYdIpIV5n3DPpscpI4qyLX1NLogJzJfmpldFfRfe2HdhWd3MCNxdLqZURRNB548lmgxCtN8rjH6SSS4I+89NOfDpml+Q2PHzQ4Nnx3yfbNn/HfG
 U/5WWnbT1yyARbHxc9M+LzIJnuTUI3eH5LpBws3d5BI+t/icQvtaw9QjzvFTT6THbTOkot6kQ7SySA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These errors appear to be fall-out from my upgrade to gcc-9.2.0
and failing to properly prepare the old kernels for that.

Hopefully this will be better tomorrow.

Regards,

	Hans

On 9/3/19 5:59 AM, Hans Verkuil wrote:
> This message is generated daily by a cron job that builds media_tree for
> the kernels and architectures in the list below.
> 
> Results of the daily build of media_tree:
> 
> date:			Tue Sep  3 05:00:10 CEST 2019
> media-tree git hash:	20a438d53fd9d12a894161bc56cbeab7a9993c39
> media_build git hash:	d75b29db1297d2475227cc8bada843542271e40d
> v4l-utils git hash:	32fd3b7e82e4a018e256ddfa30d4498b385c811d
> edid-decode git hash:	0932deee88928f110b5a74851c173ad895f75863
> gcc version:		i686-linux-gcc (GCC) 9.2.0
> sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
> sparse version:		0.6.1-rc1
> smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
> smatch version:		0.5.1
> build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
> build-scripts git hash: 5624386a32db97445f4ab315a1954e6d3bcb0c47
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
> linux-3.10.108-i686: WARNINGS
> linux-3.10.108-x86_64: WARNINGS
> linux-3.11.10-i686: ERRORS
> linux-3.11.10-x86_64: ERRORS
> linux-3.12.74-i686: WARNINGS
> linux-3.12.74-x86_64: WARNINGS
> linux-3.13.11-i686: ERRORS
> linux-3.13.11-x86_64: ERRORS
> linux-3.14.79-i686: WARNINGS
> linux-3.14.79-x86_64: WARNINGS
> linux-3.15.10-i686: ERRORS
> linux-3.15.10-x86_64: ERRORS
> linux-3.16.63-i686: WARNINGS
> linux-3.16.63-x86_64: WARNINGS
> linux-3.17.8-i686: ERRORS
> linux-3.17.8-x86_64: ERRORS
> linux-3.18.136-i686: WARNINGS
> linux-3.18.136-x86_64: WARNINGS
> linux-3.19.8-i686: ERRORS
> linux-3.19.8-x86_64: ERRORS
> linux-4.0.9-i686: ERRORS
> linux-4.0.9-x86_64: ERRORS
> linux-4.1.52-i686: WARNINGS
> linux-4.1.52-x86_64: WARNINGS
> linux-4.2.8-i686: WARNINGS
> linux-4.2.8-x86_64: WARNINGS
> linux-4.3.6-i686: WARNINGS
> linux-4.3.6-x86_64: WARNINGS
> linux-4.4.167-i686: WARNINGS
> linux-4.4.167-x86_64: WARNINGS
> linux-4.5.7-i686: WARNINGS
> linux-4.5.7-x86_64: WARNINGS
> linux-4.6.7-i686: WARNINGS
> linux-4.6.7-x86_64: WARNINGS
> linux-4.7.10-i686: WARNINGS
> linux-4.7.10-x86_64: WARNINGS
> linux-4.8.17-i686: WARNINGS
> linux-4.8.17-x86_64: WARNINGS
> linux-4.9.162-i686: WARNINGS
> linux-4.9.162-x86_64: WARNINGS
> linux-4.10.17-i686: WARNINGS
> linux-4.10.17-x86_64: WARNINGS
> linux-4.11.12-i686: WARNINGS
> linux-4.11.12-x86_64: WARNINGS
> linux-4.12.14-i686: WARNINGS
> linux-4.12.14-x86_64: WARNINGS
> linux-4.13.16-i686: WARNINGS
> linux-4.13.16-x86_64: WARNINGS
> linux-4.14.105-i686: WARNINGS
> linux-4.14.105-x86_64: WARNINGS
> linux-4.15.18-i686: WARNINGS
> linux-4.15.18-x86_64: WARNINGS
> linux-4.16.18-i686: WARNINGS
> linux-4.16.18-x86_64: WARNINGS
> linux-4.17.19-i686: WARNINGS
> linux-4.17.19-x86_64: WARNINGS
> linux-4.18.20-i686: ERRORS
> linux-4.18.20-x86_64: ERRORS
> linux-4.19.28-i686: ERRORS
> linux-4.19.28-x86_64: ERRORS
> linux-4.20.15-i686: ERRORS
> linux-4.20.15-x86_64: ERRORS
> linux-5.0.15-i686: ERRORS
> linux-5.0.15-x86_64: ERRORS
> linux-5.1.1-i686: ERRORS
> linux-5.1.1-x86_64: ERRORS
> linux-5.2.1-i686: ERRORS
> linux-5.2.1-x86_64: ERRORS
> linux-5.3-rc1-i686: ERRORS
> linux-5.3-rc1-x86_64: ERRORS
> apps: OK
> spec-git: OK
> virtme: OK: Final Summary: 2327, Succeeded: 2327, Failed: 0, Warnings: 0
> sparse: OK
> smatch: OK
> 
> Logs weren't copied as they are too large (57232 kB)
> 
> The Media Infrastructure API from this daily build is here:
> 
> http://www.xs4all.nl/~hverkuil/spec/index.html
> 

