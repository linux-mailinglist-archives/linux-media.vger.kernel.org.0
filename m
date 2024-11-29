Return-Path: <linux-media+bounces-22373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EFB9DECFF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6045B22014
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 21:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A421A3AB1;
	Fri, 29 Nov 2024 21:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mhLw9FFp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81B15D5B6;
	Fri, 29 Nov 2024 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732916621; cv=none; b=jn939VGxhmCVwUpzB7xokZXeYP/6MQaA43xIqDZ5JA4bb5CZ0IgQJA/ulT8bPWJ7kJvZO/MTMaiLSgOJx2fllsbqLRaj2E9ca7dzYH3OgzJB6MRnXSHdvFRom1aaz/q2B+Z1PVSlqr6YiwNDt7Cso1/xCuy12fqvaFer8jkndbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732916621; c=relaxed/simple;
	bh=AWHNGl0Pc5zffzb8oOQnLIkTlLBEplWvEFRDgbx4ZHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiNswKMhS50/6BUVsdwKq1UDv8Hd0T6d0r3qP35a7TMMfAyszioVx8a78CMXv3dXke2zuhNFakDGkmk7t0xSjrIyF0Zsc9G8Gqn3a+i4UEFRCOB/Oh7OwsNwUZF+A3a+xhXyoT0EnzvvXa8Xggf/gVhrmgWMuG5NZc9kfICgc80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mhLw9FFp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AC43A57;
	Fri, 29 Nov 2024 22:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732916587;
	bh=AWHNGl0Pc5zffzb8oOQnLIkTlLBEplWvEFRDgbx4ZHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mhLw9FFpBKQ4mQAxlcZsg8GxgY7kILhTV5yJfMahRj/tWnVvZLbKgiqG0sGBhpJm4
	 9UPeIM9NJf+rHhu7ENqP29MlR4X1QW2C6YDhEWKk+0DB+opC1j9ybRkHTF9olKBbUE
	 GyMXuak6tANP9QFNsuf1MAGVJTiUOCIA8ffshg54=
Date: Fri, 29 Nov 2024 23:43:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Xiong Nandi <xndchn@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Use uvc_query_name in uvc_get_video_ctrl
Message-ID: <20241129214321.GB2652@pendragon.ideasonboard.com>
References: <20241129151723.48275-1-xndchn@gmail.com>
 <CANiDSCsFriCyQuF3aQ+mEeHERcaUPt45ZgVX2Wyfo2T6N3vS3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsFriCyQuF3aQ+mEeHERcaUPt45ZgVX2Wyfo2T6N3vS3g@mail.gmail.com>

On Fri, Nov 29, 2024 at 07:18:55PM +0100, Ricardo Ribalda wrote:
> On Fri, 29 Nov 2024 at 16:18, Xiong Nandi <xndchn@gmail.com> wrote:
> >
> > uvc_query_name was introduced to print query name in uvc_query_ctrl.
> > So we can also use it in uvc_get_video_ctrl.
> >
> > Signed-off-by: Xiong Nandi <xndchn@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e00f38dd07d9..93cacd2c8721 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -297,8 +297,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >                 goto out;
> >         } else if (ret != size) {
> >                 dev_err(&stream->intf->dev,
> > -                       "Failed to query (%u) UVC %s control : %d (exp. %u).\n",
> > -                       query, probe ? "probe" : "commit", ret, size);
> > +                       "Failed to query (%s) UVC %s control : %d (exp. %u).\n",
> > +                       uvc_query_name(query), probe ? "probe" : "commit", ret, size);
>
> nit: This is above 80 characters. Please move size to the next line,
> aligned to uvc_query_name

I can make that change when applying the patch, no need to send a new
version.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


> With that change:
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> >                 ret = (ret == -EPROTO) ? -EPROTO : -EIO;
> >                 goto out;
> >         }

-- 
Regards,

Laurent Pinchart

