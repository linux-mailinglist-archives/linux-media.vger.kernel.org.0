Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9806349C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 12:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfGIK4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 06:56:31 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:51713 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGIK4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 06:56:31 -0400
Received: from [192.168.1.110] ([95.118.92.226]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MNOZO-1i9TFY3wZG-00Opru; Tue, 09 Jul 2019 12:56:11 +0200
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>, hans.verkuil@cisco.com,
        laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
        matthias.bgg@gmail.com, mchehab@kernel.org
Cc:     shik@chromium.org, devicetree@vger.kernel.org,
        Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com,
        srv_heupstream@mediatek.com, po-yang.huang@mediatek.com,
        suleiman@chromium.org, jungo.lin@mediatek.com,
        sj.huang@mediatek.com, yuzhao@chromium.org,
        linux-mediatek@lists.infradead.org, zwisler@chromium.org,
        christie.yu@mediatek.com, frederic.chen@mediatek.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <eb3bb92d-5d44-0d45-2e90-abcdb96f595d@metux.net>
Date:   Tue, 9 Jul 2019 12:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9oj8UdHJ6t/wVt9wG2RH64WnZHfuyRvuaL96Jz4wR4j6R+hcGHo
 K7u++aSF8H5+LIGL3GOrnpTy5Sbs1XDdM3JmDcbW7W/tYhhk3dcB+f8k9Gmva4P+YtAVbju
 SltL4ckjdz99PBeuTzWE5fVokOF0XBFiBViam5eq1YEwddtEjdFA6Wne1LNOkF5l536Vgk6
 V1bNYNfs5mTbDATvUp/iQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BIsBq3Xtv6U=:RbuUXGVxT51ZgbnCRpe2IO
 NZoqYL5klmbXWLgIEI8OCsjclrzCoKgHwlWO5pS6OT/C31sSfpmYkqIBw6ONMCS/qEv+JtE6R
 nAqnjKVjG+fT5aWvmNnB19X3elUgdm7HInzT7s6jnPnDLWwwsOGfF0nFGUntux7xRKtjXhbsH
 Eiu0cghyxxqmgEZ5LXsim950Ir4KmiS0zzhkJCd9Icc54FlIbRaLRr4VNM3eXMcO0BIv24LI9
 s9KW8YpPm5G3kxH2uwTLODtlYvolXSIGNPlYS8RuUjmfNJFYlW+VE3LRxIzhaAYYb7M/BIqgW
 O7s3I/M4ivy2TWlWmp3pWnjBfnPWRmmbayV+dQnnPMeVVeVrc/huMcEp+NYUMmcC+YjrgkMbb
 LDqHvWp4b9W818rHLpN91umbS4b1wV/32dkUoI0PoUNW1lZdFjbrzrJTQ2JleKLCUXltbNY9K
 fJ1LVsxTpXdx67bEXsC4NK+doMEfzTnYNi2VMLPSHKRrQ4kqWuI1VW7f0C6zidYpIKN0AYq1b
 Dy52APKD0IHgjPKIDt+3noc8zLJQdq64MEs+0KYn44QCv4wNpkIYJG8sbq0OFmcLvZKEh8sP5
 xcKwj1ifsRLjhPdjTEwqKlQLHAGGD++Fhv3yK+Yo5/DgE1cmlbIlprSk8R3Sxp846BkbzJwY2
 isc3a0E7WNbXWHNSScTh8xLuFL3+HzJbXAwZztHm0g94rgGPHHF9tAdnHEzqff90JkAc3UmQP
 zxcGa0mVwdpPnZEkk7JDEyxRxE+BxhybhnXi7fGaU+irDQkXA5a3pX7XEMN53olcDj2+QW4HT
 w5b46acg6W05ERHS72c4/r6RvGok/oaoMe+peTrf4OBEjsSgduu0P8/s/SAnQJQ7woo58KV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09.07.19 10:41, Jerry-ch Chen wrote:

Hi,


> diff --git a/drivers/media/platform/mtk-isp/fd/mtk_fd.h b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> new file mode 100644
> index 0000000..289999b
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/mtk_fd.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +//
> +// Copyright (c) 2018 MediaTek Inc.
> +
> +#ifndef __MTK_FD_HW_H__
> +#define __MTK_FD_HW_H__
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define MTK_FD_OUTPUT_MIN_WIDTH			26U
> +#define MTK_FD_OUTPUT_MIN_HEIGHT		26U
> +#define MTK_FD_OUTPUT_MAX_WIDTH			640U
> +#define MTK_FD_OUTPUT_MAX_HEIGHT		480U
> +
> +/* Control the user defined image widths and heights
> + * to be scaled and performed face detection in FD HW.
> + * MTK FD support up to 14 user defined image sizes to perform face detection.
> + */
> +#define V4L2_CID_MTK_FD_SCALE_IMG_WIDTH		(V4L2_CID_USER_MTK_FD_BASE + 1)
> +#define V4L2_CID_MTK_FD_SCALE_IMG_HEIGHT	(V4L2_CID_USER_MTK_FD_BASE + 2)

I've got a *really* bad feeling about introducing chip specific
uapi stuff. (by the way: uapi stuff belongs into include/uapi/...)

Maybe you could tell us what that's *really* about, so we can find some
standard / chip-independent api for these things. That's one of the
major point of the kernel: hardware abstraction.

> +#define ENABLE_FD				0x111
> +#define FD_HW_ENABLE				0x4
> +#define FD_INT_EN				0x15c
> +#define FD_INT					0x168
> +#define FD_RESULT				0x178
> +#define FD_IRQ_MASK				0x001
> +
> +#define RS_MAX_BUF_SIZE				2288788
> +#define FD_MAX_SPEEDUP				7
> +#define FD_MAX_POSE_VAL				0xfffffffffffffff
> +#define FD_DEF_POSE_VAL				0x3ff
> +#define MAX_FD_SEL_NUM				1026

If that file is supposed to be included by anything beyond the driver
itself, we need proper prefixing. (same for anything else in here)

> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 3dcfc61..eae876e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -192,6 +192,10 @@ enum v4l2_colorfx {
>   * We reserve 16 controls for this driver. */
>  #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
>  
> +/* The base for the mediatek FD driver controls */
> +/* We reserve 16 controls for this driver. */
> +#define V4L2_CID_USER_MTK_FD_BASE		(V4L2_CID_USER_BASE + 0x10d0)

Why only the base, but not the actual IDs in uapi ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
