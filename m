Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E947A2B3EDF
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 09:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgKPIjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 03:39:00 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:44931 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726621AbgKPIi7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 03:38:59 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ea29kmSnDfkEdea2DkVMq6; Mon, 16 Nov 2020 09:38:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605515936; bh=0HBXrKpLPW8g1OySaIvQCG5gl20kZV+fEcDaxaxDToQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fHGPhhNedtHBlczoUP3Qo7/bWFYMRN5qndb4TE0nshwnGLDBUZfNy3Nyb+ZMZnkG9
         A63DvXCrQgX7nCQCCXLRIYixYJZAbj0ySYpwhRChWVjTVW8yY64D2J/bvqh7STvljW
         xsZft2du0XCyQuVg6xQ3JdaUarq9b6TRZo53XZOMP7/xzLWo4XgW96vovA8fwrJJPo
         eGXAbIiseeaerET7ErcZvabvwAv24ffsconaj+fliM7HyaGfXjWHOhSkz7YzA6ebKb
         VETvxga0cW6Mnk3tBQaLqrAor2MWpvk5jVQJiIlVRri9wPSqmawR9uwdcei60VDuuc
         kI/vl+AZG21pg==
Subject: Re: [PATCH v2 0/6] ARM: dts: sun8i: v3s: Enable video decoder
To:     Martin Cerveny <M.Cerveny@computer.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20200912143052.30952-1-m.cerveny@computer.org>
 <c8cc3529-3e21-2a11-d258-bb03885a5c91@xs4all.nl>
 <alpine.GSO.2.00.2011151911340.21646@dmz.c-home.cz>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <19bbdf9f-3894-606b-728e-b41df27a4f5d@xs4all.nl>
Date:   Mon, 16 Nov 2020 09:38:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.GSO.2.00.2011151911340.21646@dmz.c-home.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDqxeIl3zPlBEnQSYmV0VDPHCX9kfSj2fQYnFCgHd4wq04j+fNXIA3/t7eOTHSb8ESZ05regaNJKbZ/aYgtgiT7Oi4yuxnmaEDmhWeiKLd4N1GBbBp6B
 4AOz6Y//eo2oFcCnRo87LAljNyamxbP2YbkQMSsMt/ZQTN+4gextCiZdfUafVqwR9d1lQMPjpdg9UrfA2xOJWWvLkfMbp5cfNVP96j8X6MRVi3rq79B7QR9Q
 07UGX+capvn0sA1Fvi0jop9LGmjVbY2FY+eHNk3LqbUl/q5FagReD8fh/IXLq2K4ROoMzDaWP3qpqGFYfTwDX9LawiQDze91sJb+GFbu8FLfwzUuc5n6k+Qz
 rLpSK73x1H/aaA4rbZXuwiqH4PR1C8f4sp/Cg0U84WqmBP/UTF6fAmxAtf8e84/ju8pYk4LJgf7wgTsXSkWhTtMRiRlu3/y2qSdCM4k3uLHYobn7dsHTqQm8
 rGf9Q/ChLCLT+27ure/MbyxuU89yGmwCMVQVZ/NkqR+Ux7Ioi5lBpESa2xNNjvQ/ZgFhKjJEhJR6XjSpGt8gbk3jpZybwPrjEOZTTMdPO3ipB4f4oznMR6zs
 VEsYURoEXkzQY4xAltEUYbFW
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/11/2020 19:59, Martin Cerveny wrote:
> Hello.
> 
> On Thu, 5 Nov 2020, Hans Verkuil wrote:
> 
>> Hi Martin,
>>
>> On 12/09/2020 16:30, Martin Cerveny wrote:
>>> First patch extends cedrus capability to all decoders
>>> because V3s missing MPEG2 decoder.
>>>
>>> Next two patches add system control node (SRAM C1) and
>>> next three patches add support for Cedrus VPU.
>>>
>>> Tested on "Lichee Zero" V3s platform with testing LCD patch
>>> ( https://github.com/mcerveny/linux/tree/v3s_videocodec_v4 )
>>> and V4L2 raw API testing utility
>>> ( https://github.com/mcerveny/v4l2-request-test ):
>>> - enabled LCD (DRM dual VI and sigle UI planes)
>>> - added RGB panel
>>> - enabled PWM
>>>
>>> There is low memory on V3s (64MB) and maximum must be available to CMA:
>>> - CONFIG_CMA_SIZE_MBYTES=28
>>> - add swap to swapout other processes
>>> - decrease buffers in v4l2-request-test (.buffers_count from 16 to 6)
>>>
>>> Only H.264 decoder working - MPEG and H.265 unsupported by V3s,
>>> JPEG/MJPEG still unimplemented, encoder unimplemented
>>
>> When I tried to merged these patches I got merge conflicts.
>>
>> Possibly due to other 5.10 changes, but certainly because of conflicts
>> with patches from Jernej:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/20200825173523.1289379-4-jernej.skrabec@siol.net/
>> https://patchwork.linuxtv.org/project/linux-media/patch/20200825173523.1289379-5-jernej.skrabec@siol.net/
>>
>> I've merged Jerne's patches and posted a PR for that:
>> https://patchwork.linuxtv.org/project/linux-media/patch/f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl/
>>
>> Can you rebase your patches on top of my branch that contains Jernej's patches?
>>
>> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.11e
>>
>> Once my PR is merged into the media_tree master I can take your rebased
>> patches.
> 
> I updated patches:
> https://github.com/mcerveny/linux/tree/media_tree_for-v5.11e
> 
> BUT, commit (555 commits) for v5.10-1
> https://github.com/torvalds/linux/commit/fd5c32d80884268a381ed0e67cccef0b3d37750b
> disrupts usability of Cedrus H.264 (at least for my Allwinner V3s):
> 
> 1) colors are disrupted
> 
> There are missing some initialization now.
> 
> If I use "5.9" compatible code
> (last bisect good point https://github.com/torvalds/linux/commit/647412daeb454b6dad12a6c6961ab90aac9e5d29 )
> then reboot (not power-off!) and use new code 
> ( https://github.com/mcerveny/linux/tree/media_tree_for-v5.11e )
> and colors are OK.

Could this or the next issue be related to this bug fix?

https://git.linuxtv.org/media_tree.git/commit/?h=fixes&id=9ac924b98728c3733c91c6c59fc410827d0da49f

That fix isn't yet in our master tree.

> 
> 2) decoding of complex streams fails
> 
> ( https://github.com/mcerveny/v4l2-request-test/tree/v5.10 )
> - bbb-h264-all-i-32 - OK
> - bbb-h264-32 - bad from frame 5
> - bbb-h264-high-32 - bad from frame 6

I think cedrus devs need to take a look at these issues.

Regards,

	Hans

> 
> best regards,
> Martin
> 
>>> Changes since v1:
>>> - patch 0005 rename
>>> - added testing description
>>>
>>> Martin Cerveny (6):
>>>   media: cedrus: Register all codecs as capability
>>>   dt-bindings: sram: allwinner,sun4i-a10-system-control: Add V3s
>>>     compatibles
>>>   ARM: dts: sun8i: v3s: Add node for system control
>>>   media: cedrus: Add support for V3s
>>>   dt-bindings: media: cedrus: Add V3s compatible
>>>   ARM: dts: sun8i: v3s: Add video engine node
>>>
>>>  .../allwinner,sun4i-a10-video-engine.yaml     |  1 +
>>>  .../allwinner,sun4i-a10-system-control.yaml   |  6 ++++
>>>  arch/arm/boot/dts/sun8i-v3s.dtsi              | 33 +++++++++++++++++++
>>>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 28 +++++++++++++++-
>>>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 ++
>>>  .../staging/media/sunxi/cedrus/cedrus_video.c |  2 ++
>>>  6 files changed, 71 insertions(+), 1 deletion(-)
>>>
>>

