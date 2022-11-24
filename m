Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33DA637C8B
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 16:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiKXPLV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 10:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiKXPLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 10:11:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AB51609DA;
        Thu, 24 Nov 2022 07:11:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32210621B0;
        Thu, 24 Nov 2022 15:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ED8C433C1;
        Thu, 24 Nov 2022 15:11:11 +0000 (UTC)
Message-ID: <de9a3c5d-b8e3-07fa-0ba5-6e77261b7fea@xs4all.nl>
Date:   Thu, 24 Nov 2022 16:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RESEND 3/6 v2] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Content-Language: en-US
To:     Chris Morgan <macroalpha82@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
 <20220519162935.1585-4-macroalpha82@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220519162935.1585-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2022 18:29, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
> MZP280 panel for the Raspberry Pi.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  include/uapi/linux/media-bus-format.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 0dfc11ee2..a7b765498 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -34,13 +34,14 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x101e */
> +/* RGB - next is	0x101f */

This would be 0x1023

>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
>  #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
>  #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
>  #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
> +#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x101e

and this 0x1022, based on the latest media tree.

>  #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
>  #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
>  #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007

Otherwise:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

It's an old series by now, but as far as I am concerned this can go through
the drm subsystem (after updating this value).

Regards,

	Hans
