Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B7B24791A
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbgHQVsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:48:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49024 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbgHQVsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:48:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 032BC298620
Subject: Re: [PATCH v2 11/14] media: staging: rkisp1: isp: don't enable signal
 RKISP1_CIF_ISP_FRAME_IN
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-12-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <6dce2cfd-db63-68ad-3cad-bdf340162f10@collabora.com>
Date:   Mon, 17 Aug 2020 18:48:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-12-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> The signal RKISP1_CIF_ISP_FRAME_IN is not used in the isr so
> there is no need to enable it.

I saw in the docs this is for when sampled input frame is complete.
(I was just wondering for curiosity what is a sampled input frame
here, but never mind).

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks,
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-isp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index 33cfad19dde2..912eb6ad4e0a 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -348,7 +348,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
>  	rkisp1_write(rkisp1, sink_crop->height, RKISP1_CIF_ISP_OUT_V_SIZE);
>  
>  	irq_mask |= RKISP1_CIF_ISP_FRAME | RKISP1_CIF_ISP_V_START |
> -		    RKISP1_CIF_ISP_PIC_SIZE_ERROR | RKISP1_CIF_ISP_FRAME_IN;
> +		    RKISP1_CIF_ISP_PIC_SIZE_ERROR;
>  	rkisp1_write(rkisp1, irq_mask, RKISP1_CIF_ISP_IMSC);
>  
>  	if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
> 
