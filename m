Return-Path: <linux-media+bounces-17912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E307970DB5
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE1AF1F23774
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 05:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0831AD419;
	Mon,  9 Sep 2024 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="TrMl8JDC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53597136A;
	Mon,  9 Sep 2024 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725860833; cv=pass; b=gm6BTwhf8G/WxLCOr3VpWL0UeTRrH1LcvSeMFPVX4gOdZxC35HGQGM746ZUQGGt3Hwpvb3WHqQ73DBxvBwDl9gnG32rur+aPThNyJhSVrP/UFjM/ejaN5U7bJazxYmSjksKvxGy6yupznkEmQBfsHXxoHwK9Y+V3AguLcf3GVCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725860833; c=relaxed/simple;
	bh=3T0Nzd1dTvtfI4Ydx4eHqiNfYGruhy673BL8zn0d0uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmSRFvjKnoeV873jg0k9nmBugDXcXjFLdOtEdHHxknaTMLPpEXGqugaSkJaln8+8iUGkTAaK/M96Vd50wJ4IcfASzf1JrcSoXJJ4ayxEESztkkWUwBIVQl8Sy2o/IbivtrQOfx7mbSqAmiFabY1HUOIpK7eJ/6ryZXFIoSwyNMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=TrMl8JDC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725860817; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cnYucnM5bSoWTdtbCNK46WiFMuplPF2N8QKTm6RaWByeXi4ZbRltOZQtf6iiKW28gDc8Ed5zLePzA478gfFGrdT23H5vUK68vjVNjRc9eTNNk6jtUXtpAqKe6SkTFq/i65yheUsvyffm2h6iQPoyLGAkgFINj21MC4122p44wYA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725860817; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T6FwUNHJwXGaSz2cN98RQw0+W+kkYIAIZ9K75TrIFSg=; 
	b=BwDlhGsalPGB6jbM55p41vSnmW/hPKwt4/k+MnxzgFOvVOUd3S//4kczHDg6UDazuSUUv0dLAjwE4sp1GU/Czr/oBiZKjJV7LnzYdZj/NPHhR4fJOx9hbjIhse3C32/W4flLObyqXVd3UO/R3qsrXZYMa082NoRafqGZaMH8PeE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725860817;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=T6FwUNHJwXGaSz2cN98RQw0+W+kkYIAIZ9K75TrIFSg=;
	b=TrMl8JDC+HbYwB8ymlz3/+/xsWl0XxLT8vPjCT/TN17OBjrldjaowZOyUELU2+Ty
	fFbLP2NHegfhEpWcHj+o2Ji5EPq0hzluRsS2njB299hTFmVkgMorx9G8IBm4CGDt5a8
	I50TopoU+FevmYPm0Hn6WChkOWMHMc9mK1rYYi4E=
Received: by mx.zohomail.com with SMTPS id 1725860814390762.874679423403;
	Sun, 8 Sep 2024 22:46:54 -0700 (PDT)
Date: Mon, 9 Sep 2024 07:46:50 +0200
From: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>
Subject: Re: [RESEND PATCH v7 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Message-ID: <20240909054650.cwq2lafzwguqztfl@basti-XPS-13-9310>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
 <20240812070823.125-3-jackson.lee@chipsnmedia.com>
 <777c81510ea6fbaee4aa6b32595d5386523261a4.camel@ndufresne.ca>
 <bf9b423c3fae61be27e0955fe4aed932d42e9d27.camel@ndufresne.ca>
 <SE1P216MB130331A2FAB08DBFEE8D0C90ED992@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SE1P216MB130331A2FAB08DBFEE8D0C90ED992@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
X-ZohoMailClient: External

Hey Jackson,

On 09.09.2024 01:21, jackson.lee wrote:
>Hi Nicolas
>
>> -----Original Message-----
>> From: Nicolas Dufresne <nicolas@ndufresne.ca>
>> Sent: Saturday, September 7, 2024 4:27 AM
>> To: jackson.lee <jackson.lee@chipsnmedia.com>; mchehab@kernel.org;
>> sebastian.fricke@collabora.com
>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
>> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com
>> Subject: Re: [RESEND PATCH v7 2/4] media: chips-media: wave5: Support
>> runtime suspend/resume
>>
>> Hi Again,
>>
>> Le vendredi 06 septembre 2024 à 13:08 -0400, Nicolas Dufresne a écrit :
>> > Hi,
>> >
>> > Le lundi 12 août 2024 à 16:08 +0900, Jackson.lee a écrit :
>> > > Add support for runtime suspend/resume in the encoder and decoder.
>> > > This is achieved by saving the VPU state and powering it off while the
>> VPU idle.
>> >
>> > If you don't, I'll edit to "while the VPU *is* idle".
>> >
>> > regards,
>> > Nicolas
>> >
>> > >
>> > > Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
>> > > Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> > > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> > > ---
>> > >  .../platform/chips-media/wave5/wave5-helper.c | 13 -----
>> > >  .../platform/chips-media/wave5/wave5-hw.c     |  4 +-
>> > >  .../chips-media/wave5/wave5-vpu-dec.c         | 21 ++++++--
>> > >  .../chips-media/wave5/wave5-vpu-enc.c         | 20 ++++++--
>> > >  .../platform/chips-media/wave5/wave5-vpu.c    | 50 +++++++++++++++++++
>> > >  .../platform/chips-media/wave5/wave5-vpuapi.c | 33 ++++++++++--
>> > > .../media/platform/chips-media/wave5/wave5.h  |  3 ++
>> > >  7 files changed, 118 insertions(+), 26 deletions(-)
>> > >
>> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c
>> > > b/drivers/media/platform/chips-media/wave5/wave5-helper.c
>> > > index d60841c54a80..a20d84dbe3aa 100644
>> > > --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
>> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
>> > > @@ -58,7 +58,6 @@ int wave5_vpu_release_device(struct file *filp,
>> > >  			     char *name)
>> > >  {
>> > >  	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
>> > > -	struct vpu_device *dev = inst->dev;
>> > >  	int ret = 0;
>> > >
>> > >  	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
>> > > @@ -78,18 +77,6 @@ int wave5_vpu_release_device(struct file *filp,
>> > >  	}
>> > >
>> > >  	wave5_cleanup_instance(inst);
>> > > -	if (dev->irq < 0) {
>> > > -		ret = mutex_lock_interruptible(&dev->dev_lock);
>> > > -		if (ret)
>> > > -			return ret;
>> > > -
>> > > -		if (list_empty(&dev->instances)) {
>> > > -			dev_dbg(dev->dev, "Disabling the hrtimer\n");
>> > > -			hrtimer_cancel(&dev->hrtimer);
>> > > -		}
>> > > -
>> > > -		mutex_unlock(&dev->dev_lock);
>> > > -	}
>> > >
>> > >  	return ret;
>> > >  }
>> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c
>> > > b/drivers/media/platform/chips-media/wave5/wave5-hw.c
>> > > index 2a98bab446d0..c8a905994109 100644
>> > > --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
>> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
>> > > @@ -1228,8 +1228,8 @@ int wave5_vpu_re_init(struct device *dev, u8 *fw,
>> size_t size)
>> > >  	return setup_wave5_properties(dev);  }
>> > >
>> > > -static int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake,
>> const uint16_t *code,
>> > > -				size_t size)
>> > > +int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const
>> uint16_t *code,
>> > > +			 size_t size)
>> > >  {
>> > >  	u32 reg_val;
>> > >  	struct vpu_buf *common_vb;
>> > > diff --git
>> > > a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
>> > > b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
>> > > index 0c5c9a8de91f..698c83e3082e 100644
>> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
>> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
>> > > @@ -5,6 +5,7 @@
>> > >   * Copyright (C) 2021-2023 CHIPS&MEDIA INC
>> > >   */
>> > >
>> > > +#include <linux/pm_runtime.h>
>> > >  #include "wave5-helper.h"
>> > >
>> > >  #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
>> > > @@ -518,6 +519,8 @@ static void wave5_vpu_dec_finish_decode(struct
>> vpu_instance *inst)
>> > >  	if (q_status.report_queue_count == 0 &&
>> > >  	    (q_status.instance_queue_count == 0 ||
>> dec_info.sequence_changed)) {
>> > >  		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
>> > > +		pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +		pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
>> > >  	}
>> > >  }
>> > > @@ -1398,6 +1401,7 @@ static int wave5_vpu_dec_start_streaming(struct
>> vb2_queue *q, unsigned int count
>> > >  	int ret = 0;
>> > >
>> > >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
>> > > +	pm_runtime_resume_and_get(inst->dev->dev);
>> > >
>> > >  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
>> > >
>> > > @@ -1429,13 +1433,15 @@ static int
>> wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
>> > >  		if (ret)
>> > >  			goto return_buffers;
>> > >  	}
>> > > -
>> > > +	pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  	return ret;
>> > >
>> > >  free_bitstream_vbuf:
>> > >  	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
>> > >  return_buffers:
>> > >  	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  	return ret;
>> > >  }
>> > >
>> > > @@ -1521,6 +1527,7 @@ static void wave5_vpu_dec_stop_streaming(struct
>> vb2_queue *q)
>> > >  	bool check_cmd = TRUE;
>> > >
>> > >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
>> > > +	pm_runtime_resume_and_get(inst->dev->dev);
>> > >
>> > >  	while (check_cmd) {
>> > >  		struct queue_status_info q_status; @@ -1544,6 +1551,9 @@
>> static
>> > > void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
>> > >  		streamoff_output(q);
>> > >  	else
>> > >  		streamoff_capture(q);
>> > > +
>> > > +	pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  }
>> > >
>> > >  static const struct vb2_ops wave5_vpu_dec_vb2_ops = { @@ -1630,7
>> > > +1640,7 @@ static void wave5_vpu_dec_device_run(void *priv)
>> > >  	int ret = 0;
>> > >
>> > >  	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new
>> > > bitstream data", __func__);
>> > > -
>> > > +	pm_runtime_resume_and_get(inst->dev->dev);
>> > >  	ret = fill_ringbuffer(inst);
>> > >  	if (ret) {
>> > >  		dev_warn(inst->dev->dev, "Filling ring buffer failed\n"); @@
>> > > -1713,6 +1723,8 @@ static void wave5_vpu_dec_device_run(void *priv)
>> > >
>> > >  finish_job_and_return:
>> > >  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
>> > > +	pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);  }
>> > >
>> > > @@ -1879,9 +1891,8 @@ static int wave5_vpu_open_dec(struct file *filp)
>> > >  	if (ret)
>> > >  		goto cleanup_inst;
>> > >
>> > > -	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) &&
>> list_empty(&dev->instances))
>> > > -		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev-
>> >vpu_poll_interval * NSEC_PER_MSEC),
>> > > -			      HRTIMER_MODE_REL_PINNED);
>> > > +	if (list_empty(&dev->instances))
>> > > +		pm_runtime_use_autosuspend(inst->dev->dev);
>> > >
>> > >  	list_add_tail(&inst->list, &dev->instances);
>> > >
>> > > diff --git
>> > > a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> > > b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> > > index b731decbfda6..985de0c293e2 100644
>> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> > > @@ -5,6 +5,7 @@
>> > >   * Copyright (C) 2021-2023 CHIPS&MEDIA INC
>> > >   */
>> > >
>> > > +#include <linux/pm_runtime.h>
>> > >  #include "wave5-helper.h"
>> > >
>> > >  #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
>> > > @@ -1310,6 +1311,7 @@ static int wave5_vpu_enc_start_streaming(struct
>> vb2_queue *q, unsigned int count
>> > >  	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
>> > >  	int ret = 0;
>> > >
>> > > +	pm_runtime_resume_and_get(inst->dev->dev);
>> > >  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
>> > >
>> > >  	if (inst->state == VPU_INST_STATE_NONE && q->type ==
>> > > V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) { @@ -1364,9 +1366,13 @@ static int
>> wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
>> > >  	if (ret)
>> > >  		goto return_buffers;
>> > >
>> > > +	pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  	return 0;
>> > >  return_buffers:
>> > >  	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
>> > > +	pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  	return ret;
>> > >  }
>> > >
>> > > @@ -1408,6 +1414,7 @@ static void wave5_vpu_enc_stop_streaming(struct
>> vb2_queue *q)
>> > >  	 */
>> > >
>> > >  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
>> > > +	pm_runtime_resume_and_get(inst->dev->dev);
>> > >
>> > >  	if (wave5_vpu_both_queues_are_streaming(inst))
>> > >  		switch_state(inst, VPU_INST_STATE_STOP); @@ -1432,6 +1439,9
>> @@
>> > > static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
>> > >  		streamoff_output(inst, q);
>> > >  	else
>> > >  		streamoff_capture(inst, q);
>> > > +
>> > > +	pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  }
>> > >
>> > >  static const struct vb2_ops wave5_vpu_enc_vb2_ops = { @@ -1478,6
>> > > +1488,7 @@ static void wave5_vpu_enc_device_run(void *priv)
>> > >  	u32 fail_res = 0;
>> > >  	int ret = 0;
>> > >
>> > > +	pm_runtime_resume_and_get(inst->dev->dev);
>> > >  	switch (inst->state) {
>> > >  	case VPU_INST_STATE_PIC_RUN:
>> > >  		ret = start_encode(inst, &fail_res); @@ -1491,6 +1502,8 @@
>> static
>> > > void wave5_vpu_enc_device_run(void *priv)
>> > >  			break;
>> > >  		}
>> > >  		dev_dbg(inst->dev->dev, "%s: leave with active job",
>> __func__);
>> > > +		pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +		pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  		return;
>> > >  	default:
>> > >  		WARN(1, "Execution of a job in state %s is invalid.\n", @@
>> > > -1498,6 +1511,8 @@ static void wave5_vpu_enc_device_run(void *priv)
>> > >  		break;
>> > >  	}
>> > >  	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
>> > > +	pm_runtime_mark_last_busy(inst->dev->dev);
>> > > +	pm_runtime_put_autosuspend(inst->dev->dev);
>> > >  	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);  }
>> > >
>> > > @@ -1739,9 +1754,8 @@ static int wave5_vpu_open_enc(struct file *filp)
>> > >  	if (ret)
>> > >  		goto cleanup_inst;
>> > >
>> > > -	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) &&
>> list_empty(&dev->instances))
>> > > -		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev-
>> >vpu_poll_interval * NSEC_PER_MSEC),
>> > > -			      HRTIMER_MODE_REL_PINNED);
>> > > +	if (list_empty(&dev->instances))
>> > > +		pm_runtime_use_autosuspend(inst->dev->dev);
>> > >
>> > >  	list_add_tail(&inst->list, &dev->instances);
>> > >
>> > > diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>> > > b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>> > > index 7273254ecb03..41c4bf64f27d 100644
>> > > --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>> > > +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>> > > @@ -10,6 +10,7 @@
>> > >  #include <linux/clk.h>
>> > >  #include <linux/firmware.h>
>> > >  #include <linux/interrupt.h>
>> > > +#include <linux/pm_runtime.h>
>> > >  #include <linux/reset.h>
>> > >  #include "wave5-vpu.h"
>> > >  #include "wave5-regdefine.h"
>> > > @@ -153,6 +154,45 @@ static int wave5_vpu_load_firmware(struct device
>> *dev, const char *fw_name,
>> > >  	return 0;
>> > >  }
>> > >
>> > > +static __maybe_unused int wave5_pm_suspend(struct device *dev) {
>> > > +	struct vpu_device *vpu = dev_get_drvdata(dev);
>> > > +
>> > > +	if (pm_runtime_suspended(dev))
>> > > +		return 0;
>> > > +
>> > > +	if (vpu->irq < 0)
>> > > +		hrtimer_cancel(&vpu->hrtimer);
>> > > +
>> > > +	wave5_vpu_sleep_wake(dev, true, NULL, 0);
>> > > +	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
>> > > +
>> > > +	return 0;
>> > > +}
>> > > +
>> > > +static __maybe_unused int wave5_pm_resume(struct device *dev) {
>> > > +	struct vpu_device *vpu = dev_get_drvdata(dev);
>> > > +	int ret = 0;
>> > > +
>> > > +	wave5_vpu_sleep_wake(dev, false, NULL, 0);
>> > > +	ret = clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
>> > > +	if (ret) {
>> > > +		dev_err(dev, "Enabling clocks, fail: %d\n", ret);
>> > > +		return ret;
>> > > +	}
>> > > +
>> > > +	if (vpu->irq < 0 && !hrtimer_active(&vpu->hrtimer))
>> > > +		hrtimer_start(&vpu->hrtimer, ns_to_ktime(vpu-
>> >vpu_poll_interval * NSEC_PER_MSEC),
>> > > +				HRTIMER_MODE_REL_PINNED);
>>
>> I have fixed locally this style error. Alignment should match open
>> parenthesis.
>> Checkpatch caught that, it saves times if you run checkpatch before your
>> submissions.
>>
>> https://gitlab.freedesktop.org/ndufresne/media-staging/-/jobs/63283654
>>
>
>
>Sorry for that, thanks for your feedback.
>Should I make v8 for that ?

That is not required in this case, when he says "I have fixed locally",
that means that the required change is applied by the maintainer before
merging the changes upstream.

Regards,
Sebastian

