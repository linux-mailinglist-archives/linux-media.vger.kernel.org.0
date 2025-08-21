Return-Path: <linux-media+bounces-40646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1920B3011F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 19:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A09943B64EE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A1C33A015;
	Thu, 21 Aug 2025 17:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="JxaM6Dv/"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85984321F30
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 17:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797240; cv=pass; b=qeswq3Bz10mnDN1VfeJ4Kkdz5QGDXm8/S8KrnjwKFVTW43q/XrxbRUQC1iHjHk3advIbqY0b4DyJlhazn7Umsud6tZKSpbZ5hFHScu2Sr0sT3ZxQV6fsGgUHeliXDY2AZd0LYbQSH135C/3QGRyzEDEJfMZ12YY0d3/872NGTYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797240; c=relaxed/simple;
	bh=LklTssh4fBevXzAoiwMt+7Y2Yyj1iGwcKxLcu9C0pwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfKyIfyCcMloPHIMXxTVtONH0TBBaNQ24bmXw+Y2vjVqVteFpg+xuLE2yXrD7FrpUqvilW6AtSK5wM2Lt38us8zaehC8CVS1awtLz8a3MwgrOZMk0LSt7NTw4wrICWLDNhI1qh5ep9t13kMYmvVMBWGidEEVBn+WFiKDL6S53sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=JxaM6Dv/; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c79HP5p9NzyT0;
	Thu, 21 Aug 2025 20:27:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755797235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2wGT35ACRJqeMBans5AxgJKwaQp7w8jXRanXd6Ne1bQ=;
	b=JxaM6Dv/fZ9UGmi8CIeam1q+xqkRmkbdNQvPActPXC/F/ZJAfA1SANSNEef801sTCREpta
	YKtbu3aaab9QwC5GNPKJpISv8XZJIlpnDAD+XGUi0YyPn1luTNz7As5Kq0rLtf0XubLuUY
	r+WE9vmFIJCrSPtCDqz+sDqPSv2oS1g=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755797235; a=rsa-sha256; cv=none;
	b=AAONFo51j+0I9vh1CUJfqDu6AUoQysbFgjHSUs5GTdaLwvJdkuZhQI/fiXC134ugRux76U
	SU7ZtRfOlaxIi8HmGOHAEPe/dIaLbBSBhG+V1V7ddsOMQpctXUcniOiVLOwMWpCz1IqyAl
	UBhYz3+7bKqfJ8TTw1LZ+yhl/vKPeUI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755797235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2wGT35ACRJqeMBans5AxgJKwaQp7w8jXRanXd6Ne1bQ=;
	b=RQKnfDy1jf2/IN5lvVEIE8Af/aGZg4F51igPJJc5QMJavnyyXHPwljquRXiiL6rRBo5jUL
	ahLh8L0Tz3KsRiGJbxlHr01Nvq0ycF+ofEgp7GNQB21CehYOExQdkgJpldETtYSmmoY3f7
	tq4GOx2hMLv8B+0pArLngQqbABCtlaM=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2E407634C98;
	Thu, 21 Aug 2025 20:25:48 +0300 (EEST)
Date: Thu, 21 Aug 2025 17:25:48 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Cc: alain.volmat@foss.st.com, mchehab@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] media: v4l: Fix dereference before NULL check
Message-ID: <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
References: <20250818093159.612208-1-chandramohan.explore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818093159.612208-1-chandramohan.explore@gmail.com>

Hi Chandra,

Please choose an appropriate subject on the next time, this is missing what
the patch is for -- see git log if in doubt.

On Mon, Aug 18, 2025 at 03:01:57PM +0530, Chandra Mohan Sundar wrote:
> In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
> assigning a value to the 'src_pad'. However the same value is being
> checked against NULL at a later point of time indicating that there
> are chances that the value can be NULL.
> 
> Move the dereference after the NULL check.
> 
> Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")

Fixes: requires Cc: stable. I've fixed these this time. See
Documentation/process/submitting-patches.rst .

> Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> ---
>  drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> index b69048144cc1..fd2b6dfbd44c 100644
> --- a/drivers/media/platform/st/stm32/stm32-csi.c
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
>  static int stm32_csi_start(struct stm32_csi_dev *csidev,
>  			   struct v4l2_subdev_state *state)
>  {
> -	struct media_pad *src_pad =
> -		&csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
> +	struct media_pad *src_pad;
>  	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  	const struct stm32_csi_fmts *fmt;
> @@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
>  	if (!csidev->s_subdev)
>  		return -EIO;
>  
> +	src_pad = &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
>  	link_freq = v4l2_get_link_freq(src_pad,
>  				       fmt->bpp, 2 * csidev->num_lanes);
>  	if (link_freq < 0)

-- 
Regards,

Sakari Ailus

