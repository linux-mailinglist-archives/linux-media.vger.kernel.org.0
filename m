Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08F73E892E
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 06:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhHKET5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 00:19:57 -0400
Received: from mx-lax3-1.ucr.edu ([169.235.156.35]:6972 "EHLO
        mx-lax3-1.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhHKET4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 00:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628655574; x=1660191574;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:cc;
  bh=8+2MFUiKTr6YMmCUjLtaAbosp3nC3TfZco3vRdKPf+I=;
  b=W/b01guBgFMS22Es5wk4vK0I6vyYih+KrDkyjGhtrj+3AOAVH8Ws8XlK
   pKLexp4oLHnh0R9c8P9xXBE7LTv8/2+ppUTc2VbyxR3HsfYI+owYo6DLa
   UYgeOVSFIZ4smZwxF+ALeJjHNOSkUDmKfpQlG0LxcpZHzCv8AG3aSuWJG
   9rNy3LirNt3kjX6VK6N2pMBuDPNJ4EvVXJl0tYfP1Zv2BnN5jBXNNVTFH
   KPFIzhuNjo2tED4EKTryFcjPmpREf6dftAD92Um7oPDFHx1iGJeubyqVj
   B6JzAOYeIZ6oMnykTs16rAJtauRAURWAdpnc2tcXKoF43Kl+Fpx9+gz10
   w==;
IronPort-SDR: oyK2QCIvNGAcVYM8Ppp8QVdM8Te/L8Mqdar5I79GgxIoMVsV5yxExYZWhKV4dB//TdfPtp6IJh
 sBz/KHaU9EP8b9jWJ/51i5+yntFA0XjAv7nhaQ+QwK1OGzliDBbt/h/X8cBrDP/6O2GywAn8Zg
 vpFN7Tdxn3tCj7ufS6NAT6KEghka7cIvQ9Tn7/z4UUmdwU3PxjRe8ofUage9jahiiEurdRW9+z
 9pthjN7o1EPTtVxnG4Yr1jaUmJardRiIXJxgTM3d0JIZMGP/IDgT1UU0nz/LssiwnFkxq/1NtR
 ldLbgnfB5PdL9kKlg1ucDdxW
X-IPAS-Result: =?us-ascii?q?A2F+AgCfThNhhsjWVdFagQmBWYN4VhaESJFuimWBGoZ8i?=
 =?us-ascii?q?GiBfAIJAQEBD0EEAQGEWAIjgkECJTQJDgECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBQQBAQIQAQEBAYEgC1kLY4FPgXkGBD2CNSmDZQgBAQEBAxIRBFIQC?=
 =?us-ascii?q?wsKAwICJgICIhIBBQEcGSI5ghYBgwedH4EEPYo4en8ygQGIFgEJDU6BFRJ+K?=
 =?us-ascii?q?ocLhmQngimBS4EFgTM3PodbFIJQBINcexNbgU6BUAEBAZA6G4MGiUmCCYEmm?=
 =?us-ascii?q?3EBBgKDDhySSowBK4NlkWCRKpgtoxYQI4E9ghUzGiV/BmcKgUFNAQIBAgEMA?=
 =?us-ascii?q?gECAQIBAgECCAEBAo41jlYkLzgCBgsBAQMJiHgB?=
IronPort-PHdr: A9a23:p0NQXxBXMpu676MOv6R+UyQUYEMY04WdBeb1wqQuh78GSKm/5ZOqZ
 BWZua81yg+RFtqFo9t/yMPu+5j6XmIB5ZvT+FsjS7drEyE/tMMNggY7C9SEA0CoZNTjbig9A
 dgQHAQ9pyLzPkdaAtvxaEPPqXOu8zESBg//NQ1oLejpB4Lelcu62/6u95HJYAhEmDWxbLFzI
 R6rsQjfq84ajJd4JK0s0BXJuHxIe+pXxWNsO12emgv369mz8pB+7Sleouot+MFcX6r0eaQ4V
 qFYAy89M28p/s3rtALMQhWJ63ABT2gZiBtIAwzC7BHnQpf8tzbxu+Rh1CWGO8D9UKs5Uiq+4
 ah1VBDoiT8HNz8n/2HRlsxwl79QrBa4qxBi34LYfISZOfx7fqPcZtMaXmtBXsBeVydcHI2yd
 pYED+QAPelGq4nyukYFoR+wCAWwAe/izCJDiH3r0q0gy+kuHg/G0w4gEdwAs3rascn6ObwOU
 eyp1qTE0SnPY+9U1Dr79YPGcgohofaJXb9oc8XRyEguFwPYjlWXtIfqPDOV2f4Ms2OG6OdhV
 eOui249pAFwvjSj2skhh5LUho0J0FDI7zt2z5soJdChTkNwfNGrHodKuS6AK4t2Xt0tQ3tuu
 Csi17ALpJG1cSsOxZkn2xLRZfOJfoqV7x/9VeucPDl1iXFqdbywiRi/7VStx+7+W8SwzFtGs
 jRIn8XNu30OyxHe7s6KQeZ+8Ee5wTuDyRzf5+VeLU03lafXMYAtzqM/m5YJr0jPAjP6lUPrh
 6GMbEok4PKn6+H/b7XjoZ+TKpF7hxnlMqQrhsy/GeM4MhUSX2SD+eSzyrnj/UrhTbVPlPI2k
 63ZvInCJcQfu6K1GgFV3pg/5xqjFTum39MYnX4ILFJBZh2LlZTmO1bLIPzgDPe/hUqjkCtzy
 vzYIrHsBo/BI3vDnbv7Y7px9kFRxBAtwdxD+55YErQBL+jyWk/1utzYFBg5MwmszufnCdR91
 pkRWWOTDqOFPq7fqkKI6f41I+WWeoAapSv9J+A/5/HylX85hUMdfa6x0JsTaXC4GOlmIkqAb
 XrpnNgODGYKsRAlQez0h12NTyRTa2yxX60i/DE7DpypDYPZSoCqmryB03TzMIdRYzV3C0KMD
 HCgRYWNWr9YeTCSK845ymcsSLO7DYItyEf950fB17N7I7+MqWUjvpX52Y0wuLW7qA==
IronPort-HdrOrdr: A9a23:iPRidqy22SdhQfViTDTmKrPwKb1zdoMgy1knxilNoNJuA6qlfq
 GV7Y0mPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1Fp
 0MT0G9MrfN5JRB4foSKTPWfeod/A==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="59626267"
Received: from mail-pl1-f200.google.com ([209.85.214.200])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Aug 2021 21:19:33 -0700
Received: by mail-pl1-f200.google.com with SMTP id f4-20020a170902ce84b029012ccdab6e58so615199plg.0
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 21:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=xTux7jQgzWsX3hb3coGUGgC9dvVrQ9GiczNsYL/eB4o=;
        b=eRGI+PXA1Sw/Gxqyc4KdsZEpiAVbPpY8ogjIl7sI4rb3JmmKrwBHIhrJfHxAQunJQx
         9YDka5gu3OAbEE4oght90qrRYtKuPMUb5Ydho2OAm/6+s2hIMfFMyrF07tGcMJgFLk0v
         zTW8asXFmG7SYDhtoIQjO1j4bGd9v18d+C0sZm+XmEMiYrtBNq13sSyRRDbyZJy8rHKa
         b37royyptrEV2ViSDq94Y1pZfI75LQ8amMVEPhCBt0QNyVAwvSpJColEv5Cax6Tc12+v
         9Bdd72S7pkpyh2gw1Ew/An26eyVsDIONPJX+FKGPadh7oUtxYRLfm9pQt1wGgqiYDAtL
         UpIg==
X-Gm-Message-State: AOAM533lhz77Pf/N5zqn1CMWdtvQfZL7w5nfG5EZBchCSvAmUUinzEO7
        +mMoRb22W2QIWrD0wWfej50PNvzjHarZP78xGJlehaY9724oGKxGghIJ2uTyaNErTbaFRQsL+/b
        DCXLXqNhOF345OyWV8zi4786i9DpFGgF76OpL+Kza
X-Google-Smtp-Source: ABdhPJzIYxoQOs7sFnrMeI1YcPzebf4HOLDMtOMf0yGrMUB2YPZtm9Gmfenfb09Ibu0fnZrif3y8lSlkdHb6ppNM4/8=
X-Received: by 2002:a63:f242:: with SMTP id d2mr151331pgk.384.1628655571901;
        Tue, 10 Aug 2021 21:19:31 -0700 (PDT)
X-Received: by 2002:a63:f242:: with SMTP id d2mt121405pgk.384.1628655571687;
 Tue, 10 Aug 2021 21:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210723003607.64179-1-yzhai003@ucr.edu> <20210811035405.17382-1-yzhai003@ucr.edu>
In-Reply-To: <20210811035405.17382-1-yzhai003@ucr.edu>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Tue, 10 Aug 2021 21:19:20 -0700
Message-ID: <CABvMjLRj-ofVoNpOvT+DPOdW-=L52KbsRYeaKv=MTYfSJPZNBA@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All:
For your information, I update my signed-off zone using my full name
"Yizhuo Zhai"

On Tue, Aug 10, 2021 at 8:54 PM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> From: Yizhuo <yzhai003@ucr.edu>
>
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
>
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
>
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Yizhuo Zhai<yzhai003@ucr.edu>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index f5de81132177..77293579a134 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
>  static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
>  {
>         struct i2c_adapter *adapter = client->adapter;
> -       u32 retvalue;
> +       u32 model;
> +       int ret;
>
>         if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
>                 dev_err(&client->dev, "%s: i2c error", __func__);
>                 return -ENODEV;
>         }
> -       mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
> -       dev->real_model_id = retvalue;
> +       ret = mt9m114_read_reg(client, MISENSOR_16BIT, MT9M114_PID, &model);
> +       if (ret)
> +               return ret;
> +       dev->real_model_id = model;
>
> -       if (retvalue != MT9M114_MOD_ID) {
> +       if (model != MT9M114_MOD_ID) {
>                 dev_err(&client->dev, "%s: failed: client->addr = %x\n",
>                         __func__, client->addr);
>                 return -ENODEV;
> --
> 2.17.1
>


-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
