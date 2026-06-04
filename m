Return-Path: <linux-media+bounces-63763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oj+hLtM1IWpXBAEAu9opvQ
	(envelope-from <linux-media+bounces-63763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:22:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D3A63DF84
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:22:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gBrssYru;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63763-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63763-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C239303F7F7
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BF038A734;
	Thu,  4 Jun 2026 08:14:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823530E0F5
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:14:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560845; cv=none; b=M3o59Z7iEBbfIPthA7krJl24VQ+j35Afl16iAA/7eUudJyyor3AeDkSyS/4UDZLvZ6UrhD/4bL764Ene7dRvVOVME7/9dlPB67y12/R3ixeXPUdempNn5z7tV7NHvnb8pzEoP4YG30gCjJlqN8ap6MGGqhgVTRRt+dPH64RceSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560845; c=relaxed/simple;
	bh=PH1MYNRl5dH8xfdBgZ6EKuE2WZMP8WBQkfh6FHZv9iE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TJ/HHpDfktcFuiDZrpPk33vWsotKu9/SoXjLIU+TumDTfixMOMT9DSzVMwjfE3JxUyFg8KO/hGBHENa4ZJQqyCFOv5lI7k8la3taykHwVygmDrX6E3KbksrNEw6WTgGZ5kd+vWCKnUmwBxbPItDExsUMbiTKlLf6aggtUjIl3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBrssYru; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E361F00893;
	Thu,  4 Jun 2026 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780560843;
	bh=va8lvu0uNFvl3t4JoLnFB7lzEpzCwbawKlxolhSBIc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBrssYruSNHX5uAQhhkc4ts4PmbcTY8sQ1V+hkMSISHuXIq7mjpPgUuJl3nDwPRdq
	 YxEV3vmLi1zu8dojD9MJaHuPObHLxKwnZr/pJGetbr9lu13/HcxZ9kY2HDeclCrUa2
	 jRbg9RkgmK/PiELInTboBOEAyskIDE/Ef6EfNmqwucMQYPijPRpG6y0swcVvRyF18k
	 4uO65mQf/MRK/Qej1yDiglwg3I8QCWzNn/ntB6NB+fDUPLjxu7HeUrVHNnG75dQASi
	 +yH7L8YHp6uErSzu1bdFZe7f7vpCNC2HZ9KXFfUSpoVukL/SZfZnlnW2wzKnLVNpOd
	 n0uTeGngXM6Rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] media: qcom: iris: Add gop size support for gen1
 encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604-dynamic_encode-v2-1-6e97df032482@oss.qualcomm.com>
References: <20260604-dynamic_encode-v2-1-6e97df032482@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 08:14:03 +0000
Message-Id: <20260604081403.B8E361F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63763-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wangao.wang@oss.qualcomm.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,qualcomm.com:email,vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36D3A63DF84

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Undocumented addition of dynamic allowed flag to `IR_PERIOD` cap=
ability.

Pre-existing issues:
- [High] The driver lacks a `.try_ctrl` implementation to validate dependen=
cies between controls, resulting in silent hardware configuration failures =
for valid V4L2 inputs like `gop_size =3D=3D 0`.
--

commit 0331fb3580ba43928b379274c9bd300bf884fc44
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

media: qcom: iris: Add gop size support for gen1 encoder

This commit adds support for GOP size configuration on gen1 encoders by
enabling V4L2_CID_MPEG_VIDEO_GOP_SIZE and routing it to the hardware handle=
r.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/m=
edia/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b531..eff9216bb5014 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> @@ -171,7 +171,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_=
sm8250_enc[] =3D {
>  		.max =3D (1 << 16) - 1,
>  		.step_or_mask =3D 1,
>  		.value =3D 30,
> -		.set =3D iris_set_u32
> +		.hfi_id =3D HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
> +		.flags =3D CAP_FLAG_OUTPUT_PORT,
> +		.set =3D iris_set_intra_period,
>  	},

[Severity: High]
This isn't a bug introduced by this patch, but this patch explicitly wires =
up
the GOP_SIZE control to the hardware for Gen1, bringing a pre-existing sile=
nt
failure path into active use.

The V4L2 specification defines V4L2_CID_MPEG_VIDEO_GOP_SIZE =3D 0 as meaning
"only I-frames are used". The driver exposes .min =3D 0 for this control,
allowing userspace to request it.

However, the hardware handler explicitly rejects a 0 gop_size:

iris_set_intra_period() {
    ...
    if (!gop_size || b_frame >=3D gop_size)
        return -EINVAL;
    ...
}

During streamon, the driver iterates over capabilities and applies them to
the firmware, but ignores any returned errors:

iris_set_properties() {
    ...
    if (cap->cap_id && cap->set)
        cap->set(inst, i);
    ...
}

Because the return value is ignored, the error is swallowed and user space
receives a success response, but the property is never dispatched to the
firmware. Could this cause the encoder hardware to operate with out-of-sync
default GOP settings instead of the requested all-I-frames configuration?

[ ... ]

> @@ -240,7 +242,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_=
sm8250_enc[] =3D {
>  		.step_or_mask =3D 1,
>  		.value =3D 0,
>  		.hfi_id =3D HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
> -		.flags =3D CAP_FLAG_OUTPUT_PORT,
> +		.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set =3D iris_set_ir_period_gen1,
>  	},

[Severity: Medium]
Does this modification belong in this patch?

The commit message strictly states that it adds support for GOP size
configuration on gen1 encoders. However, this line modifies the IR_PERIOD
(Intra Refresh Period) capability to include the CAP_FLAG_DYNAMIC_ALLOWED
flag.

Modifying intra-refresh dynamic behavior appears to be a distinct functional
change that isn't mentioned in the commit message. Could this be split into
a separate commit or mentioned in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-dynamic_en=
code-v2-0-6e97df032482@oss.qualcomm.com?part=3D1

