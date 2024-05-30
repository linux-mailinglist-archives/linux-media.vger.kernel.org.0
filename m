Return-Path: <linux-media+bounces-12253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE318D4F18
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 17:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45BC1F21E42
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F0D17625C;
	Thu, 30 May 2024 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="bOaTeblV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30891187557;
	Thu, 30 May 2024 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082933; cv=none; b=jV4Ydv5WA4nKoPA7egG0XHyuFBIsU3aHJuDqx5AGC6Nsm5kPxXEf/wyx0YvsUS0SwtxlzGpnEw+qaP/KYNeBmZEZC4RbzWCwAhiCNQSmfo6oX1bA6cfrwBdIA7/XvjkIpbLJh63Pg9YguYyaEPhfltGi6POwpTSN5f0wNYTI43E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082933; c=relaxed/simple;
	bh=vKjA6hVfENF/Su+nYdGbvb6QjMyg+WQq9tgX0z+nFGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPM6ebaSkgQLOL6V+o8CaB/oEaDAo/eCVm6oBr9ITIITR2oIZNbgU03JT3ZSzaDK/sAesp+mRKZTSD7x3FAGY+XWcoRhVqBROVOrTodCXaflA/MTlJAbffZe84IeFr1ORb+It/BS/eta+6i0rny1KYbG4n40Nmy4OSb8ns70N6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=bOaTeblV; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=hJEc9qgsKI9oJR5GoUF4NbJ97SV2VDBCHpvtbgyIXrM=; b=bOaTeblVbHHfOyIt
	ksWtj3H8PV45PxF0qbo0Z/+x9xjhTg0Z9eP/RMh8av+64NxrwDdZWodv1l8cCWu2Au7rWLzLuyorS
	1dEqssU9YmE9ntFM0i7y6HdNf5ershSeoaQWOeO8RJ9XzaXDOHubMrsyIkihowUKLZvUJR8/BS/vo
	EFbn/1CehRDgad7GFRC6/jZ19tNj1SgFPpV2AfJyNWcJWcOZeP1rWkp/Pc9zwTR4bS6GPx2BFKmkp
	Ot1A6u2FCCzUSI8qYaHfMwLqCLKJiAx58GEsO8Ihn+pXoiil2NKOoPIVG14ydncYXrSraO5VIEpDG
	p9W1N/s8Ltm+GZKUdg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sChhs-003OgR-2M;
	Thu, 30 May 2024 15:28:44 +0000
Date: Thu, 30 May 2024 15:28:44 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mchehab@kernel.org, ming.qian@nxp.com, eagle.zhou@nxp.com,
	digetx@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: tegra-vde: remove unused struct
 'tegra_vde_h264_frame'
Message-ID: <ZlibLIhBeILqV-LR@gallifrey>
References: <20240530132619.71103-1-linux@treblig.org>
 <20240530132619.71103-4-linux@treblig.org>
 <D1N2H4X8ZL1D.18140DCI2SH8X@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <D1N2H4X8ZL1D.18140DCI2SH8X@gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 15:28:31 up 22 days,  2:42,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Thierry Reding (thierry.reding@gmail.com) wrote:
> On Thu May 30, 2024 at 3:26 PM CEST,  wrote:
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
> >  drivers/media/platform/nvidia/tegra-vde/vde.h  | 1 -
> >  2 files changed, 6 deletions(-)
> 
> Not that you really need it, but since I'm here:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks!

Dave


-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

