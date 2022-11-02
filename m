Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93D9615BED
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 06:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiKBFoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 01:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbiKBFoO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 01:44:14 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26469640A
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 22:44:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id gw22so2306537pjb.3
        for <linux-media@vger.kernel.org>; Tue, 01 Nov 2022 22:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4U1mrlHzTq75vegvBILo4T8J1rIaL3aN8Kq2GbjL4w=;
        b=l9LriNh2mrsNWJrIOd8Y3G4l+omd+v38KM/hISuJkF+CuKcoQzDsLLKAINgB/uKoop
         08yz/FaXDsZoZao6NuN4r3LtpT7hD8Fa+u92AXzEiX7w5TAlTtmSBsnJuxvLbtvOFkDI
         okul7GkNXHlQdMcmhXrw3N+QqjxFKldoamH0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4U1mrlHzTq75vegvBILo4T8J1rIaL3aN8Kq2GbjL4w=;
        b=4EqKIdKyRh6gezFp47t9sDa+dj9fZcYiDikTKrQnXfN/duo+m1Cxc7ggOXwH5tQEjw
         ifsS030jpezRV3km1/TnLtrraKZbU7ffOwKGdDdrQU5E7RX1LGBjbDhzcxknmwDHkytV
         8TCodKIwGqblXfUGRE82XQxBvBSiQc99FDvQznJXeVEseG1su/rSWpjkwc/wB1g7Ik1Q
         V66fwwueZB0cZwnVFO40nZH72ZbAUn3TOQFYnXgMC84id2Es4n9cI0W8H46Y37OojZJ6
         DQI6w/KrjYIJSVSoGXVSDVcsHfQCWa5zESqPEplZSy0N2T5eeJUMFbmIwCZPpnwqRQlv
         sKGQ==
X-Gm-Message-State: ACrzQf1HZcQZz5Q4Xl5a2nnq3bsYE1yevy/qPq+np/jggfZlrnTAjxzs
        rFXxbxlP7fxY9koMrRyc8rYv0w==
X-Google-Smtp-Source: AMsMyM53oEWEEn6B9yOuqu89aa3UyARvu3Ho/QeOzZNeo0R2Lvq5tBZ92OVp8HYIBhjcrPBCbS1AjA==
X-Received: by 2002:a17:902:f60d:b0:186:c6d7:6574 with SMTP id n13-20020a170902f60d00b00186c6d76574mr22680679plg.171.1667367851569;
        Tue, 01 Nov 2022 22:44:11 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:f558:dfb0:7cb7:44d9])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902da8a00b00174c0dd29f0sm7388027plx.144.2022.11.01.22.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 22:44:11 -0700 (PDT)
Date:   Wed, 2 Nov 2022 14:44:06 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] media: uvcvideo: Limit power line control for
 Acer EasyCamera
Message-ID: <Y2IDpiOtVd4E4GHV@google.com>
References: <20221101-easycam-v1-0-71d6409963da@chromium.org>
 <20221101-easycam-v1-1-71d6409963da@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101-easycam-v1-1-71d6409963da@chromium.org>
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/11/01 06:28), Ricardo Ribalda wrote:
> The device does not implement the power line control correctly. Add a
> corresponding control mapping override.
> 
> Bus 003 Device 002: ID 5986:1180 Acer, Inc EasyCamera
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x5986 Acer, Inc
>   idProduct          0x1180
>   bcdDevice           56.04
>   iManufacturer           3 Bison
>   iProduct                1 EasyCamera
>   iSerial                 2
>   bNumConfigurations      1
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
