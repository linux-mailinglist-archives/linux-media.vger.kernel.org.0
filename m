Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB837E7E80
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344796AbjKJRpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Nov 2023 12:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346031AbjKJRor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Nov 2023 12:44:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063AD2D4C5
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699614692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hD8CN24q/ovyb7vibqzhfthRmLth1LSULYOx5xYDjxQ=;
        b=UqVi0ZLAGMBT++gmdAwQ1RjgV7DusYNikJ4e/FVp3lK4J++Wuuh4oJ59d+P3rLl52jbrmW
        FC+qGfShOD5v/yTrhSPRQlgdr0cMi3+9JpA9SBVsYijrzr/3ATQLieD5osT9DlSQ8/tSwx
        fXSa0odxA0XNAdQPlg2k8FGCugNtomY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-3n1Vdy_uPXW8bscbpfl1rQ-1; Fri, 10 Nov 2023 06:11:30 -0500
X-MC-Unique: 3n1Vdy_uPXW8bscbpfl1rQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9c7f0a33afbso150837966b.3
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699614689; x=1700219489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hD8CN24q/ovyb7vibqzhfthRmLth1LSULYOx5xYDjxQ=;
        b=SsKBUeWwDPmUGH5tyfCK8iC2hkFTnr3s4yQO0bVEhQA6i2NfupO88mCJwIB3OWVKZP
         vMmExDynAYESsoem4bFPI2xR7wN50fPYZhm/97kHG7ksWmBCNh+VGA2j/R0J7TBYvscb
         kRKfJWIwas+rUolxiUTw9aizDC1WmM9LM7j/XXNbqErmdX1X4Xpy+apwG1j0ht7BHFGe
         nkJN36sfiFu/vK5rBAIUQQDkZkCPmOaZB/84OrECqL6FQZ1Pgzi2QMB97H8sw601nFBJ
         gmKau/45w4pc6sVXDhp2d7Avq9q3/wcCMKPYRU1DjK1rOCAJze2JhCSUgmiKilFPmyjd
         EX4Q==
X-Gm-Message-State: AOJu0YyEIq4YdvR/wtf7hTpjMaZuith96tuQTkG+7bX0LXrszBiTysox
        X6O48yzPvnmA2Y3nPgt8y0T8TYNen2zxVgiG7P0P/qXLYYSKBtEnZ4vK/ar06/mQjQYdAX86e8U
        0bexY+NrG/RHt81ckzRg4yRZBDlcIges=
X-Received: by 2002:a17:907:9802:b0:9ad:e180:16e3 with SMTP id ji2-20020a170907980200b009ade18016e3mr6672444ejc.37.1699614689545;
        Fri, 10 Nov 2023 03:11:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBGBtO3PiLJbEcaPxm2IJmYu8ClC0UU2c+RHJabBNL4YVfKyjBMvDXDNteXP9LiAWkfjO/jg==
X-Received: by 2002:a17:907:9802:b0:9ad:e180:16e3 with SMTP id ji2-20020a170907980200b009ade18016e3mr6672433ejc.37.1699614689277;
        Fri, 10 Nov 2023 03:11:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fj17-20020a1709069c9100b009e6391123b6sm615053ejc.50.2023.11.10.03.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 03:11:28 -0800 (PST)
Message-ID: <e8ca9be0-dc79-4b0b-8173-e3cdf41b883a@redhat.com>
Date:   Fri, 10 Nov 2023 12:11:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: v4l: cci: Include linux/bits.h
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-2-sakari.ailus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231110094705.1367083-2-sakari.ailus@linux.intel.com>
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
> linux/bits.h is needed for GENMASK(). Include it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-cci.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index 0f6803e4b17e..f2c2962e936b 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -7,6 +7,7 @@
>  #ifndef _V4L2_CCI_H
>  #define _V4L2_CCI_H
>  
> +#include <linux/bits.h>
>  #include <linux/types.h>
>  
>  struct i2c_client;

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


