Return-Path: <linux-media+bounces-40585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D61B2FA15
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9E813BA917
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3453277BD;
	Thu, 21 Aug 2025 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="f8Qw2Jbp"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079632A3E3
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782164; cv=pass; b=aus7RmBGFWXZD/X2/o4N9KDdaDBBxWuBGd+zMKFnpMgd2L0fOV/1wpVrTNld3UEx3ildVdvSTcvOI3IquuSrVaaCZ7zU5vb6x1eqzuuHhDyFDzNS36FzQAS1HW9dCWmog2kV0B888Z7BMvKBd7OR25GAZnfCNmEgVzgDXUZeAZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782164; c=relaxed/simple;
	bh=AizuXKVM7byBZIR7SuJs6N+QnPvSr9yQfJsp3T71EFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYkKtEH3rEXc5KKIM3ZgAECBd0kKYjsLY4KbjL55bpoUYfqQQBRD4b2gPquu1VVaJBFzs1M85me8vjAL2yyHJ87Ep/fHJWsEdGYGxqzSg6ahmQwQcq4aCoQOJXwAcck2Nz1NNJQkp1c4cpt5Bx+3SwAkzSr9V/mQDMaOgutesac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=f8Qw2Jbp; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c73jM4vszzyRb;
	Thu, 21 Aug 2025 16:15:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755782152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oQjeVnZFYHYsQPpgtrCflyAjn3cZDQDzcFF+3XKTuLA=;
	b=f8Qw2JbpWgVOXqJGQoGYCO14g8Xwh5ufCxCSvrTyGOPAIhY8GDSKDR42/Ef5w8YxyfJlaB
	/wGMNDnPyHk8KDLcr53Qa0PEuRkMoLfeU4fTFC/+VMVM/W/iraMDkuu0jWBLBXd5y/XUgs
	4TzyME0K8WrfK28Xk2xk1CLT4kpzKyI=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755782152; a=rsa-sha256; cv=none;
	b=N3Z9TYwAUqXZLUvm+ADHgKZj1YWFv41ZDGVzbVrXZMK09YebLWnnDTufuNIPmL+tU6J9mf
	7kFizU7JSm3afLM7shjalZ7Wa3nOTnUP1isIS5jQf4GKoX1pCu5pfJtFYVMDNslJAQEpmD
	OFHQ/tWJB2qfRiyMKxn2OasPtQin7GM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755782152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oQjeVnZFYHYsQPpgtrCflyAjn3cZDQDzcFF+3XKTuLA=;
	b=etSW97rsfq+hfOKZBwul9ea9hPHV8oCfs+kf5wHMp7eMrw7b7DKL8QkkB2gbMrdnjjhLsU
	OCOHjV6z2HLSJHn/hFYIZXaJmQZJcckL25KLG7EETdVqvDpeD+/K7X4/MDSrAoU6jaFiVz
	vfPA4g0/3CL2hdRv6fuqbA60rFVv124=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D9F35634C96;
	Thu, 21 Aug 2025 16:14:26 +0300 (EEST)
Date: Thu, 21 Aug 2025 13:14:27 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: Re: [PATCH 0/2] media: mc: Fix crash when starting pipelines
Message-ID: <aKcbs_h5fY3IKBKW@valkosipuli.retiisi.eu>
References: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820140021.8026-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Wed, Aug 20, 2025 at 05:00:19PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series fixes a source of driver crashes when starting
> pipelines that contain unconnected pads marked with MUST_CONNECT. Since
> commit b3decc5ce7d7 ("media: mc: Expand MUST_CONNECT flag to always
> require an enabled link"), the MUST_CONNECT flag indicates that the pad
> must have an enabled link for the pipeline to be valid. Drivers are
> relying on this guarantee to avoid some NULL checks.
> 
> A bug in the pipeline validation code causes pipelines with unconnected
> MUST_CONNECT pads to be accepted in some circumstances. This has caused
> crashes in the imx8-isi driver, as reported in [1], [2] and [3]. Patch
> 1/2 fixes the issue, while patch 2/2 expands a log message with
> additional information that I found useful when debugging.
> 
> Martin, Maud, would you be able to review and test patch 1/2 to verify
> it fixes your issues ? I have reproduced the crash and verified that the
> patch fixes it, but a confirmation it also works for you would be
> appreciated.
> 
> [1] https://lore.kernel.org/linux-media/20250205172957.182362-1-martink@posteo.de
> [2] https://lore.kernel.org/linux-media/1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com/
> [3] https://lore.kernel.org/linux-media/20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com
> 
> Laurent Pinchart (2):
>   media: mc: Fix MUST_CONNECT handling for pads with no links
>   media: mc: Improve unconnected pads debugging message in link
>     exploration
> 
>  drivers/media/mc/mc-entity.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thank you for posting this.

For both:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

