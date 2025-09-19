Return-Path: <linux-media+bounces-42813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 226DDB8B5AD
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 23:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71C85A3DE4
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 21:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFE82D1F42;
	Fri, 19 Sep 2025 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJ+DjPTH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D734BA3C
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758317733; cv=none; b=DHtnk3Rmvv5oV2aYchrXzGbzvBhGNNBoZXffileOHSGI5tt+1gC68IWWkOuN7/oK7Xi7Gzbfu3ivtEecHaXA2tbHX/9j4wVNq4kaD/40ThShB/HoEGSrhxJldTB8scx+nYzJNvp+Lla38tpm4lsyzJHDo6BaY84ufeaJ6NLz5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758317733; c=relaxed/simple;
	bh=A78i7Vfa4IFc4PSSjDTEk3ze/JybQIrNWecsBPTyc8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS6qWm4V2LGN/yMrHQsdgkbUGGA2LGr3RvcvkqwJ+XDNFn+Jd5rg9TpXIngO8tn9aQWovvmLED7SpqRnNxEbRNm25d+SoTqJj6rNeC7T5LNqYFTV/7IMILlzoPF6niZiNkUMOsA/bw5e1NCXAS2lO+bz3VK9sOzZJlb/P4gtAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJ+DjPTH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758317731; x=1789853731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A78i7Vfa4IFc4PSSjDTEk3ze/JybQIrNWecsBPTyc8I=;
  b=CJ+DjPTHjiSxTCP9Qijfc4QTOO31kZOCVBUfG9hRqfTTu1eNMw4r+hMx
   GqELyKrUbh2l6273tviG6FOtNu8TaWeE3YAaygXTNrNtJIpUIiSsNB2li
   o9GXV1UOKuOkNL11nf9ZK0A20Hza0v4766PNMPzxjVBeevVawB3oBwLnE
   wV21VoIeNpWMCEGRDqWlITDFX9ZHIjyQXzhKZWJQ7z+f/5uslQBeCyR+g
   Dk+AV0CKBydl12ZWR1Pc9XQmDwFCV6AIskFla+jqibjpuhOJyqr281Sf3
   za1AM11/4U3JXmIrWR06Yr9BwhP06/7PHshw6SqBqsdbj/1YHlSGxfMbi
   g==;
X-CSE-ConnectionGUID: E/4fztrmSpKy9w+IUrEjBQ==
X-CSE-MsgGUID: Q5xDzfdDRYuBLxzLWKcECg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71297201"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="71297201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 14:35:30 -0700
X-CSE-ConnectionGUID: OqTa/usWQ2SJg2DwozS/CA==
X-CSE-MsgGUID: lOr+QbueRm6s9v5CmCWSCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="176374574"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.231])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 14:35:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ED47E11FC29;
	Sat, 20 Sep 2025 00:35:19 +0300 (EEST)
Date: Sat, 20 Sep 2025 00:35:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 19/66] media: uapi: Add V4L2_CID_COLOR_PATTERN for
 describing color patterns
Message-ID: <aM3Ml-aSVKjPbv9W@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-20-sakari.ailus@linux.intel.com>
 <20250903150507.GO3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903150507.GO3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 05:05:07PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Aug 25, 2025 at 12:50:20PM +0300, Sakari Ailus wrote:
> > Add V4L2_CID_COLOR_PATTERN to tell the camera sensor's native color
> > pattern.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../media/v4l/ext-ctrls-image-source.rst      | 39 +++++++++++++++++++
> >  .../media/v4l/subdev-formats.rst              |  2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
> >  include/uapi/linux/v4l2-controls.h            |  6 +++
> >  4 files changed, 48 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 71f23f131f97..b19aaaffbce0 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -92,3 +92,42 @@ Image Source Control IDs
> >      representing a gain of exactly 1.0. For example, if this default value
> >      is reported as being (say) 128, then a value of 192 would represent
> >      a gain of exactly 1.5.
> > +
> > +``V4L2_CID_COLOR_PATTERN (integer)``
> > +    This control determines the color components and native pixel order in the
> > +    sensor's CFA (Color Filter Array) when used in conjunction with
> > +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
> > +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
> > +    order is constant for a given device, it is not affected by cropping or
> > +    flipping.
> > +
> > +    This control may only be used on V4L2 sub-devices.
> > +
> > +    This is a read-only control.
> > +
> > +    Available patterns:
> > +
> > +.. flat-table:: V4L2 color patterns
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       1 2 1
> > +
> > +    * - Macro name
> > +      - Synopsis
> > +      - Value
> > +    * - V4L2_COLOR_PATTERN_GRBG
> > +      - Raw Bayer, with alternating lines beginning with green, red pixels and
> > +        blue, green pixels.
> 
> I know what you mean, but it's a bit vague. Let's try to be more
> precise:
> 
>       - Bayer pattern with 2x2 macroblocks. Each macroblock stores pixels in
>         green, red, blue, green order.
> 
> Or even more precise
> 
>       - Bayer pattern with 2x2 macroblocks. Each macroblock has a green filter
>         in the top-left and bottom-right pixels, a red filter in the top-right
> 	pixel, and a blue filter in the bottom-left pixel.

The Bayer pattern indeed uses 2x2 blocks. Seems good to me. I modified it
slightly:

      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
        the top-left and bottom-right pixels, a red filter in the top-right
        pixel, and a blue filter in the bottom-left pixel.

> 
> > +      - 0
> > +    * - V4L2_COLOR_PATTERN_RGGB
> > +      - Raw Bayer, with alternating lines beginning with red, green pixels and
> > +        green, blue pixels.
> > +      - 1
> > +    * - V4L2_COLOR_PATTERN_BGGR
> > +      - Raw Bayer, with alternating lines beginning with blue, green pixels and
> > +        green, red pixels.
> > +      - 2
> > +    * - V4L2_COLOR_PATTERN_GBRG
> > +      - Raw Bayer, with alternating lines beginning with green, blue pixels and
> > +        red, green pixels.
> > +      - 3
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index 1a51b5c817f1..e77b4ad19737 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -3434,6 +3434,8 @@ organization is given as an example for the first pixel only.
> >  
> >      \endgroup
> >  
> > +.. _v4l2-mbus-pixelcode-generic-raw:
> > +
> 
> I'd move this to the patch that adds the raw formats. No big deal
> though.
> 
> >  Generic raw formats on serial interfaces
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >  
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index dd5f06546773..8119012c2638 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
> >  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> > +	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> >  
> 
> Shouldn't you also patch v4l2_ctrl_fill() ?

Yes.

> 
> >  	/* Image processing controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 3c0f6afe7500..e552f6655fd0 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1227,6 +1227,12 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> >  #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> >  
> > +#define V4L2_CID_COLOR_PATTERN			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> > +#define V4L2_COLOR_PATTERN_GRBG			0U
> > +#define V4L2_COLOR_PATTERN_RGGB			1U
> > +#define V4L2_COLOR_PATTERN_BGGR			2U
> > +#define V4L2_COLOR_PATTERN_GBRG			3U
> 
> How about V4L2_CID_CFA_PATTERN and V4L2_CFA_PATTERN_* ?

We've discussed this before. I think I'll switch, it makes sense for
consistency.

> 
> > +
> >  
> >  /* Image processing controls */
> >  
> 

-- 
Regards,

Sakari Ailus

