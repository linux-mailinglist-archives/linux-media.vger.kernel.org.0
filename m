Return-Path: <linux-media+bounces-63397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ePvBkfmHmqSYwAAu9opvQ
	(envelope-from <linux-media+bounces-63397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 16:18:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0B62F3C5
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 16:18:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C4mDbPCX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63397-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63397-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E11E6301ABA2
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 14:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564E41CEAC2;
	Tue,  2 Jun 2026 14:11:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70DA28F948
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 14:11:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780409515; cv=none; b=Z9tVI2+3LlacYGhKryKcO+//aL0qhgwAFyZ6Ao5YokF70LcJCsDK6z2Jpt1G7lnIJA244VdL2InCZAkfvRGjhRUsoL9Tw6hRm0b2O3Z7udQEzjsW3f+fO3yOhu+WfXkx3zmF+ZdHPJjkf4yxcD5ZN8VW6R/xm3BnstfWOxX3nXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780409515; c=relaxed/simple;
	bh=Xw9XPPhJNUkUeaGsTegdCjB9DF8KsKx3oMdDSugj4Tk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mBIm1Qc8rdkcf2JwefRODnrZ0PATuCujQeilqkMyeUospE6U9tcXBcFScRxn+uiGvdewAn6sMHLqd93BK46XZQHoCXfhrzo76NHqoJcngzvUM4AmaXuiFdUUNoMMbFjir9n6uhk2Cx2mK7l5MAqEUPnuVLGxGvQSqEfQ2wB/Tgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4mDbPCX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8EA1F00893;
	Tue,  2 Jun 2026 14:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780409514;
	bh=Plyxi6+8lpUjVgiW7frrypbXuIlzlY91ahLAGvsl0KI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C4mDbPCX3+kU1r9Je+iJh6T5csGAYfc2h4soGES0EvmA/Yju07LqQvPmXw1UOFEna
	 cYuem0h+28fgNyd4BAcMca66qcSOX6GQLu75vuIasZnV+T0JFuC1JnbshCSrnonXfl
	 tVX0N1vOPOjJ7aJnv1zFkbYG3VfqasXpIXmaczQ+kpGk5HCkm13L4ncjXvCnp4NZOI
	 VN/SLPrZHBlX7X56/27eG7cP68XXLMFkS/pQOURBC8t3d6CIxwp56WxeXPOWcY5XQF
	 /JbN0ck6IurjJXYqTXQsDEGTHLIqDI1kb7v1rykNGH1Q6HJQAzTaAMPjIhGSPx3Qvm
	 Sbehp6Toi9IXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: iris: Enumerate cap->bus_info to differentiate
 between encoder and decoder
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-iris-simple-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org>
References: <20260602-iris-simple-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 14:11:53 +0000
Message-Id: <20260602141154.4C8EA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	TO_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63397-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69E0B62F3C5

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Device exposed to userspace before driver private data is set, all=
owing a NULL pointer dereference on early open().
--

commit 38c83fed8cc4920a7e1d89a05adbe1baf1e9184b
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: iris: Enumerate cap->bus_info to differentiate between encoder and d=
ecoder

This commit updates the capabilities structure to include unique bus_info
strings, differentiating between the Iris encoder and decoder. This provides
namespace parity and clear output when userspace tools like v4l2-ctrl list
devices.

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 807c9a20b6ba1..3105583cbdd1d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -451,14 +451,21 @@ static int iris_enum_frameintervals(struct file *fi=
lp, void *fh,
> =20
>  static int iris_querycap(struct file *filp, void *fh, struct v4l2_capabi=
lity *cap)
>  {
> +	struct iris_core *core =3D video_drvdata(filp);

[Severity: High]
This is a pre-existing issue, but this code brings attention to a race
condition in the device initialization where video_drvdata() can return a
null pointer.

In iris_register_video_device(), video_register_device() is called before
video_set_drvdata():

drivers/media/platform/qcom/iris/iris_probe.c:iris_register_video_device() {
	...
	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
	if (ret)
		goto err_vdev_release;

	video_set_drvdata(vdev, core);
	...
}

Calling video_register_device() immediately makes the v4l2 device node
accessible to userspace.

If a userspace process races to open the device node before
video_set_drvdata() executes, iris_open() will be invoked and
video_drvdata(filp) will return a null pointer.

This null pointer is then dereferenced in
pm_runtime_resume_and_get(core->dev), resulting in a kernel panic.

Should the driver data be set before registering the video device to prevent
userspace from triggering this?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-iris-simpl=
e-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org?part=3D1

