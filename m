Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05356F4702
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 17:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbjEBPX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 11:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbjEBPXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 11:23:22 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934862D4A
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 08:23:10 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-94eff00bcdaso777056666b.1
        for <linux-media@vger.kernel.org>; Tue, 02 May 2023 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1683040989; x=1685632989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=in7oGMkwvpJ65egb+qHKpZvVlPweS5+XE7vqBfzdZX8=;
        b=YXk6NsLPkgu/J1Mtl7MLaef+UGlAU58UCoQTcbIUWK76InqzmXsire+35OzRDXsUmj
         oaR81JyssM6plerPQSppz0WfN4Lff5F47PobqL1aoRA8pLpl2sWzhLL/uXILSg3Av1Ew
         Gn0j96axj6YMf1S+iWFIvzgtft0K3F8Cen4Fo+2xEWIAk+VeAOm0khgnWBOrPBNWjCUx
         Am8RH6WwkmX0NsyycJQOD+qLLNnvErNV09qPds1ZPu4t1cgO//VNN0ZO9TEPZU0XN4W9
         TpDNpPE9eVTxN2YzvxkalkNITZbJkE7kbAjkXiT565vP8M6PnDCFz2/GyGEjJCKu+497
         OgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683040989; x=1685632989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=in7oGMkwvpJ65egb+qHKpZvVlPweS5+XE7vqBfzdZX8=;
        b=Lvac+8nHD/NnXToMUkXjSj+i5AwUf5HxMF7Hj7MeCgQalgz5FxU+qIEy1HzhxRZkB0
         nK96WyBdZS7SothP0xm18QdwGtqCNas0v5PXMQu4gpWT7NvZ0WpWBeBRvOSAgRCoStB/
         2hB78Bc5V3TePxB7KfteA7UBiipRIv+N57BDM0L5A4Thp3mPOAD8pWF5IbLp51av4pdu
         84LchsrPRhVOfjQOlyTBmnA0FJiD0ULHLPUKvQsrKE7Mm7u/w3MkchaxX8xQ2PnGYv2A
         YEao0Bhg7R0WV0GUaElzcZ4QNoL/FrWAQ8IjJgeCPXeyy2tlIpgOUDxnVxUiY6mfCph3
         cIdA==
X-Gm-Message-State: AC+VfDzotlilpQ5+WT+OHdGL8vZn9oB2raDfCcq/ZhEVsFa5Uy+l1TNI
        C93H4vUCbMaFJf7GN2TOLSSMxRfKTSRCDjC7dTA=
X-Google-Smtp-Source: ACHHUZ5phEnDKgU9MaBNZu3+NG+h7behvceldI5Eit5BbuNwZjmSR7U3wydjruMccuJTY59r4ZfQYw==
X-Received: by 2002:a17:907:9415:b0:960:ddba:e5c5 with SMTP id dk21-20020a170907941500b00960ddbae5c5mr274205ejc.11.1683040988999;
        Tue, 02 May 2023 08:23:08 -0700 (PDT)
Received: from [192.168.2.95] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id m5-20020a170906848500b0094ef96a6564sm16047618ejx.75.2023.05.02.08.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 08:23:08 -0700 (PDT)
Message-ID: <4ed62c9b-f2e7-8640-6b32-f2399451c205@qtec.com>
Date:   Tue, 2 May 2023 17:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] media: docs: vidioc-g-ext-ctrls.rst: Update p_s32 and
 p_s64 types
Content-Language: en-US
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
References: <20230501145707.4088026-1-dlp@qtec.com>
 <20230501145707.4088026-3-dlp@qtec.com>
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
In-Reply-To: <20230501145707.4088026-3-dlp@qtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Forgot Signed-off-by.

Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>

On 01/05/2023 16:57, Daniel Lundberg Pedersen wrote:
> The pointer types of p_s32 and p_s64 in v4l2_ext_control has been
> updated, match the change in documentation.
> ---
>  Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index 5292d5e1a91f..6d85ec6a19b4 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -185,12 +185,12 @@ still cause this situation.
>        - ``p_u32``
>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
> -    * - __u32 *
> +    * - __s32 *
>        - ``p_s32``
>        - A pointer to a matrix control of signed 32-bit values. Valid if
>          this control is of type ``V4L2_CTRL_TYPE_INTEGER`` and
>          ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
> -    * - __u32 *
> +    * - __s64 *
>        - ``p_s64``
>        - A pointer to a matrix control of signed 64-bit values. Valid if
>          this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
