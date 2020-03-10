Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 749AE17F88B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 13:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgCJMss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 08:48:48 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33424 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbgCJMsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 08:48:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id c20so10798783lfb.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=02YCpOcYgDr2RIZdF/x1NVUywRgMsFxtc+njZV4rLeY=;
        b=RkadbTZs67fU9rSXGjUpIYuJJqO/hjj4cQZTKNqQhWlzhil9no9aSQh/hdlLwNp+7m
         NA45dgJZ3moN/DxYshX5WzSk+mv/+Y9FCbSyQ13p/EcUB5p3PfOCeTdVoLFbacGbb3Xf
         BbdXyBh99t3+aoKRMOrsbF6ojIE5Zlcc7qlJjg3bgVBeecYhWRTgw7H4A6T4kQt9Iz2n
         dPb63B8RDKqNYjcnueVxQ2dIyKEYaMGCmZFh3pChz/bha8/K1P+f0PaKPArh88LuTNAV
         Nr353sAH0Y9OR+5Z0vj86pxdPS3uQ0upAY+n70y5hCHyVLoys7XULawzdWe9dT5XHnWP
         g0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=02YCpOcYgDr2RIZdF/x1NVUywRgMsFxtc+njZV4rLeY=;
        b=CqK6gteWlTtsYLXNyE9r4OX0I9O6s44QVeDDmHYKPWMfM/yRVge+jQ1PcWjklJHy1Y
         fE9KCyJAx0WeuM7I0TqTGS0mbL0I9FU+lQcDlBOb5ucI1cdWDeHywKZgMtGwGueDI8M3
         ZyK9ajP69S3see2Fl2xK0A4NGK9ZyfUqVyfti+bFFdraacKgRA71c+Xks3TLYrv/3J7o
         I7T7FDHqK2YHmeGI3CPUW0N9delh2cMWAv58hU2yPTkdgZ6gjqeNZbsNBAuFcByVltXQ
         ibCPlkNJnl2P2qMCrW+dhNeWh3HtFm43O4beNb+jmmNOzWIjKkMd/fV/suBBUUTxsEeL
         2u6A==
X-Gm-Message-State: ANhLgQ3Oy9w+RFFxXZ0Sy+f7eNULlU8jgvKJFqCJYGpAkxfzytbZYtyI
        G/j6GJFsbyXUvBWMgQHbgttOYg==
X-Google-Smtp-Source: ADFU+vsgmv0jq7AXXvtsvyuZoBOTHOnaupBq/z++CY1/zbVVC5+3JatnqiO1l0kG1KPSmZcEcESjhw==
X-Received: by 2002:ac2:5598:: with SMTP id v24mr499682lfg.139.1583844525496;
        Tue, 10 Mar 2020 05:48:45 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id b17sm23704416ljd.5.2020.03.10.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 05:48:44 -0700 (PDT)
Date:   Tue, 10 Mar 2020 13:48:44 +0100
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 3/3] media: rcar-vin: rcar-csi2: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Message-ID: <20200310124844.GP2975348@oden.dyn.berto.se>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1583838364-12932-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-03-10 11:06:04 +0000, Lad Prabhakar wrote:
> This patch adds support for MEDIA_BUS_FMT_SRGGB8_1X8 format for CSI2
> input.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Small nit, you can drop rcar-vin from the subject as this patch is for 
the rcar-csi2 driver. With this fixed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 39e1639..b030ef6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -320,6 +320,7 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
>  	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
>  	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
>  	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
> +	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
>  };
>  
>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
