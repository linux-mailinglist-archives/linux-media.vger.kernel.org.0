Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4CE7B208B
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 17:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbjI1PKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 11:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbjI1PKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 11:10:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073F61A3
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 08:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695913762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gg+svjfGFhgA57E9+gEZITRV5ezB07aTRsYmcVluW+4=;
        b=NtuTb1gvQZXT7ZUoh88q3sDguYCujNBa5DnrUWe+kYKBc/xFRactikpbukBVzTZ4BYDj2l
        ztvVqxVxaZTkdMDdnFEXBiz3ll3+e21Yse7ZfDNsBfRVJWrjGXKw7yE36K8dXXjlwxM5w1
        naHJaimgI6Y4SkdJ8VlR/vzM95M+nAQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-3j6PIPyPP1-oRcLWk_5RWQ-1; Thu, 28 Sep 2023 11:09:20 -0400
X-MC-Unique: 3j6PIPyPP1-oRcLWk_5RWQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4053d832d51so106155585e9.0
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 08:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913759; x=1696518559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gg+svjfGFhgA57E9+gEZITRV5ezB07aTRsYmcVluW+4=;
        b=Zo7sweSclPBV1OPJUVuqV/avsqYBE9TvAI8AELoNp7X/FMfN/J1GKk2A95/ss66EzI
         Jc16LdLvIWXCGTltlysWiB2/NY1DGgHMcCAGTp7QXnjOImf53LEWGNaw/MwD8O13+bRB
         jeO5XG7jPXGayPLzsLh69VyX5Nny3eB9jekkz6aXduXUuner5iimyKBPOoHjPyZocMA9
         uJb3jFLAxWAHBQYX//7wce6vCAwIjocOjaYThZknGBvWCNL8JnpChlFLK0ooXycQV3Xf
         yUsH2LJwJ3JEGXDZJhFCR1GfDLoL2EMibklJGUhUpWaSISGjI5SBa8gs9aoQOwwQVXVy
         WypA==
X-Gm-Message-State: AOJu0Yyskyt+19r2bjkvo8qqSF67n4yAyuYpNN26k0wX61d8OtRTaSpA
        17+Ra816nJBBYSGmUyU1y3wPt0iYSFajqYGuMbuiMswUfWcpCYsXqtcKWQm+D2Dj6qct9N8IdQs
        JYqksWlCqZDCrkayW21xU/rM=
X-Received: by 2002:a5d:67cd:0:b0:31f:fb63:12d8 with SMTP id n13-20020a5d67cd000000b0031ffb6312d8mr1432584wrw.44.1695913759512;
        Thu, 28 Sep 2023 08:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXbYg+f8zkK1xrIrvbuGqqSLXbFUjIP4SZXohjaTSTxFgfMcAT6HbQRiHPCXgm4z9opsqFXg==
X-Received: by 2002:a5d:67cd:0:b0:31f:fb63:12d8 with SMTP id n13-20020a5d67cd000000b0031ffb6312d8mr1432564wrw.44.1695913759154;
        Thu, 28 Sep 2023 08:09:19 -0700 (PDT)
Received: from [10.10.158.202] ([213.144.205.82])
        by smtp.gmail.com with ESMTPSA id o5-20020adfeac5000000b0031984b370f2sm19534668wrn.47.2023.09.28.08.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 08:09:18 -0700 (PDT)
Message-ID: <fd65d648-7c79-c8bc-ab0f-9c9f2ea119a1@redhat.com>
Date:   Thu, 28 Sep 2023 17:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 0/2] media: Add onsemi MT9M114 camera sensor driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, Kate Hsuan <hpa@redhat.com>
References: <20230920171155.7648-1-laurent.pinchart@ideasonboard.com>
 <20230924144749.GA8357@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230924144749.GA8357@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/24/23 16:47, Laurent Pinchart wrote:
> Hi Hans,
> 
> FYI, as the atomisp driver has an mt9m114 driver. There's certainly no
> urgency to replace it, but if you have a machine on which you could test
> this driver, it could be nice at some point in the future. Any issue you
> encounter can be fixed on top of this series (in particular, dynamically
> computing the PLL configuration would be very nice).

Ok, so I just checked and I believe that the Asus T100TA indeed has
the MT9M114 sensor. So I'll try to give this a test run with atomisp
when I can make / find some time to do so.

Regards,

Hans



> 
> On Wed, Sep 20, 2023 at 08:11:52PM +0300, Laurent Pinchart wrote:
>> Hello,
>>
>> This series adds a driver for the onsemi MT9M114 camera sensor. It's all
>> a pretty standard story, DT bindings are in 1/2, and the driver in 2/2.
>> Review comments from v3 have all been taken into account as far as I can
>> tell.
>>
>> The driver has been tested with an i.MX8MM in CSI-2 mode. Jacopo tested
>> v2 in parallel mode, but given the number of changes in v3, I haven't
>> kept the Tested-by tag.
>>
>> Laurent Pinchart (2):
>>   media: dt-bindings: media: i2c: Add MT9M114 camera sensor binding
>>   media: i2c: Add driver for onsemi MT9M114 camera sensor
>>
>>  .../bindings/media/i2c/onnn,mt9m114.yaml      |  114 +
>>  MAINTAINERS                                   |    8 +
>>  drivers/media/i2c/Kconfig                     |   10 +
>>  drivers/media/i2c/Makefile                    |    1 +
>>  drivers/media/i2c/mt9m114.c                   | 2481 +++++++++++++++++
>>  5 files changed, 2614 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
>>  create mode 100644 drivers/media/i2c/mt9m114.c
>>
>>
>> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> 

