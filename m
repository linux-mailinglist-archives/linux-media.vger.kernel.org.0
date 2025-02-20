Return-Path: <linux-media+bounces-26446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9832A3D757
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 11:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6EA19C028B
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024581F1510;
	Thu, 20 Feb 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S48QNwtQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF931CCB4B
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048646; cv=none; b=lBYh0TD4udsQgU9NST1IN/pWw1bhs5FovpO9p4SA4UPhxMuFj1YUHNMjGRzRAMqVaBBqEFKtizGTBUNNTu/TWt/MDEtn2hT9RT3mD7eW7RGsLnLn7I6xJMkh39A+D/0vHcaOSNs6YnLgJeTK/yS7+X2qgKHfS3/oKUMi4p9O/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048646; c=relaxed/simple;
	bh=x8cXF/pj6YbLbTjNo6IL2X8rYcJwSqVoGsqtZ1v5g1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBMsUmTxQk6wR1StZNSzD4NwpeIHj565dgmuvNKgYqIqGPCCpNVfah3c2NvZngk105VR9W3uuQAGHq68ejNyjFSinZSSK7lo98PKOGKWzZdQaGt2feAH0nKufetfjEXlIFSMZKiUIMc56d8cGJB6ZsJmXz8sVyMliG/DkIZ6oRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S48QNwtQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740048644; x=1771584644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x8cXF/pj6YbLbTjNo6IL2X8rYcJwSqVoGsqtZ1v5g1E=;
  b=S48QNwtQ2E1kKHq5dl5pjHLlu77LTq92M5/YBBEFKL5vlQE+Vf0giLGf
   OvCnBskKHAYuuKddCSH6HjTAxVUYPNbc81UW9HKvBBvqXUPv0+fuBupEw
   L0dFKJBShVIfVb0X0jGv62QMexhu21gjFnefBMvDVinVDzP2+AudZGE3t
   IVuShxyhTDwj/u1A6LiF1bQuWPU+lJWnapCxD4dfcS63VdyWHNbtrw5cF
   NxZNVGB8+6V7BZUp9dx7ygmfUMG0SAnZpH3PN4MKXY379ZfGP/o/BqvH0
   oBfqs8qx845Jpc56TaHBTrdW33Q0OBq1v8DGjsklzHqNIVmpNCnxqm/yB
   A==;
X-CSE-ConnectionGUID: la8Oz9egSgKVH3sH64m9cQ==
X-CSE-MsgGUID: k15ciY6jTJ2wIkqGkukz+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40011029"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40011029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:50:43 -0800
X-CSE-ConnectionGUID: X5HjldIIRm+8St2WjcfmKQ==
X-CSE-MsgGUID: acQQWLssQn27iJY3St6LHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="114948701"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:50:37 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 00F9511F945;
	Thu, 20 Feb 2025 12:50:34 +0200 (EET)
Date: Thu, 20 Feb 2025 10:50:34 +0000
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
Message-ID: <Z7cI-mgXTc_O5Erc@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-7-sakari.ailus@linux.intel.com>
 <5ea2deef-09f4-4788-908c-239a1e4c6b69@xs4all.nl>
 <Z6n-Nff-7dsvMHaI@kekkonen.localdomain>
 <98c452a6-454b-4842-8083-c7e748abff21@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98c452a6-454b-4842-8083-c7e748abff21@xs4all.nl>

Hi Hans,

On Mon, Feb 10, 2025 at 03:07:34PM +0100, Hans Verkuil wrote:
> On 10/02/2025 14:25, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Feb 10, 2025 at 10:09:33AM +0100, Hans Verkuil wrote:
> >> Hi Sakari,
> >>
> >> On 03/02/2025 09:58, Sakari Ailus wrote:
> >>> Add the V4L2_CID_CONFIG_MODEL control for the configuration model.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
> >>>  include/uapi/linux/v4l2-controls.h                           | 3 +++
> >>>  3 files changed, 12 insertions(+)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> index 27803dca8d3e..2ae17ed99729 100644
> >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> >>> @@ -55,3 +55,7 @@ Image Process Control IDs
> >>>      control value divided by e.g. 0x100, meaning that to get no
> >>>      digital gain the control value needs to be 0x100. The no-gain
> >>>      configuration is also typically the default.
> >>> +
> >>> +``V4L2_CID_CONFIG_MODEL (bitmask)``
> >>> +    Which configuration models the sub-device supports. Please see
> >>> +    :ref:`media_subdev_config_model`. This is a read-only control.
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> index 1ea52011247a..24c9c25e20d1 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>  	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
> >>>  	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
> >>>  	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
> >>> +	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
> >>>  
> >>>  	/* DV controls */
> >>>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> >>> @@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >>>  	case V4L2_CID_DV_RX_POWER_PRESENT:
> >>>  		*type = V4L2_CTRL_TYPE_BITMASK;
> >>>  		break;
> >>> +	case V4L2_CID_CONFIG_MODEL:
> >>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >>> +		*type = V4L2_CTRL_TYPE_BITMASK;
> >>> +		break;
> >>>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
> >>>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> >>>  		*type = V4L2_CTRL_TYPE_INTEGER;
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> >>> index 974fd254e573..731add75d9ee 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
> >>>  #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
> >>>  #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
> >>>  #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
> >>> +#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
> >>> +
> >>> +#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1U << 0)
> >>
> >> I think I mentioned this before, but what's the point of this?
> > 
> > I recall Laurent was last to reply to the thread, with a good explanation
> > of the purpose. The message id is
> > <20241118024002.GJ31681@pendragon.ideasonboard.com> .
> 
> Now document that in this patch series. I double checked patch 04/15 again,
> and there is no mention of that explanation from Laurent. It should be incorporated
> in that patch.
> 
> Open questions:
> 
> 1) If this control is not available, but it is still a camera sensor, what is
>    userspace supposed to to? I guess all it can do is assume that the driver
>    follows the standard rules, since there is no way to figure out if there are
>    differences. So again, how does this help? In any case, this should be
>    documented as well.

The user space cannot expect the sub-device UAPI conforms to the common raw
sensor model without this control. The purpose of the model is indeed to
allow the user space to expect certain things to be supported in the API
and if they are supported, they work in a certain way. The alternative is
to do this driver by driver and there are quite a few sensor drivers out
there, with more to come.

> 
> 2) Are there compliance tests for this? Because there is no point adding this
>    without having tests for it as well. Otherwise I can 100% guarantee that
>    drivers will set this even if it deviates from what it should do in some
>    way. Relying on code review alone is going to be a very tough job.

Compliance tests need to be added, I agree.

> 
> > 
> >>
> >> You are adding a control describing a configuration model, but it has
> >> just a single possible configuration model. I see no description anywhere
> >> about when a new model would need to be added, or what userspace is
> >> supposed to do with this.
> > 
> > At this point I'm not sure how many other configuration models might be
> > needed or when they would be needed.
> > 
> >>
> >> And as long as there is only one model anyway, I don't see the point of
> >> this control.
> > 
> > I could create a control just for the common raw sensor model but 
> > 
> >>
> >> Is the intention that all sensor drivers will set this control? The RFC
> >> series isn't clear about this.
> > 
> > I'd expect almost all new raw sensor drivers to expose this control with
> > the common raw bit set.
> > 
> >>
> >> The problem I see with this series is that it seems to mix seemingly
> >> unrelated changes: adding COLOUR_PATTERN/BINNING controls doesn't seem to
> >> depend on configuration models. Or if they do, I clearly didn't get that.
> > 
> > These are all related to sensor API improvements. There is no direct
> > dependency, no, but I expect drivers implementing the common raw sensor
> > model would also support these controls. I can document this.
> 
> Just split it up in two separate series. I have no objections to the sensor API
> improvements, so it is much easier to get that in.
> 
> But I think that the 'config_model' part is poorly documented and I am quite
> skeptical about the whole thing. So that shouldn't block the other changes
> from this RFC series.

One option could be indeed to postpone this, and continue working on the
user space one driver at a time. My initial thought really was we could
require the common raw sensor model to be used with internal pads,
otherwise it'll be harder to ensure sensor drivers using them will be using
them consistently: compliance tests would require quite a few exceptions
for instance (doing the tests only for sensors that are non-CCS for
instance).

I wonder what Laurent thinks.

-- 
Regards,

Sakari Ailus

