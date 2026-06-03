Return-Path: <linux-media+bounces-63513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +zvwFt3TH2ocqgAAu9opvQ
	(envelope-from <linux-media+bounces-63513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:12:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6AF635094
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:12:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nxxtZIqC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63513-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63513-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2CAD3081AA1
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5D52D0625;
	Wed,  3 Jun 2026 07:11:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FE538F255
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:11:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470684; cv=none; b=Uy3fXBMJUWvGxMRSnSoE7IFkyxBeRKyjPKa9Gj9w5ApcQyxRfkuEOVeo9d9hmyp6U5cLEzEdMUlrP639beeEoo2tIu6nsfmRZkpQ46wXq1odUq25kwu/s538pUFQKpkZ0X1ODRMtRpbIhPn3pjdmfTRB/eDgVq+dhP6MOxqlOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470684; c=relaxed/simple;
	bh=OV5qDvVfU2/LY3Am8k8wYE6GK3OEXD1oOjlxQfUNGNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CoaCP2aEfLLrx1RiC0+e6Ax2NlmBgP5PD+2HrHTS+D+Z9naZxfj9zD6tGtVTvBZ2buA64y0XpdZo9ALzu/r4qnb25nAggJqhDuoE1LGPCA+e0YuvxdGaG3fhH+XD63caiQtrm4RnD5Pjwxuvf38oThRvnKkKpU9f7Rm2hZ7xal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxxtZIqC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0B31F00893;
	Wed,  3 Jun 2026 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470683;
	bh=9pEa3rcGuCXrY1yEBeEN1eEjPIOVIvssuTx6AeNnVu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxxtZIqCxns4Dj4g0aPh4Lj7ZpBav4JfX/l3veLL4XgMQV7g88boEwjoZKmoTTQJJ
	 4j/FaCID09V8LkXEJ5iv54iqoIX46hau3W4t1h4NMfS5h4V8R0n29Dn6T8QLqYQtcU
	 DwPPidkmztdbhvLEwTq3NdwBYohOJpDLARVLD6al62E1Pz7JbfH36NtN7ghBqwXoOe
	 u9FjMRW4+9awbzvz0sg/4OJG0R4FtcTXabLSo1eSgOIiiL+MQnaSAEMqvMbut3pFg9
	 RxqyjDz/Jc2BzUo43xkkk50HUKGvFrPCfDiW3P75YlBLCfA4Eq7+ViqH3KUZIlual2
	 QuwTDGew/Sk3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/12] media: microchip-isc: configure DPC and
 pipeline for SAMA7G5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-7-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-7-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:11:22 +0000
Message-Id: <20260603071122.EB0B31F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63513-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD6AF635094

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Green Disparity Correction (DPC_GDCENABLE) is omitted for YUV an=
d GREY output formats.
--

commit 4ad55e55f4026d00b689214d6dbbe7f59a62bf02
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>

media: microchip-isc: configure DPC and pipeline for SAMA7G5

Enable DPC black level and green disparity correction for raw Bayer
to RGB conversion. Bypass the pipeline for raw Bayer output so
software ISPs (libcamera) receive unmodified sensor data.

> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driv=
ers/media/platform/microchip/microchip-isc-base.c
> index f61a5d5a3e045..ff920019fe371 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -800,7 +800,7 @@ static int isc_try_configure_pipeline(struct isc_devi=
ce *isc)
>  		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
>  			isc->try_config.bits_pipeline =3D CFA_ENABLE |
>  				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
> -				CC_ENABLE;
> +				DPC_GDCENABLE | CC_ENABLE;
>  		} else {
>  			isc->try_config.bits_pipeline =3D 0x0;
>  		}

[ ... ]

> @@ -810,7 +810,7 @@ static int isc_try_configure_pipeline(struct isc_devi=
ce *isc)
>  		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
>  			isc->try_config.bits_pipeline =3D CFA_ENABLE |
>  				CSC_ENABLE | GAM_ENABLES | WB_ENABLE |
> -				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE |
> +				SUB420_ENABLE | SUB422_ENABLE | CBHS_ENABLE |
>  				DPC_BLCENABLE;

[Severity: Medium]
Should DPC_GDCENABLE also be included here and for the other YUV and GREY
formats in this switch statement?

Since these formats also originate from raw Bayer data and pass through the=
 CFA
(Color Filter Array) block, would they also require the same pre-demosaicing
green disparity correction that was added for the RGB formats above?

>  		} else {
>  			isc->try_config.bits_pipeline =3D 0x0;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D7

