Return-Path: <linux-media+bounces-63830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vTmCCLatIWp7LAEAu9opvQ
	(envelope-from <linux-media+bounces-63830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:54:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DC64215B
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 18:54:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TuqihSV3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63830-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63830-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DCF93037D72
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 16:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B7C47D955;
	Thu,  4 Jun 2026 16:42:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BC43B95F8;
	Thu,  4 Jun 2026 16:42:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591332; cv=none; b=BWi5dz5ZAmHFjaGw9JLf+X1CbI6/XZghZcqpkR0rZt0lRiLtkD1KZj0yZmvRVTJUB5CrmV58Sr40c1NmQ16xuQg00ySJiShJ70Sakpkn66bh+k6ecnUu5a/b2T9Oeep+TQjF2xn9oTncgr9xaitEtlxNDFGyBIvBtXJ643tP4dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591332; c=relaxed/simple;
	bh=/XEe6hYe3/uZHzE97kUjKRZUb7pvUATl5KnyWytqpOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YZis6DHXr0xbGa+hD7aN/UAF5pui/3KKQnuZrobuoj/Acy9Kp8ybmC88XjQR8euycr4JayY0fCGCMwU7+AyzpbiImVknwAvg1NnS3vF1vq3zzDCT613w/mzWyssnTuQH/K9n0HOwwfaKrdiROOCA3RWQKe5nnKG3C53PCtzIpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuqihSV3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B9F1F00893;
	Thu,  4 Jun 2026 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780591331;
	bh=0tkZVaX9L6LFM5fETbjJMK76CYdudVBTSoUUwoeGogM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TuqihSV37zDMZoadubHYJpGD+Vpx1eV2cVZLbFyA+K0v5UDvczAhdNVmx8vm/XTt6
	 0nozcezqTgdP+K/sbR7Hjc8DHl37UCL/bZmTpHWxzznTBPafUCB6+W6xf/XS7gh+QK
	 JfP0x3bIp3ISDxJtpQHx5fFq58WFgmMMOXVI3UVM1By40pzIP1aF5oHNd4ml4//X2c
	 JAsFyJfvAdhKmJO1B28+fEl5ooRebd+k+X+amdIZVPG0kkfRiXnJIcGjHckQ4e1pew
	 wwZoCP9E3R/hZLv2Id6j5MQNcgKdEcbLNnbWl6VO/yvVRMrX3GzBHQMJGNB+8XqD6z
	 dZrpEYst0Hg+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 16:42:10 +0000
Message-Id: <20260604164210.B7B9F1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,smtp.kernel.org:mid,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,vger.kernel.org:from_smtp];
	TAGGED_FROM(0.00)[bounces-63830-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A7DC64215B

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The newly added 'mmcx' power domain is ignored by the 'venus' and =
'iris' drivers, leaving MMCX unvoted and incorrectly lowering the MX domain=
 voltage vote.
- [Low] Adding 'mmcx' to the 'power-domains' array without updating the dt-=
bindings schema causes a validation error.
--

commit 3e49b17a27a634436ceefec5a26bbe9a8584818e
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
arm64: dts: qcom: sm8250: sort out Iris power domains

This commit adds the MMCX power domain and required-opps to the venus
device node for the SM8250 platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 7076720413ab2..6150380795b81 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
>  			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains =3D <&videocc MVS0C_GDSC>,
>  					<&videocc MVS0_GDSC>,
> -					<&rpmhpd RPMHPD_MX>;
> -			power-domain-names =3D "venus", "vcodec0", "mx";
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

[Severity: Low]
Does adding mmcx here cause a dt-bindings validation error?

Looking at Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml,
the schema strictly enforces maxItems: 3 for power-domains and requires
exact matches for power-domain-names (venus, vcodec0, mx).

[ ... ]

> @@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
> =20
>  				opp-720000000 {
>  					opp-hz =3D /bits/ 64 <720000000>;
> -					required-opps =3D <&rpmhpd_opp_low_svs>;
> +					required-opps =3D <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
>  				};

[Severity: High]
Will this result in MMCX remaining unvoted and MX receiving a lowered
voltage vote?

The venus and iris drivers both hardcode their OPP power domains to only
request mx:

drivers/media/platform/qcom/venus/core.c:sm8250_res
    .opp_pmdomain =3D (const char *[]) { "mx" },

drivers/media/platform/qcom/iris/iris_platform_gen1.c:sm8250_opp_pd_table
    static const char * const sm8250_opp_pd_table[] =3D { "mx" };

Because mmcx is never requested via devm_pm_domain_attach_list(), the OPP
framework assigns the first required-opps entry to mx, and silently skips
the second entry since it maps to an unattached device.

This appears to leave MMCX unmanaged while incorrectly lowering the MX
domain vote.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-iris-venus=
-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com?part=3D1

