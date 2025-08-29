Return-Path: <linux-media+bounces-41355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A901B3C2B0
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B93825A1956
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8A723507E;
	Fri, 29 Aug 2025 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="uO3GOCQ5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D817BEBF
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493395; cv=none; b=Rw2+7+GZLVq6v1+cv0DMSfym6ArABzJqWfu7gYxRjZnlAXLq32KAEbuB69PQXAuQUg9GPI1/BgfvE8+eOFOBOMt3Sc2OFCuznJAB6xVno2F/8tYIK6hCWzmZjCCVqhETLpwQmSmFGkX8iESKJWsRJG0kDqz3BiI6vTl3efkyA30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493395; c=relaxed/simple;
	bh=hu5cy2XzMU5JwpEtNeq0ZtxjqZztkBgJv6uTmvrRBPc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ct6FwfszigFP52cLvB/wkS7iNkvGVkZWhOuPdD/f9Ox2lMf89lAA/NUh7AQDlz/6UD5qPBelxd/a+VGkuJyam6Muc/wIgoXGarEmF1bz3dfZhIdjras5Z9Pbls9Klx75BvgCIB6ZIpb95B16aYVUTLMyJgCjy7jJ+ybsHCuibcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=uO3GOCQ5; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7f77c66f13bso228642285a.0
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 11:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756493391; x=1757098191; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Nn2QZqBEULdZ0VrKD8SCB1v1paB+n/b0AG9QGhllqo=;
        b=uO3GOCQ5skmC5Gs2w5QhzfU0wHWhC6OZJx30QnzU2FuopqnCtuQd0q9O8nVfVFwCCs
         94op14+el5qtwg8CuZyMyAit+ebrSynK1D+M4TF6a5H6jx7baY1DrM1yuo4Etj5zQf4U
         ANMLI3I9UPZ6ZcHEa47pPUs5ZZZ3t2Y4iTgx/GFXkjhI5F17jb5tysmzizqzU1exbfhd
         Ydu4g8ktlxNTi5iGJdaVwD82ArDQ6qBT1dooF+KbyXgUcDXsRV/amhgZomjOvY9pU2pO
         vuOEDZbAEK5Gj9Vd1lGPIH97WhsWkpCv3tbYtNjj5x5OJokSs7Tw49YHy/dBWiMgwMMp
         i5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493391; x=1757098191;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Nn2QZqBEULdZ0VrKD8SCB1v1paB+n/b0AG9QGhllqo=;
        b=cnlpow3a/jL1XdJzBxyOWtxOz6eU7HCHD1SatnbNAvDG68xkOkDnoXktjUL2ka/oFl
         Iu05qvzDeZe+sjdL7VBYJJry+iuZktK7tlHeRpJeAHhiUr7BZaY2p4YGRYtZfg4u/uQt
         tbhRoMAsSavkLo0hzwZtaYrRQjjwySR71vJQfEUJlUlk8D/cJ78fR0PruRBW7O0bPfzG
         nazC3cHcL12No8QZNrdKOSH57wkWUcNI7LWNAowBRuBh1q4aQdA0guc/5H5SgGdp7bCD
         4OIaTrlYT2qVv8tdMBl90l/oXsRaeSwrexys7G31sHTyewbzZHYiJgHGVT2kTtdSGRlX
         74Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWQj2WcpGRxf/x0rxcwOg+XpKypFQgvAOeWszX1rsNvlCqwyMvptcag/r41GM1Znuq3vvDQkKqr93nafw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JP0cJ42hOVgzwbqb4Q8bIwG8oxzGiuzum6dPALJFdDrnP35s
	rB4ekRCsn0t+DvU2brPC9xbgaR3rkbkMbjbbIzB2AXEbOY7PjCF3am++Xq3P4V3WVqo=
X-Gm-Gg: ASbGncsqf9Y2BpBLV5Io21EDv7C1jjZAUo3EEUcz3+vUXqwnUSc+xIUWECsVJ1ojG5H
	yqe00L01CcNF7LCDZtsBOBrycCATmrVTa/35jJOJlylN4H6PiWHCgvaRCGKpfdNsBjuL8mYeQ3K
	iLbaDjMXEVWXB4nWlxtkWjqo+mepDXIIsP5X+AONxA31XANFgn3H315CggML7RMVtlI4CVpft5x
	/D/UDOCboPWFw3//nyOi+DZSslF6DGXn7ziUYtiHrx8puNFqqHjBtTvMkRG1ch0TljZlxpexRnb
	zkP8AF/NLox123MWkCwIDShdc4dPx4Q3gv4kbrSbLV10ouNWbfs4G66tHGwCAjYJD9u7r3i7F0K
	RxhGF4PgG+fXDMcSG9uKuD2CItZ2ZUo5IXsr7eQ==
X-Google-Smtp-Source: AGHT+IFF4atVHdhmNaYBglzT5H5NmjrqYD114uUbppJKPp9HhceW11yaoBubIq39XRYoVHnaxgxYcA==
X-Received: by 2002:a05:620a:aa1a:b0:7e6:5f1c:4d7f with SMTP id af79cd13be357-7ea1107fb69mr3513677685a.65.1756493390631;
        Fri, 29 Aug 2025 11:49:50 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc151f2a12sm227700585a.49.2025.08.29.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 11:49:49 -0700 (PDT)
Message-ID: <d76038453bfd06ea9d0c90e7583078abc85ce280.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: use = { } instead of memset()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Qianfeng Rong <rongqianfeng@vivo.com>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil@kernel.org>,  Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Fri, 29 Aug 2025 14:49:47 -0400
In-Reply-To: <20250803135514.118892-1-rongqianfeng@vivo.com>
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-xig5edR/x3ap943HT9k2"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-xig5edR/x3ap943HT9k2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le dimanche 03 ao=C3=BBt 2025 =C3=A0 21:55 +0800, Qianfeng Rong a =C3=A9cri=
t=C2=A0:
> Based on testing and recommendations by David Lechner et al. [1][2],
> using =3D { } to initialize a structure or array is the preferred way
> to do this in the kernel.
>=20
> This patch converts memset() to =3D { }, thereby:
> - Eliminating the risk of sizeof() mismatches.
> - Simplifying the code.

Last month, Irui Wang sent an actual fix [0] for uninitialized data in this
driver. Your patch seems to be related, yet the previous fix is not covered=
 and
this is not marked as a V2. Since this refactoring collide with an actual f=
ix
that I'm waiting for a V2, I'd rather not take it and wait.

Any chances you can respin this with a second patches covering Irui's fix ?

cheers,
Nicolas


[0] https://patchwork.linuxtv.org/project/linux-media/patch/20250715081547.=
18076-1-irui.wang@mediatek.com/

>=20
> [1]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
> [2]: https://lore.kernel.org/lkml/20250614151844.50524610@jic23-huawei/
>=20
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 +--
> =C2=A0.../mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++--------
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 ++----
> =C2=A0.../mediatek/vcodec/encoder/venc_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++++----------
> =C2=A04 files changed, 12 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_if.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> index eb3354192853..80554b2c26c0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> @@ -548,10 +548,9 @@ static bool vp9_wait_dec_end(struct vdec_vp9_inst *i=
nst)
> =C2=A0static struct vdec_vp9_inst *vp9_alloc_inst(struct mtk_vcodec_dec_c=
tx *ctx)
> =C2=A0{
> =C2=A0	int result;
> -	struct mtk_vcodec_mem mem;
> +	struct mtk_vcodec_mem mem =3D { };
> =C2=A0	struct vdec_vp9_inst *inst;
> =C2=A0
> -	memset(&mem, 0, sizeof(mem));
> =C2=A0	mem.size =3D sizeof(struct vdec_vp9_inst);
> =C2=A0	result =3D mtk_vcodec_mem_alloc(ctx, &mem);
> =C2=A0	if (result)
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 145958206e38..d5e943f81c15 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -181,12 +181,11 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst
> *vpu, void *msg, int len)
> =C2=A0
> =C2=A0static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned i=
nt msg_id)
> =C2=A0{
> -	struct vdec_ap_ipi_cmd msg;
> +	struct vdec_ap_ipi_cmd msg =3D { };
> =C2=A0	int err =3D 0;
> =C2=A0
> =C2=A0	mtk_vdec_debug(vpu->ctx, "+ id=3D%X", msg_id);
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D msg_id;
> =C2=A0	if (vpu->fw_abi_version < 2)
> =C2=A0		msg.vpu_inst_addr =3D vpu->inst_addr;
> @@ -201,7 +200,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *v=
pu,
> unsigned int msg_id)
> =C2=A0
> =C2=A0int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =C2=A0{
> -	struct vdec_ap_ipi_init msg;
> +	struct vdec_ap_ipi_init msg =3D { };
> =C2=A0	int err;
> =C2=A0
> =C2=A0	init_waitqueue_head(&vpu->wq);
> @@ -225,7 +224,6 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D AP_IPIMSG_DEC_INIT;
> =C2=A0	msg.ap_inst_addr =3D (unsigned long)vpu;
> =C2=A0	msg.codec_type =3D vpu->codec_type;
> @@ -245,7 +243,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
> =C2=A0
> =C2=A0int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsign=
ed int
> len)
> =C2=A0{
> -	struct vdec_ap_ipi_dec_start msg;
> +	struct vdec_ap_ipi_dec_start msg =3D { };
> =C2=A0	int i;
> =C2=A0	int err =3D 0;
> =C2=A0
> @@ -254,7 +252,6 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t
> *data, unsigned int len)
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D AP_IPIMSG_DEC_START;
> =C2=A0	if (vpu->fw_abi_version < 2)
> =C2=A0		msg.vpu_inst_addr =3D vpu->inst_addr;
> @@ -273,7 +270,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t
> *data, unsigned int len)
> =C2=A0int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int len, unsigned int par=
am_type)
> =C2=A0{
> -	struct vdec_ap_ipi_get_param msg;
> +	struct vdec_ap_ipi_get_param msg =3D { };
> =C2=A0	int err;
> =C2=A0
> =C2=A0	if (len > ARRAY_SIZE(msg.data)) {
> @@ -281,7 +278,6 @@ int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint=
32_t
> *data,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	memset(&msg, 0, sizeof(msg));
> =C2=A0	msg.msg_id =3D AP_IPIMSG_DEC_GET_PARAM;
> =C2=A0	msg.inst_id =3D vpu->inst_id;
> =C2=A0	memcpy(msg.data, data, sizeof(unsigned int) * len);
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c.c
> b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index a01dc25a7699..bc6435a7543f 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -1064,7 +1064,7 @@ static int mtk_venc_encode_header(void *priv)
> =C2=A0
> =C2=A0static int mtk_venc_param_change(struct mtk_vcodec_enc_ctx *ctx)
> =C2=A0{
> -	struct venc_enc_param enc_prm;
> +	struct venc_enc_param enc_prm =3D { };
> =C2=A0	struct vb2_v4l2_buffer *vb2_v4l2 =3D v4l2_m2m_next_src_buf(ctx-
> >m2m_ctx);
> =C2=A0	struct mtk_video_enc_buf *mtk_buf;
> =C2=A0	int ret =3D 0;
> @@ -1075,7 +1075,6 @@ static int mtk_venc_param_change(struct
> mtk_vcodec_enc_ctx *ctx)
> =C2=A0
> =C2=A0	mtk_buf =3D container_of(vb2_v4l2, struct mtk_video_enc_buf,
> m2m_buf.vb);
> =C2=A0
> -	memset(&enc_prm, 0, sizeof(enc_prm));
> =C2=A0	if (mtk_buf->param_change =3D=3D MTK_ENCODE_PARAM_NONE)
> =C2=A0		return 0;
> =C2=A0
> @@ -1138,7 +1137,7 @@ static void mtk_venc_worker(struct work_struct *wor=
k)
> =C2=A0	struct mtk_vcodec_enc_ctx *ctx =3D container_of(work, struct
> mtk_vcodec_enc_ctx,
> =C2=A0				=C2=A0=C2=A0=C2=A0 encode_work);
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> -	struct venc_frm_buf frm_buf;
> +	struct venc_frm_buf frm_buf =3D { };
> =C2=A0	struct mtk_vcodec_mem bs_buf;
> =C2=A0	struct venc_done_result enc_result;
> =C2=A0	int ret, i;
> @@ -1168,7 +1167,6 @@ static void mtk_venc_worker(struct work_struct *wor=
k)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> -	memset(&frm_buf, 0, sizeof(frm_buf));
> =C2=A0	for (i =3D 0; i < src_buf->vb2_buf.num_planes ; i++) {
> =C2=A0		frm_buf.fb_addr[i].dma_addr =3D
> =C2=A0				vb2_dma_contig_plane_dma_addr(&src_buf-
> >vb2_buf, i);
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> index 51bb7ee141b9..55627b71348d 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> @@ -132,7 +132,7 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu=
,
> void *msg,
> =C2=A0int vpu_enc_init(struct venc_vpu_inst *vpu)
> =C2=A0{
> =C2=A0	int status;
> -	struct venc_ap_ipi_msg_init out;
> +	struct venc_ap_ipi_msg_init out =3D { };
> =C2=A0
> =C2=A0	init_waitqueue_head(&vpu->wq_hd);
> =C2=A0	vpu->signaled =3D 0;
> @@ -148,7 +148,6 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.msg_id =3D AP_IPIMSG_ENC_INIT;
> =C2=A0	out.venc_inst =3D (unsigned long)vpu;
> =C2=A0	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
> @@ -191,11 +190,10 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
> =C2=A0	size_t msg_size =3D is_ext ?
> =C2=A0		sizeof(struct venc_ap_ipi_msg_set_param_ext) :
> =C2=A0		sizeof(struct venc_ap_ipi_msg_set_param);
> -	struct venc_ap_ipi_msg_set_param_ext out;
> +	struct venc_ap_ipi_msg_set_param_ext out =3D { };
> =C2=A0
> =C2=A0	mtk_venc_debug(vpu->ctx, "id %d ->", id);
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.base.msg_id =3D AP_IPIMSG_ENC_SET_PARAM;
> =C2=A0	out.base.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	out.base.param_id =3D id;
> @@ -258,11 +256,10 @@ static int vpu_enc_encode_32bits(struct venc_vpu_in=
st
> *vpu,
> =C2=A0	size_t msg_size =3D is_ext ?
> =C2=A0		sizeof(struct venc_ap_ipi_msg_enc_ext) :
> =C2=A0		sizeof(struct venc_ap_ipi_msg_enc);
> -	struct venc_ap_ipi_msg_enc_ext out;
> +	struct venc_ap_ipi_msg_enc_ext out =3D { };
> =C2=A0
> =C2=A0	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.base.msg_id =3D AP_IPIMSG_ENC_ENCODE;
> =C2=A0	out.base.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	out.base.bs_mode =3D bs_mode;
> @@ -302,12 +299,11 @@ static int vpu_enc_encode_34bits(struct venc_vpu_in=
st
> *vpu,
> =C2=A0				 struct mtk_vcodec_mem *bs_buf,
> =C2=A0				 struct venc_frame_info *frame_info)
> =C2=A0{
> -	struct venc_ap_ipi_msg_enc_ext_34 out;
> +	struct venc_ap_ipi_msg_enc_ext_34 out =3D { };
> =C2=A0	size_t msg_size =3D sizeof(struct venc_ap_ipi_msg_enc_ext_34);
> =C2=A0
> =C2=A0	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.msg_id =3D AP_IPIMSG_ENC_ENCODE;
> =C2=A0	out.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	out.bs_mode =3D bs_mode;
> @@ -367,9 +363,8 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigne=
d int
> bs_mode,
> =C2=A0
> =C2=A0int vpu_enc_deinit(struct venc_vpu_inst *vpu)
> =C2=A0{
> -	struct venc_ap_ipi_msg_deinit out;
> +	struct venc_ap_ipi_msg_deinit out =3D { };
> =C2=A0
> -	memset(&out, 0, sizeof(out));
> =C2=A0	out.msg_id =3D AP_IPIMSG_ENC_DEINIT;
> =C2=A0	out.vpu_inst_addr =3D vpu->inst_addr;
> =C2=A0	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {

--=-xig5edR/x3ap943HT9k2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLH2SwAKCRDZQZRRKWBy
9PWCAP0f1LmgksUyx6vPfKgnmSguVVzWU8MFLBRY7MOiMUd/iwD7BSsl2QkA8Wmk
z0Yo33ECEf32b/vaR8jSGT2efz6WqAI=
=KG+R
-----END PGP SIGNATURE-----

--=-xig5edR/x3ap943HT9k2--

