Return-Path: <linux-media+bounces-12340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB838D6215
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 14:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F206E1F28F71
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 12:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2A9158A08;
	Fri, 31 May 2024 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nMJCspMC"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE43A74404;
	Fri, 31 May 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159635; cv=none; b=t1TcOOWrvkheLFp1PeE61wA0dS/uQDflLvTxj55K5V3FpNRQlX80pC5sj6b+xLr4uKE8K8xqWiOngBFYaAI7iFNGQWxPbZs2PqXoqkRzKWr/G+r2vgJks3YxWv1qYGDfyGKbXKlJBWX8Hf6Ut93AZUkWSWKMCaEb2xoEbaXW2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159635; c=relaxed/simple;
	bh=iW3CNwK1w77FA/ekGYhGcEUsJbEL6oKwZ2aHH3da/fY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ga9989MZgz8wn7vQWe+ptNzQNcSIXYH/KkjDXdAyxxRubp4JP8Z59yFpZUlIkTl+z0GAA26QyQvDodd+XAcWkhM1iLYQT0UmSAD7y/4cJf9N7tX+MXCg9kj9G6B8e3smFYXuv72IDLRrxQngGHj0JeYdeyyVxbLyuegytiDVJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nMJCspMC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717159630;
	bh=iW3CNwK1w77FA/ekGYhGcEUsJbEL6oKwZ2aHH3da/fY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nMJCspMCwgj+AX5HCpHoS2O45tNHJjK1HppWZDKpt/HT5ymNCJrvo5t8DHASgqosc
	 QZIBZ+gj+1S6uGNPuqktoxYdAlFFYBXUcBpC11wfRk0I6kPedKmwISfr5rkkzgxXhn
	 CIPdeEZWFCFQRPGSz1crAbNxcAfRg2h/VR/ezyanJOv0hItqVyn+ADSVhQH05C0s0z
	 /rfWdLvh3nPXbSDgQlTPZqO4Ij1v7QDfFSWdhurVLV69Ixol5lomhvLdLp8u0JrD64
	 O0Pj2LGog4VDJth6oOhUBwtIswzHzynj/ztxPGFSqLNu0ErHNbCTgKQ/r31gxL2B48
	 FN5C2FabIQumQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0271F378148F;
	Fri, 31 May 2024 12:47:08 +0000 (UTC)
Message-ID: <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer
 size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Fei Shao <fshao@chromium.org>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
	 <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Fri, 31 May 2024 08:47:02 -0400
In-Reply-To: <20240521095536.3869399-1-fshao@chromium.org>
References: <20240521095536.3869399-1-fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 21 mai 2024 =C3=A0 17:54 +0800, Fei Shao a =C3=A9crit=C2=A0:
> In the MediaTek HW vcodec pipeline, the `trans` buffer is used to
> transfer the data decoded by the lat decoder to the core decoder.
>=20
> In the beginning, 6MB and 30MB were allocated for the trans buffer to
> handle FHD and higher-resolution contents respectively, but it turns out
> that's more than enough in practice and there's room for improvement.
>=20
> The buffer sizes were reduced to 5MB / 8MB respectively and the decoders
> have been validated to work normally on the MediaTek Android products.
> It's time to adopt that change in the upstream MediaTek vcodec driver.
>=20
> Reduce the msg queue trans buffer size to 5MB / 8MB respectively to
> optimize the memory usage per decoder instance and improve the overall
> system performance.

I don't disagree with the change, but it feels like this is has hack over a
hack. We have an entropy decoder (LAT) metadata buffer, which of course is
resolution dependent, for which we hardcore two sizes.

Any chance Mediatek can document this blob, or at least document the proper
relation between the size and the resolution ? This way we could dynamicall=
y
size the buffer for the chosen resolution and trust it to remain big enough=
 for
a long time. Removing the non scientific claim of "have been validated", wh=
ich
is producible for anyone hitting issue with that change in the future.

Nicolas

>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>
>=20
> CC: Yunfei Dong <yunfei.dong@mediatek.com>
>=20
> ---
> I consulted Yunfei and he confirmed that these are the sizes they are
> using today.
>=20
>  .../media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queu=
e.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> index f283c4703dc6..e36741179a97 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> @@ -29,9 +29,9 @@
>  static int vde_msg_queue_get_trans_size(int width, int height)
>  {
>  	if (width > 1920 || height > 1088)
> -		return 30 * SZ_1M;
> +		return 8 * SZ_1M;
>  	else
> -		return 6 * SZ_1M;
> +		return 5 * SZ_1M;
>  }
> =20
>  void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx, int hardwar=
e_index)


