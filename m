Return-Path: <linux-media+bounces-10591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E028B98F1
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 12:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A3DF2827DA
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 10:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE76E59167;
	Thu,  2 May 2024 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="tB8ojNzj"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC8858AA7
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714646280; cv=pass; b=EC/Cp9GFnawEJM3hC+q2zxy1Rz2/eUQgp9n3M9SRjcGxzwyPc/cRS6Gy0rDYdb5fPXVSFeJc2tsAu+roTvKFXmBreMqb/s879ddv3oQ9mC/SJiztZo1SrY3LvtLhiCJ+2S7TWsY9bzyh/bIOth+2eNvKLaL9m4nHN7uTtAoH6AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714646280; c=relaxed/simple;
	bh=mNGLLHPgtis0t0/Dt7904+iA3Vc1dpuRkqGjAvNB4gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDhj+e3rTF6AIl+wqa1ACy0Mr3JDJdreKUBY43EZFL49vXkpAJEmNKnhGorTA/N8aBQUpCw7tMAgBgDBazJwmgTlASEJToE3QEjGm6pZ3lwyOMaaZZqA7NDkD75VZBVwyiHgaW6AIZawbinFwsYt0bZt5A6eQybO8tcX9UKRbvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=tB8ojNzj; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VVVkd197wzyVj;
	Thu,  2 May 2024 13:37:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1714646266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ABrT1g7BFuUD9pKDRwq8fQMLL9v82dq16ma9LWik1II=;
	b=tB8ojNzjokPEKvG+cKKjb4Z+B3kW3k/RGTcGDitquJJMoqJN1WsPoFmumyL2NhD7Ft0xBj
	RfzvGTmZzs4dhOdWwpqem62tFqERwbwoc5MC5RGb0aQehD3ntTpvZ5EdIokq3S92BOVuXH
	xfnxrVG/raFjNJ+6MY4mIyJeE3CHxsA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1714646266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ABrT1g7BFuUD9pKDRwq8fQMLL9v82dq16ma9LWik1II=;
	b=IdH7h0teGWA4D6Wyf8mTp9LCooILDnu9JMOiiGDyBEhP+Ue21j7c67c/QX+9BG2plntxue
	lzQSymgZoL3tvUiQS0nGgNNWoowD84KYQsoW7MA5FFyuYGXe2ivk+2RR9t2FqHdXvi53qK
	iRTpqH0w+Nmnq6bg+gR+Zp2xMKMfADw=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1714646266; a=rsa-sha256; cv=none;
	b=lQebiHwnxAd0lZP1gGAEiMtCIlA7ysPgLPml8nD7afky2UgoBDL1EPb+tzlH6x87D+m+Ys
	hA1d2wJWNPHFKZjeAm0dAOfNuBgPCupcYpzCWfqxlVpTk7XMJa2zOftoCyPZZlY78QGSNX
	v0ZIKwZ7MwIYuaCDduUxTXJbKbTRhXk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 17FEA634CC0;
	Thu,  2 May 2024 13:37:43 +0300 (EEST)
Date: Thu, 2 May 2024 10:37:42 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT FIXES FOR 6.10] IPU6 and Unicam fixes
Message-ID: <ZjNs9k7NH7pubibu@valkosipuli.retiisi.eu>
References: <ZjNQbS9CF1U6lGWx@valkosipuli.retiisi.eu>
 <20240502112547.3170d33c@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502112547.3170d33c@sal.lan>

Hi Mauro,

On Thu, May 02, 2024 at 11:25:47AM +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 2 May 2024 08:35:57 +0000
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Hans, Mauro,
> > 
> > Here are a few fixes for the IPU6 and Unicam drivers, for issues found
> > since merging them. Most are are due to Kconfig options.
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit a1c6d22421501fc1016b99ac8570a1030714c70f:
> > 
> >   media: staging: max96712: fix copy-paste error (2024-04-30 14:33:08 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-1.1-signed
> > 
> > for you to fetch changes up to f28348ebadf7c7127646672f363e055cb19f3b66:
> > 
> >   media: intel/ipu6: Fix build with !ACPI (2024-05-02 11:34:26 +0300)
> > 
> > ----------------------------------------------------------------
> > IPU6 and Unicam fixes
> > 
> > ----------------------------------------------------------------
> > Laurent Pinchart (1):
> >       media: bcm2835-unicam: Include v4l2-subdev.h
> > 
> > Ricardo Ribalda (4):
> >       media: bcm2835-unicam: Fix build with !PM
> >       media: intel/ipu6: Switch to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS
> >       media: intel/ipu6: Fix direct dependency Kconfig error
> >       media: intel/ipu6: Fix build with !ACPI
> 
> The above were applied, thanks!
> 
> > 
> > Sakari Ailus (1):
> >       media: intel/ipu6: Fix vmalloc memory allocation
> 
> I didn't applied this one, as it sounds to me that the fix is
> incomplete. I sent an email with the potential issues I found on it.

This is a compile issue at the moment. There may be other bugs (like not
releasing the allocated memory) but it's a different problem. That's why
I'd merge this one now.

-- 
Kind regards,

Sakari Ailus

