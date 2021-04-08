Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C97358F04
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 23:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhDHVPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 17:15:36 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63529 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231862AbhDHVPg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 17:15:36 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AguW+CqOVkLKASMBcTiCjsMiAIKoaSvp033AA?=
 =?us-ascii?q?0UdtRRtJNvGJjszGpoV+6TbYgCscMUtKpfmuI6+FKEm3ybdU5s0rMa6mTE3avg?=
 =?us-ascii?q?KTTb1KyavH73neFzbl9uhbvJ0QFpRWLNHrF1B1gYLbzWCDc+oI+9WM/KC2ieq2?=
 =?us-ascii?q?9R4EcShQZ65t9At/AAqAe3cGJzVuP4YzF5aX+6N8yQaIRHJ/VKiGL0UeU/OGj9?=
 =?us-ascii?q?PGk4+OW29lOzcXrDjLtz+u5bLgeiL04j4VWVp0rosfzQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,207,1613430000"; 
   d="scan'208";a="502294468"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 23:15:08 +0200
Date:   Thu, 8 Apr 2021 23:15:07 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Mitali Borkar <mitaliborkar810@gmail.com>
cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH 2/2] media: zoran: replace bit shifts
 by BIT() macro
In-Reply-To: <ac8ec2b70ac2cc7c541c05a1d9a8db1fe79df793.1617912177.git.mitaliborkar810@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104082314090.21785@hadrien>
References: <cover.1617912177.git.mitaliborkar810@gmail.com> <ac8ec2b70ac2cc7c541c05a1d9a8db1fe79df793.1617912177.git.mitaliborkar810@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Fri, 9 Apr 2021, Mitali Borkar wrote:

> Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
> This BIT() macro from linux/bitops.h is used to define ZR36057_VFESPFR_* bitmasks.
> Use of macro is better and neater. It maintains consistency.
> Reported by checkpatch.
>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/zoran/zr36057.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
> index a2a75fd9f535..93075459f910 100644
> --- a/drivers/staging/media/zoran/zr36057.h
> +++ b/drivers/staging/media/zoran/zr36057.h
> @@ -8,6 +8,8 @@
>  #ifndef _ZR36057_H_
>  #define _ZR36057_H_
>
> +#include <linux/bitops.h>
> +
>  /* Zoran ZR36057 registers */
>
>  #define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
> @@ -31,12 +33,12 @@
>  #define ZR36057_VFESPFR_VER_DCM          8
>  #define ZR36057_VFESPFR_DISP_MODE        6
>  #define ZR36057_VFESPFR_YUV422          (0 << 3)
> -#define ZR36057_VFESPFR_RGB888          (1 << 3)
> +#define ZR36057_VFESPFR_RGB888          BIT(3)

Uniformity is generally considered to be more important than using BIT.
Having only a few constants defined using BIT is a bit strange.

julia

>  #define ZR36057_VFESPFR_RGB565          (2 << 3)
>  #define ZR36057_VFESPFR_RGB555          (3 << 3)
> -#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
> -#define ZR36057_VFESPFR_PACK24          (1 << 1)
> -#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
> +#define ZR36057_VFESPFR_ERR_DIF          BIT(2)
> +#define ZR36057_VFESPFR_PACK24          BIT(1)
> +#define ZR36057_VFESPFR_LITTLE_ENDIAN    BIT(0)
>
>  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
>
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/ac8ec2b70ac2cc7c541c05a1d9a8db1fe79df793.1617912177.git.mitaliborkar810%40gmail.com.
>
