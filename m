Return-Path: <linux-media+bounces-48966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96111CC6996
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 09:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0DF23005013
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499B6346E43;
	Wed, 17 Dec 2025 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c2+C/CkF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52868346AF0;
	Wed, 17 Dec 2025 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959112; cv=none; b=V5QbWSk2ZZmQ1GodaP3PQvS5HhZw0XgCu3RCOXiG8dk1QsyDOduAbPrQ2zHTOgql0G/BJKMkYP2IfAfXWnKktEfZd40mDcPBsy/apS9EG9B0N7Pc1FY3GWrT5xJ5Q4zAl8n0pHmwJ5k3bN+x50lYc1zbG1gJf1/ND7HAo3vVp9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959112; c=relaxed/simple;
	bh=U3Iy/3gGhJygfWOumubPy3GDp/6XoN1C5xkWx0P7nyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bg+7P3oNRIj4Lr6x5TqLxOGHsfG8l9KdfQUroI0SLD9QtgCHCAW4kCVbx9LmzALaMQ//xcnf8L6DmR43mjILHzry0jEUX/NU6lSj7wAV1R7+q0GqbE3bIyQPEOpcWdlWXr9NWzmRxD7wmdCStLgil+7aD0dT4WotrzUWIkorIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c2+C/CkF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 394EF324;
	Wed, 17 Dec 2025 09:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765959102;
	bh=U3Iy/3gGhJygfWOumubPy3GDp/6XoN1C5xkWx0P7nyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2+C/CkFV26iVH6E9LA6i1bWWEQG8deGOdN1v46du86Vy2afHh38TtXZTQkS/BYyW
	 pu7sFzkTHN9Vohe1BsSetNC6TLGxIsvHBGWx/ZsiAzy2NmRhRV/O9eNHvCQFreT8aA
	 H08p/haTvKlDsaoQZ5UEFuu34BrHbSZo/7hQbpHc=
Date: Wed, 17 Dec 2025 09:11:45 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: media: mali-c55: Use v4l2-isp version
 identifier
Message-ID: <5ofqq3rgst3vlynls46nqwngkmzanxpe6mnbbv25oj2khr26ux@qkbp32ajgswn>
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
 <qHuyxg4frFKDSJM4RD1PqtVx7G5pItw_7wb2dRhy0G61Mis29jlLftxor8AgitMdn3wdzpzsKMEgM-cSxWaemQ==@protonmail.internalid>
 <20251215-mali-c55-header-update-for-v6-19-rc1-v1-1-69f56dee3c71@ideasonboard.com>
 <6e62636b-5164-4386-9782-3e8197683e43@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e62636b-5164-4386-9782-3e8197683e43@nxsw.ie>

Hi Brian

On Tue, Dec 16, 2025 at 12:38:16PM +0000, Bryan O'Donoghue wrote:
> On 15/12/2025 13:20, Jacopo Mondi wrote:
> > The Mali C55 driver uses the v4l2-isp framework, which defines its own
> > versioning numbers.
> >
> > Do not use the Mali C55 specific version identifier in the code example
> > in the documentation of the Mali C55 stats and params metadata formats.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> > index 696e0a645a7e0566921a3e9db3226b76d402f909..f8029bcb528283cddb1ea854b25469af97ecfa54 100644
> > --- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> > @@ -44,7 +44,7 @@ member and userspace must populate the type member with a value from
> >   	struct v4l2_isp_params_buffer *params =
> >   		(struct v4l2_isp_params_buffer *)buffer;
> >
> > -	params->version = MALI_C55_PARAM_BUFFER_V1;
> > +	params->version = V4L2_ISP_PARAMS_VERSION_V1;
> >   	params->data_size = 0;
> >
> >   	void *data = (void *)params->data;
> >
> > --
> > 2.52.0
> >
> >
>
> Feels like this should have a Fixes tag.

I want this collected for v6.19, the same release the driver will be
collected in. Is it worth a Fixes and a cc to Stable if this patch
and the driver that it "fixes" land in the same release ?

>
> ---
> bod

