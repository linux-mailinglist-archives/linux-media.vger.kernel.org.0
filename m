Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25FD3CC684
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 23:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhGQVyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 17:54:10 -0400
Received: from mx2.ucr.edu ([138.23.62.3]:52789 "EHLO mx2.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231300AbhGQVyJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 17:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1626558672; x=1658094672;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:cc;
  bh=1yilOERNyPcoY3A26m/nt1Y2t9Ypa4x9Ubo3GY7XWj8=;
  b=CrcVMg18/+mVjknU5TBf2gjv7/VfzKILAtksXDdWPq1GNPRr0jdmDKbG
   nEnErmDT0GTAohdKnPQPg18xAvPONQOAuzQP2X1do2oHhY5/9id5H3ga4
   hBmmd9np3MzkLmY/Qo2FV3/HoS7/Wc0bNJgxLeyNMxL3L4AkvFsEg0aE+
   x4I1EJfYMIr0M2sh2TWLqu9gG980+QpMgWXg9KgsLDhiFD2mwDWRkijSP
   ei+bmBPNr6xy2aLL4ro5Jhmooyhm/hkaFUL8m9aIbWrd8Lg9hQwDnCBEx
   4Qwq2iscByYbuT0AAw6PhdGlXdQ5WAerGs0sRt/sCtgvvXnjl/DZSCH7z
   Q==;
IronPort-SDR: 75O5XTDskTEig+MPL/yL044ovusKPRDWD/LNGxQzcqpjdoqbXbOY4slA5Fxh6zZQ7gebve5ZuS
 8YIjpOhWFwmm2c5/QYEVCBsM1pjWDINApyFusL77g0QTUeg2scZ6Bd9QnUu7cw0QRuVw45V8W4
 rf0JDA6wkl2dI6AQmdmsrCdBuod12AwqwoQyaTvMggJUQLcuzoybXE9rzalWgvS48UQ3yVrZF7
 s6DCii1blBTozErz5ql0jZ5Fa2BDDuN7PwZBA4Fn8ecIVdQv/SNFwUxWMLZKRf/DoUxx2mskoK
 muQaRkqg+LWBK+gRASzJQyJh
X-IPAS-Result: =?us-ascii?q?A2FIAwDdT/NggMjSVdFaHgEBCxIMQIFOC4N4VhaESJFgi?=
 =?us-ascii?q?mKBGoZ8iGaBfAIJAQEBD0EEAQGEVwIjglsCJTQJDgIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QMBAQYBAQEBAQEFBAEBAhABAYEMC1kLY4FPgXkGBD2COCmDZQkBAQEDEhEEU?=
 =?us-ascii?q?hALCw0CAiYCAiISAQUBHBkiOYIXgwebC4EEPYsyfzOBAYd8AQkNgWMSfiqHC?=
 =?us-ascii?q?oZiJ4IpgUuBBYEzNz6HWxSCUASDF3sTW4JIVgEBAZAvG4MGiz2BJptjAQYCg?=
 =?us-ascii?q?wockj+LeiumXrsrECOBOIIVMxolfwZnCoFBTQECAQIBDAIBAgECAQIBAggBA?=
 =?us-ascii?q?QKdCyQvOAIGCwEBAwmMOwE?=
IronPort-PHdr: A9a23:JYwQVBIi9/+mnge6PtmcuJVmWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCFvbM30RSZBc2bs6sC17OH9fi4GCQp2tWoiDg6aptCVhsI2409vjcLJ4q7M3D9N+PgdCcgH
 c5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTajfb9+N
 gu6oAXeusQVnYdpN6I9xgfUrndSdOla2GdlKUiPkxrg48u74YJu/TlXt/897cBLTL/0f74/T
 bxWDTQmN3466cj2vhTdTgWB+2URXHwOnhVHHwbK4hf6XozssiThrepyxDOaPcztQr8qXzmp8
 rpmRwXpiCcDMD457X3Xh8lth69VvB6tuxpyyJPPbYqLKPRxYL/SfdICRWpAQMlRUTBBApihZ
 IcLFuYNIPpUo5X4q1YIqBu+BBKsBPjuyj9OiX/9wLM03f08GgHI3QwvAdYOv2nJp9nxOqoeT
 eW5wa/VxjvBcvxWwy/w54fGch8jof+CU7F+f9fNxkQ0CwPJkk+dpZD5Mz+J1OkAtXWQ4ep6V
 eKojm4qswN+ojmux8csl4nJgZ8exVPE9SpjwYY+ONq1SU56YN6kCpRQtj2WO5d4T845XmFnp
 Dw6xqcYtpGmYSgH0ZIqzAPQZPKbaYaH+A7jVPqPLjdignJoYK+yigu9/0WjzuDxVtW43lhFo
 CdHj9TBqHEA2gHd58WERfZz8Umv1CqT2g3Q6OxJJVw5mbbFJpM9w7M9lYYevEDFEyTrm0v2l
 Lebels49uWs8ejqYbXrqoWCO4Nplg3yKLoiltCjDek+LwMARXKU+f6m273m5UD5RbJKgeAon
 aTBq5DaINgbpra+Aw9IzoYv8xa/ACmi0NQfhXQHKUhKeBODj4TwI1HOLu30Ae6xg1iyjDtn2
 +rKPrLmApXKIXjDlKnucaxh5E5bzQo/1dFf55RKBbEdOP//RFP9udjCAhI6MwG42fjrBMhh2
 o8ER26DHrOVPLvXsVCS5+IvJ+eMZJUSuDb4M/Uk5//vjX8jll8cYaWlwZUaZWulHvt6OUWVe
 2TjjcocEWsSpAoxUPTqiEGeUT5Uf3uyW6M85jcmCIOpFIvDQ56ij6GA3CihBZBWeG9GBU6WE
 XvydIWLRe0MaCSMLc9liDAEUqKhS4BynT+0swqv+rt1LvfTsh8YvJOrgMln5+TSzUlp3SF/F
 YKQ33zbHDI8pX8BWzJjhPM3mkd60FrWlPcg68E=
IronPort-HdrOrdr: A9a23:2NBZ4qqGbuV1ySAHOZ2utFwaV5oueYIsimQD101hICG9vPbo8f
 xG/c5rrCMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 6iScVD4R/LZ2SSQfyX3OBwKblP/OW6
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,248,1620716400"; 
   d="scan'208";a="165105830"
Received: from mail-pf1-f200.google.com ([209.85.210.200])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jul 2021 14:51:11 -0700
Received: by mail-pf1-f200.google.com with SMTP id i1-20020aa78d810000b02903414cf39ec3so722368pfr.3
        for <linux-media@vger.kernel.org>; Sat, 17 Jul 2021 14:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=24ruHgKdRqiISpvE23HRNMHuYpAUJ+UGSln1cmXL8UU=;
        b=WdNLbeWK81teZ9H/evhB0F3pI+Q5nRFlclBKWuf5We++si78lilYeeDbt3o2OsGmA6
         AxKG6UtMuRoaEnW/CwQrpbsQrDwivdXgZKvFPR/UeLQ5IA/iisjKoXFeEDd/002TdC7c
         22WyGvha0j/RqO4Fs3CR0/LC1Ssf+rAcXwcP4wbWB/g9A3L9gUeetmNJ9Cd04rh5YyCB
         G+KvpetNTZ3hNLATMNZoH0ikLd1IBP+TcCEzii4XRNfAL7wJRF1vWTTpJZ6oYdTAgTby
         xHB/pkct/Yk8aSIMjWutKyF3iGmaTEpNkNN1ISWHZtuPXpSHwLBv9KrZiYjEOUgGhyay
         0nyA==
X-Gm-Message-State: AOAM533UNjHJs1PCSgGijP15SlhS4xGUO9D28BTq3RFOUT0YubbtpmZn
        15tg4K7U+o9P1cUXElR8cG2zfDbKnqoQNoBO5yN6SuM1xZl3Mm35FzzwjD4O2ZShqcbgA87Ahdn
        CyJNebYyyTsjpPBlIsqyVHBmz7evRIromNswVqAbT
X-Google-Smtp-Source: ABdhPJx4nMFZ8lgRjpMCdgpx9cUW8kP0BnBq02+XDGcFwbUWQeHZjP0W+v8Pp652wx0SrSztyjnwR3beiJNwkF1cFYg=
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id w125-20020a62dd830000b02902e8e511c32fmr17145130pff.49.1626558669967;
        Sat, 17 Jul 2021 14:51:09 -0700 (PDT)
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id
 w125-20020a62dd830000b02902e8e511c32fmt11615345pff.49.1626558669672; Sat, 17
 Jul 2021 14:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210624031719.11157-1-yzhai003@ucr.edu> <20210625053858.3862-1-yzhai003@ucr.edu>
In-Reply-To: <20210625053858.3862-1-yzhai003@ucr.edu>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Sat, 17 Jul 2021 14:50:59 -0700
Message-ID: <CABvMjLRQdTzfPX8YRtAwsPbh=FjbzxRu7Hhun1gk0i1kka94nA@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: fix the uninitialized use and rename "retvalue"
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All:
Does the new patch work?


On Thu, Jun 24, 2021 at 10:37 PM Yizhuo <yzhai003@ucr.edu> wrote:
>
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
>
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
>
> Fixes: ad85094 (media / atomisp: fix the uninitialized use of model ID)
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
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
