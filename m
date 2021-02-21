Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC8A320CDF
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 19:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhBUS5V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 13:57:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52172 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhBUS5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 13:57:19 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66E34EF;
        Sun, 21 Feb 2021 19:56:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613933797;
        bh=Ngh2nWieM7UOf8/1Dmr7OYj5+xZ/JbmEKYgPX0Y8z+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWvfbGDEaKMokkgwtpX0zTsO92AtturRe5xjkSabeLM+CCYtuYhsDTAR9T9u1K0xM
         m6fzcmfNcKZ4UGBbPjASR+nAg+mtb8Nt2DtqEJBkYn0/ln2OSKNjDguFugRBFMJBIC
         A7gPB76w6uJl98Wh2CBWqmI5ep8v+Z5UZlGsLlpY=
Date:   Sun, 21 Feb 2021 20:56:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     junak.pub@gmail.com, robert.foss@linaro.org,
        sakari.ailus@linux.intel.com, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jacopo@jmondi.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2.1 1/3] v4l: common: v4l2_get_link_freq: add printing a
 warning
Message-ID: <YDKsy46LhWz3BFBL@pendragon.ideasonboard.com>
References: <20210218171640.18764-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210218171640.18764-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

Thank you for the patch.

On Thu, Feb 18, 2021 at 08:16:40PM +0300, Andrey Konovalov wrote:
> Print a warning if V4L2_CID_LINK_FREQ control is not implemented.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 133d20e40f82..04af03285a20 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -469,6 +469,11 @@ s64 v4l2_get_link_freq(struct v4l2_ctrl_handler *handler, unsigned int mul,
>  			return -ENOENT;
>  
>  		freq = div_u64(v4l2_ctrl_g_ctrl_int64(ctrl) * mul, div);
> +
> +		pr_warn("%s: Link frequency estimated using pixel rate: result might be inaccurate\n",
> +			__func__);
> +		pr_warn("%s: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver\n",
> +			__func__);

It would still be nice if v4l2_ctrl_handler was extended with a struct
device pointer to use dev_warn() here, and allow replacing "the
transmitter driver" with the driver name.

>  	}
>  
>  	return freq > 0 ? freq : -EINVAL;

-- 
Regards,

Laurent Pinchart
