Return-Path: <linux-media+bounces-63303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJX2G6qvHWpfdAkAu9opvQ
	(envelope-from <linux-media+bounces-63303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:13:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD58622645
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B3733061694
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31443DC4D9;
	Mon,  1 Jun 2026 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3bY5xB7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40E3DB62B;
	Mon,  1 Jun 2026 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329563; cv=none; b=D2PfF8PzVJhWVZ8eC+PfCGF/1znavqTjFMAafUpCjkLngwNsuUJLpk8l7DhyhQOV4PK+A3qWj1PVlqkdRn1eH3/7U+7oev1MepG/2VgeczNMnEGAIGB+4DestiUUyrIwjS40956Y/Mlsz3u8fyTJsm7ETxSwGp589HTm2nqkGXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329563; c=relaxed/simple;
	bh=its+NUAFJlfI9jj9HeTz3x2xZwU5AlYMg6//UzEIgq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DewHCzdghyxGMmRkTgyt+31rmFlUrqirIM1/S9L+1x3l1jl8TGcZynb58rDEoHtjwj8FP3D/uJBG7t9UZLi16aS/JnKlRNYuu0Yr1UwvFteW5MG3cRGyVXGmKaVHgMOO5WhXWy4OMDUinEyQprzqie0/rESx91Jv6hN+ez8nFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3bY5xB7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9831F00893;
	Mon,  1 Jun 2026 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780329561;
	bh=+RAELjVRNHHYYcAlSvJKT8PWv0+nvS+P2HQHN/BppXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B3bY5xB7TCkQZnWQpBpEdVrYoeDYHRkoD4fy/g7Dh7q7RaActuVRHKtv1rqPmWzr4
	 0SOInacSF0hHYQZuiefqi6URHS6zP1rMLEO6OiLylEj33ZKAU3vIDy6b5uD5GlrG48
	 s/OfkX0m9pLyM8uhUvN0JOfsl0v5MqjzfI1/vyxoNdhsSZOywcgKr7HVTnb/kch5uG
	 WKjso0mHPo7KhMZobBDrtj+B0b3Ti8CYkUURUEgbEd/GYF0G092AwmOYHb+tV/gt9V
	 L9f2SiP6sFnMmffKq7wTCrZ2fp0EMrpDFewAmEpSXDKpyXOlH03oLcIEULWg1EB5Vh
	 EGXv+Xj2EB2gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/5] media: qcom: camss: Add Kaanapali compatible
 camss driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-kaanapali-camss-v14-2-e76f26aa6691@oss.qualcomm.com>
References: <20260601-kaanapali-camss-v14-2-e76f26aa6691@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:59:20 +0000
Message-Id: <20260601155921.2A9831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63303-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: 0BD58622645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional dereference of `camss->genpd` during error handling =
and driver unbind when the PM domain was not successfully attached.
- [High] devm_ managed lifetime of driver structures conflicts with V4L2 vi=
deo device file descriptor lifetime, causing a Use-After-Free on sysfs unbi=
nd.
--

commit d11af4da6f46342576374344948cc4914a3b8685
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: Add Kaanapali compatible camss driver
   =20
Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..40d74966ef9b6 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -5507,6 +5521,13 @@ static void camss_remove(struct platform_device *p=
dev)
>  	camss_genpd_cleanup(camss);

[Severity: High]
This isn't a bug introduced by this patch, but does this unconditionally
dereference camss->genpd during error handling and driver unbind when the p=
ower
domain was not successfully attached?

In camss_configure_pd(), if camss->genpd_num > 1 but camss->genpd_num <=3D
vfepd_num, it returns 0 early without attaching top power domains, leaving
camss->genpd as null:

drivers/media/platform/qcom/camss/camss.c:camss_configure_pd() {
    ...
	if (!(camss->genpd_num > vfepd_num))
		return 0;
    ...
}

Later, during cleanup in camss_genpd_cleanup(), the code skips cleanup only=
 if
camss->genpd_num =3D=3D 1:

drivers/media/platform/qcom/camss/camss.c:camss_genpd_cleanup() {
    ...
	if (camss->genpd_num =3D=3D 1)
		return;
    ...
	dev_pm_domain_detach(camss->genpd, true);
    ...
}

dev_pm_domain_detach() does not check for a null device pointer and immedia=
tely
dereferences dev->pm_domain, which can cause a panic on probe failure or dr=
iver
unbind for valid hardware configurations where genpd_num > 1.

[Severity: High]
This is a pre-existing issue, but does the devm_ managed lifetime of driver
structures conflict with the v4l2 video device file descriptor lifetime her=
e?

The driver allocates its core state using devm_kzalloc and devm_kcalloc:

drivers/media/platform/qcom/camss/camss.c:camss_probe() {
    ...
	camss =3D devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
    ...
	camss->vfe =3D devm_kcalloc(dev, camss->res->vfe_num,
				  sizeof(*camss->vfe), GFP_KERNEL);
    ...
}

When the driver is unbound via sysfs, camss_remove() executes and returns,
causing devres to immediately free all devm_ memory. However, if a user pro=
cess
holds an open file descriptor to the video node during unbind, the v4l2 core
retains a reference to the video_device.

When the user later closes the file descriptor, v4l2_release() calls
msm_video_release(), which accesses video->camss->ref_count within the alre=
ady
freed memory:

drivers/media/platform/qcom/camss/camss-video.c:msm_video_release() {
    ...
	if (atomic_dec_and_test(&video->camss->ref_count))
		camss_delete(video->camss);
    ...
}

Can this lead to a use-after-free?

>  }
> =20
> +static const struct camss_resources kaanapali_resources =3D {
> +	.version =3D CAMSS_KAANAPALI,
> +	.pd_name =3D "top",
> +	.icc_res =3D icc_res_kaanapali,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-kaanapali-=
camss-v14-0-e76f26aa6691@oss.qualcomm.com?part=3D2

