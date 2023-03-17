Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 693CA6BF040
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 18:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjCQR5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 13:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbjCQR5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 13:57:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085BFE6FF4
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:57:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (i5C75E58C.versanet.de [92.117.229.140])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF4865AA;
        Fri, 17 Mar 2023 18:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679075858;
        bh=CXNr28O244vim9aBUVDvdkf2x98/jbZ14PkPE9TvMao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=puG7ej66QFFYaAGTFhLzVAhz91BclrWQBBwm9xYc1lFP2E8iTr1jhqcpgLu1DmFKO
         D+xdeIUTcMTxqQuvpqcbNmboBbkC2MPYutY/X3v6xHGvQqjPVJXRPMLDSxUFhbbs0s
         hYRC/0LXtPgqIdyYCTF6mrZ60+IB155kZrPv0HHE=
Date:   Fri, 17 Mar 2023 19:57:44 +0200
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
Subject: Re: [PATCH 3/3] media: imx: imx7-media-csi: Fail for non
 video-capture formats
Message-ID: <20230317175744.GA28322@pendragon.ideasonboard.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
 <20230316143829.499039-4-alexander.stein@ew.tq-group.com>
 <m3o7or47hq.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <m3o7or47hq.fsf@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 17, 2023 at 05:23:29PM +0000, Rui Miguel Silva wrote:
> Hi Alexander,
> thanks for the patch.
> 
> Alexander Stein <alexander.stein@ew.tq-group.com> writes:
> 
> > This driver only support V4L2_BUF_TYPE_VIDEO_CAPTURE, so fail for other
> > passed types.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  drivers/media/platform/nxp/imx7-media-csi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> > index 389d7d88b341..e470b0505d3b 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -1186,6 +1186,11 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
> >  static int imx7_csi_video_try_fmt_vid_cap(struct file *file, void *fh,
> >  					  struct v4l2_format *f)
> >  {
> > +	struct imx7_csi *csi = video_drvdata(file);
> 
> Maybe copy/paste problem csi is never used.
> 
> > +
> > +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +		return -EINVAL;
> 
> Is this function ever called if f->type is not TYPE_VIDEO_CAPTURE?

It shouldn't, v4l_g_fmt() and v4l_s_fmt() check the type and call the
appropriate operation accordingly. I don't think this patch is needed.

> > +
> >  	__imx7_csi_video_try_fmt(&f->fmt.pix, NULL);
> >  	return 0;
> >  }
> > @@ -1196,6 +1201,9 @@ static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
> >  	struct imx7_csi *csi = video_drvdata(file);
> >  	const struct imx7_csi_pixfmt *cc;
> >  
> > +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> > +		return -EINVAL;
> 
> Ditto?
> 
> Cheers,
>    Rui
> > +
> >  	if (vb2_is_busy(&csi->q)) {
> >  		dev_err(csi->dev, "%s queue busy\n", __func__);
> >  		return -EBUSY;

-- 
Regards,

Laurent Pinchart
