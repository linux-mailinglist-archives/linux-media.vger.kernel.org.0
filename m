Return-Path: <linux-media+bounces-40856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA0B335EA
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B95A67A5683
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 05:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8797F274B35;
	Mon, 25 Aug 2025 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFwrdK9x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AFAF9CB;
	Mon, 25 Aug 2025 05:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756100920; cv=none; b=DYbYME74+Wj0vhPMY9vQfe23Ncb8S6zIMZfqkRpGsaEFzLU+lrcEuefrwlUUFW5q5YGVjfql6skaSKZDIWk+zYicwTLVUC8C/Xl0v3MQAzPUJt85BeCwZKaHSeMlSrY5LR+oxCBplkRMEf5hyprUazl2wkVuaRFoNTlsbWqoFFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756100920; c=relaxed/simple;
	bh=Jau+FjbOfy7Vl+xOE9VJa+DMB+eQb+pmr32ecZWVjsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWwnXTdwxFWwplwfCuXazXv3KgDALG8EWtVWbDPZL8+sX9+6cVmm5rmSozpUXzKIQKWtWbw6PIcy6KquQbJh1MXVOToxVNHmZZnLwdfNNcH+k8hLBG6jv31ZIKOelr7I6lkQEKjgbcNpOsOkPEi0sYu3HUacWktJPw4SZTrSEvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFwrdK9x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756100918; x=1787636918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Jau+FjbOfy7Vl+xOE9VJa+DMB+eQb+pmr32ecZWVjsU=;
  b=aFwrdK9xbGYlMHfgHK3MlJd97A/7Zye/mTOtyPbjQqMM+gTzjjuqXmys
   MukSrg7eT9ISLkt0mc9FJAUyirlkurz3Bq0gbD7Li0/9X5e+v9Hhn/rms
   sXVvfZkFKR2F26dU58J611RlOSzWwkeVxCvqsQZ7opf6QqphqGiJlkQvs
   uRcFBkHseyNwP/pebwNBX8cwoKGqXckunhzAsgVRQs34b59IWzgzx8Sux
   WGhFvVqJsOwdErXP3LwdjHx3T2GW5MCoTDJzTLTMqbu5KjAxbDwKm0gIy
   EbrLY+oRidwzdmBqT28oYg+gwx6Mt9HqheMn16A9K8oxmsaD2PKNKl64w
   w==;
X-CSE-ConnectionGUID: GDpoRBcHQpqU4N0qllzAJQ==
X-CSE-MsgGUID: fD/UmzMPTh6tci5A2oVIAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="68900439"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68900439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 22:48:37 -0700
X-CSE-ConnectionGUID: inir8pOrQie6HNXlUdaVng==
X-CSE-MsgGUID: X1PuEl9VQ+qzvjbI5xM1qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="174511206"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 22:48:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2295D12023C;
	Mon, 25 Aug 2025 08:48:31 +0300 (EEST)
Date: Mon, 25 Aug 2025 08:48:31 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 03/11] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Message-ID: <aKv5LyZHoO1F3pMp@kekkonen.localdomain>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
 <20250716-ov9282-flash-strobe-v6-3-934f12aeff33@linux.dev>
 <aKv3uUXf87im8ajX@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKv3uUXf87im8ajX@kekkonen.localdomain>

On Mon, Aug 25, 2025 at 08:42:19AM +0300, Sakari Ailus wrote:
> Hi Richard,
> 
> Thanks for the update (and for the ping!).
> 
> On Wed, Jul 16, 2025 at 11:06:53AM +0200, Richard Leitner wrote:
> > Add the new strobe_duration control to v4l uAPI documentation.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > index d22c5efb806a183a3ad67ec3e6550b002a51659a..03a58ef94be7c870f55d5a9bb09503995dbfb402 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > @@ -186,3 +186,8 @@ Flash Control IDs
> >      charged before strobing. LED flashes often require a cooldown period
> >      after strobe during which another strobe will not be possible. This
> >      is a read-only control.
> > +
> > +``V4L2_CID_FLASH_DURATION (integer)``
> > +    Duration the flash should be on when the flash LED is in flash mode
> > +    (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (µs)
> > +    if possible.
> > 
> 
> I think we should add this is related to the hardware strobe.
> 
> How about:
> 
> ``V4L2_CID_FLASH_DURATION (integer)``
> 
>     Duration of the flash strobe from the strobe source, typically a camera
>     sensor. Controlling the flash LED strobe length this way requires that the
>     flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>` is set
>     to ``V4L2_FLASH_LED_MODE_FLASH`` and :ref:`strobe source
>     <v4l2-cid-strobe-source>` is set to ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.
>     The unit should be microseconds (µs) if possible.

Also adding a reference to V4L2_CID_FLASH_HW_STROBE_SIGNAL:

``V4L2_CID_FLASH_DURATION (integer)``
    Duration of the flash strobe from the strobe source, typically a camera
    sensor. Controlling the flash LED strobe length this way requires that the
    strobe source's :ref:`V4L2_CID_FLASH_HW_STROBE_SIGNAL
    <v4l2-cid-flash-hw-strobe>` is enabled and flash LED driver's :ref:`flash
    LED mode <v4l2-cid-flash-led-mode>` is set to ``V4L2_FLASH_LED_MODE_FLASH``
    and :ref:`strobe source <v4l2-cid-strobe-source>` is set to
    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
    if possible.

Similarly, the documentation for V4L2_CID_FLASH_HW_STROBE_SIGNAL should be
amended with a reference, but the label needs to exist first. I think you
could merge the two documentation patches to make this easier.

-- 
Sakari Ailus

