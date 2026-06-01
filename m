Return-Path: <linux-media+bounces-63309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJKuCuO1HWrKdAkAu9opvQ
	(envelope-from <linux-media+bounces-63309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:40:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E34622B7E
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 18:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE32A302A2E6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 16:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812B22EC54C;
	Mon,  1 Jun 2026 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAIH90UH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECE279358;
	Mon,  1 Jun 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331261; cv=none; b=GO+JaCbQs8MCaaZ0RutosKzqva2G7VVw4adZEYKMRc/tsm40WORgJ56+iCtt3Z1+xze8B8zqqhrg0NtQIVKXuF4hcxoEWW0WAiL01OA/1xYSCqCG3hcRlzDdNrUrN6plbCCGg3Z0r9m6LvgcX0mLneYzNt3xsb7KKT5PySsgPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331261; c=relaxed/simple;
	bh=ckNfU6Zh5FVksWGYGPPdLqJnNPsw97Ef3CJMl4sNNh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ax9tgXRoGed0ciNTLCU7cAiL0Vh/OeUnR7qQ2ZGdjQLGqEJnbr9qairhb2LF6O/tNcyLcSFUjZwInZRYjegNgUSv7+jbO/wGsXrafPKDgQFREuYHykD0ZNr5w67cZBKO/1/31RnirD4p2SUjnHJgd5wDODjSeWSKNBmH72oLPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAIH90UH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2531F00893;
	Mon,  1 Jun 2026 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780331257;
	bh=AZ1KVhiGa4D+5p5Agq6YIrd1v/77Cggmk2MlrIG4WKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eAIH90UHRT0SIWqJ/bhL7uY6+VqbqzXuaqBVh1CIPXY4MScVHst/j3+a3dHBrr4IB
	 rC2gxqEDxZoghby3kBTqvk7F44lRwa6MMHbdCKjrfn1HD0FpHsOcMJIXl0LX090qli
	 BHAgUSpVxI/q3kH48XGh+zDEfOJuuJMqbPmBJ7yt8LsC8uJVKHrChf/rEmh9PekYMx
	 /t7+fIJ0/2CfIAVwnDBGoVULd5x1HSTy5lgO0V8c5N0OMCQCZ0mDM6fij3Qxx8hgBy
	 M/9sAi+1HyVf2wFIOPZUoxH0Ildwmk0K/LPKYaoYPxsR0reM7n+Hvc26CCgiV4iaJf
	 WVijtkmy9yGIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 4/5] media: qcom: camss: csid: Add support for CSID
 gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-kaanapali-camss-v14-4-e76f26aa6691@oss.qualcomm.com>
References: <20260601-kaanapali-camss-v14-4-e76f26aa6691@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 16:27:37 +0000
Message-Id: <20260601162737.8D2531F00893@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,sashiko.dev:url];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63309-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 79E34622B7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The gen4 CSID hardware advertises support for 5 source streams, but=
 the media pad arrays are hardcoded to a maximum of 4 source streams, rende=
ring the 5th stream unreachable dead code.

Pre-existing issues:
- [High] Missing 0-check for `phy->lane_cnt` in `__csid_configure_rx()` cau=
ses an integer underflow, resulting in `0xFFFFFFFF` being written to the ha=
rdware register.
- [High] Lockless read-modify-write of `csid->aup_update` and `csid->rup_up=
date` between process context and IRQ context causes lost register updates.
--

commit c0660384d930d560819871fc94413f7382296c54
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID gen4

Add more detailed resource information for CSID devices along with the
driver for CSID gen4 that is responsible for CSID register configuration,
module reset and IRQ handling for BUF_DONE events. In this CSID version,
RUP and AUP update values are split into two registers along with a SET
register.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen4.c
> new file mode 100644
> index 0000000000000..6e5ebeefd010e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> @@ -0,0 +1,380 @@

[ ... ]

> +/* CSI2 RX interrupt registers */
> +#define CSID_CSI2_RX_IRQ_STATUS			0x1B0
> +#define CSID_CSI2_RX_IRQ_MASK			0x1B4
> +#define CSID_CSI2_RX_IRQ_CLEAR			0x1B8
> +#define CSID_CSI2_RX_IRQ_SET			0x1BC
> +
> +/* CSI2 RX Configuration */
> +#define CSID_CSI2_RX_CFG0			0x880
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
> +#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
> +#define CSID_CSI2_RX_CFG1			0x884
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
> +
> +#define MSM_CSID_MAX_SRC_STREAMS_GEN4		(csid_is_lite(csid) ? 4 : 5)

[Severity: Low]
Does this make the 5th stream unreachable dead code?

MSM_CSID_MAX_SRC_STREAMS_GEN4 evaluates to 5. However, MSM_CSID_PADS_NUM is
globally restricted to 5 (1 sink + 4 source pads) in camss-csid.h. During
link setup, valid array indices cap out at 4, preventing BIT(4) from ever
being set in csid->phy.en_vc.

Because of this, the loop executing i =3D 4 in stream configuration can nev=
er
run, rendering the 5th stream dead code.

> +
> +/* RDI Configuration */
> +#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) ?\

[ ... ]

> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);

[Severity: High]
This is a pre-existing issue, but does this lockless read-modify-write
cause lost register updates?

Process context uses non-atomic bitwise OR (|=3D) to trigger register updat=
es
via __csid_aup_update() and __csid_reg_update(). Concurrently, the IRQ
service routine uses a non-atomic bitwise AND NOT (&=3D ~) inside
__csid_aup_rup_clear() to acknowledge completions.

If an interrupt pre-empts process context during the RMW instruction cycle,
the ISR's clearing operation will be silently overwritten by process contex=
t,
resulting in lost or phantom register updates.

> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	int val;
> +
> +	val =3D (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;

[Severity: High]
This isn't a bug introduced by this patch, but does this cause an integer
underflow if phy->lane_cnt is 0?

When the test generator is enabled without an active input link,
phy->lane_cnt remains zero-initialized. This causes (phy->lane_cnt - 1) to
underflow to -1 (0xFFFFFFFF), which is then written directly into
CSID_CSI2_RX_CFG0, corrupting hardware configurations.

There is a safety fallback later in __csid_configure_rdi_stream():

	if (!lane_cnt)
		lane_cnt =3D 4;

However, this fallback acts as a dead store and does not protect the RX
path configured here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-kaanapali-=
camss-v14-0-e76f26aa6691@oss.qualcomm.com?part=3D4

