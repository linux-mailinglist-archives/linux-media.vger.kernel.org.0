Return-Path: <linux-media+bounces-63627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HqOyGlVGIGqIzwAAu9opvQ
	(envelope-from <linux-media+bounces-63627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:20:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 064706391A3
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 17:20:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=A+GqCWGI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63627-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63627-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD00F3245551
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73713AE1A0;
	Wed,  3 Jun 2026 14:44:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF993D967A;
	Wed,  3 Jun 2026 14:44:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497876; cv=none; b=h27JKSFPTUCA7qPlQ+b2CbdRKNzTng4sIs9GnshGIhS+vthpsw7OT6fNqywo9znL+bd2bvvPeEzsp9cdPAUlycjiBX2pfF/Dh4/eIQ8AR8gu78XGzNQMoKrSBSvoXlqtUYpjimTGV4tXNipkxvu/ZWSUmF4f8fyPD0yZJD+Kva4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497876; c=relaxed/simple;
	bh=DJemCHXelp6y6s7MDJZjUY+k/5vkilvcFuhILApetv0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SZ3UXaTv8SGGaSj5pv6gAmTgz1gcGQF37se54jinP+oJiIrWGFY2d8QwzvwGKoZNXeH99LymLp/RDATcZCRtm6NlG6dHqqof0Hr0+aWH2ndNRvceaetaOd4WPtzGyque++tF/kluZYJy+2hYLJD2Y1ySzhZjX5L++Wel4qZaG8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+GqCWGI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928EF1F00898;
	Wed,  3 Jun 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497874;
	bh=59hCP/n1qwr+OrrR7X03nglDH067pkyNmd7f+973UjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+GqCWGIWSZHQ/jJqbEftZKiraeLNN4CJ6oy9I8TP2tPolF3JP8TnWEiR/lWIWoYM
	 VZQtWB81t0G5DrBRnWBKSNRFRwhr8IGhPVDyP2xyPgPBQUDA7qz+llFaXsFJI774OB
	 corS1/eVt3gxRyoowJEljtNp7UR9SAoQ+d53SKNSohCtzSnKIP5VvZkWLV9Muq2uKf
	 Vu+ookGMSd/br1KoROzU1mvzrLLHxzh5iYfxZt6K5TKTGrutTcxjCIkLIuEASArlLu
	 AnQ2m2ZFHxc6np70qjeptcM6Lmm/Ads9jDbRPOfE3QbiQtbTX4EXPqfwdmsMnqmSqB
	 wBBh+eXaWpqwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/12] media: iris: Add support to select core for
 dual core platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-9-afaa55d11fe0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:44:34 +0000
Message-Id: <20260603144434.928EF1F00898@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-63627-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 064706391A3

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dynamic core assignment logic mutates `inst->core_id` during strea=
ming without firmware notification and without holding `inst->lock`.
- [Medium] Initial core assignment bypasses MBPS constraints.
--

commit 2b81abf719d22ec30cd3764b2bba16be2af15168
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add support to select core for dual core platforms

On platforms with two video codec cores, select the hardware core for
a new session based on the current Macroblocks Per Frame (MBPF) and
Macroblocks Per Second (MBPS) load on each core. The selected core is
communicated to the firmware via the HFI_PROP_CORE_ID property at
stream-on time.

> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/=
platform/qcom/iris/iris_vb2.c
> index a2ea2d67f60d0..dbb89396e6514 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, un=
signed int count)
>  	if (ret)
>  		goto error;
> =20
> +	ret =3D iris_set_core_id(inst);

[Severity: Medium]
Since this initial core assignment is driven by iris_check_session_supporte=
d()
called just before this, does that function need to check both MBPF and MBPS
limits?

Currently, iris_check_session_supported() only calls iris_check_core_mbpf()=
 to
verify Macroblocks Per Frame limits. The complementary MBPS constraint check
via iris_check_core_mbps() appears to be entirely omitted.

Could this allow a session to be successfully assigned to a core that meets
the MBPF limit but vastly exceeds its maximum processing capability (MBPS)?

> +	if (ret)
> +		goto error;
> +
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>  		if (inst->domain =3D=3D DECODER)
>  			ret =3D iris_vdec_streamon_input(inst);

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 65896d0c1f16b..9f8dacfa768d8 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -318,6 +318,67 @@ static void iris_vpu36_program_bootup_registers(stru=
ct iris_core *core)
>  	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
>  }
> =20
> +static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
> +{
> +	const struct iris_platform_data *platform_data =3D inst->core->iris_pla=
tform_data;
> +	u32 max_load =3D mbpf ? platform_data->max_core_mbpf : platform_data->m=
ax_core_mbps;
> +	u32 max_session_cnt =3D platform_data->max_session_count;
> +	u32 core0_session_cnt =3D 0, core1_session_cnt =3D 0;
> +	u32 core0_load =3D 0, core1_load =3D 0;
> +	bool select_core0, select_core1;
> +	struct iris_inst *instance;
> +	u32 load, new_load;
> +
> +	inst->core_id =3D 0;

[Severity: High]
Is it safe to mutate inst->core_id here during active streaming without
holding inst->lock?

This function can be reached mid-stream if a concurrent s_parm call triggers
iris_venc_s_param() -> iris_check_core_mbpf(). Since iris_venc_s_param()
executes without holding inst->lock, a concurrent call can clear
inst->core_id to 0 right before iris_set_core_id() reads it during
iris_vb2_start_streaming().

Additionally, altering inst->core_id mid-stream without notifying the
firmware (which only receives HFI_PROP_CORE_ID at stream-on) permanently
desynchronizes the driver from the firmware.

This could cause iris_vpu36_get_required_freq() to incorrectly shift the
session's power votes to the new core while the firmware continues executing
on the old core, potentially leading to hardware underclocking and system h=
angs.

> +
> +	list_for_each_entry(instance, &inst->core->instances, list) {
> +		load =3D mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-glymur-v7-=
0-afaa55d11fe0@oss.qualcomm.com?part=3D9

