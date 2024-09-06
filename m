Return-Path: <linux-media+bounces-17810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A559E96F9BD
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E491F24610
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44DC1D4611;
	Fri,  6 Sep 2024 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XBXc8ito"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFDE1D45F1
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725642500; cv=none; b=lgJbscQfxxKWBT2lHKXR+8bXM5QpuwxlBMadAJ6hL5JIhw+hMMjRa+spCltnf0gaFxssRkKdbLlVu0i1n7HR/Wf2bPhyNrHWyZ4QCECCOXlNtIcV1YC0KjVzGeZjjgJA2eo45IGmO7YIm9lct0JDMxfv0CnuI82lqJL7hCbHS6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725642500; c=relaxed/simple;
	bh=WlhHB5a73LWDtOn5o2hpd15XRWYe7wTgbuXPFZnYE1s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RMZoqsGzJr1l8o6gk2C9w+k8tLr7+EVFxfTR40UHXZv7rgpK1wiaP7iXS9OkZQPxzcllSFCFux8B+3YijbJgPxJhjog4/s08s6V3DD+w1V1JIaw9r5kJ//5xXr+iCE/pUHCT/ubhEbeZBtgr3FXO0A+vRm3ry/HrQPg+A4pp4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=XBXc8ito; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-456850b370eso14049051cf.1
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 10:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1725642497; x=1726247297; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AvQl3m08yiDnmL2gOGHcyae1nnrAREDHAoylx7Ymd1I=;
        b=XBXc8itoEZsGQ7W6buNz5rQYUPoXK+IUVTYPHim0K8WOAi4l0dI84CwFyGV2LaASTv
         aGpkHBSzeZxni6owzUnXR4t6Mph/nA27gYCbqiTcNhVampDy83IzKHQ8pvGLt5UFn0ye
         NRNNBVnmFDVj219RzKb6D/LwlCEhWZmiEW5dyt1RVrA+YGfOBRpxZrp8xYN0dz1rkP0a
         84lm9KCzYOxLNY/vje9u1N90/sjuNQ6F1pc7VQltQMeXZkQ/ZOI3iSSoF50vMw+WBonZ
         1xFw2IuQkUaSKZP+myQI+uHPpm4NAeEvTNEMgppknb6tk3zHOeGOo9vAxgvkRwzpENTB
         RSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725642497; x=1726247297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvQl3m08yiDnmL2gOGHcyae1nnrAREDHAoylx7Ymd1I=;
        b=YQAQzQ1F9J9yvG9rgNbLhh0WTuvLLI0qPz+nxvzaPfal0fPMTrlaukW+BQWY8adbxb
         xWTQ3ThqqimwgJ2cmFr9UrWMK9I2xhG6+pfAphHcAhYYLKhoZDuNi4qjApXnBu9Y6VRp
         lBIrDDs9dZETMWISoEdK99+ySuUg82MVhVMA8vu3NnuQKgRfFi+kLprZSlgrHBa3cmzY
         TJ8G01f7491nFB2mBa4QRgVEgEl6yUJJEqKn+7pqss7K+OxF/cWIHhMVYlhm73fc+H9w
         thecGFRcqkXP//jHFN7cFx8fQZrNdXQ1l1sGRfkE9dbc87sM3sdjQ0JJ0daiJDN8xFTX
         zkvA==
X-Gm-Message-State: AOJu0Yzrkv2ICE/Wir24T6NVhZM7qxp4r9tznlXCEgM4XnIgwGx9RGRn
	KRZxXHmdtosqwod+dM8ncBiPZmS7Q3p3nahxO5/4gYD78/kkz0n6bhd4ZME5Bz4=
X-Google-Smtp-Source: AGHT+IEuRUTMmq1pvRVQ1RMHt++J/XrSBvTwwMdCaNfwYENSrJH4vXH9+wqUhbxayagRqlWxcV1opg==
X-Received: by 2002:ac8:7d86:0:b0:456:847d:47a3 with SMTP id d75a77b69052e-4580c6e2bc5mr39060941cf.34.1725642496712;
        Fri, 06 Sep 2024 10:08:16 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::580])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801dc1824sm17715161cf.86.2024.09.06.10.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:08:16 -0700 (PDT)
Message-ID: <777c81510ea6fbaee4aa6b32595d5386523261a4.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v7 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Fri, 06 Sep 2024 13:08:15 -0400
In-Reply-To: <20240812070823.125-3-jackson.lee@chipsnmedia.com>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
	 <20240812070823.125-3-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le lundi 12 ao=C3=BBt 2024 =C3=A0 16:08 +0900, Jackson.lee a =C3=A9crit=C2=
=A0:
> Add support for runtime suspend/resume in the encoder and decoder. This i=
s
> achieved by saving the VPU state and powering it off while the VPU idle.

If you don't, I'll edit to "while the VPU *is* idle".

regards,
Nicolas

>=20
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../platform/chips-media/wave5/wave5-helper.c | 13 -----
>  .../platform/chips-media/wave5/wave5-hw.c     |  4 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 21 ++++++--
>  .../chips-media/wave5/wave5-vpu-enc.c         | 20 ++++++--
>  .../platform/chips-media/wave5/wave5-vpu.c    | 50 +++++++++++++++++++
>  .../platform/chips-media/wave5/wave5-vpuapi.c | 33 ++++++++++--
>  .../media/platform/chips-media/wave5/wave5.h  |  3 ++
>  7 files changed, 118 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-helper.c
> index d60841c54a80..a20d84dbe3aa 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -58,7 +58,6 @@ int wave5_vpu_release_device(struct file *filp,
>  			     char *name)
>  {
>  	struct vpu_instance *inst =3D wave5_to_vpu_inst(filp->private_data);
> -	struct vpu_device *dev =3D inst->dev;
>  	int ret =3D 0;
> =20
>  	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
> @@ -78,18 +77,6 @@ int wave5_vpu_release_device(struct file *filp,
>  	}
> =20
>  	wave5_cleanup_instance(inst);
> -	if (dev->irq < 0) {
> -		ret =3D mutex_lock_interruptible(&dev->dev_lock);
> -		if (ret)
> -			return ret;
> -
> -		if (list_empty(&dev->instances)) {
> -			dev_dbg(dev->dev, "Disabling the hrtimer\n");
> -			hrtimer_cancel(&dev->hrtimer);
> -		}
> -
> -		mutex_unlock(&dev->dev_lock);
> -	}
> =20
>  	return ret;
>  }
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/driver=
s/media/platform/chips-media/wave5/wave5-hw.c
> index 2a98bab446d0..c8a905994109 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -1228,8 +1228,8 @@ int wave5_vpu_re_init(struct device *dev, u8 *fw, s=
ize_t size)
>  	return setup_wave5_properties(dev);
>  }
> =20
> -static int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, c=
onst uint16_t *code,
> -				size_t size)
> +int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const ui=
nt16_t *code,
> +			 size_t size)
>  {
>  	u32 reg_val;
>  	struct vpu_buf *common_vb;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 0c5c9a8de91f..698c83e3082e 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2021-2023 CHIPS&MEDIA INC
>   */
> =20
> +#include <linux/pm_runtime.h>
>  #include "wave5-helper.h"
> =20
>  #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
> @@ -518,6 +519,8 @@ static void wave5_vpu_dec_finish_decode(struct vpu_in=
stance *inst)
>  	if (q_status.report_queue_count =3D=3D 0 &&
>  	    (q_status.instance_queue_count =3D=3D 0 || dec_info.sequence_change=
d)) {
>  		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
> +		pm_runtime_mark_last_busy(inst->dev->dev);
> +		pm_runtime_put_autosuspend(inst->dev->dev);
>  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  	}
>  }
> @@ -1398,6 +1401,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2=
_queue *q, unsigned int count
>  	int ret =3D 0;
> =20
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> +	pm_runtime_resume_and_get(inst->dev->dev);
> =20
>  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
> =20
> @@ -1429,13 +1433,15 @@ static int wave5_vpu_dec_start_streaming(struct v=
b2_queue *q, unsigned int count
>  		if (ret)
>  			goto return_buffers;
>  	}
> -
> +	pm_runtime_mark_last_busy(inst->dev->dev);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  	return ret;
> =20
>  free_bitstream_vbuf:
>  	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
>  return_buffers:
>  	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  	return ret;
>  }
> =20
> @@ -1521,6 +1527,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2=
_queue *q)
>  	bool check_cmd =3D TRUE;
> =20
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> +	pm_runtime_resume_and_get(inst->dev->dev);
> =20
>  	while (check_cmd) {
>  		struct queue_status_info q_status;
> @@ -1544,6 +1551,9 @@ static void wave5_vpu_dec_stop_streaming(struct vb2=
_queue *q)
>  		streamoff_output(q);
>  	else
>  		streamoff_capture(q);
> +
> +	pm_runtime_mark_last_busy(inst->dev->dev);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  }
> =20
>  static const struct vb2_ops wave5_vpu_dec_vb2_ops =3D {
> @@ -1630,7 +1640,7 @@ static void wave5_vpu_dec_device_run(void *priv)
>  	int ret =3D 0;
> =20
>  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream da=
ta", __func__);
> -
> +	pm_runtime_resume_and_get(inst->dev->dev);
>  	ret =3D fill_ringbuffer(inst);
>  	if (ret) {
>  		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
> @@ -1713,6 +1723,8 @@ static void wave5_vpu_dec_device_run(void *priv)
> =20
>  finish_job_and_return:
>  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> +	pm_runtime_mark_last_busy(inst->dev->dev);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  }
> =20
> @@ -1879,9 +1891,8 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	if (ret)
>  		goto cleanup_inst;
> =20
> -	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) && list_empty(&dev->=
instances))
> -		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev->vpu_poll_interval * NSEC=
_PER_MSEC),
> -			      HRTIMER_MODE_REL_PINNED);
> +	if (list_empty(&dev->instances))
> +		pm_runtime_use_autosuspend(inst->dev->dev);
> =20
>  	list_add_tail(&inst->list, &dev->instances);
> =20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index b731decbfda6..985de0c293e2 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2021-2023 CHIPS&MEDIA INC
>   */
> =20
> +#include <linux/pm_runtime.h>
>  #include "wave5-helper.h"
> =20
>  #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
> @@ -1310,6 +1311,7 @@ static int wave5_vpu_enc_start_streaming(struct vb2=
_queue *q, unsigned int count
>  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
>  	int ret =3D 0;
> =20
> +	pm_runtime_resume_and_get(inst->dev->dev);
>  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
> =20
>  	if (inst->state =3D=3D VPU_INST_STATE_NONE && q->type =3D=3D V4L2_BUF_T=
YPE_VIDEO_OUTPUT_MPLANE) {
> @@ -1364,9 +1366,13 @@ static int wave5_vpu_enc_start_streaming(struct vb=
2_queue *q, unsigned int count
>  	if (ret)
>  		goto return_buffers;
> =20
> +	pm_runtime_mark_last_busy(inst->dev->dev);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  	return 0;
>  return_buffers:
>  	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> +	pm_runtime_mark_last_busy(inst->dev->dev);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  	return ret;
>  }
> =20
> @@ -1408,6 +1414,7 @@ static void wave5_vpu_enc_stop_streaming(struct vb2=
_queue *q)
>  	 */
> =20
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> +	pm_runtime_resume_and_get(inst->dev->dev);
> =20
>  	if (wave5_vpu_both_queues_are_streaming(inst))
>  		switch_state(inst, VPU_INST_STATE_STOP);
> @@ -1432,6 +1439,9 @@ static void wave5_vpu_enc_stop_streaming(struct vb2=
_queue *q)
>  		streamoff_output(inst, q);
>  	else
>  		streamoff_capture(inst, q);
> +
> +	pm_runtime_mark_last_busy(inst->dev->dev);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  }
> =20
>  static const struct vb2_ops wave5_vpu_enc_vb2_ops =3D {
> @@ -1478,6 +1488,7 @@ static void wave5_vpu_enc_device_run(void *priv)
>  	u32 fail_res =3D 0;
>  	int ret =3D 0;
> =20
> +	pm_runtime_resume_and_get(inst->dev->dev);
>  	switch (inst->state) {
>  	case VPU_INST_STATE_PIC_RUN:
>  		ret =3D start_encode(inst, &fail_res);
> @@ -1491,6 +1502,8 @@ static void wave5_vpu_enc_device_run(void *priv)
>  			break;
>  		}
>  		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> +		pm_runtime_mark_last_busy(inst->dev->dev);
> +		pm_runtime_put_autosuspend(inst->dev->dev);
>  		return;
>  	default:
>  		WARN(1, "Execution of a job in state %s is invalid.\n",
> @@ -1498,6 +1511,8 @@ static void wave5_vpu_enc_device_run(void *priv)
>  		break;
>  	}
>  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> +	pm_runtime_mark_last_busy(inst->dev->dev);
> +	pm_runtime_put_autosuspend(inst->dev->dev);
>  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>  }
> =20
> @@ -1739,9 +1754,8 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	if (ret)
>  		goto cleanup_inst;
> =20
> -	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) && list_empty(&dev->=
instances))
> -		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev->vpu_poll_interval * NSEC=
_PER_MSEC),
> -			      HRTIMER_MODE_REL_PINNED);
> +	if (list_empty(&dev->instances))
> +		pm_runtime_use_autosuspend(inst->dev->dev);
> =20
>  	list_add_tail(&inst->list, &dev->instances);
> =20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drive=
rs/media/platform/chips-media/wave5/wave5-vpu.c
> index 7273254ecb03..41c4bf64f27d 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -10,6 +10,7 @@
>  #include <linux/clk.h>
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include "wave5-vpu.h"
>  #include "wave5-regdefine.h"
> @@ -153,6 +154,45 @@ static int wave5_vpu_load_firmware(struct device *de=
v, const char *fw_name,
>  	return 0;
>  }
> =20
> +static __maybe_unused int wave5_pm_suspend(struct device *dev)
> +{
> +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	if (vpu->irq < 0)
> +		hrtimer_cancel(&vpu->hrtimer);
> +
> +	wave5_vpu_sleep_wake(dev, true, NULL, 0);
> +	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
> +
> +	return 0;
> +}
> +
> +static __maybe_unused int wave5_pm_resume(struct device *dev)
> +{
> +	struct vpu_device *vpu =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	wave5_vpu_sleep_wake(dev, false, NULL, 0);
> +	ret =3D clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
> +	if (ret) {
> +		dev_err(dev, "Enabling clocks, fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (vpu->irq < 0 && !hrtimer_active(&vpu->hrtimer))
> +		hrtimer_start(&vpu->hrtimer, ns_to_ktime(vpu->vpu_poll_interval * NSEC=
_PER_MSEC),
> +				HRTIMER_MODE_REL_PINNED);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops wave5_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)
> +};
> +
>  static int wave5_vpu_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -281,6 +321,12 @@ static int wave5_vpu_probe(struct platform_device *p=
dev)
>  		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
>  	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
>  	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
> +
>  	return 0;
> =20
>  err_enc_unreg:
> @@ -310,6 +356,9 @@ static void wave5_vpu_remove(struct platform_device *=
pdev)
>  		hrtimer_cancel(&dev->hrtimer);
>  	}
> =20
> +	pm_runtime_put_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +
>  	mutex_destroy(&dev->dev_lock);
>  	mutex_destroy(&dev->hw_lock);
>  	reset_control_assert(dev->resets);
> @@ -337,6 +386,7 @@ static struct platform_driver wave5_vpu_driver =3D {
>  	.driver =3D {
>  		.name =3D VPU_PLATFORM_DEVICE_NAME,
>  		.of_match_table =3D of_match_ptr(wave5_dt_ids),
> +		.pm =3D &wave5_pm_ops,
>  		},
>  	.probe =3D wave5_vpu_probe,
>  	.remove_new =3D wave5_vpu_remove,
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index 1a3efb638dde..e16b990041c2 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -6,6 +6,8 @@
>   */
> =20
>  #include <linux/bug.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/delay.h>
>  #include "wave5-vpuapi.h"
>  #include "wave5-regdefine.h"
>  #include "wave5.h"
> @@ -195,14 +197,20 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, =
u32 *fail_res)
>  	int retry =3D 0;
>  	struct vpu_device *vpu_dev =3D inst->dev;
>  	int i;
> +	int inst_count =3D 0;
> +	struct vpu_instance *inst_elm;
> =20
>  	*fail_res =3D 0;
>  	if (!inst->codec_info)
>  		return -EINVAL;
> =20
> +	pm_runtime_resume_and_get(inst->dev->dev);
> +
>  	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_put_sync(inst->dev->dev);
>  		return ret;
> +	}
> =20
>  	do {
>  		ret =3D wave5_vpu_dec_finish_seq(inst, fail_res);
> @@ -232,9 +240,14 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u=
32 *fail_res)
> =20
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
> =20
> +	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> +		inst_count++;
> +	if (inst_count =3D=3D 1)
> +		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> +
>  unlock_and_return:
>  	mutex_unlock(&vpu_dev->hw_lock);
> -
> +	pm_runtime_put_sync(inst->dev->dev);
>  	return ret;
>  }
> =20
> @@ -697,25 +710,33 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, =
u32 *fail_res)
>  	int ret;
>  	int retry =3D 0;
>  	struct vpu_device *vpu_dev =3D inst->dev;
> +	int inst_count =3D 0;
> +	struct vpu_instance *inst_elm;
> =20
>  	*fail_res =3D 0;
>  	if (!inst->codec_info)
>  		return -EINVAL;
> =20
> +	pm_runtime_resume_and_get(inst->dev->dev);
> +
>  	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_resume_and_get(inst->dev->dev);
>  		return ret;
> +	}
> =20
>  	do {
>  		ret =3D wave5_vpu_enc_finish_seq(inst, fail_res);
>  		if (ret < 0 && *fail_res !=3D WAVE5_SYSERR_VPU_STILL_RUNNING) {
>  			dev_warn(inst->dev->dev, "enc_finish_seq timed out\n");
> +			pm_runtime_resume_and_get(inst->dev->dev);
>  			mutex_unlock(&vpu_dev->hw_lock);
>  			return ret;
>  		}
> =20
>  		if (*fail_res =3D=3D WAVE5_SYSERR_VPU_STILL_RUNNING &&
>  		    retry++ >=3D MAX_FIRMWARE_CALL_RETRY) {
> +			pm_runtime_resume_and_get(inst->dev->dev);
>  			mutex_unlock(&vpu_dev->hw_lock);
>  			return -ETIMEDOUT;
>  		}
> @@ -734,7 +755,13 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u=
32 *fail_res)
> =20
>  	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
> =20
> +	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
> +		inst_count++;
> +	if (inst_count =3D=3D 1)
> +		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
> +
>  	mutex_unlock(&vpu_dev->hw_lock);
> +	pm_runtime_put_sync(inst->dev->dev);
> =20
>  	return 0;
>  }
> diff --git a/drivers/media/platform/chips-media/wave5/wave5.h b/drivers/m=
edia/platform/chips-media/wave5/wave5.h
> index 2a29b9164f97..2caab356f3e1 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5.h
> @@ -62,6 +62,9 @@ int wave5_vpu_get_version(struct vpu_device *vpu_dev, u=
32 *revision);
> =20
>  int wave5_vpu_init(struct device *dev, u8 *fw, size_t size);
> =20
> +int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const ui=
nt16_t *code,
> +			 size_t size);
> +
>  int wave5_vpu_reset(struct device *dev, enum sw_reset_mode reset_mode);
> =20
>  int wave5_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec_o=
pen_param *param);


