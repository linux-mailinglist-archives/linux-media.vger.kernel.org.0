Return-Path: <linux-media+bounces-24484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DDCA06F96
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 08:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC5357A16A9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 07:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF27021481B;
	Thu,  9 Jan 2025 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/aHqoQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620ED1714D7
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736409522; cv=none; b=l7nRGGe8QQXxb8UBxD3krnnsGlv1YPaHaKRu0f7kfdVrnD4KGcL4T4oELSUlZTNSijaaAEUn92ziWOaxju9UP6m2Ee1fgkdxpUIFAEy66aswukdG49yX3MvZ2CadiMBf0GbNct0lHLuFFDSvCHnoyOATLlTbZVyqQ3j/0z1bcQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736409522; c=relaxed/simple;
	bh=R9QMHMFcFcdnVs3JdagfDBzKxNg9/1JCyXiAawCFC4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gACHxmNFMdVLcTjr+feylzMqins0nrpsu9gsT55odjYAfRw3KebERMBnHG59T3U7FfnrRu1NUMvzllbE2/HQYYHEHEg8FAZ9lV0wFyALrEMuzUk6Ic+9Kg17K2Ml6Ow+wlFdXob7gOh9Cq93DzqYIBx6BANfEESndMitnPUuvF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/aHqoQo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736409520; x=1767945520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R9QMHMFcFcdnVs3JdagfDBzKxNg9/1JCyXiAawCFC4o=;
  b=I/aHqoQoVcvN3Gf4PoSHSujCJuq3A9M6qtRxZp1O2UcHHxqlB688IBPw
   qASBHqag61e2gckfVE/0zFnzV/LqMbEoMO4j7f9L5nWAHXkCKfdVMBgU9
   diKiWE2e2PnbtW3T9JrNjOtTPiACJWkwpkOJJWBh/xoYh/Jkboy8jXoNZ
   BW3elLrr81L9G0n/AN0k9Cx4LRb3CHDPsVhqsRpQpOtpuTuSpyOf4uA9u
   iOTM4tcPEYpJHWirxqriB8eE0b3J9nETkOuLa4knzyMCeTPhS8ZN6D78w
   rJWh3hy2pLn8+8i3e58zdgfJhB1eggEaw8OCXxtVLF8k7fsnPbueDhX2B
   g==;
X-CSE-ConnectionGUID: qRW29GCFRlqayoXlwBTftQ==
X-CSE-MsgGUID: x4pyosYnT6ObQY9qC+rkxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35944597"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="35944597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 23:58:39 -0800
X-CSE-ConnectionGUID: iHd+cyfPTHewAV+NwPAyAQ==
X-CSE-MsgGUID: FQikJsxMT3iQKB/KE8nLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107373561"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 23:58:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 28A821201CA;
	Thu,  9 Jan 2025 09:58:31 +0200 (EET)
Date: Thu, 9 Jan 2025 07:58:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v4 6/9] media: uapi: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <Z3-Bp5hI0wOTqxX_@kekkonen.localdomain>
References: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
 <20241220132419.1027206-7-sakari.ailus@linux.intel.com>
 <d638af2c-0ec8-490c-b2dd-487fbd62b5ca@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d638af2c-0ec8-490c-b2dd-487fbd62b5ca@ideasonboard.com>

Moi,

On Wed, Jan 08, 2025 at 02:20:40PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/12/2024 15:24, Sakari Ailus wrote:
> > Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> >   drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> >   include/uapi/linux/v4l2-controls.h                           | 3 +++
> >   3 files changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > index 27803dca8d3e..2ae17ed99729 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > @@ -55,3 +55,7 @@ Image Process Control IDs
> >       control value divided by e.g. 0x100, meaning that to get no
> >       digital gain the control value needs to be 0x100. The no-gain
> >       configuration is also typically the default.
> > +
> > +``V4L2_CID_CONFIG_MODEL (bitmask)``
> > +    Which configuration models the sub-device supports. Please see
> > +    :ref:`media_subdev_config_model`. This is a read-only control.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 1ea52011247a..24c9c25e20d1 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >   	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
> >   	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
> >   	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> > +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
> >   	/* DV controls */
> >   	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >   	case V4L2_CID_DV_RX_POWER_PRESENT:
> >   		*type = V4L2_CTRL_TYPE_BITMASK;
> >   		break;
> > +	case V4L2_CID_CONFIG_MODEL:
> > +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +		*type = V4L2_CTRL_TYPE_BITMASK;
> > +		break;
> >   	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> >   	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> >   		*type = V4L2_CTRL_TYPE_INTEGER;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 974fd254e573..0152240229ab 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
> >   #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
> >   #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
> >   #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> > +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> > +
> > +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1ULL << 0)
> 
> 32 models is enough, and the subdev can support multiple models?
> 
> It sounds sensible, I guess, but do you have any ideas what the other config
> models might be?
> 
> We could also have just a single 32 bit int for the model, but that allows
> only one model per subdev. Or maybe split the 32 bit int into 4 parts, which
> would allow 256 models, of which a subdev can support 4.
> 
> I'm not really suggesting anything here, I just fear we don't have a clue
> what the other models might be and how they're used =).

Well, I think your test pattern generator is a candidate. :-)

The bitmask control is actually 32 bits, I'll use 1U.

-- 
Regards,

Sakari Ailus

