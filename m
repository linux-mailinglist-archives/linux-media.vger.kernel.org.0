Return-Path: <linux-media+bounces-23353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B569F054C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 08:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39C67188ACAF
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 07:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9585818DF8D;
	Fri, 13 Dec 2024 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKMwkHIk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C2A1552FC
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734074162; cv=none; b=Z2xfY5Dui6dZLBqvmDiaDdweHf1uQ1BX2sJiStzgAPMzm2F4DPLuoFl8IoqKZyboK/1mpQiyCfnjFy2QctN+wKtmTds5rD48gFBk9D8hkstC0uX0d26DfCckCozjRPT6Hl9vLjXUztQnUJM3uVYGwEvKMYEA/TSpma06UigjkGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734074162; c=relaxed/simple;
	bh=MZASFta4tp+aP3RwUlPZJ3XIslueyI0dD/A1ILQgWdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWbV3PgZtVNpZ45qcM7mu6tSPI2J0+qg4rhFcPsziLkepLF9y1NxL+tUDAu+dNDx/yvxXwB7ZdyDpim9m2nrIOiJehK+BhPe5pRBlKU6RX6jxkUAzZmud6Lq3k+U8Xiu6ehD63vWedE3V4rHtVFaDyDSG3ieUVIfdox8U8N4ZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKMwkHIk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734074160; x=1765610160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MZASFta4tp+aP3RwUlPZJ3XIslueyI0dD/A1ILQgWdw=;
  b=IKMwkHIkN7p53RadICNgOB3229EwvYkx40w0o4ERpWzyZUR6m9HGMlVx
   /aVO23/YlP2s9whivwcc/CcyBMyB0/uVBOjOYE71RLNu7cTSUygseW4O4
   5zt6pA63V5KUWzEMw4YYZjIdwiZVPmo5+Cdm98AuthrMnxSFvJf1uvvzZ
   VPe5W82VxfuKHXDEMeF3WrTUyw6GDApTmyI8eN7Eqdt8GsbSwwKKjNsMP
   XcGn//Cw6w8W7Bb66jPDosuuFeeYjP38GFnBocwvGYjBVTglyVcdl7b3d
   2zP+ntg1vN83h8+qCeO81raeC5GPU1jvqK8x3Z3zJRDCp596HGdgfQd8M
   g==;
X-CSE-ConnectionGUID: c3Gq1YtqRL2WFwkg9KDL/A==
X-CSE-MsgGUID: gV3RSUuLSvWHTBpVyei95A==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34651551"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; 
   d="scan'208";a="34651551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 23:16:00 -0800
X-CSE-ConnectionGUID: pHDkRTYSQu+fJMv17hMBxQ==
X-CSE-MsgGUID: pIdV51u2SRG+SAg/HdyZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127452458"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 23:15:58 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B5E5312034A;
	Fri, 13 Dec 2024 09:15:55 +0200 (EET)
Date: Fri, 13 Dec 2024 07:15:55 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v7 3/5] media: Documentation: Update link frequency
 driver documentation
Message-ID: <Z1vfK0cUW9sgBPLt@kekkonen.localdomain>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
 <20241210075906.609490-4-sakari.ailus@linux.intel.com>
 <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uk6uc7i3v6bpuphqvrhbkqisammkimgbgoas5g4tsakkcbj2jh@d4rss77am2c2>

Hi Jacopo,

On Thu, Dec 12, 2024 at 05:53:53PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Dec 10, 2024 at 09:59:04AM +0200, Sakari Ailus wrote:
> > Add the get_mbus_config() as the means for conveying the link frequency
> > towards the receiver drivers.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/tx-rx.rst | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> > index dd09484df1d3..1430c330fd52 100644
> > --- a/Documentation/driver-api/media/tx-rx.rst
> > +++ b/Documentation/driver-api/media/tx-rx.rst
> > @@ -49,6 +49,10 @@ Link frequency
> >  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
> >  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> >
> > +On devices where the link frequency isn't configurable, the link_freq field of
> > +struct v4l2_mbus_config is recommended over controls for conveying the link
> > +frequency to the downstream driver in the pipeline.
> 
> When read in its entirety, the paragraphs
> 
>  Link frequency
>  ^^^^^^^^^^^^^^
> 
>  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
>  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
> 
>  On devices where the link frequency isn't configurable, the link_freq field of
>  struct v4l2_mbus_config is recommended over controls for conveying the link
>  frequency.
> 
> Sounds simpler without the last 7 words.
> 
> A nit and just tastes maybe

I used:

On devices where the link frequency isn't configurable, using the ``link_freq``
field of struct v4l2_mbus_config is recommended over controls.

> 
> I like where this is going!
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

-- 
Kind regards,

Sakari Ailus

