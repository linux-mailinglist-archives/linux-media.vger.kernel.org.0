Return-Path: <linux-media+bounces-63577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kDDeDCYMIGoEvAAAu9opvQ
	(envelope-from <linux-media+bounces-63577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:12:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86190636E11
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:12:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aCq1gE4E;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63577-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63577-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33E8320AF21
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 11:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9474A46AED3;
	Wed,  3 Jun 2026 11:01:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D996D407592;
	Wed,  3 Jun 2026 11:01:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484485; cv=none; b=KTg+VC3UZHNvQZUcbC+okUNmIhrH1V+qPTvksk7vft8eQaU/dfa+wLEtYctd7R6olgCCkoNKkbGCdWEUGut9CTPkuPdAjrBhKkPW03b8x5PFCrKCFG2Js5McsZuGgTSZM6K6oRAyQyhqfZ6CouWsl9/vJV4v8yMG3KOojQSKsw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484485; c=relaxed/simple;
	bh=olXcyto2y0hNmKyhM1+hLEFVSuUEYUpRrGLf2iRrqPM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UDV0wvsvgH4ENoenKtTDPjsaIfJ7dV4wUKDWWek26ukDIrrUvG9jcudw7OBhQhzKeUZgs4Vy3sqDlLqSLY5ZrQ7fiGfET2A9LF/P5hWPQjwyEUb9HW/UUE1jL6dzBebkWEFC1AsO3oUn6Pt9vv6AP9zJBwZG+HErn3TaLHcRqNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCq1gE4E; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541FB1F00893;
	Wed,  3 Jun 2026 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780484483;
	bh=ipbvZ982F1A42hFuMQBnrDar5vsOoLmsPhsUvz2IYOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aCq1gE4Er85yZfO6rSdD5+Do1iQF2+ut2hdqU4NH3F30mT8ldMYYVRScq4WewwgTd
	 1I2iSfnmFxEAaWDXU6wk8euUUVMXFH4ZssRJEj4eY3UHpzvUyI0bvXRF9EZ5C/LiZi
	 xG+hVrxyhUoJym7183bMLjb/U/ADhX8GcKKJtiF5Q8v23VnJzjvR0i7De7VcZ2W2e2
	 C138K3x9H5L4Q/QGWbUm1bV3QDS+mTKA6Dt9DOGLOZw1lTzsvNnN/6R6XlAoy7D+WO
	 lfZp4p3zagwxgjhKQmTW8ItO5cG471juwoBAj/gLTXDPwhNNnM2n6wLvIkoUa+ZSQH
	 +Beyc/IJKaPcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/14] media: mediatek: vcodec: add driver to support
 vcp encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyrie Wu" <kyrie.wu@mediatek.com>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603084045.17488-4-kyrie.wu@mediatek.com>
References: <20260603084045.17488-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:01:22 +0000
Message-Id: <20260603110123.541FB1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email,smtp.kernel.org:mid];
	TAGGED_FROM(0.00)[bounces-63577-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86190636E11

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Untrusted coprocessor input `obj->id` is used directly as an a=
rray index without bounds checking, causing out-of-bounds memory access and=
 potential arbitrary code execution.
- [High] The kthread_run() task pointer is discarded, causing a memory leak=
 and a fatal use-after-free when the device is unbound.
- [High] The msg_signaled flag is not reset before waiting, allowing a stal=
e, delayed ACK to trigger a false positive for a subsequent IPC message.
- [High] The driver registers an IPC mailbox and a notifier but fails to un=
register them during device teardown, leading to a Use-After-Free.
- [High] The message processing thread exits permanently upon receiving an =
unhandled message ID, hanging the entire driver.
- [High] The driver fails to initialize the `ipi_desc` mutex for the CORE d=
ecoder, leading to lockdep warnings and potential crashes.
--

commit 7793240a286886003391171d60e17e6a2e3e89f8
Author: Yunfei Dong <yunfei.dong@mediatek.com>

media: mediatek: vcodec: add driver to support vcp encoder

Encoder also need to call vcp interface to communicate with vcp,
add driver to support encoder.

> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vcp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> @@ -226,8 +228,13 @@ static int mtk_vcodec_vcp_msg_ipi_send(struct mtk_vc=
odec_fw *fw, int id, void *b
>  	}
> =20
>  	mutex_lock(&vcp->ipi_mutex);
> -	feature_id =3D VDEC_FEATURE_ID;
> -	mailbox_id =3D IPI_OUT_VDEC_1;
> +	if (fw->fw_use =3D=3D ENCODER) {
> +		feature_id =3D VENC_FEATURE_ID;
> +		mailbox_id =3D IPI_OUT_VENC_0;
> +	} else {
> +		feature_id =3D VDEC_FEATURE_ID;
> +		mailbox_id =3D IPI_OUT_VDEC_1;
> +	}

[Severity: High]
This is a pre-existing issue, but does mtk_vcodec_vcp_msg_ipi_send()
properly handle stale delayed ACKs?

If wait_event_timeout() times out later in this function, it appears it sets
the msg_signaled flag to false and returns. However, if a delayed ACK arriv=
es
afterward, the worker thread will set the flag to true.

Since mtk_vcodec_vcp_msg_ipi_send() does not re-initialize the msg_signaled
flag to false before sending the next IPC message, could a subsequent wait
immediately return success without actually waiting for the new message to
be acknowledged?

[ ... ]

> @@ -383,6 +397,20 @@ static int mtk_vcodec_vcp_load_firmware(struct mtk_v=
codec_fw *fw)
>  	mutex_init(&fw->vcp->ipi_desc[ipi_id].lock);
>  	mutex_init(&fw->vcp->ipi_mutex);

[Severity: High]
This isn't a bug introduced by this patch, but are all the ipi_desc mutexes
properly initialized?

Here, mutex_init() is only called for a single ipi_id. If this path is taken
for the decoder, it initializes the lock for VCP_IPI_LAT_DECODER, but it om=
its
VCP_IPI_CORE_DECODER.

When the decoder client later registers its CORE handler,
mtk_vcodec_vcp_ipi_register() will attempt to acquire the lock. Could locki=
ng
the uninitialized CORE mutex lead to lockdep splats or undefined behavior?

> =20
> +	if (fw->fw_use =3D=3D ENCODER) {
> +		kthread_run(mtk_vcodec_vcp_msg_process_thread, fw, "vcp_enc_msq_thread=
");
> +

[Severity: High]
This is a pre-existing issue, but is it safe to discard the task pointer
returned by kthread_run()?

If the pointer is not saved, kthread_stop() cannot be called in
mtk_vcodec_vcp_release() during device teardown. Because the fw structure
is allocated with devm_kzalloc, the memory will be automatically freed when
the driver unbinds.

Could this cause a use-after-free when the unstopped thread wakes up
and accesses the freed fw->vcp structures?

[Severity: Critical]
This is a pre-existing issue, but does mtk_vcodec_vcp_msg_process_thread()
validate the obj->id from the coprocessor?

Looking at the thread function, it appears the ID from the IPC payload is
used directly as an array index:

handler =3D fw->vcp->ipi_desc[obj->id].handler;

If a compromised or malicious coprocessor sends an out-of-bounds ID, could
this read out-of-bounds function pointers and execute them when calling
handler(), leading to arbitrary kernel code execution?

[Severity: High]
This isn't a bug introduced by this patch, but how does
mtk_vcodec_vcp_msg_process_thread() handle invalid message IDs?

If the handler is null for a message, the function executes return -EINVAL;
instead of using continue; to process the next message.

Does this permanently terminate the kthread loop? If the thread exits,
wouldn't all subsequent valid IPC messages be queued but never processed,
permanently hanging active decode or encode instances?

[ ... ]

> @@ -438,8 +466,8 @@ static void mtk_vcodec_vcp_release(struct mtk_vcodec_=
fw *fw)
>  	if (!fw->vcp->is_register_done)
>  		return;
> =20
> -	feature_id =3D VDEC_FEATURE_ID;
> -	ret =3D vcp_device->ops->vcp_deregister_feature(vcp_device, VDEC_FEATUR=
E_ID);
> +	feature_id =3D fw->fw_use =3D=3D ENCODER ? VENC_FEATURE_ID : VDEC_FEATU=
RE_ID;
> +	ret =3D vcp_device->ops->vcp_deregister_feature(vcp_device, feature_id);
>  	if (ret < 0) {
>  		dev_err(dev, "deregister feature_id(%d) fail(%d)\n", feature_id, ret);
>  		return;

[Severity: High]
This is a pre-existing issue, but does this release function completely
tear down the IPC mailbox and notifier?

The driver registers an IPC mailbox via mtk_vcp_mbox_ipc_register() and a
notifier via vcp_register_notify() in mtk_vcodec_vcp_load_firmware().
However, these do not appear to be unregistered here during teardown.

Because fw->vcp is managed by devm_kzalloc, could this leave dangling
callbacks in the IPC or notifier frameworks that might trigger a
use-after-free if an event arrives after the device is unbound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603084045.1748=
8-1-kyrie.wu@mediatek.com?part=3D3

