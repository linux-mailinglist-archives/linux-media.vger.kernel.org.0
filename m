Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5854A7E7E82
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345965AbjKJRpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Nov 2023 12:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbjKJRoz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Nov 2023 12:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012942D4CD
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699614708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NSD4YejZNM223Dn/jWm53q9blxJnPoPOmqWjxFzmcE0=;
        b=alura4WT0OVLRE4vNlmszSLQ1Tv76Q5IPuTEfyqXUHfspKzm28xSLoIreUJ59Irr4MlZgf
        LBb0d45uYPW+qJ04gfES13/SO3q8h/TsAM6QKIrbNEZVs+giW0Jk7LAhYUELCy/8Ql78BI
        3d9jhDEfQrGUAcKoaK3/nDUIQ1LqSvE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-xxEMYSdFM2ilUCxt8fNgjg-1; Fri, 10 Nov 2023 06:11:47 -0500
X-MC-Unique: xxEMYSdFM2ilUCxt8fNgjg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9e31708ad72so161780866b.3
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699614706; x=1700219506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSD4YejZNM223Dn/jWm53q9blxJnPoPOmqWjxFzmcE0=;
        b=vqxxB3s5KkThkyLdjdtZEcyDEZj4wVHswhfoE8spC3uD6h1OJx6FfJJRYR0Lb4NYjg
         ftsNmrAZ0FZwcdTOS0nZ9LiphsL9kWrJluUkXf1T1qPyUBqvkt2WM7FwOvXXHcSck2XL
         4LYCYlRE79dTPSuTopuj1HhXbCor3/PP9G7g7D0EciWG7FcmMFv1GMbF01Pb7HUkTaPH
         xskPuJMYyT1IUdLXCiDJuYPfFO/O+rgVoH4St2BA91n6udngIiJt4eHWqgbwUxsgMKQ/
         gdU0TZ+iJg6nvM4iSQAAy6ULGh8DvWqlSFdgQPO1ca3g2RwBVda8MfnfgHET4d9pszV2
         k1ew==
X-Gm-Message-State: AOJu0YzyAjTDtr2v1K7BXOFgYqyunxVyzSp4XwHJiD3nfokMy8W+cUzR
        j+Ud74720B6P76n+75rYKPQi1ERxp03GuGly+0ZN6qz0BufhXqt4AxMA/VYAIzg7VUiNPaA9kyH
        +dku9O2zK2WEDg1do6PBUcw0=
X-Received: by 2002:a17:907:c13:b0:9b2:b149:b81a with SMTP id ga19-20020a1709070c1300b009b2b149b81amr7192542ejc.64.1699614706459;
        Fri, 10 Nov 2023 03:11:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnnS/sFmxbRfaKctUwF05b1bA9iUBe83OOWZLqNlF+5yK8Fd3zeJeF2MK2CWGYW9OCnsVn/g==
X-Received: by 2002:a17:907:c13:b0:9b2:b149:b81a with SMTP id ga19-20020a1709070c1300b009b2b149b81amr7192529ejc.64.1699614706255;
        Fri, 10 Nov 2023 03:11:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fj17-20020a1709069c9100b009e6391123b6sm615053ejc.50.2023.11.10.03.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 03:11:45 -0800 (PST)
Message-ID: <1f313240-8b27-46c3-90d6-013ae64eb359@redhat.com>
Date:   Fri, 10 Nov 2023 12:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] media: v4l: cci: Add driver-private bit definitions
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-3-sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231110094705.1367083-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/10/23 10:47, Sakari Ailus wrote:
> Provide a few bits for drivers to store private information on register
> definitions.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-cci.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index f2c2962e936b..b4ce0a46092c 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -33,6 +33,12 @@ struct cci_reg_sequence {
>  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
>  #define CCI_REG_WIDTH_SHIFT		16
>  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> +/*
> + * Private CCI register flags, for the use of drivers.
> + */
> +#define CCI_REG_FLAG_PRIVATE_START	28U
> +#define CCI_REG_FLAG_PRIVATE_END	31U
> +#define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
>  
>  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


