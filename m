Return-Path: <linux-media+bounces-41349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265D7B3C231
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 20:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D581BA22D6A
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 18:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D1F334713;
	Fri, 29 Aug 2025 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AJUW2fSa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5BC3054D4;
	Fri, 29 Aug 2025 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490513; cv=none; b=k6ABl9mpQjOeV2hSXm84s7y+HBuFgmVdt8gOl72a3P86tTQ5SMawvXponJdfsk2vSvPfd/7JY1wz8FDpVWBEr5RM0lWU4CJ/hKVSekD+F39HYLj8+A3+3A6WfeW7YlgEnSz1RwFlfSo7Wm563RCdVlgeS+H9MC5LKuW5CDqPTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490513; c=relaxed/simple;
	bh=+/CxoYC4RoXjpbaBpdoqhxKkxnbMwLusebldU4W6N+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cLdymRr8ZU/LcDMJyUxJo+7S/WcAQGZ0JN4XbsvsiBaNcXw2b8mGJu5rJ362sGRFnVBgPKj7MmZpy8I6u2AFkAQZCCuCCV2ocvZ9GPM44U6QfwnrSi8gJSt7leHEzZVBuaBoRsTl3TyE9u5WtNzTI2Cux1/hbqzdewz7uwTogPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AJUW2fSa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756490508;
	bh=+/CxoYC4RoXjpbaBpdoqhxKkxnbMwLusebldU4W6N+Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AJUW2fSaKs+hVAeKMl2rvhr9Ur+gxNE/Vb/AgRaZeXdTWPXRCDmBv5p+Ew/GCgX/5
	 vU5Z+wTKjrL0v4lgAkwUyepAOc5kfHTMv7TTFacFytJzDfeItc92mET0EG6Fgajwc6
	 KkreJ8r1Z4jHm13ZeUXW7BkGqUDY/71rrdFMWB78SyUsKNCpXZzU27cCNYiey5cdkO
	 hiufUEaSmrd7PmFjvxbepJCEADrHBlAZxMqKXB1b8zhoj04YdK1gNHaU0b7cuW7rGi
	 N+ydOeexYBdpbPv0PKrY+9EHcSwPAXJoNhOK6FpcdRCE8L5vRQT4S05k+Gmh3fEFQV
	 KDLOEpgzW642A==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D43C17E01F5;
	Fri, 29 Aug 2025 20:01:47 +0200 (CEST)
Message-ID: <8022345d676ec5869ef3c7f4a6796869f597ffaf.camel@collabora.com>
Subject: Re: [PATCH v3 4/4] media: chips-media: wave5: Improve performance
 of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Fri, 29 Aug 2025 14:01:44 -0400
In-Reply-To: <20250623002153.51-5-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
	 <20250623002153.51-5-jackson.lee@chipsnmedia.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/T8YZ2drafvk/cQXW9ma"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-/T8YZ2drafvk/cQXW9ma
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 juin 2025 =C3=A0 09:21 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> The current decoding method=C2=A0 was to wait until each frame was
> decoded after feeding a bitstream. As a result, performance was low
> and Wave5 could not achieve max pixel processing rate.
>=20
> Update driver to use an asynchronous approach for decoding and feeding a
> bitstream in order to achieve full capabilities of the device.
>=20
> WAVE5 supports command-queueing to maximize performance by pipelining
> internal commands and by hiding wait cycle taken to receive a command
> from Host processor.
>=20
> Instead of waiting for each command to be executed before sending the
> next command, Host processor just places all the commands in the
> command-queue and goes on doing other things while the commands in the
> queue are processed by VPU.
>=20
> While Host processor handles its own tasks, it can receive VPU interrupt
> request (IRQ).
> In this case, host processor can simply exit interrupt service routine
> (ISR) without accessing to host interface to read the result of the
> command reported by VPU.
> After host processor completed its tasks, host processor can read the
> command result when host processor needs the reports and does
> response processing.
>=20
> To archive this goal, the device_run() calls v4l2_m2m_job_finish
> so that next command can be sent to VPU continuously, if there is
> any result, then irq is triggered and gets decoded frames and returns
> them to upper layer.
> Theses processes work independently each other without waiting
> a decoded frame.
>=20
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
> =C2=A0.../platform/chips-media/wave5/wave5-hw.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> =C2=A0.../chips-media/wave5/wave5-vpu-dec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 131 ++++++++++++------
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.c |=C2=A0 22 ++-
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.h |=C2=A0=C2=A0 5 +
> =C2=A0.../chips-media/wave5/wave5-vpuconfig.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A05 files changed, 119 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/driver=
s/media/platform/chips-media/wave5/wave5-hw.c
> index d94cf84c3ee5..687ce6ccf3ae 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -102,7 +102,7 @@ static void _wave5_print_reg_err(struct vpu_device *v=
pu_dev, u32 reg_fail_reason
> =C2=A0		dev_dbg(dev, "%s: queueing failure: 0x%x\n", func, reg_val);
> =C2=A0		break;
> =C2=A0	case WAVE5_SYSERR_RESULT_NOT_READY:
> -		dev_err(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
> +		dev_dbg(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
> =C2=A0		break;
> =C2=A0	case WAVE5_SYSERR_ACCESS_VIOLATION_HW:
> =C2=A0		dev_err(dev, "%s: access violation: 0x%x\n", func, reg_fail_reaso=
n);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 2df7668575f4..4554a24df8a1 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -268,6 +268,7 @@ static void send_eos_event(struct vpu_instance *inst)
> =C2=A0
> =C2=A0	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_eos);
> =C2=A0	inst->eos =3D false;
> +	inst->sent_eos =3D true;
> =C2=A0}
> =C2=A0
> =C2=A0static int handle_dynamic_resolution_change(struct vpu_instance *in=
st)
> @@ -347,13 +348,12 @@ static void wave5_vpu_dec_finish_decode(struct vpu_=
instance *inst)
> =C2=A0	struct vb2_v4l2_buffer *dec_buf =3D NULL;
> =C2=A0	struct vb2_v4l2_buffer *disp_buf =3D NULL;
> =C2=A0	struct vb2_queue *dst_vq =3D v4l2_m2m_get_dst_vq(m2m_ctx);
> -	struct queue_status_info q_status;
> =C2=A0
> =C2=A0	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __=
func__);
> =C2=A0
> =C2=A0	ret =3D wave5_vpu_dec_get_output_info(inst, &dec_info);
> =C2=A0	if (ret) {
> -		dev_warn(inst->dev->dev, "%s: could not get output info.", __func__);
> +		dev_dbg(inst->dev->dev, "%s: could not get output info.", __func__);
> =C2=A0		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> =C2=A0		return;
> =C2=A0	}
> @@ -442,18 +442,14 @@ static void wave5_vpu_dec_finish_decode(struct vpu_=
instance *inst)
> =C2=A0		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> =C2=A0	}
> =C2=A0
> -	/*
> -	 * During a resolution change and while draining, the firmware may flus=
h
> -	 * the reorder queue regardless of having a matching decoding operation
> -	 * pending. Only terminate the job if there are no more IRQ coming.
> -	 */
> -	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> -	if (q_status.report_queue_count =3D=3D 0 &&
> -	=C2=A0=C2=A0=C2=A0 (q_status.instance_queue_count =3D=3D 0 || dec_info.=
sequence_changed)) {
> -		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
> -		pm_runtime_mark_last_busy(inst->dev->dev);
> -		pm_runtime_put_autosuspend(inst->dev->dev);
> -		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +	if (inst->sent_eos &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_curr_priv(inst->v4l2_m2m_dev)) {
> +		struct queue_status_info q_status;
> +
> +		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> +		if (q_status.report_queue_count =3D=3D 0 &&
> +		=C2=A0=C2=A0=C2=A0 q_status.instance_queue_count =3D=3D 0)
> +			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -1146,8 +1142,8 @@ static int write_to_ringbuffer(struct vpu_instance =
*inst, void *buffer, size_t b
> =C2=A0static int fill_ringbuffer(struct vpu_instance *inst)
> =C2=A0{
> =C2=A0	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> -	struct v4l2_m2m_buffer *buf, *n;
> -	int ret;
> +	struct vpu_src_buffer *vpu_buf;
> +	int ret =3D 0;
> =C2=A0
> =C2=A0	if (m2m_ctx->last_src_buf)=C2=A0 {
> =C2=A0		struct vpu_src_buffer *vpu_buf =3D wave5_to_vpu_src_buf(m2m_ctx->=
last_src_buf);
> @@ -1158,9 +1154,8 @@ static int fill_ringbuffer(struct vpu_instance *ins=
t)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
> -		struct vb2_v4l2_buffer *vbuf =3D &buf->vb;
> -		struct vpu_src_buffer *vpu_buf =3D wave5_to_vpu_src_buf(vbuf);
> +	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
> +		struct vb2_v4l2_buffer *vbuf =3D &vpu_buf->v4l2_m2m_buf.vb;
> =C2=A0		struct vpu_buf *ring_buffer =3D &inst->bitstream_vbuf;
> =C2=A0		size_t src_size =3D vb2_get_plane_payload(&vbuf->vb2_buf, 0);
> =C2=A0		void *src_buf =3D vb2_plane_vaddr(&vbuf->vb2_buf, 0);
> @@ -1220,9 +1215,13 @@ static int fill_ringbuffer(struct vpu_instance *in=
st)
> =C2=A0			dev_dbg(inst->dev->dev, "last src buffer written to the ring buf=
fer\n");
> =C2=A0			break;
> =C2=A0		}
> +
> +		inst->queuing_num++;
> +		list_del_init(&vpu_buf->list);
> +		break;
> =C2=A0	}
> =C2=A0
> -	return 0;
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
> @@ -1236,6 +1235,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2=
_buffer *vb)
> =C2=A0	vbuf->sequence =3D inst->queued_src_buf_num++;
> =C2=A0
> =C2=A0	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> +
> +	INIT_LIST_HEAD(&vpu_buf->list);
> +	mutex_lock(&inst->feed_lock);
> +	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
> +	mutex_unlock(&inst->feed_lock);

Needs some comment. Also why not do everything in the mutex ?

> =C2=A0}
> =C2=A0
> =C2=A0static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
> @@ -1287,10 +1291,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_bu=
ffer *vb)
> =C2=A0		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
> =C2=A0		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf,=
 2));
> =C2=A0
> -	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		if (inst->empty_queue)
> +			inst->empty_queue =3D false;
> =C2=A0		wave5_vpu_dec_buf_queue_src(vb);
> -	else if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +	} else if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> =C2=A0		wave5_vpu_dec_buf_queue_dst(vb);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *=
inst)
> @@ -1385,6 +1392,13 @@ static int streamoff_output(struct vb2_queue *q)
> =C2=A0	dma_addr_t new_rd_ptr;
> =C2=A0	struct dec_output_info dec_info;
> =C2=A0	unsigned int i;
> +	struct vpu_src_buffer *vpu_buf, *tmp;
> +
> +	inst->retry =3D false;
> +	inst->queuing_num =3D 0;
> +
> +	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
> +		list_del_init(&vpu_buf->list);
> =C2=A0
> =C2=A0	for (i =3D 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
> =C2=A0		ret =3D wave5_vpu_dec_set_disp_flag(inst, i);
> @@ -1474,6 +1488,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2=
_queue *q)
> =C2=A0
> =C2=A0	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> =C2=A0	pm_runtime_resume_and_get(inst->dev->dev);
> +	inst->empty_queue =3D false;
> +	inst->sent_eos =3D false;
> =C2=A0
> =C2=A0	while (check_cmd) {
> =C2=A0		struct queue_status_info q_status;
> @@ -1481,11 +1497,11 @@ static void wave5_vpu_dec_stop_streaming(struct v=
b2_queue *q)
> =C2=A0
> =C2=A0		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status)=
;
> =C2=A0
> -		if (q_status.report_queue_count =3D=3D 0)
> +		if ((inst->state =3D=3D VPU_INST_STATE_STOP || q_status.instance_queue=
_count =3D=3D 0) &&
> +		=C2=A0=C2=A0=C2=A0 q_status.report_queue_count =3D=3D 0)
> =C2=A0			break;
> =C2=A0
> -		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
> -			break;
> +		wave5_vpu_wait_interrupt(inst, VPU_DEC_STOP_TIMEOUT);
> =C2=A0
> =C2=A0		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
> =C2=A0			dev_dbg(inst->dev->dev, "there is no output info\n");
> @@ -1577,13 +1593,24 @@ static void wave5_vpu_dec_device_run(void *priv)
> =C2=A0	struct queue_status_info q_status;
> =C2=A0	u32 fail_res =3D 0;
> =C2=A0	int ret =3D 0;
> +	unsigned long flags;
> =C2=A0
> =C2=A0	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstre=
am data", __func__);
> =C2=A0	pm_runtime_resume_and_get(inst->dev->dev);
> -	ret =3D fill_ringbuffer(inst);
> -	if (ret) {
> -		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
> -		goto finish_job_and_return;
> +	if (!inst->retry) {
> +		mutex_lock(&inst->feed_lock);
> +		ret =3D fill_ringbuffer(inst);
> +		mutex_unlock(&inst->feed_lock);
> +		if (ret < 0) {
> +			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
> +			goto finish_job_and_return;
> +		} else if (!inst->eos &&
> +				inst->queuing_num =3D=3D 0 &&
> +				inst->state =3D=3D VPU_INST_STATE_PIC_RUN) {
> +			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __f=
unc__);
> +			inst->empty_queue =3D true;
> +			goto finish_job_and_return;
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	switch (inst->state) {
> @@ -1608,7 +1635,9 @@ static void wave5_vpu_dec_device_run(void *priv)
> =C2=A0			}
> =C2=A0			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> =C2=A0		} else {
> +			spin_lock_irqsave(&inst->state_spinlock, flags);

If you are to lock/only for every state switch, just do that inside the hel=
per
function, that will reduce the footprint. Also, consider using guard().

> =C2=A0			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> =C2=A0		}
> =C2=A0
> =C2=A0		break;
> @@ -1619,8 +1648,9 @@ static void wave5_vpu_dec_device_run(void *priv)
> =C2=A0		 * we had a chance to switch, which leads to an invalid state
> =C2=A0		 * change.
> =C2=A0		 */
> +		spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0		switch_state(inst, VPU_INST_STATE_PIC_RUN);
> -
> +		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> =C2=A0		/*
> =C2=A0		 * During DRC, the picture decoding remains pending, so just leav=
e the job
> =C2=A0		 * active until this decode operation completes.
> @@ -1634,12 +1664,14 @@ static void wave5_vpu_dec_device_run(void *priv)
> =C2=A0		ret =3D wave5_prepare_fb(inst);
> =C2=A0		if (ret) {
> =C2=A0			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", =
ret);
> +			spin_lock_irqsave(&inst->state_spinlock, flags);
> =C2=A0			switch_state(inst, VPU_INST_STATE_STOP);
> +			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> =C2=A0			break;
> =C2=A0		}
> =C2=A0
> =C2=A0		if (q_status.instance_queue_count) {
> -			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> +			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> =C2=A0			return;
> =C2=A0		}
> =C2=A0
> @@ -1650,26 +1682,42 @@ static void wave5_vpu_dec_device_run(void *priv)
> =C2=A0			dev_err(inst->dev->dev,
> =C2=A0				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
> =C2=A0				m2m_ctx, ret, fail_res);
> -			break;
> +			goto finish_job_and_return;
> +		}
> +
> +		if (fail_res =3D=3D WAVE5_SYSERR_QUEUEING_FAIL) {
> +			inst->retry =3D true;
> +		} else {
> +			inst->retry =3D false;
> +			if (!inst->eos)
> +				inst->queuing_num--;
> =C2=A0		}
> -		/* Return so that we leave this job active */
> -		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
> -		return;
> -	default:
> -		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst=
->state));
> =C2=A0		break;
> +	default:
> +		dev_dbg(inst->dev->dev, "Execution of a job in state %s illegal.\n",
> +			state_to_str(inst->state));
> =C2=A0	}
> =C2=A0
> =C2=A0finish_job_and_return:
> =C2=A0	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
> =C2=A0	pm_runtime_mark_last_busy(inst->dev->dev);
> =C2=A0	pm_runtime_put_autosuspend(inst->dev->dev);
> -	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +	/*
> +	 * After receiving CMD_STOP, there is no input, but we have to run devi=
ce_run
> +	 * to send DEC_PIC command until display index =3D=3D -1, so job_finish=
 was always
> +	 * called in the device_run to archive it, the logic was very wasteful
> +	 * in power and CPU time.
> +	 * If EOS is passed, device_run will not call job_finish no more, it is=
 called
> +	 * only if HW is idle status in order to reduce overhead.
> +	 */
> +	if (!inst->sent_eos)
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static void wave5_vpu_dec_job_abort(void *priv)
> =C2=A0{
> =C2=A0	struct vpu_instance *inst =3D priv;
> +	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	ret =3D switch_state(inst, VPU_INST_STATE_STOP);
> @@ -1680,6 +1728,8 @@ static void wave5_vpu_dec_job_abort(void *priv)
> =C2=A0	if (ret)
> =C2=A0		dev_warn(inst->dev->dev,
> =C2=A0			 "Setting EOS for the bitstream, fail: %d\n", ret);
> +
> +	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static int wave5_vpu_dec_job_ready(void *priv)
> @@ -1715,7 +1765,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
> =C2=A0				"No capture buffer ready to decode!\n");
> =C2=A0			break;
> =C2=A0		} else if (!wave5_is_draining_or_eos(inst) &&
> -			=C2=A0=C2=A0 !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
> +			=C2=A0=C2=A0 (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
> +			=C2=A0=C2=A0=C2=A0 inst->empty_queue)) {
> =C2=A0			dev_dbg(inst->dev->dev,
> =C2=A0				"No bitstream data to decode!\n");
> =C2=A0			break;
> @@ -1755,6 +1806,8 @@ static int wave5_vpu_open_dec(struct file *filp)
> =C2=A0	inst->ops =3D &wave5_vpu_dec_inst_ops;
> =C2=A0
> =C2=A0	spin_lock_init(&inst->state_spinlock);
> +	mutex_init(&inst->feed_lock);
> +	INIT_LIST_HEAD(&inst->avail_src_bufs);
> =C2=A0
> =C2=A0	inst->codec_info =3D kzalloc(sizeof(*inst->codec_info), GFP_KERNEL=
);
> =C2=A0	if (!inst->codec_info)
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index 5b10f9f49b9f..edbe69540ef1 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -207,6 +207,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2 *fail_res)
> =C2=A0	int retry =3D 0;
> =C2=A0	struct vpu_device *vpu_dev =3D inst->dev;
> =C2=A0	int i;
> +	struct dec_output_info dec_info;
> =C2=A0
> =C2=A0	*fail_res =3D 0;
> =C2=A0	if (!inst->codec_info)
> @@ -227,11 +228,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, =
u32 *fail_res)
> =C2=A0			goto unlock_and_return;
> =C2=A0		}
> =C2=A0
> -		if (*fail_res =3D=3D WAVE5_SYSERR_VPU_STILL_RUNNING &&
> -		=C2=A0=C2=A0=C2=A0 retry++ >=3D MAX_FIRMWARE_CALL_RETRY) {
> +		if (ret =3D=3D 0)
> +			break;
> +
> +		if (*fail_res !=3D WAVE5_SYSERR_VPU_STILL_RUNNING) {
> +			dev_warn(inst->dev->dev, "dec_finish_seq timed out\n");
> +			goto unlock_and_return;
> +		}
> +
> +		if (retry++ >=3D MAX_FIRMWARE_CALL_RETRY) {
> =C2=A0			ret =3D -ETIMEDOUT;
> =C2=A0			goto unlock_and_return;
> =C2=A0		}
> +
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		wave5_vpu_dec_get_output_info(inst, &dec_info);
> +		ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +		if (ret) {
> +			pm_runtime_put_sync(inst->dev->dev);
> +			return ret;
> +		}
> =C2=A0	} while (ret !=3D 0);
> =C2=A0
> =C2=A0	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__)=
;
> @@ -248,6 +264,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2 *fail_res)
> =C2=A0
> =C2=A0	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
> =C2=A0
> +	mutex_destroy(&inst->feed_lock);
> +
> =C2=A0unlock_and_return:
> =C2=A0	mutex_unlock(&vpu_dev->hw_lock);
> =C2=A0	pm_runtime_put_sync(inst->dev->dev);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index bc101397204d..adfbc104f939 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -818,6 +818,11 @@ struct vpu_instance {
> =C2=A0	bool cbcr_interleave;
> =C2=A0	bool nv21;
> =C2=A0	bool eos;
> +	bool sent_eos; /* check if EOS is sent to application */
> +	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSER=
R_QUEUEING_FAIL*/
> +	int queuing_num; /* count of bitstream queued */
> +	struct mutex feed_lock; /* lock for feeding bitstream buffers */
> +	bool empty_queue;


So my overall impression is that most of this change make sense if you real=
ly
don't want to architecture the VPU library part. I left a minor remark that
needs addressing, along with fixing the crash and deadlock found during tes=
ting.

regards,
Nicolas

> =C2=A0	struct vpu_buf bitstream_vbuf;
> =C2=A0	dma_addr_t last_rd_ptr;
> =C2=A0	size_t remaining_consumed_bytes;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b=
/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> index 1ea9f5f31499..4ebd48d5550e 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
> @@ -59,6 +59,7 @@
> =C2=A0//=C2=A0 application specific configuration
> =C2=A0#define VPU_ENC_TIMEOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 60000
> =C2=A0#define VPU_DEC_TIMEOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 60000
> +#define VPU_DEC_STOP_TIMEOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 10
> =C2=A0
> =C2=A0// for WAVE encoder
> =C2=A0#define USE_SRC_PRP_AXI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0

--=-/T8YZ2drafvk/cQXW9ma
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLHrCQAKCRDZQZRRKWBy
9KGfAQDpUipAv+ekBMINOmRNe8qF3p1kdsVO5pLFMFf/paYRXAEArEZYQxMwGeLc
RMoz/1tkKtMtAcAV0/KsWi8OAyx5gw0=
=vVvQ
-----END PGP SIGNATURE-----

--=-/T8YZ2drafvk/cQXW9ma--

