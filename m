Return-Path: <linux-media+bounces-33401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D418DAC4114
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 921123AED5B
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AF720E70A;
	Mon, 26 May 2025 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZSlUmImI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B351F37D4;
	Mon, 26 May 2025 14:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268812; cv=none; b=dTUh6kbB3jiJsTB9NnRCl9WE7H4x/VOQEkO4guCqfEeNCwybXNl3wpkQQKipDY0URbEGqAY9tquaXCan/gGalIH+MVDNFR+Xea8SlW5kOjQiKWNZ13WjQGVCb3Qxbnmf0jzVByQJLQvOcdRMNRlmS3h0ZA+d1gmUrCsYUL7Hw6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268812; c=relaxed/simple;
	bh=RfOzpjQyx5CF5y4v62KF88B1iYfZaFwCnC7uIMdlFKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGzv4D/Rg6iIB0WzltgHiiHfMk3VRm65C6V7l5CintGyuMFKWxry8r5jpUKFwuQlXImOAm0ep0FZkH1EVoPHzmn+YE7op0UPOavvj3RowkybdMYlRbWw4jQwL/lkX6yHwbTJeAxpuz+OrnvMkji/L706wBA5sQWscGMt1m48YV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZSlUmImI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BAD7743;
	Mon, 26 May 2025 16:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748268784;
	bh=RfOzpjQyx5CF5y4v62KF88B1iYfZaFwCnC7uIMdlFKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSlUmImITcHygktdRLQLpoApXk0GjqO0wVOKgXdSY2bxdMiXtI7RH+0Wlfln5hxck
	 shVUOzZDPWJFKoeuWHXQ4wuRZSEkuULuwko3eeLK8ChKipuLOMmXAfjRwEOl0PLD4O
	 MbAIreXkJkUbnAphO18C5mrZJMwG/beoysi0Buwg=
Date: Mon, 26 May 2025 16:13:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] media: Documentation: Add note about UVCH length
 field
Message-ID: <20250526141323.GQ17743@pendragon.ideasonboard.com>
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org>
 <20250526134946.GN17743@pendragon.ideasonboard.com>
 <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvPG_3qc4Emhat=NdRZXsmNDD0pwh182bXDFK2TgYN_ug@mail.gmail.com>

On Mon, May 26, 2025 at 04:04:03PM +0200, Ricardo Ribalda wrote:
> On Mon, 26 May 2025 at 15:49, Laurent Pinchart wrote:
> > On Fri, Apr 04, 2025 at 06:37:35AM +0000, Ricardo Ribalda wrote:
> > > The documentation currently describes the UVC length field as the "length
> > > of the rest of the block", which can be misleading. The driver limits the
> > > data copied to a maximum of 12 bytes.
> > >
> > > This change adds a clarifying sentence to the documentation to make this
> > > restriction explicit.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
> > > --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> > > @@ -44,7 +44,9 @@ Each individual block contains the following fields:
> > >          them
> > >      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
> > >      * - __u8 length;
> > > -      - length of the rest of the block, including this field
> > > +      - length of the rest of the block, including this field. Please note that
> > > +        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
> >
> > "the this value" looks like a typo.
> 
> Thanks! Will fix in v2
> 
> >
> > > +        never copy more than 2-12 bytes.
> >
> > Are you saying here that length can be larger than 12, but only up to 12
> > bytes will be copied (when both SCR and PTS are present) ? If that's the
> > case, it would be better to fix the driver to clamp the length value to
> > the number of bytes actually present in the buffer.
> 
> As the documentation says, this is an exact copy of the UVC payload header.
> 
> Assuming SCR and PTS, for devices that have metadata length will be
> the real length provided by the hardware. but buf[] will only contain
> 12 bytes.
> 
> Replacing the value of length with the actual value will be a uAPI
> breakage. I do not think that is a very good idea to change it,
> considering that this number is used by parsers.

Do you think there could be userspace code that relies on the value
being larger than 12, even though the metadata after the standard UVC
block isn't present in the buffer ? Are you aware of any particular
implementation of such userspace code ?

> > >      * - __u8 flags;
> > >        - Flags, indicating presence of other standard UVC fields
> > >      * - __u8 buf[];

-- 
Regards,

Laurent Pinchart

