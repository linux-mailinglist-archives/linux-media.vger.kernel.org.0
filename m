Return-Path: <linux-media+bounces-48927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE2CC535B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D39943007B6B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 21:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8E433711D;
	Tue, 16 Dec 2025 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="MSBKCuWW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637EB326951
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765920431; cv=none; b=hfeYSOx9nurOxLmk2pmgblCCkZy4EhTBKGz1HE4jxdmlTPh8rhmLGkUO8uk/4gkU1PRlzsZp5Z0bDoRYkZ+ptdWKMrs15yC/+4dnCeDv8lJ2GoHa2TG7kQEGMZSdL1qjGsWJM0IxnRdNm+L3psGtYLz9eEo66VsY8aKlI07a/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765920431; c=relaxed/simple;
	bh=UI1x1tjDth+/T8xXbUtl74nuaND9TRxR2Qw0Aop1pMk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=taVUg43JjiLaWVzrbla07Az3S7k07bl0pkmZDWN5EpO2x5GJxTg/lIdGQ+Qj9uCrRBEmpRMWCF/t56OFm7G3/uzfvpCxXtN55c2u9PrUGRGTmHsCXsysb8gaEC46Ub9fg5yzNWpjShhy1McyMe0q244Pplcv5mMsleGMpOlFfcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=MSBKCuWW; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso404716385a.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765920427; x=1766525227; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qpPwc/ojJwSf06+KkwiepAKE0uK8ZW+OfwBUCLSRmzU=;
        b=MSBKCuWWQPmlJsZB5N+Ech2pC+lXwCp7pxywuMYBLyLwnFqO8VBeusXfh5VrVfYqeP
         dKdMmmGVmijIl5uwjSGZIqF/CrFxocvQnjz2kcXqd5n9zc/7zUr0mVghHcCAxtukVq8i
         ACLy/EzBdBG3dfuAwwYjgMxjR9qrMO/T8+FhlpABT8Nb/E46xqDjLk/AlbjHRarqtbNs
         uEDRhq1+4AFLfNmk2k+wKD91k2lYPa45B53j+z6NMB7iTqEkZhMUjmu8tGSkKsjowWTR
         dJyh3iNP2/dmkE1D3cFguvYVNErDGRSAX0/aliYqlwRy5CRsxGJ9+UKmOAFjASXVaZm8
         uLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765920427; x=1766525227;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpPwc/ojJwSf06+KkwiepAKE0uK8ZW+OfwBUCLSRmzU=;
        b=YLDobpKs1DWDcaW/VuwTwGDke8qNjmn8KsBB2K6g82DsqfUKG1ZOCP+/lbAPWDobsy
         axZYJB8rPQRrAh7W6Uqw01VXi2dyoW885tFF5Dc8HZdcjaFoQpbkpT4JPavkQnh4gLIm
         6iIkFGK0KnMnSw1nli+5iSdv0zztX8jzpckRW2/3ufIez21GV1UnYBnM5G42o/uC175c
         eYl9D0zsgFh9CrzGJ6x5yHTO+wVhDd1iVPLhwud+LfGDXQqzrfdkuGdVapCWSD7OLDB2
         qOPUqcCAUZSUPTxp2uJegq3CEGld5u6ZXiYRV7vLGeaZmLuWqtuHiANiXUt8g+T0++o5
         20Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXPR7nUsYE29H8tLlDYA7nScoeB+jCqr8ej5QE1iRcTBeEZBcO5bk2YoreNuWFNLqtH2FyFa6/txJJHiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykfNFPd1IoQ+q2jtzJl8auEuPaYcjzlLzSqYOoMfGKRTIgvv8/
	Sikevw0UNaQd4I6mDXl9alE32PFU83cirfk9GTxAAcr/mk9Xn9XF+L+aUUNMy34uqrS2AChlEB7
	fy5Kuv6s=
X-Gm-Gg: AY/fxX6csGQg5KSAqxvlyM/5E+wqCqs1qrjVm0czrvtqzYuQBp+Ng/iL/rquKyD9hF4
	r+gyJGMOoOX97Ri689aBabbUPFnx9qPQrc6ydvV5I2/HRp54Qvmh1NV3mZcuKvVw4nR50H95dky
	d+nPNF2AKjPxM7uqGB4DNjG3wxCAtm2BBDULbrhUV6LXPAUui815541n5ljzHffsHneRxUM7vaF
	89uOFK3dRaDoUyYEZv6OX7IQsJRfM6WUZSGBh/Fv/cnVxGg8YKq+KUcDTmBX79TL8UScIxuKik2
	gLzQMnU/tvkEEGsOwjRM7+Jtr1rLuRBc0hya3/l2CW7WM/Hg1qXG+1YzJOKg+RdNXKYXB+SjN4m
	t2vgNMQS5DNmvXzAyAO3NNQYx12WOAoD+DPVzguIoQlNnLazuunb1Rjc1WNzCniP6TMGkh/LZYT
	YG4hgvKYXb7mzuBb9I
X-Google-Smtp-Source: AGHT+IFtjPlaAXNAStcB6qE9OAu4UAvfU1mAV30voPQRRG7UOeEXE3kEWcnteyKszbCeZlPTCE1H5A==
X-Received: by 2002:a05:620a:3186:b0:89f:cc73:386 with SMTP id af79cd13be357-8bb397de8d9mr1984233485a.13.1765920427047;
        Tue, 16 Dec 2025 13:27:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d86a2dsm263024485a.15.2025.12.16.13.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:27:06 -0800 (PST)
Message-ID: <bf9d84ad6973d55f40bafdb9a70dc49178d4af10.camel@ndufresne.ca>
Subject: Re: [PATCH v11 04/12] media: mediatek: jpeg: fix stop streaming
 flow for multi-core
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:27:05 -0500
In-Reply-To: <20251202094800.6140-5-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-hrmOcurXokVRwIdeYyvP"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-hrmOcurXokVRwIdeYyvP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> For jpeg multi-core architecture, if all hardware run at the
> same time, some input and output buffers are occupied.
> If one hardware is completed firstly, while other hardwares are

is compelted -> completes
harwares -> core, matches mtk_jpeg_core.c file name

> still running. The decoding completion signal calls

decoding -> decode.

> mtk_jpeg_dec_stop_streaming, and the function of v4l2_m2m_buf_done
> is called in mtk_jpeg_dec_stop_streaming to complete all
> input/output buffers. However, some buffers are occupied by other
> hardwares, resulting in errors. It needs to add a counter to
> calculate the used decoding buffer counts, it will increase 1 when
> the buffer set to hardware and decrease to 0 until the all buffers
> decoded and the function could continue to be executed.

More things to fix, also same for other of your commits, please reflow betw=
een
70 and 75 as suggested in the guide. It should look even.

>=20
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../media/platform/mediatek/jpeg/mtk_jpeg_core.c | 16 +++++++++++++=
+++
> =C2=A0.../media/platform/mediatek/jpeg/mtk_jpeg_core.h |=C2=A0 2 ++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 9 +++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 9 +++++++++
> =C2=A04 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index bd0afc93d491..59fd79c89f88 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -857,8 +857,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(s=
truct mtk_jpeg_ctx *ctx,
> =C2=A0static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> +	if (jpeg->variant->multi_core)
> +		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) =3D=3D 0));
> +

Can't it simply be solved with vb2_wait_for_all_buffers() ?

Nicolas

> =C2=A0	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
> =C2=A0		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> =C2=A0}
> @@ -866,6 +870,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_qu=
eue *q)
> =C2=A0static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> =C2=A0	/*
> @@ -873,6 +878,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
eue *q)
> =C2=A0	 * Before STREAMOFF, we still have to return the old resolution an=
d
> =C2=A0	 * subsampling. Update capture queue when the stream is off.
> =C2=A0	 */
> +	if (jpeg->variant->multi_core)
> +		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) =3D=3D 0));
> +
> =C2=A0	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 V4L2_TYPE_IS_CAPTURE(q->type)) {
> =C2=A0		struct mtk_jpeg_src_buf *src_buf;
> @@ -1181,6 +1189,7 @@ static int mtk_jpeg_open(struct file *file)
> =C2=A0	spin_lock_init(&ctx->done_queue_lock);
> =C2=A0	v4l2_fh_init(&ctx->fh, vfd);
> =C2=A0	v4l2_fh_add(&ctx->fh, file);
> +	atomic_set(&ctx->buf_list_cnt, 0);
> =C2=A0
> =C2=A0	ctx->jpeg =3D jpeg;
> =C2=A0	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
> @@ -1563,6 +1572,11 @@ static int mtk_jpegdec_set_hw_param(struct mtk_jpe=
g_ctx *ctx,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_inc(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_inc(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx;
> @@ -1671,6 +1685,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &src_buf->vb2_buf);
> =C2=A0	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> @@ -1786,6 +1801,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				&bs,
> =C2=A0				&fb);
> =C2=A0	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 148fd41759b7..33f7fbc4ca5e 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -288,6 +288,7 @@ struct mtk_jpeg_q_data {
> =C2=A0 * @dst_done_queue:		encoded frame buffer queue
> =C2=A0 * @done_queue_lock:		encoded frame operation spinlock
> =C2=A0 * @last_done_frame_num:	the last encoded frame number
> + * @buf_list_cnt:		the frame buffer count own by jpeg driver
> =C2=A0 */
> =C2=A0struct mtk_jpeg_ctx {
> =C2=A0	struct mtk_jpeg_dev		*jpeg;
> @@ -306,6 +307,7 @@ struct mtk_jpeg_ctx {
> =C2=A0	/* spinlock protecting the encode done buffer */
> =C2=A0	spinlock_t done_queue_lock;
> =C2=A0	u32 last_done_frame_num;
> +	atomic_t buf_list_cnt;
> =C2=A0};
> =C2=A0
> =C2=A0#endif /* _MTK_JPEG_CORE_H */
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index a1e54715cb7e..84d12eea35f7 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -519,6 +519,11 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_c=
omp_dev *jpeg)
> =C2=A0	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_dec(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static void mtk_jpegdec_timeout_work(struct work_struct *work)
> =C2=A0{
> =C2=A0	enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_ERROR;
> @@ -527,9 +532,11 @@ static void mtk_jpegdec_timeout_work(struct work_str=
uct *work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 job_timeout_work.work);
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_ctx *ctx;
> =C2=A0
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> +	ctx =3D cjpeg->hw_param.curr_ctx;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0
> =C2=A0	mtk_jpeg_dec_reset(cjpeg->reg_base);
> @@ -540,6 +547,7 @@ static void mtk_jpegdec_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(cjpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -580,6 +588,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 28d05909c96f..1862444f35f5 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -248,6 +248,11 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_c=
omp_dev *jpeg)
> =C2=A0	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_enc(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_dec(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static void mtk_jpegenc_timeout_work(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct delayed_work *dly_work =3D to_delayed_work(work);
> @@ -258,9 +263,11 @@ static void mtk_jpegenc_timeout_work(struct work_str=
uct *work)
> =C2=A0	struct mtk_jpeg_dev *master_jpeg =3D cjpeg->master_dev;
> =C2=A0	enum vb2_buffer_state buf_state =3D VB2_BUF_STATE_ERROR;
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_ctx *ctx;
> =C2=A0
> =C2=A0	src_buf =3D cjpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D cjpeg->hw_param.dst_buffer;
> +	ctx =3D cjpeg->hw_param.curr_ctx;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0
> =C2=A0	mtk_jpeg_enc_reset(cjpeg->reg_base);
> @@ -271,6 +278,7 @@ static void mtk_jpegenc_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(cjpeg);
> +	jpeg_buf_queue_enc(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -304,6 +312,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> +	jpeg_buf_queue_enc(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> =C2=A0

--=-hrmOcurXokVRwIdeYyvP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHOqQAKCRDZQZRRKWBy
9LnXAP9/A/m0O050auffdCmga5tYXeI/6re+ffgCRjPOcyPQUwD/fMHBNoO7F3CB
kkLfUe1Cz72voTA7nOv8EGNDVGbolQc=
=iUHr
-----END PGP SIGNATURE-----

--=-hrmOcurXokVRwIdeYyvP--

