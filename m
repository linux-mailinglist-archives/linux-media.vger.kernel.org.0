Return-Path: <linux-media+bounces-49732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75307CE9CCD
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 970BF3004ED9
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433CA23D7F0;
	Tue, 30 Dec 2025 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+UzDTHu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC9233D85
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101992; cv=none; b=qmFabIzEIKkcLGOM+VjDwtXS8l4oCDVOJPQVd7msl1qoyGBAS3dGYgZg6eQTk2SzIxLjV5FkTa7/6dt+/8kZ4jiALKZz/y7u3WVo+Y0iq6dQ5XfF098wmz5sYtErn+DsJFIxDb+sa974NDGraDLiSvjxtY1VKLOoCE0r7C2KUqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101992; c=relaxed/simple;
	bh=OlkCqn8fXbP0BKS1z87/ZV5T/EiSvUw1/xi0wc+ejKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsySbXdXD4k5hIq4YWKa07GvOsBhSOGLcjHo3yFUiwWgvPI5SVI7e3h+J6MbvK5lNwXyG/PbbfjBHNO6DPhoVmCS8TiLibImsyOc/jYmLgF800kU27lokw2B2PzLQlEBSnW6+tbmjTVlItg24mBjQShWnvZwITFq0sYWbaQqSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+UzDTHu; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59a10df8027so12876871e87.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767101989; x=1767706789; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg1+ls4Dm0mVYOjkWjZgFsYapx+e4w8tJTjnMs5lrKs=;
        b=s+UzDTHuiGeSzvMLtmoAi5M5IJShFvnkkIDQ0GL1WL3pJ19ovhKE4nXHDxiOoUzcFg
         nIuardYjfu/ByuSCB+1kAxw1+mdBPUiadyZaoe3ucTO3cw5rBdm0gvFcL+5VB+pfioAY
         9CVatTIDXR+8ap1X+u8RPguYMepfTX6gZk6CTeinZAyy0VDrLULXfHP4npHYyikTGHV5
         In1U+MeUdq1nQHxhCfiaww3IFqmw4EwIK7WCM8RVxJNkNf1zosp+3Ko/F3bxID5b5ztQ
         gcCUFq2/u2hrs5BjJfge12+7oAbMb6Lybf0zkB1WLvobtm7lXrWjkrvlsOOrwlcXqCwz
         73kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767101989; x=1767706789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg1+ls4Dm0mVYOjkWjZgFsYapx+e4w8tJTjnMs5lrKs=;
        b=ouueb9F2SbFbnEWQI8v8cwIkGEe3xBGFmNaQaU8GVSq0hNO20gEZKPYbQzHHpUlrfl
         kUVaGqAt8ss3Eh2M+uu1i52KraLIng4sIBdhYzWVmKf2+ZysuffHHRzoV49WeLIdK7nI
         c98gBKqovv0u3mxUBFHuWSl33HogkaSXGZ4pQUeup9LdJnNr4TTgHEKtAPOCHSKQCNjx
         +r+/cvyo0fEI9Iofv/nFYPHzFzLrUQuFvmL3Qgge1UjL0jMaET4J5R5cs/9YuVNejQ8j
         JorWok37ExZTUgor7UyaCnyzkf8zN6cXn/+FjN1SUAOVSTbQ0K2no1/OCFs5xoUvDITV
         oodw==
X-Gm-Message-State: AOJu0YxqyAyO8K7ZaFSxuZFchc4wLq5IsfYJwLR1GNoxKiCWhpAxshcQ
	h26G0Ky8YET747Kz58G394qwnsuiyZsDVc7yWOhEP44d2X4FPVfLdc2Rc4BhdbAKeiu0p2Ua32A
	/6+cxRjBkRW8sLbQZhgTB8TnX4XzL3Ntzuivu2oL2Hg==
X-Gm-Gg: AY/fxX6v1riNLFII6z7mcgQQ6wZfWfIunj5mHlWCrS1hdiTXayH7vFyxW1O4I5KFi3W
	2NAmpcPj8Om0STgC8xHvzMGjrFiRRyBxw/tT4k0DFZnUkbrUgcm/BHj9mYEV4Z26c6r3NWyY0fM
	EZTuNff0LvdfrWivaxnYm5eFXc2GXfbAkaJZRQ+5ZPH+IvP1L3JneBB9Efzx3GFILdDe4S1iC5/
	CnWLuROeR7u7F/bhgxyQQEs8cB9i4w7mdJbnR2TF6YVMCFJaF5A6NC3NCCCjqRdpSdCo8d3
X-Google-Smtp-Source: AGHT+IFc2q13TthZOLNMt7KlXgzpHYzWQ4Oc1qku0cPr+yLi0Y1e7lT6nY190irxS/Myr4DyEyhRfiOI15TA9SqTEa4=
X-Received: by 2002:a05:6512:b20:b0:594:2870:9774 with SMTP id
 2adb3069b0e04-59a17d670f6mr11077610e87.38.1767101988845; Tue, 30 Dec 2025
 05:39:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-2-ming.qian@oss.nxp.com>
In-Reply-To: <20251205015428.643-2-ming.qian@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 14:39:12 +0100
X-Gm-Features: AQt7F2p9Tp60FXm9JL954U-IrjyLLANKEoHVrFFumJZKPA0geVKKGoJbY19yu5A
Message-ID: <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: v4l2-mem2mem: Add a kref to the
 v4l2_m2m_dev structure
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
>
> From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> Adding a reference count to the v4l2_m2m_dev structure allow safely
> sharing it across multiple hardware nodes. This can be used to prevent
> running jobs concurrently on m2m cores that have some internal resource
> sharing.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

I certainly don't have the complete picture for how this needs to work.

However, I was thinking that rather than using a kref and having to
share two specific functions to update it (v4l2_m2m_get|put), couldn't
we just use a device-link instead?

Kind regards
Uffe

> ---
> v4
> - Add my Signed-off-by
>
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 23 +++++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           | 21 +++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index fec93c1a9231..ae0de54d4c3e 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -90,6 +90,7 @@ static const char * const m2m_entity_name[] = {
>   * @job_work:          worker to run queued jobs.
>   * @job_queue_flags:   flags of the queue status, %QUEUE_PAUSED.
>   * @m2m_ops:           driver callbacks
> + * @kref:              device reference count
>   */
>  struct v4l2_m2m_dev {
>         struct v4l2_m2m_ctx     *curr_ctx;
> @@ -109,6 +110,8 @@ struct v4l2_m2m_dev {
>         unsigned long           job_queue_flags;
>
>         const struct v4l2_m2m_ops *m2m_ops;
> +
> +       struct kref kref;
>  };
>
>  static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
> @@ -1200,6 +1203,7 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
>         INIT_LIST_HEAD(&m2m_dev->job_queue);
>         spin_lock_init(&m2m_dev->job_spinlock);
>         INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
> +       kref_init(&m2m_dev->kref);
>
>         return m2m_dev;
>  }
> @@ -1211,6 +1215,25 @@ void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_m2m_release);
>
> +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev)
> +{
> +       kref_get(&m2m_dev->kref);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_get);
> +
> +static void v4l2_m2m_release_from_kref(struct kref *kref)
> +{
> +       struct v4l2_m2m_dev *m2m_dev = container_of(kref, struct v4l2_m2m_dev, kref);
> +
> +       v4l2_m2m_release(m2m_dev);
> +}
> +
> +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev)
> +{
> +       kref_put(&m2m_dev->kref, v4l2_m2m_release_from_kref);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_m2m_put);
> +
>  struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
>                 void *drv_priv,
>                 int (*queue_init)(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq))
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index bf6a09a04dcf..ca295c660c7f 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -547,6 +547,27 @@ v4l2_m2m_register_media_controller(struct v4l2_m2m_dev *m2m_dev,
>   */
>  void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev);
>
> +/**
> + * v4l2_m2m_get() - take a reference to the m2m_dev structure
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * This is used to share the M2M device across multiple devices. This
> + * can be used to avoid scheduling two hardware nodes concurrently.
> + */
> +void v4l2_m2m_get(struct v4l2_m2m_dev *m2m_dev);
> +
> +/**
> + * v4l2_m2m_put() - remove a reference to the m2m_dev structure
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Once the M2M device have no more references, v4l2_m2m_realse() will be
> + * called automatically. Users of this method should never call
> + * v4l2_m2m_release() directly. See v4l2_m2m_get() for more details.
> + */
> +void v4l2_m2m_put(struct v4l2_m2m_dev *m2m_dev);
> +
>  /**
>   * v4l2_m2m_ctx_init() - allocate and initialize a m2m context
>   *
> --
> 2.52.0
>

