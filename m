Return-Path: <linux-media+bounces-41867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D456BB45E92
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 625465A2A4E
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC73309F06;
	Fri,  5 Sep 2025 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YLRK4UfD"
X-Original-To: linux-media@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E855279780;
	Fri,  5 Sep 2025 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757090804; cv=none; b=m+CFkGszWCpLxwhOb7Ebcf/aZvnlSloZNd41w43C8c2Ej5QUUah0i0EuEN5cAZDO4U1HI/xyJ2GRwsMcmNDIO26VWjpFcGtbOucg85T7joNohae0vC1r7pU683ila0Ug+NY7IVeYqCTI+WlqhtBwGZq8aqEVAD4Iv1hEYmmioCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757090804; c=relaxed/simple;
	bh=n7lgFTuAaHvirVe2HxCgamU69/Yv2hAYIZ80fnvRVso=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yc2BC9w+ToX9rhUwRzP4yT/rk9r4B6FObwB79KP+zZa/zlH2gZ5al2i3Fn6JfCWxbD35VwWUQs7tXmRtygNp5TFc26VqZWFHdXCGSWxKAAdRQ5B1t3v3XTMv+kMyFnh3twlt4MFus0wvDb31uU3KHsK9qFlHUpC5pooiDeKelZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YLRK4UfD; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 2C87C585463;
	Fri,  5 Sep 2025 15:59:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6310B1F74B;
	Fri,  5 Sep 2025 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1757087961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFFOsoL+0XB5VITOYkkT3Ujt/8Fw5vWv70yMLAox1vw=;
	b=YLRK4UfDca2Z1SERSnWpY/5xU/0+E26t3jjeluQS906xxdoUWfgaysjGz2IvnsSkjIGb4e
	9gcLy0PkCLWkl31aI+PhbvcmWZjhFmcva1tHgwYHIIxNSU15ArMgkzKOGosXgDLZjMuimH
	55R52ga5aHzQdcUIzCIim48qLCgGE9RAsAhsH1PCNO5C5h/MT1z4JA57tTEzgJJf225nCD
	pY1Vp5T7Bdd28lQ+LSemVgjBMLR0I5goURkdCklfeb7aKUINAgHsVHxaCGpiWFj/Qagiun
	FT3m/Smxy9CblMIttmXedXwC2jhzZmMA2GD502u1WSOQJkENXjXGnDvAqT1ePA==
Date: Fri, 5 Sep 2025 17:59:15 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter De
 Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko
 <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 09/19] staging: media: tegra-video: vi: add flip
 controls only if no source controls are provided
Message-ID: <20250905175915.2d7e02a7@booty>
In-Reply-To: <20250819121631.84280-10-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
	<20250819121631.84280-10-clamor95@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtoheptghlrghmohhrleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhrvgguihhnghesnhhvihguihgrrdgtohhmpdhrt
 ghpthhtohepmhhpvghrthhtuhhnvghnsehnvhhiughirgdrtghomhdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopehskhhomhgrthhinhgvnhhisehnvhhiughirgdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Svyatoslav,

On Tue, 19 Aug 2025 15:16:21 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> Add HFLIP and VFLIP from SoC only if camera sensor does not provide those
> controls.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 4f67adc395ac..61b65a2c1436 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>  	}
>  #else
>  	struct v4l2_subdev *subdev;
> +	struct v4l2_ctrl *hflip, *vflip;
>  
>  	/* custom control */
>  	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
> @@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
>  		return ret;
>  	}
>  
> -	if (chan->vi->soc->has_h_v_flip) {
> +	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
> +	if (chan->vi->soc->has_h_v_flip && !hflip)
>  		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
> -		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> -	}
>  
> +	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
> +	if (chan->vi->soc->has_h_v_flip && !vflip)
> +		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);

Based on my understanding of V4L2, this should not be done.
AFAIK subdevs should expose what the hardware block can do,
independently from other subdevs. It is up to userspace (e.g.
libcamera) to use the most appropriate control when there are redundant
ones.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

