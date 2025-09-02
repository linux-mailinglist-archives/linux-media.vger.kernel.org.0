Return-Path: <linux-media+bounces-41562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67177B3FDE1
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 270C7483C18
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725802F7465;
	Tue,  2 Sep 2025 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Alr58EL9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C28238C3A;
	Tue,  2 Sep 2025 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756812950; cv=none; b=Qi2lHdztmG9ChIS82xW+5nDw+rCARHFuw8HphhkoIi32DZecDKWiJjHdw/QptJbFJKrB0PJeV6Hae1Dq2Z6G0jt4G9EuutU7XuOOZIjLpGpsPMAVJpOY0Zyu6USBXngTkni75ZBAq2kk0vDabKCSe81mbHPRitey2Im2pVRjlos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756812950; c=relaxed/simple;
	bh=qxlOJyBU2jYx+FePztb3yLFZb5T0Kyk9bWuYWUK7AY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgKx5FbnR6xnCCH9F+BCNt9RPT6aPt0WHrr4esAPNXl7lNyTF44xeE5vz444r/gLRJD812lTUeeOO8Vay6NHQuWjAv5JoCoEa6fxlpTkY2jH9CwxYWSESGmqgjwYkMMuMfCd/FsstgALRA1upXGrOsQ5eGXUSPWXbeKcETUSkuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Alr58EL9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A3F19B63;
	Tue,  2 Sep 2025 13:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756812879;
	bh=qxlOJyBU2jYx+FePztb3yLFZb5T0Kyk9bWuYWUK7AY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Alr58EL9HkqTxZeDZwo1+XAo7AUUoRgzj7hokFjzzsQux1UTtovNiVN7+pudZCWz6
	 ggZAM+qoY2ZtMDbvFYXCkLGTZ2eot6UcQsE/R/9WpwpAu+ss9ivMM13b56ckwKmESL
	 MOGZYjT2I0XXmEwHjuy2hqykhedj5IZ9RTwj0Wis=
Date: Tue, 2 Sep 2025 13:35:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lee Jones <lee@kernel.org>
Cc: linux@treblig.org, arnd@arndb.de, mchehab@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <20250902113527.GB1694@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
 <20250902103249.GG2163762@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902103249.GG2163762@google.com>

On Tue, Sep 02, 2025 at 11:32:49AM +0100, Lee Jones wrote:
> On Fri, 08 Aug 2025, Laurent Pinchart wrote:
> > On Wed, Jun 25, 2025 at 02:32:54PM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > I noticed that the wl1273 radio had an unused symbol, but then noticed
> > > it is on Arnd's unused driver list:
> > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > 
> > > So, delete it.
> > > The components seem pretty separable, except for Kconfig dependencies.
> > > 
> > > That lore URL is over 75 chars, which checkpatch warns about,
> > > suggestions welcome.
> > > 
> > > Dave
> > > 
> > > Dr. David Alan Gilbert (4):
> > >   media: radio-wl1273: Remove
> > >   ASoC: wl1273: Remove
> > >   mfd: wl1273-core: Remove
> > >   mfd: wl1273-core: Remove the header
> > 
> > Mark, Lee, how would you like this to be merged ? I have a large patch
> > series targetting v6.18 that depends on 1/4, and I would like to merge
> > it in the media tree as soon as possible after -rc1 gets released.
> > Patches 1/4, 2/4 and 3/4 are independent of each other, but patch 4/4
> > depends on the first three. Can we merge 1/4 in the media tree and
> > provide a stable branch right on top of -rc1 ?
> 
> I'm also set-up pretty well to provide this.  Happy either way.
> 
> If you decide to take it:
> 
>   Acked-by: Lee Jones <lee@kernel.org>

Patch 1/4 has been queued in the media tree and should be in linux-next
as commit 103b0cfc9ab6. It is based straight on v6.17-rc1. Patch 2/4 is
also in linux-next, but is based on other ALSA patches. The simplest
course of action would be for you to merge 3/4 for v6.18, and 4/4 for
v6.19.

-- 
Regards,

Laurent Pinchart

