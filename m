Return-Path: <linux-media+bounces-63111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOgdJSq0Gmq/7ggAu9opvQ
	(envelope-from <linux-media+bounces-63111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:55:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE160BFD2
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D836302F5B4
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB31D39EB73;
	Sat, 30 May 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wp39Sw2y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B344399011
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134946; cv=none; b=ff+XD7g6dVqb7Amyg5MeGyG9Q9TeoDlzWTOX6v2kde+ZJgY+JcMP0p5RpG14OPy8bIOO8cB+ScMIR1bCc80qW2rNPAnsjMX982Z23ETMZD3Ecv808mdgLINc8f8p3Nm8WrGKfirVqiZwNL+nDT5E0B3yCx5qavi3XUYGXbZDXcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134946; c=relaxed/simple;
	bh=YcY1fe51AhUTw+UsyTJ0rgd7OqRycIEmbiMQMTDp0T0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ezOYcdjP45POH1NEbxKG7D/kNy8xqibbJPanCRHRmr958FEE0QnuUTszUar/7jdDZLi6hAZVtLEcDmvrD+y0SsyyWmJQQqDClAKWn1usNYYdHnvq0CBPaVI+mLGhLMeovpZtvMaK3O0nkKt2Frb9wNfmpkKMJ6I0QrqyjLpfkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wp39Sw2y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997391F00893;
	Sat, 30 May 2026 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780134944;
	bh=b4xdDTyLsm8t8NYoEzMiTZw1nzE0JjKSkKTNbA+wjWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wp39Sw2y+LGz5aCtJckIeQwXo6tXnBcp/HYIFMzUQXqCznN0+fp4+8xhZwMlyJWZc
	 amrgvsWYIJvUYttQMPwrCdumpFHzJ6/u3Ob23bHlfVdrsoKMpXnWkxVfGHne1KAfRs
	 VBI7L573e8WuX4L7lbjnVevI178ja1NwzKWYDFjv4UJ1HfWhZsre1VCBnUFbMNa5Ey
	 pbP7X7SShRaZsfpkIjY8HGpaebbXmTn3qnRy02/0A240326fbClQKpJ1tq6ZAX7751
	 V9Yug2Bq3fW5qyVclkRN4zXuUydj1jKEDJs1OvKn55IQJE8jZ1sJlKDH1Qfq4/2D4y
	 wgQnoHNltWVPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/8] media: meson: vdec: Fix memory leaks and
 lifetime of m2m device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260530094326.11892-2-linux.amoon@gmail.com>
References: <20260530094326.11892-2-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 09:55:43 +0000
Message-Id: <20260530095544.997391F00893@smtp.kernel.org>
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
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63111-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.103.45.18:received];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,smtp.kernel.org:mid,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: E0FE160BFD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free of `m2m_dev` and `core` on driver unbind.
- [Medium] Logically backwards error unwinding in `vdec_open()` introduces =
dead code and fails to fix a resource leak.
--

commit 1e540207d92a3242e7aac789684a1ad3c201c64e
Author: Anand Moon <linux.amoon@gmail.com>

media: meson: vdec: Fix memory leaks and lifetime of m2m device

This commit shifts the v4l2_m2m_init() call to vdec_probe() and releases
it in vdec_remove() to address a design flaw where the m2m device was bound
to the session. It also attempts to resolve resource leaks in the driver's
error handling paths.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel=
.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")

> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
[ ... ]
> @@ -873,23 +873,16 @@ static int vdec_open(struct file *file)
> =20
>  	sess->core =3D core;
> =20
> -	sess->m2m_dev =3D v4l2_m2m_init(&vdec_m2m_ops);
> -	if (IS_ERR(sess->m2m_dev)) {
> -		dev_err(dev, "Fail to v4l2_m2m_init\n");
> -		ret =3D PTR_ERR(sess->m2m_dev);
> -		goto err_free_sess;
> -	}
> -
> -	sess->m2m_ctx =3D v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init=
);
> +	sess->m2m_ctx =3D v4l2_m2m_ctx_init(core->m2m_dev, sess, m2m_queue_init=
);
>  	if (IS_ERR(sess->m2m_ctx)) {
>  		dev_err(dev, "Fail to v4l2_m2m_ctx_init\n");
>  		ret =3D PTR_ERR(sess->m2m_ctx);
> -		goto err_m2m_release;
> +		goto err_fh_del;

[Severity: Medium]
Is this error unwinding logic in the correct order? Jumps to err_fh_del here
will call v4l2_fh_exit() on sess->fh before it has been initialized further
down in vdec_open().

>  	}
> =20
>  	ret =3D vdec_init_ctrls(sess);
>  	if (ret)
> -		goto err_m2m_release;
> +		goto err_free_sess;

[Severity: Medium]
Does skipping err_fh_del here lead to a memory leak? If vdec_init_ctrls()
fails, jumping directly to err_free_sess bypasses freeing the successfully
allocated sess->m2m_ctx.

[ ... ]
> @@ -925,9 +918,9 @@ static int vdec_close(struct file *file)
>  	struct amvdec_session *sess =3D file_to_amvdec_session(file);
> =20
>  	v4l2_m2m_ctx_release(sess->m2m_ctx);

[Severity: High]
Can this result in a use-after-free if the user holds the file descriptor
open after the driver is unbound?

During driver unbind, vdec_remove() explicitly frees core->m2m_dev and
devres cleans up the amvdec_core structure.

If a user subsequently closes an open file descriptor, vdec_close()
calls v4l2_m2m_ctx_release(), which will dereference the freed m2m_dev
pointer inside v4l2_m2m_cancel_job().

Additionally, any pending jobs may trigger vdec_m2m_job_abort(), which
dereferences the freed sess->core and sess->core->m2m_dev.

> -	v4l2_m2m_release(sess->m2m_dev);
>  	v4l2_fh_del(&sess->fh, file);
>  	v4l2_fh_exit(&sess->fh);
> +	v4l2_ctrl_handler_free(&sess->ctrl_handler);
> =20
>  	mutex_destroy(&sess->lock);
>  	mutex_destroy(&sess->bufs_recycle_lock);
[ ... ]
> @@ -1104,6 +1106,7 @@ static void vdec_remove(struct platform_device *pde=
v)
> =20
>  	video_unregister_device(core->vdev_dec);
>  	v4l2_device_unregister(&core->v4l2_dev);
> +	v4l2_m2m_release(core->m2m_dev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D1

