Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706C42D93E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 11:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfE2Jk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 05:40:58 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37601 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725874AbfE2Jk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 05:40:58 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Vv4oh5D803qlsVv4phsgAe; Wed, 29 May 2019 11:40:55 +0200
Subject: Re: [PATCH] media: atmel: atmel-isc: split driver into driver base
 and isc
To:     Eugen.Hristev@microchip.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     ksloat@aampglobal.com
References: <1557392634-11090-1-git-send-email-eugen.hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f52b31cf-87e8-dd00-8b6d-46b02f383507@xs4all.nl>
Date:   Wed, 29 May 2019 11:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557392634-11090-1-git-send-email-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJO+Rck8XgIgDzqDevl/WtnQwXsXIDnXPhT4hBPRHrf86UcQBfn9Dxa4P0CTosG8i9EfYGoRksbLIWwJYFG/lhEJALVx3f5j1l3xq8FhkPVfvc+Xesl+
 18k/JX+0oHLsacve0GzsZZbqcIYRU6xnyGiQTwpqXPmLEgBfhfjyRU/8ik2ynIdLg1Z02Bek5kNN1LpP7KkSI/XdoQSPp4P0nxRtK0a4jjWdge+LwaND6qoz
 +XdByEiJ+zT7EXTAaZkJbYBy229jBlp/FqHvIxXOpxi0A7tR3mv9SvxKd3vMrb0dkeOQfcWDwqYp+RjXDYGwe4IJiG4+SaNjZ+0l1ELzfTvFWOsiNohumedN
 wAN1dXU9eJCddwcmTvn2hmcs6hCmV6TVa3wdZzLsw2FcUxtbBu+tDEE+zfqGBhCHfKmmYCVUQjBi4tuKj8l4vrhklMPDYw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/9/19 11:09 AM, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> This splits the Atmel ISC driver into a common base: atmel-isc-base.c
> and the driver probe/dt part , atmel-isc.c
> This is needed to keep a common ground for the sensor controller which will
> be reused.
> The atmel-isc will use the common symbols inside the atmel-isc-base
> Future driver will also use the same symbols and redefine different aspects,
> for a different version of the ISC.
> This is done to avoid complete code duplication by creating a totally
> different driver for the new variant of the ISC.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> 
> Hello,
> 
> This patch applies on top of my other patches:
> 
> media: atmel: atmel-isc: make try_fmt error less verbose
> media: atmel: atmel-isc: add support for DO_WHITE_BALANCE
> media: atmel: atmel-isc: reworked white balance feature
> 
> Thanks !
> 
>  MAINTAINERS                                   |    2 +
>  drivers/media/platform/atmel/Makefile         |    1 +
>  drivers/media/platform/atmel/atmel-isc-base.c | 2144 +++++++++++++++++++++++
>  drivers/media/platform/atmel/atmel-isc.c      | 2311 +------------------------
>  drivers/media/platform/atmel/atmel-isc.h      |  210 +++
>  5 files changed, 2372 insertions(+), 2296 deletions(-)
>  create mode 100644 drivers/media/platform/atmel/atmel-isc-base.c
>  create mode 100644 drivers/media/platform/atmel/atmel-isc.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 878588c..8799779 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10110,6 +10110,8 @@ M:	Eugen Hristev <eugen.hristev@microchip.com>
>  L:	linux-media@vger.kernel.org
>  S:	Supported
>  F:	drivers/media/platform/atmel/atmel-isc.c
> +F:	drivers/media/platform/atmel/atmel-isc.h
> +F:	drivers/media/platform/atmel/atmel-isc-base.c
>  F:	drivers/media/platform/atmel/atmel-isc-regs.h
>  F:	Documentation/devicetree/bindings/media/atmel-isc.txt
>  
> diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
> index 27000d0..9c8566e 100644
> --- a/drivers/media/platform/atmel/Makefile
> +++ b/drivers/media/platform/atmel/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
>  obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
> +obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc-base.o

This doesn't work. If a module consists of two sources, then you must make sure
those sources do not have the same name as the module.

So you have to rename atmel-isc.c.

See e.g. drivers/media/platform/rcar-vin/Makefile on how that's done for
CONFIG_VIDEO_RCAR_VIN.

<snip>

> diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> new file mode 100644
> index 0000000..1e285f1
> --- /dev/null
> +++ b/drivers/media/platform/atmel/atmel-isc.h
> @@ -0,0 +1,210 @@

<snip>

> +
> +#if defined(CONFIG_VIDEO_ATMEL_ISC)

Why this #if???

> +#define ATMEL_ISC_NAME "atmel-isc"
> +#endif
> +
> +#endif
> 

If I configure atmel-isc as a module, then I get these errors:

  CC [M]  drivers/media/platform/atmel/atmel-isc-base.o
drivers/media/platform/atmel/atmel-isc-base.c: In function ‘isc_querycap’:
drivers/media/platform/atmel/atmel-isc-base.c:906:23: error: ‘ATMEL_ISC_NAME’ undeclared (first use in this function); did you mean ‘CTL_MAXNAME’?

  strscpy(cap->driver, ATMEL_ISC_NAME, sizeof(cap->driver));
                       ^~~~~~~~~~~~~~
                       CTL_MAXNAME
drivers/media/platform/atmel/atmel-isc-base.c:906:23: note: each undeclared identifier is reported only once for each function it appears in

drivers/media/platform/atmel/atmel-isc-base.c: In function ‘isc_async_complete’:
drivers/media/platform/atmel/atmel-isc-base.c:2063:22: error: ‘ATMEL_ISC_NAME’ undeclared (first use in this function); did you mean ‘CTL_MAXNAME’?

  strscpy(vdev->name, ATMEL_ISC_NAME, sizeof(vdev->name));
                      ^~~~~~~~~~~~~~
                      CTL_MAXNAME
drivers/media/platform/atmel/atmel-isc.c: In function ‘atmel_isc_probe’:
drivers/media/platform/atmel/atmel-isc.c:180:11: error: ‘ATMEL_ISC_NAME’ undeclared (first use in this function); did you mean ‘CTL_MAXNAME’?

           ATMEL_ISC_NAME, isc);
           ^~~~~~~~~~~~~~
           CTL_MAXNAME

Probably related to one or both of my comments above.

Regards,

	Hans
