Return-Path: <linux-media+bounces-9374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E77D8A4EBF
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE741F23B7D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E331F67C46;
	Mon, 15 Apr 2024 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnhHE1j+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41FE376E6
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713183476; cv=none; b=A7/t8CtkC7oTmHZELeo8hr2Myec1hZfplsHc2a9JVRZVCCD39pltDFSHvASCXToZl1BCqrP/pDWlb4DD3lPaHLHkpJtGA273FXIG9pjoCqLQeucz/Bt8oYY+NGwY6qcHIvqYV3DQCOul45tFhfIO6cIVTFauyNc7zxswFhhin5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713183476; c=relaxed/simple;
	bh=2O5+40/UZixOdBCGrol16BautU6s+UKLo6OEBCXGfe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmGVe8anFHY4KYVtl06sDTbPFx8Ny6yk5nBouw7tcx4D1pBs89I2R+/yg/MNyUNMyN9bDqGvMkx9/ec3Zb1KemQeM/7GDjkm1PYcjslWTF8JdsJuuP2J1nalG+SHM3YezE65eK+H5zllPheIaCg3zzfvpmB8gDj8MoxuWZtGLrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnhHE1j+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713183475; x=1744719475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2O5+40/UZixOdBCGrol16BautU6s+UKLo6OEBCXGfe0=;
  b=CnhHE1j+KKH8CZ2bGEVkX3MauRPHsdD8nO3/HhTyfKZa8Mdi+IbKi6mC
   12yptWGnixWdWxQwIe0p/CJAUnHeup/2c6yzoOUnO7srYbNyReILxhttM
   z9e3auEBP/srN2NXVsZdMnbMjHGHRKHM6lYF4Te6blljwS7Dbkzg2i07p
   sIIfQqtawL05bjhiFTzO+nkEP8oLcdocq3wIugOKtlOrbn67nF8gC2vzs
   UH/Vho7puJVyc2I0gd490lllfzpmUvSlMGHil2O3P6jurwGDRjlC5nrVa
   yseYCSCb9PbSyMAv4zWnxI9I7/wYJqNf5BZcZKxODx3gwAWRdV62VqUWZ
   g==;
X-CSE-ConnectionGUID: ajV4om6TSCOZhsuHGTBL3A==
X-CSE-MsgGUID: rcXR+BiNRLW947zeskRt4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19280893"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="19280893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 05:17:54 -0700
X-CSE-ConnectionGUID: XXSqIEy5Shi9WPMa5TcFmg==
X-CSE-MsgGUID: pdHSVWm1Rp+liaIEyX8OHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="21808373"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 05:17:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C30CF11FBA0;
	Mon, 15 Apr 2024 15:17:49 +0300 (EEST)
Date: Mon, 15 Apr 2024 12:17:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH resend 5/5] media: ov2680: Add camera orientation and
 sensor rotation controls
Message-ID: <Zh0a7SY9brhZ2dg_@kekkonen.localdomain>
References: <20240415093704.208175-1-hdegoede@redhat.com>
 <20240415093704.208175-6-hdegoede@redhat.com>
 <Zh0RLfbfckkKLdrD@kekkonen.localdomain>
 <36e8c9cc-c9d1-494b-9da8-db8bdd1c43c4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e8c9cc-c9d1-494b-9da8-db8bdd1c43c4@redhat.com>

Hi Hans,

On Mon, Apr 15, 2024 at 01:58:53PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 4/15/24 1:36 PM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Apr 15, 2024 at 11:37:04AM +0200, Hans de Goede wrote:
> >> Add camera orientation and sensor rotation controls using
> >> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
> >> helpers.
> >>
> >> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/media/i2c/ov2680.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >> index 14a5ac2bbf8b..840e6b63ad19 100644
> >> --- a/drivers/media/i2c/ov2680.c
> >> +++ b/drivers/media/i2c/ov2680.c
> >> @@ -946,6 +946,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
> >>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
> >>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
> >>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> >> +	struct v4l2_fwnode_device_properties props;
> >>  	int def, max, ret = 0;
> >>  
> >>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
> >> @@ -1000,6 +1001,14 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
> >>  		goto cleanup_entity;
> >>  	}
> >>  
> >> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
> >> +	if (ret)
> >> +		goto cleanup_entity;
> >> +
> >> +	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
> >> +	if (ret)
> >> +		goto cleanup_entity;
> > 
> > As discussed with Umang recently, you can postpone
> > v4l2_ctrl_new_fwnode_properties() error check until the control handler. Up
> > to you.
> 
> So you mean move this up to above the 
> 
>         if (hdl->error) {
>                 ret = hdl->error;
>                 goto cleanup_entity;
>         }
> 
> check and then drop error handling for the v4l2_ctrl_new_fwnode_properties()
> call since any errors there will set hdl->error, right ?

Correct.

> 
> That sounds like a nice cleanup. I'll do that for v2.

Thanks!

-- 
Regards,

Sakari Ailus

