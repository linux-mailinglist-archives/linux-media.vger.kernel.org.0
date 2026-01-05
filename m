Return-Path: <linux-media+bounces-49942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61805CF5437
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 19:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDF10302E33D
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 18:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7455733FE04;
	Mon,  5 Jan 2026 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="dtvOsx1V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B5C13FEE
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767638812; cv=none; b=YNsgqEaJguGNiJfMgkWEs6+9FZjDZP6gQWIG/kvxMy4LPCs+zI1Dr6Ineb5vT5tm/7I1n4HdGbuEO4WDJIin8bmU1s4IdfFBJTaF56g+S2GPNTmWryHd/FSK71cEiV3FXNnc9RSLnn1Ig9kBC9mEs1JDKkTRmmeqjkBZ1ZJ1gyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767638812; c=relaxed/simple;
	bh=os6DBzaMNxDvmNMSTQ+VdPrS30kOfDBC9Za32IoqnbU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ER2y+R/lcNZJC9C6L1u4nab9HrRxpEFttmHtNriveX8aFSCB+zUY61BiJeyr7ncldOLKhp/MdEr0a5V/pHMfw9dKXtYN773uqSFl+Nzj2FMTPZDdMXPgY/p38KiIBfhmUiYLe/MKw5Goc2w51xET5bbW9ttxkaLnuonFFOssMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=dtvOsx1V; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b2ea2b9631so20319585a.3
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 10:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767638809; x=1768243609; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yZnOdsozigfnZyIEIN8jhynJ9qqqQ8eDPt4cphWZsqA=;
        b=dtvOsx1V5MHhf4GEnp/pEwvUX2zoCRF5IDytJYE6+tUdA9Y8q0Q88mKQjPcumi9Ugu
         mhjiq6V2g4nspOzhrCMyxdBQCIkGtHCOoCeRG87igEIifcuyNu29VhZhKGisueRD4VXK
         6DEVqxyu2BKRUw+7lc0smBy4IjnisKUU6DceHh1UJjqYoCnMJ/9atUA8mk6IXX5A+ZjI
         bl/4GXD0KmZVXUgjUn6rJLnZkVTOFSrdTfCBco56/rECi0lenllstIzWY7NXysGj9seT
         STtgVAzRvDutyJv+CuBzDfms/h0qBhdomrrMexxtAc/SKfdPUg6rBbxwEYQGAbwpRfuw
         sDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767638809; x=1768243609;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZnOdsozigfnZyIEIN8jhynJ9qqqQ8eDPt4cphWZsqA=;
        b=FTpiQKaPQyudUMn4x1YxW8AJliZgYnIHXa7yidhdAhbovYlCtG7JZq7cY8T+bfMW1S
         ysHf5jPI4RWH0IYNuimR5jrG8BZXOy8muv/XmCCN1oRBnvg2XM8shDvDtH+G/cpXUeXe
         3qw5VgTNm80NoqkRv3aPCdtsmTOFGRqaWbWijRDVgFCmk9zfEg6avv2WCXLOsQnmUi8W
         LMq6nLdoBLZzlzdHJKJ8cpV9tDgIJrhuyBomkPcAN1+I8qznkh7LQ2epVlzS1VbHeQ0G
         qTpEL9J7wDhl1Fim8H4ooIqNJNQRiAyPueB/67Uldf3e2/TRRk3y0sqNzziLn/DzP6zy
         IgzA==
X-Gm-Message-State: AOJu0YxffvEpUelm7cV13zoVjboxSMgGGmixDpqYzdnzoTzSOMlMMAL5
	/VKJYkdKhBREoOTMTXi+3mPz9k9wVB29TH6SEZD8aaJ0g9LlDxkEXzpp1YCAXve0beE=
X-Gm-Gg: AY/fxX6lvOLEBZ+zUpzFFqE5281GHpDvMmkj9Oh8+TPTYJU/QKPjSV5qDrL/UcbEdNz
	OmbBhHz5lpP0SLw8bHVLF9rpvFOkqUduz5mUAaESHKPFcuNVcLbOGPVrLGbrbnH8KGsOiHfgEE1
	+7ojo08291t2D4h55xcCdxBmyvAKVR40s9YtBJkc6yV8bTTLdX6LYNhbaJ0s3kB9sB9uCbK3hEU
	RFFTNZZlALiamsNIoUnRmoFH1PPMMiUCa/eGhyvWPDJWU+Ro0SZWLEBTwdgLeuTq5Us48lhAoqb
	SHWziZIdfRwQpQbcxm6MlaLutiyJQQ6CbIpbgefrIWGipMGuRlKvChWliYmVbqJ2VhTgsuHVEht
	7oatR8+gj5aKZ0pjQ7uudLpZmWJTp/rE6RFQitKYIpmPNndbvHLapnRzxkAiDbt/db1HzUFn5kM
	mWTupPnZk+MenoPWrK
X-Google-Smtp-Source: AGHT+IG087vGp2iFz8D11dhPjiLEb1sZ6Popre67cmU11ohMCxVmrUGEvm/Wny8Rba2WQ1bxfQu9Ug==
X-Received: by 2002:a05:620a:1a23:b0:8b1:59d9:f1e5 with SMTP id af79cd13be357-8c37eb7da62mr87140885a.30.1767638809200;
        Mon, 05 Jan 2026 10:46:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a7962sm9541285a.11.2026.01.05.10.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:46:48 -0800 (PST)
Message-ID: <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Stefan Klug <stefan.klug@ideasonboard.com>, Xavier Roumegue	
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt	 <rostedt@goodmis.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Date: Mon, 05 Jan 2026 13:46:46 -0500
In-Reply-To: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-0G4ZGPeYMAoiHGOFHCtr"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0G4ZGPeYMAoiHGOFHCtr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=C2=A0=
:
> The dw100 dewarper hardware present on the NXP i.MX8MP allows very
> flexible dewarping using a freely configurable vertex map. Aside from
> lens dewarping the vertex map can be used to implement things like
> arbitrary zoom, pan and rotation. The current driver supports setting
> that vertex map before calling VIDIOC_STREAMON.
>=20
> To control above mentioned features during streaming it is necessary to
> update the vertex map dynamically. To do that in a race free manner V4L2
> requests support is required. This patch adds V4L2 requests support to
> prepare for dynamic vertex map updates.
>=20
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
>=20
> ---
>=20
> Changes in v1:
> - Moved v4l2_ctrl_request_complete into dw100_device_run
> ---
> =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 41 +++++++++++++++++++++=
+++++++----
> =C2=A01 file changed, 36 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/pla=
tform/nxp/dw100/dw100.c
> index 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..7f14b82c15a071605c124dbb8=
68f8003856c4fc0 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -459,6 +459,15 @@ static int dw100_queue_setup(struct vb2_queue *vq,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int dw100_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field =3D V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> =C2=A0static int dw100_buf_prepare(struct vb2_buffer *vb)
> =C2=A0{
> =C2=A0	unsigned int i;
> @@ -500,6 +509,13 @@ static void dw100_buf_queue(struct vb2_buffer *vb)
> =C2=A0	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> =C2=A0}
> =C2=A0
> +static void dw100_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct dw100_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> +}
> +
> =C2=A0static void dw100_return_all_buffers(struct vb2_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 enum vb2_buffer_state state)
> =C2=A0{
> @@ -553,11 +569,13 @@ static void dw100_stop_streaming(struct vb2_queue *=
q)
> =C2=A0}
> =C2=A0
> =C2=A0static const struct vb2_ops dw100_qops =3D {
> -	.queue_setup	 =3D dw100_queue_setup,
> -	.buf_prepare	 =3D dw100_buf_prepare,
> -	.buf_queue	 =3D dw100_buf_queue,
> -	.start_streaming =3D dw100_start_streaming,
> -	.stop_streaming=C2=A0 =3D dw100_stop_streaming,
> +	.queue_setup	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_queue_setup,
> +	.buf_out_validate=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_buf_out_validate,
> +	.buf_prepare	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_buf_prepare,
> +	.buf_queue	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_buf_queue,
> +	.start_streaming=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_start_streamin=
g,
> +	.stop_streaming=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_stop_stre=
aming,
> +	.buf_request_complete =3D dw100_buf_request_complete,
> =C2=A0};
> =C2=A0
> =C2=A0static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_v=
q,
> @@ -575,6 +593,7 @@ static int dw100_m2m_queue_init(void *priv, struct vb=
2_queue *src_vq,
> =C2=A0	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> =C2=A0	src_vq->lock =3D &ctx->vq_mutex;
> =C2=A0	src_vq->dev =3D ctx->dw_dev->v4l2_dev.dev;
> +	src_vq->supports_requests =3D true;
> =C2=A0
> =C2=A0	ret =3D vb2_queue_init(src_vq);
> =C2=A0	if (ret)
> @@ -1460,6 +1479,12 @@ static void dw100_device_run(void *priv)
> =C2=A0	src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> =C2=A0	dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =C2=A0
> +	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> +				&ctx->hdl);
> +
> +	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> +				=C2=A0=C2=A0 &ctx->hdl);

The request should always be signalled last, so nothing wrong with applying=
 the
controls as soon as possible in this case. Complete is a bit of a miss-lead=
ing
name, this function actually changes the global controls value (apply) and
removes its participation in request completion. Since the OUTPUT buffer fo=
r
that request is still queued, the request is not signalled yet.

But you have to flip over the order to buffer signalling in dw100_job_finis=
h()
though. My recommendation is to use the helper
v4l2_m2m_buf_done_and_job_finish(). Something like this (not tested):

   diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/pl=
atform/nxp/dw100/dw100.c
   index 4aaf9c3fff53..c5f9ee238345 100644
   --- a/drivers/media/platform/nxp/dw100/dw100.c
   +++ b/drivers/media/platform/nxp/dw100/dw100.c
   @@ -1058,7 +1058,6 @@ static const struct v4l2_ioctl_ops dw100_ioctl_ops=
 =3D {
    static void dw100_job_finish(struct dw100_device *dw_dev, bool with_err=
or)
    {
           struct dw100_ctx *curr_ctx;
   -       struct vb2_v4l2_buffer *src_vb, *dst_vb;
           enum vb2_buffer_state buf_state;
   =20
           curr_ctx =3D v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
   @@ -1069,16 +1068,12 @@ static void dw100_job_finish(struct dw100_device=
 *dw_dev, bool with_error)
                   return;
           }
   =20
   -       src_vb =3D v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
   -       dst_vb =3D v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
   -
           if (likely(!with_error))
                   buf_state =3D VB2_BUF_STATE_DONE;
           else
                   buf_state =3D VB2_BUF_STATE_ERROR;
   =20
   -       v4l2_m2m_buf_done(src_vb, buf_state);
   -       v4l2_m2m_buf_done(dst_vb, buf_state);
   +       v4l2_m2m_buf_done_and_job_finish(dw_dev->m2m_dev, buf_state);
   =20
           dev_dbg(&dw_dev->pdev->dev, "Finishing transaction with%s error(=
s)\n",
                   with_error ? "" : "out");
  =20
You might be tempted to keep the logical order, and move the
v4l2_ctrl_request_complete() call into dw100_job_finish(), unfortunately th=
is
does not work, since nothing mandate that any control was included in this
request, and that will lead to calling v4l2_ctrl_request_complete() on an
already completed request. Since its a single function HW, I don't see why =
you'd
want this, but it would require the manual request completion.

> +
> =C2=A0	dw100_start(ctx, src_buf, dst_buf);

nit: I really don't see why this is a separate function ...

> =C2=A0}
> =C2=A0
> @@ -1467,6 +1492,11 @@ static const struct v4l2_m2m_ops dw100_m2m_ops =3D=
 {
> =C2=A0	.device_run	=3D dw100_device_run,
> =C2=A0};
> =C2=A0
> +static const struct media_device_ops dw100_m2m_media_ops =3D {
> +	.req_validate =3D vb2_request_validate,
> +	.req_queue =3D v4l2_m2m_request_queue,
> +};
> +
> =C2=A0static struct video_device *dw100_init_video_device(struct dw100_de=
vice *dw_dev)
> =C2=A0{
> =C2=A0	struct video_device *vfd =3D &dw_dev->vfd;
> @@ -1578,6 +1608,7 @@ static int dw100_probe(struct platform_device *pdev=
)
> =C2=A0	dw_dev->mdev.dev =3D &pdev->dev;
> =C2=A0	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
> =C2=A0	media_device_init(&dw_dev->mdev);
> +	dw_dev->mdev.ops =3D &dw100_m2m_media_ops;
> =C2=A0	dw_dev->v4l2_dev.mdev =3D &dw_dev->mdev;
> =C2=A0
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);

regards,
Nicolas

--=-0G4ZGPeYMAoiHGOFHCtr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVwHFgAKCRDZQZRRKWBy
9IMFAQD3NBR3bcRcbDohyzetTD0fVi/ACPAgEbrHIdWebcuBPAEA2whnOTljbzEX
howgWxx9aBt8rnEjnupRGzPrzTya7Ao=
=1sGV
-----END PGP SIGNATURE-----

--=-0G4ZGPeYMAoiHGOFHCtr--

