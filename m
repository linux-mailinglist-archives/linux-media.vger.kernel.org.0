Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF20E55C954
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344171AbiF1K2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 06:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344307AbiF1K2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 06:28:07 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D47B2D
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 03:28:05 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C4D434000E;
        Tue, 28 Jun 2022 10:28:02 +0000 (UTC)
Date:   Tue, 28 Jun 2022 12:28:00 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH 3/7] media: vivid: Add support for the new YUVA and YUVX
 formats
Message-ID: <20220628102800.gtolbemib2rt44nd@uno.localdomain>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616183656.19089-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Jun 16, 2022 at 09:36:52PM +0300, Laurent Pinchart wrote:
> Extend vivid to support the newly added YUVA and YUVX pixel formats
> through the TPG.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

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
> --
> Regards,
>
> Laurent Pinchart
>
