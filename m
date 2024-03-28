Return-Path: <linux-media+bounces-8082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06B88FC63
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 11:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F7451F233CB
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 10:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944CE657B7;
	Thu, 28 Mar 2024 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxTwWbVn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062194F885
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711620359; cv=none; b=L3uDLu0zOHBI5WyywcN98goyRkywslJAStG+pNkA9Oe+0adbL7AzRmNa09tpSJ9HXQWBLr1oVQ637VPrWFwNKJH6xUTgidB6s7K3XySGs3WLwtNWys3AmPiH+nXilFQBhGAXcq7kHBtmsolbMiH4Na75v90iPRX2syhjXwZ9+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711620359; c=relaxed/simple;
	bh=8FRUfGyfliK59tZoseXHRwpglUtzDRF/Tghwvosz7uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnfEqDYotRTop4Rxq8WUtwqLHMkpMTiVcPRJuHbktqgrV684zvt4fzQ8djyxv5SDesmW6YWRi37Z7SHA9u9HETVps677lQNS1/2DtNlPoa79D9pDPQjJYzEW0XDhMxr1ZwEkyiZVOndTKsmyBllKj9oLy8tAwQ0FEEj9KnyHgl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxTwWbVn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711620357; x=1743156357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8FRUfGyfliK59tZoseXHRwpglUtzDRF/Tghwvosz7uI=;
  b=MxTwWbVnPwq7sQW+mmfDJsqPZohUwNunBLU9umBqMpBbaamkLaicwg4I
   W1RgtMYaeYe0gtM6qoA3r0pxQiTjetJnAl/dek0s6vcXr0saNFlyVQZ0g
   ZGuM8+rRI52iq1g3etBv9XSLBCgIthY33SFrGtxH7Oj8/BmoMCvBOTVor
   7AoUELt5Mbn70OqZpEZAFytZNzb8nHb75dsPqRPj6bZh+9FZVXYlw4pxQ
   B02QlwJcwCbE6GvNXcadcKeIs6pBPNKpR/93hiPpRp9os/eWARQ2kVaJx
   RYuCoKhSVyKpjkyBO2Aun6uwWfeFzZpVCmYvCvPO8/T9W7QHhmxA+Tk3u
   Q==;
X-CSE-ConnectionGUID: YI9C2dbqRUyVFnc7oVHPyQ==
X-CSE-MsgGUID: oWa7owpoS/eEgFN44qmmTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6654462"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6654462"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 03:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="21289082"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 03:05:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F01311F915;
	Thu, 28 Mar 2024 12:05:42 +0200 (EET)
Date: Thu, 28 Mar 2024 10:05:42 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 01/38] media: mc: Add INTERNAL pad flag
Message-ID: <ZgVA9u6jxTXAWngW@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-2-sakari.ailus@linux.intel.com>
 <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>
 <20240319221707.GD8501@pendragon.ideasonboard.com>
 <ZfqVB3dagHQXcoRx@kekkonen.localdomain>
 <20240321172032.GM9582@pendragon.ideasonboard.com>
 <ZgU8rsKcSGNPS7Dx@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgU8rsKcSGNPS7Dx@kekkonen.localdomain>

Hi Laurent,

On Thu, Mar 28, 2024 at 09:47:26AM +0000, Sakari Ailus wrote:
> > > >        -  The internal flag indicates an internal pad that has no external
> > > > 	  connections. This can be used to model, for instance, the pixel array
> > > > 	  internal to an image sensor. As they are internal to entities,
> > > > 	  internal pads shall not be connected with links.
> > > 
> > > I'd drop the sentence related to sensors.
> > 
> > I'm fine with another example, or a more generic explanation, but with
> > that sentence dropped, I think this will leave the reader wondering what
> > an internal pad is and what it's used for.
> 
> What we could and probably have here is that the internal sink pad
> indicates a source of data. That's what it really is, whether that data is
> image data or something else.
> 
> So I'd change this to:
> 
> The internal flag indicates an internal pad that has no external
> connections. Such a pad shall not be connected with a link. The internal
> pad flag is allowed only in conjunction with the sink pad flag. Together
> the two flags indicate the pad is a source of data inside the entity.

A similar text already exists in the following paragraph already so I don't
think additions should be needed.

> 
> 
> > 
> > > > > > +
> > > > > > +	  The internal flag may currently be present only in a source pad where
> > > > > 
> > > > > s/source/sink/
> > > > > 
> > > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > > +	  it indicates that the :ref:``stream <media-glossary-stream>``
> > > > > > +	  originates from within the entity.
> > > > > >   
> > > > > >   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > > > > >   must be set for every pad.

-- 
Regards,

Sakari Ailus

