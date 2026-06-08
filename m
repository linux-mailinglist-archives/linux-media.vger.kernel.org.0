Return-Path: <linux-media+bounces-64154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BxPFNE99JmpXXQIAu9opvQ
	(envelope-from <linux-media+bounces-64154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:29:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B56540B8
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 10:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Wfph9DHB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64154-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64154-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6665C300C000
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 08:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F79E3AFCF3;
	Mon,  8 Jun 2026 08:28:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9A3947AE
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:28:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907296; cv=none; b=USk23tLY/A6iBNcir2AxUHgtoNjyVGzbf6Itdh3Z9MHXL7HVYFuTQUNLnb1rXCeTY0t42cucbjJHcs4KA4mtGh/5XetWjuJmk9UcLi0rZMmhxuHdoUrXyq8YckKKN7W64uK/FOX+eBrWvEcT3Wsj0y4D8gJbp+JbfEMZmna2ZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907296; c=relaxed/simple;
	bh=FDjSmOq2fFI131aYmLiYmRSg3rFaBE8/C9KclaLDDPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KZT7TzQgM+9FWXofdZMmsYL0UPGMeBTjxrH+inENwP8UqyjJur9DqB51SS35HkxK6RKolkaC0r7E/2ll8Cr5g0u4fMd65TyuUc4ZQ231NxWqLxaxnB4VXZFOjFTQUBalpw2dZwTsJKo/PFSnaKti/f5C69R8k2O2JJwACWsfY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfph9DHB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1481F00893;
	Mon,  8 Jun 2026 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780907292;
	bh=7AYepqIyFkF8j2htW+f7Omw4SIS8d4WQIVkFQpG3S/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wfph9DHB0LfOGfbTj6X8rMFPeycN/mr9oBeDA27o2jmHSPec/pgka/rQBAsDr56el
	 J6QxBT/ySBCBGUq391RsHtR+d4oaC78rxqmeMwuGA4KHks2QAXEmtZZoMNVbPVxQDt
	 1Nn1atthVPCsFmaWoSataryxwG9FspD7Eq3Eu5Z6HOkha7lA4kvsCLmCbzzoRZd1LQ
	 FfNbMZIQYDqtOzFzVp2OM9YJZmTR1DfMbp6l90BG+jMjrh4OLyZh6Jm1ZWweJ2tmkz
	 reu7U0woM9KX6NY5x4nj7Mjn99K9/biMah8WDB543cK3S9+v+vit9N6pfMnNdHutTI
	 gBd5MRwoTbNJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] media: qcom: iris: fix runtime PM reference
 leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260608081721.82846-2-dennylin0707@gmail.com>
References: <20260608081721.82846-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 08:28:11 +0000
Message-Id: <20260608082811.ED1481F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-64154-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 669B56540B8

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] `iris_disable_power_domains()` incorrectly propagates `1` on succes=
s when the device is already suspended.
--

commit 7b8fb44887231870efc4a92ebbb558afa99135b1
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: fix runtime PM reference leaks

This commit uses pm_runtime_resume_and_get() in iris_enable_power_domains()
to prevent reference leaks on failure. It also updates
iris_disable_power_domains() to always call pm_runtime_put_sync() and captu=
re
its result.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c

[ ... ]

>  int iris_disable_power_domains(struct iris_core *core, struct device *pd=
_dev)
>  {
>  	int ret;
> +	int pm_ret;
> =20
>  	ret =3D iris_opp_set_rate(core->dev, 0);
> -	if (ret)
> -		return ret;
> =20
> -	pm_runtime_put_sync(pd_dev);
> +	pm_ret =3D pm_runtime_put_sync(pd_dev);
> +	if (!ret)
> +		ret =3D pm_ret;
> =20
> -	return 0;
> +	return ret;
>  }

[Severity: Low]
Is it intentional to propagate a positive return value here?

According to the runtime PM API, pm_runtime_put_sync() returns 1 as a succe=
ss
case when the device usage count drops to zero but it is already in the
RPM_SUSPENDED state.

By capturing and returning this value directly from
iris_disable_power_domains(), the function will return 1 instead of 0 on a
successful suspend. While current callers may ignore the return value, futu=
re
callers checking if (ret) could incorrectly treat this normal success case =
as
a failure.

Would it be safer to normalize positive return values to 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608081721.8284=
6-1-dennylin0707@gmail.com?part=3D1

