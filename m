Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195862C2AA
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 11:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfE1JHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 05:07:09 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39617 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726557AbfE1JHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 05:07:08 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VY4Whh3TBsDWyVY4YhcNp2; Tue, 28 May 2019 11:07:06 +0200
Subject: Re: [RFCv1 04/12] media: mtk-vcodec: fix copyright indent
To:     Alexandre Courbot <acourbot@chromium.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20190528055635.12109-1-acourbot@chromium.org>
 <20190528055635.12109-5-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fa11a504-071e-f786-8564-cb7e95248f64@xs4all.nl>
Date:   Tue, 28 May 2019 11:07:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528055635.12109-5-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNgP3bKa8S2uESOwLT0GPUnLycNeowjEr5Lggzem4wfMEaDIBq7m4Zg6V5IkvWrB5sEVohwm2tLybYHYAPBWGs5mTvILdj7wZ8LeJJIpshmsM+ff6IXR
 LgFWaFhA/KldlsvLQ7wY78oBn3xOFJPgxrYdlVbmOuGekUR502TT14QrD5cCO/mFn1AdD6zCt8daTwSthQbhitomrG5YHiL+fUxtVpYOWzLfRqgFxL+knYVC
 hcFcYAa8qVog3BP21OOwxeAjs3Nk4lYFWpxhLmoWOTb8Vh1x5/1IBHttdGzHVatK+GVvGowRiseoZ6Upzezwzny5onfYJzsOekUpHrOL3TZ1H81orKKUc6EZ
 lQecz5n9TNReOGU9EftN3TP6f6sjUBVKzt+uBI/x3+xmO/Z34l8CV/b20hf0TyaTU6HD/m6A7lg2uCrVlAOsoKNJGDN1GqR0f9gOsijsiuCL4R1ouA1JsKPB
 wzMGhkyGOogDwsbc8acyXRK02oQ/OyVAZOKB70o8LI9d2qZW/AJzkMV+YxP8q5AVsU1N2BCeOsW0SnNRjq9dmHCmdaFkKPsxfM2LABkvoUSS9seRGnQ5SWPD
 Q5Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Minor identation fix for copyright notice in a few source files.

How about converting to using SPDX as well?

Regards,

	Hans

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 26 +++++++++----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 26 +++++++++----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 24 ++++++++---------
>  3 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 109c7578a8b2..76905e2d56a7 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -1,17 +1,17 @@
>  /*
> -* Copyright (c) 2016 MediaTek Inc.
> -* Author: PC Chen <pc.chen@mediatek.com>
> -*         Tiffany Lin <tiffany.lin@mediatek.com>
> -*
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License version 2 as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it will be useful,
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -* GNU General Public License for more details.
> -*/
> + * Copyright (c) 2016 MediaTek Inc.
> + * Author: PC Chen <pc.chen@mediatek.com>
> + *         Tiffany Lin <tiffany.lin@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
>  
>  #ifndef _MTK_VCODEC_DRV_H_
>  #define _MTK_VCODEC_DRV_H_
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 2d5a61c06287..32d8ce9c8f6e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -1,17 +1,17 @@
>  /*
> -* Copyright (c) 2016 MediaTek Inc.
> -* Author: PC Chen <pc.chen@mediatek.com>
> -*         Tiffany Lin <tiffany.lin@mediatek.com>
> -*
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License version 2 as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it will be useful,
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -* GNU General Public License for more details.
> -*/
> + * Copyright (c) 2016 MediaTek Inc.
> + * Author: PC Chen <pc.chen@mediatek.com>
> + *         Tiffany Lin <tiffany.lin@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
>  
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 39375b8ea27c..2fdae50173be 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -1,16 +1,16 @@
>  /*
> -* Copyright (c) 2016 MediaTek Inc.
> -* Author: Tiffany Lin <tiffany.lin@mediatek.com>
> -*
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License version 2 as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it will be useful,
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -* GNU General Public License for more details.
> -*/
> + * Copyright (c) 2016 MediaTek Inc.
> + * Author: Tiffany Lin <tiffany.lin@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
>  
>  #include <linux/clk.h>
>  #include <linux/of_address.h>
> 

