Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849E56C3E0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 02:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731350AbfGRAsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 20:48:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41488 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbfGRAsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 20:48:01 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so1647897pgg.8
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 17:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=UqjHuPLH0DGHGIeJoOhTUdPrJYPfda0I3skXrEX20AM=;
        b=rpi3oYSKX9SYXDr2nz2le9/I+lnBqEH5/qIfh6JEf4uhfNa7oAoFgQkeRjMFYqGZ2D
         aOavLLn1EutBGKVapasXVb4f98ACIWsgxLNgRs2pEPWqbmQydywedQPTvY8glrFc8efy
         GcYqIZcYsC2oHbP7HsM4feykb3xdAyAupG9js4hnZkTYpGy7nfNDf1SRuT1te8ClFUC9
         dI0Oh5PivcSh9sx4VN2fkVR/CmSITRGEmMS2be5VXEq6b2OxqstspcwOAEvuAEOmioj7
         LNXG/bXRl0iB/YKoiyBPvCeavpvjJdvNly48C/pkJRblime/YXdXeGVGLHXxdOGknjiC
         mYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UqjHuPLH0DGHGIeJoOhTUdPrJYPfda0I3skXrEX20AM=;
        b=Y2HsuzvHbl63zrHxTTzVrFlEA1/FMAw9940FHPmXz8xMWfh+ZpB4DmG7J7Za8lrwSw
         6w5H19LoK4xQLJf+QTAOimyni4OfnZYjOkxMI+kRn6JnDu6g44mIRC1SFoprcIqTsFb6
         k4oB0Ae/ofsd17ueNrVfON5Oqxt+c/Hp2IWvKmNhHrh2KKorVA8UecU0klpIdhbey0dz
         +kUCBnrqI/6j/LLbOiCdSuGvGVNY3/GT9YpyHod/FmKo77l6tVuiPpXYby1JC5OhZbKW
         7YYPmHCMKncrd8FP/npNAr4PZwTsLnFsxgbwJeJ/1sTZKlVUhiQZQNIiXuNxJx8c1UxN
         dWHA==
X-Gm-Message-State: APjAAAVtiuxRnSIBz/oOiuBmoOqnTu9HFaZ3D6MJ91aStKvHlRh0cY8M
        u3l36jsfYPJU4FcyVj5pdhzVdziNgKE=
X-Google-Smtp-Source: APXvYqx2MWvOq3w3TiK8ZRNoI/ETJAjc8IHLPyknPGojX7XITi6F3mZ116XsltNojLBqvpdusNJDCQ==
X-Received: by 2002:a63:130f:: with SMTP id i15mr43541882pgl.158.1563410880443;
        Wed, 17 Jul 2019 17:48:00 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id h1sm19456455pgv.93.2019.07.17.17.47.58
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 17:47:59 -0700 (PDT)
Subject: Re: [PATCH] media:dvb-frontends:Return if Max devices are added in
 dvb_pll_attach().
To:     Vandana BN <bnvandana@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20190717141204.19433-1-bnvandana@gmail.com>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <f8d9af33-d7d8-22d1-428f-b7b7c1d84062@gmail.com>
Date:   Thu, 18 Jul 2019 09:35:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717141204.19433-1-bnvandana@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

> diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-frontends/dvb-pll.c
> index ba0c49107bd2..c850f1d69bce 100644
> --- a/drivers/media/dvb-frontends/dvb-pll.c
> +++ b/drivers/media/dvb-frontends/dvb-pll.c
> @@ -788,6 +788,9 @@ struct dvb_frontend *dvb_pll_attach(struct dvb_frontend *fe, int pll_addr,
>  	int ret;
>  	const struct dvb_pll_desc *desc;
> 
> +	if (dvb_pll_devcount > DVB_PLL_MAX - 1)
> +		return NULL;
> +
>  	b1 = kmalloc(1, GFP_KERNEL);
>  	if (!b1)
>  		return NULL;
> 

Wouldn't it put a limit on the number of attachment of devices?
I'm afraid that an user may repeatedly plugs in and off a device
using this driver (for some reason), and finally gets an error.

Since dvb_pll_devcount and "id" module parameter are just used
for debugging purpose to override/force PLL type,
removing them totally would be better, IMHO.

regards,
Akihiro
