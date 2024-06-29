Return-Path: <linux-media+bounces-14385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A11291CC95
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 13:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944861C21189
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 11:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5536D1D7;
	Sat, 29 Jun 2024 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EwzKO1zA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1E3B28F
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719661949; cv=none; b=HnJiuO2H4Ymk3bZq9btYISOpak/z1ZkcrZvWoT90ImHhxwfCqddWL0fg2t2J9YIfcy5jjfE0J9EaGolmfpJhv/58UwD5JKlednZN0x4Hlzhi9s/Yu1WDS1aRcwUKZK8pTz2a+mIKLRQ2KYnxnCZn1/hVNnb7+G7Tof96sAeVU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719661949; c=relaxed/simple;
	bh=HlaLwayBwDk0muNEa/0ZKFj20s9oWejMM+yqw5SBeXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRjG6M8NfCMtn8cEnPo8XeEVJLhUSCq3Zf02Bvr+D83G68/eirjO7SUs/gQes1PKCn599/QPORkd9lS+smJJwKCOvqmsRJX7wC2ttbByH0P7nTVF5FxVlFJKKEsSRjDZ6NYlHYF3kpzndJyEpjkQyh2hW94DNq8vL+7AacRwOcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EwzKO1zA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8283C4B0;
	Sat, 29 Jun 2024 13:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719661920;
	bh=HlaLwayBwDk0muNEa/0ZKFj20s9oWejMM+yqw5SBeXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwzKO1zA2fAPJbflOml3a1a2WCu7jpYbB0rCSQmlkp7dyyNRVLO/ilaVI/lKI916Y
	 aoxqz+cmufsZUKX+W/d0RltrVc3RN6JgsTZEdF2XGQq7X6olLBFTcq6zCqAHfKi/Q+
	 eDcJfjv6JCcSwWTbMK4bp2/JtEpmcbQJbK487q9k=
Date: Sat, 29 Jun 2024 14:52:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ccs: Fix link frequency control range update
Message-ID: <20240629115204.GA30900@pendragon.ideasonboard.com>
References: <20240628212603.5870-1-laurent.pinchart@ideasonboard.com>
 <Zn_MKWM-5vIKXnyR@valkosipuli.retiisi.eu>
 <20240629105222.GX30900@pendragon.ideasonboard.com>
 <Zn_xM9CnR_iRklz3@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zn_xM9CnR_iRklz3@valkosipuli.retiisi.eu>

On Sat, Jun 29, 2024 at 11:34:11AM +0000, Sakari Ailus wrote:
> On Sat, Jun 29, 2024 at 01:52:22PM +0300, Laurent Pinchart wrote:
> > On Sat, Jun 29, 2024 at 08:56:09AM +0000, Sakari Ailus wrote:
> > > Hi Laurent,
> > > 
> > > Thanks for the patch.
> > > 
> > > On Sat, Jun 29, 2024 at 12:26:03AM +0300, Laurent Pinchart wrote:
> > > > When updating the link frequency control range in response to a format
> > > > change, the minimum value passed to the __v4l2_ctrl_modify_range()
> > > > function is hardcoded to 0, while there's no guarantee that the first
> > > > link frequency in the menu is valid for the selected format. Fix it by
> > > > getting using the index of the first bit set in the valid link
> > > > frequencies mask.
> > > 
> > > Is this a problem? The bitmask does tell which ones are valid, doesn't it?
> > 
> > I noticed that the new range wasn't applied in my sensor driver when the
> > minimum was set to 0 and the mask didn't include that bit. However,
> > that's because I had the default value wrong, which caused
> > __v4l2_ctrl_modify_range() to error out. I thought the same applied to
> > the minimum, but that doesn't seem to be the case. Isn't it still
> > clearer to set the correct minimum, given that it is already computed
> > anyway, to be used as a default value ?
> 
> I guess from user space point of view this could be helpful, yes. I'm fine
> with changing this.

Another option would be for the control framework to adjust the minimum
and maximum based on the mask.

> > > The minimum value will also be zero after control initialisation before
> > > this function gets called. This should be also taken into account.
> > > 
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > I noticed this issue in the CCS driver while working on a different
> > > > sensor driver. I haven't tested this patch.
> > > > ---
> > > >  drivers/media/i2c/ccs/ccs-core.c | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > > index e1ae0f9fad43..5257dc4912ae 100644
> > > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > > @@ -2143,6 +2143,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> > > >  		*old_csi_format = sensor->csi_format;
> > > >  	unsigned long *valid_link_freqs;
> > > >  	u32 code = fmt->format.code;
> > > > +	unsigned int min, max;
> > > >  	unsigned int i;
> > > >  	int rval;
> > > >  
> > > > @@ -2179,10 +2180,13 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> > > >  		&sensor->valid_link_freqs[sensor->csi_format->compressed
> > > >  					  - sensor->compressed_min_bpp];
> > > >  
> > > > -	__v4l2_ctrl_modify_range(
> > > > -		sensor->link_freq, 0,
> > > > -		__fls(*valid_link_freqs), ~*valid_link_freqs,
> > > > -		__ffs(*valid_link_freqs));
> > > > +	min = __ffs(*valid_link_freqs);
> > > > +	man = __fls(*valid_link_freqs);
> > > > +
> > > > +	ret = __v4l2_ctrl_modify_range(sensor->link_freq, min, max,
> > > > +				       ~*valid_link_freqs, min);
> > > 
> > > As this doesn't effect any actual change the applying of which could fail,
> > > you'd have to have an issue with the argument values themselves. I wouldn't
> > > add a check here. Although if you do, the sensor configuration should be
> > > returned to the state before the call which would probably be worth a new
> > > patch.
> > 
> > The lack of a similar check caused my driver to silently keep the
> > current range, and it took me a while to debug that. I however agree
> > that, if the arguments are right, the check isn't needed. Maybe it can
> > be dropped, as the arguments are correct.
> 
> Alternatively there should be a dev_warn(), too, that this is a driver bug.

Do you think we should add the warning to the __v4l2_ctrl_modify_range()
function, or are there use cases where it could fail during normal
operation ?

> > > > +	if (ret)
> > > > +		return ret;
> > > >  
> > > >  	return ccs_pll_update(sensor);
> > > >  }
> > > > 
> > > > base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326

-- 
Regards,

Laurent Pinchart

