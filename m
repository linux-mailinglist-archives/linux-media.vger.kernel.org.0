Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3A6637C8D
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 16:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiKXPLX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 10:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiKXPLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 10:11:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8752615B4E5;
        Thu, 24 Nov 2022 07:11:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E2D7B827FF;
        Thu, 24 Nov 2022 15:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789E8C433D7;
        Thu, 24 Nov 2022 15:11:14 +0000 (UTC)
Message-ID: <11e1c489-85d8-82e2-8334-c47265a587f2@xs4all.nl>
Date:   Thu, 24 Nov 2022 16:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RESEND 2/6 v2] media: uapi: Document format
 MEDIA_BUS_FMT_RGB565_1X24_CPADHI
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
 <20220519162935.1585-3-macroalpha82@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220519162935.1585-3-macroalpha82@gmail.com>
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
> Add support for MEDIA_BUS_FMT_RGB565_1X24_CPADHI. This format is used
> by the Geekworm MZP280 panel which interfaces with the Raspberry Pi.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 0cbc045d5..e43e07634 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -624,6 +624,43 @@ The following tables list existing packed RGB formats.
>        - b\ :sub:`2`
>        - b\ :sub:`1`
>        - b\ :sub:`0`
> +    * .. _MEDIA_BUS_FMT_RGB565_1X24_CPADHI:
> +
> +      - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
> +      - 0x101e

Given the latest media tree this is now 0x1022.

Otherwise:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

It's an old series by now, but as far as I am concerned this can go through
the drm subsystem (after updating this value).

Regards,

	Hans

> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      - 0
> +      - 0
> +      - 0
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
> +      - 0
> +      - 0
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
>      * .. _MEDIA-BUS-FMT-BGR565-2X8-BE:
>  
>        - MEDIA_BUS_FMT_BGR565_2X8_BE

