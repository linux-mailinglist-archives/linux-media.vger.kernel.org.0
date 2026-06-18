Return-Path: <linux-media+bounces-65226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w3REKbUZNGocOgYAu9opvQ
	(envelope-from <linux-media+bounces-65226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:15:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535F6A1895
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:15:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Ur9vRoW1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65226-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65226-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C84363040AAC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638AD1A6803;
	Thu, 18 Jun 2026 16:14:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E42C21D0;
	Thu, 18 Jun 2026 16:14:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799250; cv=none; b=glWFIkBRMLEN/byqSmqFUcdos7JOEb2ew0IfaVPAJeQ77R43FI9/mXvinbRHKdIVlEEe+K1uu7ToT3L3dqReB+o3d/e0Ksj0N+cAEBW7LfWP1rEN+/hFszjKPXQ0+RdJTOXoqz+1gQqj0OqsnSoTmAt5sHWhz/prXM21UQX2qL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799250; c=relaxed/simple;
	bh=G5C2atm8NEaJcNfJqmikPwpiYpWj9Qt8H7EAbkVRnCs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=j4i2w0sOjw3QM37Z1hcqPQq7sCijS4Kw8fFQXNg+xchedsOPIUluzhhPnEFGWJdhPdH5OkB08D7BySbQWFsZZuxi6KM2v5TxTlnvZfFLaGVTi+tCj/7wH4Qb15NP55EoVNB+Z9bPDSCrf95bDqBYLeul98LlU1z2nprk+1Rfiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ur9vRoW1; arc=none smtp.client-ip=213.167.242.64
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A56FC97F;
	Thu, 18 Jun 2026 18:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781799212;
	bh=G5C2atm8NEaJcNfJqmikPwpiYpWj9Qt8H7EAbkVRnCs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ur9vRoW1lVDbQ1wCGl5iXoVLTBqDPmkcADIn5PA6GFxNMvb2/q1WZpCuTmDijjRCM
	 my2NnMjLgu+YN+d2S6mLqwy0Xw6Zs6vtbdHY1r3D7KhNMs8Rsy9zjT5/KvWCj+5A1T
	 FJG4dadj8RmtJ4eDYPcyb9w0BC8UMPfkhuVEMugs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260618-ov08d10-fixes-v1-2-d090ce2abe8c@emfend.at>
References: <20260618-ov08d10-fixes-v1-0-d090ce2abe8c@emfend.at> <20260618-ov08d10-fixes-v1-2-d090ce2abe8c@emfend.at>
Subject: Re: [PATCH 2/2] media: i2c: ov08d10: respect 80 char line limit
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 18 Jun 2026 17:14:04 +0100
Message-ID: <178179924481.861173.1873111472180563193@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65226-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthias.fend@emfend.at,m:jimmy.su@intel.com,m:mchehab@kernel.org,m:p.zabel@pengutronix.de,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,emfend.at:email,ping.linuxembedded.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9535F6A1895

Quoting Matthias Fend (2026-06-18 10:31:13)
> Fix a violation of the preferred line limit of 80 characters.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  drivers/media/i2c/ov08d10.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index cb7e55b168781dfeaae553734d24208a374fce9c..da517eb2181b83ed2ad786bd5=
e197fe755a47ada 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
> @@ -1515,7 +1515,8 @@ static int ov08d10_probe(struct i2c_client *client)
>                 return ret;
>         }
> =20
> -       ov08d10->reset =3D devm_reset_control_get_optional_exclusive(ov08=
d10->dev, NULL);
> +       ov08d10->reset =3D devm_reset_control_get_optional_exclusive(ov08=
d10->dev,
> +                                                                  NULL);
>         if (IS_ERR(ov08d10->reset))
>                 return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset=
),
>                                      "failed to get reset\n");
>=20
> --=20
> 2.34.1
>

