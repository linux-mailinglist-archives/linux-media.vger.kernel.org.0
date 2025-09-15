Return-Path: <linux-media+bounces-42592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5F0B585C4
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 22:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36C4F1AA541F
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 20:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1312D28C84F;
	Mon, 15 Sep 2025 20:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="obTRcZb7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1A92877E9;
	Mon, 15 Sep 2025 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757967266; cv=none; b=FEq/DpV57jXMHuIxnIQZ7Q/9auKISNzWjBl505hTOQ0bWwGl+apMF4U+zPOGTuWUuDLhQIWFBNq5STFg3QLvD6tD2SHch/85pbCK22KU/s4QzDV4wcBOUdWhosCbYm4yhcF0mHJCZUIpKPH1TWdbLO64SgrJGgm7lf/BxR6Lwcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757967266; c=relaxed/simple;
	bh=LvOHEVAvq7rdM3xfDpdDcL2FSLjjmH2Oqnm+686N7HQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F1CMG7YJR9md1vFI8gca/cyRK3/sq5jeCdQKDGlhdYDJ3T2hv13dkVA+ETuxtgT7JN++fIpnhFm6GBLSrXSdLO8BrM8PDaBQchur0mY5frlB5vor1+CZMJKs+CjrGoOxwFxg/n9Fg9sFhUf44aami0/q/jMEQDq46Rp+8OA5Ysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=obTRcZb7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757967261;
	bh=LvOHEVAvq7rdM3xfDpdDcL2FSLjjmH2Oqnm+686N7HQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=obTRcZb7RrKrveGtifgug10pHapcxWLaj+rS6nRuUX6dX0SFb/vJqIl2JwzA1PPQB
	 z4zbf/ehDIE4EadmNR6hQzp/VySbXtO8sC+zO1W9lFKdwnCtnf7gi/xiWvDag7lgK1
	 FQ5oZJGw8uNNCq6BtN4limIdnab3d+U8f/3CCZWYtSF1diyAXaItZFTRb46zmF/qLm
	 pJzDK2HlPHEZnsKiJK4wX8vOxG2lmi1P4cf1BddC0OpMxOJKICGER8ThOiF7ft+5n5
	 0B1isE6H6TKgBSefYlb87GGF5O7eikkg8v3WqfHapWftiJDqU+eaiWbxAUY1NbOOAl
	 Y9d3p5N3rrT6w==
Received: from [IPv6:2606:6d00:10:aee0::c41] (unknown [IPv6:2606:6d00:10:aee0::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EAB417E0A49;
	Mon, 15 Sep 2025 22:14:20 +0200 (CEST)
Message-ID: <a23922e98926f14158d1cb8525026d7cdfea7b52.camel@collabora.com>
Subject: Re: [PATCH v3 0/4] Performance improvement of decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Mon, 15 Sep 2025 16:14:18 -0400
In-Reply-To: <SLXP216MB11483A70C78A57FEFDF94AF2ED15A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
			 <f79ab2a0db0eb4aad20ed488de3635f9d8942cdf.camel@collabora.com>
			 <SLXP216MB114806E1937625CA3760CA3EED0FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
		 <48540d8ee22cf747d2dd591a7869baf1cba6719e.camel@collabora.com>
		 <SLXP216MB11483F38D23A5BDFC47068EAED0EA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
	 <c14c5a8b309ffcea723cee66430a59ee57b73e5f.camel@collabora.com>
	 <SLXP216MB11483A70C78A57FEFDF94AF2ED15A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-6ckOI9CuWJkva+f/aovh"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-6ckOI9CuWJkva+f/aovh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 15 septembre 2025 =C3=A0 07:33 +0000, jackson.lee a =C3=A9crit=C2=
=A0:
> Hi Nicolas
>=20
> > Good catch, unfortunately it does not completely fix the problem for me=
.
> > You can find a the end of this message the patch I actually tested. Not=
e
> > I ,ove the mutex_ret in a close scope, and fixed other occurence of thi=
s
> > pattern, except one that I highlighted to you with a FIXME.
> >=20
> > Some new information, I had this trace from GStreamer when the bug occu=
red
> > on forward seeks (very rare):
> >=20
> > ** (gst-play-1.0:604): WARNING **: 00:03:59.965: v4l2h264dec0: Too old
> > frames, bug in decoder -- please file a bug
> >=20
> > [root@jacinto nicolas]# echo w > /proc/sysrq-trigger [=C2=A0 335.116289=
] sysrq:
> > Show Blocked State
> > [=C2=A0 335.120054] task:typefind:sink=C2=A0=C2=A0 state:D stack:0=C2=
=A0=C2=A0=C2=A0=C2=A0 pid:607=C2=A0=C2=A0 tgid:604
> > ppid:543=C2=A0=C2=A0=C2=A0 task_flags:0x40044c flags:0x00000019
> > [=C2=A0 335.131147] Call trace:
> > [=C2=A0 335.133584]=C2=A0 __switch_to+0xf0/0x1c0 (T) [=C2=A0 335.137442=
]
> > __schedule+0x35c/0x9bc [=C2=A0 335.140935]=C2=A0 schedule+0x34/0x110 [=
=C2=A0 335.144162]
> > schedule_timeout+0x80/0x104 [=C2=A0 335.148081]
> > wait_for_completion_timeout+0x74/0x158
> > [=C2=A0 335.152955]=C2=A0 wave5_vpu_wait_interrupt+0x28/0x60 [wave5] [=
=C2=A0 335.158252]
> > wave5_vpu_dec_stop_streaming+0x68/0x28c [wave5] [=C2=A0 335.163915]
> > __vb2_queue_cancel+0x2c/0x2d4 [videobuf2_common] [=C2=A0 335.169668]
> > vb2_core_queue_release+0x20/0x74 [videobuf2_common] [=C2=A0 335.175678]
> > vb2_queue_release+0x10/0x1c [videobuf2_v4l2] [=C2=A0 335.181081]
> > v4l2_m2m_ctx_release+0x20/0x40 [v4l2_mem2mem] [=C2=A0 335.186567]
> > wave5_vpu_release_device+0x44/0x150 [wave5] [=C2=A0 335.191879]
> > wave5_vpu_dec_release+0x20/0x2c [wave5] [=C2=A0 335.196841]
> > v4l2_release+0xb4/0xf0 [videodev] [=C2=A0 335.201709]=C2=A0 __fput+0xd0=
/0x2e0
> > [=C2=A0 335.205090]=C2=A0 ____fput+0x14/0x20 [=C2=A0 335.208468]=C2=A0 =
task_work_run+0x64/0xd4
> > [=C2=A0 335.212164]=C2=A0 do_exit+0x240/0x8e0 [=C2=A0 335.215552]=C2=A0=
 do_group_exit+0x30/0xa4
> > [=C2=A0 335.219177]=C2=A0 get_signal+0x790/0x860 [=C2=A0 335.222676]=C2=
=A0 do_signal+0x94/0x394
> > [=C2=A0 335.225986]=C2=A0 do_notify_resume+0xd0/0x14c [=C2=A0 335.22991=
0]
> > el0_svc+0xe4/0xe8 [=C2=A0 335.232967]=C2=A0 el0t_64_sync_handler+0xa0/0=
xe4
> > [=C2=A0 335.237154]=C2=A0 el0t_64_sync+0x198/0x19c
> >=20
> > regards,
> > Nicolas
> >=20
>=20
>=20
> There were two problems.
>=20
> One is a logic double linked list managing, it caused crash.
> I added linked list(avail_src_bufs) to manage buffer list queued in order=
 to improve performance of decoder.
> But when it was deleted from list, the prev and next pointer had the prev=
ious pointer address, so sometimes it caused crash and deadlock.
>=20
> Second, when stop_call function was called, sometimes infinite loop was p=
ut. But it is needed since flush was added into streamoff_output.
>=20
> To fix the above problems (deadlock and crash), the below patch is needed=
.
>=20
>=20
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 4554a24df8a1..9572573ce606 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1139,6 +1139,24 @@ static int write_to_ringbuffer(struct vpu_instance=
 *inst, void *buffer, size_t b
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static struct vpu_src_buffer *inst_buf_remove(struct vpu_instance *inst)
> +{
> +	struct vpu_src_buffer *b;
> +
> +	if (list_empty(&inst->avail_src_bufs))
> +		return NULL;
> +	inst->queued_count--;
> +	b =3D list_first_entry(&inst->avail_src_bufs, struct vpu_src_buffer, li=
st);
> +	list_del(&b->list);
> +	b->list.prev =3D b->list.next =3D NULL;
> +	INIT_LIST_HEAD(&b->list);
> +	if (inst->queued_count =3D=3D 0) {
> +		inst->avail_src_bufs.prev =3D inst->avail_src_bufs.next =3D NULL;
> +		INIT_LIST_HEAD(&inst->avail_src_bufs);
> +	}
> +	return b;
> +}
> +
> =C2=A0static int fill_ringbuffer(struct vpu_instance *inst)
> =C2=A0{
> =C2=A0	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> @@ -1154,7 +1172,7 @@ static int fill_ringbuffer(struct vpu_instance *ins=
t)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
> +	while((vpu_buf =3D inst_buf_remove(inst)) !=3D NULL) {

Can't you make sure of list_for_each_safe() ?

Nicolas


> =C2=A0		struct vb2_v4l2_buffer *vbuf =3D &vpu_buf->v4l2_m2m_buf.vb;
> =C2=A0		struct vpu_buf *ring_buffer =3D &inst->bitstream_vbuf;
> =C2=A0		size_t src_size =3D vb2_get_plane_payload(&vbuf->vb2_buf, 0);
> @@ -1217,7 +1235,6 @@ static int fill_ringbuffer(struct vpu_instance *ins=
t)
> =C2=A0		}
> =C2=A0
> =C2=A0		inst->queuing_num++;
> -		list_del_init(&vpu_buf->list);
> =C2=A0		break;
> =C2=A0	}
> =C2=A0
> @@ -1233,13 +1250,9 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2=
_buffer *vb)
> =C2=A0
> =C2=A0	vpu_buf->consumed =3D false;
> =C2=A0	vbuf->sequence =3D inst->queued_src_buf_num++;
> -
> -	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> -
> -	INIT_LIST_HEAD(&vpu_buf->list);
> -	mutex_lock(&inst->feed_lock);
> =C2=A0	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
> -	mutex_unlock(&inst->feed_lock);
> +	inst->queued_count++;
> +	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> =C2=A0}
> =C2=A0
> =C2=A0static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
> @@ -1292,9 +1305,12 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buf=
fer *vb)
> =C2=A0		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf,=
 2));
> =C2=A0
> =C2=A0	if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> +		mutex_lock(&inst->feed_lock);
> +		wave5_vpu_dec_buf_queue_src(vb);
> +
> =C2=A0		if (inst->empty_queue)
> =C2=A0			inst->empty_queue =3D false;
> -		wave5_vpu_dec_buf_queue_src(vb);
> +		mutex_unlock(&inst->feed_lock);
> =C2=A0	} else if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> =C2=A0		wave5_vpu_dec_buf_queue_dst(vb);
> =C2=A0	}
> @@ -1396,9 +1412,13 @@ static int streamoff_output(struct vb2_queue *q)
> =C2=A0
> =C2=A0	inst->retry =3D false;
> =C2=A0	inst->queuing_num =3D 0;
> -
> -	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
> -		list_del_init(&vpu_buf->list);
> +	inst->queued_count =3D 0;
> +	mutex_lock(&inst->feed_lock);
> +	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list) {
> +		vpu_buf->consumed =3D false;
> +		list_del(&vpu_buf->list);
> +	}
> +	mutex_unlock(&inst->feed_lock);
> =C2=A0
> =C2=A0	for (i =3D 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
> =C2=A0		ret =3D wave5_vpu_dec_set_disp_flag(inst, i);
> @@ -1484,28 +1504,9 @@ static void wave5_vpu_dec_stop_streaming(struct vb=
2_queue *q)
> =C2=A0{
> =C2=A0	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
> =C2=A0	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> -	bool check_cmd =3D TRUE;
> =C2=A0
> =C2=A0	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> =C2=A0	pm_runtime_resume_and_get(inst->dev->dev);
> -	inst->empty_queue =3D false;
> -	inst->sent_eos =3D false;
> -
> -	while (check_cmd) {
> -		struct queue_status_info q_status;
> -		struct dec_output_info dec_output_info;
> -
> -		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> -
> -		if ((inst->state =3D=3D VPU_INST_STATE_STOP || q_status.instance_queue=
_count =3D=3D 0) &&
> -		=C2=A0=C2=A0=C2=A0 q_status.report_queue_count =3D=3D 0)
> -			break;
> -
> -		wave5_vpu_wait_interrupt(inst, VPU_DEC_STOP_TIMEOUT);
> -
> -		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
> -			dev_dbg(inst->dev->dev, "there is no output info\n");
> -	}
> =C2=A0
> =C2=A0	v4l2_m2m_update_stop_streaming_state(m2m_ctx, q);
> =C2=A0
> @@ -1514,6 +1515,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2=
_queue *q)
> =C2=A0	else
> =C2=A0		streamoff_capture(q);
> =C2=A0
> +	inst->empty_queue =3D false;
> +	inst->sent_eos =3D false;
> =C2=A0	pm_runtime_mark_last_busy(inst->dev->dev);
> =C2=A0	pm_runtime_put_autosuspend(inst->dev->dev);
> =C2=A0}
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drive=
rs/media/platform/chips-media/wave5/wave5-vpu.h
> index 3847332551fc..2e7a6b0bf74a 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
> @@ -22,8 +22,8 @@
> =C2=A0
> =C2=A0struct vpu_src_buffer {
> =C2=A0	struct v4l2_m2m_buffer	v4l2_m2m_buf;
> -	struct list_head	list;
> =C2=A0	bool			consumed;
> +	struct list_head	list;
> =C2=A0};
> =C2=A0
> =C2=A0struct vpu_dst_buffer {
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> index edbe69540ef1..fb41890fc9c1 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
> @@ -52,11 +52,12 @@ int wave5_vpu_init_with_bitcode(struct device *dev, u=
8 *bitcode, size_t size)
> =C2=A0int wave5_vpu_flush_instance(struct vpu_instance *inst)
> =C2=A0{
> =C2=A0	int ret =3D 0;
> +	int mutex_ret =3D 0;
> =C2=A0	int retry =3D 0;
> =C2=A0
> -	ret =3D mutex_lock_interruptible(&inst->dev->hw_lock);
> -	if (ret)
> -		return ret;
> +	mutex_ret =3D mutex_lock_interruptible(&inst->dev->hw_lock);
> +	if (mutex_ret)
> +		return mutex_ret;
> =C2=A0	do {
> =C2=A0		/*
> =C2=A0		 * Repeat the FLUSH command until the firmware reports that the
> @@ -80,15 +81,16 @@ int wave5_vpu_flush_instance(struct vpu_instance *ins=
t)
> =C2=A0
> =C2=A0			mutex_unlock(&inst->dev->hw_lock);
> =C2=A0			wave5_vpu_dec_get_output_info(inst, &dec_info);
> -			ret =3D mutex_lock_interruptible(&inst->dev->hw_lock);
> -			if (ret)
> -				return ret;
> +			mutex_ret =3D mutex_lock_interruptible(&inst->dev->hw_lock);
> +			if (mutex_ret) {
> +				printk("lock fail...... \n");
> +				return mutex_ret;
> +			}
> =C2=A0			if (dec_info.index_frame_display > 0)
> =C2=A0				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display)=
;
> =C2=A0		}
> =C2=A0	} while (ret !=3D 0);
> =C2=A0	mutex_unlock(&inst->dev->hw_lock);
> -
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> @@ -208,6 +210,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u3=
2 *fail_res)
> =C2=A0	struct vpu_device *vpu_dev =3D inst->dev;
> =C2=A0	int i;
> =C2=A0	struct dec_output_info dec_info;
> +	int ret_mutex;
> =C2=A0
> =C2=A0	*fail_res =3D 0;
> =C2=A0	if (!inst->codec_info)
> @@ -215,10 +218,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, =
u32 *fail_res)
> =C2=A0
> =C2=A0	pm_runtime_resume_and_get(inst->dev->dev);
> =C2=A0
> -	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> -	if (ret) {
> +	ret_mutex =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret_mutex) {
> =C2=A0		pm_runtime_put_sync(inst->dev->dev);
> -		return ret;
> +		return ret_mutex;
> =C2=A0	}
> =C2=A0
> =C2=A0	do {
> @@ -243,10 +246,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, =
u32 *fail_res)
> =C2=A0
> =C2=A0		mutex_unlock(&vpu_dev->hw_lock);
> =C2=A0		wave5_vpu_dec_get_output_info(inst, &dec_info);
> -		ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> -		if (ret) {
> +		ret_mutex =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +		if (ret_mutex) {
> =C2=A0			pm_runtime_put_sync(inst->dev->dev);
> -			return ret;
> +			return ret_mutex;
> =C2=A0		}
> =C2=A0	} while (ret !=3D 0);
> =C2=A0
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index d9da80d64278..10f89f327436 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -822,6 +822,7 @@ struct vpu_instance {
> =C2=A0	bool sent_eos; /* check if EOS is sent to application */
> =C2=A0	bool retry; /* retry to feed bitstream if failure reason is WAVE5_=
SYSERR_QUEUEING_FAIL*/
> =C2=A0	int queuing_num; /* count of bitstream queued */
> +	int queued_count;
> =C2=A0	struct mutex feed_lock; /* lock for feeding bitstream buffers */
> =C2=A0	bool empty_queue;
> =C2=A0	struct vpu_buf bitstream_vbuf;

--=-6ckOI9CuWJkva+f/aovh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMhzmgAKCRDZQZRRKWBy
9KXHAP9T2HAiRPpF1wF9mZIT28wkU2emmpnH75fosnBvqSY1BQEApswmDv0ejjU+
HSp2pQ/AfnU6iqn2VZhnAcJPokQupQs=
=jOvC
-----END PGP SIGNATURE-----

--=-6ckOI9CuWJkva+f/aovh--

