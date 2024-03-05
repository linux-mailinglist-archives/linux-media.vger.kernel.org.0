Return-Path: <linux-media+bounces-6410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1338717C7
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 09:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 331FF28195A
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 08:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A857F7EF;
	Tue,  5 Mar 2024 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEBHx62U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3134A7EF18
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626416; cv=none; b=E263bUFcVW8DPTxEcucuRvBXq3YhVOExLzcxlYdu3JF26rs1qlifXtfSHMPDV6eMN0zpKtGzcRplTlWa020+/ZHDUQQ+PWpQBJ7pUCRDxUaafpmoKaQ4sx4nUlLI691og1LcjBM3pcel7KyiUkvyQNYyMdHS2PSoSQGciD9cgYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626416; c=relaxed/simple;
	bh=PQ8+Ye8geAB7teYIFmFYuCLTqk/RtHN+STOBrRLR0ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zk8JvN7/JFZ8YMZKwCC7xKgeuz1fFv64MaNYQzNQJf0xeLy2d32J7JtJjuLHsJla0g9zl+cgLEu5fp35tB9ERqt2c0mqVRK6zL7HXpLsePDFg4erxIwVtiSoHasMSnzpWhXgTzz8ZwRGBTCNLxYXNyzQG6QydtABCSrLGqGXE84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEBHx62U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709626415; x=1741162415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQ8+Ye8geAB7teYIFmFYuCLTqk/RtHN+STOBrRLR0ls=;
  b=nEBHx62UzMLQU5s8Ic9TDsHs2dQFlNPrluy52rEQcx9HU5S5pDHqEGy2
   9QNXH4NjZS8ZpA4SBmQaaPQQ9nc+PcOR0kKPCoLCf2g9mQCQhlKIEuZ9b
   r3Ri55/PMQMFOW2aoj9/idGDrywMGl8ywKOajQFwOVU92Ggl9DaR9uAiS
   ryTVaVGY/R1TP0Z+wyXIBKXHy7DQ5Ha2+5NYPAr9HxuE8sI0vdiRko7k2
   ll8lddCOLCtRpyfrEP+l9im/JX3loX4Dd/QHXO0hVmz8c1iIarIY428ih
   OEAyWNuiZFSdTU13XMoFY1Y1wkwMGON0Ho9+JO/Umjsn+w3JilOT7SujU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7108156"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7108156"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9707177"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:13:33 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9780D11F871;
	Tue,  5 Mar 2024 10:13:30 +0200 (EET)
Date: Tue, 5 Mar 2024 08:13:30 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 09/29] media: mc: Do not call cdev_device_del() if
 cdev_device_add() fails
Message-ID: <ZebUKpP87YhDNo-q@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-10-sakari.ailus@linux.intel.com>
 <20240207095725.GF23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207095725.GF23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 11:57:25AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Dec 20, 2023 at 12:36:53PM +0200, Sakari Ailus wrote:
> > cdev_device_del() is the right function to remove a device when
> > cdev_device_add() succeeds. If it does not, however, put_device() needs to
> > be used instead. Fix this.
> 
> Where's the put_device() call ?

Seems to have gone missing at some point.

It was added though by "media: mc: Split initialising and adding media
devnode" a little later as this got moved to mc-device.c, so fixing this
here makes difference until that patch.

I'll address this for v3.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/mc/mc-devnode.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> > index ce93ab9be676..7e22938dfd81 100644
> > --- a/drivers/media/mc/mc-devnode.c
> > +++ b/drivers/media/mc/mc-devnode.c
> > @@ -254,7 +254,6 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
> >  
> >  cdev_add_error:
> >  	mutex_lock(&media_devnode_lock);
> > -	cdev_device_del(&devnode->cdev, &devnode->dev);
> >  	clear_bit(devnode->minor, media_devnode_nums);
> >  	mutex_unlock(&media_devnode_lock);
> >  
> 

-- 
Regards,

Sakari Ailus

