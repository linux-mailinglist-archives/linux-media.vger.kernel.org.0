Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD2D8B96E
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 15:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbfHMNDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 09:03:36 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56713 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728321AbfHMNDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 09:03:36 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xWSVhLabvqTdhxWSah9pzS; Tue, 13 Aug 2019 15:03:32 +0200
Subject: Re: [GIT PULL FOR v5.4] Fixes and i2c conversions
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
References: <20190813123727.16011-1-jenkins@linuxtv.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6e74af23-c0c1-29d2-2aaf-070a84f2dc62@xs4all.nl>
Date:   Tue, 13 Aug 2019 15:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190813123727.16011-1-jenkins@linuxtv.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHc//XE/TT2tMPTu1XQUvy5HSn9mpxI4rzGhawX5/VyM268NQ/pIEcacRdxyMIH7xsANOSIFFWCmkPH3E/b+ewZglAp4P4ZjqNpCTZLQ/3RP2/iLqRts
 uzoJXMurC+hc6R6gaVA6QVwM09tk9BoiL9dHrJeHNuiik2ei2Ztd/gFq/nioWcmTe8m2IrnLd0pBWGyHAQVikfPp+VAZVbA6uw33pm5qlakJcMqX7IcRWYSN
 vAS2jAsvObCqWBpCc94rCi3J+XuNN+Pw5lpZminaMvfTr4loBI5FKpaZ3tWC1VzJ9ci320q+fA1jrGAWbrQP2B8qFQZeKjvGS+GwKZuLXPw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/13/19 2:37 PM, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/patch/58111/
> Build log: https://builder.linuxtv.org/job/patchwork/7830/
> Build time: 00:13:54
> Link: https://lore.kernel.org/linux-media/0ce80e1f-46c1-6184-b0c1-fc99d0908725@xs4all.nl
> Summary: 12 issues, being 0 build regressions
> 
> Error/warnings:
> 

Note that these errors are all false errors:

> patches/0022-media-i2c-adv748x-Convert-to-new-i2c-device-probe.patch:10: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0022-media-i2c-adv748x-Convert-to-new-i2c-device-probe.patch
> patches/0023-media-radio-si4713-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
> patches/0023-media-radio-si4713-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0023-media-radio-si4713-Convert-to-new-i2c-device-probe.patch
> patches/0024-media-radio-si470x-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
> patches/0024-media-radio-si470x-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0024-media-radio-si470x-Convert-to-new-i2c-device-probe.patch
> patches/0025-media-i2c-smiapp-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
> patches/0025-media-i2c-smiapp-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0025-media-i2c-smiapp-Convert-to-new-i2c-device-probe.patch
> patches/0026-media-i2c-s5c73m3-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
> patches/0026-media-i2c-s5c73m3-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0026-media-i2c-s5c73m3-Convert-to-new-i2c-device-probe.patch
> patches/0027-media-i2c-et8ek8-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
> patches/0027-media-i2c-et8ek8-Convert-to-new-i2c-device-probe.patch:9: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0027-media-i2c-et8ek8-Convert-to-new-i2c-device-probe.patch
> patches/0028-media-i2c-Convert-to-new-i2c-device-probe.patch:7: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")'
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0028-media-i2c-Convert-to-new-i2c-device-probe.patch
> 

Regards,

	Hans
