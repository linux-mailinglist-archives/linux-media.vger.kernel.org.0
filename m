Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B367C9535
	for <lists+linux-media@lfdr.de>; Sat, 14 Oct 2023 17:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbjJNPvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Oct 2023 11:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjJNPva (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Oct 2023 11:51:30 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EBFA2
        for <linux-media@vger.kernel.org>; Sat, 14 Oct 2023 08:51:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c515527310so4851921fa.2
        for <linux-media@vger.kernel.org>; Sat, 14 Oct 2023 08:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697298685; x=1697903485; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJ2bDCdkLDh8kympsU2RLtUY/ancw/4Exu+OPYeI8Ps=;
        b=hvhJn8WpBSRKz9BDpvhF0Dg1HMJuMtcGNjAVkUKngIPSg8Mx3kdwxCl2wKnVaXmnKX
         +7f1W9ZkK9ce2H7e3AlHyB3JHpMnanyoTosCEX2wNsmq7haAdLFdW4mcYumIWeg/B7HZ
         z6GEHOF8C8L7XuU50k7xEk74+EnlcEJ3zEoxgY9D6a6283QfvSNVBY2nc9fvHpPZzTAn
         qrwXGU7oAjunE1OCrTkQW6TIftZafuX85hDRF3yc7cgZcsSBNpLXGSuxwf68gje7G+iC
         BXEJD8gWqKCCLALl+GyvVXRjUZ3OKM/2TUYT1QvElhgJiLXI/288ygct3jjwblusKo+0
         VVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697298685; x=1697903485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ2bDCdkLDh8kympsU2RLtUY/ancw/4Exu+OPYeI8Ps=;
        b=icR42ijxyzade2Ry6f8oPQkK7ukpraB2fW3l5afbeD3dLaR+3iFkpO2VMvlvuTW3En
         L/Z5dLs06wbrrnJmN1k4sFaeypAJiWEooJm8ujGDfKO5GOkEofP8Uz/b81LtabDqz/6r
         QC2rAPNwiks52RpC2OYxtZGfeXNSoePlGJmW0q3bBqChb96ak/EsfseX8xd9ujVOujCa
         igGC5p+eW103Ykn0OYIyyrQxBWFhJRelep258FIAO5dtbVubHQbYoBiO9Hep/J+EvBAq
         kUYwj0HrLO6cNM7IVX5jqAzPauyjS03zWmqgmaZJ7rULgBYROv/30tMyMaHnSn11YQHu
         KMMA==
X-Gm-Message-State: AOJu0YwUoKmfxOA5poclBoOwhXnFB8csxaAURjibtAjc/pxh//Oe/XLl
        aagdZ4zFVQRvSV2djTp7CLw3zw==
X-Google-Smtp-Source: AGHT+IFhOogOnFFdym6CReJqhNSEhoSNYZt6skC0F/7Rv3GeMoPWCzmhdk79ikXV98i1YSJWoOKM0w==
X-Received: by 2002:a05:651c:216:b0:2b9:e831:f16a with SMTP id y22-20020a05651c021600b002b9e831f16amr24580129ljn.26.1697298684897;
        Sat, 14 Oct 2023 08:51:24 -0700 (PDT)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id f23-20020a2eb5b7000000b002bce38190a3sm416371ljn.34.2023.10.14.08.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 08:51:24 -0700 (PDT)
Date:   Sat, 14 Oct 2023 17:51:23 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     ihor.matushchak@foobox.net
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: fix copy-paste error
Message-ID: <ZSq4-7W_ke5XKsrE@oden.dyn.berto.se>
References: <20231014143843.3409-1-ihor.matushchak@foobox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231014143843.3409-1-ihor.matushchak@foobox.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ihor,

Thanks for your work.

On 2023-10-14 15:38:43 +0100, ihor.matushchak@foobox.net wrote:
> From: Ihor Matushchak <ihor.matushchak@foobox.net>

I agree this is a copy-past error and the fix is correct. But you need 
to add a commit message describing this. I know it can feel a bit silly 
for a simple fix like this, but we can't have an empty commit message.

> 
> Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index c44145284aa1..ea67bcf69c9d 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Maxim MAX9286 Quad GMSL2 Deserializer Driver
> + * Maxim MAX96712 Quad GMSL2 Deserializer Driver
>   *
>   * Copyright (C) 2021 Renesas Electronics Corporation
>   * Copyright (C) 2021 Niklas Söderlund
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund
