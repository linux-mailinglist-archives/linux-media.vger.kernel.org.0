Return-Path: <linux-media+bounces-9948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 586348AF3BC
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 18:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1761F23848
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 16:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295DF13CABE;
	Tue, 23 Apr 2024 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZIlu5WI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE25FB9C
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713889050; cv=none; b=b24VrcXBmXWyxrGfzTVEOli95Wei3yUBqICU8Q8vmTZbX+BX+Otndi2r7u9njbf6ksSqF9JkLOfQAGYRRv9zWpqIx5PdzQfYhEPGhBtHGYWpOQRmjh3Z9nKIWqaiN5xgR1CQCfVNg+1dXLyWUWDRJIJyfGjXl5cOt4jjyhonyAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713889050; c=relaxed/simple;
	bh=76+aLK/M1owTyFcFKUYE/l5x6EgVN1cAKQfdMMxZFvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr6oNXHC3zlmAX4nNlnEibGnf9bvXjTLjD0iuH1Pu7PiAn0tcMrYjwllQRPgR6TZ1ZitDQeisgt9VgwCROYoM+MfiZWyAISWv/meQ5LeXcvRbwfjlcthvu2p1wGKv4OqEt2owgtk56GubRattgGA0FB0W8BiPgOKP9b+u+MtuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZIlu5WI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713889050; x=1745425050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=76+aLK/M1owTyFcFKUYE/l5x6EgVN1cAKQfdMMxZFvU=;
  b=BZIlu5WIWcxy9eA6fKEWrhcG+PgXpoa1svntQU5Sgvj4JrPovYriUEMn
   Bx93UBbWURvUScJS1SvZcwW2IYuTcvOUOJxAsG0onLbszy2hKqhKmYyPo
   iO+6YXV8dOMC790BCSSihfcEcxRTG4daBBPnNyu/okpQrTiOiItXmIhyC
   lYJzIeoefOUaXssteZW4uO1j9nfZWcD8Vsr18TB4gXSNSWFVyFx6SF03H
   kCMmqKgyu1J7jcYukTFLopxmeNSDeJpE3UNoFYNsEPJIQugWM5K0xH8B0
   ykqY2NcrI2b95cFkdvvrd8QYvDO070a+txyphbB7UInnKDVf3AU/IJXZo
   Q==;
X-CSE-ConnectionGUID: /tsm+dXQTheVdSqW8gSbug==
X-CSE-MsgGUID: XirRNEQzR1S7nEYU4JxAxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="26942879"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="26942879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:17:29 -0700
X-CSE-ConnectionGUID: ueK4sAwmR4yo2xIeTeS8AA==
X-CSE-MsgGUID: gTpU2SSLTCSPTU8RK0lG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24935533"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:17:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 821521203E8;
	Tue, 23 Apr 2024 19:17:23 +0300 (EEST)
Date: Tue, 23 Apr 2024 16:17:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 42/46] media: ov2740: Add generic sensor fwnode
 properties as controls
Message-ID: <ZiffE7gofI5Bncsd@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-43-sakari.ailus@linux.intel.com>
 <20240420094016.GZ6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240420094016.GZ6414@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Apr 20, 2024 at 12:40:16PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 16, 2024 at 10:33:15PM +0300, Sakari Ailus wrote:
> > Add generic sensor property information as controĺs by using
> > v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov2740.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > index dc0931308053..e37d824291fe 100644
> > --- a/drivers/media/i2c/ov2740.c
> > +++ b/drivers/media/i2c/ov2740.c
> > @@ -779,6 +779,8 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
> >  
> >  static int ov2740_init_controls(struct ov2740 *ov2740)
> >  {
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> > +	struct v4l2_fwnode_device_properties props;
> >  	struct v4l2_ctrl_handler *ctrl_hdlr;
> >  	s64 exposure_max, h_blank, pixel_rate;
> >  	u32 vblank_min, vblank_max, vblank_default;
> > @@ -789,6 +791,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (!v4l2_fwnode_device_parse(&client->dev, &props))
> 
> If you moved the parsing earlier, you could set the right number of
> controls when initializing the handler. This being said, maybe we should
> instead try to get rid of the controls count hint to the handler
> initialization function.

I'm not quite sure how that's related.

But I'll update the number.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> > +		v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops,
> > +						&props);
> > +
> >  	ov2740->link_freq =
> >  		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> >  				       V4L2_CID_LINK_FREQ,
> 

-- 
Regards,

Sakari Ailus

