Return-Path: <linux-media+bounces-32560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7403AAB7FEA
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 10:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A91C4C6CEF
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 08:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FCD284677;
	Thu, 15 May 2025 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dUDGv7vZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38272242D61;
	Thu, 15 May 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296736; cv=none; b=jfcrhA4S6zNEGzmPTVVq7Wyo6fcKqG8qAlp16Br0Yq2IeXGq7EqhMOGoMwVfiwmJs8MbGdrqoyxLZPexEHvGXgQu1moWzzigTDKFJPfHaf33tLwcdzOST/3oaDq0a2eQiWgLaymX7FmG84EtgE99fBB5mUoITWD6/K7+Bb9IIlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296736; c=relaxed/simple;
	bh=ZYNEMGyD36IHAxRGu1f8xzobfHPSoGHbuMoH4zzbLVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB5MvrofHZVpUeerkjJtAzBkUFUnKwbo9sTADhmmTRGzW6jmN9EK4i0uooX5//I+uTOH1XJvdAvSA2Cl6lXGm0ASbkz1hQXvVRX9TJIHc8ipSWzAgBNw/1DqGZL/dcfyLebeaVNDEykSSOZ972JeEyZDejvyvrhD92PNSvD+pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dUDGv7vZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (mob-5-91-186-66.net.vodafone.it [5.91.186.66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6E91836;
	Thu, 15 May 2025 10:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747296716;
	bh=ZYNEMGyD36IHAxRGu1f8xzobfHPSoGHbuMoH4zzbLVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUDGv7vZMfBvj8wsRfoWIGCNeQA6UNLJYyXYKWSTyS1wurtwbn+D71AR2PZwTTxD9
	 9GMCysm6I6rgngEILwLaTL2Zy04n0W9dxOGWYJZw39DC8L6149RHX+d5cUq9UKwNG4
	 J7RTcL6zYTje8VsMf4rPLr9tsh0gq7L15oeLwccc=
Date: Thu, 15 May 2025 10:12:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: chenchangcheng <ccc194101@163.com>, hdegoede@redhat.com,
	mchehab@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v10] media: uvcvideo: Fix bandwidth issue for Alcor
 camera.
Message-ID: <20250515081202.GA8748@pendragon.ideasonboard.com>
References: <20250510061803.811433-1-ccc194101@163.com>
 <CANiDSCsXPgQZVtq9RL_TkXCAW9Bt3kMO3-cR4X8GZaQvmYCQyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsXPgQZVtq9RL_TkXCAW9Bt3kMO3-cR4X8GZaQvmYCQyA@mail.gmail.com>

On Wed, May 14, 2025 at 11:17:06AM +0200, Ricardo Ribalda wrote:
> Hi chenchangcheng
> 
> Thanks for your patience fixing the warnings from media-ci :)
> 
> Regards
> 
> On Sat, 10 May 2025 at 08:18, chenchangcheng <ccc194101@163.com> wrote:
> >
> > From: chenchangcheng <chenchangcheng@kylinos.cn>
> >
> > Some broken device return wrong dwMaxPayloadTransferSize fields
> > as follows:
> >     [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
> >     [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> >
> > When dwMaxPayloadTransferSize is greater than maxpsize,
> > it will prevent the camera from starting.
> > So use the bandwidth of maxpsize.
> >
> > Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>

> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e3567aeb0007..a74cf89852d1 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >
> >                 ctrl->dwMaxPayloadTransferSize = bandwidth;
> >         }
> > +
> > +       if (stream->intf->num_altsetting > 1 &&
> > +           ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
> > +               dev_warn_ratelimited(&stream->intf->dev,
> > +                                    "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> > +                                    ctrl->dwMaxPayloadTransferSize,
> 
> Minor nitpick. I am trying to standarize "UVC non compliance" header
> in the logs for this kind of things.
> 
> "UVC non compliance: the max payload transmission size (%d) exceededs
> the size of the ep max packet (%d). Using the max size.\n"

s/exceededs/exceeds/

I will also replauce %d with %u as both variables are unsigned.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +                                    stream->maxpsize);
> > +               ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> > +       }
> >  }
> >
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >
> > base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3

-- 
Regards,

Laurent Pinchart

