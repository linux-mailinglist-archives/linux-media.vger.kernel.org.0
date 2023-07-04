Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A3E746D3A
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 11:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbjGDJYT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 05:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbjGDJYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 05:24:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9346BE72
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 02:23:25 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B9E8D4A;
        Tue,  4 Jul 2023 11:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688462560;
        bh=tiwO/2MVojQS4bkU8AYIPrW58SUSk4dYzGl5gB2BY88=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aQU6h13BOQUCt71kwdT8B2A0m4Kky4NHeqXFdXyGoxv6srWjYDySv6uAGYCfAkQ8E
         MkrStMro3zmU2x6a3R9m1AboFV6r9TUOz43mNl5zuUiMTfNW+/JsQVsl3i2Yj3JPam
         fGIyeuZrrzilt0lrgwftkhTJ1Z93ef7+Jo029TCI=
Message-ID: <d80e67e1-2fa1-b4b5-ad42-d41201743ea0@ideasonboard.com>
Date:   Tue, 4 Jul 2023 10:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 29/29] MAINTAINERS: Add Hans de Goede as OV2680 sensor
 driver maintainer
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-30-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230627131830.54601-30-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 27/06/2023 15:18, Hans de Goede wrote:
> Add myself as OV2680 sensor driver maintainer.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


This is a really nice series. I had some comments on 15, 18, 21 and 28 but for all of the others:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c6a7b43321d9..2ec35c3569dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15518,6 +15518,7 @@ F:	drivers/media/i2c/ov13b10.c
>   
>   OMNIVISION OV2680 SENSOR DRIVER
>   M:	Rui Miguel Silva <rmfrfs@gmail.com>
> +M:	Hans de Goede <hansg@kernel.org>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   T:	git git://linuxtv.org/media_tree.git
