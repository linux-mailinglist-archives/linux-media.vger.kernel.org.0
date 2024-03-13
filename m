Return-Path: <linux-media+bounces-6977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D487A3A4
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CE37B2190C
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F33B168CE;
	Wed, 13 Mar 2024 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmYxopiD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B06B1FAA
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710315569; cv=none; b=JMck9ST+mFtG8OmKaAHX+lY/Q2QNgHvTr1uoymye0tQzo8SH1RNg807zfAWDIDjzEWZi1Jnokm6M6wuCabu35OP57BJ9x/Jam9Yet/EuGy+eocEczo3Sy6Yur91n8WozMsZ3/WkVVlUUr5RmXvCUWsQvTN3ch7ZlgmpkcRDcFPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710315569; c=relaxed/simple;
	bh=KkTxd0tC86nO9ZoAk569oEsTPYhohwlA12PUjtmuqZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5ZV30VteTFISqQIm1KncacXInQXD4dVWflU6jsSkD4mPmu3NQBEvp56p/KJsKi4AxKTfq/9nJDpECFTP70FFV8SGLn8LajqkqDgNpF05gRD1r6VkcWD+lXb+qAE3ZL8XtnxB8dFWiGAx4yYtl6cj9OAHZsH/3P31sIiXnCN8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmYxopiD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710315568; x=1741851568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkTxd0tC86nO9ZoAk569oEsTPYhohwlA12PUjtmuqZM=;
  b=TmYxopiDJPP0jJ+Q+1OVLzqfndwy5sE/FKns4Y33PmTElKMdIlp2T+Xp
   51QYJmBWvG8TiyvEI2YkDhzsNb+WOGulpgvNF0pHbE+UiFdZWS3pfJcl0
   bzl0z49z/vv66PIJO0UDvjVHFSMGU72cK7sgKsyWkGtnBHWGFTe3EBpdw
   Owp2dc3HInZdX5QS4jVOAVYQD++Iah6P9MsFqzKEa6lLvXAG47umDtfX8
   7aK5XTthODWTT1OQQnfcZdiDVdz0IPbuvJ2BKrbmL6+T6uzzJXCammrKu
   oaOZhc+3SVSdorl8HWESX6jIMBUqACFKf6k2PXoXNxg0wnS+ItqK7TDMw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5671641"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5671641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11720719"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:39:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9D6C011F853;
	Wed, 13 Mar 2024 09:39:17 +0200 (EET)
Date: Wed, 13 Mar 2024 07:39:17 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 36/38] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
 sub-device routing flag
Message-ID: <ZfFYJTkwld-WIh5Y@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-37-sakari.ailus@linux.intel.com>
 <9265171e-b4a7-468e-83b4-51af5e8823dc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9265171e-b4a7-468e-83b4-51af5e8823dc@ideasonboard.com>

Huomenta Tomi,

On Wed, Mar 13, 2024 at 09:34:13AM +0200, Tomi Valkeinen wrote:
> On 13/03/2024 09:25, Sakari Ailus wrote:
> > Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
> > Such routes cannot be changed and they're always active.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   Documentation/userspace-api/media/v4l/dev-subdev.rst         | 3 ++-
> >   .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
> >   include/uapi/linux/v4l2-subdev.h                             | 5 +++++
> >   3 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 08495cc6f4a6..2f2423f676cf 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -572,7 +572,8 @@ internal pad always has a single stream only (0).
> >   Routes from an internal source pad to an external source pad are typically not
> >   modifiable but they can be activated and deactivated using the
> >   :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > -on driver capabilities.
> > +on driver capabilities. This capatibility is indicated by the
> > +:ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE <v4l2-subdev-routing-flags>` flag.
> >   Interaction between routes, streams, formats and selections
> >   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 08b8d17cef3f..cd7735f9104e 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -139,6 +139,11 @@ Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
> >       * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> >         - 0x0001
> >         - The route is enabled. Set by applications.
> > +    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
> > +      - 0x0002
> > +      - The route is immutable. Set by the driver. The
> > +	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
> > +	changed.
> >   Return Value
> >   ============
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index ca543982460c..7e501cb45e4e 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -200,6 +200,11 @@ struct v4l2_subdev_capability {
> >    * on a video node.
> >    */
> >   #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
> > +/*
> > + * Is the route immutable. The ACTIVE flag of an immutable route may not be
> > + * changed.
> > + */
> > +#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
> >   /**
> >    * struct v4l2_subdev_route - A route inside a subdev
> 
> Is the route fully immutable? The sink/source stream ID cannot be changed
> (or any new fields we might come up with in the future)?

I think the new fields should be considered separately when they're added.
This also applies to the stream IDs, I'll add this to the documentation.

The naming of the flag is aligned with MC link flag with a similar purpose.

> 
> Hmm, or would a route with different stream IDs be a, well, different
> route...
> 
> The docs here only talk about the ACTIVE flag. Would
> V4L2_SUBDEV_ROUTE_FL_ALWAYS_ACTIVE be a better name, to be more explicit on
> the meaning?

I prefer immutable. I wonder what Laurent and Hans think.

-- 
Terveisin,

Sakari Ailus

