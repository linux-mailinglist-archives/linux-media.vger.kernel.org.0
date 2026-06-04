Return-Path: <linux-media+bounces-63724-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4GdkE8bhIGpW8wAAu9opvQ
	(envelope-from <linux-media+bounces-63724-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:24:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F263C7B7
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:24:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k1v+DYj8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63724-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63724-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9474A303688D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7EA31618B;
	Thu,  4 Jun 2026 02:19:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EB531A55B
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 02:19:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539549; cv=none; b=T7x5zczFV/pCUJovwmuDQYkF/nP3kvvW0W+FANZu0XDctwZMCJ5tT7wGox0x6X1C5BNCZtWuRkWOUdbvHOi0aoyfY9FrCz4PP9glo+fP3iM6moHg4FoUFQ1aEn565ppke1/dwJdG0A+X+q9qBVWz1NN9kTLqR54BsyphskjXf84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539549; c=relaxed/simple;
	bh=gdjv2aOPxGu+647A8DMzHB5bqW589izUdUivyY8QC7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=psLgbt7kPPItTsZ2iH1tAXCiJGYWKUpx8a+M4WHuPJ1/N/b1yfaT0uy0itglrfsOqcNyJPBh+LTclrGE8SrNm+TUgedM/LL8E9i/SA12wPfnEGIFiLy7sWp1iSGGnbXuBts9rNtwUBIwzPD5Kij8VkLI2BoMlAiSb9FX+Axmay0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1v+DYj8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328321F00893;
	Thu,  4 Jun 2026 02:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780539543;
	bh=ZUufKkhBhoDquK3wVv8vLBKpKXQfgvuKBeTXFuU0Prk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k1v+DYj8+CvLHnJkwnazMBZ8w+1+G45K78eTsxBs1QWWiCjxs+M9l/1z0FkIfdyfj
	 p50tiqX5ryBv95Hn1UuvaVAoLK37OU4qTlA/WltgIzAWrlD/vEHsQlu7FydXc3qpAG
	 dubXE1gBSBs5JyuCNl5M9tblAD1XSVpmLjpVZ/FWkldZxjMz9jac6uum0e8f0AU9Nw
	 fb7tPgMi4RLHFLCeCh/U7Nf1Bqt0bnc5PY23G5mz/I+MY9S1+eyhVXZ7Q0BnbGumwR
	 Gvsop7W4uq7Q932YX5XvqJItK4uqnFHB6Jwy8Hw7AUXWI3X17Rtu5U4iArSihYwGMu
	 a0VLfxDvGpMnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 1/4] media: chips-media: wave5: Guard bit depth check
 with initial_info_obtained
Reply-To: sashiko-reviews@lists.linux.dev
To: Jackson.lee <jackson.lee@chipsnmedia.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604020155.77-2-jackson.lee@chipsnmedia.com>
References: <20260604020155.77-2-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:19:02 +0000
Message-Id: <20260604021903.328321F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63724-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jackson.lee@chipsnmedia.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,chipsnmedia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 452F263C7B7

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Data race when checking `initial_info_obtained` and `luma_bitdepth=
` without locks, leading to a TOCTOU-like race that reproduces the original=
 bug.
- [High] Bypassing the bitdepth check for unresolved sequences reintroduces=
 a timeout for unsupported 10-bit HEVC streams on WAVE521C.

Pre-existing issues:
- [Critical] Kernel heap buffer overflow in `wave5_prepare_fb` due to unval=
idated `fbc_buf_count` and `linear_num`.
- [Critical] Physical memory corruption (DMA overflow) in `wave5_prepare_fb=
` due to missing buffer size validation against bitstream dimensions.
- [High] Ignored return value of `pm_runtime_resume_and_get()` leads to unp=
owered hardware access and usage count underflow.
- [High] Lockless modification of `inst->state` in `wave5_vpu_dec_start_str=
eaming()`.
--

commit 26ff861a58ecc6c2122ff143493bf266fceeafb4
Author: Jackson Lee <jackson.lee@chipsnmedia.com>

media: chips-media: wave5: Guard bit depth check with initial_info_obtained

When CAPTURE STREAMON is called before the VPU has completed sequence
initialization, the initial_info fields contain uninitialized data. The dri=
ver
checks luma_bitdepth and rejects anything other than 8-bit, so garbage valu=
es
cause STREAMON to fail spuriously. This fix checks initial_info_obtained
before accessing the bit depth fields.

> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index bb2ba9204a836..01d1368b29656 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1403,6 +1403,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2=
_queue *q, unsigned int count
>  	} else if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>  		struct dec_initial_info *initial_info =3D
>  			&inst->codec_info->dec_info.initial_info;
> +		struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> =20
>  		if (inst->state =3D=3D VPU_INST_STATE_STOP)
>  			ret =3D switch_state(inst, VPU_INST_STATE_INIT_SEQ);

[Severity: High]
This is a pre-existing issue, but does this code safely modify inst->state?

The state appears to be protected by inst->state_spinlock, but here it is
read and modified directly without acquiring the lock.

If the M2M worker thread modifies the state asynchronously via
set_instance_state() which takes the lock, could this lack of serialization
result in an inconsistent internal driver state machine?

> @@ -1410,6 +1411,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2=
_queue *q, unsigned int count
>  			goto return_buffers;
> =20
>  		if (inst->state =3D=3D VPU_INST_STATE_INIT_SEQ &&
> +		    p_dec_info->initial_info_obtained &&
>  		    inst->dev->product_code =3D=3D WAVE521C_CODE) {

[Severity: High]
Can this introduce a data race when checking p_dec_info->initial_info_obtai=
ned
and initial_info->luma_bitdepth?

If the M2M worker thread in wave5_vpu_dec_complete_seq_init() updates this
state concurrently:

wave5_vpu_dec_complete_seq_init()
    if (!ret)
        p_dec_info->initial_info_obtained =3D true;
    ...
    p_dec_info->initial_info =3D *info;

Could a concurrent ioctl observe initial_info_obtained as true while
luma_bitdepth is still uninitialized, observing garbage and reproducing the
same spurious failure this patch intended to resolve?

[Severity: High]
By bypassing the bitdepth validation here when initial_info_obtained is fal=
se,
do we defer the rejection of unsupported 10-bit streams to the worker threa=
d?

If wave5_prepare_fb() catches the 10-bit stream later, its error handler
in wave5_vpu_dec_device_run() simply stops the instance:

wave5_vpu_dec_device_run()
    ret =3D wave5_prepare_fb(inst);
    if (ret) {
        ...
        set_instance_state(inst, VPU_INST_STATE_STOP);
        break;
    }

Since this doesn't return the queued capture buffers via v4l2_m2m_buf_done(=
),
could userspace hang indefinitely on DQBUF waiting for buffers that will
never arrive?

>  			if (initial_info->luma_bitdepth !=3D 8) {
>  				dev_info(inst->dev->dev, "%s: no support for %d bit depth",
> @@ -1418,7 +1420,6 @@ static int wave5_vpu_dec_start_streaming(struct vb2=
_queue *q, unsigned int count
>  				goto return_buffers;
>  			}
>  		}
> -
>  	}
>  	pm_runtime_put_autosuspend(inst->dev->dev);

[Severity: High]
This is a pre-existing issue, but is it safe to ignore the return value of
pm_runtime_resume_and_get() earlier in this function?

If the initial resume fails, it returns a negative error and intrinsically
drops the usage counter.

Proceeding unconditionally and calling pm_runtime_put_autosuspend() here
would cause a double-decrement of the PM usage counter. Could this lead to
an underflow and unpowered hardware access?

>  	return ret;

[ ... ]

Additionally, there are some pre-existing issues in other parts of the driv=
er
that might be worth reviewing:

[Severity: Critical]
This is a pre-existing issue, but does wave5_prepare_fb() properly bound
the number of frame buffers?

The function loops up to non_linear_num (which comes from the bitstream)
and linear_num (userspace queued capture buffers):

wave5_prepare_fb()
    for (i =3D 0; i < non_linear_num; i++) {
        struct frame_buffer *frame =3D &inst->frame_buf[i];

    ...
    for (i =3D 0; i < linear_num; i++) {
        struct frame_buffer *frame =3D &inst->frame_buf[non_linear_num + i];

The bounds check (num_of_decoding_fbs >=3D WAVE5_MAX_FBS) seems to happen
after these loops. Since the inst->frame_buf array is fixed size, could a
malicious bitstream or a large number of queued buffers cause an
out-of-bounds write into inst->frame_buf[] here?

[Severity: Critical]
This is a pre-existing issue, but does wave5_prepare_fb() verify the size
of the backing vb2 buffer before computing physical DMA addresses?

When computing the addresses based on dynamic bitstream dimensions:

wave5_prepare_fb()
    buf_addr_y =3D vb2_dma_contig_plane_dma_addr(vb, 0);
    buf_addr_cb =3D buf_addr_y + luma_size;
    buf_addr_cr =3D buf_addr_cb + chroma_size;

If userspace continues streaming with previously queued small buffers, could
the VPU hardware decode a large frame into undersized physical addresses
and cause out-of-bounds DMA writes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604020155.77-1=
-jackson.lee@chipsnmedia.com?part=3D1

