Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD6C59BE96
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 13:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbiHVLcg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 07:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234786AbiHVLcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 07:32:17 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A742233E3F
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 04:32:02 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id gk3so20526493ejb.8
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=wUgV2Ei3VPndZYBESRVNpGjCEEyp7x/UjspUYhCN3sE=;
        b=qnwctCDOCDU1VI49iqzJtJ+SLK9B9xQx+kzlLNEFn9cagNcYFl6StQP+Jb0ZoLtT3P
         VXNRhXgknKyXjpj6O8hC2IcvTNO0OlZx66bbIfxVXPu4jcHbh7sOn6S4akU0UNUhqZHF
         CtLdu2ANBvHLJ1H9GU5HaHF33yZ3ehN7luN9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=wUgV2Ei3VPndZYBESRVNpGjCEEyp7x/UjspUYhCN3sE=;
        b=jo8mS/MgxZkc232O2QSyj5SGKuWOXdSs/Epn8WIP37XwcdBG3V6rDfREnGwvZFPqic
         eA4FPItYkKAgVQ8wIAT5K356lmCak8xowfhnwv3EeVoIxsT9yr1kLXp4XTQCKdUVOWh4
         CwmCqy3pjfaH/P/2A2GiOSFDXMuygbzDCI6WE2hgl23bk6C8RM4j98kFnXYJNYXhxdUl
         y/zqDpWP35yskz6qS0P8Hl4r6raoRgrtbUMi0iwXxd58MY8EuWBJGQErEc+1AmglBMbw
         PAkYdknYqdLoaABd0PPMqrrZEkZsK9WeFkdYTaj9ceVkRy/pPdB1etrccOqjWhwauMfM
         Txpw==
X-Gm-Message-State: ACgBeo03cpB3CAot6QsOCf27dhYyZUPrOr8qLMgwVjZHxpsKeP9lHgX1
        qXlVkZEInV8j9Hl7NUQmhz3cjvwcuVMsIw==
X-Google-Smtp-Source: AA6agR69WM4K6lqMkcqknT4Tx/2qiqiNlo0jYTIQRb+AKUPWzI4bIPnhtiS/f/6E+mu6QnUjwDvrPg==
X-Received: by 2002:a17:907:c0d:b0:730:a85d:8300 with SMTP id ga13-20020a1709070c0d00b00730a85d8300mr12340263ejc.558.1661167915323;
        Mon, 22 Aug 2022 04:31:55 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-57-252.cust.vodafonedsl.it. [188.217.57.252])
        by smtp.gmail.com with ESMTPSA id v12-20020a056402348c00b0044687e93f74sm3973145edc.43.2022.08.22.04.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 04:31:55 -0700 (PDT)
Date:   Mon, 22 Aug 2022 13:31:52 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/4] media: amphion: encoder add support for
 contiguous planes
Message-ID: <20220822113152.GC17530@tom-ThinkPad-T14s-Gen-2i>
References: <cover.1660027440.git.ming.qian@nxp.com>
 <c375506c02e6664580a2eb1cac559ab8dfd02552.1660027440.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c375506c02e6664580a2eb1cac559ab8dfd02552.1660027440.git.ming.qian@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

On Tue, Aug 09, 2022 at 02:50:41PM +0800, Ming Qian wrote:
> encoder add support for contiguous formats NV12
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
>  drivers/media/platform/amphion/venc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
> index 060a1ee78b17..3cbe8ce637e5 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -72,6 +72,14 @@ static const struct vpu_format venc_formats[] = {
>  		.mem_planes = 2,
>  		.comp_planes = 2,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.sibling = V4L2_PIX_FMT_NV12,
> +	},
> +	{
> +		.pixfmt = V4L2_PIX_FMT_NV12,
> +		.mem_planes = 1,
> +		.comp_planes = 2,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +		.sibling = V4L2_PIX_FMT_NV12M,
>  	},
>  	{
>  		.pixfmt = V4L2_PIX_FMT_H264,
> -- 
> 2.37.1
> 

Looks good.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
