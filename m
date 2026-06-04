Return-Path: <linux-media+bounces-63765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bIz2OD03IWrrBAEAu9opvQ
	(envelope-from <linux-media+bounces-63765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:28:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4858B63DFD9
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:28:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Ib0OI9/a";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63765-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63765-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 238F530580B2
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367203DEFE4;
	Thu,  4 Jun 2026 08:19:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928783DDDC6
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:19:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561189; cv=none; b=Y/Bi2MY1j5OEZyhWscsVLLKcuImzjHe0hwLkdz66vzKDA0r+Xcwk2HGLmznx5xuJU3PgHaeG8Qg28BimT6AU0BLUCei3GiHULiHKwa4lECcM+6+5hJ3nrMkHqQaIWjmCkkgt/B0HP18a0HCxGTl/nh8WUcKnyTJS9cDVm1TqNjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561189; c=relaxed/simple;
	bh=vwJUTVTwmXHOmB+ZozOmNeE1Pw/CvwqtkdSmtCovo6s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tw4Lykb8yK7JRREMC7SdAZ68plN8nm7IMlnSrpdCuKOu0maIi3JSP/Xsk+B+2p69cCygeTrt/TpqNPHyqygf9Gtlh9w4b1zT6LruTetM2IeTpl+5x+nZym5uTl8lsOdZrUsWWhMby3r/04nOLMmlQWYgdWehdvzgDn7IZTu9mNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ib0OI9/a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4061D1F00893;
	Thu,  4 Jun 2026 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780561188;
	bh=cx/OebeJgvLTladQ+0doUfIQMRhcRrBCD5yiXe2FKqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ib0OI9/alkUPtjw4kEJVFLJ64skfXDmuW0JOO65vEBLZr48hokhu4w70zQr6i3vcr
	 q5PTXtT0J8OqDgL1WbVy6jZXUC6Co3jO4r9+GXwUj/m5mFWUjGhsn2nLushAyHD5x4
	 QqeW1O9tDLqhM55h1bzK8FHp4OdrCVCz7bVgKgoUXWoDg2TZpGcEKsfCi6k8drhCE0
	 MDdbXKGwUr+WVKJM9LLypRiNAKv7PZcYArUsS0nzTWm7Te+gZ4kQYU5e5GeUljAFRQ
	 3A0jgmXBmxNQ3iAzGpWv6jhPhgF9Agun5U5tHd26pZCoBo2Br2QpSkosqoxqbkgNYG
	 e4ba5BVXN46lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: qcom: iris: Add request key frame support
 for encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wangao Wang" <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
References: <20260604-dynamic_encode-v2-2-6e97df032482@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 08:19:47 +0000
Message-Id: <20260604081948.4061D1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63765-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4858B63DFD9

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] In Gen1, the payload for `HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FR=
AME` is discarded and the packet size is not incremented, resulting in a tr=
uncated firmware command packet.
- [Medium] The driver unconditionally requests a sync frame on stream initi=
alization, bypassing V4L2 button control semantics.

Pre-existing issues:
- [High] Concurrent modification of the shared `inst_hfi_gen2->packet` buff=
er causes HFI command packet corruption.
--

commit 69576d77651c69239afd97ac72082948d7e40043
Author: Wangao Wang <wangao.wang@oss.qualcomm.com>

media: qcom: iris: Add request key frame support for encoder

This commit adds support for requesting key frames for both gen1 and gen2
encoders by enabling the V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME control.

> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/medi=
a/platform/qcom/iris/iris_ctrls.c
> index 391e1fc5f6e2e..2918a7df0b403 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
[ ... ]
> @@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst,=
 enum platform_inst_fw_cap_typ
>  					     &bitrate, sizeof(u32));
>  }
> =20
> +int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_f=
w_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops =3D inst->hfi_session_ops;
> +	u32 hfi_id =3D inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_val =3D 0;
> +
> +	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
> +		hfi_val =3D HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
> +	else
> +		hfi_val =3D HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32_ENUM,
> +					     &hfi_val, sizeof(u32));
> +}

[Severity: Medium]
Will this unconditionally request a sync frame on stream initialization?

During stream initialization, iris_set_properties() iterates over all fw_ca=
ps
and invokes their .set callbacks. Because this function lacks a check for
inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET (like bitrate does), it
seems it will unconditionally issue a REQUEST_SYNC_FRAME command to the
firmware on every stream start, bypassing V4L2 button control semantics.

> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
[ ... ]
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 7674b47ad6c49..d7fd867cf6c98 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -741,6 +741,9 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_=
session_set_property_pkt *p
>  		packet->shdr.hdr.size +=3D sizeof(u32);
>  		break;
>  	}
> +	case HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME: {
> +		break;
> +	}

[Severity: High]
Does this result in a truncated HFI packet?

In iris_hfi_gen1_packet_session_set_property(), the switch statement for
HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME simply breaks without writing
the 4-byte payload or incrementing packet->shdr.hdr.size by sizeof(u32).
This omits the payload entirely, which may cause the firmware to reject the
request with a parameter error.

>  	default:
>  		return -EINVAL;
>  	}
[ ... ]
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/m=
edia/platform/qcom/iris/iris_hfi_gen2.c
> index acc0ed8adda1a..df8e70b133a12 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -937,7 +937,17 @@ static const struct platform_inst_fw_cap inst_fw_cap=
_sm8550_enc[] =3D {
>  		.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set =3D iris_set_layer_bitrate,
> -	}
> +	},
> +	{
> +		.cap_id =3D REQUEST_SYNC_FRAME,
> +		.min =3D 0,
> +		.max =3D 0,
> +		.step_or_mask =3D 0,
> +		.value =3D 0,
> +		.hfi_id =3D HFI_PROP_REQUEST_SYNC_FRAME,
> +		.flags =3D CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set =3D iris_set_req_sync_frame,
> +	},

[Severity: High]
This is a pre-existing issue, but does adding this dynamic control expose a
race condition where the shared packet buffer could be corrupted?

In Gen2, properties and commands are built using a single, per-instance
dynamically allocated buffer inst_hfi_gen2->packet. The V4L2 control
framework allows dynamic controls, such as the newly added
V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, to be set during streaming via
VIDIOC_S_CTRL.

The s_ctrl handler is protected only by the control handler's internal lock
(ctrl_handler.lock), while queue-related ioctls like VIDIOC_QBUF and
VIDIOC_STREAMON are protected by the queue lock (inst->ctx_q_lock).=20

When s_ctrl and qbuf are executed concurrently, they can both invoke Gen2 H=
FI
functions which write headers and payload data directly into the shared
inst_hfi_gen2->packet. Since there is no common lock protecting
inst_hfi_gen2->packet prior to its submission in iris_hfi_queue_cmd_write(),
this could result in data races and corrupted HFI packets sent to the firmw=
are.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-dynamic_en=
code-v2-0-6e97df032482@oss.qualcomm.com?part=3D2

