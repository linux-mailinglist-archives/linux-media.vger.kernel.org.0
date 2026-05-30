Return-Path: <linux-media+bounces-63085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cByyOVk0Gmp+2AgAu9opvQ
	(envelope-from <linux-media+bounces-63085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:50:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8E60A6AB
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 272CA30D0F0A
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14C52D73B5;
	Sat, 30 May 2026 00:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0pc5/Xg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FDA1D54FA;
	Sat, 30 May 2026 00:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101999; cv=none; b=YQhq8+LSSH+Eb7/fm8Vjkks84pbEgDKSspv+p4jpa6M5nG85s/mg+vtEFNBAtEnDyZbapG3fcwfh8QJ2m4KOvcCu3kpJPJHSfXMglVd6ATspmIi+XL6lg+EbkC5Pc43a19JcWRbJen0kkfZH4GCWmN0CmVgBvC0nIprL7VXc0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101999; c=relaxed/simple;
	bh=7lqFnFjQvdDTgpyUY1NolFpvZQRHLDdHcmsgMfBwFas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OQzgvkXEeTZAYHo2TLmVgLSW4vFSK4m1dVw/Bj9WJn6QO8L0DrSpDgIs5Jn5hyM9WdAKG90h9NUTWEnnhY3VPdqf/5C1+Wv9O6DM2AVsLhJSCnZeT3tnlDTbC+MA1lztgryHyDL2HNEg9dNbnthHPnoZF5NhFZyaFV0hX6qeOwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0pc5/Xg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C56D1F00899;
	Sat, 30 May 2026 00:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101997;
	bh=XkjEolf/FRhOYNgQhhq72CoQUrPQbazZ8GHz962AcT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R0pc5/XgSdybDTzg2CZ7KJNzgmtvILXKrfXofVa2dtMi/wmSmovKgRjsOh35FJjcL
	 c+yLHo4dHILXzdZaAHoF9M3MvcB4Uog9afR1wdOBChjoKxLfkerHkmbIbZ8lXjxfkv
	 I05oxI+Zhq8M5Azcq2hwFjYVvNe8Vi+wfgEgBm6Z8FyIt3fF+xnLqO0raY5KYUQrVX
	 PsiNw63b8a4fFFWt/lajulX8Si7pG3wmJpgFpd2uKsOt4PL018ZeGeXrgNd8+cUIQ3
	 MrfHtIAyvtZIw4nJFGdu4NanKq/hsHb5ehI/8O/sOxanlFd0asrEIzB1jsqQX7A6gq
	 oU2A/hXSGL+qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522115936.201208-4-sumit.garg@kernel.org>
References: <20260522115936.201208-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:37 +0000
Message-Id: <20260530004637.8C56D1F00899@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,qualcomm.com:email];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63085-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 94A8E60A6AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The metadata release function removes the safety check for `ctx->p=
tr`, leading to a regression (NULL pointer dereference or kernel WARN) in e=
rror paths of legacy clients.
- [High] The global `ops_ptr` in the generic PAS service is accessed withou=
t locking or RCU, causing a race condition and TOCTOU vulnerability.

Pre-existing issues:
- [High] The resource table size returned by TrustZone is trusted without v=
alidating it against the allocated buffer size, leading to an out-of-bounds=
 read of kernel memory.
--

commit f83d1b236620417cf15f3c965e134b36b0bf8395
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

firmware: qcom_scm: Migrate to generic PAS service
   =20
This patch adds SCM calls as a backend for the generic PAS service to keep
supporting legacy QTEE interfaces. The exported qcom_scm wrappers are retai=
ned
but will get dropped once all the client drivers get migrated as part of fu=
ture
patches.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 9b06a69d3a6d7..d87a962e93da1 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
[ ... ]
> @@ -671,36 +671,35 @@ int qcom_scm_pas_init_image(u32 pas_id, const void =
*metadata, size_t size,
> =20
>  	return ret ? : res.result[0];
>  }
> -EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> =20
> -/**
> - * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	pas context
> - */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t siz=
e,
> +			    struct qcom_scm_pas_context *ctx)
>  {
> -	if (!ctx->ptr)
> -		return;
> +	return __qcom_scm_pas_init_image2(__scm->dev, pas_id, metadata, size,
> +					  (struct qcom_pas_context *)ctx);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> =20
> +static void __qcom_scm_pas_metadata_release(struct device *dev,
> +					    struct qcom_pas_context *ctx)
> +{

[Severity: High]
Does this removal of the !ctx->ptr safety check cause a regression? In
legacy clients like qcom_q6v5_pas, this function might be unconditionally
called during unprepare or error paths where init_image failed and ctx->ptr
is NULL. This can result in qcom_tzmem_free() warning on a NULL pointer or
dma_free_coherent() crashing. Note that this appears to be fixed later in t=
he
series when clients migrate to the new qcom_pas_metadata_release which
restores the check, but it poses an issue for this intermediate commit.

>  	if (ctx->use_tzmem)
>  		qcom_tzmem_free(ctx->ptr);
>  	else
> -		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> +		dma_free_coherent(dev, ctx->size, ctx->ptr, ctx->phys);
> =20
>  	ctx->ptr =3D NULL;
>  }
[ ... ]
> @@ -909,11 +828,12 @@ struct resource_table *qcom_scm_pas_get_rsc_table(s=
truct qcom_scm_pas_context *c
> =20
>  	memcpy(input_rt_tzm, input_rt, input_rt_size);
> =20
> -	output_rt_tzm =3D __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tz=
m,
> +	output_rt_tzm =3D __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
>  						     input_rt_tzm,
>  						     input_rt_size, &size);

[Severity: High]
This is a pre-existing issue, but does this function trust the resource tab=
le
size returned by TrustZone without validating it against the allocated buff=
er
size?

If TrustZone returns success and specifies a size larger than the initial
16KB allocation (but smaller than 1GB), the size variable is updated to this
larger size. Later in this function, kmemdup() is called with this updated
size, which would read past the end of the 16KB buffer allocated by
qcom_tzmem_alloc(). Can this leak adjacent kernel heap data into the return=
ed
resource table?

>  	if (PTR_ERR(output_rt_tzm) =3D=3D -EOVERFLOW)
>  		/* Try again with the size requested by the TZ */
> -		output_rt_tzm =3D __qcom_scm_pas_get_rsc_table(ctx->pas_id,
> +		output_rt_tzm =3D __qcom_scm_pas_get_rsc_table(dev, ctx->pas_id,
>  							     input_rt_tzm,
>  							     input_rt_size,
>  							     &size);
[ ... ]
> @@ -2836,6 +2803,11 @@ static int qcom_scm_probe(struct platform_device *=
pdev)
> =20
>  	__get_convention();
> =20
> +	if (qcom_scm_is_pas_available()) {
> +		qcom_pas_ops_scm.dev =3D scm->dev;
> +		qcom_pas_ops_register(&qcom_pas_ops_scm);
> +	}
> +

[Severity: High]
Is there a race condition when accessing the global ops_ptr in the generic
PAS service?

Functions like qcom_pas_shutdown() check if (!ops_ptr) and then dereference
ops_ptr->shutdown. Since ops_ptr can be modified concurrently (for instance,
if the PAS TEE service is unbound via sysfs calling
qcom_pas_ops_unregister()), could a compiler reload or concurrent execution
lead to a NULL pointer dereference or use-after-free of the backend provider
data? There appears to be no module referencing or locking to prevent the P=
AS
provider from unbinding while in use.

>  	/*
>  	 * If "download mode" is requested, from this point on warmboot
>  	 * will cause the boot stages to enter download mode, unless

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D3

