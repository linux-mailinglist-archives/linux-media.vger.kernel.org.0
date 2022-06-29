Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 723825601AC
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 15:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233392AbiF2Nrv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 09:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiF2Nru (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 09:47:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA11167FB
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 06:47:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1644A61E76
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 13:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E21BC34114;
        Wed, 29 Jun 2022 13:47:47 +0000 (UTC)
Message-ID: <1ddfb25e-fdb1-70df-12e3-bdf4be2fb077@xs4all.nl>
Date:   Wed, 29 Jun 2022 15:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] media: vivid: Add support for the new YUVA and YUVX
 formats
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-4-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220616183656.19089-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2022 20:36, Laurent Pinchart wrote:
> Extend vivid to support the newly added YUVA and YUVX pixel formats
> through the TPG.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../media/test-drivers/vivid/vivid-vid-common.c   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> index 19701fe72030..38d788b5cf19 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> @@ -198,6 +198,21 @@ struct vivid_fmt vivid_formats[] = {
>  		.planes   = 1,
>  		.buffers = 1,
>  	},
> +	{
> +		.fourcc   = V4L2_PIX_FMT_YUVA32,
> +		.vdownsampling = { 1 },
> +		.bit_depth = { 32 },
> +		.planes   = 1,
> +		.buffers = 1,
> +		.alpha_mask = 0xff000000,
> +	},
> +	{
> +		.fourcc   = V4L2_PIX_FMT_YUVX32,
> +		.vdownsampling = { 1 },
> +		.bit_depth = { 32 },
> +		.planes   = 1,
> +		.buffers = 1,
> +	},
>  	{
>  		.fourcc   = V4L2_PIX_FMT_GREY,
>  		.vdownsampling = { 1 },

