Return-Path: <linux-media+bounces-26958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D706A441D1
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 15:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFAF2188337E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 14:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D24126AA9B;
	Tue, 25 Feb 2025 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N1q6kuDK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F1F269CF5;
	Tue, 25 Feb 2025 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492336; cv=none; b=nD3EXju4l/zaCo1VRJrr1DkjspsuwYUowBkVtvMAzoPHSlCsBwFbRBUyP6pLn94C4afiuYl9hi6ILKyQvjY9CIf8ZQHFr0/IO4EyY+5phTFW5ribZTH2nMcYmWXd2Mmr/IOCx0NObyiXgY7diUj3VBC/U7CePLFT8amjj/oLrF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492336; c=relaxed/simple;
	bh=SrlaSBpwPqmnPKBwwpLbhryOe+dfDdFe+sPMj9Vemu4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uVEMim/o0uyfyNqKmRzE/OvRQq0MVp6TeJqmcPLDjt1O2cPquQXDhkYbE/7F817q5nbtmbtll9h4iEWTKxTUP8dLX8YONNlimKak8bFmYnqpsEjJdjErxMpagbi3yMWwTYxkG7T1mgv5gU+/bGOse2C010twefZ5Wk+tmUOSZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N1q6kuDK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740492331;
	bh=SrlaSBpwPqmnPKBwwpLbhryOe+dfDdFe+sPMj9Vemu4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=N1q6kuDK+8ntA0AaElI0VJl2/OzVvACcjDQ/P2V6svRV3s3WHMve5JiVdUTd80Qnr
	 K58KBSM2Qb7dmqKHwGdQaEiK3UWwswphxj1skJWk1RbYRl4Fj7bXE/qs/9fgEg50J1
	 BUP3XOGCQjOG8C/VDC0iKES/YCq/oVsixPwtuRDOfp3wtG2gZxbKZOIkh59FjX7prU
	 k5WwdWnA5MuwVDcYr2pkAGTOoAABa8gLQTvBDrGUiJ4VFzdwQHUOpvoXn2UXoNOzgs
	 47beLJVO33KZ7Qr8qaSaU7DXYtnjHXjT2fRY6GwNfwkZe2dUs3zweivyihBuC63lEM
	 Y9DZpkTydLIRA==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4453317E09B5;
	Tue, 25 Feb 2025 15:05:29 +0100 (CET)
Message-ID: <808a9d14be9c8de25e2ba5232ee01f874acb66b6.camel@collabora.com>
Subject: Re: [PATCH] fixup! media: v4l2-common: Add helpers to calculate
 bytesperline and sizeimage
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Boris Brezillon
 <boris.brezillon@collabora.com>, linux-media <linux-media@vger.kernel.org>,
 linux-kernel	 <linux-kernel@vger.kernel.org>, linux-rockchip	
 <linux-rockchip@lists.infradead.org>, linux-staging	
 <linux-staging@lists.linux.dev>, Mauro Carvalho Chehab	
 <mchehab+huawei@kernel.org>, Alex Bee <knaerzche@gmail.com>, Benjamin
 Gaignard	 <benjamin.gaignard@collabora.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Jonas Karlman <jonas@kwiboo.se>
Date: Tue, 25 Feb 2025 09:05:27 -0500
In-Reply-To: <795082c4-499f-4935-b580-72b01d82fe1b@xs4all.nl>
References: 
	<20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
	 <20250225124008.195405-1-sebastian.fricke@collabora.com>
	 <1953d249c3c.d1d6678f34821.5333341344528638254@collabora.com>
	 <795082c4-499f-4935-b580-72b01d82fe1b@xs4all.nl>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mardi 25 février 2025 à 13:50 +0100, Hans Verkuil a écrit :
> On 2/25/25 13:46, Sebastian Fricke wrote:
> > Hey,
> > 
> > sorry about missing this in the patch series, if you don't like the
> > fixup path, then I can send a new patch series as well.
> > I just thought the change was minor enough and addressed the final
> > comments.
> 
> Ah, this relates to patch 01/12 of this patch series:
> 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=14577
> 
> Next time it might be better to just reply to the offending patch
> with the fixup.
> 
> That way it is clear for the maintainer what the fixup is for.

I believe you could have used:

  git send-email -in-reply-to=9db356bd-4d71-4975-91c6-7435bee8aef3@xs4all.nl <somepatch>

To make that a reply.

cheers,
Nicolas
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Regards,
> > Sebastian
> > 
> >  ---- On Tue, 25 Feb 2025 13:40:08 +0100  Sebastian Fricke
> > <sebastian.fricke@collabora.com> wrote --- 
> >  > ---
> >  >  drivers/media/v4l2-core/v4l2-common.c | 2 +-
> >  >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  > 
> >  > diff --git a/drivers/media/v4l2-core/v4l2-common.c
> > b/drivers/media/v4l2-core/v4l2-common.c
> >  > index 07a999f75755..aa86b8c6aa75 100644
> >  > --- a/drivers/media/v4l2-core/v4l2-common.c
> >  > +++ b/drivers/media/v4l2-core/v4l2-common.c
> >  > @@ -360,7 +360,7 @@ static inline unsigned int
> > v4l2_format_block_height(const struct v4l2_format_inf
> >  >  }
> >  >  
> >  >  static inline unsigned int v4l2_format_plane_stride(const
> > struct v4l2_format_info *info, int plane,
> >  > -                           unsigned int width)
> >  > +                            unsigned int width)
> >  >  {
> >  >      unsigned int hdiv = plane ? info->hdiv : 1;
> >  >      unsigned int aligned_width =
> >  > -- 
> >  > 2.25.1
> >  > 
> >  > 
> > 
> 

-- 
Nicolas Dufresne
Principal Engineer at Collabora

