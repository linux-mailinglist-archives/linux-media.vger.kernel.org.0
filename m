Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2FA4A6CCC
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 09:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238078AbiBBIUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 03:20:12 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:60766 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiBBIUL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 03:20:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D69561791
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 08:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A99C004E1
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 08:20:10 +0000 (UTC)
Message-ID: <ada5c02d-6a53-c5f0-e62d-f87ec259c5db@xs4all.nl>
Date:   Wed, 2 Feb 2022 09:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: cron job: media_tree daily build: ERRORS
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
References: <20220202050530.2B5DAC004E1@smtp.kernel.org>
In-Reply-To: <20220202050530.2B5DAC004E1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/2/22 06:05, Hans Verkuil wrote:
> This message is generated daily by a cron job that builds media_tree for
> the kernels and architectures in the list below.
> 
> Results of the daily build of media_tree:
> 
> date:			Wed Feb  2 05:00:11 CET 2022
> media-tree git hash:	68a99f6a0ebfe9101ea79ba5af1c407a5ad4f629
> media_build git hash:	16aa07924e1199cddb79a739ab46fb904851003e
> v4l-utils git hash:	d124ef52870a0f627d206db31c1b1a59f4c876ed
> edid-decode git hash:	6514c9d9b18160fe9f09d3d70f99dda85d6fca71
> gcc version:		i686-linux-gcc (GCC) 11.2.0
> sparse repo:            https://git.linuxtv.org/mchehab/sparse.git
> sparse version:		0.6.3
> smatch repo:            https://git.linuxtv.org/mchehab/smatch.git
> smatch version:		0.6.3
> build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
> build-scripts git hash: 5f5b438852acd7412b4bf7d0bdbe50a7cdd9a2f0
> host hardware:		x86_64
> host os:		5.15.0-3-amd64

<snip>

> virtme: ERRORS
> virtme-32: ERRORS

Something weird is going on, the virtme-based regression tests actually pass,
but for some reason the logs of the regression tests couldn't be 'scp'ied from
the VM to the host, which shows up incorrectly as 'ERRORS'.

I'm debugging this, but it might take a bit of time before this is resolved.

Really still a fall-out from when my old PC died and I had to rebuild everything.

Regards,

	Hans
