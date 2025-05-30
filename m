Return-Path: <linux-media+bounces-33702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA9AC94E0
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 19:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8D227ADE64
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99D7256C87;
	Fri, 30 May 2025 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="bw7qB5G4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897823C4E0
	for <linux-media@vger.kernel.org>; Fri, 30 May 2025 17:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626840; cv=none; b=BPaulxCEDqBa8hfd1s1PXyPb5zqETmrBVTDpED96uj+ba85egzRs1ZD27Gswa5vFOpiHE7GRNVCoQcv3sHKZjqF9vTD7LhqwvmYkBY53pjmSo5/rldWTEqiv3OZ3F40aBWPLMmzKGAZS0Zz9knPokt9IhAp8rXdcwGh6EksAxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626840; c=relaxed/simple;
	bh=TjE3TuWTC7ZxWpCD4mVw/9MZkDd71cvrQk0Vn2fYkRU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJh3Nmw3/aRb6Zf1M6DFh9gy9s8RqRi97rUCSHGfmS8TIrJUhCzzM/6ySnHX7UpObz7l00eqEE+0phd/TQZJNAE50vMmlVDt2+RFJqrLkm6CruSpZENEWZVRRMQFYnCPTZfDG0CGyhTe/v4VzxoOboAUWoAdTBYRufKSZbqY+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=bw7qB5G4; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fabe9446a0so26085346d6.2
        for <linux-media@vger.kernel.org>; Fri, 30 May 2025 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748626837; x=1749231637; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OGIt7fGfLkqkmefeoi/6+HBzHwhg6ItEe9YbKim/Fn4=;
        b=bw7qB5G4wtQ1Zwk2XQFBbCqALOS3snbsDKdFSQt7DvUJ7fvK+V3UnLjkT2fG5LR0ON
         luu8PlG3TohvAC6/VTz1lUqHoZglUlQA9zs2Vloh9bST2kMJBQlzW9SYlLLDwScqMNj8
         7lQwWRBafmlNIYvz0k5e2NZDZEILknELnyfYKr6zfz7DZFOZBjiNuTLdx7DI6tRdIFSJ
         iJO11ckNNnpwBBg0VKZRSRaA87mR96xWFwEVNda9QdJ6AnLlN8W7L28FTKMtOqpRevNi
         4iS3v2bImY8EDtLmt7Hy3WxngEdq8X8xunFmy52KEcTsHei+5GMrvY/VfEzXlSOJDSBa
         Sj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626837; x=1749231637;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OGIt7fGfLkqkmefeoi/6+HBzHwhg6ItEe9YbKim/Fn4=;
        b=m5UEUOi1Y1NjDHfS0rj0xtsvLbnYiAIBIWGKicjNK+jP2KltpdOMLkoTwSQdr7de7T
         VilI6Y6yy/3tPlnddz15LjCUr1GBWQksPJvcbAwOyBS+HeRj3vq1AFkG+VUmcu3M0Dbc
         6yz0vLgWNxidLXqsZKL2ZC0lUQQrV0S9GhlwKUJUapZFcK8WblJzeTFAo9j/w0Desw2d
         AqVuSHag13dcQtoRVM9HfZ2SCuBEJJh1wpPxquGRUtskyjAuo0NyV1bPqiFLT/zIBqk0
         VlkqElaT2A5QjW1qow11GUvuoOfiVv/6rRwfz8UfNrChj9Qpjcpb2Qih0KsBr82EQqJR
         rMyg==
X-Forwarded-Encrypted: i=1; AJvYcCWD8X1wxFeEIsKYC1+mw2wYOC3Dnp1zJkJO8B1gyMCrUxElubIEY8CTY3JgpP1f5dMEeUTV965o5KnsbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQX5OFtGNXfpjzwTSk0xt0ozEcVpcRZcL15OYlKszhW6Cx+Yy
	v6H1/6vKdLb1aTvFJg2hB/o0oO9z/yVfEXptlUOBn4bt1ITReo87zmbffEcb1oBhmmQ=
X-Gm-Gg: ASbGncsy/+fesfhBMmHq54MAG11jjYumk0n+2D8+/5FIXAY84hVTPtqmplEolmV+mAu
	XSsrujAKTM/uXPHxx7jGAFDSxnjHG2WpfVBype78BlAtUEZjF/TULWUjrWFBwy7Ap1h45io4N23
	J1JLT4U8N3MiBQse60ly/Pt5hx5bPxKUazWCRYKKvcbTIyDTjUl1CMxRAyxKAkpVnN0wWrJ+E95
	jrcwK8u4B4q/DYh6BuDri5tHuU7Sz0woQ+tWWfQEHmKYBoMuSYihu1iY35FmrNsqru+VWVjizlk
	IPnIbj6GGagVF/vdbLQQe89hHMFDaU/hzeYTVTvUog5S9XZqvfUz/spb
X-Google-Smtp-Source: AGHT+IFFphelem2lT7rPHImGcfd36APqsIVAJRjaAQXe+AmpHPVBtHn4sk8+HSeIEdlDtXFWhnj1Hg==
X-Received: by 2002:ad4:5d49:0:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6facec00e29mr76555746d6.33.1748626837277;
        Fri, 30 May 2025 10:40:37 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e35e4sm269580285a.15.2025.05.30.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:40:36 -0700 (PDT)
Message-ID: <8ff9cf88b2498e4bfd4c12b9c01cfaf046b92fd6.camel@ndufresne.ca>
Subject: Re: [PATCH v5 08/12] media: mediatek: jpeg: fix stop streaming flow
 for multi-core
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:40:35 -0400
In-Reply-To: <20250530074537.26338-9-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. For multi-core jpegdec, the all hws may run at the same time,
> if one hw decoded firstly, the function of mtk_jpeg_dec_stop_streaming
> would be called, but others input buffers are decoding, this will
> cause some running buffers to be buffer done, causing errors;
> 2. add a parameter to calculate the decoding buffer counts, it
> wil decrease to 0 until the all buffers decoded and the
> mtk_jpeg_dec_stop_streaming could continue to be executed.

This one is equally unclear to me. If you run different queues per core,
why does this matter ?

Nicolas

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
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 7e3509be6f69..1d3df1230191 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -861,8 +861,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(s=
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
> =C2=A0	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
> =C2=A0		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> =C2=A0}
> @@ -870,6 +874,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_qu=
eue *q)
> =C2=A0static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> =C2=A0	/*
> @@ -877,6 +882,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
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
> @@ -1186,6 +1194,7 @@ static int mtk_jpeg_open(struct file *file)
> =C2=A0	v4l2_fh_init(&ctx->fh, vfd);
> =C2=A0	file->private_data =3D &ctx->fh;
> =C2=A0	v4l2_fh_add(&ctx->fh);
> +	atomic_set(&ctx->buf_list_cnt, 0);
> =C2=A0
> =C2=A0	ctx->jpeg =3D jpeg;
> =C2=A0	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
> @@ -1568,6 +1577,11 @@ static int mtk_jpegdec_set_hw_param(struct mtk_jpe=
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
> @@ -1693,6 +1707,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &src_buf->vb2_buf);
> =C2=A0	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> @@ -1825,6 +1840,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				&bs,
> =C2=A0				&fb);
> =C2=A0	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> +	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 186cd1862028..6e8304680393 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -303,6 +303,7 @@ struct mtk_jpeg_q_data {
> =C2=A0 * @dst_done_queue:		encoded frame buffer queue
> =C2=A0 * @done_queue_lock:		encoded frame operation spinlock
> =C2=A0 * @last_done_frame_num:	the last encoded frame number
> + * @buf_list_cnt:		the frame buffer count own by jpeg driver
> =C2=A0 */
> =C2=A0struct mtk_jpeg_ctx {
> =C2=A0	struct mtk_jpeg_dev		*jpeg;
> @@ -321,6 +322,7 @@ struct mtk_jpeg_ctx {
> =C2=A0	/* spinlock protecting the encode done buffer */
> =C2=A0	spinlock_t done_queue_lock;
> =C2=A0	u32 last_done_frame_num;
> +	atomic_t buf_list_cnt;
> =C2=A0};
> =C2=A0
> =C2=A0#endif /* _MTK_JPEG_CORE_H */
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 2200f3b628dc..2e6da8617484 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -522,6 +522,11 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_c=
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
> @@ -530,9 +535,11 @@ static void mtk_jpegdec_timeout_work(struct work_str=
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
> @@ -543,6 +550,7 @@ static void mtk_jpegdec_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(cjpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -583,6 +591,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 4c264c14ad83..ff73393a2417 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -251,6 +251,11 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_c=
omp_dev *jpeg)
> =C2=A0	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
> =C2=A0}
> =C2=A0
> +static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
> +{
> +	atomic_dec(&ctx->buf_list_cnt);
> +}
> +
> =C2=A0static void mtk_jpegenc_timeout_work(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct delayed_work *dly_work =3D to_delayed_work(work);
> @@ -261,9 +266,11 @@ static void mtk_jpegenc_timeout_work(struct work_str=
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
> @@ -274,6 +281,7 @@ static void mtk_jpegenc_timeout_work(struct work_stru=
ct *work)
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(cjpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -307,6 +315,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> +	jpeg_buf_queue_dec(ctx);
> =C2=A0	pm_runtime_put(ctx->jpeg->dev);
> =C2=A0	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> =C2=A0

