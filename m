Return-Path: <linux-media+bounces-11416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 422408C4380
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 16:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0518282F1D
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 14:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A625CA1;
	Mon, 13 May 2024 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qW/lUqtX"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE114689;
	Mon, 13 May 2024 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715611946; cv=none; b=fBPfpIdX5axMn0ac1AN2cF+d0LMdgsYJTC6bNc6fkRHt4yg+HanFf5/ffmNJyescgPBANGVslh3O21MUFrE3nH1Ndv3CkCAMt1JwyyHE7VKjm52Zq/mF24IEBl496cMIGzXtLvkO9yTjYT7f7MBTUlTN6nKk0fk0MQkCpjkjzXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715611946; c=relaxed/simple;
	bh=dGPesChjn6zfCGN+uZgQZ6d6gonk0aHoo23Qown8aUw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJveKTJg6ks4FZh28Va//5X0/C3ZkeDVhJDKMok8/ljOlDFBPXzcKxrjd0Bp31j9Ow6D8rsQcIsqt7M2/PENubIQ7bwuISZ5RCN/hnTdzdfKde/b1qL9zNEXLwfk2mQvE+Q/Eb1qMkefbAN1BMyOSRMnURQC6qfAVW6VhzrR6kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qW/lUqtX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715611941;
	bh=dGPesChjn6zfCGN+uZgQZ6d6gonk0aHoo23Qown8aUw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qW/lUqtX+1mZwPJhOnBSNA9bxBp3Wrew4U5lRRZuUEl/R0qI11+fDk3Glorw5HxMA
	 GUnRqWAudolecol5X8Weo8OTh9fLBQgAX6BAIJyds/FKJCp9uheAfobi7I5to1nCpY
	 aSKkXJZVP1uX5HYSOm5/wikVCvq1fSQWES3SCUIeZIkaTkKlw+66WVVUdjD+7W98UL
	 YYLm2kyeMoReMZI1o3Kg9ZN98kRJcokYMDvgzfHkcSw56nD5VcD2wzE1eWuD2ubR23
	 TvodC8+bZeW5qQxyuNimLx8Z9z25m5AQHwrSp+X7R3IvgF4ZmA1vRa0ONWpVtsFC91
	 5lNfaJq23oiVA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6A2ED378216D;
	Mon, 13 May 2024 14:52:20 +0000 (UTC)
Message-ID: <8a6ec70f8054979db20fc7f62d12d4e4f5747324.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Fix auxiliary buffers allocation
 size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org, 
	heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Mon, 13 May 2024 10:52:14 -0400
In-Reply-To: <20240328093439.18712-2-benjamin.gaignard@collabora.com>
References: <20240328093439.18712-1-benjamin.gaignard@collabora.com>
	 <20240328093439.18712-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 28 mars 2024 =C3=A0 10:34 +0100, Benjamin Gaignard a =C3=A9crit=C2=
=A0:
> Use v4l2_av1_tile_info->tile_cols to know the number of colons
> in the frame. This made auxiliary buffers meory size computation
> more accurate.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index cc4483857489..65e8f2d07400 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -257,7 +257,8 @@ static int rockchip_vpu981_av1_dec_tiles_reallocate(s=
truct hantro_ctx *ctx)
>  	struct hantro_dev *vpu =3D ctx->dev;
>  	struct hantro_av1_dec_hw_ctx *av1_dec =3D &ctx->av1_dec;
>  	struct hantro_av1_dec_ctrls *ctrls =3D &av1_dec->ctrls;
> -	unsigned int num_tile_cols =3D 1 << ctrls->tile_group_entry->tile_col;
> +	const struct v4l2_av1_tile_info *tile_info =3D &ctrls->frame->tile_info=
;
> +	unsigned int num_tile_cols =3D tile_info->tile_cols;
>  	unsigned int height =3D ALIGN(ctrls->frame->frame_height_minus_1 + 1, 6=
4);
>  	unsigned int height_in_sb =3D height / 64;
>  	unsigned int stripe_num =3D ((height + 8) + 63) / 64;


