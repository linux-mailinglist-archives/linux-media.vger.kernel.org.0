Return-Path: <linux-media+bounces-41967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37DB4875D
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 10:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0D237AFFE3
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FD127AC5C;
	Mon,  8 Sep 2025 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hN2MgjCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB7D54262;
	Mon,  8 Sep 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320570; cv=none; b=pM8XwkJ/p1W+EUWSAbHOA6FfOXW6fZsnvihPRK7JJ4DCBoMCK2yg9Lh+j9KdTVsPlpy2CM+nF3Zd743p3i6nWrYHztU87GmbUYPZYx+4FWKR6thTMC6gZclHYVsP3EbpVyqqXRcBcY64sxL1JBJSqqFxyYlxROuWcWoSv+K29w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320570; c=relaxed/simple;
	bh=IJz4mmPhgTOX/DmNeXupnpR4mSsyi/iK2JLZ/OYuK18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoCzWxyB0L6lv1oDUCqTy8QFN6iTh2YoQg3y30glOBoul8+vqer5HV9Y4U3dFabVQLBLn1nZj5YPrnNebhqiJJuiC54yarAcKFWvfA9IQfIW/lyJwCAF9Wp+ZM3bTohZ73DsENZBPJk5raCIznDxok/cnCu4ygcL5ulyV22cKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hN2MgjCZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A3B7F99F;
	Mon,  8 Sep 2025 10:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757320494;
	bh=IJz4mmPhgTOX/DmNeXupnpR4mSsyi/iK2JLZ/OYuK18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hN2MgjCZ78Qrc+nW906Xw77Hqc/1KzZDtdBsZKSt1P62JuHh4/fCTowCqYganYBZ0
	 ahfZG0KZ8JMxRsRgFo5tfDMpbMTQAs+2GxeR3QUfE0AxgXy641CUHC647yIIBaKsgM
	 zUSJDNk07ujfZ8mFYXZrnKPuNuS9y5ZqtKIgUwOc=
Date: Mon, 8 Sep 2025 10:35:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Shorten the transfer size non
 compliance message
Message-ID: <20250908083544.GA23493@pendragon.ideasonboard.com>
References: <20250904081429.592e439f.michal.pecio@gmail.com>
 <CANiDSCuwHo_wLqVwPj8VHmNAgZw6gyq4zxoapvGxDwnb0tfkxA@mail.gmail.com>
 <20250904102405.3109bfa6.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904102405.3109bfa6.michal.pecio@gmail.com>

On Thu, Sep 04, 2025 at 10:24:05AM +0200, Michal Pecio wrote:
> On Thu, 4 Sep 2025 09:20:31 +0200, Ricardo Ribalda wrote:
> > Hi Michal
> > 
> > I like the new writing :)
> > 
> > On Thu, 4 Sept 2025 at 08:14, Michal Pecio <michal.pecio@gmail.com> wrote:
> > >
> > > This message is much longer than others and doesn't fit even in a 160
> > > column window when printed, despite providing little real information.
> > >
> > > Also replace 'transmission' with 'transfer' because that's the actual
> > > name and 'max packet' with 'limit' because it isn't same thing with
> > > isochronus endpoints. Remove cryptic abbreviations like 'ep'.
> > >  
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Thank you.
> 
> On second thought, I'm not sure if those brackets look good here:
> 
> [ 2410.688715] uvcvideo 11-1:1.1: UVC non compliance: Reducing max payload transfer size (32764) to fit endpoint limit (20480).
> 
> but I sent the patch already. If you think it would be better without
> them, please feel free to tweak the patch or ask for v2. If not, meh.

I like th enew message.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

