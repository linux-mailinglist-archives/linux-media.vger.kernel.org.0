Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0562E2A800D
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 14:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbgKENzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 08:55:03 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52849 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726067AbgKENzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 08:55:03 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id afj6kDNilNanzafj9kobEV; Thu, 05 Nov 2020 14:55:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604584501; bh=Os8Q6RoIFzpecz6IaKw3bDHhoVHVDp/wsU85OkcRmUY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wVbVNiKI1ni2WRTvKI7A1TOqQHSmAor2+Nr2aLT1NIe2Fc1ge7wnKhpnxbRNayXlA
         XIStbOZv/pHol/XIyMyhQsvsOkY1EJhG1VU54hiXtGdZMj24h0CloQ2zljt3R+jq7r
         9HHt7HZWGLPtF9VcZdO6Aa9SdRU11Sh34O/AgNlguJmmu+qtwW3KxT+ySOXpfZDJkN
         XVpwF03MOFVFceaBlHg5FF01e5g8/GGGN2bNp2ypa3toumFlAINuLgLnoOb+HnHT1Y
         qYz+1j/r3uOLOrjhIjjvHNYPvWK9IDs8oEEHc3TKvmeQsXgWUucMtsfJsAcW8+44Zq
         WlOe2T5g/AjEQ==
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
Message-ID: <c8cc3529-3e21-2a11-d258-bb03885a5c91@xs4all.nl>
Date:   Thu, 5 Nov 2020 14:54:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200912143052.30952-1-m.cerveny@computer.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKAnj7LQGDaYmCX296c3vrxWv5e/Ef2SUUKyJz1tzh8Hg7mcghn4UOMUtiDF15DbskEEobx/3GV3mKJD2QR/+BJvDWHqtiffPg+JqxWRCXdGkL4LKcAL
 b6V5jIRASp0YnUAjPXv8sTQ8ZicE5R4ThJApeNCQqCrczKLdML9AFoY+wfoHVpYtggLajoVCksU2K1jMfy33BCDILtJpgqt/rbRZBDLwaWwKeezaENCNlvVj
 rqwkrjSzFIGCluWZ57FtuUMXwvG4ZgpyETF8Sx2IhhyDDN3ZfS8CiExo8otjngEgSIJCONqGN8Yks14AFrI6hvlGUXxAHzYvDyIEJB4OkC8B6kOG6q98pzQi
 HJpOoIFNK+wzz5zkeif0O9rV+4nkXvLst2gX25uXjEiTaeAPHEq31/rcJAio7NuAGflbfD5ws+fjF6SbgppVOcdyjCf7GVmq2lt50iGtheq/rTgQ0lsTy2yl
 1XZ50JXtHleEL3YYTdwL5byb4JNnBec/rBzlZTCv6XRVnV7Sso9sMSPRhPhXTio4KNGI9yflco4KfQCDyJYmbn1BoOGzZ26+dXLKSljH5C+Ip10cN9/NKDr4
 niauSYp1j7DSffLElOjBPaP2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

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

When I tried to merged these patches I got merge conflicts.

Possibly due to other 5.10 changes, but certainly because of conflicts
with patches from Jernej:

https://patchwork.linuxtv.org/project/linux-media/patch/20200825173523.1289379-4-jernej.skrabec@siol.net/
https://patchwork.linuxtv.org/project/linux-media/patch/20200825173523.1289379-5-jernej.skrabec@siol.net/

I've merged Jerne's patches and posted a PR for that:
https://patchwork.linuxtv.org/project/linux-media/patch/f3b8e5e2-5f0e-fb6f-e5b2-7f44f7e365e7@xs4all.nl/

Can you rebase your patches on top of my branch that contains Jernej's patches?

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.11e

Once my PR is merged into the media_tree master I can take your rebased
patches.

Regards,

	Hans

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

