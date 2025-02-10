Return-Path: <linux-media+bounces-25916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73FA2EDA6
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F0543A086A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 13:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955AF225A52;
	Mon, 10 Feb 2025 13:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GexcXDZz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274872253AB
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193922; cv=none; b=DMgu8Tn7s8WsXjsDtU8lVjDr9NqmDp1WTH0xDGy2VntEtjsuExiEgwlNq3VMsHCj4rvzevFVPseerpGwMCkPJ5y/iyakE6cW5MIPW4NrQw6eEU7qIArZYhoFgcTn3/lmjz8xlraIP2wsd0enFg9AaEkkis/SRvGB0AhQRu4jQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193922; c=relaxed/simple;
	bh=KKCenE44vrv/+fLH9HQd4gFZt85T5VJUM0Iuzx+kKxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjqWrq1/npfcmrBuJhHojHjSWHSjOI/cTbkCfXTB25S5Gb67yMNEcDcDJUub4r6fAAkLUTXO+66FIPgF/9qKML6OV814K57OcgoeTmFA+znDlP4819NWrcxS7DfyG+IoXVpWQWIBbZGX2+waitEplYHl13Hbn7A9wFUKnDih6PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GexcXDZz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739193920; x=1770729920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KKCenE44vrv/+fLH9HQd4gFZt85T5VJUM0Iuzx+kKxA=;
  b=GexcXDZzUiT+A4XDj0qXoeR0O59SEAUwrrrIX2yJnfCFMbeqQ2ubVPiR
   +p+HqaszkNcks6qOoQHb89F6JpWBqi9w/IFvchyyw4mPekgnc+0rCfM8J
   zKgxUlWQhYgmJuLktFIMwkVddPMSVo3vXsfEUH0F1BxsRyN0FHt+cIqqy
   pH1EfB/T48qd8lrfykXx0LgJtFJcw284VMQXspj+wJ87Zp606NmKCeB5z
   1YxIlKqlWKJfN1oW/a1Wt60l4VRIS8MerPtiSW3vjFmVqeYAlhyFppSqz
   F0JXJyBMPmTHSfNz1+NYFX5eZe7ubhE73pxsllJU1FP8KpvaLm2EOrEWg
   Q==;
X-CSE-ConnectionGUID: OJzu/CYFTNaJv1K56GkkLw==
X-CSE-MsgGUID: yz5OtGV5SOCotE4zLwi8Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39883597"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39883597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 05:25:18 -0800
X-CSE-ConnectionGUID: zd5aMEGbSjGiKUuiKBYVSg==
X-CSE-MsgGUID: sAW+y6r6TzWFzrb/HBXrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112143385"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 05:25:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 46F0D11F8D9;
	Mon, 10 Feb 2025 15:25:09 +0200 (EET)
Date: Mon, 10 Feb 2025 13:25:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v5 06/15] media: uapi: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <Z6n-Nff-7dsvMHaI@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-7-sakari.ailus@linux.intel.com>
 <5ea2deef-09f4-4788-908c-239a1e4c6b69@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ea2deef-09f4-4788-908c-239a1e4c6b69@xs4all.nl>

Hi Hans,

On Mon, Feb 10, 2025 at 10:09:33AM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 03/02/2025 09:58, Sakari Ailus wrote:
> > Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> >  include/uapi/linux/v4l2-controls.h                           | 3 +++
> >  3 files changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > index 27803dca8d3e..2ae17ed99729 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> > @@ -55,3 +55,7 @@ Image Process Control IDs
> >      control value divided by e.g. 0x100, meaning that to get no
> >      digital gain the control value needs to be 0x100. The no-gain
> >      configuration is also typically the default.
> > +
> > +``V4L2_CID_CONFIG_MODEL (bitmask)``
> > +    Which configuration models the sub-device supports. Please see
> > +    :ref:`media_subdev_config_model`. This is a read-only control.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 1ea52011247a..24c9c25e20d1 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
> >  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
> >  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> > +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
> >  
> >  	/* DV controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  	case V4L2_CID_DV_RX_POWER_PRESENT:
> >  		*type = V4L2_CTRL_TYPE_BITMASK;
> >  		break;
> > +	case V4L2_CID_CONFIG_MODEL:
> > +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +		*type = V4L2_CTRL_TYPE_BITMASK;
> > +		break;
> >  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> >  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> >  		*type = V4L2_CTRL_TYPE_INTEGER;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 974fd254e573..731add75d9ee 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
> >  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
> >  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> > +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> > +
> > +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1U << 0)
> 
> I think I mentioned this before, but what's the point of this?

I recall Laurent was last to reply to the thread, with a good explanation
of the purpose. The message id is
<20241118024002.GJ31681@pendragon.ideasonboard.com> .

> 
> You are adding a control describing a configuration model, but it has
> just a single possible configuration model. I see no description anywhere
> about when a new model would need to be added, or what userspace is
> supposed to do with this.

At this point I'm not sure how many other configuration models might be
needed or when they would be needed.

> 
> And as long as there is only one model anyway, I don't see the point of
> this control.

I could create a control just for the common raw sensor model but 

> 
> Is the intention that all sensor drivers will set this control? The RFC
> series isn't clear about this.

I'd expect almost all new raw sensor drivers to expose this control with
the common raw bit set.

> 
> The problem I see with this series is that it seems to mix seemingly
> unrelated changes: adding COLOUR_PATTERN/BINNING controls doesn't seem to
> depend on configuration models. Or if they do, I clearly didn't get that.

These are all related to sensor API improvements. There is no direct
dependency, no, but I expect drivers implementing the common raw sensor
model would also support these controls. I can document this.

-- 
Kind regards,

Sakari Ailus

