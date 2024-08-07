Return-Path: <linux-media+bounces-15928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E283D94A852
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 15:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9533F285840
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 13:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7751E6753;
	Wed,  7 Aug 2024 13:08:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5C3155C83;
	Wed,  7 Aug 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723036114; cv=none; b=HDl1kI17VxJ4vSkWG8HHczdOcSbnQPS0DYE+FebnPaJ1qTDJZsjRFskoc+d6JGfWkD2bDoMqSnZl0y+3trzkZsFZT8/HwNnvT3VGMl4OPtmrnX20HRRf1K2OixbpuryMKGeDgFmozWoeqiQPYRR4vIa6WyVVo9hGOhLrtV/28zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723036114; c=relaxed/simple;
	bh=e77/7qyKarj7g5giX80VLzGThPlXESjT8FkAi9iPS20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdxuCvbdtOhw5gPSgKNQ6wEzlGAvou24yljH2V8ixy4hRsNJOjyWKIjMYerH+jdCSC4xVm6UzWDLhpgosDxHln+sBblJNmdHbbdLzoDCaPfgIozcxPz9qzgAhA90zzcFKrHwHRUDokOZuRyaSnGAkJ8fmWq8d2LOBj3F4e79n4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4EFC4AF0B;
	Wed,  7 Aug 2024 13:08:29 +0000 (UTC)
Message-ID: <2f3f3b80-65a6-40b6-9450-41e1313167f0@xs4all.nl>
Date: Wed, 7 Aug 2024 15:08:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] media: use 'time_left' instead of 'timeout' with
 wait_*() functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-media@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrey Utkin <andrey_utkin@fastmail.com>, Benoit Parrot <bparrot@ti.com>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Dmitry Osipenko
 <digetx@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 05/08/2024 23:51, Wolfram Sang wrote:
> Changes since v1:
> * fixed another occasion in the allegro driver (Thanks, Michael)
> * added tags (Thanks Ismael and Thierry)
> * rebased to 6.11-rc1

Can you resend this series? This patch series wasn't picked up by our patchwork,
probably due to a full filesystem.

Apologies for the inconvenience.

Regards,

	Hans

> 
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_*() functions causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> obvious and self explaining. Also correct the type of the variable if
> the original code got it wrong.
> 
> This is part of a tree-wide series. The rest of the patches can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, I audit them before sending. This is why I
> will send series step by step. Build bot is happy with these patches, though.
> No functional changes intended.
> 
> 
> Wolfram Sang (8):
>   media: allegro: use 'time_left' variable with
>     wait_for_completion_timeout()
>   media: atmel-isi: use 'time_left' variable with
>     wait_for_completion_timeout()
>   media: bdisp: use 'time_left' variable with wait_event_timeout()
>   media: fimc-is: use 'time_left' variable with wait_event_timeout()
>   media: platform: exynos-gsc: use 'time_left' variable with
>     wait_event_timeout()
>   media: solo6x10: use 'time_left' variable with
>     wait_for_completion_timeout()
>   media: tegra-vde: use 'time_left' variable with
>     wait_for_completion_interruptible_timeout()
>   media: ti: cal: use 'time_left' variable with wait_event_timeout()
> 
>  drivers/media/pci/solo6x10/solo6x10-p2m.c     |  8 +++----
>  .../media/platform/allegro-dvt/allegro-core.c | 24 +++++++++----------
>  drivers/media/platform/atmel/atmel-isi.c      |  8 +++----
>  .../media/platform/nvidia/tegra-vde/h264.c    | 10 ++++----
>  .../platform/samsung/exynos-gsc/gsc-core.c    | 10 ++++----
>  .../platform/samsung/exynos4-is/fimc-core.c   | 10 ++++----
>  .../media/platform/st/sti/bdisp/bdisp-v4l2.c  | 10 ++++----
>  drivers/media/platform/ti/cal/cal.c           |  8 +++----
>  8 files changed, 44 insertions(+), 44 deletions(-)
> 


