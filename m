Return-Path: <linux-media+bounces-59883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOGULm4L8Wn1cAEAu9opvQ
	(envelope-from <linux-media+bounces-59883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:33:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4698D48B2A0
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A05E9301EBF1
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C355D37CD22;
	Tue, 28 Apr 2026 19:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q2FZTo9K"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611C3793CC;
	Tue, 28 Apr 2026 19:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404777; cv=none; b=ZfYsGmrE0zUHUATYvS1mvioYfdwx+rZilzWHFJB2OR1dVMzD6EjEme1/RnUtfi5rVmxUpNEIdZJPFuVhXOvAJ1cmqhF/RE0/od7Ak1jfN9h9vZQuRbR0mBOZAU2WEdKdJIZuSM3LpqvQYb4FVPGta5KbsqUg724+8SxNU0t68rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404777; c=relaxed/simple;
	bh=POeKpNTUy4GRSYlEpg6+XWQEI2AgdpYdi/kKq7LYl3o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p/H3/+HYx7DzrvCtU0xUu/r+vnJlVBUNziHlzI24qgM0YKLvz4hpzQm6+1o4maciIuPi557ueiOktYJ//dmaUG7YfaJ84KJ9qoxidLUN0C+QsNDTna/YQqtRRun0wQ3O7Fbey2u6oPNITbqr/knrDfWTm7mEr5pmdIkZ9phkIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q2FZTo9K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777404772;
	bh=POeKpNTUy4GRSYlEpg6+XWQEI2AgdpYdi/kKq7LYl3o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=q2FZTo9KJDfgjyi1MtsIa1VvCyRz26HEDDEx29jTVqGIfe8NCJKCt9LZ58GETh0z8
	 FZoicQMKI/DfkJMUXXH3kTJ4YZS3B9UNbNJQkXy44wKzNXOGiK9Z0yBel21MP0hQZ/
	 QSn+sb8TF3jsdbjcSJHfhvE5+Sdhc8r/1E101+QPPTDEO/wSv5B4tzxAvu9oBQVb3m
	 vqBG06rAaPbhZphA9eMzfxOVZUaf7uInudBcsKPrnyNarj++p7eQu5x7qnTkKismw7
	 Ci+EvE+08GfQqjm828/hXidOHwAexbfj78aBg4tvAnxJ588EWI98GmgsOSrPWqLBQ/
	 Gl3XFaBH4d9lA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BDF817E1513;
	Tue, 28 Apr 2026 21:32:49 +0200 (CEST)
Message-ID: <40adac60efafe7bfe31f6213a58783e733e806c5.camel@collabora.com>
Subject: Re: [PATCH 04/11] media: Add tgid and fd to the v4l2-requests trace
 fields
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt	 <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi	 <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, 	kernel@collabora.com
Date: Tue, 28 Apr 2026 15:32:48 -0400
In-Reply-To: <20260212162328.192217-5-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-5-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7j9lhMxeeKO2Yw1Vr0Ul"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4698D48B2A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59883-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]


--=-7j9lhMxeeKO2Yw1Vr0Ul
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> With these fields, userspace can better track which trace event matches
> with a given stream.
>=20
> Even though the trace shows the PID (based on current->tgid), trace
> functions could be called from other contexts, therefore showing the wron=
g
> PID, or none at all.
>=20
> These will ensure that the trace event can be matched with the PID/FD tha=
t
> opened and configured the video device file.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/test-drivers/visl/visl-dec.c |=C2=A0 68 +--
> =C2=A0include/trace/events/v4l2_requests.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 622 +++++++++++++--------
> =C2=A02 files changed, 439 insertions(+), 251 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/t=
est-drivers/visl/visl-dec.c
> index d49208e83726..fc216da17048 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -489,67 +489,71 @@ static void visl_tpg_fill(struct visl_ctx *ctx, str=
uct visl_run *run)
> =C2=A0static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run =
*run)
> =C2=A0{
> =C2=A0	int i;
> +	struct v4l2_fh *fh =3D &ctx->fh;
> =C2=A0
> =C2=A0	switch (ctx->current_codec) {
> =C2=A0	default:
> =C2=A0	case VISL_CODEC_NONE:
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_FWHT:
> -		trace_v4l2_ctrl_fwht_params(run->fwht.params);
> +		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, run->fwht.params);
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_MPEG2:
> -		trace_v4l2_ctrl_mpeg2_sequence(run->mpeg2.seq);
> -		trace_v4l2_ctrl_mpeg2_picture(run->mpeg2.pic);
> -		trace_v4l2_ctrl_mpeg2_quantisation(run->mpeg2.quant);
> +		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, run->mpeg2.seq);
> +		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, run->mpeg2.pic);
> +		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, run->mpeg2.quant)=
;
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_VP8:
> -		trace_v4l2_ctrl_vp8_frame(run->vp8.frame);
> -		trace_v4l2_ctrl_vp8_entropy(run->vp8.frame);
> +		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, run->vp8.frame);
> +		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, run->vp8.frame);
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_VP9:
> -		trace_v4l2_ctrl_vp9_frame(run->vp9.frame);
> -		trace_v4l2_ctrl_vp9_compressed_hdr(run->vp9.probs);
> -		trace_v4l2_ctrl_vp9_compressed_coeff(run->vp9.probs);
> -		trace_v4l2_vp9_mv_probs(&run->vp9.probs->mv);
> +		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, run->vp9.frame);
> +		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd, run->vp9.probs);
> +		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd, run->vp9.probs)=
;
> +		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &run->vp9.probs->mv);
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_H264:
> -		trace_v4l2_ctrl_h264_sps(run->h264.sps);
> -		trace_v4l2_ctrl_h264_pps(run->h264.pps);
> -		trace_v4l2_ctrl_h264_scaling_matrix(run->h264.sm);
> -		trace_v4l2_ctrl_h264_slice_params(run->h264.spram);
> +		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, run->h264.sps);
> +		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, run->h264.pps);
> +		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, run->h264.sm);
> +		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, run->h264.spram);
> =C2=A0
> =C2=A0		for (i =3D 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++=
)
> -			trace_v4l2_h264_ref_pic_list0(&run->h264.spram->ref_pic_list0[i], i);
> +			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &run->h264.spram->ref_pic_list0[i],=
 i);
> =C2=A0		for (i =3D 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++=
)
> -			trace_v4l2_h264_ref_pic_list1(&run->h264.spram->ref_pic_list1[i], i);
> +			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &run->h264.spram->ref_pic_list1[i],=
 i);
> =C2=A0
> -		trace_v4l2_ctrl_h264_decode_params(run->h264.dpram);
> +		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, run->h264.dpram);
> =C2=A0
> =C2=A0		for (i =3D 0; i < ARRAY_SIZE(run->h264.dpram->dpb); i++)
> -			trace_v4l2_h264_dpb_entry(&run->h264.dpram->dpb[i], i);
> +			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &run->h264.dpram->dpb[i],=
 i);
> =C2=A0
> -		trace_v4l2_ctrl_h264_pred_weights(run->h264.pwht);
> +		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, run->h264.pwht);
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_HEVC:
> -		trace_v4l2_ctrl_hevc_sps(run->hevc.sps);
> -		trace_v4l2_ctrl_hevc_pps(run->hevc.pps);
> -		trace_v4l2_ctrl_hevc_slice_params(run->hevc.spram);
> -		trace_v4l2_ctrl_hevc_scaling_matrix(run->hevc.sm);
> -		trace_v4l2_ctrl_hevc_decode_params(run->hevc.dpram);
> +		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, run->hevc.sps);
> +		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, run->hevc.pps);
> +		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, run->hevc.spram);
> +		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, run->hevc.sm);
> +		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, run->hevc.dpram);
> =C2=A0
> =C2=A0		for (i =3D 0; i < ARRAY_SIZE(run->hevc.dpram->dpb); i++)
> -			trace_v4l2_hevc_dpb_entry(&run->hevc.dpram->dpb[i]);
> +			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &run->hevc.dpram->dpb[i])=
;
> =C2=A0
> -		trace_v4l2_hevc_pred_weight_table(&run->hevc.spram->pred_weight_table)=
;
> -		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(run->hevc.rps_lt);
> -		trace_v4l2_ctrl_hevc_ext_sps_st_rps(run->hevc.rps_st);
> =C2=A0
> +		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
> +						=C2=A0 &run->hevc.spram->pred_weight_table);
> +		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(fh->tgid, fh->fd, run->hevc.rps_lt=
);
> +		trace_v4l2_ctrl_hevc_ext_sps_st_rps(fh->tgid, fh->fd, run->hevc.rps_st=
);
> =C2=A0		break;
> =C2=A0	case VISL_CODEC_AV1:
> -		trace_v4l2_ctrl_av1_sequence(run->av1.seq);
> -		trace_v4l2_ctrl_av1_frame(run->av1.frame);
> -		trace_v4l2_ctrl_av1_film_grain(run->av1.grain);
> -		trace_v4l2_ctrl_av1_tile_group_entry(run->av1.tge);
> +		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, run->av1.seq);
> +		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, run->av1.frame);
> +		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, run->av1.grain);
> +		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, run->av1.tge);
> =C2=A0		break;
> =C2=A0	}
> =C2=A0}
> diff --git a/include/trace/events/v4l2_requests.h b/include/trace/events/=
v4l2_requests.h
> index 34f4a74df5ea..ab6718f40e28 100644
> --- a/include/trace/events/v4l2_requests.h
> +++ b/include/trace/events/v4l2_requests.h
> @@ -10,12 +10,18 @@
> =C2=A0
> =C2=A0/* AV1 controls */
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_sequence, s)),
> -	TP_fast_assign(__entry->s =3D *s;),
> -	TP_printk("flags =3D %s, seq_profile =3D %u, order_hint_bits =3D %u, bi=
t_depth =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_sequence *s),
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_av1_sequence, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "flags =3D %s, seq_profile =3D %u, order_hint_bits =3D %u, bit_=
depth =3D %u, "
> =C2=A0		=C2=A0 "max_frame_width_minus_1 =3D %u, max_frame_height_minus_1 =
=3D %u",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_flags(__entry->s.flags, "|",
> =C2=A0		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
> =C2=A0		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK, "USE_128X1=
28_SUPERBLOCK"},
> @@ -46,11 +52,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
> -	TP_ARGS(t),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_tile_group_entry, =
t)),
> -	TP_fast_assign(__entry->t =3D *t;),
> -	TP_printk("tile_offset =3D %u, tile_size =3D %u, tile_row =3D %u, tile_=
col =3D %u",
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_tile_group_entry =
*t),
> +	TP_ARGS(tgid, fd, t),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_av1_tile_group_entry, t)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->t =3D *t;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "tile_offset =3D %u, tile_size =3D %u, tile_row =3D %u, tile_co=
l =3D %u",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->t.tile_offset,
> =C2=A0		=C2=A0 __entry->t.tile_size,
> =C2=A0		=C2=A0 __entry->t.tile_row,
> @@ -59,11 +71,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("tile_info.flags =3D %s, tile_info.context_update_tile_id =3D=
 %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_frame *f),
> +	TP_ARGS(tgid, fd, f),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_av1_frame, f)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->f =3D *f;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "tile_info.flags =3D %s, tile_info.context_update_tile_id =3D %=
u, "
> =C2=A0		=C2=A0 "tile_info.tile_cols =3D %u, tile_info.tile_rows =3D %u, "
> =C2=A0		=C2=A0 "tile_info.mi_col_starts =3D %s, tile_info.mi_row_starts =
=3D %s, "
> =C2=A0		=C2=A0 "tile_info.width_in_sbs_minus_1 =3D %s, tile_info.height_i=
n_sbs_minus_1 =3D %s, "
> @@ -87,6 +104,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
> =C2=A0		=C2=A0 "render_width_minus_1 =3D %u, render_height_minus_1 =3D %u=
, current_frame_id =3D %u, "
> =C2=A0		=C2=A0 "buffer_removal_time =3D %s, order_hints =3D %s, reference=
_frame_ts =3D %s, "
> =C2=A0		=C2=A0 "ref_frame_idx =3D %s, refresh_frame_flags =3D %u",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_flags(__entry->f.tile_info.flags, "|",
> =C2=A0		=C2=A0 {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING, "UNIFORM_TI=
LE_SPACING"}),
> =C2=A0		=C2=A0 __entry->f.tile_info.context_update_tile_id,
> @@ -222,11 +240,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
> =C2=A0
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_film_grain, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("flags =3D %s, cr_mult =3D %u, grain_seed =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_film_grain *f),
> +	TP_ARGS(tgid, fd, f),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_av1_film_grain, f)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->f =3D *f;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "flags =3D %s, cr_mult =3D %u, grain_seed =3D %u, "
> =C2=A0		=C2=A0 "film_grain_params_ref_idx =3D %u, num_y_points =3D %u, po=
int_y_value =3D %s, "
> =C2=A0		=C2=A0 "point_y_scaling =3D %s, num_cb_points =3D %u, point_cb_va=
lue =3D %s, "
> =C2=A0		=C2=A0 "point_cb_scaling =3D %s, num_cr_points =3D %u, point_cr_v=
alue =3D %s, "
> @@ -235,6 +258,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
> =C2=A0		=C2=A0 "ar_coeffs_cr_plus_128 =3D %s, ar_coeff_shift_minus_6 =3D =
%u, "
> =C2=A0		=C2=A0 "grain_scale_shift =3D %u, cb_mult =3D %u, cb_luma_mult =
=3D %u, cr_luma_mult =3D %u, "
> =C2=A0		=C2=A0 "cb_offset =3D %u, cr_offset =3D %u",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_flags(__entry->f.flags, "|",
> =C2=A0		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
> =C2=A0		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
> @@ -287,31 +311,32 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
> =C2=A0)
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_av1_seq_tmpl, v4l2_ctrl_av1_sequence,
> -	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_sequence *s),
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_av1_frame_tmpl, v4l2_ctrl_av1_frame,
> -	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
> -	TP_ARGS(f)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_frame *f),
> +	TP_ARGS(tgid, fd, f)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_av1_tge_tmpl, v4l2_ctrl_av1_tile_group_entry=
,
> -	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
> -	TP_ARGS(t)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_tile_group_entry =
*t),
> +	TP_ARGS(tgid, fd, t)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_av1_film_grain_tmpl, v4l2_ctrl_av1_film_grai=
n,
> -	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
> -	TP_ARGS(f)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_av1_film_grain *f),
> +	TP_ARGS(tgid, fd, f)
> =C2=A0);
> =C2=A0
> =C2=A0/* FWHT controls */
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_fwht_params *p),
> +	TP_ARGS(tgid, fd, p),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> =C2=A0			 __field(u64, backward_ref_ts)
> =C2=A0			 __field(u32, version)
> =C2=A0			 __field(u32, width)
> @@ -322,7 +347,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> =C2=A0			 __field(u32, ycbcr_enc)
> =C2=A0			 __field(u32, quantization)
> =C2=A0			 ),
> -	TP_fast_assign(
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->backward_ref_ts =3D=
 p->backward_ref_ts;
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->version =3D p->vers=
ion;
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->width =3D p->width;
> @@ -333,7 +359,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->ycbcr_enc =3D p->yc=
bcr_enc;
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->quantization =3D p-=
>quantization;
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ),
> -	TP_printk("backward_ref_ts =3D %llu, "
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "backward_ref_ts =3D %llu, "
> =C2=A0		=C2=A0 "version =3D %u, "
> =C2=A0		=C2=A0 "width =3D %u, "
> =C2=A0		=C2=A0 "height =3D %u, "
> @@ -342,6 +369,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> =C2=A0		=C2=A0 "xfer_func =3D %u, "
> =C2=A0		=C2=A0 "ycbcr_enc =3D %u, "
> =C2=A0		=C2=A0 "quantization =3D %u",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->backward_ref_ts, __entry->version, __entry->width=
, __entry->height,
> =C2=A0		=C2=A0 __print_flags(__entry->flags, "|",
> =C2=A0		=C2=A0 {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
> @@ -361,18 +389,23 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_fwht_params_tmpl, v4l2_ctrl_fwht_params,
> -	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> -	TP_ARGS(p)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_fwht_params *p),
> +	TP_ARGS(tgid, fd, p)
> =C2=A0);
> =C2=A0
> =C2=A0/* H264 controls */
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("profile_idc =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_sps *s),
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_h264_sps, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "profile_idc =3D %u, "
> =C2=A0		=C2=A0 "constraint_set_flags =3D %s, "
> =C2=A0		=C2=A0 "level_idc =3D %u, "
> =C2=A0		=C2=A0 "seq_parameter_set_id =3D %u, "
> @@ -390,6 +423,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
> =C2=A0		=C2=A0 "pic_width_in_mbs_minus1 =3D %u, "
> =C2=A0		=C2=A0 "pic_height_in_map_units_minus1 =3D %u, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->s.profile_idc,
> =C2=A0		=C2=A0 __print_flags(__entry->s.constraint_set_flags, "|",
> =C2=A0		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG=
"},
> @@ -427,11 +461,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
> -	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("pic_parameter_set_id =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pps *p),
> +	TP_ARGS(tgid, fd, p),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_h264_pps, p)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->p =3D *p),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "pic_parameter_set_id =3D %u, "
> =C2=A0		=C2=A0 "seq_parameter_set_id =3D %u, "
> =C2=A0		=C2=A0 "num_slice_groups_minus1 =3D %u, "
> =C2=A0		=C2=A0 "num_ref_idx_l0_default_active_minus1 =3D %u, "
> @@ -442,6 +481,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
> =C2=A0		=C2=A0 "chroma_qp_index_offset =3D %d, "
> =C2=A0		=C2=A0 "second_chroma_qp_index_offset =3D %d, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->p.pic_parameter_set_id,
> =C2=A0		=C2=A0 __entry->p.seq_parameter_set_id,
> =C2=A0		=C2=A0 __entry->p.num_slice_groups_minus1,
> @@ -465,11 +505,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matrix, s=
)),
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("scaling_list_4x4 =3D {%s}, scaling_list_8x8 =3D {%s}",
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_scaling_matrix *=
s),
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_h264_scaling_matrix, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "scaling_list_4x4 =3D {%s}, scaling_list_8x8 =3D {%s}",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> @@ -482,11 +528,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_t=
mpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights, p))=
,
> -	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("luma_log2_weight_denom =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pred_weights *p)=
,
> +	TP_ARGS(tgid, fd, p),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_h264_pred_weights, p)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->p =3D *p),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "luma_log2_weight_denom =3D %u, "
> =C2=A0		=C2=A0 "chroma_log2_weight_denom =3D %u, "
> =C2=A0		=C2=A0 "weight_factor[0].luma_weight =3D %s, "
> =C2=A0		=C2=A0 "weight_factor[0].luma_offset =3D %s, "
> @@ -496,6 +547,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
> =C2=A0		=C2=A0 "weight_factor[1].luma_offset =3D %s, "
> =C2=A0		=C2=A0 "weight_factor[1].chroma_weight =3D {%s}, "
> =C2=A0		=C2=A0 "weight_factor[1].chroma_offset =3D {%s}",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->p.luma_log2_weight_denom,
> =C2=A0		=C2=A0 __entry->p.chroma_log2_weight_denom,
> =C2=A0		=C2=A0 __print_array(__entry->p.weight_factors[0].luma_weight,
> @@ -530,11 +582,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmp=
l,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params, s))=
,
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("header_bit_size =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_slice_params *s)=
,
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_h264_slice_params, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "header_bit_size =3D %u, "
> =C2=A0		=C2=A0 "first_mb_in_slice =3D %u, "
> =C2=A0		=C2=A0 "slice_type =3D %s, "
> =C2=A0		=C2=A0 "colour_plane_id =3D %u, "
> @@ -548,6 +605,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
> =C2=A0		=C2=A0 "num_ref_idx_l0_active_minus1 =3D %u, "
> =C2=A0		=C2=A0 "num_ref_idx_l1_active_minus1 =3D %u, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->s.header_bit_size,
> =C2=A0		=C2=A0 __entry->s.first_mb_in_slice,
> =C2=A0		=C2=A0 __print_symbolic(__entry->s.slice_type,
> @@ -573,12 +631,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmp=
l,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
> -	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> -	TP_ARGS(r, i),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(tgid, fd, r, i),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_h264_reference, r)
> =C2=A0			 __field(int, i)),
> -	TP_fast_assign(__entry->r =3D *r; __entry->i =3D i;),
> -	TP_printk("[%d]: fields =3D %s, index =3D %u",
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->r =3D *r; __entry->i =3D=
 i;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "[%d]: fields =3D %s, index =3D %u",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->i,
> =C2=A0		=C2=A0 __print_flags(__entry->r.fields, "|",
> =C2=A0		=C2=A0 {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> @@ -589,11 +653,16 @@ DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> -	TP_ARGS(d),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_params, d)=
),
> -	TP_fast_assign(__entry->d =3D *d),
> -	TP_printk("nal_ref_idc =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_decode_params *d=
),
> +	TP_ARGS(tgid, fd, d),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_h264_decode_params, d)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->d =3D *d),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "nal_ref_idc =3D %u, "
> =C2=A0		=C2=A0 "frame_num =3D %u, "
> =C2=A0		=C2=A0 "top_field_order_cnt =3D %d, "
> =C2=A0		=C2=A0 "bottom_field_order_cnt =3D %d, "
> @@ -606,6 +675,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl=
,
> =C2=A0		=C2=A0 "pic_order_cnt_bit_size =3D %u, "
> =C2=A0		=C2=A0 "slice_group_change_cycle =3D %u, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->d.nal_ref_idc,
> =C2=A0		=C2=A0 __entry->d.frame_num,
> =C2=A0		=C2=A0 __entry->d.top_field_order_cnt,
> @@ -628,13 +698,19 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tm=
pl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
> -	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> -	TP_ARGS(e, i),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_dpb_entry *e, int i),
> +	TP_ARGS(tgid, fd, e, i),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_h264_dpb_entry, e)
> =C2=A0			 __field(int, i)),
> -	TP_fast_assign(__entry->e =3D *e; __entry->i =3D i;),
> -	TP_printk("[%d]: reference_ts =3D %llu, pic_num =3D %u, frame_num =3D %=
u, fields =3D %s "
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->e =3D *e; __entry->i =3D=
 i;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "[%d]: reference_ts =3D %llu, pic_num =3D %u, frame_num =3D %u,=
 fields =3D %s, "
> =C2=A0		=C2=A0 "top_field_order_cnt =3D %d, bottom_field_order_cnt =3D %d=
, flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->i,
> =C2=A0		=C2=A0 __entry->e.reference_ts,
> =C2=A0		=C2=A0 __entry->e.pic_num,
> @@ -654,58 +730,63 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_h264_sps_tmpl, v4l2_ctrl_h264_sps,
> -	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_sps *s),
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_h264_pps_tmpl, v4l2_ctrl_h264_pps,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> -	TP_ARGS(p)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pps *p),
> +	TP_ARGS(tgid, fd, p)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_h264_scaling_matrix_tmpl, v4l2_ctrl_h264_sca=
ling_matrix,
> -	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_scaling_matrix *=
s),
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_h264_pred_weights_tmpl, v4l2_ctrl_h264_pred_=
weights,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> -	TP_ARGS(p)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_pred_weights *p)=
,
> +	TP_ARGS(tgid, fd, p)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_h264_slice_params_tmpl, v4l2_ctrl_h264_slice=
_params,
> -	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_slice_params *s)=
,
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list0,
> -	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> -	TP_ARGS(r, i)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(tgid, fd, r, i)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list1,
> -	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> -	TP_ARGS(r, i)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(tgid, fd, r, i)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_h264_decode_params_tmpl, v4l2_ctrl_h264_deco=
de_params,
> -	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> -	TP_ARGS(d)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_h264_decode_params *d=
),
> +	TP_ARGS(tgid, fd, d)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_h264_dpb_entry_tmpl, v4l2_h264_dpb_entry,
> -	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> -	TP_ARGS(e, i)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_h264_dpb_entry *e, int i),
> +	TP_ARGS(tgid, fd, e, i)
> =C2=A0);
> =C2=A0
> =C2=A0/* HEVC controls */
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_sps, s)),
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("video_parameter_set_id =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_sps *s),
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_hevc_sps, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "video_parameter_set_id =3D %u, "
> =C2=A0		=C2=A0 "seq_parameter_set_id =3D %u, "
> =C2=A0		=C2=A0 "pic_width_in_luma_samples =3D %u, "
> =C2=A0		=C2=A0 "pic_height_in_luma_samples =3D %u, "
> @@ -730,6 +811,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
> =C2=A0		=C2=A0 "chroma_format_idc =3D %u, "
> =C2=A0		=C2=A0 "sps_max_sub_layers_minus1 =3D %u, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->s.video_parameter_set_id,
> =C2=A0		=C2=A0 __entry->s.seq_parameter_set_id,
> =C2=A0		=C2=A0 __entry->s.pic_width_in_luma_samples,
> @@ -770,11 +852,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
> =C2=A0
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_pps, p)),
> -	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("pic_parameter_set_id =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_pps *p),
> +	TP_ARGS(tgid, fd, p),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_hevc_pps, p)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->p =3D *p),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "pic_parameter_set_id =3D %u, "
> =C2=A0		=C2=A0 "num_extra_slice_header_bits =3D %u, "
> =C2=A0		=C2=A0 "num_ref_idx_l0_default_active_minus1 =3D %u, "
> =C2=A0		=C2=A0 "num_ref_idx_l1_default_active_minus1 =3D %u, "
> @@ -790,6 +877,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
> =C2=A0		=C2=A0 "pps_tc_offset_div2 =3D %d, "
> =C2=A0		=C2=A0 "log2_parallel_merge_level_minus2 =3D %u, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->p.pic_parameter_set_id,
> =C2=A0		=C2=A0 __entry->p.num_extra_slice_header_bits,
> =C2=A0		=C2=A0 __entry->p.num_ref_idx_l0_default_active_minus1,
> @@ -837,11 +925,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
> =C2=A0
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_slice_params, s))=
,
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("bit_size =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_slice_params *s)=
,
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_hevc_slice_params, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "bit_size =3D %u, "
> =C2=A0		=C2=A0 "data_byte_offset =3D %u, "
> =C2=A0		=C2=A0 "num_entry_point_offsets =3D %u, "
> =C2=A0		=C2=A0 "nal_unit_type =3D %u, "
> @@ -868,6 +961,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
> =C2=A0		=C2=A0 "short_term_ref_pic_set_size =3D %u, "
> =C2=A0		=C2=A0 "long_term_ref_pic_set_size =3D %u, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->s.bit_size,
> =C2=A0		=C2=A0 __entry->s.data_byte_offset,
> =C2=A0		=C2=A0 __entry->s.num_entry_point_offsets,
> @@ -914,11 +1008,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tm=
pl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
> -	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_pred_weight_table, p))=
,
> -	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("delta_luma_weight_l0 =3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_pred_weight_table *p)=
,
> +	TP_ARGS(tgid, fd, p),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_hevc_pred_weight_table, p)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->p =3D *p),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "delta_luma_weight_l0 =3D %s, "
> =C2=A0		=C2=A0 "luma_offset_l0 =3D %s, "
> =C2=A0		=C2=A0 "delta_chroma_weight_l0 =3D {%s}, "
> =C2=A0		=C2=A0 "chroma_offset_l0 =3D {%s}, "
> @@ -928,6 +1027,7 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl=
,
> =C2=A0		=C2=A0 "chroma_offset_l1 =3D {%s}, "
> =C2=A0		=C2=A0 "luma_log2_weight_denom =3D %d, "
> =C2=A0		=C2=A0 "delta_chroma_log2_weight_denom =3D %d",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_array(__entry->p.delta_luma_weight_l0,
> =C2=A0				ARRAY_SIZE(__entry->p.delta_luma_weight_l0),
> =C2=A0				sizeof(__entry->p.delta_luma_weight_l0[0])),
> @@ -962,16 +1062,22 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tm=
pl,
> =C2=A0	))
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s=
)),
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("scaling_list_4x4 =3D {%s}, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_scaling_matrix *=
s),
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "scaling_list_4x4 =3D {%s}, "
> =C2=A0		=C2=A0 "scaling_list_8x8 =3D {%s}, "
> =C2=A0		=C2=A0 "scaling_list_16x16 =3D {%s}, "
> =C2=A0		=C2=A0 "scaling_list_32x32 =3D {%s}, "
> =C2=A0		=C2=A0 "scaling_list_dc_coef_16x16 =3D %s, "
> =C2=A0		=C2=A0 "scaling_list_dc_coef_32x32 =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> @@ -997,11 +1103,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_=
tmpl,
> =C2=A0	))
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
> -	TP_ARGS(d),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_decode_params, d)=
),
> -	TP_fast_assign(__entry->d =3D *d),
> -	TP_printk("pic_order_cnt_val =3D %d, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_decode_params *d=
),
> +	TP_ARGS(tgid, fd, d),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_hevc_decode_params, d)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->d =3D *d),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "pic_order_cnt_val =3D %d, "
> =C2=A0		=C2=A0 "short_term_ref_pic_set_size =3D %u, "
> =C2=A0		=C2=A0 "long_term_ref_pic_set_size =3D %u, "
> =C2=A0		=C2=A0 "num_active_dpb_entries =3D %u, "
> @@ -1012,6 +1123,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tm=
pl,
> =C2=A0		=C2=A0 "poc_st_curr_after =3D %s, "
> =C2=A0		=C2=A0 "poc_lt_curr =3D %s, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->d.pic_order_cnt_val,
> =C2=A0		=C2=A0 __entry->d.short_term_ref_pic_set_size,
> =C2=A0		=C2=A0 __entry->d.long_term_ref_pic_set_size,
> @@ -1036,12 +1148,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_=
tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> -	TP_ARGS(lt),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, l=
t)),
> -	TP_fast_assign(__entry->lt =3D *lt),
> -	TP_printk("flags =3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_lt_rps *=
lt),
> +	TP_ARGS(tgid, fd, lt),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, lt)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->lt =3D *lt),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "flags =3D %s, "
> =C2=A0		=C2=A0 "lt_ref_pic_poc_lsb_sps =3D %x",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_flags(__entry->lt.flags, "|",
> =C2=A0		=C2=A0 {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
> =C2=A0		=C2=A0 ),
> @@ -1050,11 +1168,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps=
_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> -	TP_ARGS(st),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, s=
t)),
> -	TP_fast_assign(__entry->st =3D *st),
> -	TP_printk("flags =3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_st_rps *=
st),
> +	TP_ARGS(tgid, fd, st),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, st)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->st =3D *st),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "flags =3D %s, "
> =C2=A0		=C2=A0 "delta_idx_minus1 =3D %u, "
> =C2=A0		=C2=A0 "delta_rps_sign =3D %u, "
> =C2=A0		=C2=A0 "abs_delta_rps_minus1 =3D %u, "
> @@ -1064,6 +1187,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_t=
mpl,
> =C2=A0		=C2=A0 "use_delta_flag =3D %08x, "
> =C2=A0		=C2=A0 "delta_poc_s0_minus1 =3D %s, "
> =C2=A0		=C2=A0 "delta_poc_s1_minus1 =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_flags(__entry->st.flags, "|",
> =C2=A0		=C2=A0 {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "IN=
TER_REF_PIC_SET_PRED"}
> =C2=A0		=C2=A0 ),
> @@ -1084,14 +1208,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps=
_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
> -	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> -	TP_ARGS(e),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_dpb_entry, e)),
> -	TP_fast_assign(__entry->e =3D *e),
> -	TP_printk("timestamp =3D %llu, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_dpb_entry *e),
> +	TP_ARGS(tgid, fd, e),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_hevc_dpb_entry, e)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->e =3D *e),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "timestamp =3D %llu, "
> =C2=A0		=C2=A0 "flags =3D %s, "
> =C2=A0		=C2=A0 "field_pic =3D %u, "
> =C2=A0		=C2=A0 "pic_order_cnt_val =3D %d",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		__entry->e.timestamp,
> =C2=A0		__print_flags(__entry->e.flags, "|",
> =C2=A0		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE, "LONG_TERM_REFERENCE"}
> @@ -1101,59 +1231,65 @@ DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
> =C2=A0	))
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_hevc_sps_tmpl, v4l2_ctrl_hevc_sps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_sps *s),
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_hevc_pps_tmpl, v4l2_ctrl_hevc_pps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
> -	TP_ARGS(p)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_pps *p),
> +	TP_ARGS(tgid, fd, p)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_hevc_slice_params_tmpl, v4l2_ctrl_hevc_slice=
_params,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_slice_params *s)=
,
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_hevc_pred_weight_table_tmpl, v4l2_hevc_pred_weigh=
t_table,
> -	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
> -	TP_ARGS(p)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_pred_weight_table *p)=
,
> +	TP_ARGS(tgid, fd, p)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_hevc_scaling_matrix_tmpl, v4l2_ctrl_hevc_sca=
ling_matrix,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_scaling_matrix *=
s),
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_hevc_decode_params_tmpl, v4l2_ctrl_hevc_deco=
de_params,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
> -	TP_ARGS(d)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_decode_params *d=
),
> +	TP_ARGS(tgid, fd, d)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl, v4l2_ctrl_hevc_ext=
_sps_lt_rps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> -	TP_ARGS(lt)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_lt_rps *=
lt),
> +	TP_ARGS(tgid, fd, lt)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl, v4l2_ctrl_hevc_ext=
_sps_st_rps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> -	TP_ARGS(st)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_hevc_ext_sps_st_rps *=
st),
> +	TP_ARGS(tgid, fd, st)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
> -	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> -	TP_ARGS(e)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_hevc_dpb_entry *e),
> +	TP_ARGS(tgid, fd, e)
> =C2=A0);
> =C2=A0
> =C2=A0/* MPEG2 controls */
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
> -	TP_fast_assign(__entry->s =3D *s;),
> -	TP_printk("horizontal_size =3D %u, vertical_size =3D %u, vbv_buffer_siz=
e =3D %u, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(tgid, fd, s),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->s =3D *s;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "horizontal_size =3D %u, vertical_size =3D %u, vbv_buffer_size =
=3D %u, "
> =C2=A0		=C2=A0 "profile_and_level_indication =3D %u, chroma_format =3D %u=
, flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->s.horizontal_size,
> =C2=A0		=C2=A0 __entry->s.vertical_size,
> =C2=A0		=C2=A0 __entry->s.vbv_buffer_size,
> @@ -1165,12 +1301,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
> -	TP_fast_assign(__entry->p =3D *p;),
> -	TP_printk("backward_ref_ts =3D %llu, forward_ref_ts =3D %llu, flags =3D=
 %s, f_code =3D {%s}, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_picture *p),
> +	TP_ARGS(tgid, fd, p),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->p =3D *p;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "backward_ref_ts =3D %llu, forward_ref_ts =3D %llu, flags =3D %=
s, f_code =3D {%s}, "
> =C2=A0		=C2=A0 "picture_coding_type =3D %u, picture_structure =3D %u, int=
ra_dc_precision =3D %u",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __entry->p.backward_ref_ts,
> =C2=A0		=C2=A0 __entry->p.forward_ref_ts,
> =C2=A0		=C2=A0 __print_flags(__entry->p.flags, "|",
> @@ -1193,12 +1335,18 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> -	TP_ARGS(q),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)=
),
> -	TP_fast_assign(__entry->q =3D *q;),
> -	TP_printk("intra_quantiser_matrix =3D %s, non_intra_quantiser_matrix =
=3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_quantisation *q=
),
> +	TP_ARGS(tgid, fd, q),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->q =3D *q;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "intra_quantiser_matrix =3D %s, non_intra_quantiser_matrix =3D =
%s, "
> =C2=A0		=C2=A0 "chroma_intra_quantiser_matrix =3D %s, chroma_non_intra_qu=
antiser_matrix =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_array(__entry->q.intra_quantiser_matrix,
> =C2=A0				ARRAY_SIZE(__entry->q.intra_quantiser_matrix),
> =C2=A0				sizeof(__entry->q.intra_quantiser_matrix[0])),
> @@ -1215,31 +1363,37 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
> =C2=A0)
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_mpeg2_seq_tmpl, v4l2_ctrl_mpeg2_sequence,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> -	TP_ARGS(s)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(tgid, fd, s)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_mpeg2_pic_tmpl, v4l2_ctrl_mpeg2_picture,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> -	TP_ARGS(p)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_picture *p),
> +	TP_ARGS(tgid, fd, p)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_mpeg2_quant_tmpl, v4l2_ctrl_mpeg2_quantisati=
on,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> -	TP_ARGS(q)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_mpeg2_quantisation *q=
),
> +	TP_ARGS(tgid, fd, q)
> =C2=A0);
> =C2=A0
> =C2=A0/* VP8 controls */
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("entropy.coeff_probs =3D {%s}, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(tgid, fd, f),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_vp8_frame, f)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->f =3D *f;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "entropy.coeff_probs =3D {%s}, "
> =C2=A0		=C2=A0 "entropy.y_mode_probs =3D %s, "
> =C2=A0		=C2=A0 "entropy.uv_mode_probs =3D %s, "
> =C2=A0		=C2=A0 "entropy.mv_probs =3D {%s}",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->f.entropy.coeff_probs,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->f.entropy.coeff_probs),
> @@ -1258,11 +1412,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
> =C2=A0)
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("segment.quant_update =3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(tgid, fd, f),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_vp8_frame, f)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->f =3D *f;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "segment.quant_update =3D %s, "
> =C2=A0		=C2=A0 "segment.lf_update =3D %s, "
> =C2=A0		=C2=A0 "segment.segment_probs =3D %s, "
> =C2=A0		=C2=A0 "segment.flags =3D %s, "
> @@ -1297,6 +1456,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
> =C2=A0		=C2=A0 "golden_frame_ts =3D %llu, "
> =C2=A0		=C2=A0 "alt_frame_ts =3D %llu, "
> =C2=A0		=C2=A0 "flags =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_array(__entry->f.segment.quant_update,
> =C2=A0				ARRAY_SIZE(__entry->f.segment.quant_update),
> =C2=A0				sizeof(__entry->f.segment.quant_update[0])),
> @@ -1361,23 +1521,28 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_vp8_frame_tmpl, v4l2_ctrl_vp8_frame,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(tgid, fd, f)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_vp8_entropy_tmpl, v4l2_ctrl_vp8_entropy,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(tgid, fd, f)
> =C2=A0);
> =C2=A0
> =C2=A0/* VP9 controls */
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("lf.ref_deltas =3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_frame *f),
> +	TP_ARGS(tgid, fd, f),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_vp9_frame, f)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->f =3D *f;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "lf.ref_deltas =3D %s, "
> =C2=A0		=C2=A0 "lf.mode_deltas =3D %s, "
> =C2=A0		=C2=A0 "lf.level =3D %u, "
> =C2=A0		=C2=A0 "lf.sharpness =3D %u, "
> @@ -1410,6 +1575,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
> =C2=A0		=C2=A0 "tile_cols_log2 =3D %u, "
> =C2=A0		=C2=A0 "tile_rows_log_2 =3D %u, "
> =C2=A0		=C2=A0 "reference_mode =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_array(__entry->f.lf.ref_deltas,
> =C2=A0				ARRAY_SIZE(__entry->f.lf.ref_deltas),
> =C2=A0				sizeof(__entry->f.lf.ref_deltas[0])),
> @@ -1490,11 +1656,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)=
),
> -	TP_fast_assign(__entry->h =3D *h;),
> -	TP_printk("tx_mode =3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h=
),
> +	TP_ARGS(tgid, fd, h),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->h =3D *h;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "tx_mode =3D %s, "
> =C2=A0		=C2=A0 "tx8 =3D {%s}, "
> =C2=A0		=C2=A0 "tx16 =3D {%s}, "
> =C2=A0		=C2=A0 "tx32 =3D {%s}, "
> @@ -1508,6 +1679,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tm=
pl,
> =C2=A0		=C2=A0 "y_mode =3D {%s}, "
> =C2=A0		=C2=A0 "uv_mode =3D {%s}, "
> =C2=A0		=C2=A0 "partition =3D {%s}",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_symbolic(__entry->h.tx_mode,
> =C2=A0		=C2=A0 {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
> =C2=A0		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
> @@ -1566,11 +1738,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_=
tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)=
),
> -	TP_fast_assign(__entry->h =3D *h;),
> -	TP_printk("coef =3D {%s}",
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h=
),
> +	TP_ARGS(tgid, fd, h),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->h =3D *h;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "coef =3D {%s}",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->h.coef,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->h.coef),
> @@ -1579,11 +1757,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef=
_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
> -	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
> -	TP_fast_assign(__entry->p =3D *p;),
> -	TP_printk("joint =3D %s, "
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_vp9_mv_probs *p),
> +	TP_ARGS(tgid, fd, p),
> +	TP_STRUCT__entry(__field(u32, tgid)
> +			 __field(u32, fd)
> +			 __field_struct(struct v4l2_vp9_mv_probs, p)),
> +	TP_fast_assign(__entry->tgid =3D tgid;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fd =3D fd;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->p =3D *p;),
> +	TP_printk("tgid =3D %u, fd =3D %u, "
> +		=C2=A0 "joint =3D %s, "
> =C2=A0		=C2=A0 "sign =3D %s, "
> =C2=A0		=C2=A0 "classes =3D {%s}, "
> =C2=A0		=C2=A0 "class0_bit =3D %s, "
> @@ -1592,6 +1775,7 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
> =C2=A0		=C2=A0 "fr =3D {%s}, "
> =C2=A0		=C2=A0 "class0_hp =3D %s, "
> =C2=A0		=C2=A0 "hp =3D %s",
> +		=C2=A0 __entry->tgid, __entry->fd,
> =C2=A0		=C2=A0 __print_array(__entry->p.joint,
> =C2=A0				ARRAY_SIZE(__entry->p.joint),
> =C2=A0				sizeof(__entry->p.joint[0])),
> @@ -1627,24 +1811,24 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_vp9_frame_tmpl, v4l2_ctrl_vp9_frame,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> -	TP_ARGS(f)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_frame *f),
> +	TP_ARGS(tgid, fd, f)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_vp9_compressed_hdr_tmpl, v4l2_ctrl_vp9_compr=
essed_hdr,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h=
),
> +	TP_ARGS(tgid, fd, h)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_ctrl_vp9_compressed_coef_tmpl, v4l2_ctrl_vp9_comp=
ressed_coeff,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_ctrl_vp9_compressed_hdr *h=
),
> +	TP_ARGS(tgid, fd, h)
> =C2=A0);
> =C2=A0
> =C2=A0
> =C2=A0DEFINE_EVENT(v4l2_vp9_mv_probs_tmpl, v4l2_vp9_mv_probs,
> -	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> -	TP_ARGS(p)
> +	TP_PROTO(u32 tgid, u32 fd, const struct v4l2_vp9_mv_probs *p),
> +	TP_ARGS(tgid, fd, p)
> =C2=A0);
> =C2=A0
> =C2=A0#endif /* if !defined(_TRACE_V4L2_REQUESTS_H_) || defined(TRACE_HEA=
DER_MULTI_READ) */

--=-7j9lhMxeeKO2Yw1Vr0Ul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafELYAAKCRDZQZRRKWBy
9AdgAQDc/Mxdjp9QtijbNMumRKl6PppQl2nBIzfE7sWpYiLqswEApUC3N3aVCgsx
CuQ3aSR2mut6btuavOcVzHeuxqSObAs=
=FObS
-----END PGP SIGNATURE-----

--=-7j9lhMxeeKO2Yw1Vr0Ul--

