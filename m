Return-Path: <linux-media+bounces-34482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851CAD44CD
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 23:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B2B417B7EC
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 21:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8994A284691;
	Tue, 10 Jun 2025 21:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CCXCdvx2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D862459C5;
	Tue, 10 Jun 2025 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749591075; cv=none; b=ONo4oqmklX2Bkyh1QvOTJWDoGPvciEAGpZ4qBI3MJKqsWd1FDoSMSzYnJeNfgWMjchzkSucbmH3Aa5yetjhg+QsQoQzpx4vFdEMTWcm/0hzW4XkDlbTnBoBNvb9qVhcstFgP2WZzy3xY4+MFMLDJKMizfl/A3NhVabk7y/JBB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749591075; c=relaxed/simple;
	bh=m+IPDklJ6ZBJt0284tsk4m7+eoXQgRpTQRB8/GXnw4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj0EU18VVpeS2A0y/LgSB2V29ZXIdGhskWhcFUQFDoVsW3JhByJ69bdqNaaRVj8+Cyl/rEknoboWFfP/qf8IF1HpLRoFPB6Zjv9O5INLqaUQ4gSiR1xw/TWbqiF1Gxp6yrSsVrbxJrD6Iur1cUKo7fA7SO7OmcMUTGVLIvrNhYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CCXCdvx2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E11C9E8A;
	Tue, 10 Jun 2025 23:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749591064;
	bh=m+IPDklJ6ZBJt0284tsk4m7+eoXQgRpTQRB8/GXnw4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCXCdvx24YV8Kba9V27F28YyhKUebzbTHDx5DqwoODUvMoUCqfEFgVtGZlu8UWxAu
	 tKnzWEY9W6aK7QD8SBtnU7qBl3rPDtJ1fJuAEEFaO37fnUqJKeLf++aGkMGtTR86Tl
	 +aCQLQLjEKZZlOaQ+qRwgMqVwGeyukcytans86GY=
Date: Wed, 11 Jun 2025 00:30:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Youngjun Lee <yjjuny.lee@samsung.com>, hdegoede@redhat.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Message-ID: <20250610213058.GG24465@pendragon.ideasonboard.com>
References: <CGME20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179@epcas1p1.samsung.com>
 <20250610124107.37360-1-yjjuny.lee@samsung.com>
 <CANiDSCsaQCJCzfjjnMvVRAde0ZrMZC753y7m2MPQJuK=dVqQBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsaQCJCzfjjnMvVRAde0ZrMZC753y7m2MPQJuK=dVqQBQ@mail.gmail.com>

On Tue, Jun 10, 2025 at 02:58:25PM +0200, Ricardo Ribalda wrote:
> Hi Youngjun
> 
> You still miss the v2 (v3 in this case). and the trailers.
> 
> In the future you can use the b4 tool to take care of most of the details.
> https://b4.docs.kernel.org/en/latest/contributor/overview.html
> It has "dry-run" option that let you review the mails before you send
> them to the mailing list
> 
> Please do not resubmit a new patch to fix this, only send a new patch
> to fix more comments for other people.
> 
> Regards!
> 
> On Tue, 10 Jun 2025 at 14:41, Youngjun Lee <yjjuny.lee@samsung.com> wrote:
> >
> > The buffer length check before calling uvc_parse_format() only ensured
> > that the buffer has at least 3 bytes (buflen > 2), buf the function
> > accesses buffer[3], requiring at least 4 bytes.
> >
> > This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.
> >
> > Fix it by checking that the buffer has at least 4 bytes in
> > uvc_parse_format().
>
> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index da24a655ab68..1100469a83a2 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
> >         u8 ftype;
> >         int ret;
> >
> > +       if (buflen < 4)
> > +               return -EINVAL;
> > +
> >         format->type = buffer[2];
> >         format->index = buffer[3];
> >         format->frames = frames;

-- 
Regards,

Laurent Pinchart

