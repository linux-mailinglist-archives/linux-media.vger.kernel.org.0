Return-Path: <linux-media+bounces-49793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E82CEBABF
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 10:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C98B3067DD3
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89997316180;
	Wed, 31 Dec 2025 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m+4MNxrS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8D315D47;
	Wed, 31 Dec 2025 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767172505; cv=none; b=n/YYVFcgy7LDj0oKR2ecddTP82E8ujRZhuQSzqxgbWJfjwByRJUgXKUsw87axyDBcBvzjxIHTeuN1hO1MW0zlW2ifBOy5+za/ZuUGyBOmeS6A2WPBZCwnXR0ZL2YtVsYJHdwVj+82nBIXZ511uajj6VnSbMrZe/PPMnPTIRrhJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767172505; c=relaxed/simple;
	bh=uvY5D395av1Fzi8rWyPb3NDwQB1JNSZRGeRvOXJX3qo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=EuuUKvwxH+qEa6xiNIT5fgYjBEWKatYftBsCwbW0Ali/CNC7Cx1uKHSSs9lOs22h5NJ95rDHOKxD9Q+8i/G+f7XwpW4vP0nQ+hlBGMcUlGd3mLHpoAgjM7ILGMK3LqD9GJzZ3Q7yMkTVDxYKyXC5X8Ezzlkz4yWFFddEudj6k6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m+4MNxrS; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 907D1C1AE22;
	Wed, 31 Dec 2025 09:14:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24BFE60744;
	Wed, 31 Dec 2025 09:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDB1A113B0755;
	Wed, 31 Dec 2025 10:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767172493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uvY5D395av1Fzi8rWyPb3NDwQB1JNSZRGeRvOXJX3qo=;
	b=m+4MNxrSClxe2FMQDwRiICic9Rd6awW1oEfHO9MeRVPI6hGOshZAD8joRR7/xq2zao6QnL
	LX0Em3O0qEikXTWAKfGKg2ezktnODOumU5M1Z8NM0FOcQnuU9CWwIfRxP6DeonZE8YZL5r
	g5iJpGe03lHtSipqGfXVjGMes88i6QJB+LnwB4ubBjgBRLLruGpN+L84Tl4iUgPK6ShW2S
	P3g5Rq2OH4GLeLDEhWyYJ8mHRv72R99Vi2q7uPRuVedrgfXYql0jG3Rs/tCdq92CmnQlfJ
	Xxo1WWN/RLtcMgh87zBKETB+jNYu66y0v48f7MORDZPlHWHgnNHG4oWh3+JuQg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 10:14:45 +0100
Message-Id: <DFCAD4LVB5RF.3PI81T1E0OIID@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/2] host1x: Make remove callback return void
Cc: <linux-crypto@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Akhil
 R" <akhilrajeev@nvidia.com>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Mikko Perttunen" <mperttunen@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sowjanya
 Komatineni" <skomatineni@nvidia.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
 <d364fd4ec043d36ee12e46eaef98c57658884f63.1765355236.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d364fd4ec043d36ee12e46eaef98c57658884f63.1765355236.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Uwe,

On Wed Dec 10, 2025 at 9:31 AM CET, Uwe Kleine-K=C3=B6nig wrote:
> The return value of struct device_driver::remove is ignored by the core
> (see device_remove() in drivers/base/dd.c). So it doesn't make sense to
> let the host1x remove callback return an int just to ignore it later.
>
> So make the callback return void. All current implementors return 0, so
> they are easily converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20 tegra-video
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

