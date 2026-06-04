Return-Path: <linux-media+bounces-63726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c9QfOe7hIGpZ8wAAu9opvQ
	(envelope-from <linux-media+bounces-63726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:24:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1663C7C2
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:24:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ifj0E2A3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63726-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63726-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1A163008C01
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADE628DB49;
	Thu,  4 Jun 2026 02:24:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD55345CDC
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 02:24:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780539882; cv=none; b=DiCPRXQw5Pb33yg/nRGAU4si6zNMOnTVZzcWyl6pzr7T/DCrawDV4UzrJuXXOCMnRsup8kWbZwee0p14Qpz7fHyfadZCovtG1K3WDvC7NDO77PRj0Fcv/7AHm6UCTP0NeRb6a6APeK+H+ZJi9AveJ6qzPkmsyQT0vmXGnBe5MVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780539882; c=relaxed/simple;
	bh=n3YdPUDBO4TIzt6j6qj6CPRnz4UaT+dMmJiSvzVgnzA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n6g4abCnIv62ANfqstb1aExr+RKBGgxf/DPy5WKy5sTLU/JvJQp7vC39JFgKSq4M97UNdTUfoe0lVLL/96eQU/LH0FJftczJdB7fVDoq+LXPggsTMXp4QRo2Ls0j927fxUOidXNHZTpv6y4E2ZqnoK7MAUyYJDL7jTkUceza6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifj0E2A3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97981F00893;
	Thu,  4 Jun 2026 02:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780539880;
	bh=YR0WSfYatl82BsGC2zHGkQDQhjFYSy3QKpJr/QJMbBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ifj0E2A37GZTHhGFeGdYURIo+OyOETkby5Q17wWWf1ThIzaZZIGlWGTxDAgRDM96/
	 nBGNGB/nFyLWgkOG2qZe1vczKYtdcxr1/9K6K3OzqRyMCs8FAjgOAnR4+4KW84JFNl
	 1y6CcBkLNyngFOUmH5aWLxjC/3nO+fLpEPB1YCsMtHen8fY1MQfWaEwUcEDgkKZOqf
	 6Y6hDcnUoqhr4X7uIUZL0t3Gf4oWrInnY9bXlEoBJ6rPROd9J1Ea/sHeaXd9xxsLPR
	 sSo2VZ6k90FucltzwOoRG4sCxETYwD+BYRPhFMvV5jSUObmINJPJTXmAx/zzjvnsoj
	 JtLz4RVUz7IZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 3/4] media: chips-media: wave5: avoid skipping
 device_run while VPU has work
Reply-To: sashiko-reviews@lists.linux.dev
To: Jackson.lee <jackson.lee@chipsnmedia.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604020155.77-4-jackson.lee@chipsnmedia.com>
References: <20260604020155.77-4-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:24:40 +0000
Message-Id: <20260604022440.B97981F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63726-lists,linux-media=lfdr.de];
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chipsnmedia.com:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81F1663C7C2

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Invalid comparison between VPU hardware command count and V4L2 sof=
tware source buffer count causes decoding stalls for multi-frame bitstream =
buffers.
- [Medium] Bypassing the queue-empty check allows `queuing_num` to underflo=
w, permanently breaking the driver's job scheduling optimization.
- [Low] Variable shadowing of `q_status` in `wave5_vpu_dec_device_run`.

Pre-existing issues:
- [High] If the hardware ringbuffer lacks space for an incoming source buff=
er, the buffer is permanently dropped from the feed list.
--

commit 483963c314a78ddc15cfbde8b0ce5a96c14f95c1
Author: Jackson Lee <jackson.lee@chipsnmedia.com>

media: chips-media: wave5: avoid skipping device_run while VPU has work
   =20
This patch fixes an issue where the decoder stalls because empty_queue is
set to true even when the m2m context has pending commands. It queries the
VPU queue status before deciding whether to skip device_run, ensuring that
commands continue to be issued if the VPU is actively processing.

> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 01d1368b29656..b7fa19ea2aacb 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1663,9 +1663,15 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		} else if (!inst->eos &&
>  				inst->queuing_num =3D=3D 0 &&
>  				inst->state =3D=3D VPU_INST_STATE_PIC_RUN) {
> -			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __f=
unc__);
> -			inst->empty_queue =3D true;
> -			goto finish_job_and_return;
> +			struct queue_status_info q_status;

[Severity: Low]
Is this declaration of q_status shadowing an existing variable?

Looking at the top of wave5_vpu_dec_device_run(), q_status is already
declared. Could we reuse the existing variable instead of declaring a new
one here?

> +
> +			wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
> +			if (q_status.instance_queue_count =3D=3D v4l2_m2m_num_src_bufs_ready(=
m2m_ctx)) {

[Severity: High]
Does this comparison accurately reflect the remaining work if a single sour=
ce
buffer contains multiple encoded frames?

The instance_queue_count tracks the number of active commands in the
hardware, while v4l2_m2m_num_src_bufs_ready counts unconsumed userspace
bitstream buffers. If a user queues a single source buffer holding three
frames, num_src_bufs_ready is 1. When the hardware starts processing the
first frame, instance_queue_count becomes 1.

If they are equal, this code sets empty_queue to true and stops scheduling.
When the hardware finishes the first frame, instance_queue_count drops to 0,
but num_src_bufs_ready remains 1 because the buffer is only partially
consumed.

Can this cause the remaining frames in the buffer to permanently stall since
the worker might refuse to schedule until empty_queue is cleared by
another buffer?

[Severity: Medium]
What happens to the queuing_num counter if this condition falls through?

If instance_queue_count is not equal to num_src_bufs_ready, the block falls
through and the PIC_RUN state handling unconditionally calls start_decode().
If the VPU accepts the command, the routine executes:

	if (fail_res =3D=3D WAVE5_SYSERR_QUEUEING_FAIL) {
		...
	} else {
		inst->retry =3D false;
		if (!inst->eos)
			inst->queuing_num--;
	}

Since we only entered this block because inst->queuing_num was 0, would this
decrement cause queuing_num to underflow to -1?

Because it is signed, it would remain negative indefinitely, potentially
breaking the idle tracking logic and causing the driver to repeatedly issue
start_decode() commands without bitstream data.

> +				dev_dbg(inst->dev->dev, "%s: no bitstream, skip\n",
> +					__func__);
> +				inst->empty_queue =3D true;
> +				goto finish_job_and_return;
> +			}
>  		}
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does the fill_ringbuffer()
routine leak source buffers when the ringbuffer is full?

Looking at fill_ringbuffer() in the same file:

	while ((vpu_buf =3D inst_src_buf_remove(inst)) !=3D NULL) {
		...
		if (remain_size < src_size) {
			dev_dbg(inst->dev->dev,
				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
				__func__, remain_size, src_size, vbuf->vb2_buf.index);
			break;
		}
		...
	}

The function inst_src_buf_remove() takes the buffer off the available list.
When remain_size is less than src_size, the loop breaks out early, but the
buffer doesn't seem to be added back to the available list.

Will this permanently drop the buffer from the feed list, leading to lost
bitstream chunks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604020155.77-1=
-jackson.lee@chipsnmedia.com?part=3D3

