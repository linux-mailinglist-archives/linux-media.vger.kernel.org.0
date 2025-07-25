Return-Path: <linux-media+bounces-38439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D2B1198D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 10:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38CD51CC76BA
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 08:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B832BE7DD;
	Fri, 25 Jul 2025 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RAPrugMY"
X-Original-To: linux-media@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD03253F12;
	Fri, 25 Jul 2025 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753430998; cv=none; b=hW5GfGueesoeqv96acVilbDE1WhRe2JnRN+hL62Sd2Q+aSdy3hQZUdtPiSDSaRYj+g1jA0kRukoP1NECmEswf0T8WBzivF/zf6S/vWbYEW81DGHBur31uO8hGg4Omys0FHqMW7m0MOryR7BGhhvlymUN9EF9OBjN6ayoneBRDSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753430998; c=relaxed/simple;
	bh=yOEF3pbrz4Kx9Yvk4LzkBbXrI6GwPwnuHpZ0B+OKRpo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sU5hcBKm1PV0gfkRynK0qUHn7fXQCDeaf5CLrAqEthx1BASVzSATFO/W477ZMCNlmutG1wcQqWMrDSeRbl/M9HDs2vuGSeKSf7cwbByq8qvYpjV5IsLZEAbIeTDF7ZzvZBjDx5r6xfdKIlZzs/fw3pmgkk0384eXUXDcGxYrtkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RAPrugMY; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1A7E443AB;
	Fri, 25 Jul 2025 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753430988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptbYJ8jnyRK4joUoCr7OOdtZ5ECC4czwvLjcYQx+OrI=;
	b=RAPrugMYfyP6vElz0cdX04uv2YJ8z9gJ7sIJtCfDcY/oCekpcJwubei/qeuokr3XNJYMMc
	0IlZ80zS8mox/m7Qq/LG0C/YzZihWgvye1/suNr78Fhw9YlWyKKp42txuSd/HjokWEpxp6
	Tpw6YEdIscZONSAn2c5ONLuq8jOQWVvjymFst1FcG+jJuK7SBdeR/gnXDrYPqwHH/yiD6r
	4uVHoL3odpCueiCJvfbBKXw63pkb3U9jbB4Z2D2wv9ystb7QtX8ujouTc1s4m7CrI5pHkS
	6fAS97VhfnckAa4JjywL4hRbQXc5wRpEryYkEScCBmuYkPYmE5EZnBeW6h1ZLw==
Date: Fri, 25 Jul 2025 10:09:43 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "A.T. Jefferies" <alextjefferies@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: use BIT() macro instead of
 shift
Message-ID: <20250725100943.0a974c7c@booty>
In-Reply-To: <20250723231757.15443-1-alextjefferies@gmail.com>
References: <20250723231757.15443-1-alextjefferies@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepfeejrdduiedurdduvdegrddugeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfeejrdduiedurdduvdegrddugeeipdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrlhgvgihtjhgvfhhfvghrihgvshesghhmrghilhdrtghomhdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopehskhhomhgrthhinhgvnhhisehnvhhiughirgdrtghomhdprhgtphhtthhopehmt
 ghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello A.T. Jefferies,

On Wed, 23 Jul 2025 23:17:57 +0000
"A.T. Jefferies" <alextjefferies@gmail.com> wrote:

> Replace two instances of (1 << X) with BIT(X) in tegra20.c to follow
> kernel coding style guidelines and improve clarity. The BIT() macro
> also ensures proper type handling for larger shifts.
> 
> Signed-off-by: A.T. Jefferies <alextjefferies@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
> index 7b8f8f810b35..1473f1b1f203 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -42,7 +42,7 @@
>  #define       VI_INPUT_BT656				BIT(25)
>  #define       VI_INPUT_YUV_INPUT_FORMAT_SFT		8  /* bits [9:8] */
>  #define       VI_INPUT_YUV_INPUT_FORMAT_UYVY		(0 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
> -#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY		(1 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
> +#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY		BIT(VI_INPUT_YUV_INPUT_FORMAT_SFT)
>  #define       VI_INPUT_YUV_INPUT_FORMAT_YUYV		(2 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
>  #define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 << VI_INPUT_YUV_INPUT_FORMAT_SFT)

Thanks for your patch. However I'm afraid I don't think this is a good
idea. 1 is just one out of 4 possible values out of 4 possible values
for a multi-bit register field. All the 4 should use the same style.

BIT() is perfect for single-bit register fields. It's not for multi-bit
fields.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

