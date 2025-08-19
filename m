Return-Path: <linux-media+bounces-40248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46AB2BEF0
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A5C068089B
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 10:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37590320CC9;
	Tue, 19 Aug 2025 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HrZPVugL"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5344F270553;
	Tue, 19 Aug 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755599323; cv=none; b=a8yOcZTFn8j0vYhfiMW/+d9afnIgRqufRN1zXkC9J6DXhYWmPtvSEfOn9i+Lx973AAKExRZuKays3WslbmaRlCGDqj/lnjqQBkISPWb/FObF8RsNg0f4ZKogi5j7VULSTmEEDSf2iXpddFSooRKLaWv93ZLPJOfLc42URdRSJdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755599323; c=relaxed/simple;
	bh=LJe6GXzBrmMrFx7CDqH75A1cSPnO/Y4h6nStzCjN3r8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1TlEfrgNTvwlRCRbNJbO0aInZa3a+oEOx7zQZV2V0jsINLVMWbFDiTUPPtrYs774+4pTJ2Md9wQ8ELm0o7ymYxXsorEK2HHIqv3Xv9e1qBPT6bCvWyh7CKi/V2gToDW5pPmAq0je98L3UlatwhVgZ+jLgV86LzoNJjfosVHKFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HrZPVugL; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC6BF4320D;
	Tue, 19 Aug 2025 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755599312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2JzZZmtUgW8EEG4cX8jIH74Ea8TbyjkGn1P1Ggoq3DM=;
	b=HrZPVugLFwC8DAzEWod0jk+gFnLk3fA9w6oJpL/tHlrXZYMjJGxjctjwUHJ5Ogkr3d3RFR
	lsHGlUzcdMCcZWDWd1QYPMzspFfnU7yIVjJukmKisxd/Hl/XsRp7957purzGTyZT6NSqNL
	uT8azaWCfQjCFs082YPF3+nZIHuwBfWrVYVFFmrVRBfk8ZhuPztdv7Z9pipF3C6E0M7hCq
	VB7AndYiDq68qobyYwTL80zwWMBzr9aaNrjrU5U0qBH40XkECKKWwkxz9B80f8nyZyhxhE
	bhhZ/16x4JpdxI2PT1GdAxQ0L0uuwZ6ZY4GKKoe8CR3yGvATQdlAMDlUSWFBWg==
Date: Tue, 19 Aug 2025 12:28:30 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Xichao Zhao <zhao.xichao@vivo.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: tegra-video: Remove the use of
 dev_err_probe()
Message-ID: <20250819122830.3d4874ed@booty>
In-Reply-To: <20250819092330.550046-1-zhao.xichao@vivo.com>
References: <20250819092330.550046-1-zhao.xichao@vivo.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheehvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepiihhrghordigihgthhgrohesvhhivhhordgtohhmpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrr
 dgtohhmpdhrtghpthhtohepshhkohhmrghtihhnvghnihesnhhvihguihgrrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Xichao, Uwe,

+Uwe, author of 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent
for -ENOMEM").

On Tue, 19 Aug 2025 17:23:30 +0800
Xichao Zhao <zhao.xichao@vivo.com> wrote:

> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value instead.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
> index 7b8f8f810b35..ee65e89c119c 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -255,7 +255,7 @@ static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
>  
>  	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
>  	if (!out_sp)
> -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
> +		return -ENOMEM;

Thanks for your patch!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

About dev_err_probe(), I wonder whether it should mention the -ENOMEM
exception in kerneldoc. Is it part of the API "contract" it provides?

It would be good to clarify that, because there are other users of
dev_err_probe(..., -ENOMEM, ...). I counted 80 with a trivial git grep.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

