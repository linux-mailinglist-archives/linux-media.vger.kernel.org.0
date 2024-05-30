Return-Path: <linux-media+bounces-12247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99D8D4CBD
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFF771F216BA
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C269617D894;
	Thu, 30 May 2024 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LVaK4Eiv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E894D8DC;
	Thu, 30 May 2024 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075666; cv=none; b=RdfY7OMi2IBV9vcIzkg5JJiflK+UADuZ6/Y7Dkkvih6QRmJBPQ86p9uL9CIlTIjqHQlO0K8YRYHiJoYu/YiGAdp7oZDfQpzAtvLQAyukB38RODiodpEO9THTT1GLM2eJQi73A5njIcp+kOqmTadSbbrXDq/nOKC5/PPsKFbUupE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075666; c=relaxed/simple;
	bh=PHPuS2J+7xBC0BiqUcSlL68OxsjZAIIuP7hIyQRM/c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udeyxYVSchiAhK2VpvldakeVDzZ/mBvtQd9hmIIVlWUPc/pe/Mvqh2tZwT0ywafRU8BKYMmJujpz2IvmA+uT+7PlItWbUrq+R7P1z6YkroZLrxL0W6/Kn27EWN6VMBtV+jfBVroZd5HNyBN8dFwqXfJGqXRO9DyZmS4Z9LVTZGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LVaK4Eiv; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=xT0O4aqrdXr5HDwJnQtSy2hPrSIlaHuXNc1nm5VatFw=; b=LVaK4Eivl6L/t3GK
	0wvlvxY04bVTjWSpud+pDw/qHHG0wTOBRnyEwcGH0RWWSexY+4IV1YE9nIbYDJv/vHVnCiusJdjOE
	u0/Xz8MTkgk+KjetGCIDUHnmokFcF6D0li5/rtFDHpKWY/VSHDRh97JCAnBZuo8ZpzafU1zXzRdha
	bHBbyDBoNnzZbx8H312awGRXHU10MQ7KNXMCzas6hTPYfp5KhjCzYeREn44FP1haPAeHVIHCDwMpq
	jyI2AySBEZuwESNgtyvM9FUwx4omTdGJasLaEQli9CjAxWnrEEB1QWefQqOgutM2HZ5u6Wj2Q2ikD
	lZtig9bHOZX3TxEDaw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sCfoi-003N8v-2B;
	Thu, 30 May 2024 13:27:40 +0000
Date: Thu, 30 May 2024 13:27:40 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, ming.qian@nxp.com, eagle.zhou@nxp.com,
	digetx@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: tegra-vde: remove unused struct
 'tegra_vde_h264_frame'
Message-ID: <Zlh-zGV7U5rheUbY@gallifrey>
References: <20240525000146.282500-1-linux@treblig.org>
 <20240525000146.282500-4-linux@treblig.org>
 <4496bc6e-e5c0-4f86-b9c1-37ad2d2b687d@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <4496bc6e-e5c0-4f86-b9c1-37ad2d2b687d@xs4all.nl>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:27:10 up 22 days, 41 min,  1 user,  load average: 0.00, 0.03,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Hans Verkuil (hverkuil@xs4all.nl) wrote:
> On 25/05/2024 02:01, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > 'tegra_vde_h264_frame' has been unused since
> > commit 313db7d235a0 ("media: staging: tegra-vde: Remove legacy UAPI
> > support").
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/media/platform/nvidia/tegra-vde/h264.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
> > index cfea5572a1b8..d8812fc06c67 100644
> > --- a/drivers/media/platform/nvidia/tegra-vde/h264.c
> > +++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
> > @@ -19,11 +19,6 @@
> >  #define FLAG_B_FRAME		0x1
> >  #define FLAG_REFERENCE		0x2
> >  
> > -struct tegra_vde_h264_frame {
> > -	unsigned int frame_num;
> > -	unsigned int flags;
> > -};
> > -
> >  struct tegra_vde_h264_decoder_ctx {
> >  	unsigned int dpb_frames_nb;
> >  	unsigned int dpb_ref_frames_with_earlier_poc_nb;
> 
> There is one more reference to this, that also can be dropped:
> 
> $ git grep tegra_vde_h264_frame
> drivers/media/platform/nvidia/tegra-vde/vde.h:struct tegra_vde_h264_frame;

Thanks! v2 just sent (where I also fixed a typo in the first patch
in the series's title).

Dave

> Regards,
> 
> 	Hans
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

