Return-Path: <linux-media+bounces-42901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8821EB8F55C
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A2DF189F388
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217052ECD15;
	Mon, 22 Sep 2025 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPHEqheR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7423182B4
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758527291; cv=none; b=PV1P+MiyI4y+M0xUk+JujVqRqDBEuAaFlCoEwgrTXz6c8oJk9hCKvDkyhDdGKnXH9yrtUX+gv1kWWropcsGw6E9ginTsOUuCpzok2yYFKTyQbrb/BcI+JU2f1CnahrJPBRah9gM3TpD+2YOJ/15ZWBWTqDRFEIj98H41qd7u4GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758527291; c=relaxed/simple;
	bh=g/QHX5Ci1xQ8ayEt5ueDTfvIZTDni9GTe4sEf/sUi/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbUkzgoCGFIVJBAu4e2DZaSywD93sJb+TeazH0Smfmlq8k+5Xl7vam79zN+vJIbUWBAZxSpOytYe0C7gb9Q0yetDB30YMdcg2tTvui9dZ/h39IJ5d6M9u0z6bcKLapz0c5SnzKf4XWiNscAlIoU79dJ36QpMqXR+OQclU5KQR0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPHEqheR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758527290; x=1790063290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g/QHX5Ci1xQ8ayEt5ueDTfvIZTDni9GTe4sEf/sUi/0=;
  b=YPHEqheRHYtj4JHxyXjwVHJBvNaB6ssCPBRev4WdDd5/cnovnHypnaKv
   ZOiwuxD1fgYaSOmrRj3z7vVCAi10hP6/u9h5A/ut667/IEDfkUsYjk4/m
   S4VOBp9cFlwwowaYdMqRxrhBAinG2aFkjf0zx6KheaZsSVr9bFAU5SzsD
   4haCNZJAmDhopzzF+fqUxVNhROIFKVsSruG7xZN+kyUev+KfHkTXXXKXk
   7mAjcXrx1kCaJeDc+ZkEMrMAj6MfG0F9vk0bL6qj95T13VKEtGL7RYLng
   e3/UnmJIyL7cupwjNBvGZ6UXJX064IYsvSeogKolfuir/uB5q6DJk8Qkz
   g==;
X-CSE-ConnectionGUID: 0emrPDqJSRGzPHNupkMEeQ==
X-CSE-MsgGUID: Fzw366/2R1CBWVxgHCp73w==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="72210070"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="72210070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:48:06 -0700
X-CSE-ConnectionGUID: 5qvu2hASSpK8dRYUFWFnDA==
X-CSE-MsgGUID: n07vvn7sTWyf34DXajr4lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="181663866"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:48:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ED8901202BC;
	Mon, 22 Sep 2025 10:47:59 +0300 (EEST)
Date: Mon, 22 Sep 2025 10:47:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 36/46] media: uapi: Add media bus code for ov2740
 embedded data
Message-ID: <aND_Lx57vz9eopEJ@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-37-sakari.ailus@linux.intel.com>
 <20240420092930.GW6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420092930.GW6414@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Apr 20, 2024 at 12:29:30PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 16, 2024 at 10:33:09PM +0300, Sakari Ailus wrote:
> > Add a media bus code for ov2740 camera sensor embedded data and document
> > it.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > ---
> >  .../media/v4l/subdev-formats.rst              | 70 +++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |  3 +-
> >  2 files changed, 72 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index a04756092238..c99b58cb8c7b 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8596,3 +8596,73 @@ This mbus code are only used for "2-byte simplified tagged data format" (code
> >  embedded data format codes.
> >  
> >  Also see :ref:`CCS driver documentation <media-ccs-routes>`.
> > +
> > +Omnivision OV2740 Embedded Data Format
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +The Omnivision OV2740 camera sensor produces the following embedded data format,
> > +indicated by mbus code MEDIA_BUS_FMT_OV2740_EMBEDDED. The format conforms to
> > +:ref:`CCS embedded data format <MEDIA-BUS-FMT-CCS-EMBEDDED>` up to level 1.
> > +
> > +.. flat-table:: Omnivision OV2740 Embedded Data Format. Octets at indices marked
> > +                reserved or unused have been omitted from the table. The values
> > +                are big endian byte order.
> 
> s/are big endian/are in big endian/

Yes.

> 
> > +    :header-rows: 1
> > +
> > +    * - Offset
> > +      - Size in bits (active bits if not the same as size)
> > +      - Content description
> > +    * - 4
> > +      - 16 (10--0)
> > +      - Analogue gain
> > +    * - 6
> > +      - 16
> > +      - Coarse integration time
> > +    * - 10
> > +      - 8
> > +      - Dpc correction threshold
> 
> v8 indicated this contained bits 9:2 of the value, was that wrong, or
> did it get dropped by mistake ?

I'll add it back, it was accidentally lost in register hi/lo part merging.

> 
> > +    * - 15
> > +      - 16
> > +      - Output image width
> > +    * - 17
> > +      - 16
> > +      - Output image height
> > +    * - 23
> > +      - 8
> > +      - MIPI header revision number (2)
> > +    * - 31
> > +      - 8
> > +      - Vertical (bit 1) and horizontal flip (bit 0)
> > +    * - 32
> > +      - 8
> > +      - Frame duration A
> > +    * - 33
> > +      - 8
> > +      - Frame duration B
> > +    * - 34
> > +      - 8
> > +      - Context count (2)
> > +    * - 35
> > +      - 8
> > +      - Context select
> 
> I'm not sure to understand what those four values are.

This comes from documentation, I'm not sure about them either. I could drop
them as well, I don't think they carry any significance anyway.

> 
> > +    * - 54
> > +      - 8
> > +      - Data pedestal bits 9--2
> > +    * - 63
> > +      - 8
> > +      - Frame average bits 9--2
> > +    * - 64
> > +      - 16
> > +      - Digital gain red
> > +    * - 66
> > +      - 16
> > +      - Digital gain greenr
> > +    * - 68
> > +      - 16
> > +      - Digital gain blue
> > +    * - 70
> > +      - 16
> > +      - Digital gain greenb
> > +    * - 89
> > +      - 8
> > +      - Frame counter (starts at 1, wraps to 0 after 255)
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index 03f7e9ab517b..13e68c2ccb61 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -183,7 +183,8 @@
> >  #define MEDIA_BUS_FMT_META_20			0x8006
> >  #define MEDIA_BUS_FMT_META_24			0x8007
> >  
> > -/* Specific metadata formats. Next is 0x9002. */
> > +/* Specific metadata formats. Next is 0x9003. */
> >  #define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> > +#define MEDIA_BUS_FMT_OV2740_EMBEDDED		0x9002
> >  
> >  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> 

-- 
Regards,

Sakari Ailus

