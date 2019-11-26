Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F53A10A6CA
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 23:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfKZWtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 17:49:16 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41177 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfKZWtQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 17:49:16 -0500
Received: by mail-wr1-f66.google.com with SMTP id b18so24411211wrj.8
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 14:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j4ixgsYNsCU+9RJQ37+KgxI6EMV7c3yIzFP0xnU5Jas=;
        b=If+Y2AdPd5l0u5oxzwygJyAr2A4UlOKbEI22YjmFKaKLPB/gCj6yBli0xil14SERea
         dFF8v+EgCtXudoPxL74kqcGHy43wPazlB+WQm9WZXiLxUI8MhegQRkaoD+AChzykLihX
         L207Rn21YTQP1YbqtoMG0QdGR/l8HZxbVlfSKBzLObKZ0GCVyXR3dMf56PD6GW2NbT+o
         uIDhC2xRGdgcQh6uliu/Iw6fbMNGx29jselUTkX/kJjsJSUBQJRMj789cDyba/IQOsj8
         e11k3cksoiIvaDiKYPf5bhyPtBZ1SeCuld7epUQ+P3348/oylHKj558cUt6zsZPI75KJ
         Rvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j4ixgsYNsCU+9RJQ37+KgxI6EMV7c3yIzFP0xnU5Jas=;
        b=p1lgNx+jsLQtwnSwA9tL5duT4qCxVs2/Ep68D2wSg931YjkEZZF89C5QAfqNPDbGYH
         4oPs8ZSiEjSZU1ihf6P2UbJQitTqDvPuuyUfIz4MJmsQHmiiZ/u3R/p+OlOhrvd0tOlG
         9BbGfaYVZtxQoxibw5dyq3PVje/PpiGHCme5hQWD1IbiZkunPhXuXVPRa5/zUvVdlM5G
         4NMpT/DqfDmzMthMj5vl4xKjJAA+O3eAum9fSko35aKBAw78T/3y1NstRUoUbrWa9OBa
         BR/61R+IQBH+/Cqsx0oXLx1t4WT5U+K8xam4OOCqAtGo5FZAGxXnLAoToqCi6rWY/TS/
         GZ3A==
X-Gm-Message-State: APjAAAVEBwc0NC3K2S2jyNVRmOcXWpVvi8TSS9MYD+eVsTBZN5KLa1td
        R0l7w1xlHqG8thC4Y9d7ls8MUc2B
X-Google-Smtp-Source: APXvYqx27ljqF//wCP/n/qS1tWfqGeIoKRI5qTK1qPd/g4Yi0MzLDW8AAhiymmiclBCrQPjRCQ/WrA==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr31604003wru.220.1574808552730;
        Tue, 26 Nov 2019 14:49:12 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c72sm4928632wmd.11.2019.11.26.14.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 14:49:11 -0800 (PST)
Date:   Tue, 26 Nov 2019 22:49:10 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 17/23] media: imx7-media-csi: Create media links in
 bound notifier
Message-ID: <20191126224910.qt4ohyemvrqjyrzl@arch-thunder.localdomain>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
 <20191124190703.12138-18-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191124190703.12138-18-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Sun, Nov 24, 2019 at 11:06:57AM -0800, Steve Longerbeam wrote:
> Implement a notifier bound op to register media links from the remote
> sub-device's source pad(s) to the CSI sink pad.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
> Changes in v2:
> Rename notifier_to_dev() to imx7_csi_notifier_to_dev() and remove
> unnecessary inline.
> Suggested-by: Rui Miguel Silva <rmfrfs@gmail.com>

Many thanks for this.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
    Rui

> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 15b08bfb5aa7..848d1286fbeb 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -196,6 +196,12 @@ struct imx7_csi {
>  	struct completion last_eof_completion;
>  };
>  
> +static struct imx7_csi *
> +imx7_csi_notifier_to_dev(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct imx7_csi, notifier);
> +}
> +
>  static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
>  {
>  	return readl(csi->regbase + offset);
> @@ -1187,6 +1193,23 @@ static int imx7_csi_parse_endpoint(struct device *dev,
>  	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
>  }
>  
> +static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
> +				 struct v4l2_subdev *sd,
> +				 struct v4l2_async_subdev *asd)
> +{
> +	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
> +	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
> +
> +	return media_create_fwnode_pad_links(sink,
> +					     dev_fwnode(csi->sd.dev),
> +					     &sd->entity,
> +					     dev_fwnode(sd->dev), 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
> +	.bound = imx7_csi_notify_bound,
> +};
> +
>  static int imx7_csi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1269,6 +1292,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>  
>  	v4l2_async_notifier_init(&csi->notifier);
>  
> +	csi->notifier.ops = &imx7_csi_notify_ops;
> +
>  	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
>  						sizeof(struct v4l2_async_subdev),
>  						NULL, 0,
> -- 
> 2.17.1
> 
