Return-Path: <linux-media+bounces-8900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25489D7A7
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C801D1F24FE9
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 11:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE9685C59;
	Tue,  9 Apr 2024 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uk5BpYe1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100E31E885
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712661132; cv=none; b=ItWEPL39BThmfsRVV1W7pDfQNBZxYRjJAnL46T8Wxb4Sw1av8smHix12xQ1ika09ipVsNDmoA14kc9a7YPAgc51CTlOMkgwdU3wGPMDhpc/YDDYJeoDUX5v582N/8yYJZT2uv8h3HFaGBCcXI5lm0Uv3f0HlVHh/C5SgWJNM6ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712661132; c=relaxed/simple;
	bh=N/mIwayxR+fwz38hFqatBnTMwHhFMzNkGePlz323GR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY3MzLFy/MNdnXNzuh9HYCqxCrIrsLtn8CI4GYIIyqg8ryZYkLTJQ3o7twdjJ7K3Co1jd6+zlQSvks2EzuuBU2s6AFQp5dYZ+F6PdIEOsiG6iXLRSBeiAAscZgCnLuYyxhXLxR9ir4g492C5vj99GDiuY8ryLoB7tCi9wb0Q4Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uk5BpYe1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712661131; x=1744197131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/mIwayxR+fwz38hFqatBnTMwHhFMzNkGePlz323GR8=;
  b=Uk5BpYe1CrRl2HOBQqWn0C5jqTa8IRMV1qzaYR67ezZxIavFEPRFPEqw
   RWh2TfS5ZBzEFMUKDemr+CTVo+jh1OcwJocAiUb92HasHz5YF3efhphxD
   Yv6ePk1tOwiLcsdduStf3ehHOacx6oB5QEHyiA8athcRqqea0U9vdUj6y
   NdKRMrzb9Aq/7jFlVJjN5Q2HwxeLUxRZ9as2yzDTxmZ74TMZwKb2QVtyj
   o4j4OGvrQ71qb9SoqqNVgO2Ju2pwQyvorVDDXW0bTKxh56mFFPCvMxUQa
   /2zrHdLPcsH9imb0mPjg/22BBBLHTTI5PsCwpeCrYSkBr2JKLs7ViVojG
   Q==;
X-CSE-ConnectionGUID: 4dPI4o/PRy+NKUHER9f4RA==
X-CSE-MsgGUID: vid0I5aLQ0OA7Vs1InA34Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8542747"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8542747"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:12:10 -0700
X-CSE-ConnectionGUID: 9nx3e5ckR7WEjytbYuCbDg==
X-CSE-MsgGUID: OyqZslmkTs6nqnj1U2yHSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20766349"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 04:12:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E4210120433;
	Tue,  9 Apr 2024 14:12:04 +0300 (EEST)
Date: Tue, 9 Apr 2024 11:12:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 08/38] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <ZhUihNnf6vQXWTyO@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-9-sakari.ailus@linux.intel.com>
 <20240320000300.GM8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320000300.GM8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 02:03:00AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:46AM +0200, Sakari Ailus wrote:
> > Document how embedded data support should be implemented for camera
> > sensors, and when and how CCS embedded data format should be referenced.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 919a50e8b9d9..92545538b855 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -102,3 +102,32 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
> >  values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> > +
> > +Embedded data
> > +-------------
> > +
> > +Many sensors, mostly raw sensors, support embedded data which is used to convey
> > +the sensor configuration for the captured frame back to the host. While CSI-2 is
> > +the most common bus used by such sensors, embedded data can be available on
> > +other bus types as well.
> > +
> > +Embedded data support shall use an internal source pad (a pad that has
> 
> s/source pad/sink pad/
> 
> Or do we call those "internal source pad" ?

As I wrote in the earlier e-mail, I'm quite unhappy with the "internal
source pad" term, mainly because of the conflict with the term itself and the
flags that indicate it. I'd just call them "internal sink pads" and then
explain they're actually a source of data.

> 
> As this is uAPI documentation, it is mainly targetting (in my opinion)
> userspace developers. I would write "Embedded data support uses ..." to
> describe the behaviour seen from userspace, instead of using "shall" to
> describe the requirements towards drivers.

Sounds good.

> 
> > +``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> > +<MEDIA-PAD-FL-INTERNAL>`` flags set) and route to the external pad. If embedded
> > +data output can be disabled in hardware, it should be possible to disable the
> > +embedded data route via ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> 
> You should mention the image pad here too:
> 
> Such sensors expose two internal sink pads (pads that have both the
> ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> <MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
> embedded data streams. Each of those pads produces a single stream, and the

s/Each of those/Both of these/

> sub-device routes those streams to the external (source) pad. If embedded data
> output can be disabled in hardware, the sub-device allows disabling the
> embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.

In the last sentence, we need to refer to the driver.

But generally I agree. I'll use:

"If the sub-device driver supports disabling embedded data, this can be
done by disabling the embedded data route via the
``VIDIOC_SUBDEV_S_ROUTING`` IOCTL."

> 
> > +
> > +In general, changing the embedded data format from the driver-configured values
> > +is not supported. The height of the metadata is hardware specific and the width
> 
> s/hardware specific/device-specific/

Yes.

> 
> > +is that (or less of that) of the image width, as configured on the pixel data
> > +stream.
> > +
> > +CCS and non-CCS embedded data
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Embedded data which is compliant with CCS definitions shall use ``CCS embedded
> > +data format <MEDIA-BUS-FMT-CCS-EMBEDDED>``. Device specific embedded data which
> 
> You should clarify here that you're talking about the internal sink pad.
> 
> s/Device specific/Only device-specific/
> 
> > +is compliant up to MIPI CCS embedded data levels 1 or 2 only shall refer to CCS
> 
> s/up to/with the/
> s/only shall/may/
> 
> > +embedded data formats and document the level of conformance. The rest of the
> > +device specific embedded data format shall be documented in the context of the
> 
> s/device specific/device-specific/
> 
> > +data format itself.
> 
> Not sure what you mean by the context in the last sentence.

This refers to CCS embedded data support levels which appears to be
documented in a later patch in the series ("media: uapi: ccs: Add media bus
code for MIPI CCS embedded data"). I'll add this paragraph after that patch.

The paragraph became finally:

Embedded data which is fully compliant with CCS definitions uses ``CCS embedded
data format <MEDIA-BUS-FMT-CCS-EMBEDDED>`` media bus code (level
3). Device-specific embedded data compliant with either MIPI CCS embedded data
levels 1 or 2 only shall not use CCS embedded data mbus code, but may refer to
CCS embedded data documentation with the level of conformance specified and omit
documenting these aspects of the format. The rest of the device-specific
embedded data format is documented in the context of the data format itself.

-- 
Regards,

Sakari Ailus

