Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18C257261A
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 21:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbiGLTlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 15:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbiGLTle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 15:41:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9BC31928
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 12:18:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A63A525B;
        Tue, 12 Jul 2022 21:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657653536;
        bh=j8RWaj1qu7ba9MIthv0s3ghzbaeY8Rc1/L/BeRMnbgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hzfRbJiGXTAxWSk4AbrMDzE3LZJuuz9MjhRG0S+If9GReht7dRdgo8zVDx6nPj/hj
         nJXcPeqbm+PsJxn2ziXpjMAqVbdIBODWUdbXnsudqC5+t2vywyRk41YyDb2P+uuOBo
         mFJd5VEU8PRwYlQXuvIM/p05d5mqZ1S+Br+qXfus=
Date:   Tue, 12 Jul 2022 22:18:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v3 38/46] media: rkisp1: isp: Disallow multiple active
 sources
Message-ID: <Ys3JA6bTN2TG6uMn@pendragon.ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
 <20220711124248.2683-39-laurent.pinchart@ideasonboard.com>
 <20220712184005.nwnlflsupgie6owf@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220712184005.nwnlflsupgie6owf@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jul 12, 2022 at 09:40:05PM +0300, Dafna Hirschfeld wrote:
> On 11.07.2022 15:42, Laurent Pinchart wrote:
> > The ISP supports multiple source subdevs, but can only capture from a
> > single one at a time. The source is selected through link setup. The
> > driver finds the active source in its .s_stream() handler using the
> > media_entity_remote_pad() function. This fails to reject invalid
> > configurations with multiple active sources. Fix it by using the
> > media_pad_remote_pad_unique() helper instead, and inline
> > rkisp1_isp_get_source() in rkisp1_isp_s_stream() as the function is
> > small and has a single caller.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Update media_pad_remote_pad_unique() function name in commit message
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 30 ++++++++-----------
> >  1 file changed, 13 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 37623b73b1d9..d7e2802d11f5 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -58,20 +58,6 @@
> >   * Helpers
> >   */
> > 
> > -static struct v4l2_subdev *rkisp1_isp_get_source(struct v4l2_subdev *sd)
> > -{
> > -	struct media_pad *local, *remote;
> > -	struct media_entity *sensor_me;
> > -
> > -	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
> > -	remote = media_pad_remote_pad_first(local);
> > -	if (!remote)
> > -		return NULL;
> > -
> > -	sensor_me = remote->entity;
> > -	return media_entity_to_v4l2_subdev(sensor_me);
> > -}
> > -
> >  static struct v4l2_mbus_framefmt *
> >  rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
> >  		       struct v4l2_subdev_state *sd_state,
> > @@ -743,6 +729,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> >  	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
> >  	struct rkisp1_device *rkisp1 = isp->rkisp1;
> >  	const struct rkisp1_sensor_async *asd;
> > +	struct media_pad *source_pad;
> > +	struct media_pad *sink_pad;
> >  	int ret;
> > 
> >  	if (!enable) {
> > @@ -754,10 +742,18 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
> >  		return 0;
> >  	}
> > 
> > -	rkisp1->source = rkisp1_isp_get_source(sd);
> 
> so 'rkisp1->source' is the source of the isp right? and in addition you later
> add csi->source for the csi source. Maybe move rkisp1->source field to rkisp1_isp
> to make it clear it is the isp source.
> Just a suggestion. If you don't feel like, then:

That's a very good idea. I'll add a patch on top to do this.

> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> 
> > +	sink_pad = &isp->pads[RKISP1_ISP_PAD_SINK_VIDEO];
> > +	source_pad = media_pad_remote_pad_unique(sink_pad);
> > +	if (IS_ERR(source_pad)) {
> > +		dev_dbg(rkisp1->dev, "Failed to get source for ISP: %ld\n",
> > +			PTR_ERR(source_pad));
> > +		return -EPIPE;
> > +	}
> > +
> > +	rkisp1->source = media_entity_to_v4l2_subdev(source_pad->entity);
> >  	if (!rkisp1->source) {
> > -		dev_warn(rkisp1->dev, "No link between isp and source\n");
> > -		return -ENODEV;
> > +		/* This should really not happen, so is not worth a message. */
> > +		return -EPIPE;
> >  	}
> > 
> >  	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,

-- 
Regards,

Laurent Pinchart
