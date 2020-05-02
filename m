Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E101C2396
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 08:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgEBGko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 02:40:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:58086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgEBGko (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 May 2020 02:40:44 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC0D9208DB;
        Sat,  2 May 2020 06:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588401643;
        bh=veIQRujR2PEfdzDRCn259XTGbonPxwJS0bLgO0dYJow=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hnRu6CpvgMhn0bbEWa/fuaEznaD7Btef4wx+nXWNi23HKCun+vzAKXlt2DEYAjPt0
         Z609NbD7xnw4+xNd0SZIB7ZR+GvxFCkQu94nHGtLnS+9OEKnGC70zV1nwl+INl6YGt
         8WmmJH5A84NCaJVXNadNZtG1tUBx0gT++5bHyW/E=
Date:   Sat, 2 May 2020 08:40:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     sean@mess.org, kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de, linux-media@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC, WIP, v4 06/11] media: vidtv: add wrappers for memcpy and
 memset
Message-ID: <20200502084038.07c38c4b@coco.lan>
In-Reply-To: <20200502032216.197977-7-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
        <20200502032216.197977-7-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat,  2 May 2020 00:22:11 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> A lot of code in this driver is for serializing structures. This is
> error prone.
> 
> Therefore, prevent buffer overflows by wrapping memcpy and memset,
> comparing the requested length against the buffer size.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/Makefile     |  3 ++
>  .../media/test-drivers/vidtv/vidtv_common.c   | 44 +++++++++++++++++++
>  .../media/test-drivers/vidtv/vidtv_common.h   | 28 ++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
> 
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> index a9f1993dd5443..9ea9485d42189 100644
> --- a/drivers/media/test-drivers/vidtv/Makefile
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -1,3 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +vidtv_demod-objs := vidtv_common.o
> +vidtv_bridge-objs := vidtv_common.o
> +
>  obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
> new file mode 100644
> index 0000000000000..28f10630499a9
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/string.h>
> +#include <linux/printk.h>
> +
> +u32 vidtv_memcpy(void *to,
> +		 const void *from,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz)
> +{
> +	if (buf_sz && offset + len > buf_sz) {
> +		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
> +		       __func__);
> +		return 0;

shouldn't it return an error?

> +	}
> +
> +	memcpy(to, from, len);
> +	return len;
> +}
> +
> +u32 vidtv_memset(void *to,
> +		 int c,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz)
> +{
> +	if (buf_sz && offset + len > buf_sz) {
> +		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
> +		       __func__);
> +		return 0;
> +	}
> +
> +	memset(to, c, len);
> +	return len;
> +}
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
> new file mode 100644
> index 0000000000000..64072c010dc66
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_COMMON_H
> +#define VIDTV_COMMON_H
> +
> +#include <linux/types.h>
> +#include <media/dvb_frontend.h>
> +
> +u32 vidtv_memcpy(void *to,
> +		 const void *from,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz);
> +
> +u32 vidtv_memset(void *to,
> +		 int c,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz);
> +
> +#endif // VIDTV_COMMON_H


On a generic note, I don't like seeing functions or macros like those
re-defining existing Kernel functions like memcpy(), memset(), etc. 

This is actually a very common pattern when vendors try to submit
new drivers upstream: several of them have a generic code, and use an
OS-specific abstraction layer, with lots of defines, inline functions
and re-definitions for Kernel functions.

Before upstreaming a driver (or removing one from staging), the driver
should get rid of those.

On **this very specific case**, I see the value of having it there, as
you're not doing it as a normal Digital TV driver, but, instead, using
those in order to emulate an MPEG-TS encoding.

Yet, as this driver is meant to be a sort of "tutorial" for ones
implementing such features, please add a WARNING at both the header and
at the source code, saying that normal drivers should not do that,
explaining why, in this specific case (where you're simulating a MPEG-TS
in software) it makes sense to have such functions.

Thanks,
Mauro
