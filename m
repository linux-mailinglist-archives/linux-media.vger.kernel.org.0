Return-Path: <linux-media+bounces-63093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEj6OtUzGmp+2AgAu9opvQ
	(envelope-from <linux-media+bounces-63093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:48:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFED960A565
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC8383050834
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D64B1D6BB;
	Sat, 30 May 2026 00:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVM2X+re"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B4028030E;
	Sat, 30 May 2026 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102004; cv=none; b=CM2tBEAkx9NHKkAzq/Wax+WkVkl2j6zqaNqFj8zapiABg/9xt24wEAZWDizwIu0mMGr6gbhzfRJyoZJd7iTHWS/6nH4BUnLYwC+hCG2LAHx4ihh7kOaJ+v3D/D71nVmaPja1RN/hsSXFCrEk4NBjn6o/wILjsHz1nwxMBrnDanM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102004; c=relaxed/simple;
	bh=MHAy218KYY1xFeDAmZlKSwTkhMBB5mDfi4pTdswegNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UuMRbU0DoJtsjbHiJkpVpVKjNXAf2B9WmMcQfv0YrXcd27VbDpLW1C4QvyCdGV72pvaBJdv4w6+qvYyaLqxtCJBWTXyd9KmkJS0V28rk9H3BOJ0ipubo5TQd3/0DT90JIJZwzhne/A/+UkfiLAcPL9+DAmIWSxl9vtvnP/PlkDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVM2X+re; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C2C1F0089A;
	Sat, 30 May 2026 00:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102003;
	bh=nwicYLBNPh4MWCeI+778P0LRGON9onK+Elzl01L335M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVM2X+redFA5m1KOXNB4Z4ZU0YbHAK9mQs39ah6XeXB5KX7W9WiD7IYzO0L4+zalg
	 WL59mNOvKKbLCDZh8Z0i41wHloymfJ4Z4/qt4OJExBWpU0Tjo9BmPrEPDTetaGvu6X
	 dWdrYGVAAs6kaFg+z65RHPNdHu0kiW7qUhtHPRdmCUquk1ItzlX9Wndku7wAIphaer
	 1HAXCRItm3QBaKXp29y8Qt/jzO1EEkQYJfsclK6gmJsMAioEkthaAwZtio0SCxIPTh
	 webSsWTiUyjX9+4EpM/FCdZdRfU9WJ40Z265GqXHrMzSuT6muhoDq/+cZmoegJIS+g
	 HZku0d7gzZLiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/15] wifi: ath12k: Switch to generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: linux-media@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522115936.201208-14-sumit.garg@kernel.org>
References: <20260522115936.201208-14-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:42 +0000
Message-Id: <20260530004643.22C2C1F0089A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,smtp.kernel.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:replyto,sashiko.dev:url];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63093-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: AFED960A565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unsynchronized access and Time-of-Check to Time-of-Use (TOCTOU) ra=
ce condition in the generic `qcom_pas` API.

Pre-existing issues:
- [High] Missing PAS shutdown and state cleanup on error and timeout paths =
in firmware power-up and power-down routines.
- [High] Repeated calls to devm_memremap() in ath12k_ahb_power_up() cause m=
emory leaks across restart cycles.
--

commit 21630c84c6a019ca458500ab79888e7e4014edc8
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

wifi: ath12k: Switch to generic PAS TZ APIs

Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
service allows to support multiple TZ implementation backends like QTEE
based SCM PAS service, OP-TEE based PAS service and any further future TZ
backend service.

> diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless=
/ath/ath12k/ahb.c
> index 2dcf0a52e4c15..dff7fa7027c53 100644
> --- a/drivers/net/wireless/ath/ath12k/ahb.c
> +++ b/drivers/net/wireless/ath/ath12k/ahb.c
[ ... ]
> @@ -420,7 +420,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
> =20
>  	if (ab_ahb->scm_auth_enabled) {
>  		/* Authenticate FW image using peripheral ID */
> -		ret =3D qcom_scm_pas_auth_and_reset(pasid);
> +		ret =3D qcom_pas_auth_and_reset(pasid);

[Severity: High]
This is a pre-existing issue, but does this function leak devres
structures and virtual address space on device restarts?=20

The devm_memremap() function is called earlier in ath12k_ahb_power_up()
without a corresponding cleanup in ath12k_ahb_power_down(). Since
power_up/power_down can be called multiple times during driver recovery
(e.g., via ath12k_core_restart()), each power_up adds a new managed
resource, exhausting memory over time.

[Severity: High]
This is a pre-existing issue, but does this leave the PAS backend in an
inconsistent state if subsequent steps fail?

If qcom_pas_auth_and_reset() succeeds, but a later step like=20
qcom_smem_state_update_bits() fails, the code jumps to err_fw2 without
calling qcom_pas_shutdown(). This leaves the peripheral running while
the host gives up, leading to resource leaks.

[Severity: High]
Does switching to the generic PAS API introduce a Time-of-Check to
Time-of-Use (TOCTOU) race condition?

The generic qcom_pas_auth_and_reset() API checks ops_ptr and
dereferences it without locks, RCU, or module references:

drivers/firmware/qcom/qcom_pas.c:qcom_pas_auth_and_reset() {
	if (!ops_ptr)
		return -ENODEV;

	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
}

If the backend module is unloaded concurrently, setting ops_ptr to NULL
after the check but before the dereference, could this cause a
Use-After-Free or NULL pointer dereference?

>  		if (ret) {
>  			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
>  			goto err_fw2;
[ ... ]
> @@ -485,10 +485,10 @@ static void ath12k_ahb_power_down(struct ath12k_bas=
e *ab, bool is_suspend)
>  		pasid =3D (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>  			 ATH12K_AHB_UPD_SWID;
>  		/* Release the firmware */
> -		ret =3D qcom_scm_pas_shutdown(pasid);

[Severity: High]
This is a pre-existing issue, but does a timeout earlier in this
function leak resources?

If wait_for_completion_timeout() times out waiting for userpd_stopped,=20
ath12k_ahb_power_down() returns immediately without clearing the stop
bit and without calling qcom_pas_shutdown(), abandoning the remote
processor state.

> +		ret =3D qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> -				   ab_ahb->userpd_id);
> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
> +				   ab_ahb->userpd_id, ret);
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D13

