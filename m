Return-Path: <linux-media+bounces-59886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIfyNvMM8Wn1cAEAu9opvQ
	(envelope-from <linux-media+bounces-59886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:39:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050148B39E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D27D3043FAA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3FB383C8D;
	Tue, 28 Apr 2026 19:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KKFlcS6p"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCC12C3261;
	Tue, 28 Apr 2026 19:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405078; cv=none; b=k3IpW+YE6NV/omFSbCTIVINtcPWhGx2ZXOP9E6HTNacl5gpqPIVxUU3LJZLmF3YmJ997aG1a2HG+5NY4CnoA3xWkYQJTy5taS1QSLY97ZjlJiTZBZ/t2e+/v7NxTDIzRbcbqqcJ6rgr3xtRNaRDJ40E9Glz/VrMhF2rcPtp5FTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405078; c=relaxed/simple;
	bh=w04KraqrEDnl1v5OZUgLugNxM8s1M0I+c4O2qQd85NY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SXKGVb6krtwrhAU6DAotZSqK/vLHQXTvl8yOVivZc88qQYRTODDvxTVWUtcMD+rDPr8M0phAdv6RxUxDOdJAZjadGA6iWP9bXDnroK9hFDlJBpmfkiwX8WWE9FSSZN1kICBtjrQcMMePLDgotp55F8OTyaE1OEGDrKiGbSnBp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KKFlcS6p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777405074;
	bh=w04KraqrEDnl1v5OZUgLugNxM8s1M0I+c4O2qQd85NY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KKFlcS6pYFz8kevj2mWXd6zItSNH5+rzku6I+tuvkmFhhNKx1NmOCSnEQLEreqS9S
	 Ov6PKkNrORzC2nsymIOpuCY2vQElVWoAR7zNKslXEVz9pgvthea9jRw2tYf341ioK2
	 N1gfNq89AKMFK0fMFPWgg6uaL33nrQaShS21oIzbvg0JyE5Y9d1k/SxDzKZwKnS9kL
	 PQomnbKAt0Ld7lasdgPdpEZ9gsUhzxE+WBrsfqtt5HMKi0duSAPytoYXkaOvOB70x6
	 GcLXBfx5tiTkd1oym+dI1VYdirBlDs0IuuLWb6GXlrXei3P9D8OusIMR9GgTnhK9/M
	 Kcg+7qzqQZd+g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE95517E0615;
	Tue, 28 Apr 2026 21:37:51 +0200 (CEST)
Message-ID: <7ef9872a26789a73d232e0091ffc79e9369cf4ff.camel@collabora.com>
Subject: Re: [PATCH 06/11] media: Trace the stateless controls when set in
 v4l2-ctrls-core.c
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
Date: Tue, 28 Apr 2026 15:37:51 -0400
In-Reply-To: <20260212162328.192217-7-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-7-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-6/kjwuzd33VbGR6NlGU/"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4050148B39E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59886-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--=-6/kjwuzd33VbGR6NlGU/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> Also remove the trace from visl as the generic v4l2-requests traces can
> now be used instead.
>=20
> It allows all stateless drivers to inherit traceability, with just a smal=
l
> overhead when disabled in userspace.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/test-drivers/visl/visl-dec.c |=C2=A0 74 -------------
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-api.c=C2=A0=C2=A0 |=C2=A0 10 ++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c=C2=A0 | 114 +++++++++++++=
++++++++
> =C2=A0include/media/v4l2-ctrls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +++
> =C2=A04 files changed, 139 insertions(+), 74 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/t=
est-drivers/visl/visl-dec.c
> index fc216da17048..9517830fb3e8 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -12,7 +12,6 @@
> =C2=A0#include <linux/workqueue.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/tpg/v4l2-tpg.h>
> -#include <trace/events/v4l2_requests.h>
> =C2=A0
> =C2=A0#define LAST_BUF_IDX (V4L2_AV1_REF_LAST_FRAME - V4L2_AV1_REF_LAST_F=
RAME)
> =C2=A0#define LAST2_BUF_IDX (V4L2_AV1_REF_LAST2_FRAME - V4L2_AV1_REF_LAST=
_FRAME)
> @@ -486,78 +485,6 @@ static void visl_tpg_fill(struct visl_ctx *ctx, stru=
ct visl_run *run)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run *run)
> -{
> -	int i;
> -	struct v4l2_fh *fh =3D &ctx->fh;
> -
> -	switch (ctx->current_codec) {
> -	default:
> -	case VISL_CODEC_NONE:
> -		break;
> -	case VISL_CODEC_FWHT:
> -		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, run->fwht.params);
> -		break;
> -	case VISL_CODEC_MPEG2:
> -		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, run->mpeg2.seq);
> -		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, run->mpeg2.pic);
> -		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, run->mpeg2.quant)=
;
> -		break;
> -	case VISL_CODEC_VP8:
> -		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, run->vp8.frame);
> -		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, run->vp8.frame);
> -		break;
> -	case VISL_CODEC_VP9:
> -		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, run->vp9.frame);
> -		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd, run->vp9.probs);
> -		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd, run->vp9.probs)=
;
> -		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &run->vp9.probs->mv);
> -		break;
> -	case VISL_CODEC_H264:
> -		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, run->h264.sps);
> -		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, run->h264.pps);
> -		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, run->h264.sm);
> -		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, run->h264.spram);
> -
> -		for (i =3D 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
> -			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &run->h264.spram->ref_pic_list0[i],=
 i);
> -		for (i =3D 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
> -			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &run->h264.spram->ref_pic_list1[i],=
 i);
> -
> -		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, run->h264.dpram);
> -
> -		for (i =3D 0; i < ARRAY_SIZE(run->h264.dpram->dpb); i++)
> -			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &run->h264.dpram->dpb[i],=
 i);
> -
> -		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, run->h264.pwht);
> -		break;
> -	case VISL_CODEC_HEVC:
> -		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, run->hevc.sps);
> -		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, run->hevc.pps);
> -		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, run->hevc.spram);
> -		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, run->hevc.sm);
> -		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, run->hevc.dpram);
> -
> -		for (i =3D 0; i < ARRAY_SIZE(run->hevc.dpram->dpb); i++)
> -			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &run->hevc.dpram->dpb[i])=
;
> -
> -
> -		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
> -						=C2=A0 &run->hevc.spram->pred_weight_table);
> -		trace_v4l2_ctrl_hevc_ext_sps_lt_rps(fh->tgid, fh->fd, run->hevc.rps_lt=
);
> -		trace_v4l2_ctrl_hevc_ext_sps_st_rps(fh->tgid, fh->fd, run->hevc.rps_st=
);
> -		break;
> -	case VISL_CODEC_AV1:
> -		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, run->av1.seq);
> -		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, run->av1.frame);
> -		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, run->av1.grain);
> -		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, run->av1.tge);
> -		break;
> -	}
> -}
> -
> =C2=A0void visl_device_run(void *priv)
> =C2=A0{
> =C2=A0	struct visl_ctx *ctx =3D priv;
> @@ -634,7 +561,6 @@ void visl_device_run(void *priv)
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 run.dst->sequence, run.dst->vb2_bu=
f.timestamp);
> =C2=A0
> =C2=A0	visl_tpg_fill(ctx, &run);
> -	visl_trace_ctrls(ctx, &run);
> =C2=A0
> =C2=A0	if (bitstream_trace_frame_start > -1 &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 run.dst->sequence >=3D bitstream_trace_frame_st=
art &&
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l=
2-core/v4l2-ctrls-api.c
> index 0078a04c5445..8a814eec7a30 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
> @@ -524,6 +524,12 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, =
struct video_device *vdev,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(v4l2_g_ext_ctrls);
> =C2=A0
> +static void trace_ext_ctrl(struct v4l2_fh *fh, const struct v4l2_ctrl *c=
trl)
> +{
> +	if (ctrl->type_ops->trace)
> +		ctrl->type_ops->trace(fh, ctrl, ctrl->p_cur);
> +}
> +
> =C2=A0/* Validate a new control */
> =C2=A0static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ct=
rl_ptr p_new)
> =C2=A0{
> @@ -713,6 +719,10 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
> =C2=A0				idx =3D helpers[idx].next;
> =C2=A0			} while (!ret && idx);
> =C2=A0		}
> +
> +		if (set)
> +			trace_ext_ctrl(fh, master);
> +
> =C2=A0		v4l2_ctrl_unlock(master);
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 79a157975f70..6165e36d8879 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -10,8 +10,11 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <media/v4l2-ctrls.h>
> =C2=A0#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> =C2=A0#include <media/v4l2-fwnode.h>
> =C2=A0
> +#include <trace/events/v4l2_requests.h>
> +
> =C2=A0#include "v4l2-ctrls-priv.h"
> =C2=A0
> =C2=A0static const union v4l2_ctrl_ptr ptr_null;
> @@ -1462,12 +1465,123 @@ int v4l2_ctrl_type_op_validate(const struct v4l2=
_ctrl *ctrl,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
> =C2=A0
> +void v4l2_ctrl_type_op_trace(const struct v4l2_fh *fh,
> +				=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr=
 ptr)
> +{
> +	int i =3D 0;
> +
> +	switch ((u32)ctrl->type) {
> +	case V4L2_CTRL_TYPE_FWHT_PARAMS:
> +		trace_v4l2_ctrl_fwht_params(fh->tgid, fh->fd, ptr.p_fwht_params);
> +		break;
> +	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
> +		trace_v4l2_ctrl_mpeg2_sequence(fh->tgid, fh->fd, ptr.p_mpeg2_sequence)=
;
> +		break;
> +	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
> +		trace_v4l2_ctrl_mpeg2_picture(fh->tgid, fh->fd, ptr.p_mpeg2_picture);
> +		break;
> +	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
> +		trace_v4l2_ctrl_mpeg2_quantisation(fh->tgid, fh->fd, ptr.p_mpeg2_quant=
isation);
> +		break;
> +	case V4L2_CTRL_TYPE_VP8_FRAME:
> +		trace_v4l2_ctrl_vp8_frame(fh->tgid, fh->fd, ptr.p_vp8_frame);
> +		trace_v4l2_ctrl_vp8_entropy(fh->tgid, fh->fd, ptr.p_vp8_frame);
> +		break;
> +	case V4L2_CTRL_TYPE_VP9_FRAME:
> +		trace_v4l2_ctrl_vp9_frame(fh->tgid, fh->fd, ptr.p_vp9_frame);
> +		break;
> +	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
> +		trace_v4l2_ctrl_vp9_compressed_hdr(fh->tgid, fh->fd,
> +						=C2=A0=C2=A0 ptr.p_vp9_compressed_hdr_probs);
> +		trace_v4l2_ctrl_vp9_compressed_coeff(fh->tgid, fh->fd,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ptr.p_vp9_compressed_hdr_probs);
> +		trace_v4l2_vp9_mv_probs(fh->tgid, fh->fd, &ptr.p_vp9_compressed_hdr_pr=
obs->mv);
> +		break;
> +	case V4L2_CTRL_TYPE_H264_SPS:
> +		trace_v4l2_ctrl_h264_sps(fh->tgid, fh->fd, ptr.p_h264_sps);
> +		break;
> +	case V4L2_CTRL_TYPE_H264_PPS:
> +		trace_v4l2_ctrl_h264_pps(fh->tgid, fh->fd, ptr.p_h264_pps);
> +		break;
> +	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> +		trace_v4l2_ctrl_h264_scaling_matrix(fh->tgid, fh->fd, ptr.p_h264_scali=
ng_matrix);
> +		break;
> +	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
> +	{
> +		struct v4l2_ctrl_h264_slice_params *sp =3D ptr.p_h264_slice_params;
> +
> +		trace_v4l2_ctrl_h264_slice_params(fh->tgid, fh->fd, sp);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(sp->ref_pic_list0); i++)
> +			trace_v4l2_h264_ref_pic_list0(fh->tgid, fh->fd, &sp->ref_pic_list0[i]=
, i);
> +		for (i =3D 0; i < ARRAY_SIZE(sp->ref_pic_list1); i++)
> +			trace_v4l2_h264_ref_pic_list1(fh->tgid, fh->fd, &sp->ref_pic_list1[i]=
, i);
> +
> +		break;
> +	}
> +	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
> +	{
> +		struct v4l2_ctrl_h264_decode_params *dp =3D ptr.p_h264_decode_params;
> +
> +		trace_v4l2_ctrl_h264_decode_params(fh->tgid, fh->fd, dp);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(dp->dpb); i++)
> +			trace_v4l2_h264_dpb_entry(fh->tgid, fh->fd, &dp->dpb[i], i);
> +
> +		break;
> +	}
> +	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
> +		trace_v4l2_ctrl_h264_pred_weights(fh->tgid, fh->fd, ptr.p_h264_pred_we=
ights);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_SPS:
> +		trace_v4l2_ctrl_hevc_sps(fh->tgid, fh->fd, ptr.p_hevc_sps);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_PPS:
> +		trace_v4l2_ctrl_hevc_pps(fh->tgid, fh->fd, ptr.p_hevc_pps);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> +		trace_v4l2_ctrl_hevc_slice_params(fh->tgid, fh->fd, ptr.p_hevc_slice_p=
arams);
> +		trace_v4l2_hevc_pred_weight_table(fh->tgid, fh->fd,
> +						=C2=A0 &ptr.p_hevc_slice_params->pred_weight_table);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> +		trace_v4l2_ctrl_hevc_scaling_matrix(fh->tgid, fh->fd, ptr.p_hevc_scali=
ng_matrix);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
> +	{
> +		struct v4l2_ctrl_hevc_decode_params *dp =3D ptr.p_hevc_decode_params;
> +
> +		trace_v4l2_ctrl_hevc_decode_params(fh->tgid, fh->fd, dp);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(dp->dpb); i++)
> +			trace_v4l2_hevc_dpb_entry(fh->tgid, fh->fd, &dp->dpb[i]);
> +
> +		break;
> +	}
> +	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
> +		trace_v4l2_ctrl_av1_sequence(fh->tgid, fh->fd, ptr.p_av1_sequence);
> +		break;
> +	case V4L2_CTRL_TYPE_AV1_FRAME:
> +		trace_v4l2_ctrl_av1_frame(fh->tgid, fh->fd, ptr.p_av1_frame);
> +		break;
> +	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
> +		trace_v4l2_ctrl_av1_film_grain(fh->tgid, fh->fd, ptr.p_av1_film_grain)=
;
> +		break;
> +	case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
> +		trace_v4l2_ctrl_av1_tile_group_entry(fh->tgid, fh->fd, ptr.p_av1_tile_=
group_entry);
> +		break;

Some controls are pretty generic, so what about these, the non compound ?

Nicolas

> +	}
> +
> +}
> +EXPORT_SYMBOL(v4l2_ctrl_type_op_trace);
> +
> =C2=A0static const struct v4l2_ctrl_type_ops std_type_ops =3D {
> =C2=A0	.equal =3D v4l2_ctrl_type_op_equal,
> =C2=A0	.init =3D v4l2_ctrl_type_op_init,
> =C2=A0	.minimum =3D v4l2_ctrl_type_op_minimum,
> =C2=A0	.maximum =3D v4l2_ctrl_type_op_maximum,
> =C2=A0	.log =3D v4l2_ctrl_type_op_log,
> +	.trace =3D v4l2_ctrl_type_op_trace,
> =C2=A0	.validate =3D v4l2_ctrl_type_op_validate,
> =C2=A0};
> =C2=A0
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index a2b4c96a9a6f..57c4bb999b7b 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -140,6 +140,7 @@ struct v4l2_ctrl_ops {
> =C2=A0 * @minimum: set the value to the minimum value of the control.
> =C2=A0 * @maximum: set the value to the maximum value of the control.
> =C2=A0 * @log: log the value.
> + * @trace: trace the value of the control with Ftrace.
> =C2=A0 * @validate: validate the value for ctrl->new_elems array elements=
.
> =C2=A0 *	Return 0 on success and a negative value otherwise.
> =C2=A0 */
> @@ -153,6 +154,8 @@ struct v4l2_ctrl_type_ops {
> =C2=A0	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
> =C2=A0			union v4l2_ctrl_ptr ptr);
> =C2=A0	void (*log)(const struct v4l2_ctrl *ctrl);
> +	void (*trace)(const struct v4l2_fh *fh,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl *ctrl, union v4l=
2_ctrl_ptr ptr);
> =C2=A0	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr =
ptr);
> =C2=A0};
> =C2=A0
> @@ -1627,6 +1630,18 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl=
 *ctrl, u32 from_idx,
> =C2=A0 */
> =C2=A0void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
> =C2=A0
> +/**
> + * v4l2_ctrl_type_op_trace - Default v4l2_ctrl_type_ops trace callback.
> + *
> + * @fh: The v4l2_fh of the current context.
> + * @ctrl: The v4l2_ctrl pointer.
> + * @ptr: The v4l2 control value.
> + *
> + * Return: void
> + */
> +void v4l2_ctrl_type_op_trace(const struct v4l2_fh *fh,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl *ctrl, union v4l2_ctr=
l_ptr ptr);
> +
> =C2=A0/**
> =C2=A0 * v4l2_ctrl_type_op_validate - Default v4l2_ctrl_type_ops validate=
 callback.
> =C2=A0 *

--=-6/kjwuzd33VbGR6NlGU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEMjwAKCRDZQZRRKWBy
9OBJAP9yiJYBQsdghoiON2JF2i5wRU9PNkXAsUj1rA/kCU0r9AEAvAhPXB1WavoK
cB/rX4kL85T/lk0GdrHkNwRHG6SJVQU=
=kAVE
-----END PGP SIGNATURE-----

--=-6/kjwuzd33VbGR6NlGU/--

