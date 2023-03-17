Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13AAD6BF0BE
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 19:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjCQScP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 14:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjCQScL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 14:32:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0D84D62E
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 11:32:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (i5C75E58C.versanet.de [92.117.229.140])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 144835AA;
        Fri, 17 Mar 2023 19:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679077928;
        bh=6/oM1KKGG8WY8ldnmAeeGvVgG8ROUWko+8FB/jF0Tv4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Im94IrxJMB9c1zOYUtmBOHAQBWKu0r+Y8W5yIRpWwvO7Kz9xseey5J5O3pzXlqBTp
         alguIoGJbk4nP3/V+RQHh2p/H9W2BXekyUzOysvc59y0IZumvlbsEGe1mcl7QCBVZC
         AJS0GbSQ+HOsA9FASwGYnMWhWRu4pVHTjBik+t0I=
Date:   Fri, 17 Mar 2023 20:32:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: imx: imx7-media-csi: Fail on invalid type in
 VIDIOC_G_SELECTION
Message-ID: <20230317183213.GC28322@pendragon.ideasonboard.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
 <20230316143829.499039-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230316143829.499039-3-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Thu, Mar 16, 2023 at 03:38:28PM +0100, Alexander Stein wrote:
> This device only supports video capture, so bail out if invalid
> selection type is passed.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 3e97b9f2ff69..389d7d88b341 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1214,6 +1214,9 @@ static int imx7_csi_video_g_selection(struct file *file, void *fh,
>  {
>  	struct imx7_csi *csi = video_drvdata(file);
>  
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;
> +
>  	switch (s->target) {
>  	case V4L2_SEL_TGT_COMPOSE:
>  	case V4L2_SEL_TGT_COMPOSE_DEFAULT:

-- 
Regards,

Laurent Pinchart
