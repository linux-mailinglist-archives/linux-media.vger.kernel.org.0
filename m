Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC67655C516
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242375AbiF0Xx1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 19:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242350AbiF0Xx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 19:53:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB440DE85
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 16:53:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E73B880A;
        Tue, 28 Jun 2022 01:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656374004;
        bh=/RdXMLSL0+Ps4T6yDx6aEcH5cB0IVGq7YmjkaDFAW3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GzfcFjx7swtFHTsunA2sbnJ1caixBc0QvxaBpdk6/l8X83qD8zDS2x/00bIIxf3Ab
         BWPYAmnOKZlXicbq7sKLKf+rC8HL168TdCUkAcBIS11G5b0v9FZEcH31T1FUXylBiY
         O2fFViK7Njzq1lirSwsSwkElBmXYzArQ9iUZkMio=
Date:   Tue, 28 Jun 2022 02:53:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: Re: [PATCH 3/7] media: vivid: Add support for the new YUVA and YUVX
 formats
Message-ID: <YrpC4XnfV4ZKwLW5@pendragon.ideasonboard.com>
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220616183656.19089-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 16, 2022 at 09:36:52PM +0300, Laurent Pinchart wrote:
> Extend vivid to support the newly added YUVA and YUVX pixel formats
> through the TPG.

While the ISI driver itself can't be merged yet due to the dependency on
the streams series, I was wondering if we could merge patches 1/7 to 3/7
already. They add two new pixel formats needed by the driver, and having
them upstream would help merging their support in libcamera. I'll keep
working on the ISI driver (and the streams series) to get those in too.

If you agree with that, could you review patches 2/7 and 3/7 (as well as
1/7 if you desire) ? They are small.

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

-- 
Regards,

Laurent Pinchart
