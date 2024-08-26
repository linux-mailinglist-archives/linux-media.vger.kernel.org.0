Return-Path: <linux-media+bounces-16763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCF95EA62
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 09:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30024287B82
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 07:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FEF13C677;
	Mon, 26 Aug 2024 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SiEhdFpY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D84812DD88
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724657241; cv=none; b=Rudgehi8YXYubxNrqgGtOSL8xD+YCug5DbzTGu6zTSX2v5/lceNaXC0C9V0KvMOWdJeJScyQzTp4pgJAsCs8LRfX1KSUoF/A19dbpBmU67H0GuEyyygcqX5TNeJqZAqAKCoLnqqbMrFgOl1caudzK/w8Ri+Hapkuwn1h/BEYIas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724657241; c=relaxed/simple;
	bh=2meuMHyBdF7xDHzjPSwg8xiG9hlFnEv64ds9LZGeNjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYbRkuCIj5/jIKqJvxLVoa1vZs1IHATOKoCs0aubaYVe9al3y9jSS6/lC01GXEWlIexPapemzKWzzgmmzLsO0ET0unua20CRQOFi7DMYHdVISkiuhypne9UxVi24T/VcZlXXDhJrO/p1yYLysP2rhTW616RcROXIkDBsoygT+9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SiEhdFpY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a83562f9be9so347701066b.0
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 00:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724657237; x=1725262037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3eyI3I2oW9AS7KNGUUeg3aPCIIbv7w0R2Ru4iWXd0c=;
        b=SiEhdFpYpnZ1ZCT+hNcT/pilCK406isF1jWrgRKcvIIrCq4R5f3rGJnaLbyQxi+/7l
         P6jxNdtflN5NyVz7k+fiAZf6jL6MWGU09UKVuEgV2Tf2Rc9fS2YJ2cvgOFUNh//pnjlL
         BP/UTZVe1njGKE/RLfVf9Yv/PAuYONxyVw1D1oYiuQ8NDNpGpgM81KPSlT+LcBzPiox9
         nRLLrBApscjsZZKsacqOksmUGvYABwzitdFJP1ZQg2rINwrGWiQkw2qar9QPueX7rbsq
         MT66RUEnQc04dLxCCzNGob3E70CYQ+BTV5425Xrq483ARr4LLbWR22agI33hbnjob329
         8mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724657237; x=1725262037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3eyI3I2oW9AS7KNGUUeg3aPCIIbv7w0R2Ru4iWXd0c=;
        b=f32Nq1cFDbdPyKYmdY0Rp7sA2z6QMTmLwe7c9SdXCVMhRB45gQn5Xx3530pRWxj1VY
         itbjAEqQMUEWF2iLYtRab9ErnsCF7+1UO3IqwoipfYhr5dEkBp3ghQCcWR/P7TOPc0uX
         bCvJs1wnu6Qlb52KC0et+Zm20aOvZ8OxH+sNVok8Nd+Qpw/+F9p7w4u1dfZ3u5YlJY+6
         9VTJJ1uK+gVHqWVNmEW/f5FzqNH6AlYZNe/U2vXctqzAmSs0+TAYYRh4V9iRGh5D9R6E
         5zUIPmJruave6C96PLce7RDszqyqKucOuvx8CPv65c0ANMdIznA/FRmuspTKCorM490f
         OC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFNrIF+SZQSocqFxExNIE7XhXZaoXozX/HhzinKhlB0ta/5Mm2foc3fqpJBw8uQIG4HvKizh5a0AT8KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXPGHCEpR19b5rot/f8GI9aoHnSJqeYMsOyh+KtlIAj7djaJVQ
	7Io88OVxFEPIbsCZrEJ811XnhcK62BgFVP4SbuljKS9U8nQhPIuq1Xx/olHrSfs=
X-Google-Smtp-Source: AGHT+IH2N+ar1nOvun201ArKYOtq+iX1l6N6Du1224BJof2FmIhsV2DYWf3/b9jLkhm/xiEmISlxnQ==
X-Received: by 2002:a17:907:d84b:b0:a7a:a89e:e230 with SMTP id a640c23a62f3a-a86a52c1a8cmr691581566b.30.1724657237220;
        Mon, 26 Aug 2024 00:27:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4360c0sm626577866b.108.2024.08.26.00.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 00:27:16 -0700 (PDT)
Message-ID: <6f16a3f7-99bb-47c4-9034-c1f0ccd59546@tuxon.dev>
Date: Mon, 26 Aug 2024 10:27:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 24.08.2024 21:21, Biju Das wrote:
> Move request_irq() to probe(), in order to avoid requesting IRQ during
> device start which happens frequently. As this function is in probe(), it
> is better to replace it with its devm variant for managing the resource
> efficiently.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped wrapper function rzg2l_cru_process_irq() and made
>    rzg2l_cru_irq() global.
>  * Added Rb tag from Laurent.
> v1->v2:
>  * Updated commit header and description.
>  * Moved rzg2l_cru_irq from rzg2l-video.c->rzg2l-core.c and introduced
>    rzg2l_cru_process_irq() in video.c to process irq.
>  * Dropped image_conv_irq from struct rzg2l_cru_dev
>  * Replaced request_irq with its devm variant.
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-core.c | 13 +++++++++----
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h  |  6 ++----
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c      | 15 ++-------------
>  3 files changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 280efd2a8185..2a2907beb722 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -242,7 +242,7 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
>  static int rzg2l_cru_probe(struct platform_device *pdev)
>  {
>  	struct rzg2l_cru_dev *cru;
> -	int ret;
> +	int irq, ret;
>  
>  	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
>  	if (!cru)
> @@ -270,9 +270,14 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  	cru->dev = &pdev->dev;
>  	cru->info = of_device_get_match_data(&pdev->dev);
>  
> -	cru->image_conv_irq = platform_get_irq(pdev, 0);
> -	if (cru->image_conv_irq < 0)
> -		return cru->image_conv_irq;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, IRQF_SHARED,
> +			       KBUILD_MODNAME, cru);

Because this is requested w/ IRQF_SHARED the free_irq() -> __free_irq() [1]
will call the IRQ handler to simulate an IRQ SHARE scenario where other
device generate an interrupt.

AFAICT, with the current code, because the driver has runtime PM disabled
(and the clocks at that time should be disabled), the first register access
in the IRQ handler will generate an abort (when called through free_irq()
-> __free_irq()).

Have you tried to unbind the driver with CONFIG_DEBUG_SHIRQ=y ?

Thank you,
Claudiu Beznea

[1] https://elixir.bootlin.com/linux/v6.10.6/source/kernel/irq/manage.c#L1970

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
>  
>  	platform_set_drvdata(pdev, cru);
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index a5a99b004322..174760239548 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -8,6 +8,7 @@
>  #ifndef __RZG2L_CRU__
>  #define __RZG2L_CRU__
>  
> +#include <linux/irqreturn.h>
>  #include <linux/reset.h>
>  
>  #include <media/v4l2-async.h>
> @@ -68,8 +69,6 @@ struct rzg2l_cru_ip {
>   *
>   * @vclk:		CRU Main clock
>   *
> - * @image_conv_irq:	Holds image conversion interrupt number
> - *
>   * @vdev:		V4L2 video device associated with CRU
>   * @v4l2_dev:		V4L2 device
>   * @num_buf:		Holds the current number of buffers enabled
> @@ -105,8 +104,6 @@ struct rzg2l_cru_dev {
>  
>  	struct clk *vclk;
>  
> -	int image_conv_irq;
> -
>  	struct video_device vdev;
>  	struct v4l2_device v4l2_dev;
>  	u8 num_buf;
> @@ -141,6 +138,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
>  
>  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
> +irqreturn_t rzg2l_cru_irq(int irq, void *data);
>  
>  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index b16b8af6e8f8..e80bfb9fc1af 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -527,7 +527,7 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_set_stream(cru, 0);
>  }
>  
> -static irqreturn_t rzg2l_cru_irq(int irq, void *data)
> +irqreturn_t rzg2l_cru_irq(int irq, void *data)
>  {
>  	struct rzg2l_cru_dev *cru = data;
>  	unsigned int handled = 0;
> @@ -637,13 +637,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto assert_aresetn;
>  	}
>  
> -	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
> -			  IRQF_SHARED, KBUILD_MODNAME, cru);
> -	if (ret) {
> -		dev_err(cru->dev, "failed to request irq\n");
> -		goto assert_presetn;
> -	}
> -
>  	/* Allocate scratch buffer. */
>  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>  					  &cru->scratch_phys, GFP_KERNEL);
> @@ -651,7 +644,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
>  		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
>  		ret = -ENOMEM;
> -		goto free_image_conv_irq;
> +		goto assert_presetn;
>  	}
>  
>  	cru->sequence = 0;
> @@ -670,9 +663,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  	if (ret)
>  		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
>  				  cru->scratch_phys);
> -free_image_conv_irq:
> -	free_irq(cru->image_conv_irq, cru);
> -
>  assert_presetn:
>  	reset_control_assert(cru->presetn);
>  
> @@ -698,7 +688,6 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
>  	dma_free_coherent(cru->dev, cru->format.sizeimage,
>  			  cru->scratch, cru->scratch_phys);
>  
> -	free_irq(cru->image_conv_irq, cru);
>  	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
>  
>  	reset_control_assert(cru->presetn);

