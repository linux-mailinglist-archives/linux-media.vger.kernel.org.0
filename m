Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB8397DF40
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 17:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbfHAPlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 11:41:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33411 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729198AbfHAPlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 11:41:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so74213608wru.0;
        Thu, 01 Aug 2019 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=jhUyBzDhhRLbHQjPsF6ukVTdHMxQiNb4zxJrle7zp/M=;
        b=Mezss//nhodL4JrggpDB3czwP6/KO9U1cdsNearapnh5rsY3Q0312lvekawydIjS+l
         4z524nBLrwXY0rQL4q17UfrfsPg66XnooLxxEB1XPFMRLjZl3c3YCPXLe6pTStQc0q7G
         gzeUPLTjpCPXSKkqcn7DRYkQ/xDNEgyoYPiux/9PIpgNZ9zNGE609e2GdHskBOmwjm7u
         S+bZoUZ86a+UPh5MVnqMUPaBKkDqrag3GJiuvLoKug6rfzmkizbwf0cL1wJyXepXsFjN
         QONnvy//Z0w5xOAlnjX6EevG6a0pB8Fo1vKSysj+mKwoFNmZsGxBR790UdpojZ5fDJzF
         V1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=jhUyBzDhhRLbHQjPsF6ukVTdHMxQiNb4zxJrle7zp/M=;
        b=mvmEr4ainS/L4tTUQNN43EadoV7SUp0dH/N4+H9vTAthVTnXYQv66qWBxuj3inrcCY
         coV8TK9VPNTwlQE41MSEr74giI9olxYMWKpzs9bVI8ykDJUu6OvOdJ/eRlRG3O1esGxa
         tO7PTncUMidMCJ3FkyjTOzn2VEXlUrItYN5lDONjm1p3kMq54DLMRRLNoYtyF7kE8Vvs
         eE+uXGpqjrbE/tmDr0VzyN7xeiE6idBgJ3f0MG26NcnfgNvKOx9xgLAril43qF9W7gKC
         p2UHeo+AjCGX8WVp9Eny4VLdkmczx07yrK0QURZf6bXHQDsPtAcTlFOaHm0cBPr/aM9F
         uSLQ==
X-Gm-Message-State: APjAAAXP2wsfj4hshFMkZ/8qYugFuKgw0vX/4mpoPWT9dTy8uPh4Cdg7
        tuMWicFfPHFWZXgbgVd9R/xKGXU+
X-Google-Smtp-Source: APXvYqyhkam7gbsDqFPf6gO1/K4hjZZlbghC/kRI59/d3GCm7160AsV4n+bjr+cAtIEzunxazLLaQg==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr142024685wrn.31.1564674080463;
        Thu, 01 Aug 2019 08:41:20 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z25sm75348158wmf.38.2019.08.01.08.41.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 08:41:19 -0700 (PDT)
References: <20190721190423.9534-1-christophe.jaillet@wanadoo.fr>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: ov2680: fix a typo in a function name
In-reply-to: <20190721190423.9534-1-christophe.jaillet@wanadoo.fr>
Date:   Thu, 01 Aug 2019 16:41:13 +0100
Message-ID: <m336ikc2qu.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christophe,
Thanks for the patch.

On Sun 21 Jul 2019 at 20:04, Christophe JAILLET wrote:
> All functions in this file starts with 'ov2680_', except ov2860_parse_dt().
>
> This is likely a typo.
>

Yup, weird is to only have one of this. Nice catch.

> rename it to 'ov2680_parse_dt()' (6 and 8)
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui

> ---
>  drivers/media/i2c/ov2680.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b10bcfabaeeb..c59c9e51c380 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1023,7 +1023,7 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
>  	return 0;
>  }
>
> -static int ov2860_parse_dt(struct ov2680_dev *sensor)
> +static int ov2680_parse_dt(struct ov2680_dev *sensor)
>  {
>  	struct device *dev = ov2680_to_dev(sensor);
>  	int ret;
> @@ -1064,7 +1064,7 @@ static int ov2680_probe(struct i2c_client *client)
>
>  	sensor->i2c_client = client;
>
> -	ret = ov2860_parse_dt(sensor);
> +	ret = ov2680_parse_dt(sensor);
>  	if (ret < 0)
>  		return -EINVAL;

