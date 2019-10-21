Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A65DEA88
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 13:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfJULN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 07:13:28 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:44325 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727571AbfJULN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 07:13:27 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MVcniUFpbo1ZhMVcqiLppd; Mon, 21 Oct 2019 13:13:25 +0200
Subject: Re: [PATCH v4 5/6] media: sun4i: Add H3 deinterlace driver
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org,
        wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20191017183738.68069-1-jernej.skrabec@siol.net>
 <20191017183738.68069-6-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8137fbb3-036a-95e4-2642-5dd46fb55eb9@xs4all.nl>
Date:   Mon, 21 Oct 2019 13:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017183738.68069-6-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOrcYAqH7QBWivX1AK7DllWSBUikBvpznnE0MCXdnJosMmjiQHFQoFOuDzkFg++s7AkvCd6Opgc3BsGoZqLEL7ZqPX8v6rDZHCa5ifDgksR9t+4pRPCZ
 fN+EMR3lWs0VBDAA6hWnNAMidQBrH/8raspDN/zVlgGKUP5w4K6d2FHdkGV9VRnzsJrw2LlRdOpqXajwCPfg6YUSFWUGe/1Owt8dKERa3AcaZZzVtEEdK5Ah
 lfbxQXo58S4JsIEy59RsW2utfHc8NzwSE6B9lTzU8SplcjMBxhUIzrYDBUQu/i+kFBrWxB0gWsNaXWn02oJU6vnveEddueSDOdeKmofpfhDsVmpoGi9Lv48H
 GrfiIfaYsPt3ddOy4G7f6voveea3cykjYeqNJRGdY17iZ/Z68XPXYAd/sCuBMCNy3e6e/p4MHS+RbaeokiKlt+39Qsu6d7VHqDuXaQLLorl48YzCINRfzZmO
 j/jE9cM7+akN4pJ0mDB5vGZchJ2iBkmpjZt9EHlIwg3I728Jvf5/Ht+gg5M=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/17/19 8:37 PM, Jernej Skrabec wrote:
> Allwinner H3 SoC contains deinterlace unit, which has several modes of
> operation - bypass, weave, bob and mixed (advanced) mode. I don't know
> how mixed mode works, but according to Allwinner it gives best results,
> so they use it exclusively. Currently this mode is also hardcoded here.
> 
> For each interleaved frame queued, this driver produces 2 deinterlaced
> frames. Deinterlaced frames are based on 2 consequtive output buffers,
> except for the first 2, where same output buffer is given to peripheral
> as current and previous.
> 
> There is no documentation for this core, so register layout and fixed
> values were taken from BSP driver.
> 
> I'm not sure if maximum size of the image unit is capable to process is
> governed by size of "flag" buffers, frequency or it really is some HW
> limitation. Currently driver can process full HD image in ~15ms (7.5ms
> for each capture buffer), which allows to process 1920x1080@60i video
> smoothly in real time.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  MAINTAINERS                                   |    7 +
>  drivers/media/platform/Kconfig                |   12 +
>  drivers/media/platform/sunxi/Makefile         |    1 +
>  .../media/platform/sunxi/sun8i-di/Makefile    |    2 +
>  .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 1028 +++++++++++++++++
>  .../media/platform/sunxi/sun8i-di/sun8i-di.h  |  237 ++++
>  6 files changed, 1287 insertions(+)
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c7b48525822a..c375455125fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4646,6 +4646,13 @@ M:	"Maciej W. Rozycki" <macro@linux-mips.org>
>  S:	Maintained
>  F:	drivers/net/fddi/defxx.*
>  
> +DEINTERLACE DRIVERS FOR ALLWINNER H3
> +M:	Jernej Skrabec <jernej.skrabec@siol.net>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	drivers/media/platform/sunxi/sun8i-di/

This is missing the bindings file added in the previous patch.

Regards,

	Hans

> +
>  DELL SMBIOS DRIVER
>  M:	Pali Rohár <pali.rohar@gmail.com>
>  M:	Mario Limonciello <mario.limonciello@dell.com>

