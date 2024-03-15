Return-Path: <linux-media+bounces-7099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B487C8DC
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 07:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 446551F215B7
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 06:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DD013ADA;
	Fri, 15 Mar 2024 06:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6sDNKdx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336FF17BA6
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 06:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710484687; cv=none; b=EkoOHG0HQxMC5Il/IF044suRZ9ZsSqL6/F/cEHhZMODcduM9wC1I81OwUGQ0nlt1sC05LYJsqaDFaevAlYUaHm7axqvYDlDslKwJZLMfo3xR1907ZQ7yQIn1uPE9hA6q7cuR9OXQHd4KpY8jwLGnYALcB2gmuOlrNZNlYtyIEk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710484687; c=relaxed/simple;
	bh=Tqr+O25DzzeaUG7RAAftnj0zJsmIx/V4GmOQmfTVcoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTWTgpiDFtrBuOX3yayinsCEKIHR1rDWQRh3KDcSnBYrvCNsORBAS31Kw1WNv5XYMVxRDgiVj8IxwAflTMAkFuTL95hK1CrturxePDlEvpBT/uk0XnRUt/ueFAPCTkROOruVUEkhdbZl1YFzTGgNh1h5lTnEMXyQnbZsRdEZ0/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6sDNKdx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710484686; x=1742020686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tqr+O25DzzeaUG7RAAftnj0zJsmIx/V4GmOQmfTVcoQ=;
  b=A6sDNKdxQIc1OJaSh5WgNjkLmEUGeUDjkSiAlzp5U4B+T8ppt2IYYD07
   9lWzJ89Kd0+WxEXL2i/ESfZ8tnfrzER1PbZvMNTMUBKzYGM7QnJSJwNub
   +5etAHWlwU1Zosw63UNwP2WXepuu/FtNklNFcIjLgJH+txO2TRwqxLOvk
   urOJVuS/xO98Mo8vElEwpQKlUV862KBDt+s83n7S+Z+H46BKyPeEb/XLa
   lDzTcFTAdIWbtp8FZJornwGGv9MLSylRrbfMnibYrx+eX6cpKLlDcQqkN
   VaHJjRYxbvXr3FIkotxAoHkcv2MP1GCKLGWubcu3IdYgCZYEr7A30rDUC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5471368"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5471368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 23:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12477273"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 23:38:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3DCD411F819;
	Fri, 15 Mar 2024 08:38:00 +0200 (EET)
Date: Fri, 15 Mar 2024 06:38:00 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	dave.stevenson@raspberrypi.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Message-ID: <ZfPsyFXrlep9sQco@kekkonen.localdomain>
References: <20240311090042.30280-1-umang.jain@ideasonboard.com>
 <Ze7shcxM/v1+FHCm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <b949d192-9ea5-489a-91a9-2b055ec47b22@ideasonboard.com>
 <ZfMQpPyRrLAiRk6I@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfMQpPyRrLAiRk6I@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

On Thu, Mar 14, 2024 at 03:58:44PM +0100, Tommaso Merciai wrote:
> > > > @@ -1025,15 +1026,15 @@ static int imx219_identify_module(struct imx219 *imx219)
> > > >   	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> > > >   	if (ret) {
> > > > -		dev_err(&client->dev, "failed to read chip id %x\n",
> > > > -			IMX219_CHIP_ID);
> > > > -		return ret;
> > > > +		return dev_err_probe(&client->dev, ret,
> > > > +				     "failed to read chip id %x\n",
> > > > +				     IMX219_CHIP_ID);
> > > >   	}
> > > I think you can remove also here the curve brakets we don't need that
> > > anymore.
> > 
> > I think multi-line single statement like this one, is better with { ... }
> > and is actually preferred?
> 
> Yep, some driver is using your pattern some other not.
> I'm curious about the truth :) (for my education :))

I'd prefer it without braces.

See the end of section 3 in Documentation/process/coding-style.rst .

-- 
Sakari Ailus

