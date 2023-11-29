Return-Path: <linux-media+bounces-1341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E5D7FD2D9
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49BBC1C20E8F
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F4615E9D;
	Wed, 29 Nov 2023 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="U2OgepDE"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8A21707;
	Wed, 29 Nov 2023 01:35:41 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SgDhM3nDpzyQm;
	Wed, 29 Nov 2023 11:35:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1701250535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBMtK94Go2Qx3A8vq16Az09u3ZHaqoIiuqWziee6a/8=;
	b=U2OgepDEX3JXK/Uy0lZIuhn7HqvTKwStbn/1/hieTCH3Wp+MTYc9YO3zpdDc+dDGVBz1EE
	bPGNJWMN6ymD/iIfTrEwP0NpHRY5Rqqfia12ezhGhtBlF7VcHJP8y5QIKcM8jlo7cwyaik
	mnLQ/n5MT0m0J/xyQZr7LlAXEt1I4m0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1701250535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBMtK94Go2Qx3A8vq16Az09u3ZHaqoIiuqWziee6a/8=;
	b=onqBuo4pUwtq+exTLJRnadXdbZMH710QEai0aU6KTp3sO2iqbCAtSuepiXo8Bb4VKqaJpv
	Pta2EElIE4U9nCj8Mq+TwaSRyiqH9LQ+83whUDRs2d5XuaPrtNXHTDF+tvlkWIniXNVEr3
	W0/Z1hpVHVyo9KwD6L96Q1pzzJX5C5s=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1701250535; a=rsa-sha256; cv=none;
	b=VDNXvY+hJj7kCbvBOKDaQ30Y5Ccx8KYgrGBB48Tu1ViiDqHql50oElByTXp3QQTC4GQFXi
	vkbL8tofbxj1eo394ot+wSE+BQ2eKiPhygRRltJhzhh3g+w02yvcR+M5wFoxt7xqG1Kt5s
	5bJ5oh3YZ7n3SS4OcnlJx7q68yNSBO0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 110BD634C93;
	Wed, 29 Nov 2023 11:35:28 +0200 (EET)
Date: Wed, 29 Nov 2023 09:35:27 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: stm32-dcmipp: correct kerneldoc issues in
 dcmipp-common
Message-ID: <ZWcF38Pd97bAbHvf@valkosipuli.retiisi.eu>
References: <20231128201404.237856-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128201404.237856-1-alain.volmat@foss.st.com>

On Tue, Nov 28, 2023 at 09:14:03PM +0100, Alain Volmat wrote:
> Correct kerneldoc issues regarding:
>   - dcmipp_ent_sd_register
>   - dcmipp_pads_init
>   - dcmipp_colorimetry_clamp
> 
> Rename as well dcmipp_pads_init parameter from pads_flag to pads_flags.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Thanks, Alain. I've squashed this to the driver patch.

-- 
Sakari Ailus

