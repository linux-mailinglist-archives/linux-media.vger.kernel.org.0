Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E219C10CC
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2019 14:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbfI1MRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Sep 2019 08:17:30 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38251 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbfI1MR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Sep 2019 08:17:29 -0400
Received: by mail-ed1-f66.google.com with SMTP id l21so4554548edr.5
        for <linux-media@vger.kernel.org>; Sat, 28 Sep 2019 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hR+kqMDGuDIlBzQcMCCpOjWvuyBdLfiOy3t48A5p6Y=;
        b=f3xx81X7mWXH4CeG5AZFssab+cToO6mGAOOHEKmFloqLfr62ldyeY0Z7oewGlBco4f
         bhRASLKwwg+bRdpnaJKDTAlc7HNc+AJmxufJJbD2Okav13mJwFv/DiEpWuXbsM/f/Dtm
         rZe9V+Fvu+CF0Q2I6P8nHmnbViET59+QugGsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hR+kqMDGuDIlBzQcMCCpOjWvuyBdLfiOy3t48A5p6Y=;
        b=VzKKal1hhPR+jNjqKT+EbIIqhUSm3v/tfsvZTGvwFBlbkJy6FKYUfR3RUcfFi0iZUY
         0/7rguBEeH0MzJfLfhh+m1+2mbTo1wZ4Y0TkwvXjb2oVkO7/WNr/s1lCDG8fuF3ahllA
         7WDZYc/BPOe7n5/Az5ahVkPJ2h+u8bcygDfDfy68uwYloWHvCO1OL4V1YfQk1df5qiOF
         2nvFGoLBsKpLUkUHoVRAi80FFfCzCgTemAma4ecbm156p6IM3N9SDZBUTfAYXR64+goZ
         30xHHta7u5/xyWyugr0Lev5pDDH6OSdbZxTw89LEuFZdOpSPW/0JSdWoii6JKwuKEt6E
         x3Jg==
X-Gm-Message-State: APjAAAUapOyWdE5+AuIJBNV1NjQ2XhAqP7q+2r942etyYXbldFLA+pez
        bS4MQsPBInusauGbpKvVmkTpZA4ziTEOjg==
X-Google-Smtp-Source: APXvYqwCpqMDEi6Zrc4l59Tbcx/kkJjhPrYRcrWW4dr0rhdh4kczT0edT7OKi2tLarmlreyZrqz0Xg==
X-Received: by 2002:a17:906:a84d:: with SMTP id dx13mr11970240ejb.230.1569673046173;
        Sat, 28 Sep 2019 05:17:26 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id k10sm1178672edb.68.2019.09.28.05.17.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2019 05:17:25 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id r17so10481014wme.0
        for <linux-media@vger.kernel.org>; Sat, 28 Sep 2019 05:17:24 -0700 (PDT)
X-Received: by 2002:a1c:a516:: with SMTP id o22mr11383304wme.116.1569673044123;
 Sat, 28 Sep 2019 05:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190927071824.18675-1-dongchun.zhu@mediatek.com> <20190927071824.18675-2-dongchun.zhu@mediatek.com>
In-Reply-To: <20190927071824.18675-2-dongchun.zhu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 28 Sep 2019 21:17:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B1htFA1R92iQQ93dMQujkSWNqHkx94GG+bdUscRA4gDQ@mail.gmail.com>
Message-ID: <CAAFQd5B1htFA1R92iQQ93dMQujkSWNqHkx94GG+bdUscRA4gDQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5695: Modify the function of async register
 subdev related devices
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        andriy.shevchenko@linux.intel.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 4:18 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> This patch adds support for registering a sensor sub-device to the async sub-device framework and parse set up common
> sensor related devices such as actuator/VCM.

nit: The description should be wrapped around the 80th column.

Sakari, do we need to resent or you could just rewrap when applying?

>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  drivers/media/i2c/ov5695.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index e65a943..b6ee62c 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -1328,7 +1328,7 @@ static int ov5695_probe(struct i2c_client *client,
>                 goto err_power_off;
>  #endif
>
> -       ret = v4l2_async_register_subdev(sd);
> +       ret = v4l2_async_register_subdev_sensor_common(sd);
>         if (ret) {
>                 dev_err(dev, "v4l2 async register subdev failed\n");
>                 goto err_clean_entity;
> --
> 2.9.2
>

Otherwise:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
