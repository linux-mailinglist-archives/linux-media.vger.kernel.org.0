Return-Path: <linux-media+bounces-23590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7769F4D0E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D19188CDF4
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212271DA612;
	Tue, 17 Dec 2024 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ntzbTvPX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4CE1F4734;
	Tue, 17 Dec 2024 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734444251; cv=none; b=aNaeNRc7Umwj2FKcU6UaizO50kY08dlFNJvoipoq/068nGYg/vfwAMewtGrKgAK7gIDyCbX0KMtKV9+QooHG5UVcQQxYvM63JUMag8XS4hlpFsOpS/PmTXpQFqt8uE4XI3QGBI4Wdo+EQNVZgNAwevyic40meHjLRe8Ji9piP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734444251; c=relaxed/simple;
	bh=TR34lIDAcTrGG68ntvSGpWBM+ePiz/nAgRhnCGX17Kg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NWbRVvmdtNEfxsm6WVstSwcEmToCuQq8KJCHOWz6jWhMK8xgoFE4RgR6WQ3LJ4tH9DSu7C+N2/30kfde5KN51ZSdAxXnVEhabCDpN1uQqzV1CbiXFyNUBYlyYaaRSO+8BIxye/9yYoedpJuhowyDfp7JzoQWtUk0pbBS++62KXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ntzbTvPX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734444242;
	bh=TR34lIDAcTrGG68ntvSGpWBM+ePiz/nAgRhnCGX17Kg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ntzbTvPX9bagrB27QClmvR+qLHApS1cvptJo1ovLffrHtGz+fzWoDc2YgrEGoVxOs
	 hVn/fVfVH9l0fZNSUu0cJQPmoiJkDKHqA/PCXym5DRwJ6w/yHyuQuOcAPqrYvWZXb+
	 cP1yc454E5ZmaoI8/qZKkbmvb62YJ9syHLZprQpq0Ch1zvt/jPw3vqhbprhaYcgy25
	 VefTcJ7buyZnSi0JpNAS3nUKgO0CIx1sR3Ky95z8ToJbjEffW87IZyh7kLrEgfWBc6
	 oEXDbGlYayys4aX23s6LkyoTJfUhn2GC36e+r3u13KPFDCR0c0fBA7amayuu2CM9Ho
	 3DHW+SCwWa+jA==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 142CF17E376F;
	Tue, 17 Dec 2024 15:04:00 +0100 (CET)
Message-ID: <49ca2e9fa8f057c3ec4d88f147713f1164aec2a4.camel@collabora.com>
Subject: Re: [PATCH v2 1/4] media: chips-media: wave5: Fix to display gray
 color on screen
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Tue, 17 Dec 2024 09:03:59 -0500
In-Reply-To: <20241217045125.58-2-jackson.lee@chipsnmedia.com>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
	 <20241217045125.58-2-jackson.lee@chipsnmedia.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Le mardi 17 décembre 2024 à 13:51 +0900, Jackson.lee a écrit :
> When a decoder instance is created, W5_CMD_ERR_CONCEAL register should be
> initialized to 0. If not set to 0, gray color can occasionally be displayed
> on screen while decoding.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

You forgot to add Fixes: tags, can you find back which commit you fix, and send
us the correctly formatted tag ? This will avoid the need of a resend.

Nicolas

> ---
>  drivers/media/platform/chips-media/wave5/wave5-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> index c8a905994109..d94cf84c3ee5 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -585,7 +585,7 @@ int wave5_vpu_build_up_dec_param(struct vpu_instance *inst,
>  		vpu_write_reg(inst->dev, W5_CMD_NUM_CQ_DEPTH_M1,
>  			      WAVE521_COMMAND_QUEUE_DEPTH - 1);
>  	}
> -
> +	vpu_write_reg(inst->dev, W5_CMD_ERR_CONCEAL, 0);
>  	ret = send_firmware_command(inst, W5_CREATE_INSTANCE, true, NULL, NULL);
>  	if (ret) {
>  		wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);


