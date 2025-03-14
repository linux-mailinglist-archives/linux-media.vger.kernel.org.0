Return-Path: <linux-media+bounces-28206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6887CA60EDB
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 11:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F0AB16EBA9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B861F4611;
	Fri, 14 Mar 2025 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aFGkEckF"
X-Original-To: linux-media@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B031DF98D
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741948131; cv=none; b=oV9gAKQz8RuokqBOi+ZlvR+JnSIEWc7GqR8QxAhvI3gz7/Mt31ejjKNjoRgkKRHWz02l2foVCCbhBTp9kFvhmEdk9curiKIY6+dwKTHMKiDvzDq23rWKzJy6pdUzbFXiC775oExLWVDhfyOcI2q5TL/FPE34sDkkwtMDDC+URGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741948131; c=relaxed/simple;
	bh=Ww0dcPpkEc4ly+HW56/GyU96/h2FBdYdV9rxKd8ebKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdd6ZUNBG4GW3vMx4jU7rFK7iIM41BL9Kpqeb6ij5TVzcajKMjKpJN5npcHrKiS17OO8/C668dRRP9kq2RCJYvRP/8/fi+WkMs/63J8cQhtxqgvRA03kYR6Ubn9C9mnu7iLalfNDyUWLEV/qRAjLoYA0W8ZTx9K/KisH1XfSOmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aFGkEckF; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 14 Mar 2025 11:28:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741948117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGXzjo3+xT8L1j9EZ6PfRrVW8iKnbI1bkQ43mT99qKI=;
	b=aFGkEckFxmOPtmk+8K4U3SF/zALpM/acuLFdFkBoShtw+VP8FDSYFvmYwHsxYXvAvcoh85
	Z/qiXZU6g8XWx0P241dGhKfRN/fbJhj7uUYAEcgXkdcS6fsAUF3uQHIFTRc2luW93RUbGA
	s5yQNogBS79uQluRgIMJDQHedO/zPI4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 4/8] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Message-ID: <4w7s6g32rol2ptkchczhyhgvytyeq6baqvz4h7ikurzg2tygnr@a3q7cgeagzk4>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-4-14d7a281342d@linux.dev>
 <d14b8c18-55b9-472c-897d-3a481892b080@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d14b8c18-55b9-472c-897d-3a481892b080@xs4all.nl>
X-Migadu-Flow: FLOW_OUT

Hi Hans,

thanks for your quick feedback!

On Fri, Mar 14, 2025 at 10:41:04AM +0100, Hans Verkuil wrote:
> On 14/03/2025 09:49, Richard Leitner wrote:
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
> If this control is present, does that mean that the flash duration always have
> to be set manually? Or can there be an 'Auto' mode as well? And if so, how is
> that set?

To be honest I haven't thought about automatic flash duration. Is this
something which is required?

At least for the ov9282 sensor (which I've implemented this control for
in this series) there is no "auto" mode AFAIK.

If it's required: What would be the best solution?
Extending V4L2_CID_FLASH_LED_MODE with a new menu option? E.g.
V4L2_FLASH_LED_MODE_FLASH_{MANUAL,AUTO}?

> 
> Regards,
> 
> 	Hans

Thanks!
Richard

