Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D551F175721
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 10:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgCBJbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 04:31:25 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36166 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgCBJbZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 04:31:25 -0500
Received: by mail-wr1-f65.google.com with SMTP id j16so11628764wrt.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 01:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hHQzBnxTVwRA9K4vQ33kAGchAUPhicaP3l6fCUjQ1as=;
        b=hJYp8iRRO+IWU3ovdU4gq0OJdZLyuRTtV4QhEJhwa8Qy00gakWPUhSys4AMoctGHzJ
         n1piORhJMJC1DASAwKePxK5fVlXSGM8k+as+IUYOl7vBnktPjLjNR8uGnYsdzWZa8kcI
         jTwXXN3Qk3rPe4dGktEyzIrFYqoU3mZF5FLbz2usncc1vTjT1w4whta6IveQkagEGc3Q
         g2JbvOvUUqWw5V7zkV03n2gqA5PDpe5GSY/UqzvcbgctR225xZ75VLMf1XLzk+X1aiSu
         s5RKy7yw/0l3X1I6r3D/Me2yRH7NQlB7PSL2y58Rg7Cllbmf/x+uz/ELlzic5Vh1A82P
         CR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hHQzBnxTVwRA9K4vQ33kAGchAUPhicaP3l6fCUjQ1as=;
        b=PrkWGjdNOAvmxc7ZzYIy7ALXAGszNrV+yH+L5QtyaJFK24XSlpL7Nu9MQsuMd/5B9q
         oLxgrbr6QYv6fn1F1tCt6WTKAykESsK1CtafKOh6W1YBTM7b1aTwGbvUU2ypXHX5tX4c
         GT9RBrMfSiHIhm7p4iL2yt7DEv3o8Eewuv1K/L9cvz7ObE3v47fYRlb1E+t6MQIoiSFn
         QO56M2nhjSZAznwBmeuIYerV9ZHM5sTCj5qeW4iBdF76G1WEprw9nPoqOHmwHVFk2Tj4
         ii2GhXOqsVsnVY6ePJy4lg+6VpNjdCEcX10Aktoa96zcMX1MoGR13IuKETnTBjs45l1J
         a2Kw==
X-Gm-Message-State: APjAAAVTGOOnacUcQYlPQKXtB2nzsFkqHuN2tr12Y2QLP8yfPjgrq3+n
        MX3qFPXr8pORi39FXStcZPY=
X-Google-Smtp-Source: APXvYqwJfMJEsNYyDMpQJ56PrFWacS2oX3pj46n4lFidK+N2gQgzm2ZE+ml5/GKhrsLmxXNrFBu2xQ==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr21228520wrv.197.1583141483598;
        Mon, 02 Mar 2020 01:31:23 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id n8sm25533600wrx.42.2020.03.02.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 01:31:22 -0800 (PST)
Date:   Mon, 2 Mar 2020 09:31:20 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Propagate quantization and encoding in CSI
Message-ID: <20200302093120.t6ijr6qi4bpwpsmz@arch-thunder.localdomain>
References: <20200228232657.27028-1-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228232657.27028-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Fri, Feb 28, 2020 at 03:26:57PM -0800, Steve Longerbeam wrote:
> Unlike the PRPENC and PRPVF subdevices, the CSI's cannot convert
> quantization from sink to source, or do any kind of Y'CbCr <-> RGB
> encoding. So the CSI's cannot allow quantization and ycbcr_enc to be
> selectable by the user and must be propagated from sink to source.
> 
> Fixes: 4791bd7d6adc4 ("media: imx: Try colorimetry at both sink and source pads")
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Thanks, for imx7:
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx-media-csi.c  | 2 ++
>  drivers/staging/media/imx/imx7-media-csi.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index b60ed4f22f6d..ac15b1e78f18 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1459,6 +1459,8 @@ static void csi_try_fmt(struct csi_priv *priv,
>  		/* propagate colorimetry from sink */
>  		sdformat->format.colorspace = infmt->colorspace;
>  		sdformat->format.xfer_func = infmt->xfer_func;
> +		sdformat->format.quantization = infmt->quantization;
> +		sdformat->format.ycbcr_enc = infmt->ycbcr_enc;
>  
>  		break;
>  	case CSI_SINK_PAD:
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index db30e2c70f2f..4692a3a77515 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1013,6 +1013,8 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>  
>  		sdformat->format.colorspace = in_fmt->colorspace;
>  		sdformat->format.xfer_func = in_fmt->xfer_func;
> +		sdformat->format.quantization = in_fmt->quantization;
> +		sdformat->format.ycbcr_enc = in_fmt->ycbcr_enc;
>  		break;
>  	case IMX7_CSI_PAD_SINK:
>  		*cc = imx_media_find_mbus_format(sdformat->format.code,
> -- 
> 2.17.1
> 
