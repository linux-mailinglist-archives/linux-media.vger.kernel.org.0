Return-Path: <linux-media+bounces-10404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A088B6BC7
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3242E1F22A51
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A74F3EA83;
	Tue, 30 Apr 2024 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+5os0Xh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8504433C0
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462198; cv=none; b=OGoRv0+YBI3vtrpt97P8anV2ZDF18BMb/SJd0zPnBcjMupt+kmt8pTpYvcCfVD+i1+af+wVh71DcCuVU6dLyAt5qUMDhCXYE9hIabVv2eEDSg7sXh5Z3wldsPtXGiLm4tgpjwdLYr3o1VQwq87S3o/fKhqVUCvexXYGxTkjPufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462198; c=relaxed/simple;
	bh=0xKdaB7sXTAZrFDWX1ZwFkmOd9/A8wVIeSNhlrlIqCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+JkAR/mmAwMyegjXABM1bcoKFysECMg2YcG1Xaa00gaslWu+b2SEpO/CN2nnhLo4zMeYJjlJu4UyI4/Uv7rNYU5fgSTU8z6fUp4EQWT/tf6oEGChyUpzVL8h/4iqeW2LAgCm3+z1LzIeuFySZaMPcBXE1qfDvUhEuSWpOibsqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+5os0Xh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714462197; x=1745998197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0xKdaB7sXTAZrFDWX1ZwFkmOd9/A8wVIeSNhlrlIqCs=;
  b=U+5os0XhuO/L9CXZoDuhN0UlqpTZN/24mltcbsLBILm7nApanOb3Ewqo
   aOXF7phneLIsX3bjWOIU6Xnz0V9MbWL8mhlOXXj+NsilFscT8GAV21OUw
   mdNVGLU+iQ5MSCFC9S+U1KCYB0rj/3hcLEJkS+kmx0CNd9N0fMzv7Jav1
   hRqkKijUIXsRU2cWWUEM8wSnv+NUnvGoP29fVvhxI/pFS9AeTbSeX3BDd
   WHGAlZ+z2p7l2BdRQLEF4YbFyjKyxeoq9Ef1wUKF943KpDpZSEXu/qIv6
   EkjCLVihFSHuViMYzEfASPB3ZxcoAy8d9f1r0ZWIQcBifrYm2ofDYtA+y
   w==;
X-CSE-ConnectionGUID: spjFBC0DQhOqrT8CDgHkPQ==
X-CSE-MsgGUID: ks/0hZpDSdi0LD2Bo3X1ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20836520"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="20836520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 00:29:56 -0700
X-CSE-ConnectionGUID: MfsAdNdgQHm2EgFCVw+tbQ==
X-CSE-MsgGUID: gYXmtrioQRuHTBSY0+gLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="30999475"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 00:29:55 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 14BD011F830;
	Tue, 30 Apr 2024 10:29:52 +0300 (EEST)
Date: Tue, 30 Apr 2024 07:29:52 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v4 2/4] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <ZjCd8NulquJqbfNq@kekkonen.localdomain>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
 <20240429190852.1008003-3-sakari.ailus@linux.intel.com>
 <cc5cwbigryoqt6tchpi6g7jhen6mefxnyn5e5dlfomzuh7yha3@du6lkepft6zj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc5cwbigryoqt6tchpi6g7jhen6mefxnyn5e5dlfomzuh7yha3@du6lkepft6zj>

Hi Jacopo,

On Tue, Apr 30, 2024 at 09:19:32AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Apr 29, 2024 at 10:08:50PM +0300, Sakari Ailus wrote:
> > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > frequency to the reciving sub-device.
> 
> 'receiving'
> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 13 +++++++++----
> >  include/media/v4l2-mediabus.h         |  2 ++
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 7f69b5a025fa..09b26ce612e9 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -503,15 +503,20 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> >
> >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> > -			     unsigned int div)
> > +			      unsigned int div)
> 
> Goes in the previous patch that introduces the function ?

Yes.

> 
> >  {
> > +	struct v4l2_mbus_config mbus_config = {};
> >  	struct v4l2_subdev *sd;
> > +	int ret;
> >
> >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > -	if (!sd)
> > -		return -ENODEV;
> > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +			       &mbus_config);
> > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > +		return ret;
> >
> > -	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> > +	return mbus_config.link_freq ?:
> > +		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> >
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index 5bce6e423e94..2f39b52bb4d4 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -159,6 +159,7 @@ enum v4l2_mbus_type {
> >   * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
> >   *		   Used if the bus is MIPI Alliance's Camera Serial
> >   *		   Interface version 2 (MIPI CSI2).
> > + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
> >   */
> >  struct v4l2_mbus_config {
> >  	enum v4l2_mbus_type type;
> > @@ -167,6 +168,7 @@ struct v4l2_mbus_config {
> >  		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> >  		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
> >  	} bus;
> > +	u64 link_freq;
> 
> Does this apply to all the supported busses ?

Just like the LINK_FREQ control, it does, albeit the current user (IVSC
driver) uses CSI-2 only.

I'm fine moving it after "type" though, that may be a better location for
it.

> 
> I count:
> 
>         struct v4l2_mbus_config_parallel parallel;
>         struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
>         struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
> 
> not sure about csi1, but I would say "yes" ?
> 
> However it would feel more natural to fetch the 'link_freq' from the
> bus-specific structure like in 'bus.mipi_csi2.link_freq' (and 'bus' is
> an union, so we're not consuming any additional space if we move it to
> the per-bus structure).
> 
> 
> >  };
> >
> >  /**

-- 
Kind regards,

Sakari Ailus

