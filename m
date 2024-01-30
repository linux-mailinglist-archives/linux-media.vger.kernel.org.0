Return-Path: <linux-media+bounces-4386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAEB841C9B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 08:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AECDD1F22574
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 07:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9B652F6F;
	Tue, 30 Jan 2024 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QpdNJnLX"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB02354659;
	Tue, 30 Jan 2024 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706599907; cv=pass; b=BVWRV3r0Siv0Jrn2NIYYmM9TC3IiOP/L+UW3bP2jS3UcUIBG8sW9s/LiHvMwdQs43M1f+RBjEy/rR8ty5JRM9iieFP9yYdaitzI34UZHvquYR5EWZkdC0cnnLaUdizGObz+iqVvspbi16jo+6pT7AwJs1iXI9as0GZ/gaQ8sK04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706599907; c=relaxed/simple;
	bh=M9spN+i39/nbtnUNp8PNM/LRv1jQ5j007Zfc/C40vaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvMp3sMHhEQZlaCWZw5GohmJaf/R5JWTmBvcNYFJLCbt7jkn5yL6el1vQvzAdpYJk1vM0wWyi0buHI7arL1Cfg046sAycoEGVtsRHla0tbHAG72P0DsLM6om+IqQ55u5OaJvo+HDupiOHfMVem2fGm6usjX+mKkOv+DlSQTJOR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QpdNJnLX; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TPH0s07y0z49Pwl;
	Tue, 30 Jan 2024 09:31:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1706599902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kiNee71ztfk6wXe9Rbz+IdTHsbBiUwHJoXFPCx0dNaU=;
	b=QpdNJnLX6VjSx7WjU8D0wiKI0MFACR/KXAN986V2m7PiyS61vq2PcCyqErPea6jTZrV5Ki
	KG5Ky41FakvPaZqn7AQ2LqvxLssnfq2nTJdLenhX9KU1Byxfdh14B0kp/KedRVDR8djk9f
	k5Z1VsPHkP4FJy+TTZDXJ2BKzKGzXYSe9po+YBbxkxtdyozbhFPJuRHuaO+SkMdMcVP8QR
	yCC/vi4z0I/FiIXDsULVFWv7m4PkD2W136+XWzhDrSpyrJaFhmE3ur1ByR3TLkGNp0axSr
	/SXnzIY217NB/+KH+J32hyw8/0Bo3O+AM7ovWu1q7+RVon2otw1hRAHPT9npfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1706599902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kiNee71ztfk6wXe9Rbz+IdTHsbBiUwHJoXFPCx0dNaU=;
	b=aixnvEw0w8CPbo4tmknZv2BEWJvsS5+T8i57IWyL5hORQv61Pc8Cmj4IP/NqFW8YbNE2QM
	mkRFOHWKNMNLlYfFpI74t2R0r1EZXdHCfgItpCKQzQXzagxYtdQx0wmwQXzYCg9yiarcz6
	7fdiFj6hPPBlLOkk+OPD9flBq2fErmxlg27HSXaGuk27fSYmnmqBlXNWxPrSpZT+t6m6rs
	QueOikqOMcuWog4FDmxQk4WFxXeZ6cul8kUN/TMwz+wl3BdcL3TYn78gYcB5JFBet8vKRf
	wE+1SaPogQE8M6mDfsgONuwYhHS53NSaJCssS99WOSCy6b5e5EffbMS+Fai3Rw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1706599902; a=rsa-sha256;
	cv=none;
	b=axbhd8Yt1Vdo527V2frPRvypu/SVngz+SvaBTOXdCoEaRZ79gJOOEvIjSogDCRzvaxLGaG
	5CIIi3pjMpsjcFf677ichTDNn+12aKogpPJHc3gIgqn+BMTDmZ0V9BWHaGKaihDspmytgC
	hssb4IVuKhtHqVmlnZNw6RjUhtPCHe3tz3tFZNttp2h7wKGxDMhGtlw/kDmJgE0n9C0s5v
	M2/JTtfbkDGPN5z8nzAewgjtH/PCO/sk1fyGGTtWymqFjzD2nDgQcv6fNxvdRAuuQe8tXL
	0QvxpwaDTpn/F9Dzs4gLqYEVbs01AOwipfUhUdTITd0Tvufs+8SGGD12whmbrw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A2C3B634C93;
	Tue, 30 Jan 2024 09:31:39 +0200 (EET)
Date: Tue, 30 Jan 2024 07:31:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
Message-ID: <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

On Tue, Jan 30, 2024 at 12:34:55AM +0000, Kuninori Morimoto wrote:
> 
> Hi Laurent, Sakari
> 
> Thank you for your review
> 
> > > The strategy sounds good to me. However, I'm wondering if you shouldn't
> > > take one more step in the core, and implement these as fwnode
> > > operations. Or is there a reason why OF is special, and iterating over
> > > ports would be useful for drivers on OF systems but not on other types
> > > of systems ?
> > 
> > I'd prefer that, too.
> 
> It is very easy reason, because I'm not fwnode user ;P
> I'm not familiar with fwnode, but in my quick check, it seems it is easy
> to expand fwnode side functions if of_graph side function exist ?

That would be one way to do that, yes, but I suggested using the existing
endpoint iterators as that would keep the firmware specific implementation
more simple. The (slight) drawback is that for each node returned, you'd
need to check its parent (i.e. port node) is the same as the port you're
interested in. The alternative may involve reworking the struct
fwnode_operations interface somewhat, including swnode, DT and ACPI
implementations.

-- 
Kind regards,

Sakari Ailus

