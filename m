Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935034CBECD
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 14:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbiCCNYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 08:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbiCCNYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 08:24:50 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5678B15B991
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 05:24:04 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id v28so6739006ljv.9
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Cia1EWSdbf33wCtPBv6MrE1rw+APjYhmmceAP03JicI=;
        b=6vQCE+T2ZX6PNebpBXNw0tvDYonDICy6angiw992OIMjhO0RJ/5wWcvnr3y4u0gAwN
         2QXkfKyeDZWS+FJKqLOQu8hv1eUKxZU+AHwbeSxDopqrfeS1e7Jglrr8J1sLRWHUP/i4
         lcfpri/bfj3ugSikysPahN+bjdaZXwGIkgsBehwbUCgwsRF28ANNiCor9gcBxM7gaYpA
         Qv3vNHhym0k3dhKY76++Zks0GLZzSqW7KyphBCB9MP8Ru3po9/a97tiyEnVAQzK3r7PY
         b67bn+aqw8ZQvHTD/o2CcDdOstCw+VlKlsz7B9LpFkJuRjjndgkFBiS3XsecR8ED/ccb
         P7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Cia1EWSdbf33wCtPBv6MrE1rw+APjYhmmceAP03JicI=;
        b=EspIzhy40FFnypzPsuM4FZ7cUsOSkaaKFfuUwuFpjVLh7ZAuSAe3VnyUnx/NChqXOW
         G7K87rYGi/IDOvDYrEpmhX2wa+wxkUMFiZPiDtrdmw+a3uKk5RiER6kTLJ3jTkQQMh1C
         O4m9cJLPohiyLpPbwRjbuyfvxOPLhXFTWh93fFDun720Evkw1ebpI/EhLps6xK+inRtL
         ZUEMJqPuueFQQj1lz4SCBYlwDsr+jDu23VTtAPbWSw7qhAPwNKs+qFVCXaRvEkw/loN4
         U3ZPZGqkX/RUFStOtI7hy640oz+UcqTbYS6rQ2JtqgsqnDvmUZY6X5gHcHEZAedtoOtr
         2fZw==
X-Gm-Message-State: AOAM530+qig1ee6pmQYWKJRN1fn2vmx3TZomj3uomM3j5XvEacbzXG00
        aG9IhV9vPizNCIDkp74bUui3GK8swMYP/Q==
X-Google-Smtp-Source: ABdhPJxGYRq19AbS8xH4J9fU8hrzvYWQJXXcp85rNNe6HsawJNNmmn/LNCjtTr8DZDtqetolSpVYkA==
X-Received: by 2002:a2e:7a15:0:b0:236:deb2:1f74 with SMTP id v21-20020a2e7a15000000b00236deb21f74mr23329664ljc.315.1646313842506;
        Thu, 03 Mar 2022 05:24:02 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id f18-20020ac25332000000b00442e9987b7fsm426666lfh.106.2022.03.03.05.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 05:24:02 -0800 (PST)
Date:   Thu, 3 Mar 2022 14:24:01 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: Drop comma after SoC match table
 sentinel
Message-ID: <YiDBcf0SktgHj9MF@oden.dyn.berto.se>
References: <0c6a183ade26c68b96d91ce14e675ca01fc563fb.1646311410.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c6a183ade26c68b96d91ce14e675ca01fc563fb.1646311410.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2022-03-03 13:43:57 +0100, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Make sens.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 8c939cb3073d79ec..54428f0a5758ae10 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1414,7 +1414,7 @@ static const struct soc_device_attribute r8a7795[] = {
>  		.soc_id = "r8a7795", .revision = "ES2.*",
>  		.data = &rcar_csi2_info_r8a7795es2,
>  	},
> -	{ /* sentinel */ },
> +	{ /* sentinel */ }
>  };
>  
>  static int rcsi2_probe(struct platform_device *pdev)
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
