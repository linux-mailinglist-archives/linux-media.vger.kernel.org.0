Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CD93AC8F3
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 12:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbhFRKjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 06:39:41 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38775 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232620AbhFRKjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 06:39:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uBsKlChofhqltuBsNl4qYb; Fri, 18 Jun 2021 12:37:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624012649; bh=VlAoir4iEvONAT/BY+cgI0IYuXDYmhxoRI0C9ApQ6wc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rDLXGSi8AsyID7i8J1ovZ3rCmDiKIFj7+HjJ3IqnxXLgLVW2Uefxy4RXM/NhSraP6
         xUIFfkeML5loBY9IfD5l+eCGY2JEd3YoC6xfSK284fzgyeS3yAgE4ZwSV0wK+9Ny2b
         geK1Ds/BOTolRdBuE64yGI7hkuSZVr/1+JnaE+ugnIXDun32lhcCb8cNjufkKMVk4M
         Nrk0OSjQQug+UggvN9LQgUntduKboeQps0uX9Z2dhK3jFskgt8F8jCWl7n51KmHHaD
         zvxd8STpK/vJgT5z+OFnvhWtF3BmeZTWtnP/CbWLiu2a4B9A1XLaVR+GpOPe/EAFIE
         4osaNeTFdv7/g==
Subject: Re: [PATCH] media: atomisp: fix the uninitialized use
To:     Yizhuo Zhai <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        akari.ailus@linux.intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        juant.aldea@gmail.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <CABvMjLRkmsrxXxHkX7PrkoRK5m=7_b3wpvyZK88V19b05CFx2w@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8b717a74-e863-87d9-d42e-ede344a9e036@xs4all.nl>
Date:   Fri, 18 Jun 2021 12:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CABvMjLRkmsrxXxHkX7PrkoRK5m=7_b3wpvyZK88V19b05CFx2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKmXUTMoU7DtZ3Beut9p5klX6/m9criQsvlt5IGujsj6uzPjxzuIz7/JYvEcUkbNvJxU76YduC0OS2op4syZwei3S/ANIwgVSa6WxuQxm8aRrmOJ8YMS
 oG5Gmj7zitcf1a7SdUIst8Ai3RkYCP8H8AS9DeUS0R5WSlTJ/GelXzxS+O5CxXYQSROBQ//eKyC7YjhZDp8ORAEeqjSs+tkq9mkaw78JI+kXJ3u5cGcgz0W/
 TYem41lTtjiSVjE25fJ843JRBDJG/pArnoZDc0gOTryg1Bx1ejZVxbq+op4UGwm0nTV2F4v0xeKLlFKh3ceSnpYJPv4EIAchipFDg1IZFNd17RYIwOewbSDe
 epNG9ewqiRovObNr+TUMCBNWI45yNC36TZWekEbWulkOAWx84vVz2hLGdGjaKmJf5HjF2LE8a7jwWA/edrGYkMZ12xXtUnUagVlU0jQeS00aAe+cYVE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/06/2021 20:45, Yizhuo Zhai wrote:
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index f5de81132177..8ddddb18ffbb 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1534,12 +1534,15 @@ static int mt9m114_detect(struct
> mt9m114_device *dev, struct i2c_client *client)
>  {
>         struct i2c_adapter *adapter = client->adapter;
>         u32 retvalue;
> +       int ret;

Hmm, 'ret' and 'retvalue'. That's a bit confusing. Just rename 'retvalue'
to 'model', then it makes more sense.

> 
>         if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
>                 dev_err(&client->dev, "%s: i2c error", __func__);
>                 return -ENODEV;
>         }
> -       mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
> +       ret = mt9m114_read_reg(client, MISENSOR_16BIT,
> (u32)MT9M114_PID, &retvalue);
> +       if (ret)
> +               return ret;
>         dev->real_model_id = retvalue;
> 
>         if (retvalue != MT9M114_MOD_ID) {
> 

This patch got mangled by your mail client: long lines were wrapped around.

Regards,

	Hans
