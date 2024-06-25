Return-Path: <linux-media+bounces-14136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B39173AD
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 23:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29199B21A88
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 21:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDAD17E460;
	Tue, 25 Jun 2024 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="zJ7icnKf"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA917C9F5;
	Tue, 25 Jun 2024 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719352167; cv=pass; b=aT0iCaFRXmLtbDg/Qpt8OSLIPWKSLJW/cOd+HvMRHcLGLoExu6tNF06B/sjtS132yEH0AgdpUSLbti7o3WaJmcagcvQVBChkg54tdp/9Dn6bafpP8IoKT6vxg2TNHnDkm1EWVeqSGXLg6mluXKF2i7gouEdEyBajdi7slCh10Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719352167; c=relaxed/simple;
	bh=Sv0w8m4Ga9/xD0+xHKsYtkGDVDRrAB4fIykUNTQqAzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjRuVJCwmU2cp1If4aN5BwfS+u9FBOrkrmrEZzkPrkDhMUp0Tnlqi6TecObb5GvtalPKcexvNVccCOjNHN1RV18qjHaRUkkS62OwFIYezOVEZH9NNIra4/vANQEzXFnTM/NEmJ6aQ2euJ/IVKJQnR/kbA7wird0NMiAYjBybdHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=zJ7icnKf; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W7z4d2CXTzyRw;
	Wed, 26 Jun 2024 00:49:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719352161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aR1grHd+DhXBS40p7SygONRIkImWkMDeLRIQq78yc5o=;
	b=zJ7icnKfYT+dZUsSGyW19SceMYF7TK8cj1m/iA9W0D1Oz6fwDxS+qyxG9iSBiC3ZBT1IGf
	s/ISjfIQT7HNhIqOPhiJLH29BGw4qiXHz6sr1F10ORlA/evMimGahD47ANDjXzsaUb2JPt
	V3qv+/feJjH9vBGccqyjLEpRMF9VfpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719352161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aR1grHd+DhXBS40p7SygONRIkImWkMDeLRIQq78yc5o=;
	b=q3a1spaiep0vioxx/SxFSp+oqf/KqOpf2ddnSacvrWPNR+G3xgs9BesNRBida1dAH5YHh4
	tM9Q+6YhrArZCkIX2JbbVuvVBjgDa106EqSc+KPSXtNM98RhffKteNM3UD4fri/JpAJU2b
	f3tqbGzYF8igB4nhlPfGCTsyJfnXhKk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719352161; a=rsa-sha256; cv=none;
	b=gELwHYM20mpPj+yip3nEnq2uPl8PQ5gGBnKOK+hB8sg88nrJPH24enDC0ubqjPFHEgQP1R
	XuxZHqzJFK7E63Xu9YugDuYWdbbbk2lJqHNH+JfFGZe7BxboBFCD3i1vyRqv48m8CJ4gJt
	KXf8sNdn4g3uQ3hikvzXHymEtmMV41M=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9AAE1634C94;
	Wed, 26 Jun 2024 00:49:20 +0300 (EEST)
Date: Tue, 25 Jun 2024 21:49:20 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/8] media: sun4i_csi: Implement link validate for
 sun4i_csi subdev
Message-ID: <Zns7YKMVa0tvOI24@valkosipuli.retiisi.eu>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240619012356.22685-3-laurent.pinchart+renesas@ideasonboard.com>
 <Znb_X42wK_UoMUNR@valkosipuli.retiisi.eu>
 <20240625210928.GA29726@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625210928.GA29726@pendragon.ideasonboard.com>

On Wed, Jun 26, 2024 at 12:09:28AM +0300, Laurent Pinchart wrote:
> On Sat, Jun 22, 2024 at 04:44:15PM +0000, Sakari Ailus wrote:
> > On Wed, Jun 19, 2024 at 04:23:50AM +0300, Laurent Pinchart wrote:
> > > The sun4i_csi driver doesn't implement link validation for the subdev it
> > > registers, leaving the link between the subdev and its source
> > > unvalidated. Fix it, using the v4l2_subdev_link_validate() helper.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > This looks like a bugfix. Shouldn't this be backported?
> 
> I'll add
> 
> Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")

Please also:

Cc: stable@vger.kernel.org

-- 
Sakari Ailus

