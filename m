Return-Path: <linux-media+bounces-23402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 857159F16E6
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 20:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0694B1889803
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 19:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FA0195381;
	Fri, 13 Dec 2024 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DN1ghPuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188C219343E;
	Fri, 13 Dec 2024 19:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734119751; cv=none; b=EQAWGpiJsPfqbFr8gMVmhL/irWT0RwjgMjwAbUosUGKss35VPT0AbqvI8bDOVpGo95RffNYXanqmE9z2VEvLiH5cpJzig0qzC89gbwpg5fpe0exf5ecdu7o4oD2bpLnpXgxEtkPYwDwHt4vzsfeHBzOhriLg5cszAjA4kySqJ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734119751; c=relaxed/simple;
	bh=+KRdWhBI/XFCe/JTS96b+IvaX1dOBdGzJmDIw06LNtA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C4ZFu6MmSkLPdN/d1y3P52TKGw0yynROY6ml/uiG8UIlegqejq43Ws61AZs5s6fT0nFN4wviap7cl9zCZT1ZVXf+XeV0UwDrALkc/8adq7TcPd9gE57EeLK5kjnRg/FrkK9ZZ83buoBCixjQrQfMeCtFvCEHGXETJ3U7LFh9/Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DN1ghPuZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734119748;
	bh=+KRdWhBI/XFCe/JTS96b+IvaX1dOBdGzJmDIw06LNtA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DN1ghPuZK4AcoV3ThZi9i7ek07FwipuSR9QNBXGCzem37BYSh/Xp6RYnKQd/BTRlg
	 FQV1sxoJ5bO9cgE+tugtjc4FT1+pR4iMvVbkCQFCXL3AQG8tdZ58rJ9c5aCywmHqkN
	 TrpdRrpcIS+Xz8FCnkh9ve6QBcS0mMdjv4m+oya0l/0lFxuHu+09HIYIixQuZ17+VT
	 +s2TPOAHavNTCNjE0VDVqqk+Sss/RvhbfpmUL0bv44koA9VTDY3BVxNNgzKeOeGfyH
	 QLni82PoV/1cOTFxm47GB+kDbTJoEVTHZcxHj6/XbuJT4hphkzLcwl6Evou++zo7IB
	 aspVGp8tB0MJQ==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E093117E37F5;
	Fri, 13 Dec 2024 20:55:45 +0100 (CET)
Message-ID: <c7630341600fa157265459f5fac49ec74c013ca7.camel@collabora.com>
Subject: Re: [PATCH v1 5/5] media: chips-media: wave5: Fix timeout while
 testing 10bit hevc fluster
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 13 Dec 2024 14:55:44 -0500
In-Reply-To: <20241209053654.52-6-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
	 <20241209053654.52-6-jackson.lee@chipsnmedia.com>
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

Le lundi 09 décembre 2024 à 14:36 +0900, Jackson.lee a écrit :
> 521C Wave5 variant does not support 10 bit. When 10 bit support for 515
> variant was added, the code which returns an error was removed. While
> testing 10bit hevc fluster on the 521C hw, timeout happened.
> 
> Fixes: 143e7ab4d9a0 ("media: chips-media: wave5: support decoding HEVC Main10 profile")
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../platform/chips-media/wave5/wave5-vpu-dec.c     | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index ce3fc47dc9d8..28462e01ca27 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1406,10 +1406,24 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
>  		if (ret)
>  			goto free_bitstream_vbuf;
>  	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		struct dec_initial_info *initial_info =
> +			&inst->codec_info->dec_info.initial_info;
> +
>  		if (inst->state == VPU_INST_STATE_STOP)
>  			ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
>  		if (ret)
>  			goto return_buffers;
> +
> +		if (inst->state == VPU_INST_STATE_INIT_SEQ &&
> +		    inst->dev->product_code == WAVE521C_CODE) {
> +			if (initial_info->luma_bitdepth != 8) {
> +				dev_info(inst->dev->dev, "%s: no support for %d bit depth",
> +					 __func__, initial_info->luma_bitdepth);
> +				ret = -EINVAL;
> +				goto return_buffers;
> +			}
> +		}

Let's take that fix for now, but consider filling some capabilities flag in the
long term so as more variant get enable we don't endup with tones of
produce_code == branch all over the place. Also, please send that one with 1/5
and 2/5 seperatly (perhaps 4/5 too if applicable).

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

p.s. its better to split the obvious fixes that are guarantied to go quickly
from very complex changes. Specially that these are important bug fix, where the
other change is for performance improvement. This makes the maintenance of your
driver a lot more responsive to major issues.

> +
>  	}
>  	pm_runtime_mark_last_busy(inst->dev->dev);
>  	pm_runtime_put_autosuspend(inst->dev->dev);


