Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A05F7DE052
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 12:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235043AbjKAL3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 07:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234822AbjKAL3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 07:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625C410D
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698838122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IxPLT7V08orWBovquewBVBeCTUvOTPT9eSJwU2q28pQ=;
        b=a7INxvVAhK+zYj4Y0V1/1Q1ZIRU3oCczBQuZDRXBiTnu5h+vK6ZidbDkdp89Uf+/GscAQn
        qrDN0CscWNU4+J31M6q+DtyzEoiw9voxVftU5WzzxXPuzwxKY+JesjvUHFjLUaLXiTTn9H
        Sy9vLlWpvzODJsQQDDOHAb8OheSWEq8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-tgmovArqPjSr71zLd-bNBg-1; Wed, 01 Nov 2023 07:28:41 -0400
X-MC-Unique: tgmovArqPjSr71zLd-bNBg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9b2cf504e3aso467753866b.2
        for <linux-media@vger.kernel.org>; Wed, 01 Nov 2023 04:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698838119; x=1699442919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxPLT7V08orWBovquewBVBeCTUvOTPT9eSJwU2q28pQ=;
        b=N0QpbBycosamUphUKl9g0sOBVACAM/wMf54jTwsD2a2ZWnlIVjZfzSbW2VHqfjFz6+
         4bGCM1K2fzEVsLVbykfMlnTHNzwKo4FUuyN/GbYkqYKsJ3aiyjclxZd9/fWTNlY2IuD6
         Lr70xjDTUsaYk7TpaMJWsI70Y8hYas+iHoMVCJib5tcfZGtvNsJRSK4N8AibGjKXE0cz
         Hme0eK26YgUknzhIEDXWk6RWdUoFnyB4A7NBtyYVbQasw1k5GzlInM21BeoUz0agCi/R
         JhLn3EY4I/i2p9Jt6gAqLVvyPVniigNIf4ibFSP4aOfMkcjGv3Q5UKkoVzGXQu3641Q3
         ah5g==
X-Gm-Message-State: AOJu0YzehVVSICT4n7WodzJKyqAB/RitDp912kjIWXGGsuIW5DBb+7FU
        mY9RoQuzHO9tRa/PsK9brOk4MmJuxR02UOnh3Ul3Xv2hfhdIHxEkIeD6Uh8wh/eZHYwu4AcpsEa
        HHKEbLYaJKzFeIwA+LJUVSiINGKP+WKY=
X-Received: by 2002:a17:907:9446:b0:9bd:a65e:b594 with SMTP id dl6-20020a170907944600b009bda65eb594mr1544479ejc.3.1698838119678;
        Wed, 01 Nov 2023 04:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn+VWRlsVewrsjszgGw8eb4VUo/6TWgFFGPWa5pRc+9+i7SyHVuqUz2ytjU/fBguAELY8yPA==
X-Received: by 2002:a17:907:9446:b0:9bd:a65e:b594 with SMTP id dl6-20020a170907944600b009bda65eb594mr1544470ejc.3.1698838119343;
        Wed, 01 Nov 2023 04:28:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906144900b00985ed2f1584sm2286543ejc.187.2023.11.01.04.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 04:28:38 -0700 (PDT)
Message-ID: <9acf20d5-4a3d-8129-036c-c3d79f1d2e3b@redhat.com>
Date:   Wed, 1 Nov 2023 12:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] v4l2-cci: little-endian registers
Content-Language: en-US, nl
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>
References: <20231101111747.252072-1-alexander.stein@ew.tq-group.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231101111747.252072-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/1/23 12:17, Alexander Stein wrote:
> Hi,
> 
> after the discussions at [1] and [2], this series adds proper support for
> little-endian encoded registers.
> Patch 1 adds the infrastructure and patch 2 fixes imx290 driver.
> As v6.6 was released with imx290 broken, both should be added to stable. But
> I'm not sure if adding a Fixes tag to Patch 1 is correct, because it adds a
> new feature patch 2 requires. Any suggestion is welcomed.

I usually just add the Fixes: + Cc: stable@ tags to both patches in cases
like these. Please add the tags to both patches for v2 (with cci_read()
also fixed).

Regards,

Hans




> [1] https://lore.kernel.org/linux-media/20231030173637.GA2977515@gnbcxd0016.gnb.st.com/
> [2] https://lore.kernel.org/linux-media/ZUIuNDTJAN_fz3q6@kekkonen.localdomain/
> 
> Alexander Stein (2):
>   media: v4l2-cci: Add support for little-endian encoded registers
>   media: i2c: imx290: Properly encode registers as little-endian
> 
>  drivers/media/i2c/imx290.c         | 42 +++++++++++++++---------------
>  drivers/media/v4l2-core/v4l2-cci.c | 22 +++++++++++++---
>  include/media/v4l2-cci.h           |  5 ++++
>  3 files changed, 44 insertions(+), 25 deletions(-)
> 

