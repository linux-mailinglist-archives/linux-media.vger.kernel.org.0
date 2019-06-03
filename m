Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF18D33727
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 19:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfFCRsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 13:48:30 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40890 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFCRs3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 13:48:29 -0400
Received: by mail-wm1-f68.google.com with SMTP id u16so6766502wmc.5
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 10:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=tG+C56bB4yZxBjtgl2HHPxaWz0jBW2bNwXumPHNbLW0=;
        b=BhPZdymONapufrSelNBLXojerNIjOMyi9S4HmKO2eKSpLmjVKoe5sgTl/RlRqLycYA
         +8EnK8/7VlXYrrP6dJ3EsiNOprQ34KJcPjMU7Qj0y/j74HBRmKFra5U5H4KsZ/oSJYZm
         cSRCEyRILKYvIm5aaGHGqTpXvAJwZDi1WjjdYzQFlVTowI19b0Dga3+rDUE1eX6Vg/wK
         C2oMMkfsnM/sDlb9PHLRCZUJsvuI7Sx4EH38cdnZxQtE/r+VMzDf/3ZLck0YmXw5pHwB
         o10SYmVmvpseFIt5N1wIoAD52iXGhmEz2Jn43TQNLuyxpV3XKl6T+79WyYZRGBlEbHfU
         b5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=tG+C56bB4yZxBjtgl2HHPxaWz0jBW2bNwXumPHNbLW0=;
        b=AWnkUK2GfCyJdycYx4Z7yu1852J6Wfb5YslIgS3nuvdFnzgQ5sEjR4o6mDigxPlXFN
         wzezUVVYwuBuXpWP9xfWpeaemUqZbfi9DfVmb0fviC3aZ70Qb/aVq9E+sF1ekucBT0S2
         bvK2q1qNchKwNZfg0Vjh3RokpzOVGUA9b4MHphU/G8vbt85Skrj7KNk1lpl/Ffs8vhZC
         TaeI376F7U8jLOnGOr61C+54xxpxaBhR4j1WZEapawd+NzOhkfQzkq4G2vkEQRkkSkCZ
         pumFI6CKIcGWZZNZy92zm8WEC2wqWLzZWVJgRyRNPOFKWpJcsZA6Et6Ho/lZ2NAyCo/M
         mF0g==
X-Gm-Message-State: APjAAAW4evUE0RUGHXxEEpS1dYnjHGptlTHbc40tlcuyzY8hb6TOQsLC
        PHg3kyMU8C557ZuY717PgHWe8Z8poG8=
X-Google-Smtp-Source: APXvYqyab/bw/Y/9qFyjo8xTzzQv041IR/PDKkkMnWvDydo3Ucix7QTNZse0Cxj8TUqLHT9pq0txfQ==
X-Received: by 2002:a1c:f909:: with SMTP id x9mr15132190wmh.12.1559584108222;
        Mon, 03 Jun 2019 10:48:28 -0700 (PDT)
Received: from arch-late (87-196-73-160.net.novis.pt. [87.196.73.160])
        by smtp.gmail.com with ESMTPSA id q20sm19874248wra.36.2019.06.03.10.48.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 10:48:27 -0700 (PDT)
References: <20190601175140.16305-1-festevam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, p.zabel@pengutronix.de,
        slongerbeam@gmail.com, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: imx7-media-csi: Use functions instead of macros
In-reply-to: <20190601175140.16305-1-festevam@gmail.com>
Date:   Mon, 03 Jun 2019 18:48:25 +0100
Message-ID: <m3h896a7bq.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Sat 01 Jun 2019 at 18:51, Fabio Estevam wrote:
> Currently there is a macro for reading and another macro for writing
> to the CSI registers.
>
> Functions can do parameter type checking, which leads to a safer code,
> so switch from macro to function implementation.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>

Thanks for the patches. for all of them:
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
        Rui

> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index b1af8694899e..8abdf253696d 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -195,10 +195,16 @@ struct imx7_csi {
>  	struct completion last_eof_completion;
>  };
>
> -#define imx7_csi_reg_read(_csi, _offset) \
> -	__raw_readl((_csi)->regbase + (_offset))
> -#define imx7_csi_reg_write(_csi, _val, _offset) \
> -	__raw_writel(_val, (_csi)->regbase + (_offset))
> +static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
> +{
> +	return readl(csi->regbase + offset);
> +}
> +
> +static void imx7_csi_reg_write(struct imx7_csi *csi, unsigned int value,
> +			       unsigned int offset)
> +{
> +	writel(value, csi->regbase + offset);
> +}
>
>  static void imx7_csi_hw_reset(struct imx7_csi *csi)
>  {

