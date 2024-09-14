Return-Path: <linux-media+bounces-18292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8469979345
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 22:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3A141C21299
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 20:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7E1126C09;
	Sat, 14 Sep 2024 20:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Fpa+NjOE"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD331E871
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 20:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726344482; cv=pass; b=IDwNFg4p46KYWvVMjMWnQsy8QnoznWOWXO714ucsilKW+iWTdy+IVP5tey/hLGgvdydgsE4aSLRz4V0JH9Q2v/MvOlqalUB+Mg96I5LYauGit2fFuDHCWFPs6wo2T5uBQRnCZ3lkSXyzwhIdiX26BeipIgfJUhtTSiegQPJlVnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726344482; c=relaxed/simple;
	bh=jc9llhozjg3/vl30drnDpWl3omQC2aUkYkvJVPbL1x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/SkYt9mr04nB5GLuqZl5bTf9nhWaSHSjYN6N5BfNju+kl48FLPriNYd+yF2upnz5E2NuuWpMvwafgo8i8P9I6+o1OAEEwQWU+/PYwMAxTFW8baIK9IVC5bkhT40ArjkTxHIEaR0aUZIwePXGDIU9I8xZWcwfMGKiiVOJCSeRck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Fpa+NjOE; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4X5j0B3KMWz49Q3G;
	Sat, 14 Sep 2024 23:07:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1726344476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUU9j2H08mwXCheT13l/EzmJRxEWZ4J9ZgTdc7Yj5kE=;
	b=Fpa+NjOEUyWfPcoBotnhkFq7RwkYLiavuxNNIoEDBz7Jql5Z3A5ZxZBLRyx0Vb0l+CazTb
	S+xruyty89JcGf9cyOwV3CW5hMLK5FaEd7nVsumPXk5+4Y/Hc70AcG01cwaQ3HnCsJn+pZ
	8LCi39e/c1lNb133WemPeGiTbFYVlzMmwqjdPSHfl7CuoqqLZ9J/8Lf+A4UQUDo7ZP3Cfz
	6QjIZlc06cd+70BQoIlxeZ2AQh6Mrx5RyqgzAYoJIhCJmU51NTT5HiIFiLDxIIekjfuxLc
	dHKMNw+TJGrwJqToOAV/djIFZeYd/o32B8+tQn3zFpHbYr6jvlFAzguCFmls2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1726344476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUU9j2H08mwXCheT13l/EzmJRxEWZ4J9ZgTdc7Yj5kE=;
	b=sLEghB0zA2O8BRIy7UgDflZWRvjcMZYrZ9VuqupEHuXx0o7pxuOKgupMtxmQ7eFW5d8+h3
	nharcvgDzstkMZlNtnEa11+Rt+kmOCl1pc4uT1j3VMXv7A7hqETbtMOGXOI2bhbyTOHHpV
	WAVhSE+3yOJa5D+GBVK8RNJH2pHYSEShtB8Jr0kslN7dZwc+snPjjn2nnqEq6U+TmCjK0Y
	Jyc9GwO5PIocW594VQvMEPGLk+wgUleR0m3plr6RGhFuEySArJTAkdCZogKGKKR0HI5/Ed
	rA9SFWlqhAs87R2Bcg6cGxEyAOFge1vuWn1a7u8ADiliOOzaWpIwL3mLa6PTlw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1726344476; a=rsa-sha256;
	cv=none;
	b=OJVPf9J+0F8h9RiRA84GfOB+1K29v/ZW0K6B6xic9Wdvh3iwmg+VmU/y1yABdleB3/MEaq
	pTEdIsFPR579hjXL6Cxc2b4tT+YlR/iEy3oAUixrbXNqlhvPs95UtHM4lI8UBPM3NLRC1Q
	16nMun0dG6XferC6MvkSl5Q3Xldb+dSGVSjnyHXXzoWNPgCefaVI2IgNIBMPQ8iUes99U2
	pku/QSHXC187e1LB07UJuiny5cbnTSaduN4jjyM0EhLanK+svYa1XF4gARJd5OivMGHGs8
	c7AfcKrVpSY3+Qd+HrO93/KlJ5cSjEWHATG7U6NkF0e1MsYsjRFj3UUwhySTfQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0AF9B634C96;
	Sat, 14 Sep 2024 23:07:52 +0300 (EEST)
Date: Sat, 14 Sep 2024 20:07:52 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <ZuXtGA8gXJJFmC-Z@valkosipuli.retiisi.eu>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>

Hi Hans,

On Wed, Sep 11, 2024 at 11:03:26AM +0200, Hans Verkuil wrote:
> 17:30-18:00: Any other topics and feedback on what can be improved next media summit.

Perhaps this could be a good occasion to discuss the upcoming sub-device
configuration models and the common raw camera model in particular. This is
closely related to the metadata set and in fact the main reason why the
latter isn't in upstream yet.

-- 
Kind regards,

Sakari Ailus

