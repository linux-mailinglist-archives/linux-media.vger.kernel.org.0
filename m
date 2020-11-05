Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BEA2A7F25
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbgKEM4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:56:10 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50493 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726067AbgKEM4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:56:07 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aeo6kD2FCNanzaeo9koO73; Thu, 05 Nov 2020 13:56:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604580966; bh=lPvaY8EFns9S63OScL565fzyrRI4AT8uMsd+/iZrJwk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dENg2RduW3l5+ihEmWzm/I4tX7cL1e9MzrsiThQp56i/9W5+OEK82RUjHJCR5SqMQ
         frPOv+VQUu2+DuA8cdX7Og8JXLMxcTlZOeK7Vfxl2y5rYBhiGJrVnibiQcIeaq2bt3
         4xjotii74kfRGhCKChuZAUbe3/C/0Tj/zE+YuN2vT7pyhLtQmSHl9tIDdfjTgeJe3S
         WMShuTBjLdtiGDscJ6ZXHjMTMuDO2QA5Gc3rotXGpNGPEoU5lpo1GT2LOeGwvmJfYP
         ZSM2UWO3MpyXOP3hQdWyHONSjJ+pkAVBQT6a7jjlA+tvB9ObN8TRnqmLwjgDO9ePUh
         cvleN+u6bSRqQ==
Subject: Re: [PATCH v2 099/106] v4l: uapi: ccs: Add controls for analogue gain
 constants
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-90-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8dd2be66-e253-e535-ecfc-f51747204424@xs4all.nl>
Date:   Thu, 5 Nov 2020 13:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007084557.25843-90-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE95Ud7WjnQYjwjT23tE7R0rgLgV4xHzAzVnj66AvNgW7p1ClCklL64I8Dy2gERxxp/JzoDyKwJgeP6/OGXRXIuarjpqqDkd0TMWW/H8XNmNGzJ1usjS
 u2ismQjiSpRq+MBg767+7KymGhRQiPDGHOjZRgu0K5v/+lJMwj8uybEPqcsKOIiJ1J3p4Z3xQEDxLO/miSxasOTobaFVj3cY2S2+I9qpK7qyq2MmbEg3VwMG
 6wIRWnWNBAOzhccwVRHyiw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/10/2020 10:45, Sakari Ailus wrote:
> Add a V4L2 controls for analogue gai constants required to control
> analogue gain. The values are device specific and thus need to be obtained
> from the driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS              |  1 +
>  include/uapi/linux/ccs.h | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 include/uapi/linux/ccs.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b72f666b8b60..c173e503b0b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11569,6 +11569,7 @@ F:	drivers/media/i2c/ccs/
>  F:	drivers/media/i2c/ccs-pll.c
>  F:	drivers/media/i2c/ccs-pll.h
>  F:	include/uapi/linux/smiapp.h
> +F:	include/uapi/linux/ccs.h
>  
>  MIPS
>  M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> diff --git a/include/uapi/linux/ccs.h b/include/uapi/linux/ccs.h
> new file mode 100644
> index 000000000000..bcdce95955b0
> --- /dev/null
> +++ b/include/uapi/linux/ccs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only AND BSD-3-Clause */
> +/* Copyright (C) 2020 Intel Corporation */
> +
> +#ifndef __UAPI_CCS_H__
> +#define __UAPI_CCS_H__

What does CCS stand for? Provide a reference to the standard as well.

Just looking at this header doesn't give you any clue as to what it
related to.

Regards,

	Hans

> +
> +#include <linux/videodev2.h>
> +
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_M0		(V4L2_CID_USER_CCS_BASE + 1)
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_C0		(V4L2_CID_USER_CCS_BASE + 2)
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_M1		(V4L2_CID_USER_CCS_BASE + 3)
> +#define V4L2_CID_CCS_ANALOGUE_GAIN_C1		(V4L2_CID_USER_CCS_BASE + 4)
> +
> +#endif
> 

