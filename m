Return-Path: <linux-media+bounces-11828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F78CD86B
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 18:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09E561C210BD
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 16:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FEF20DFF;
	Thu, 23 May 2024 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="gVf38LB9"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AACBAD31
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716481859; cv=pass; b=ECKveH2NSapK28N/SQx9DnASr/05h01kI8RBQf/4jRpO5VM9L5zCbQ1HioDHr6FeRbtd/HiXI86MPKg8pW0yUuNYd3Qmmli0ycNcOKf5JiIQWr8eT/D9QImlItTU1lVn/Yur5o64UHFs9BnnledyQqCR8SZcCPQvAmsi0O4DcwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716481859; c=relaxed/simple;
	bh=vfLmOSkool9m+OGZr9iMGtbMjcueZ+iOio1ps1t/nPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAYs7aDaObmpsda7NhTfTZgfmNHJjJve6JBrigvCQSPRTdf+1euwJiFdEgS64XUvGTysukvLbNlgBvsE0YuFsGPE5NzhvvYBUXvpaKefKOYkdzeKHURWibBvdRuEvRMlm31AKtTrJ7hV1XOAEQwI6oWU5qBHvf/jtxtJR5kGMps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=gVf38LB9; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VlYZP4yPtzyQq;
	Thu, 23 May 2024 19:30:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716481854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7Q5nwDnSyQxp+N6Ev6qYSC6RJDppjssYFKBI0fWYxc=;
	b=gVf38LB9+d5n5X/bQ6xZRMG1AMwk4TB4vM0Ftk9kSYVrnVoIMeozOCBkMshlW4LNwVl796
	9B0JQRLPu82nGhlhw31q2D0NtDzBzJBj+106Tn2fjXSPGx4/SCx2IGfYzoeMBnvuf2Qehm
	4nZ4MgBS2UaWHtm84QAudZfVoSDAm2U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716481854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7Q5nwDnSyQxp+N6Ev6qYSC6RJDppjssYFKBI0fWYxc=;
	b=U2E2U2vfPTnWZUVHdnkFCGV/Lrcurl6V7wSJO039Z5+gZ8aMMg0GphEudDxtBrU1wML5n/
	KlC6iy2s4MY1smAZPV7py0yG0vbhYS3OiB0k6FYr7u7hlW7Jkrt5F7V43ixMiguoUlfeko
	muSesJYO5Cczrn135Twdq4tZVexgd7c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716481854; a=rsa-sha256; cv=none;
	b=NZgQY0sjPwTmOAqn0EdgfsbF/eWcUs6EA3EgLwPBDkvEpKVzawopOjyblUJj8TZ1YOASk7
	fTcnw+ouHHzwlq8lC4TQrlUjX/NkAlMZX3jD8d+AWKUk58LO6TfjJi4NpcyhtAezMihFk3
	gzGGLJrLeisiYKYWz53baACMyo7g8MA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5C4FE634C94;
	Thu, 23 May 2024 19:28:13 +0300 (EEST)
Date: Thu, 23 May 2024 16:28:12 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 1/7] media: uapi: pixfmt-luma: Document MIPI CSI-2
 packing
Message-ID: <Zk9unKvWO6RpQ73X@valkosipuli.retiisi.eu>
References: <20240502110503.38412-1-jacopo.mondi@ideasonboard.com>
 <20240502110503.38412-2-jacopo.mondi@ideasonboard.com>
 <Zk8eo4OZs8gu_k2Q@valkosipuli.retiisi.eu>
 <20240523105722.GG6640@pendragon.ideasonboard.com>
 <Zk8hBTLghjVAOaG-@valkosipuli.retiisi.eu>
 <35fwbp2fr5kaxqg3qey2cz7nwwlhzf4s5euo3zm4dkimrztzru@peabkvwqsblq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35fwbp2fr5kaxqg3qey2cz7nwwlhzf4s5euo3zm4dkimrztzru@peabkvwqsblq>

Hi Jacopo,

On Thu, May 23, 2024 at 03:22:56PM +0200, Jacopo Mondi wrote:
> Hi Sakari, Laurent
> 
> On Thu, May 23, 2024 at 10:57:09AM GMT, Sakari Ailus wrote:
> > On Thu, May 23, 2024 at 01:57:22PM +0300, Laurent Pinchart wrote:
> > > On Thu, May 23, 2024 at 10:46:59AM +0000, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Thu, May 02, 2024 at 01:04:56PM +0200, Jacopo Mondi wrote:
> > > > > The Y10P, Y12P and Y14P format variants are packed according to
> > > > > the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
> > > > > specification. Document it.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > ---
> > > > >  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > > index b3c5779521d8..f02e6cf3516a 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > > > @@ -209,3 +209,7 @@ are often referred to as greyscale formats.
> > > > >      For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
> > > > >      padding zeros in the 4 low bits, in contrast to the Y12 format, which has
> > > > >      its padding located in the most significant bits of the 16 bit word.
> > > > > +
> > > > > +    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
> > > > > +    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
> > > > > +    specification.
> > > >
> > > > The CSI-2 specification isn't publicly available. I think you'll need to
> > > > add similar examples of the packing the packed raw formats have.
> 
> Don't we have the packaging examples in the tables already ? In
> mainline already for 10P and introduced by:
> 
> adb1d4655e53 ("media: v4l: Add V4L2-PIX-FMT-Y14P format")
> 181047763040 ("media: v4l: Add V4L2-PIX-FMT-Y12P format")
> 
> in the media staging tree.

I missed we had these already defined and thought this was all the
documentation there was. Ok, this is fine then.

It'd be nice to merge the packing documentations but it doesn't have to be
in this set IMO.

-- 
Regards,

Sakari Ailus

