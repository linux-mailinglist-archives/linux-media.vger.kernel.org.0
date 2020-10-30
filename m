Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8562A03A9
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgJ3LGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:06:19 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58445 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725808AbgJ3LGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:06:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YSEUknz6cWvjMYSEXkHAQf; Fri, 30 Oct 2020 12:06:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604055977; bh=MPINL0x+YgE1zrfqIMBCjq16Ytw83Vxoo5XMTG3tTYM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e+vUNUgPZpLxrnDl+BVK9blSVoOJYn9lZMt595T4geL2DEc/Q/XRwGlwC06RMz1jk
         PWpR8nK7g6/bhVtxebFYbn38zr2RJnaFFhs3vjVF6BVW1QJIt83JpqN4YsN8fgH4lk
         gl5mYGoZmIpuRgvqgJTDE4h15vIHK+6ogqjEraGrO0eB2HU8y1iPRF4dXR2VsJ63a+
         lD0xbNkUo13Hmi1sVtdxBL73iwCyfwAXQof9yr1gY9JNvPJylAlesLa0FzUCUXl3Na
         camzeV1IfLpFSKXLvCx7jlOmEycgrFh9UKCOAaaaruMiWLqeix8Ev/NdSXwMi0HBJ3
         53uu3QNZvb9YA==
Subject: Re: [PATCH v2 0/6] ARM: dts: sun8i: v3s: Enable video decoder
To:     Martin Cerveny <m.cerveny@computer.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20200912143052.30952-1-m.cerveny@computer.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <034d8de1-bcf3-88e6-4d23-9a13e8b950c3@xs4all.nl>
Date:   Fri, 30 Oct 2020 12:06:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200912143052.30952-1-m.cerveny@computer.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPk/Quh1gIPsgZdoLL3OS0LA/MmvP72jK4Pqvra+hdcwDaWr2TPMHaJSa/g/6I1V58Bij9/ny2pUg53Amjmyg3aVILlbz3CyRPr9yS3jSMAgtJkiYuJs
 mGLSNfSQNPiuzhHVAOZ9pRpCjmgE8G8pMqOofn+u1InxcFjy9hskNgZlk3ELhCVe3eyEzAymQOZArl/ePtTVllzjcDM2VahpTJVxlTpgl1ufv6dmSQN7rlMF
 8GaNcO4srz611UC3uo1Vj56F/ItW/zy6RhqL1qEfK4QI4yKcP3LUsyE5pcQt3IGIqN1r1afA2wtvNGJaWNojcDh8R6BZjTQUNz1t2R1A9mHhbvhtakzKLxh8
 HP7QV7WtBK4IOczGKKRuRZRvVE6o47+Dqti4NTE8iezOok0c9MqphYs/XjGuNW0GDHZZNqs/wZdAVWd2AT9itQ3CqNJwuE862UDUqxV+wDeCYND4QCljne11
 CDWQa3nziKnDCcx68/YGo4lp4ykF9l82ExvE5LNHnlMAZxe0kMYS30a+2qfV8hhX0UrBN3XVk+9f0F9A/Fs79H/23OPec+fQl0oZUyZBZhGK4/oL2rrN8jVM
 hajsRByWqpLyL8JmeTX+w0+H
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Maxime,

Are you OK with this series? It looks good to me.

Regards,

	Hans

On 12/09/2020 16:30, Martin Cerveny wrote:
> First patch extends cedrus capability to all decoders
> because V3s missing MPEG2 decoder.
> 
> Next two patches add system control node (SRAM C1) and 
> next three patches add support for Cedrus VPU.
> 
> Tested on "Lichee Zero" V3s platform with testing LCD patch
> ( https://github.com/mcerveny/linux/tree/v3s_videocodec_v4 )
> and V4L2 raw API testing utility
> ( https://github.com/mcerveny/v4l2-request-test ):
> - enabled LCD (DRM dual VI and sigle UI planes)
> - added RGB panel
> - enabled PWM
> 
> There is low memory on V3s (64MB) and maximum must be available to CMA:
> - CONFIG_CMA_SIZE_MBYTES=28
> - add swap to swapout other processes
> - decrease buffers in v4l2-request-test (.buffers_count from 16 to 6)
> 
> Only H.264 decoder working - MPEG and H.265 unsupported by V3s,
> JPEG/MJPEG still unimplemented, encoder unimplemented
> 
> best regards,
> Martin
> 
> Changes since v1:
> - patch 0005 rename
> - added testing description
> 
> Martin Cerveny (6):
>   media: cedrus: Register all codecs as capability
>   dt-bindings: sram: allwinner,sun4i-a10-system-control: Add V3s
>     compatibles
>   ARM: dts: sun8i: v3s: Add node for system control
>   media: cedrus: Add support for V3s
>   dt-bindings: media: cedrus: Add V3s compatible
>   ARM: dts: sun8i: v3s: Add video engine node
> 
>  .../allwinner,sun4i-a10-video-engine.yaml     |  1 +
>  .../allwinner,sun4i-a10-system-control.yaml   |  6 ++++
>  arch/arm/boot/dts/sun8i-v3s.dtsi              | 33 +++++++++++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 28 +++++++++++++++-
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 ++
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  2 ++
>  6 files changed, 71 insertions(+), 1 deletion(-)
> 

