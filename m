Return-Path: <linux-media+bounces-22610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 144659E3929
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D404DB26A53
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C7E1B21B7;
	Wed,  4 Dec 2024 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="FbG6AGWN"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E35B186616
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733312431; cv=pass; b=WUkITJNskh13x5A2epuQnzzqaPVY12Q3rs0PMH+goDaEGBY/z/M1VQ53r3XAPEfUIszO24PkeZqHOoZg4p5ZdcaiUQWSb4yHWLGm7r9Sp2F+lQfnZvl8WbV/C//mBtfxbzVrEf319Cg/Odl9J6RMopafOJEYIMDTSUYFpAS+lVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733312431; c=relaxed/simple;
	bh=64x5xayAGTvipd+SFNSDwLMMSZMNcIYBhN8oajbW2h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQlEEi+0XbjKao/Iu1RE1JO3Uo1+3CJTdk6EN92PdzP3L7n4I3RwtBIXZ2KA9Lm91xYCDlTIMq6zAcxDJbSb9M8TLiV8cX5WY5MtCzfjpbF3kvjXPAu+QhdzMPgEJPE9TFPxPniNMgp7tWcduvoVgEwEnV7TVXqtPOMfxFsTJFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=FbG6AGWN; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Y3Fv449PgzyQG;
	Wed,  4 Dec 2024 13:40:16 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1733312418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DHtbCpxteq0JuD2jB6yoya44FWPJ0FfaBuRCTqT5d4=;
	b=FbG6AGWNL/hRdlfm7poFbXUV4owXFwl4MwrIJlrAeobbvpD/XZkk75MZ1+SreGNIMNKbhL
	cq62Vy5ZkVsqmSuR1PjxOMw/QoKhipj88c28Qv//EKNsIy89avAZKqSvjRK1FGT3pwDwB6
	iAerFwA23jQoqPEaIwPvQKrGZV0QCV4=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1733312418; a=rsa-sha256; cv=none;
	b=a1SwwDxXFMGPknBb0XMzQ5PYtn0PkPbq29H98GAcH6JaEYFQstautq/itTtV503jbfEhON
	3wIA7SCluaKgu4hbo5XzST5R5UJ2Jh3laAKV5yC9u4YCwR2bxNALX10FVlKnqk5eLuuKRO
	BRpYDneX07vEOyFkxt+IVHGYCGtVBZ0=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1733312418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DHtbCpxteq0JuD2jB6yoya44FWPJ0FfaBuRCTqT5d4=;
	b=iKI1s+iXTNctWbgERRbcDKRbEePUMimHYPqX+5AXMa7gI8s/BppDftBySlGAc/ZXwWr1kt
	3P3hw/T3A0NY0AJOYyT9ORLUCqn01fIeGHo3Pspwl3OMWXvaDpQvNTgfMUkFrSoi2J/hMb
	XvtTwNIbj41tBZa9W8m3vrzznGvKM+E=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id F3EAC634C94;
	Wed,  4 Dec 2024 13:40:15 +0200 (EET)
Date: Wed, 4 Dec 2024 11:40:15 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 0/9] Sub-device configuration models
Message-ID: <Z1A_n4ePyK3Vvlq2@valkosipuli.retiisi.eu>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129095142.87196-1-sakari.ailus@linux.intel.com>

On Fri, Nov 29, 2024 at 11:51:33AM +0200, Sakari Ailus wrote:
> The compiled documentation can be found here
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/output/userspace-api/media/v4l/dev-subdev.html#media-subdev-config-model-common-raw-sensor>.

The patches can be also found at
<URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/metadata>.

-- 
Sakari Ailus

