Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14DD66BF0B1
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 19:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjCQS27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 14:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjCQS25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 14:28:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727701CADA
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 11:28:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (i5C75E58C.versanet.de [92.117.229.140])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DE275AA;
        Fri, 17 Mar 2023 19:28:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679077733;
        bh=2mTQyPYbYhd9tHh9yIpZMUOlllKkWQTXKMhZaaiuzC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W0Eq8y5jLQHK/CW3yEDttk319cl2PXZn6DbhKqIv2lhmpI4NUfpAhF840BeC6OVWP
         gQuCY6VMiEHbf502ZtCljqSUGGLvndAq6012Ntjtl/c73TTn8jfqzcp1JTY0iu411B
         0DpEnvasKExKkhOt88KBqOrv1l++MtemNBQfkiRE=
Date:   Fri, 17 Mar 2023 20:28:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] media: imx: imx7-media-csi: Fix mbus framefmt field
 init
Message-ID: <20230317182858.GB28322@pendragon.ideasonboard.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
 <20230316143829.499039-2-alexander.stein@ew.tq-group.com>
 <m3r0tn47m0.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m3r0tn47m0.fsf@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Fri, Mar 17, 2023 at 05:20:55PM +0000, Rui Miguel Silva wrote:
> Hi Alexander,
> Thanks for the patch.
> 
> Alexander Stein <alexander.stein@ew.tq-group.com> writes:
> 
> > Default to non-interleaving.
> 
> Why?

Otherwise it is implicitly set to V4L2_FIELD_ANY as the structure is
zero-initialized, and that's not a valid value for drivers to return to
userspace. This should be explained in the commit message.

> > Fixes: bc0d3df31ffe ("media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()")
> 
> It was never init to FIELD_NONE even before this patch, do you think it
> is really a fix?

Commit bc0d3df31ffe does indeed not seem relevant.

The problem predates the destaging of the driver, it's a bit difficult
to trace. I'd drop the Fixes: tag.

> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/media/platform/nxp/imx7-media-csi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> > index c22bf5c827e7..3e97b9f2ff69 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1610,6 +1610,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
> >  	format.code = IMX7_CSI_DEF_MBUS_CODE;
> >  	format.width = IMX7_CSI_DEF_PIX_WIDTH;
> >  	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
> > +	format.field = V4L2_FIELD_NONE;
> >  
> >  	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
> >  	csi->vdev_compose.width = format.width;

-- 
Regards,

Laurent Pinchart
