Return-Path: <linux-media+bounces-17824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2F96FC1F
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 21:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7722DB23913
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62061D2F62;
	Fri,  6 Sep 2024 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Y8aJnaXM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42A1D2206
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725650796; cv=none; b=jNoAoNVbUhbhAy3wg4JKJaL04/3VcFLm0jDkRhr3LdA9usMc42+FfOm0tETPzDs7PsCr0Lr5vuHLTp1BzklqjfUe30tOlsWzAMNqHbskr9WSJvS+qDVfihiP+cxm5d1x5e8373pPXMYcMFeGVpHXKODqc3IpsVNlyZNg9qU3qNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725650796; c=relaxed/simple;
	bh=dFOEJOkTIW9VJAqzomM8MpOXFJ5598fxDdnBzG+piN0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sPpN846BUpfERlo3NowY48rUAoV4Eqj/tMVMTL01Anc3i/oaq9zHYPS9GJMJMg5AuH2Kp9RMAYmaKbe0LuQwn0tgHPvkuWXCfk6hQO5O8mU9de7ud6MTBeE5oaH1nBbwH/3J6w3EAJLsIUTfdehZx0epy2GKciYw/vZmplfHcbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Y8aJnaXM; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4581e0ed0f2so3680011cf.1
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1725650793; x=1726255593; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rzFETCv1CaShkbGW9M6Y94od6f0Z+iK4OmUpYkgax44=;
        b=Y8aJnaXMbwPUEEUiB5uTXA+Z0wTCxbxlopt+oV/MC17hrVkZWhvz/MB1nlM01AkBU4
         B+PdXWFxyfXjVOoTGwu8nPrGSooyek3YSOoyeU1GgIX/yZZUWwfr+pxrabs4vR20UiDz
         oXUOCyZo2y9vNFzAT6eoEZnbhudGM1vKTgXZ/Ef59PpF8ViUK9wL5QfACX+pjTpJyDW7
         d9GxpjUMdv4f65Lw9Bx4r1EOpH+KFXJ7SEek8wXSUOK1iml8y4siG+o9YvcmLty+IelF
         D1xqDWp1x4vV/r7cEPQd/b3h2TuUQ8Nl7pRCFb35/54qtiv8aj8QwpWI47cemto4CPBN
         dDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725650793; x=1726255593;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzFETCv1CaShkbGW9M6Y94od6f0Z+iK4OmUpYkgax44=;
        b=IdC+JtoryvD7xtzZ9iCT7cPQ89bH0iR/2uqzPcOUQ0cDJyNXV/IllzYq7RQ+Xp3DM/
         MrDHttkZ3JxlCMnqhi+1uwtIDmRVCkAUb5+kaz+dAF2sVFnNqT+BbSlkHczHj+WlEbCN
         z206l9m4XoBN8f62DGwo2pJJur50yRBKeQ1brP69oCe5WN1vgR9hxCsy75ACFhys+SPl
         ONe7lfCWTtQPNYOIzw0niuf2bfLM9sXF/Iv0FdHs45K6QmpIKjQGs34EsdoAnktS+s8Y
         mhRx5nNufkVTbBTVpwxQlGwiKP8sjyk8Q6oMJk5qA3ukRdnlghJyvhzEADP06hkEIqHg
         iW8Q==
X-Gm-Message-State: AOJu0YyPoDfQotzpki4uygC6EeQaER+7GsYoBumA5pxJ96AJPVIHjXsG
	Yn0s+BJaFejzR/lps2RGj1MyYROYly5JnpmEvBTLZoUx6P4xmLoX2Y3yknz+iYKgrna22BVYdlo
	+pKA=
X-Google-Smtp-Source: AGHT+IGoyyWyaFBEzRhaBzJJh5g4wYsQ1LeGIcI6BYZHYVxGEaFxJzMTQCQbkugcrUz2DECs11poVg==
X-Received: by 2002:ac8:5709:0:b0:44f:f271:af63 with SMTP id d75a77b69052e-457f8c63893mr160462411cf.21.1725650792522;
        Fri, 06 Sep 2024 12:26:32 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::580])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801b320dasm18748971cf.25.2024.09.06.12.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 12:26:32 -0700 (PDT)
Message-ID: <bf9b423c3fae61be27e0955fe4aed932d42e9d27.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v7 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Fri, 06 Sep 2024 15:26:31 -0400
In-Reply-To: <777c81510ea6fbaee4aa6b32595d5386523261a4.camel@ndufresne.ca>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
	 <20240812070823.125-3-jackson.lee@chipsnmedia.com>
	 <777c81510ea6fbaee4aa6b32595d5386523261a4.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Again,

Le vendredi 06 septembre 2024 =C3=A0 13:08 -0400, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> Hi,
>=20
> Le lundi 12 ao=C3=BBt 2024 =C3=A0 16:08 +0900, Jackson.lee a =C3=A9crit=
=C2=A0:
> > Add support for runtime suspend/resume in the encoder and decoder. This=
 is
> > achieved by saving the VPU state and powering it off while the VPU idle=
.
>=20
> If you don't, I'll edit to "while the VPU *is* idle".
>=20
> regards,
> Nicolas
>=20
> >=20
> > Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> > Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  .../platform/chips-media/wave5/wave5-helper.c | 13 -----
> >  .../platform/chips-media/wave5/wave5-hw.c     |  4 +-
> >  .../chips-media/wave5/wave5-vpu-dec.c         | 21 ++++++--
> >  .../chips-media/wave5/wave5-vpu-enc.c         | 20 ++++++--
> >  .../platform/chips-media/wave5/wave5-vpu.c    | 50 +++++++++++++++++++
> >  .../platform/chips-media/wave5/wave5-vpuapi.c | 33 ++++++++++--
> >  .../media/platform/chips-media/wave5/wave5.h  |  3 ++
> >  7 files changed, 118 insertions(+), 26 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/=
drivers/media/platform/chips-media/wave5/wave5-helper.c
> > index d60841c54a80..a20d84dbe3aa 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> > @@ -58,7 +58,6 @@ int wave5_vpu_release_device(struct file *filp,
> >  			     char *name)
> >  {
> >  	struct vpu_instance *inst =3D wave5_to_vpu_inst(filp->private_data);
> > -	struct vpu_device *dev =3D inst->dev;
> >  	int ret =3D 0;
> > =20
> >  	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> > @@ -78,18 +77,6 @@ int wave5_vpu_release_device(struct file *filp,
> >  	}
> > =20
> >  	wave5_cleanup_instance(inst);
> > -	if (dev->irq < 0) {
> > -		ret =3D mutex_lock_interruptible(&dev->dev_lock);
> > -		if (ret)
> > -			return ret;
> > -
> > -		if (list_empty(&dev->instances)) {
> > -			dev_dbg(dev->dev, "Disabling the hrtimer\n");
> > -			hrtimer_cancel(&dev->hrtimer);
> > -		}
> > -
> > -		mutex_unlock(&dev->dev_lock);
> > -	}
> > =20
> >  	return ret;
> >  }
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/driv=
ers/media/platform/chips-media/wave5/wave5-hw.c
> > index 2a98bab446d0..c8a905994109 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> > @@ -1228,8 +1228,8 @@ int wave5_vpu_re_init(struct device *dev, u8 *fw,=
 size_t size)
> >  	return setup_wave5_properties(dev);
> >  }
> > =20
> > -static int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake,=
 const uint16_t *code,
> > -				size_t size)
> > +int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const =
uint16_t *code,
> > +			 size_t size)
> >  {
> >  	u32 reg_val;
> >  	struct vpu_buf *common_vb;
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b=
/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > index 0c5c9a8de91f..698c83e3082e 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2021-2023 CHIPS&MEDIA INC
> >   */
> > =20
> > +#include <linux/pm_runtime.h>
> >  #include "wave5-helper.h"
> > =20
> >  #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
> > @@ -518,6 +519,8 @@ static void wave5_vpu_dec_finish_decode(struct vpu_=
instance *inst)
> >  	if (q_status.report_queue_count =3D=3D 0 &&
> >  	    (q_status.instance_queue_count =3D=3D 0 || dec_info.sequence_chan=
ged)) {
> >  		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
> > +		pm_runtime_mark_last_busy(inst->dev->dev);
> > +		pm_runtime_put_autosuspend(inst->dev->dev);
> >  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> >  	}
> >  }
> > @@ -1398,6 +1401,7 @@ static int wave5_vpu_dec_start_streaming(struct v=
b2_queue *q, unsigned int count
> >  	int ret =3D 0;
> > =20
> >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> > =20
> >  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
> > =20
> > @@ -1429,13 +1433,15 @@ static int wave5_vpu_dec_start_streaming(struct=
 vb2_queue *q, unsigned int count
> >  		if (ret)
> >  			goto return_buffers;
> >  	}
> > -
> > +	pm_runtime_mark_last_busy(inst->dev->dev);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  	return ret;
> > =20
> >  free_bitstream_vbuf:
> >  	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
> >  return_buffers:
> >  	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  	return ret;
> >  }
> > =20
> > @@ -1521,6 +1527,7 @@ static void wave5_vpu_dec_stop_streaming(struct v=
b2_queue *q)
> >  	bool check_cmd =3D TRUE;
> > =20
> >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> > =20
> >  	while (check_cmd) {
> >  		struct queue_status_info q_status;
> > @@ -1544,6 +1551,9 @@ static void wave5_vpu_dec_stop_streaming(struct v=
b2_queue *q)
> >  		streamoff_output(q);
> >  	else
> >  		streamoff_capture(q);
> > +
> > +	pm_runtime_mark_last_busy(inst->dev->dev);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  }
> > =20
> >  static const struct vb2_ops wave5_vpu_dec_vb2_ops =3D {
> > @@ -1630,7 +1640,7 @@ static void wave5_vpu_dec_device_run(void *priv)
> >  	int ret =3D 0;
> > =20
> >  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream =
data", __func__);
> > -
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> >  	ret =3D fill_ringbuffer(inst);
> >  	if (ret) {
> >  		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
> > @@ -1713,6 +1723,8 @@ static void wave5_vpu_dec_device_run(void *priv)
> > =20
> >  finish_job_and_return:
> >  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> > +	pm_runtime_mark_last_busy(inst->dev->dev);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> >  }
> > =20
> > @@ -1879,9 +1891,8 @@ static int wave5_vpu_open_dec(struct file *filp)
> >  	if (ret)
> >  		goto cleanup_inst;
> > =20
> > -	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) && list_empty(&dev=
->instances))
> > -		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev->vpu_poll_interval * NS=
EC_PER_MSEC),
> > -			      HRTIMER_MODE_REL_PINNED);
> > +	if (list_empty(&dev->instances))
> > +		pm_runtime_use_autosuspend(inst->dev->dev);
> > =20
> >  	list_add_tail(&inst->list, &dev->instances);
> > =20
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b=
/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > index b731decbfda6..985de0c293e2 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2021-2023 CHIPS&MEDIA INC
> >   */
> > =20
> > +#include <linux/pm_runtime.h>
> >  #include "wave5-helper.h"
> > =20
> >  #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
> > @@ -1310,6 +1311,7 @@ static int wave5_vpu_enc_start_streaming(struct v=
b2_queue *q, unsigned int count
> >  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> >  	int ret =3D 0;
> > =20
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> >  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
> > =20
> >  	if (inst->state =3D=3D VPU_INST_STATE_NONE && q->type =3D=3D V4L2_BUF=
_TYPE_VIDEO_OUTPUT_MPLANE) {
> > @@ -1364,9 +1366,13 @@ static int wave5_vpu_enc_start_streaming(struct =
vb2_queue *q, unsigned int count
> >  	if (ret)
> >  		goto return_buffers;
> > =20
> > +	pm_runtime_mark_last_busy(inst->dev->dev);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  	return 0;
> >  return_buffers:
> >  	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> > +	pm_runtime_mark_last_busy(inst->dev->dev);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  	return ret;
> >  }
> > =20
> > @@ -1408,6 +1414,7 @@ static void wave5_vpu_enc_stop_streaming(struct v=
b2_queue *q)
> >  	 */
> > =20
> >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> > =20
> >  	if (wave5_vpu_both_queues_are_streaming(inst))
> >  		switch_state(inst, VPU_INST_STATE_STOP);
> > @@ -1432,6 +1439,9 @@ static void wave5_vpu_enc_stop_streaming(struct v=
b2_queue *q)
> >  		streamoff_output(inst, q);
> >  	else
> >  		streamoff_capture(inst, q);
> > +
> > +	pm_runtime_mark_last_busy(inst->dev->dev);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  }
> > =20
> >  static const struct vb2_ops wave5_vpu_enc_vb2_ops =3D {
> > @@ -1478,6 +1488,7 @@ static void wave5_vpu_enc_device_run(void *priv)
> >  	u32 fail_res =3D 0;
> >  	int ret =3D 0;
> > =20
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> >  	switch (inst->state) {
> >  	case VPU_INST_STATE_PIC_RUN:
> >  		ret =3D start_encode(inst, &fail_res);
> > @@ -1491,6 +1502,8 @@ static void wave5_vpu_enc_device_run(void *priv)
> >  			break;
> >  		}
> >  		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> > +		pm_runtime_mark_last_busy(inst->dev->dev);
> > +		pm_runtime_put_autosuspend(inst->dev->dev);
> >  		return;
> >  	default:
> >  		WARN(1, "Execution of a job in state %s is invalid.\n",
> > @@ -1498,6 +1511,8 @@ static void wave5_vpu_enc_device_run(void *priv)
> >  		break;
> >  	}
> >  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> > +	pm_runtime_mark_last_busy(inst->dev->dev);
> > +	pm_runtime_put_autosuspend(inst->dev->dev);
> >  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> >  }
> > =20
> > @@ -1739,9 +1754,8 @@ static int wave5_vpu_open_enc(struct file *filp)
> >  	if (ret)
> >  		goto cleanup_inst;
> > =20
> > -	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) && list_empty(&dev=
->instances))
> > -		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev->vpu_poll_interval * NS=
EC_PER_MSEC),
> > -			      HRTIMER_MODE_REL_PINNED);
> > +	if (list_empty(&dev->instances))
> > +		pm_runtime_use_autosuspend(inst->dev->dev);
> > =20
> >  	list_add_tail(&inst->list, &dev->instances);
> > =20
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/dri=
vers/media/platform/chips-media/wave5/wave5-vpu.c
> > index 7273254ecb03..41c4bf64f27d 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/firmware.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> >  #include "wave5-vpu.h"
> >  #include "wave5-regdefine.h"
> > @@ -153,6 +154,45 @@ static int wave5_vpu_load_firmware(struct device *=
dev, const char *fw_name,
> >  	return 0;
> >  }
> > =20
> > +static __maybe_unused int wave5_pm_suspend(struct device *dev)
> > +{
> > +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> > +
> > +	if (pm_runtime_suspended(dev))
> > +		return 0;
> > +
> > +	if (vpu->irq < 0)
> > +		hrtimer_cancel(&vpu->hrtimer);
> > +
> > +	wave5_vpu_sleep_wake(dev, true, NULL, 0);
> > +	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static __maybe_unused int wave5_pm_resume(struct device *dev)
> > +{
> > +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> > +	int ret =3D 0;
> > +
> > +	wave5_vpu_sleep_wake(dev, false, NULL, 0);
> > +	ret =3D clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
> > +	if (ret) {
> > +		dev_err(dev, "Enabling clocks, fail: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (vpu->irq < 0 && !hrtimer_active(&vpu->hrtimer))
> > +		hrtimer_start(&vpu->hrtimer, ns_to_ktime(vpu->vpu_poll_interval * NS=
EC_PER_MSEC),
> > +				HRTIMER_MODE_REL_PINNED);

I have fixed locally this style error. Alignment should match open parenthe=
sis.
Checkpatch caught that, it saves times if you run checkpatch before your
submissions.

https://gitlab.freedesktop.org/ndufresne/media-staging/-/jobs/63283654

regards,
Nicolas

> > +
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops wave5_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)
> > +};
> > +
> >  static int wave5_vpu_probe(struct platform_device *pdev)
> >  {
> >  	int ret;
> > @@ -281,6 +321,12 @@ static int wave5_vpu_probe(struct platform_device =
*pdev)
> >  		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
> >  	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
> >  	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
> > +
> > +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> > +	pm_runtime_use_autosuspend(&pdev->dev);
> > +	pm_runtime_enable(&pdev->dev);
> > +	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
> > +
> >  	return 0;
> > =20
> >  err_enc_unreg:
> > @@ -310,6 +356,9 @@ static void wave5_vpu_remove(struct platform_device=
 *pdev)
> >  		hrtimer_cancel(&dev->hrtimer);
> >  	}
> > =20
> > +	pm_runtime_put_sync(&pdev->dev);
> > +	pm_runtime_disable(&pdev->dev);
> > +
> >  	mutex_destroy(&dev->dev_lock);
> >  	mutex_destroy(&dev->hw_lock);
> >  	reset_control_assert(dev->resets);
> > @@ -337,6 +386,7 @@ static struct platform_driver wave5_vpu_driver =3D =
{
> >  	.driver =3D {
> >  		.name =3D VPU_PLATFORM_DEVICE_NAME,
> >  		.of_match_table =3D of_match_ptr(wave5_dt_ids),
> > +		.pm =3D &wave5_pm_ops,
> >  		},
> >  	.probe =3D wave5_vpu_probe,
> >  	.remove_new =3D wave5_vpu_remove,
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/=
drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> > index 1a3efb638dde..e16b990041c2 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> > @@ -6,6 +6,8 @@
> >   */
> > =20
> >  #include <linux/bug.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/delay.h>
> >  #include "wave5-vpuapi.h"
> >  #include "wave5-regdefine.h"
> >  #include "wave5.h"
> > @@ -195,14 +197,20 @@ int wave5_vpu_dec_close(struct vpu_instance *inst=
, u32 *fail_res)
> >  	int retry =3D 0;
> >  	struct vpu_device *vpu_dev =3D inst->dev;
> >  	int i;
> > +	int inst_count =3D 0;
> > +	struct vpu_instance *inst_elm;
> > =20
> >  	*fail_res =3D 0;
> >  	if (!inst->codec_info)
> >  		return -EINVAL;
> > =20
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> > +
> >  	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> > -	if (ret)
> > +	if (ret) {
> > +		pm_runtime_put_sync(inst->dev->dev);
> >  		return ret;
> > +	}
> > =20
> >  	do {
> >  		ret =3D wave5_vpu_dec_finish_seq(inst, fail_res);
> > @@ -232,9 +240,14 @@ int wave5_vpu_dec_close(struct vpu_instance *inst,=
 u32 *fail_res)
> > =20
> >  	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
> > =20
> > +	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> > +		inst_count++;
> > +	if (inst_count =3D=3D 1)
> > +		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> > +
> >  unlock_and_return:
> >  	mutex_unlock(&vpu_dev->hw_lock);
> > -
> > +	pm_runtime_put_sync(inst->dev->dev);
> >  	return ret;
> >  }
> > =20
> > @@ -697,25 +710,33 @@ int wave5_vpu_enc_close(struct vpu_instance *inst=
, u32 *fail_res)
> >  	int ret;
> >  	int retry =3D 0;
> >  	struct vpu_device *vpu_dev =3D inst->dev;
> > +	int inst_count =3D 0;
> > +	struct vpu_instance *inst_elm;
> > =20
> >  	*fail_res =3D 0;
> >  	if (!inst->codec_info)
> >  		return -EINVAL;
> > =20
> > +	pm_runtime_resume_and_get(inst->dev->dev);
> > +
> >  	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> > -	if (ret)
> > +	if (ret) {
> > +		pm_runtime_resume_and_get(inst->dev->dev);
> >  		return ret;
> > +	}
> > =20
> >  	do {
> >  		ret =3D wave5_vpu_enc_finish_seq(inst, fail_res);
> >  		if (ret < 0 && *fail_res !=3D WAVE5_SYSERR_VPU_STILL_RUNNING) {
> >  			dev_warn(inst->dev->dev, "enc_finish_seq timed out\n");
> > +			pm_runtime_resume_and_get(inst->dev->dev);
> >  			mutex_unlock(&vpu_dev->hw_lock);
> >  			return ret;
> >  		}
> > =20
> >  		if (*fail_res =3D=3D WAVE5_SYSERR_VPU_STILL_RUNNING &&
> >  		    retry++ >=3D MAX_FIRMWARE_CALL_RETRY) {
> > +			pm_runtime_resume_and_get(inst->dev->dev);
> >  			mutex_unlock(&vpu_dev->hw_lock);
> >  			return -ETIMEDOUT;
> >  		}
> > @@ -734,7 +755,13 @@ int wave5_vpu_enc_close(struct vpu_instance *inst,=
 u32 *fail_res)
> > =20
> >  	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
> > =20
> > +	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> > +		inst_count++;
> > +	if (inst_count =3D=3D 1)
> > +		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> > +
> >  	mutex_unlock(&vpu_dev->hw_lock);
> > +	pm_runtime_put_sync(inst->dev->dev);
> > =20
> >  	return 0;
> >  }
> > diff --git a/drivers/media/platform/chips-media/wave5/wave5.h b/drivers=
/media/platform/chips-media/wave5/wave5.h
> > index 2a29b9164f97..2caab356f3e1 100644
> > --- a/drivers/media/platform/chips-media/wave5/wave5.h
> > +++ b/drivers/media/platform/chips-media/wave5/wave5.h
> > @@ -62,6 +62,9 @@ int wave5_vpu_get_version(struct vpu_device *vpu_dev,=
 u32 *revision);
> > =20
> >  int wave5_vpu_init(struct device *dev, u8 *fw, size_t size);
> > =20
> > +int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const =
uint16_t *code,
> > +			 size_t size);
> > +
> >  int wave5_vpu_reset(struct device *dev, enum sw_reset_mode reset_mode)=
;
> > =20
> >  int wave5_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec=
_open_param *param);
>=20


