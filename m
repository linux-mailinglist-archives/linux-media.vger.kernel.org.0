Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7E773376D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbjFPR20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjFPR2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DCB1FD7
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dgdmJvE9d55e3NeHF8sZyoEidflfTbrv+85y7n4xW34=;
        b=BssEvCulmA7X/Hab2SywZnkio0rrDH6aDNzZRmHNZCV3Ho3wYcwLraDRgNh7qsgJeBOwVV
        8It+LoYkI+f6RPZH0FekoQbgp6z+BX2RZbjXHl/tR9HFTYoL7YerHcMpAj2f08W1Pre/tt
        lHQrWJVIA8/YU9hkx+x2kmwbuTKIjU0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-4hWWGuQRPkK-0Ohz5k6cGg-1; Fri, 16 Jun 2023 13:27:36 -0400
X-MC-Unique: 4hWWGuQRPkK-0Ohz5k6cGg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9828220e322so64195866b.1
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686936455; x=1689528455;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgdmJvE9d55e3NeHF8sZyoEidflfTbrv+85y7n4xW34=;
        b=MLJZLP9hAc+MnATLVDHFCI2OKMgORgCZbBAbOeRgRZ+thcfVz4YMr+Rt9KdK/CiaXt
         dS35JICI4YTJyUnT2QBCDqffUIGyhksX51HJoKQyVKmSxLkFRY4OFrwKDh4Ljd+dMoLb
         amCqJfqC+pJIbt1LoFynqqNEwYuaWPJdM1tgPYBPsWDJNDJvdHTVYMsnCqGdYXqC5M6x
         vDnyz8SY+nTrt8XIDHd8vpB7BICuxTWIknBdCpvYNiN1XV3X81q8nu6iqgsk1lpvmInp
         8JEOldvDq4dAfLWo28QzSH/COZg9OB9oYqF5FgSwVcm9qX4Dkr0t8p+/w2sgwdq6qu1O
         CGag==
X-Gm-Message-State: AC+VfDxscYSgNQDFH5KXmuZz6EVkl8cPpCedvDKnK9FTa8FjSqX8szrL
        Tw8C+yaYjUNLmI9vyi1pj1vbaxF6jfFuZnaBBlpJcTTKaonHYTdWfpb9k6MDeuSZnLn+IYrR3Qx
        ssO+GUrzFUKE/1UUVB//Xt/A=
X-Received: by 2002:a17:907:6095:b0:978:9380:bc0b with SMTP id ht21-20020a170907609500b009789380bc0bmr2889586ejc.75.1686936455256;
        Fri, 16 Jun 2023 10:27:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZsL5yGHct61r4p2mwTSQhRf8q+7D2uv/+PfS/BAbHwz30A2Dcbs5049Xnb1Ly2mpreI4tJw==
X-Received: by 2002:a17:907:6095:b0:978:9380:bc0b with SMTP id ht21-20020a170907609500b009789380bc0bmr2889573ejc.75.1686936454981;
        Fri, 16 Jun 2023 10:27:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o26-20020a1709062e9a00b009823d630ca8sm5302003eji.216.2023.06.16.10.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 10:27:34 -0700 (PDT)
Message-ID: <3e9e5340-57f0-a419-7d02-3216bf3e8f13@redhat.com>
Date:   Fri, 16 Jun 2023 19:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/28] media: ov2680: Add support for ACPI enumeration
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230615141349.172363-1-hdegoede@redhat.com>
 <20230615141349.172363-18-hdegoede@redhat.com>
 <ZIsjHCpGbJt0QxL2@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIsjHCpGbJt0QxL2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/15/23 16:41, Andy Shevchenko wrote:
> On Thu, Jun 15, 2023 at 04:13:38PM +0200, Hans de Goede wrote:
>> Add an acpi_match_table now that all the other bits necessary for
>> ACPI support are in place.
> 
> ...
> 
>> +static const struct acpi_device_id ov2680_acpi_ids[] = {
>> +	{ "OVTI2680" },
>> +	{ /* sentinel */ },
> 
> Comma is not needed for the terminator entry.

Ack, thank you. Fixed for the next version.

Regards,

Hans




> 
>> +};
> 

