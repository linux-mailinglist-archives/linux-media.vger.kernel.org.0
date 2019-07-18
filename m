Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D926CB90
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 11:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfGRJKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 05:10:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38393 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfGRJKU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 05:10:20 -0400
Received: by mail-pl1-f193.google.com with SMTP id az7so13538877plb.5
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2019 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=QxYdSERVMnEWiEqWF2R4jP8/W2xB2vltKcv+ZyYkY4E=;
        b=QYg8HBvtHh7dvPfhGa7UrXmKAJxFN7ds4XtAuAchIXlsrbtVG6ZWzd9jYnvDt/YKdC
         dYZYz6wy4cQwoURf8WmisB3cyc7PsJLVXqu/jLTe0xjI7TRjm+b2GaYENS0c7Q0YUoYW
         qd0T86phUPym/sQpYL79ms7qX4i6bWGvRm7VOE3OMH7z6ZbqtLTObWHd+vofKkUg+KVb
         CO/WgCQQ/09RKJDZ9UhB7h9WvBVPu++Ybx6fa8ekjznA/OJPEI4jnt8oZM2Pb7/yHFVR
         2rbAUIIAcCkxwifFQPhDYllli02U9l50m7AQj5nmJS3tjLjh9q1dBCqfEEmjFppdKegV
         TJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QxYdSERVMnEWiEqWF2R4jP8/W2xB2vltKcv+ZyYkY4E=;
        b=Z/z7nKegvFB29ftXA9hNt9JlPWnKYQXbIQTJ8ajJgWmzg/w28vxXFxVDuQVQpKHJni
         d7KNrLkp2EM41XSYkqx2clmeKI2hCqTqLuezC99DhwqWbYEKNUUrCZy32x9D9pE3wVPr
         RFwSPfrGD0DeypoiEnydz523uCe8H4nPFzd4hQ33vOYA8Ht4zFuERM0S36VtpjQ32Rfz
         KwY7FseCik46mvEMvQJmGKsYrCcAVrkfh7mvD9Juo0QO+6G0yUTxMm1A7ly4ooz2z5b3
         /wiQHnv9bumI+u5BH0WghUiSUEhuieh8Mv8DGU4Y/hy9FTs2J3qxM1kYkikYWWF0Rspf
         mGxw==
X-Gm-Message-State: APjAAAXu5e8mOjSNL9EFHxfW0jktoa3/PmE1T9h/mVYGQlT0+R40Wx5I
        xo+xrIeMo80+TpXPywZzUIbhkTiRyKw=
X-Google-Smtp-Source: APXvYqz6/0o8xmBGXDckIykXFqZmvJ67PfDzO3KP5cDURFw2Ehl8N5QNJU5t2esnB9SoMDGewLRNuw==
X-Received: by 2002:a17:902:f81:: with SMTP id 1mr48343731plz.191.1563441019841;
        Thu, 18 Jul 2019 02:10:19 -0700 (PDT)
Received: from [192.168.43.135] ([223.186.230.176])
        by smtp.gmail.com with ESMTPSA id g18sm46849922pgm.9.2019.07.18.02.10.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 02:10:19 -0700 (PDT)
Subject: Re: [PATCH] media:dvb-frontends:Return if Max devices are added in
 dvb_pll_attach().
To:     Akihiro TSUKADA <tskd08@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20190717141204.19433-1-bnvandana@gmail.com>
 <f8d9af33-d7d8-22d1-428f-b7b7c1d84062@gmail.com>
From:   Vandana BN <bnvandana@gmail.com>
Message-ID: <1c150bc5-0b15-23bf-2170-758c9cc046e3@gmail.com>
Date:   Thu, 18 Jul 2019 14:40:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f8d9af33-d7d8-22d1-428f-b7b7c1d84062@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 18/07/19 6:05 AM, Akihiro TSUKADA wrote:
> Hi,
>
>> diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
>> index ba0c49107bd2..c850f1d69bce 100644
>> --- a/drivers/media/dvb-frontends/dvb-pll.c
>> +++ b/drivers/media/dvb-frontends/dvb-pll.c
>> @@ -788,6 +788,9 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
>>  	int ret;
>>  	const struct dvb_pll_desc *desc;
>>
>> +	if (dvb_pll_devcount > DVB_PLL_MAX - 1)
>> +		return NULL;
>> +
>>  	b1 = kmalloc(1, GFP_KERNEL);
>>  	if (!b1)
>>  		return NULL;
>>
> Wouldn't it put a limit on the number of attachment of devices?
> I'm afraid that an user may repeatedly plugs in and off a device
> using this driver (for some reason), and finally gets an error.
>
> Since dvb_pll_devcount and "id" module parameter are just used
> for debugging purpose to override/force PLL type,
> removing them totally would be better, IMHO.

Hi,

Thanks for reviewing the patch.

Will it be better, if dvb_pll_devcount is decremented in dvb_pll_release(),  instead of removing module params?

Regards,

Vandana.

>
> regards,
> Akihiro
