Return-Path: <linux-media+bounces-7336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1688074F
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 23:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D251C22589
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 22:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC53218B;
	Tue, 19 Mar 2024 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YtnWz7Wy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD98CED8
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710887635; cv=none; b=TGfDQnLGyTxTT5S0lhKY62rs1DV4QwDMBhKKfm0+ryKKPLOc19EKFXpztmh6ju9o+mTUZsqvVeInznfe8LaU/ETLJ9OCGf5onRYDe+ctSQveeEGx5GAZpA+W3AlwRkOn0uEJUknW9DdNd/OB9Z1opvkrSdrh3O7YuiwBm5WIB8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710887635; c=relaxed/simple;
	bh=mNSgmoypSVcMwUxo8sYcNc0R5rbH91PoLGbt/tG+158=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTMPqmXsorevYVptIuFcJRvxdoALDzYCIzasOX1DIQ0ja6UbZ+ZHuWgfOUjtmVvy2Q5Uo3Igsw8TAz0834FTJ+HRsAMgy9m2syByhL/wzKBU8uYtHngnIHUrP3ty7qkNNiZUPHBO4wGA5LtRc6nP4qRS9o+WYvTte+87ddwNFWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YtnWz7Wy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E995480;
	Tue, 19 Mar 2024 23:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710887603;
	bh=mNSgmoypSVcMwUxo8sYcNc0R5rbH91PoLGbt/tG+158=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtnWz7Wy1wCQQlDGbjfDj4ZUXdzjpxcW8gmlYzv8pAExoeGdRXUpcIJ2hZlM7WvqC
	 XhjX479BJYfnDQ1ttZvbAnSsU8fp/2B1eEUvMroBNS81MGiVLlucnKbapXPtJ/vmrt
	 0ZPDFxo2dDHjNBbecTOH5BkMqeoMrajaqC/p9/KI=
Date: Wed, 20 Mar 2024 00:33:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <20240319223347.GF8501@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <ff9d63d0-528a-4afb-a85a-fcb8633fec07@ideasonboard.com>
 <ZfmSzM7kL_Si2pRW@kekkonen.localdomain>
 <4a20047b-559b-4877-8385-d22968499595@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a20047b-559b-4877-8385-d22968499595@ideasonboard.com>

On Tue, Mar 19, 2024 at 04:20:35PM +0200, Tomi Valkeinen wrote:
> On 19/03/2024 15:27, Sakari Ailus wrote:
> > On Thu, Mar 14, 2024 at 09:30:50AM +0200, Tomi Valkeinen wrote:
> >> On 13/03/2024 09:24, Sakari Ailus wrote:
> >>> Add generic serial metadata mbus formats. These formats describe data
> >>> width and packing but not the content itself. The reason for specifying
> >>> such formats is that the formats as such are fairly device specific but
> >>> they are still handled by CSI-2 receiver drivers that should not be aware
> >>> of device specific formats. What makes generic metadata formats possible
> >>> is that these formats are parsed by software only, after capturing the
> >>> data to system memory.
> >>>
> >>> Also add a definition for "Data unit" to cover what is essentially a pixel
> >>> but is not image data.
> >>
> >> The CCS spec talks about legacy packing and optimized packing for 16+ bit
> >> formats. You cover only the "legacy" ones here. Did you look at those?
> > 
> > The reason is that the bus data layout of the new packing at higher bit
> > depth matches with packing at lower bit depths (half to be precise). That's
> > why there's no need to define formats for the new packing methods at higher
> > bit depths (the driver simply uses the packing at half of the bit depth).
> 
> Hmm. If we're capturing 10-bit raw format, say, with the width of 640 
> pixels, we'll configure the video stream format according to those. For 
> the embedded stream, we'll set it to V4L2_META_FMT_GENERIC_CSI2_10 and 
> 640 width, right?
> 
> If we're capturing 20-bit raw, we'll configure the video stream format 
> again accordingly, width to 640, and 20 bit fourcc/mbus code. If the 
> embedded stream uses the "legacy" packing, we'll set the format to 
> V4L2_META_FMT_GENERIC_CSI2_20 with width of 640, right?
> 
> But if it's using packed format for the embedded stream, we set the 
> format to V4L2_META_FMT_GENERIC_CSI2_10 and width to 1280?
> 
> Considering that the video and (line-based) embedded data come from the 
> same source, I'd expect the widths to be the same.

I don't have a strong objection against multiplying the width, but we
need to figure out the impact on other kernel space components, as well
as on userspace. I suppose the media bus code for the embedded data
stream on the sensor source pad when using optimized packing and
capturing RAW20 images would be MEDIA_BUS_FMT_META_10 ? In that case I
think the sensor driver should be able to handle the width calculations
on its own, and the value would just be propagated by userspace.

-- 
Regards,

Laurent Pinchart

