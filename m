Return-Path: <linux-media+bounces-63994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EFn+GPSfI2olwAEAu9opvQ
	(envelope-from <linux-media+bounces-63994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 06:20:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BA64C5AA
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 06:20:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Nhc6Z4gN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63994-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63994-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C01A302688B
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 04:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD75274B23;
	Sat,  6 Jun 2026 04:19:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB6578F39
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 04:19:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780719597; cv=none; b=mF+wLVWKUUICDc/ht1n5BeWUqIwv1LgP5Ljnvp/1KvddgvZE67BF8QoCollRVL4g1i7BpEOj4bQ9KH8su6klhg4yiuswUHHNpYFbGtXp76/GJtEnJknCOQjyL7bRLFph5vspLjzDetz1a6wJuqwXGFj/CoS65fPBlva8PHv5lCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780719597; c=relaxed/simple;
	bh=Rui95FKPdRomTbE7X6+6Gu1WbbukY/Lo2vKQjlnn2ZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jd+TegJMDsY7xC3QLBwrzmvwutOiCoW5WBHfJhKu4rheX+5kN/5Lk3fJxluee1HM1pSZ5fsOQoUCG63VQPX1lShdGDOGHC3ZBTMG0biklh/UcSyloXTTTNVT0vSaYLn6WY0hyQhrV6l8BBYZRzPR18eRQPgslxhjOX+AEJdrKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nhc6Z4gN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898021F00893;
	Sat,  6 Jun 2026 04:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780719595;
	bh=tTz7DQ0Q4a0v0SJE52pjTGyKD2c1EfCUHY3qxuiRSV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nhc6Z4gNq9md86mIvzoLsIq0MtgsJ2omZvAydgfemkxsh8V4cOnsarfU3+jBgA0g8
	 jzEQl4Mauady4SMcGpcs+Ti8jT65yajMflbJn1YbmLLJH2Uv5zi/Tjar6fD7hlsdC1
	 vnfstRnMEDxnv6iBIk3NUTuyfDTSPIV4MQAVEZoiNmKkDINMbg1o5z5J6LNwVkrW9g
	 LLdOCJLEcs5iu7HUD38TEViqAemhUVMkFPcbbyFmw9tV1Nw1duWnFxRrso0gwSqJu4
	 5eeQzqkm7zQ9TplfBU7NhyaEfLH/pHqV9WpsLNzlhRBGc3eh64XRsnM6ZGwdsofeco
	 V1fi9lYqundKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: iris: check decoder format allocations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606040736.13-1-ruoyuw560@gmail.com>
References: <20260606040736.13-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 04:19:55 +0000
Message-Id: <20260606041955.898021F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63994-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C39BA64C5AA

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] When max_session_count is reached, iris_add_session() silently dro=
ps the new instance, but iris_open() successfully returns, creating an untr=
acked session.
--

commit 0059fb169f9cd49b702675622f4a0ad32fd2392e
Author: Ruoyu Wang <ruoyuw560@gmail.com>

media: iris: check decoder format allocations

This commit adds checks for v4l2_format allocations in iris_vdec_inst_init()
to prevent NULL pointer dereferences. It properly frees any partial
allocations and returns -ENOMEM to allow the open path to unwind.

> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media=
/platform/qcom/iris/iris_vdec.c
> index 99d544e2af4f9..dd18079a9ea5f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
[ ... ]
> @@ -23,6 +23,13 @@ int iris_vdec_inst_init(struct iris_inst *inst)
> =20
>  	inst->fmt_src =3D kzalloc_obj(*inst->fmt_src);
>  	inst->fmt_dst =3D kzalloc_obj(*inst->fmt_dst);
> +	if (!inst->fmt_src || !inst->fmt_dst) {
> +		kfree(inst->fmt_src);
> +		kfree(inst->fmt_dst);
> +		inst->fmt_src =3D NULL;
> +		inst->fmt_dst =3D NULL;
> +		return -ENOMEM;
> +	}
> =20
>  	inst->fw_min_count =3D MIN_BUFFERS;

While reviewing the unwinding logic in the open path, I noticed a separate
issue in drivers/media/platform/qcom/iris/iris_vidc.c:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_add_session() {
    ...
		count++;

	if (count < core->iris_platform_data->max_session_count)
		list_add_tail(&inst->list, &core->instances);
    ...
}

drivers/media/platform/qcom/iris/iris_vidc.c:iris_open() {
    ...
	iris_add_session(inst);

	inst->fh.m2m_ctx =3D inst->m2m_ctx;

	return 0;
}

[Severity: High]
This isn't a bug introduced by this patch, but does this logic allow
userspace to bypass the session limit and create an untracked session?

When the current session count reaches max_session_count, iris_add_session()
silently drops the new instance without returning an error. Since iris_open=
()
does not verify if the instance was successfully added to the core instances
list, it returns 0 and provides userspace with a valid file descriptor.

Could this cause problems during streaming when resource management functio=
ns
like iris_scale_power() and iris_check_core_mbps() iterate over the instanc=
es
list to calculate total bandwidth and clock requirements? Since the untrack=
ed
instance is missing from the list, its requirements are ignored, which might
leave the hardware under-clocked or starved of bandwidth, potentially leadi=
ng
to hardware timeouts or watchdog resets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606040736.13-1=
-ruoyuw560@gmail.com?part=3D1

