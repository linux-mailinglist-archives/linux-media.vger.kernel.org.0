Return-Path: <linux-media+bounces-63305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPnwEJStHWondAkAu9opvQ
	(envelope-from <linux-media+bounces-63305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:04:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D865E6223E8
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C5083028442
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 16:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6766C2C08BC;
	Mon,  1 Jun 2026 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="lVEe8QP3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741C283CAF;
	Mon,  1 Jun 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329816; cv=none; b=PlisiIljhfTz1audn9hYIfkfn9+38ESoOtqLMQ9kG2VjreOQklDODTl8UN9OW3HtvBpEfuKjgsb5xRi65dIXp72NMJpRT7X8XpE/e0AszelAqxdu7MoJzDRcc/LTDr4Y24ZeH0mfb5xmx0Y2L/3nuCNGcSUEksdlRcTRUiws4eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329816; c=relaxed/simple;
	bh=V2nYDIRPNRRTtoYLxNUWb9sIjegebnUgkpQVio1AAK4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJba7xrAVCUeH/ffKNA13QkvVoGco6sJNSvCSOXlBhoIkV5Swi0nK61RqjEGtPfSeQ+mj8KBbhPxBLMNbpZsOiuWhVEQVTzENBzHjVPkHh7+Za4np+7y60hwu8xoAKI8M1/9j9+07vYKlYp1P+2J5u0Ghx+xsx8Dop34mcNcFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=lVEe8QP3; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1780329812; x=1780589012;
	bh=ECwdWIMtBp2bRZvy6YQqTnqwYQIBkXirFFJtgoT8D6A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lVEe8QP3A5jBqqrhnqzauUJ9OZKa+l9jOsQ761iwnAgk3rkeN0bkCXdRttz9NzSpy
	 w8P9Km8o7qHTuIrZuTM8dq2UCmE4GkwhjpVFEYbAAAqO42PTGkLvHw/FcJdTTYxY0t
	 41sc1kP+nPP2aDKLhPge2EfFbH118W9orWiroXxveQbzbn+7zHfqeOcsWIWw3+dpYU
	 3tKO3tJRRLHWc428mGCqQtZoJhnT4hc9dTbOZ/kL7RLSeePy+AOxzVIgUhOY9CMVz+
	 Vdx7cuTdLaVkW3IVL9QV5kxNpsdfYwPPNOAerjefiqF9lLYFyVZDYYQsaGOl5x2FBz
	 XdbBe9M6g1phw==
Date: Mon, 01 Jun 2026 16:03:26 +0000
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH WIP v5 6/9] media: qcom: camss: csiphy-3ph: Update Gen2 v1.1 MIPI CSI-2 C-PHY init
Message-ID: <eff110a1-4161-4190-a0b2-7a1139a85d52@nxsw.ie>
In-Reply-To: <20260531-qcom-cphy-v5-6-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz> <20260531-qcom-cphy-v5-6-6be0f62b4d65@ixit.cz>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 86f8631189407588c0bdf2f30dec009c756e776a
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxsw.ie,quarantine];
	R_DKIM_ALLOW(-0.20)[nxsw.ie:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63305-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod.linux@nxsw.ie,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxsw.ie:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ixit.cz:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxsw.ie:mid,nxsw.ie:dkim]
X-Rspamd-Queue-Id: D865E6223E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/05/2026 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>=20
> These values should improve C-PHY behaviour. Should match most recent
> Qualcomm code.
>=20
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++--=
-------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index d837fcf7cd2f0..9a0f009c033bb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -220,19 +220,19 @@ csiphy_lane_regs lane_regs_sdm845[] =3D {
>   =09{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>=20
>   /* GEN2 1.0 3PH */
>   /* 3 entries: 3 lanes (C-PHY) */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845_3ph[] =3D {
> -=09{0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -=09{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -=09{0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   =09{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>   =09{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x011c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -240,19 +240,19 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] =3D {
>   =09{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x012c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x01cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>=20
> -=09{0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -=09{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -=09{0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   =09{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>   =09{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x031c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -260,19 +260,19 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] =3D {
>   =09{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x032c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x03cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>=20
> -=09{0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -=09{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -=09{0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +=09{0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   =09{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>   =09{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x051c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>   =09{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
>=20
> --
> 2.53.0
>=20
>=20
>=20

Squash this down !

---
bod


