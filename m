Return-Path: <linux-media+bounces-45684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6EC0F0D5
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 16:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 002C64E92B0
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 15:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033753128A9;
	Mon, 27 Oct 2025 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfetCQx8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A43126DF;
	Mon, 27 Oct 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579879; cv=none; b=mTbIUIM7xmYPhWpeiaN5H/KXscQUohKlOYoJ4gcgCo7leRmqTvebiOVEGUuA0bTy/U7VmLhVG0dyXO6ggqGPpBjyj9FWGmP4rNzK/w1tv/F3NofbCZJ3jpKHlT3BW3LEg1HUiY92zeKz9bX+w8SrS+rU/HnQ6o0LVaLNKVgD6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579879; c=relaxed/simple;
	bh=irqrm6uQuxnVppFGPRLF54t+DGlSHlPLRooV9JCjiDQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kHUp+S5ZR7qAOcKCXMUpp3bv4lpMUeEI+ZY9WXk9se/Y6olALgJ8qsDboHC4ocrx2Ou5tdgUrKK5kK3aP/jlYeI3g3E6Ya9IkvzLegnfWN4JW+JF/UrAiVyHt5lYEH/5cQc05sH/HrbQNATvYWsfyxJmeQGuQ5z8v4sg+dZQqPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfetCQx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772A3C4CEF1;
	Mon, 27 Oct 2025 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761579878;
	bh=irqrm6uQuxnVppFGPRLF54t+DGlSHlPLRooV9JCjiDQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=cfetCQx8JQRMhmIHEBzrut79SMh/LybtoUNESImySCl7bpvPebEdWExqAU9utDIcP
	 X+2whTajAST3e+zKA79i59PzYOmSOf4DPFQLPYV3f8sVr0CErTzqjJkBwbgAMlZMR5
	 LTZWdv5h4L+HwMLvr4tM0n9avVnL4JwpUP+LtIDsRNTq99YLISW8vdBWbfUkjtGJto
	 ncnL1ag8wQa7zB+Ey6BTPsCUgh7xVQsaCW1IFKOiLJ3GBNm3R0enr7EKKaDOdC7aQf
	 KlRDC0kBM10OWUzN3COVPVf9LA2dqO3zwCETrcgd/ETa3X4aeqhw6lEA6owWPlP2nL
	 ot8Yg9ZrNSixw==
Message-ID: <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
Date: Mon, 27 Oct 2025 16:44:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v5 06/23] staging: media: tegra-video: vi: adjust
 get_selection op check
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling
 <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20251022142051.70400-1-clamor95@gmail.com>
 <20251022142051.70400-7-clamor95@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20251022142051.70400-7-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> Get_selection operation may be implemented only for sink pad and may
> return error code. Set try_crop to 0 instead of returning error.

Can you mention why try_crop is set to 0 instead of returning an error?

That would be good to have in the commit log. And in fact, it's not
clear to me either why you want this.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 7c44a3448588..856b7c18b551 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  	fse.code = fmtinfo->code;
>  	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
>  	if (ret) {
> -		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
> +		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
> +		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
>  			try_crop->width = 0;
>  			try_crop->height = 0;

This looks all a bit magical. Which subdev is queried here? I.e. what is the corresponding
subdev driver that implements get_selection?

>  		} else {
> -			ret = v4l2_subdev_call(subdev, pad, get_selection,
> -					       NULL, &sdsel);
> -			if (ret)
> -				return -EINVAL;
> -
>  			try_crop->width = sdsel.r.width;
>  			try_crop->height = sdsel.r.height;
>  		}

It looks odd (esp. setting try_crop to 0), and I wonder if this code path has been tested.

Regards,

	Hans

