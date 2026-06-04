Return-Path: <linux-media+bounces-63702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4GuEHrnEIGrz7gAAu9opvQ
	(envelope-from <linux-media+bounces-63702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:20:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C623163C08B
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:20:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D48WWxDG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63702-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63702-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F0EB304C069
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33824502F;
	Thu,  4 Jun 2026 00:13:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873AD846A
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:13:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780531991; cv=none; b=Rgtvbuc4bmR5YTzCMwlRGKjphBad+Y8+P2oGwMxDdYsu0VKiKe0yS1uZYhVb8yv65q5j+3t6HIouKCNHNOM//64fGBg3+H79LocGmJFE45xfCSkAjT7Sf+rxELLXw7TB5QXyecmHZx95IlnmVU4/GDtEZ4m9Y8YQ56TeZHVaguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780531991; c=relaxed/simple;
	bh=oM+a4rj6gw0aYfhb68eTY+v4X8wj5BvSCLQK/0x4Zuk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jQdWyanBhy9T+UK9RrA3bIPRZo5abPQAE/wo2EABRu33etxfH+7bUZOWCkXH6W4GLhpBQBYu0/4Y0P3rHNhNKYl7NV+qm5zzZhGwxlr1KuAEdKf+6mPRJjckwP0PciGgD0vzNoXyHyzs/pWlE6vhqIopKxUyQP3HsrY0jY4Bkzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D48WWxDG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0252C1F00893;
	Thu,  4 Jun 2026 00:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780531990;
	bh=/jYSKdQ5nEd6T6jFgjwbJJHI0UmAFrlAE5r/EN5gRM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D48WWxDG5snQH1mg5wotg/yrlSypPtwMXzvRN08iTL6kjTfwl71f6yHvdiTKNB8c6
	 TH6JJ9CiGB9pSMIKJWhOxNTqJynVuiKm+pHW2argbkxkeChZhXXVRfTitftpk1YHnR
	 ArfevnRjXevcYa+Igun0dhIl83sDSCn/7Li15Ref28wu+VQP15t30f2oYI+daklXzN
	 NmMkskXknl/EGkUsEWiVDXqeuspIlcfDWEg3V60/CMpHUs6PU50RxAvonaP5ZYsvUn
	 7QAePfkwLiLPz0g8E4GO5K75/3ssjAc8DWdFUBB+g5puO4rX6HElE3TOW4tUMY1TQi
	 huvCsLHCqoJ1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: qcom: iris: initialize managed OPP pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604000414.32530-1-dennylin0707@gmail.com>
References: <20260604000414.32530-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 00:13:09 +0000
Message-Id: <20260604001310.0252C1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63702-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C623163C08B

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The function `iris_enable_power_domains` leaks a runtime PM usage =
counter if `pm_runtime_get_sync` fails.
- [High] The function `iris_disable_power_domains` fails to release the run=
time PM reference if `iris_opp_set_rate` fails.
--

commit 52842abee5a5e7d3e9ab2afbbc3eabb0f32fde2e
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: initialize managed OPP pointer

Initialize the __free(put_opp) managed OPP pointer to NULL to ensure the
cleanup handler always sees a defined value.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..6b22f5cc88ca8 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -61,7 +61,7 @@ int iris_unset_icc_bw(struct iris_core *core)
> =20
>  int iris_opp_set_rate(struct device *dev, unsigned long freq)
>  {
> -	struct dev_pm_opp *opp __free(put_opp);
> +	struct dev_pm_opp *opp __free(put_opp) =3D NULL;
> =20
>  	opp =3D devfreq_recommended_opp(dev, &freq, 0);
>  	if (IS_ERR(opp))

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file, I
noticed a pre-existing issue in iris_enable_power_domains():

drivers/media/platform/qcom/iris/iris_resources.c:iris_enable_power_domains=
() {
	...
	ret =3D pm_runtime_get_sync(pd_dev);
	if (ret < 0)
		return ret;
	...
}

Is the runtime PM usage counter leaked here? pm_runtime_get_sync() incremen=
ts
the counter even on failure. Should this use pm_runtime_resume_and_get()
instead, or call pm_runtime_put_noidle() on the error path?

[Severity: High]
This is also a pre-existing issue, but I noticed a similar concern in
iris_disable_power_domains() in the same file:

drivers/media/platform/qcom/iris/iris_resources.c:iris_disable_power_domain=
s() {
	...
	ret =3D iris_opp_set_rate(core->dev, 0);
	if (ret)
		return ret;

	pm_runtime_put_sync(pd_dev);
	...
}

Could returning early permanently leak the runtime PM reference if
iris_opp_set_rate() fails? Should pm_runtime_put_sync() still be called dur=
ing
teardown even if setting the rate returns an error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604000414.3253=
0-1-dennylin0707@gmail.com?part=3D1

