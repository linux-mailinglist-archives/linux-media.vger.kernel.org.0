Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5ABC429965
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 00:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbhJKWYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 18:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235518AbhJKWYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 18:24:14 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018C2C061570;
        Mon, 11 Oct 2021 15:22:13 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id y3so27542539wrl.1;
        Mon, 11 Oct 2021 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Wzwc8Zds8WxUCA2iltmTu79XnAcWeld1vKm+I7X0eX0=;
        b=mSZatvINRRZjPX+0garswmZjx3ENM7kwyc3ofRjl3kKPWW9CAttdblYYL5be2SkX+e
         qYCRDtBMj0m43F04qbww9eDcEQtMJ+v+s0y/UK/1cjKlmYVEILv42gLuJRlBzceqgCXo
         DnzrxywV1AwIPypIiTTElhuFWOORk0AuLZZ+s6k2XQSd24cD/l3qE3wfpKGKoI7u7bVt
         rhPa18u+9UvZSTgc7hbHsT11uQXIxqGEXoPhrR5iWYUhXBX91by55DfY46nFAhctKfFL
         LjtiDBG2RUsx1jhQc1MZW8OMZy/B+hjc2RsIE4tC/A6o2/URVrH0YwoXAsIDwNB69QoC
         P9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Wzwc8Zds8WxUCA2iltmTu79XnAcWeld1vKm+I7X0eX0=;
        b=Qcu9VnfWHf73lLn4IoM+4Q7DYqfTeAd4Y0FifUYkX5NZMeMD01CYQwtWkjrZz1KjF/
         vfqN/Bia2ZPUzVxF2gidq0KgjlBVbSjpSSYV47TNNyRVkdWaMspCKPLnGZR1WPwqvtQy
         ImFvLGA+9jxnXnka4dZf2PoVFlGffTMh5e4P3bqm5ds024iSUXnWiFT/ubjwEUQBp3o3
         yhaRurXDElL6juBHz/zHjDXdBrwBY8VguMV8gdCPeJ6/i0QRF4BfVrbTaGgloB7WVHAQ
         wHv0AtxUSQAi+wSlhbxEjtB3pMhDgQS68QRLJABcGwisMJOjFu9TzJm9srSZpj3NWKu5
         FOXQ==
X-Gm-Message-State: AOAM533GsfrNkiaopRnsaSqzYBkB+YRGcxIC8fSUr5p/FNg+yc0SnJnt
        +tKKlOg2we4A9Y9KgSHQRVo=
X-Google-Smtp-Source: ABdhPJxj06KJgwq0WGrAms1tHSD6U3i52V2ukLpmfdIgLIHfebskhjSsPyB186aFPVzTxPeQryef+A==
X-Received: by 2002:adf:9787:: with SMTP id s7mr27003707wrb.191.1633990931598;
        Mon, 11 Oct 2021 15:22:11 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id g144sm708389wmg.5.2021.10.11.15.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 15:22:11 -0700 (PDT)
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
To:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
 <m3mtnflpna.fsf@t19.piap.pl>
 <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <6c89cdb5-4920-8d01-2051-b64b804db9f6@gmail.com>
Date:   Mon, 11 Oct 2021 23:22:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On 11/10/2021 15:34, Jacopo Mondi wrote:
>>>> +static int ar0521_remove(struct i2c_client *client)
>>>> +{
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
>>>> +
>>>> +	v4l2_async_unregister_subdev(&sensor->sd);
>>>> +	media_entity_cleanup(&sensor->sd.entity);
>>>> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>>>> +	pm_runtime_disable(&client->dev);
>>>> +	pm_runtime_set_suspended(&client->dev);
>>> set_suspended() then disable maybe ?
>> Other drivers seem to do it the above way but I don't know the
>> difference.
> Maybe I'm wrong but calling set_suspend() after pm_runtime() had been
> disabled seems pointless. A minor anyway as it's in the driver's
> remove function.
>

fwiw, the kernel doc [1] for pm_runtime_set_suspended() does say that
it's not valid to call it for devices where runtime PM is still enabled.


[1]
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L510

