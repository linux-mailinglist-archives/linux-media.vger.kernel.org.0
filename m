Return-Path: <linux-media+bounces-25917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF321A2EE8A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D688B3A2FC1
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 13:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D37722FF46;
	Mon, 10 Feb 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4JNHZ5h"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1B322FE13
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194788; cv=none; b=shLKeTtDnm3Za6X51/7RkME7en9H+/trOu66vwHeyqGmxHqZO+KfNaiRB6alQuU1mWk/cNO8ziPY2kKk2QQ2mIK53OiD3RzuTP5mNs70W2Q1tyhG1sUivYnuM3QmE9zaBiC9369Kh3JBvKeelHxKJmHqnF7gGizg7SxW5IwFaHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194788; c=relaxed/simple;
	bh=9ua91Ob8j7Je/66bADfWiljiP3CjDLPkKPySnq/GLGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXzgIvN4Kt+zU4ymrutd11fSfvb6aPjIXyvm4/0ngX7XSBnVBQNsxuNhHf5GBmE+HCNvDfTU6zfOgC4TgnpEX/qxH478gadGlBHfw7Df1cQgE9ubbXXfQXruiNSZn8IzK5mNkuBcmkrpeTJ1vB4CoV6J7ifTWyIynzGo/hOBXkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4JNHZ5h; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739194786; x=1770730786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9ua91Ob8j7Je/66bADfWiljiP3CjDLPkKPySnq/GLGU=;
  b=a4JNHZ5h6OyMne+e1DP+XD46iJ5wiB/9IRiCs0wFUvCyRL4+sh3LoWvv
   wLTWtjO9EwWzf9ySfhs0piAUzkbM8clCzZavLMTCbQf1XbgBZ5hGBWPW+
   UQ7PUzuS9S2LZAXO/CDLX/H4Sg1ttMDIuH4mLLVFFqkEddH4rM5Vpi81g
   3+iJzkvegoExhhC3ThoDqoDak8YmXfNkLTAd8zR9wZpDtefSAI2uGOBHd
   6xO+LgT3zZXCOppYPSSNBUwl/elmu7ZYjxx90YZUi55v7fw3pbsJS5See
   plUJNyb/zFgD46JoM3hkf+zCj8Klhpkbml8cHq7GoDAZbI5VT4Bj5ax3Q
   w==;
X-CSE-ConnectionGUID: 3pigkkcZSJinJDAfMBU5ow==
X-CSE-MsgGUID: 3q+Z/xYvTlybj3BcR+kJvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40043151"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="40043151"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 05:39:43 -0800
X-CSE-ConnectionGUID: dXe75pYTSbO4fKSzIc/zDw==
X-CSE-MsgGUID: SZC2Z2sqR5qMYdetzwMV6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112036335"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 05:39:37 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C29C411F8D9;
	Mon, 10 Feb 2025 15:39:33 +0200 (EET)
Date: Mon, 10 Feb 2025 13:39:33 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v5 07/15] media: uapi: Add V4L2_CID_COLOUR_PATTERN for
 describing colour patterns
Message-ID: <Z6oBlQo0rVOHXAw0@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-8-sakari.ailus@linux.intel.com>
 <d8ab166b-c0c1-4a29-81e3-91e02882f177@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8ab166b-c0c1-4a29-81e3-91e02882f177@nxp.com>

Hi Mirela,

Thank you for the review.

On Sun, Feb 09, 2025 at 07:14:37PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> sorry for my late response.
> 
> So, this control and the luma-only mbus code is expected to be used for all
> raw sensors? Or can raw sensors still use BGGR mbus codes without the color
> pattern control?

Once we have these merged, I'd expect new drivers to use common raw sensor
model (as long as it's suitable for the device) and the Yxx mbus codes and
these controls. I think it's fine to keep using the old pattern specific
mbus codes in addition to that.

> 
> I noted this is now read-only, is the intention that the user space will
> only query the current CFA pattern? In case the user space will want to
> change the CFA, is it expected to achieve it via V4L2_CID_HFLIP or/and
> V4L2_CID_VFLIP and/or crop?

Correct. The CFA pattern isn't directly changeable by the user space so
this is similar to existing pattern specific mbus codes.

> 
> What exactly is the V4L2_CID_COLOUR_PATTERN expected to report? Is it the
> sensor's native CFA pattern, or the current CFA pattern with the current
> flip & crop setting?

The native pattern which isn't affected by flipping or cropping. I'll add
it to the documentation here, too.

> 
> One more suggestion below.
> 
> On 03.02.2025 10:58, Sakari Ailus wrote:
> > Add V4L2_CID_COLOUR_PATTERN to tell the camera sensor's native colour
> > pattern.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
> >   drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  1 +
> >   include/uapi/linux/v4l2-controls.h                     |  6 ++++++
> >   3 files changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 71f23f131f97..fca729512b6f 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -92,3 +92,13 @@ Image Source Control IDs
> >       representing a gain of exactly 1.0. For example, if this default value
> >       is reported as being (say) 128, then a value of 192 would represent
> >       a gain of exactly 1.5.
> > +
> > +``V4L2_CID_COLOUR_PATTERN (integer)``
> > +    This control determines the colour components and pixel order in the
> > +    sensor's CFA (Colour Filter Array) when used in conjunction with
> > +    :ref:`luma-only mbus codes MEDIA_BUS_FMT_Yx_1Xx (where 'x' is the bit depth)
> > +    <v4l2-mbus-pixelcode-yuv8>` pixelformats.
> > +
> > +    This control may only be used on a V4L2 sub-device.
> > +
> > +    This is a read-only control.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 24c9c25e20d1..5b6a4a94f18f 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >          case V4L2_CID_TEST_PATTERN_BLUE:        return "Blue Pixel Value";
> >          case V4L2_CID_TEST_PATTERN_GREENB:      return "Green (Blue) Pixel Value";
> >          case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
> > +       case V4L2_CID_COLOUR_PATTERN:           return "Colour Pattern";
> > 
> >          /* Image processing controls */
> >          /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 731add75d9ee..8e761c38b995 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1214,6 +1214,12 @@ enum v4l2_jpeg_chroma_subsampling {
> >   #define V4L2_CID_UNIT_CELL_SIZE                        (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> >   #define V4L2_CID_NOTIFY_GAINS                  (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> > 
> > +#define V4L2_CID_COLOUR_PATTERN                        (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> > +#define V4L2_COLOUR_PATTERN_GRBG               0
> > +#define V4L2_COLOUR_PATTERN_RGGB               1
> > +#define V4L2_COLOUR_PATTERN_BGGR               2
> > +#define V4L2_COLOUR_PATTERN_GBRG               3
> > +
> 
> I see no pattern for RGB-Ir sensors.

Correct. Could you write a patch for that, please? :-)

I'll add more documentation to the above four patterns, that should be a
better starting point than this version.

> 
> For Omnivision ox05b1s RGB-Ir sensor for example, it has a 4x4 pattern, we
> would need something like:
> 
> B G R G...
> 
> G Ir G Ir...
> 
> R G B G...
> 
> G Ir G Ir...
> 
> V4L2_COLOUR_PATTERN_BGRGGIGIRGBGGIGI
> 
> And also 3 other combinations from mirror and flip:
> 
> V4L2_COLOUR_PATTERN_GRGBIGIGGBGRIGIG
> 
> V4L2_COLOUR_PATTERN_GIGIRGBGGIGIBGRG
> 
> V4L2_COLOUR_PATTERN_IGIGGBGRIGIGGRGB
> 
> 
> At which point we could have these patterns? Is it possible from the
> beginning, or should we add them at the time when there is at least a driver
> that needs them?
> 
> Also, another question, on which tree does this patch set apply?

They're all here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata-raw>.
It seems I forgot this from the cover page.

-- 
Kind regards,

Sakari Ailus

