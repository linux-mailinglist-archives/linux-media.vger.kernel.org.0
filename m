Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1D43F9E8A
	for <lists+linux-media@lfdr.de>; Fri, 27 Aug 2021 20:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhH0SKT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Aug 2021 14:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhH0SKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Aug 2021 14:10:18 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3777FC061757
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 11:09:29 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u9so11677396wrg.8
        for <linux-media@vger.kernel.org>; Fri, 27 Aug 2021 11:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=tS5Fq4uP7dCXdsEQXYsDReSfVUraeb0a6EPpBY6XL+Y=;
        b=a6ScZvm1wRciHt8RqdQsvVnCnvkcxczahP/0RhYRgVkYlY+6kkc3cUYJCFM4V8RWlJ
         pGbN1+biPEGv0v5QeLpVJsHq9N1IOR1aXCCVeOVPd8dgDz/kzh8RKlnE+IX3cFZI+NL0
         zJE36slIe7IsCUIq4R9Z0vOK4a6yNl61Qt62uKQGRuWzIwUZmmh07zpDJY9TC2ShuU2/
         RI2AQdTG/ku5fj6FhRcP1RLMwiBLJ+yScvakdh2In6vXONHpTpEQBT2KCn8da8jyTptE
         fV+4abwKQIKtN+BLUV8xXK7CC2PhryPhFQJ7gk2g5NJYYetpGNiFqnFL5kYwXO8wRmOm
         iyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=tS5Fq4uP7dCXdsEQXYsDReSfVUraeb0a6EPpBY6XL+Y=;
        b=kBBK7OhXIUdTZDmM9jKmR1G+Q0IhAt6gI5bQvLYlfEoEdJYIRxiqQaIZ9Ke2azVS10
         55GwXqSHRfizR+pf3KShB7BNDhCPX9pPz/5Et6vwChqWbP4j3B2AC3kNZ7xkdIhFDPPn
         Ow9A6qwkRUEzBzn0maWi4nWcWDNpx3CCO9JIG5JnMVnornB1niKF87Whi8ehl5vM0hrH
         8JtHRa04oMP7fotOznbaoyJ2p5c1QEUn/8h0b9yxPy1wQB8oRidoPKMjVV2QiKfBLiBq
         b071C1JUM+qaFFGKhMbo3jBydUg5e3uwSCLSizs4ThmDFJunSTsg5izBqhi+6Z6ORuMF
         187w==
X-Gm-Message-State: AOAM531riNUsH85f+cgYJqoAWFymeqTctT1+KsHWVejiIydvGwN6rVA5
        Y/iRnsMbNKaOnYh4GCLHIP8=
X-Google-Smtp-Source: ABdhPJxPYrutO26zyL7wxD/MXfkKJw7BtY1U1HcqlZE+i6nQUSlCd6NQ0z5bYUg6j7kC6MgfrnPdxQ==
X-Received: by 2002:adf:de8f:: with SMTP id w15mr11763738wrl.277.1630087767882;
        Fri, 27 Aug 2021 11:09:27 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id o7sm6076487wmc.46.2021.08.27.11.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 11:09:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 27 Aug 2021 19:09:26 +0100
Message-Id: <CDUHVY0NYYB9.KYYVKOCS8BXV@arch-thunder>
Cc:     <mchehab+huawei@kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH 2/2] media: imx: TODO: Remove items that are already
 supported
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Fabio Estevam" <festevam@denx.de>, <hverkuil-cisco@xs4all.nl>
References: <20210826183819.105804-1-festevam@denx.de>
 <20210826183819.105804-2-festevam@denx.de>
In-Reply-To: <20210826183819.105804-2-festevam@denx.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Thu Aug 26, 2021 at 7:38 PM WEST, Fabio Estevam wrote:

> Video capture has been successfully tested using an OV5640 parallel
> sensor on a imx6ull-evk board at a 640x480 resolution and UYVY8_2X8
> format.
>
> Remove the two items that are no longer pending.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

great to see this parallel sensor worked

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
  Rui

> ---
>  drivers/staging/media/imx/TODO | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/T=
ODO
> index 2384f4c6b09d..06c94f20ecf8 100644
> --- a/drivers/staging/media/imx/TODO
> +++ b/drivers/staging/media/imx/TODO
> @@ -27,8 +27,3 @@
>  - i.MX7: all of the above, since it uses the imx media core
> =20
>  - i.MX7: use Frame Interval Monitor
> -
> -- i.MX7: runtime testing with parallel sensor, links setup and streaming
> -
> -- i.MX7: runtime testing with different formats, for the time only 10-bi=
t bayer
> -  is tested
> --=20
> 2.25.1



