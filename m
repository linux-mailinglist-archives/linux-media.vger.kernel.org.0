Return-Path: <linux-media+bounces-63190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNsUJndAHGqQLwkAu9opvQ
	(envelope-from <linux-media+bounces-63190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 16:06:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAAE61699F
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 16:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1F54300D845
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 14:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F95318EC7;
	Sun, 31 May 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrgxNeSd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CDF2367CF
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236399; cv=none; b=Q2IXMGaETMTP2iKY5xOK8iNwcVlTBeSB3OxsVX/IzU2dm7DLW1Jlh9ni+jO6sK+Lzi4w9lOojvRePAc8UYiXHJ9NjRLai15wIODbT4dtbIEKZgOnHcxdZkywvE7ThPupUXgJCsK8QVkovy3GmoIdFK2d4PyBl9UXw50iCrS9Cws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236399; c=relaxed/simple;
	bh=h6ss3uIqrqiR9+Fgs6VBjVrDwHkL9bnYfPP7oEsDCHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MRtk+FLrpNkpZgOw2N94HKQGPFEw4o/7Pj7N6l1Nd1X+9aHsqYCs7o6Zlvs/DUIpkQucJPOXWFlJXcNZ5I+mSDKKymiP3f8yeho1aTIN1o9X0rvYTmhI4DaPYJ67MJ7sh+6IVmvRknHb96IqRZ/mnyZ4TokuzQly2TZxt/3ORyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrgxNeSd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BE71F00893;
	Sun, 31 May 2026 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780236398;
	bh=mL8qnlOc2zk+63hIrw1J1yYdVGSgmbaU29THXOz+H4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XrgxNeSdYESa05jbm2vnmf3GbHsZeP296eCriwIMN8wrW9sIeS1uFT7PzEb8hMZDY
	 bF3PNk+snNPquB5WE6ga9hhYGMULrKvdNOY5n8O7AV6puZhJu1t3c5AQN2JECumG4B
	 i0bvdePl+PYz5me669IMJjEGn6LF7HLdKNU7vauzOFpEWmmu9+0bREZQUKGVQxNCL/
	 LO9NP/+6Q/+v0YLCAsnvtelr6CkuxqmAZSsrzKg9Xq+XFLDPcg54VI/uIxOyeuX9G+
	 pSort6UlULNJ82cTEf4HhaU+nPI1G3h15bY8Y3iqc+V13Hsl2xdD66X6mcl8yIkcnV
	 ZCPq07r+luUtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH WIP v5 5/9] media: qcom: camss: csiphy-3ph: Add Gen2
 v1.1 MIPI CSI-2 C-PHY init
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg via B4 Relay" <devnull+david.ixit.cz@kernel.org>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260531-qcom-cphy-v5-5-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-5-6be0f62b4d65@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 14:06:37 +0000
Message-Id: <20260531140638.67BE71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63190-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,david.ixit.cz];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url,linaro.org:email]
X-Rspamd-Queue-Id: EBAAE61699F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Uninitialized pointer read when validating C-PHY lane configuratio=
n for Gen1 hardware.
--

commit 2b99c545d00ed7e65be8ffeddf052d1789d06fa7
Author: Casey Connolly <casey.connolly@linaro.org>

media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI CSI-2 C-PHY init

Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
Gen 2 version 1.1 CSI-2 PHY. The PHY can be configured as two phase or
three phase in C-PHY or D-PHY mode.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 8bcba6107471f..d837fcf7cd2f0 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
[ ... ]
> @@ -1172,8 +1238,8 @@ static int csiphy_lanes_enable(struct csiphy_device=
 *csiphy,
>  	switch (csiphy->camss->res->version) {
>  	case CAMSS_845:
>  		if (c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY) {
> -			regs->lane_regs =3D NULL;
> -			regs->lane_array_size =3D 0;
> +			regs->lane_regs =3D &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845_3ph);
>  		} else {

[Severity: High]
Can regs->lane_regs be read uninitialized later in this function?

In csiphy_init(), the regs structure is allocated using devm_kmalloc(), whi=
ch
does not zero-initialize the memory:

    regs =3D devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);

If csiphy_lanes_enable() is called for a hardware version that falls throug=
h to
the default case in the switch statement (like older Gen1 devices),
regs->lane_regs is never assigned.

Then, just after the switch statement, the code evaluates this condition:

    if (!regs->lane_regs && c->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY) {
        dev_err(dev, "Missing lane_regs definition for C-PHY\n");
        return -EINVAL;
    }

Could this evaluate an uninitialized pointer from the heap, potentially
bypassing the safety check and causing hardware misconfigurations?

>  			regs->lane_regs =3D &lane_regs_sdm845[0];
>  			regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-qcom-cphy-=
v5-0-6be0f62b4d65@ixit.cz?part=3D5

