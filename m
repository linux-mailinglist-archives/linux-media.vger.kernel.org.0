Return-Path: <linux-media+bounces-19336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB99980F7
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 10:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAC0A1F26768
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 08:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52381AFB31;
	Thu, 10 Oct 2024 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="hPH1bbNv"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024FF1C9EA4;
	Thu, 10 Oct 2024 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549911; cv=fail; b=n5gv88VEIDcyUiqgSy3cU6S8ONug+P+SO9CaFCgc5QuIOH5g42Uf2Ua1dSzZ/qNW8RusLjC2fw5hPgZh/fQFvXbld4tA45PD6UlshoIKjjostfnoayNP35/pilH3GIPU6WY5GIDHMbsH/P1qkwEbdP5ccDArC+drCQsmVf9N07Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549911; c=relaxed/simple;
	bh=LPXylYgAMH/sWMJmW11vxUzeehM1g0h+almUtiMQpBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtUKjVyOYpU6dQZuo4zHa2zPRa7gxOTLa8hSJV4gIubAvNC+Yk9BMksJGS27bmH9CZ4GuKeqzIIZuPp69HdnCfWOUGo7pjAbsVFkzELbsBNcXbnOhjrcKv3poqOmgXbskrmS8v6qQzRIkLcbHTsPhkRJNMEW7HimPMRl7Yy7IjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=hPH1bbNv; arc=fail smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XPNcK4tWXz49Q4J;
	Thu, 10 Oct 2024 11:45:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1728549905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dtfnKDIfUz+5tJdDJSVtGhBGccdMWdQtStvf6j02hew=;
	b=hPH1bbNvzlOzRMUVPfUQ1HMWvpa6smOjWtIqCCa2a0GhmoD2oh1ffQeUWKVDFM7eTEnoA2
	/3/9K1ERnzid1NAP1dVWXk8mV4rKanK1BczL8KFBMGu0sH70jMtEl3SRS4er/Om+WgupQY
	7HkkIUlgQz5uGWH8AmxGHC/IkJqnX01262hyyBylUOW4EzjFbZlolCaM397RqF11jZg5LP
	4NsLBjCRuh0seXPPkdRswVJMUqOJ+3XBcj8ZXIIiPqVKlG26BFQGgmtLCg8oHtOMAb7gs2
	sqddN9eZQCiXhLCjb/o71G+vFFbnDs7wG6oVTDam21T6NheoEi2UppSn8ohUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1728549905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dtfnKDIfUz+5tJdDJSVtGhBGccdMWdQtStvf6j02hew=;
	b=SNqwoV564O182bS26IuEmuGNx/GqJmM8O4UxQqIW67NFGzUp1rwv5NPucYssc7IbAHF4nP
	1gZBjgSZ8jfmt5COf2sVCenfSxRNTNLnLw1DUQ/LnNi0WAPiTKM+860fCqUAGdD3BHNkok
	7F1qVdQ0rbYXAmDQW8nkcnoFobj1hf/p+pnB6ylkmpbm+pIG+3YJe74qCWQGDDqZFxZQ18
	hNhLR7iuqSrIOELZhY50qecHX+WkUz6KreC6ugq9siCbp6Dgm6Y7uce8XkK8YBvCUcGBkm
	FVDQSEDBlCgDuzPTNW3vJNW/KG/LVSc8GLis82RBusgya3xstTFZbwwXMlGJuw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1728549905; a=rsa-sha256;
	cv=none;
	b=faRlP9TGFowBjZwm3fLvZNhbLMMMoJlZ/Ool+nlvozWRu1aqEY0jSzSzLwOOwJG7hk2ifv
	08ZI+r0u3W8WGDhTzihcVUjhbjEitrQ5595tLl9eXWQvIPd9Yk2LAqiY8oPnCJ/V1MN2Tv
	MmJVF/UkO6dPB+avfRV5FIcgTDBlAucBGax8IJXhWTchyVaPH6FtDpDEqd2nzJUzkWHsow
	iy8pK1BKjE3bMafcPoQLSSjGHp2Pj/j2o2j92IoU9WzMk77YkEJ2Mcm1zWhO7K9sg0IGoG
	Q170i27az0iij5jpBkr03NTLRq3qOqoXfJkdXOSA3Noek1H72y2HzN32rb7F6g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2BF54634CBD;
	Thu, 10 Oct 2024 11:45:05 +0300 (EEST)
Date: Thu, 10 Oct 2024 08:45:04 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: platform: video-mux: Fix mutex locking
Message-ID: <ZweUEDVQ05Ikk1RY@valkosipuli.retiisi.eu>
References: <20240909154828.1661627-1-paul.elder@ideasonboard.com>
 <20240909155603.GE9448@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909155603.GE9448@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Sep 09, 2024 at 06:56:03PM +0300, Laurent Pinchart wrote:
> Hi Paul,
> 
> Thank you for the patch.
> 
> On Mon, Sep 09, 2024 at 05:48:28PM +0200, Paul Elder wrote:
> > The current order of locking between the driver mutex and the v4l2
> > subdev state lock causes a circuluar locking dependency when trying to
> > set up a link. Fix this.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> This being said, I think we should deprecate the video-mux driver and
> implement a driver that uses the V4L2 subdev internal routing API
> instead of basing the routing configuration on link setup. Any opinion ?

Sounds good to me. But do we need a new driver? The subdev client streams
capability flag should help here, just as it does on other drivers.

I applied this one, with spelling fixed in the commit message.

-- 
Kind regards,

Sakari Ailus

