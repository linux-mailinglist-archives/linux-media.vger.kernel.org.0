Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECC71FF479
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 16:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgFROQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 10:16:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbgFROQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 10:16:16 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2857F9;
        Thu, 18 Jun 2020 16:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592489774;
        bh=h/i1eCaLZKsJ9nguigpLCAItFK5bwPylEmJ8NEV9uq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n9PqULJR+Hp4V5ejiEGhcLuz7lvxTJ+Mo9VyBYUJH/3tjXcLoa1C44v6XINFqRqhc
         AKwnehoLpeC6Zoqgl1rGWa2F5BBd88yzkmZYjU+n190nHmQz0jrXEIvDqIwJxKs5Dt
         jreua+sk5yEiGjVnBEfzy23VUPREMBH+vJK6SK5o=
Date:   Thu, 18 Jun 2020 17:15:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 027/107] media: ti-vpe: cal: Name all cal_camerarx
 pointers consistently
Message-ID: <20200618141550.GG5959@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-28-laurent.pinchart@ideasonboard.com>
 <20200618140607.szxzcr6m6dztlelr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618140607.szxzcr6m6dztlelr@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Thu, Jun 18, 2020 at 09:06:09AM -0500, Benoit Parrot wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote on Mon [2020-Jun-15 02:58:24 +0300]:
> > Name all variables htat point to a cal_camerax instance 'phy' instead of
> > 'cc'. The name 'cc' refers to Camera Core, but is not commonly used in
> > the driver or in datasheets.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti-vpe/cal.c | 102 ++++++++++++++--------------
> >  1 file changed, 51 insertions(+), 51 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index 615e9d97e61f..8864a00a22b0 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -312,7 +312,8 @@ static const struct cal_data am654_cal_data = {
> >   * the CAMERARX instances. Instances of struct cal_dev are named cal through the
> >   * driver.
> >   *
> > - * The cal_camerarx structure represents one CAMERARX instance.
> > + * The cal_camerarx structure represents one CAMERARX instance. Instances of
> > + * cal_camerarx are named phy through the driver.
> >   *
> >   * The cal_ctx structure represents the combination of one CSI-2 context, one
> >   * processing context and one DMA context. Instance of struct cal_ctx are named
> > @@ -344,7 +345,7 @@ struct cal_dev {
> >  	u32			syscon_camerrx_offset;
> >  
> >  	/* Camera Core Module handle */
> > -	struct cal_camerarx	*cc[CAL_NUM_CSI2_PORTS];
> > +	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
> >  
> >  	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
> >  };
> > @@ -361,7 +362,7 @@ struct cal_ctx {
> >  	struct v4l2_fwnode_endpoint	endpoint;
> >  
> >  	struct cal_dev		*cal;
> > -	struct cal_camerarx	*cc;
> > +	struct cal_camerarx	*phy;
> >  
> >  	/* v4l2_ioctl mutex */
> >  	struct mutex		mutex;
> > @@ -468,7 +469,7 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
> >  }
> >  
> >  static int cal_camerarx_regmap_init(struct cal_dev *cal,
> > -				    struct cal_camerarx *cc,
> > +				    struct cal_camerarx *phy,
> >  				    unsigned int idx)
> >  {
> >  	const struct cal_camerarx_data *phy_data;
> > @@ -490,12 +491,12 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
> >  		 * Here we update the reg offset with the
> >  		 * value found in DT
> >  		 */
> > -		cc->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
> > -							    cal->syscon_camerrx,
> > -							    field);
> > -		if (IS_ERR(cc->phy.fields[i])) {
> > +		phy->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
> > +							     cal->syscon_camerrx,
> > +							     field);
> 
> So we end up with these construct phy->phy.
> Is that really more readable?

I agree with you that it's not very nice. That's why it gets fixed
later, with the 'fields' field being moved from struct cal_camerarx_data
to struct cal_camerarx :-) I could try to rearrange the patches to avoid
this, but as it's an intermediary step only, it would be quite a bit of
rebase and conflict resolution to achieve the exact same result. Would
it be OK with you to keep this intermediate step as-is (assuming you
like the end result of course) ?

-- 
Regards,

Laurent Pinchart
