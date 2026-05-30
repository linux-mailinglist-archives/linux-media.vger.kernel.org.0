Return-Path: <linux-media+bounces-63115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JkgEJq/Gmpk8AgAu9opvQ
	(envelope-from <linux-media+bounces-63115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:44:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26A60C36D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 12:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1515D3055DE1
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A0E3A2550;
	Sat, 30 May 2026 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eF4xlchq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699CB364EB1
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137836; cv=none; b=kazf1NO4Q8ALsrOeY8mOhnKs1EqlHacAKebJ/MU3Oa/TeHWnnPB/Xl8VBAKJljynmXFsceTSieOVXcB5X9EQf4Y+ZsDTq+F++ZMBUfg8kb4BQ5hjs8jPW/XgUvffW9eeKQf3cbfPQAheYi2wxgM1eXcNbKjLehd1TyzA0v7BVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137836; c=relaxed/simple;
	bh=lucdyyavL7jXbkdSjeNG2Zl505sNpYI+1HprOeu3vb0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eFIZdiWQj3TEHANtKVxX9Thbs3NeOgSh8GWcuTbV7J/+CCiuTUJpSykkrXbMnql/LHRAwBEMpnlq1Dy1DGLdjNhKWYn6CLYhLs3tXjJX0wkt/Wk7hDEDjiqjA5KK3Dfxhrqjmk1YRzDE2WkspdxUzBsXZimiarL1YcGdiKOTY70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eF4xlchq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32EB1F00893;
	Sat, 30 May 2026 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137835;
	bh=a97bGXgr+vt7uoxENWy/omv2VRGWtybqTc6X81A0cfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eF4xlchq62s0/uTVaEdQ1wwJbEwISr5wNo0SlppufezbCkbJsjzptbdFi7rhVcMaF
	 2X0FYnM1YbchmtlgmyWkjaTDNH3dUVYW0LXKEAwOAj2LQhNqLmYeiyJn1ZsNL5qi6w
	 c2KC6EyN3xo3Mo6I3+F2I+MYZMdbj7evYPg3S4Pvr/14I/xAFGfaXPZVh3GK9n5+nB
	 NLLLD5ANN7aqoifJMFxyP7m5kkah+zX0Q3EKhdqcEQMjs1R56WSJtvQT65gBtgj3A7
	 rFTkNqliMyNkr1IdMF85y7lhx592XBMFOr8w9WpPsn6QUzRDpOHJ8P0yR+dzwJ9ZPr
	 pahtDSpx7NSug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/8] media: meson: vdec: Condition buffer flushing on
 queue type in start_streaming
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-media@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260530094326.11892-5-linux.amoon@gmail.com>
References: <20260530094326.11892-5-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 10:43:54 +0000
Message-Id: <20260530104354.E32EB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63115-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 9A26A60C36D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Double-free of codec DMA buffers in the error path of `vdec_st=
art_streaming`.
- [Critical] During a dynamic resolution change, STREAMOFF bypasses hardwar=
e cleanup and leads to a critical Use-After-Free upon session closure.

Pre-existing issues:
- [High] The `sess->priv` context and codec DMA memory are permanently leak=
ed if `vdec_poweron(sess)` fails.
--

commit 8f59207c5628689c8af221e3f815a3651ccc803f
Author: Anand Moon <linux.amoon@gmail.com>

media: meson: vdec: Condition buffer flushing on queue type in start_stream=
ing

When vdec_start_streaming() fails, the error path clears buffers from both
the source and destination queues unconditionally. If one queue was already
streaming successfully from a prior invocation, flushing its buffers behind
its back leaves videobuf2 deadlocked waiting for completions.

Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel=
.org/

> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 8a5bf1a96830c..698a95566ad27 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -386,15 +386,15 @@ static int vdec_start_streaming(struct vb2_queue *q=
, unsigned int count)
>  	sess->status =3D STATUS_STOPPED;
>  	mutex_unlock(&core->lock);

[Severity: Critical]
Can this error path cause a double-free of the codec DMA buffers?

Looking at the error handling above this diff in vdec_start_streaming():

drivers/staging/media/meson/vdec/vdec.c:vdec_start_streaming() {
    [ ... ]
err_cleanup:
	vdec_free_canvas(sess);
	vdec_poweroff(sess);
	if (codec_ops && codec_ops->stop && sess->priv) {
		codec_ops->stop(sess);
    [ ... ]
}

When vdec_poweroff(sess) is called, it cascades to __vdec_1_stop(), which
calls codec_ops->stop(sess). The cleanup block then explicitly calls
codec_ops->stop(sess) a second time.

If the codec stop function (such as codec_h264_stop) frees the DMA memory
allocations without nullifying the pointers, could passing the exact same D=
MA
addresses to dma_free_coherent() a second time result in a double-free and
heap corruption?


[Severity: High]
This is a pre-existing issue, but does this bypass the cleanup of the sessi=
on
context and permanently leak memory?

During vdec_poweron(sess), the driver allocates the sess->priv context and
codec DMA buffers. If a subsequent initialization step fails, vdec_poweron
propagates the error, and vdec_start_streaming() jumps directly to
vififo_free:

drivers/staging/media/meson/vdec/vdec.c:vdec_start_streaming() {
    [ ... ]
	ret =3D vdec_poweron(sess);
	if (ret)
		goto vififo_free;
    [ ... ]
err_cleanup:
    [ ... ]
		kfree(sess->priv);
    [ ... ]
vififo_free:
    [ ... ]
bufs_done:
    [ ... ]
	sess->status =3D STATUS_STOPPED;
}

This bypasses the err_cleanup: label and the kfree(sess->priv) cleanup.
Because the session status is then explicitly set to STATUS_STOPPED right
here at bufs_done, won't later calls to vdec_stop_streaming() evaluate
old_status =3D=3D STATUS_STOPPED and skip the entire cleanup block, permane=
ntly
leaking the memory?


[Severity: Critical]
Does the newly introduced locking fix in vdec_stop_streaming() lead to a
Use-After-Free during a dynamic resolution change?

When the decoder detects a resolution change, it sets sess->status to
STATUS_NEEDS_RESUME. When userspace handles this by calling STREAMOFF on the
capture queue (the first call), vdec_stop_streaming() unconditionally sets
the status to STATUS_STOPPED at the start of the function:

drivers/staging/media/meson/vdec/vdec.c:vdec_stop_streaming() {
    [ ... ]
	mutex_lock(&core->lock);
	old_status =3D sess->status;
    [ ... ]
	sess->status =3D STATUS_STOPPED;
	mutex_unlock(&core->lock);

	if (old_status =3D=3D STATUS_RUNNING ||
	    old_status =3D=3D STATUS_INIT ||
	    (old_status =3D=3D STATUS_NEEDS_RESUME &&
	     (!sess->streamon_out || !sess->streamon_cap))) {
    [ ... ]
}

Because sess->streamon_cap is only cleared at the end of the function, both
streams are still active on the first STREAMOFF, so the hardware cleanup
condition evaluates to false.=20

When the second STREAMOFF is called on the output queue, old_status is now
STATUS_STOPPED, so cleanup is skipped again. Since cleanup is completely
bypassed, vififo memory and the recycle_thread are leaked.

If the user then calls STREAMON, won't it spawn a duplicate recycle_thread,
overwriting the old pointer? When the session is eventually closed, could
vdec_close() free the session structure while the orphaned thread continues
executing, resulting in a Use-After-Free?

> -	while ((buf =3D v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
> -		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> -	while ((buf =3D v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
> -		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> -
> -	if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +	if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>  		sess->streamon_out =3D 0;
> -	else
> +		while ((buf =3D v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +	} else {
>  		sess->streamon_cap =3D 0;
> +		while ((buf =3D v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +	}
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D4

