Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12378DA6C7
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392882AbfJQHvf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:51:35 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58019 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728735AbfJQHvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:51:35 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L0ZEiNQokPduvL0ZHitZi9; Thu, 17 Oct 2019 09:51:32 +0200
Subject: Re: [PATCH v3 5/6] media: sun4i: Add H3 deinterlace driver
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org,
        wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20191016192807.1278987-1-jernej.skrabec@siol.net>
 <20191016192807.1278987-6-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d768b2bc-a942-03a6-253d-4bcc31f1b11e@xs4all.nl>
Date:   Thu, 17 Oct 2019 09:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191016192807.1278987-6-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFzjUTWPxOlTU4hlEoCPjG/vSnr5xKQMF8XCQ+SW2mlaLMTpQxaZ4EILqCiVCuh6PT0/ZGWxxDnt9eqTiqgrU30Ii5IcSv5qXVgZKrKwRQi+3s/KXvlH
 cW3X33jRHUWkl54rP0BkXftU0szeQJ0072L78iJO5WHkMZWfgWh3+Eu0GlW9LYPLUreGywKDX382EmsMo//teqCpW8UzBd3qtfur6RZwyfW/PVnpXHTX8w54
 3NATx7a3KgEanmyT+7lBoLehSIZJPcE3ExuqcJ85gypFZE3mPBaYNeWWbhMdOjn9xy72VKc7+rhYNrXfCbI4r1GAWenmaRGgPck9UZ/QvmmnKfCv6MfEjGzF
 mCa2bWuWOcPyvM0/TmOQgX5PPXzDQLe+f2LNK1WgOHJKCM3W4NGwSwCyk+GUWKj7cdJF40IruCU3/x3I05XQifPut6thHfBVH4LS/N5AEienYd4m/Ga7z/2p
 H1UtYUZCGmnxHATQJZxlSooZhRP/qiBbjU3WvKAlGacH643rIINbhwIy/mE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/16/19 9:28 PM, Jernej Skrabec wrote:
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
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  MAINTAINERS                                   |    7 +
>  drivers/media/platform/sunxi/Kconfig          |    1 +
>  drivers/media/platform/sunxi/Makefile         |    1 +
>  drivers/media/platform/sunxi/sun8i-di/Kconfig |   11 +
>  .../media/platform/sunxi/sun8i-di/Makefile    |    2 +
>  .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 1020 +++++++++++++++++
>  .../media/platform/sunxi/sun8i-di/sun8i-di.h  |  237 ++++
>  7 files changed, 1279 insertions(+)
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Kconfig
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
> +
>  DELL SMBIOS DRIVER
>  M:	Pali Rohár <pali.rohar@gmail.com>
>  M:	Mario Limonciello <mario.limonciello@dell.com>
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
> index 71808e93ac2e..d7a5621bf327 100644
> --- a/drivers/media/platform/sunxi/Kconfig
> +++ b/drivers/media/platform/sunxi/Kconfig
> @@ -1,2 +1,3 @@
>  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
>  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-di/Kconfig"

This is a m2m driver, so this belongs in drivers/media/platform/Kconfig in the
Memory-to-memory section.

> diff --git a/drivers/media/platform/sunxi/Makefile b/drivers/media/platform/sunxi/Makefile
> index a05127529006..3878cb4efdc2 100644
> --- a/drivers/media/platform/sunxi/Makefile
> +++ b/drivers/media/platform/sunxi/Makefile
> @@ -1,2 +1,3 @@
>  obj-y		+= sun4i-csi/
>  obj-y		+= sun6i-csi/
> +obj-y		+= sun8i-di/
> diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig b/drivers/media/platform/sunxi/sun8i-di/Kconfig
> new file mode 100644
> index 000000000000..dbd77a61e3b3
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun8i-di/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_SUN8I_DEINTERLACE
> +	tristate "Allwinner Deinterlace driver"
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on HAS_DMA
> +	depends on OF
> +	depends on PM
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	   Support for the Allwinner Deinterlace unit found on some SoCs.

Shouldn't this depend on ARCH_SUNXI || COMPILE_TEST?
And also on COMMON_CLK?

Regards,

	Hans
