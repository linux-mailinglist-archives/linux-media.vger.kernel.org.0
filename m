Return-Path: <linux-media+bounces-63089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJjYK8czGmrQ2AgAu9opvQ
	(envelope-from <linux-media+bounces-63089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:48:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC4860A548
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 02:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 028753063F18
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 00:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E3B46B5;
	Sat, 30 May 2026 00:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3XUPkF+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865028030E;
	Sat, 30 May 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102001; cv=none; b=Gea0BFG2YEnYOHU8cpP2Zyp2Uie/NnHMDyljkOV5zuwVV1pX5PLlfHf2IJ0VT3GqUcPL7SYFUTehXCM6oC5OA4TVVeMqPagRsQ8cMBqsKskqkrfdG0ZAPgyQqPxzlGJoNmB5bO9vuyWPvcQCj74xCL2Y1T8GMoDpbe0oMiYZWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102001; c=relaxed/simple;
	bh=a7K3m4u5t/d2JaFUJqClXibVhKIGjCQFN05qFvNZg0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ihq6urPL6XA5mbKBfxMAtTwh29MFophbUNIjiY6qCbbzfabRUGdTzQRmlG37FAdn/Gy0r10fAJblVXnx1iGfl8RIayS1VGUXyDt+BYiGDpSf4ppymj+shxd4K98yGzsTev5x+c6RA9EsHDu+PL5rRXhjSc0fWyNbAzvylRF1lYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3XUPkF+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA181F00899;
	Sat, 30 May 2026 00:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102000;
	bh=gfG5bKFYCClAy8inB7Dbn7ap9CA5R9+PderCKI59Qew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c3XUPkF+DaAplNbxPLudoGyPoncKjcV1QKzUXNQzb98A/lI8qfJaoNnNpRTqfGqj6
	 uZGKmYPqf5I7YJjhwQcPzQRkMy69wEqkib69wdVvS78UZN9stJLFB0wcfhE0ZlJEuF
	 xnryYQBNM17MFD16FAh79uuVEKvgsnb1r7jeUmJoCrkJzpWfckxkQFnvRHkkvemeV8
	 1JE2ltjin9TzPqBEtqQem2bMA4S84So1uzmkeffTAWUBJZq07KFUSh75SG2sPV+Vxk
	 EW3JfYssUxrL4ql6DpiSTtDtVzPhQTPs4zLk3SSMpl7JgzIAA+BaKasae2C+beeTvG
	 jYisLe4X9rshg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/15] arm64: dts: qcom: kodiak: Add EL2 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260522115936.201208-2-sumit.garg@kernel.org>
References: <20260522115936.201208-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:46:40 +0000
Message-Id: <20260530004640.8AA181F00899@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:url,qualcomm.com:email,smtp.kernel.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:replyto,sashiko.dev:url];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63089-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 5CC4860A548
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to "apply it to Kodiak IOT variant dev=
ices to create -el2.dtb for each of them alongside 'normal' dtb." However, =
only `qcs6490-rb3gen2-el2.dtb` is actually added to the Makefile. Other Kod=
iak IOT variants (e.g., `qcs6490-radxa-dragon-q6a`) are completely omitted.
--

commit dae207f029919c9e5d599bad87797d9c3c3d8c49
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Add EL2 overlay

This commit introduces a new EL2-specific DeviceTree overlay for Kodiak
boards to allow booting Linux in EL2 without the Gunyah hypervisor. It
configures remote processor firmware IOMMU streams and the hardware
watchdog while disabling unsupported subsystems like the modem and venus.

Link: https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boo=
t-developer-touchpoints.html#uefi

> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.

[Severity: Medium]
Is this description accurate? The commit message states the overlay is
applied to all Kodiak IOT variant devices, but only the qcs6490-rb3gen2
device has the -el2.dtb target added below.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 4ba8e73064194..28123cdc9de26 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
[ ... ]
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs615-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-radxa-dragon-q6a.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2.dtb
> +qcs6490-rb3gen2-el2-dtbs :=3D qcs6490-rb3gen2.dtb kodiak-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D qcs6490-rb3gen2-el2.dtb

If the intent was to also apply this overlay to other variants like
qcs6490-radxa-dragon-q6a, would the fdtoverlay step fail?=20

Other Kodiak boards use /delete-node/ for remoteproc_mpss and
remoteproc_wpss because they lack the hardware. It looks like applying
kodiak-el2.dtso to those boards would result in an error when the overlay
attempts to modify these non-existent nodes:

> diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/d=
ts/qcom/kodiak-el2.dtso
> new file mode 100644
> index 0000000000000..520ed582370da
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
[ ... ]
> +&remoteproc_mpss {
> +	status =3D "disabled";
> +};
> +
> +&remoteproc_wpss {
> +	iommus =3D <&apps_smmu 0x1c03 0x1>,
> +		 <&apps_smmu 0x1c83 0x1>;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522115936.2012=
08-1-sumit.garg@kernel.org?part=3D1

