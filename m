Return-Path: <linux-media+bounces-24424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D2A05DAC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA50E3AA31A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1F51FC7C6;
	Wed,  8 Jan 2025 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leQJ0P4x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BDD1514F8
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344407; cv=none; b=QL8ekMEhtoZGBxjsdLPcesi9bhYUbShkE2e2YDxkaildWII8qZsxh3rWv95IRr0UMKShI7aSBFQ7ZEIGBovlt7q1lwjzNPbsfb4R3MKVvzpmKI1TUP5AUvrUwbSLrv554hyV5RZpm2X/WhzGLLMSv8MQUnqaoWQToswX+9Edwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344407; c=relaxed/simple;
	bh=ClMM0PHcDShy1gGCy70PnmNY7H+z1O607LxpgWUERFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsoZbA/q1HcJ5QZ15sz9XvcMDGOwk4z/cV96XKd55lcsy7M4xUbyMV/kgBc65QQ3nW4/igvzUEvFAvpJs309rYoevgsV6QNCuGMPayipqjdumOdCV7iPVQ29fXnldt+7yKblRzwjmdV9JJzxdQluKfMjm4zL3MqEWnADZj2pyDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leQJ0P4x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736344405; x=1767880405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ClMM0PHcDShy1gGCy70PnmNY7H+z1O607LxpgWUERFk=;
  b=leQJ0P4xQCJWi3hLkbdWo1J+lrKjf0AqwbkOIIZYdVkQMiA21VuMCTT1
   LaOGBBrskjRisO7fBet/2DBtK59Tdw+IxZQi5k5DOHoymqFwijb4doJEL
   Ss0hyvYfkiBsf2jyBodq7QJEyTUM/8mRJ7mn3ZEN+Rl88wPG/J9J8VgC6
   rFgds8As4DTQqIEOD4TCydvAh4Gm7Avgfo8YfSIJxZk1hUmo2k0pDhc5q
   0BrnDQPcRdjvnHAIWzQQ7g0U2eyTmLLJ8bKNnKd31JFCiI9Am58+WEGaS
   SciLS6R2Ui//2WYExZr+oRFqDlzsLrcyK6R9+b0f6RyPzY/Gj0mipXTTD
   g==;
X-CSE-ConnectionGUID: 1S1+xREjR2qW+vvXf5X/AQ==
X-CSE-MsgGUID: HtxDsS1RS2O5gS9pGQb1iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47144218"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47144218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:53:23 -0800
X-CSE-ConnectionGUID: 0zeI4rASTh6M61YGPmyPUg==
X-CSE-MsgGUID: wKPCzuKaQzWgu4cK0NUNpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108148827"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:53:21 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B253411F8DF;
	Wed,  8 Jan 2025 15:53:17 +0200 (EET)
Date: Wed, 8 Jan 2025 13:53:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com
Subject: Re: [PATCH v8 2/9] media: v4l: Support obtaining link frequency via
 get_mbus_config
Message-ID: <Z36DTYxNxs9-7DYT@kekkonen.localdomain>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
 <20241217215445.901459-3-sakari.ailus@linux.intel.com>
 <079e6b31-ee12-4d83-9dce-61f4d4c1cc99@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <079e6b31-ee12-4d83-9dce-61f4d4c1cc99@ideasonboard.com>

Moi,

On Fri, Dec 20, 2024 at 02:59:39PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 17/12/2024 23:54, Sakari Ailus wrote:
> > Add link_freq field to struct v4l2_mbus_config in order to pass the link
> > frequency to the receiving sub-device.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-common.c | 15 +++++++++++++--
> >   include/media/v4l2-mediabus.h         |  2 ++
> >   2 files changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> > index 9fe74c7e064f..e4b2de3833ee 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -508,12 +508,23 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
> >   s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >   			     unsigned int div)
> >   {
> > +	struct v4l2_mbus_config mbus_config = {};
> >   	struct v4l2_subdev *sd;
> > +	int ret;
> >   	sd = media_entity_to_v4l2_subdev(pad->entity);
> > -	if (!sd)
> > -		return -ENODEV;
> > +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +			       &mbus_config);
> > +	if (ret < 0 && ret != -ENOIOCTLCMD)
> > +		return ret;
> > +
> > +	if (mbus_config.link_freq)
> > +		return mbus_config.link_freq;
> > +	/*
> > +	 * Fall back to using the link frequency control if the media bus config
> > +	 * doesn't provide a link frequency.
> > +	 */
> >   	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >   }
> >   EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index e7f019f68c8d..24c738cd7894 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -169,6 +169,7 @@ enum v4l2_mbus_type {
> >   /**
> >    * struct v4l2_mbus_config - media bus configuration
> >    * @type: interface type
> > + * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
> >    * @bus: bus configuration data structure
> >    * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
> >    *		  Used if the bus is parallel or BT.656.
> > @@ -183,6 +184,7 @@ enum v4l2_mbus_type {
> >    */
> >   struct v4l2_mbus_config {
> >   	enum v4l2_mbus_type type;
> > +	u64 link_freq;
> >   	union {
> >   		struct v4l2_mbus_config_parallel parallel;
> >   		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
> 
> Maybe the docs (V4L2_CID_LINK_FREQ and/or struct v4l2_mbus_config?) should
> mention that only if v4l2_mbus_config.link_freq is == 0, V4L2_CID_LINK_FREQ
> is used. Or, in other words, the driver must only use one of those methods.

Such documentation is added by the 3rd patch ("media: Documentation: Update link frequency driver
documentation"):

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index c71003f74b1c..6f9eba189a9f 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+Drivers that do not have user-configurable link frequency should report it
+through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
+field of struct v4l2_mbus_config, instead of through controls.
+
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 

-- 
Sakari Ailus

