Return-Path: <linux-media+bounces-59881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHliOesK8Wn1cAEAu9opvQ
	(envelope-from <linux-media+bounces-59881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:30:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 129BE48B265
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25F3E3015E1D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA4247D920;
	Tue, 28 Apr 2026 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O/+5p6nw"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BED288AD;
	Tue, 28 Apr 2026 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404526; cv=none; b=pG6XODrx5hOClLM3hRR46Q4G9/WuCSbQXUnvkeuPdfhXaNNztUUGiMOlS/ykCumiLsmTMoN9UafITC20ysZrNfK2SxG3SErrBPszYAgmioPOjQiQ/cpOkWyCC6B+bTkMx6/B52ftn/oWjlz7Gh0/7tmh/Vn2Xp6FtsSXS8GujI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404526; c=relaxed/simple;
	bh=yVCviy8Qn6jUUYEm3yQUgjtWvfxvf6kOK3jqTIUDLyY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JgHuGMnbxQXcSOnpbbrpI9XfmVhiLgCg9cjPjb41DOAqmvdWBMHLOtuasDcU0qfXu17x3R6ufssKRpuG3m6IEW2Km/WIQ/C0TuB3hiQ3oy+qSb3n2PsiRRbvKNDFVty6CRHxwHZTeD68PXynZy0zkPHMn8j7QSPqfaEU2VkPnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O/+5p6nw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777404522;
	bh=yVCviy8Qn6jUUYEm3yQUgjtWvfxvf6kOK3jqTIUDLyY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=O/+5p6nwdO3FF2uDNwI+44CokCuVtulfrvlC4VRTc8IXCmSNGga3qTX98HrmGh6Yf
	 llAcNfRs5tCgbX6NEh2SmpkorlnS9CB++iwPBW9doaBU8Ao4oXk5VCGA1Pa4dl5hda
	 NZCELaPJLPG4vYH4FOl/DBERkARGUh3bHobwCVh9hQPidPVWGPjlPD0yWt1/JKUKB7
	 hnp06sdG7Ue7qoIklKonpTOD5iTLqycGk/h5vS8KJ+WYdVQbEMnAeUY4ykYXzzsJqq
	 mWN9e+6v7gC/NdOfKojLdrzwTOpn59ZMcAYnC8nIMnQ4jJNp85WL5mzmEUDFR7434J
	 3npcu9pOsLItA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD38D17E0EB6;
	Tue, 28 Apr 2026 21:28:39 +0200 (CEST)
Message-ID: <5bacfe056603376304a005ba286d596e2db0a37d.camel@collabora.com>
Subject: Re: [PATCH 02/11] media: Reformat v4l2-requests trace event printk
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
Date: Tue, 28 Apr 2026 15:28:38 -0400
In-Reply-To: <20260212162328.192217-3-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-3-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-PDVtxaEEKMrPa+JKVSrh"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 129BE48B265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59881-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]


--=-PDVtxaEEKMrPa+JKVSrh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> When printing the v4l2-request traces the format was not stable.
> Sometimes using a ':' separator, sometimes with an extra space and using
> new lines.
>=20
> Reformat the printk calls to match the format used in v4l2.h so that
> parsers can use the same format for all events.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Could easily be done against visl now and merged early if you have time.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0include/trace/events/v4l2_requests.h | 649 ++++++++++++++----------=
---
> =C2=A01 file changed, 328 insertions(+), 321 deletions(-)
>=20
> diff --git a/include/trace/events/v4l2_requests.h
> b/include/trace/events/v4l2_requests.h
> index 1e137d39d5fe..34f4a74df5ea 100644
> --- a/include/trace/events/v4l2_requests.h
> +++ b/include/trace/events/v4l2_requests.h
> @@ -14,8 +14,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_sequence, s))=
,
> =C2=A0	TP_fast_assign(__entry->s =3D *s;),
> -	TP_printk("\nflags %s\nseq_profile: %u\norder_hint_bits:
> %u\nbit_depth: %u\n"
> -		=C2=A0 "max_frame_width_minus_1: %u\nmax_frame_height_minus_1:
> %u\n",
> +	TP_printk("flags =3D %s, seq_profile =3D %u, order_hint_bits =3D %u,
> bit_depth =3D %u, "
> +		=C2=A0 "max_frame_width_minus_1 =3D %u, max_frame_height_minus_1 =3D
> %u",
> =C2=A0		=C2=A0 __print_flags(__entry->s.flags, "|",
> =C2=A0		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
> =C2=A0		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK,
> "USE_128X128_SUPERBLOCK"},
> @@ -50,7 +50,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
> =C2=A0	TP_ARGS(t),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct
> v4l2_ctrl_av1_tile_group_entry, t)),
> =C2=A0	TP_fast_assign(__entry->t =3D *t;),
> -	TP_printk("\ntile_offset: %u\n tile_size: %u\n tile_row:
> %u\ntile_col: %u\n",
> +	TP_printk("tile_offset =3D %u, tile_size =3D %u, tile_row =3D %u, tile_=
col
> =3D %u",
> =C2=A0		=C2=A0 __entry->t.tile_offset,
> =C2=A0		=C2=A0 __entry->t.tile_size,
> =C2=A0		=C2=A0 __entry->t.tile_row,
> @@ -63,30 +63,30 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
> =C2=A0	TP_ARGS(f),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_frame, f)),
> =C2=A0	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\ntile_info.flags: %s\ntile_info.context_update_tile_id:
> %u\n"
> -		=C2=A0 "tile_info.tile_cols: %u\ntile_info.tile_rows: %u\n"
> -		=C2=A0 "tile_info.mi_col_starts: %s\ntile_info.mi_row_starts:
> %s\n"
> -		=C2=A0 "tile_info.width_in_sbs_minus_1:
> %s\ntile_info.height_in_sbs_minus_1: %s\n"
> -		=C2=A0 "tile_info.tile_size_bytes: %u\nquantization.flags: %s\n"
> -		=C2=A0 "quantization.base_q_idx: %u\nquantization.delta_q_y_dc:
> %d\n"
> -		=C2=A0 "quantization.delta_q_u_dc: %d\nquantization.delta_q_u_ac:
> %d\n"
> -		=C2=A0 "quantization.delta_q_v_dc: %d\nquantization.delta_q_v_ac:
> %d\n"
> -		=C2=A0 "quantization.qm_y: %u\nquantization.qm_u:
> %u\nquantization.qm_v: %u\n"
> -		=C2=A0 "quantization.delta_q_res: %u\nsuperres_denom:
> %u\nsegmentation.flags: %s\n"
> -		=C2=A0 "segmentation.last_active_seg_id:
> %u\nsegmentation.feature_enabled:%s\n"
> -		=C2=A0 "loop_filter.flags: %s\nloop_filter.level:
> %s\nloop_filter.sharpness: %u\n"
> -		=C2=A0 "loop_filter.ref_deltas: %s\nloop_filter.mode_deltas: %s\n"
> -		=C2=A0 "loop_filter.delta_lf_res: %u\ncdef.damping_minus_3:
> %u\ncdef.bits: %u\n"
> -		=C2=A0 "cdef.y_pri_strength: %s\ncdef.y_sec_strength: %s\n"
> -		=C2=A0 "cdef.uv_pri_strength:
> %s\ncdef.uv_sec_strength:%s\nskip_mode_frame: %s\n"
> -		=C2=A0 "primary_ref_frame: %u\nloop_restoration.flags: %s\n"
> -		=C2=A0 "loop_restoration.lr_unit_shift:
> %u\nloop_restoration.lr_uv_shift: %u\n"
> -		=C2=A0 "loop_restoration.frame_restoration_type: %s\n"
> -		=C2=A0 "loop_restoration.loop_restoration_size: %s\nflags:
> %s\norder_hint: %u\n"
> -		=C2=A0 "upscaled_width: %u\nframe_width_minus_1:
> %u\nframe_height_minus_1: %u\n"
> -		=C2=A0 "render_width_minus_1: %u\nrender_height_minus_1:
> %u\ncurrent_frame_id: %u\n"
> -		=C2=A0 "buffer_removal_time: %s\norder_hints:
> %s\nreference_frame_ts: %s\n"
> -		=C2=A0 "ref_frame_idx: %s\nrefresh_frame_flags: %u\n",
> +	TP_printk("tile_info.flags =3D %s, tile_info.context_update_tile_id =3D
> %u, "
> +		=C2=A0 "tile_info.tile_cols =3D %u, tile_info.tile_rows =3D %u, "
> +		=C2=A0 "tile_info.mi_col_starts =3D %s, tile_info.mi_row_starts =3D
> %s, "
> +		=C2=A0 "tile_info.width_in_sbs_minus_1 =3D %s,
> tile_info.height_in_sbs_minus_1 =3D %s, "
> +		=C2=A0 "tile_info.tile_size_bytes =3D %u, quantization.flags =3D %s, "
> +		=C2=A0 "quantization.base_q_idx =3D %u, quantization.delta_q_y_dc =3D
> %d, "
> +		=C2=A0 "quantization.delta_q_u_dc =3D %d, quantization.delta_q_u_ac
> =3D %d, "
> +		=C2=A0 "quantization.delta_q_v_dc =3D %d, quantization.delta_q_v_ac
> =3D %d, "
> +		=C2=A0 "quantization.qm_y =3D %u, quantization.qm_u =3D %u,
> quantization.qm_v =3D %u, "
> +		=C2=A0 "quantization.delta_q_res =3D %u, superres_denom =3D %u,
> segmentation.flags =3D %s, "
> +		=C2=A0 "segmentation.last_active_seg_id =3D %u,
> segmentation.feature_enabled =3D %s, "
> +		=C2=A0 "loop_filter.flags =3D %s, loop_filter.level =3D %s,
> loop_filter.sharpness =3D %u, "
> +		=C2=A0 "loop_filter.ref_deltas =3D %s, loop_filter.mode_deltas =3D %s,
> "
> +		=C2=A0 "loop_filter.delta_lf_res =3D %u, cdef.damping_minus_3 =3D %u,
> cdef.bits =3D %u, "
> +		=C2=A0 "cdef.y_pri_strength =3D %s, cdef.y_sec_strength =3D %s, "
> +		=C2=A0 "cdef.uv_pri_strength =3D %s, cdef.uv_sec_strength =3D %s,
> skip_mode_frame =3D %s, "
> +		=C2=A0 "primary_ref_frame =3D %u, loop_restoration.flags =3D %s, "
> +		=C2=A0 "loop_restoration.lr_unit_shift =3D %u,
> loop_restoration.lr_uv_shift =3D %u, "
> +		=C2=A0 "loop_restoration.frame_restoration_type =3D %s, "
> +		=C2=A0 "loop_restoration.loop_restoration_size =3D %s, flags =3D %s,
> order_hint =3D %u, "
> +		=C2=A0 "upscaled_width =3D %u, frame_width_minus_1 =3D %u,
> frame_height_minus_1 =3D %u, "
> +		=C2=A0 "render_width_minus_1 =3D %u, render_height_minus_1 =3D %u,
> current_frame_id =3D %u, "
> +		=C2=A0 "buffer_removal_time =3D %s, order_hints =3D %s,
> reference_frame_ts =3D %s, "
> +		=C2=A0 "ref_frame_idx =3D %s, refresh_frame_flags =3D %u",
> =C2=A0		=C2=A0 __print_flags(__entry->f.tile_info.flags, "|",
> =C2=A0		=C2=A0 {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING,
> "UNIFORM_TILE_SPACING"}),
> =C2=A0		=C2=A0 __entry->f.tile_info.context_update_tile_id,
> @@ -226,15 +226,15 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
> =C2=A0	TP_ARGS(f),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_film_grain, f=
)),
> =C2=A0	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\nflags %s\ncr_mult: %u\ngrain_seed: %u\n"
> -		=C2=A0 "film_grain_params_ref_idx: %u\nnum_y_points:
> %u\npoint_y_value: %s\n"
> -		=C2=A0 "point_y_scaling: %s\nnum_cb_points: %u\npoint_cb_value:
> %s\n"
> -		=C2=A0 "point_cb_scaling: %s\nnum_cr_points: %u\npoint_cr_value:
> %s\n"
> -		=C2=A0 "point_cr_scaling: %s\ngrain_scaling_minus_8:
> %u\nar_coeff_lag: %u\n"
> -		=C2=A0 "ar_coeffs_y_plus_128: %s\nar_coeffs_cb_plus_128: %s\n"
> -		=C2=A0 "ar_coeffs_cr_plus_128: %s\nar_coeff_shift_minus_6: %u\n"
> -		=C2=A0 "grain_scale_shift: %u\ncb_mult: %u\ncb_luma_mult:
> %u\ncr_luma_mult: %u\n"
> -		=C2=A0 "cb_offset: %u\ncr_offset: %u\n",
> +	TP_printk("flags =3D %s, cr_mult =3D %u, grain_seed =3D %u, "
> +		=C2=A0 "film_grain_params_ref_idx =3D %u, num_y_points =3D %u,
> point_y_value =3D %s, "
> +		=C2=A0 "point_y_scaling =3D %s, num_cb_points =3D %u, point_cb_value =
=3D
> %s, "
> +		=C2=A0 "point_cb_scaling =3D %s, num_cr_points =3D %u, point_cr_value
> =3D %s, "
> +		=C2=A0 "point_cr_scaling =3D %s, grain_scaling_minus_8 =3D %u,
> ar_coeff_lag =3D %u, "
> +		=C2=A0 "ar_coeffs_y_plus_128 =3D %s, ar_coeffs_cb_plus_128 =3D %s, "
> +		=C2=A0 "ar_coeffs_cr_plus_128 =3D %s, ar_coeff_shift_minus_6 =3D %u, "
> +		=C2=A0 "grain_scale_shift =3D %u, cb_mult =3D %u, cb_luma_mult =3D %u,
> cr_luma_mult =3D %u, "
> +		=C2=A0 "cb_offset =3D %u, cr_offset =3D %u",
> =C2=A0		=C2=A0 __print_flags(__entry->f.flags, "|",
> =C2=A0		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
> =C2=A0		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
> @@ -333,7 +333,15 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->ycbcr_enc =3D p->yc=
bcr_enc;
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->quantization =3D p-=
>quantization;
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ),
> -	TP_printk("backward_ref_ts %llu version %u width %u height %u flags
> %s colorspace %u xfer_func %u ycbcr_enc %u quantization %u",
> +	TP_printk("backward_ref_ts =3D %llu, "
> +		=C2=A0 "version =3D %u, "
> +		=C2=A0 "width =3D %u, "
> +		=C2=A0 "height =3D %u, "
> +		=C2=A0 "flags =3D %s, "
> +		=C2=A0 "colorspace =3D %u, "
> +		=C2=A0 "xfer_func =3D %u, "
> +		=C2=A0 "ycbcr_enc =3D %u, "
> +		=C2=A0 "quantization =3D %u",
> =C2=A0		=C2=A0 __entry->backward_ref_ts, __entry->version, __entry->width=
,
> __entry->height,
> =C2=A0		=C2=A0 __print_flags(__entry->flags, "|",
> =C2=A0		=C2=A0 {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
> @@ -364,24 +372,24 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
> =C2=A0	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nprofile_idc %u\n"
> -		=C2=A0 "constraint_set_flags %s\n"
> -		=C2=A0 "level_idc %u\n"
> -		=C2=A0 "seq_parameter_set_id %u\n"
> -		=C2=A0 "chroma_format_idc %u\n"
> -		=C2=A0 "bit_depth_luma_minus8 %u\n"
> -		=C2=A0 "bit_depth_chroma_minus8 %u\n"
> -		=C2=A0 "log2_max_frame_num_minus4 %u\n"
> -		=C2=A0 "pic_order_cnt_type %u\n"
> -		=C2=A0 "log2_max_pic_order_cnt_lsb_minus4 %u\n"
> -		=C2=A0 "max_num_ref_frames %u\n"
> -		=C2=A0 "num_ref_frames_in_pic_order_cnt_cycle %u\n"
> -		=C2=A0 "offset_for_ref_frame %s\n"
> -		=C2=A0 "offset_for_non_ref_pic %d\n"
> -		=C2=A0 "offset_for_top_to_bottom_field %d\n"
> -		=C2=A0 "pic_width_in_mbs_minus1 %u\n"
> -		=C2=A0 "pic_height_in_map_units_minus1 %u\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("profile_idc =3D %u, "
> +		=C2=A0 "constraint_set_flags =3D %s, "
> +		=C2=A0 "level_idc =3D %u, "
> +		=C2=A0 "seq_parameter_set_id =3D %u, "
> +		=C2=A0 "chroma_format_idc =3D %u, "
> +		=C2=A0 "bit_depth_luma_minus8 =3D %u, "
> +		=C2=A0 "bit_depth_chroma_minus8 =3D %u, "
> +		=C2=A0 "log2_max_frame_num_minus4 =3D %u, "
> +		=C2=A0 "pic_order_cnt_type =3D %u, "
> +		=C2=A0 "log2_max_pic_order_cnt_lsb_minus4 =3D %u, "
> +		=C2=A0 "max_num_ref_frames =3D %u, "
> +		=C2=A0 "num_ref_frames_in_pic_order_cnt_cycle =3D %u, "
> +		=C2=A0 "offset_for_ref_frame =3D %s, "
> +		=C2=A0 "offset_for_non_ref_pic =3D %d, "
> +		=C2=A0 "offset_for_top_to_bottom_field =3D %d, "
> +		=C2=A0 "pic_width_in_mbs_minus1 =3D %u, "
> +		=C2=A0 "pic_height_in_map_units_minus1 =3D %u, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->s.profile_idc,
> =C2=A0		=C2=A0 __print_flags(__entry->s.constraint_set_flags, "|",
> =C2=A0		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG,
> "CONSTRAINT_SET0_FLAG"},
> @@ -423,17 +431,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
> =C2=A0	TP_ARGS(p),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
> =C2=A0	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("\npic_parameter_set_id %u\n"
> -		=C2=A0 "seq_parameter_set_id %u\n"
> -		=C2=A0 "num_slice_groups_minus1 %u\n"
> -		=C2=A0 "num_ref_idx_l0_default_active_minus1 %u\n"
> -		=C2=A0 "num_ref_idx_l1_default_active_minus1 %u\n"
> -		=C2=A0 "weighted_bipred_idc %u\n"
> -		=C2=A0 "pic_init_qp_minus26 %d\n"
> -		=C2=A0 "pic_init_qs_minus26 %d\n"
> -		=C2=A0 "chroma_qp_index_offset %d\n"
> -		=C2=A0 "second_chroma_qp_index_offset %d\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("pic_parameter_set_id =3D %u, "
> +		=C2=A0 "seq_parameter_set_id =3D %u, "
> +		=C2=A0 "num_slice_groups_minus1 =3D %u, "
> +		=C2=A0 "num_ref_idx_l0_default_active_minus1 =3D %u, "
> +		=C2=A0 "num_ref_idx_l1_default_active_minus1 =3D %u, "
> +		=C2=A0 "weighted_bipred_idc =3D %u, "
> +		=C2=A0 "pic_init_qp_minus26 =3D %d, "
> +		=C2=A0 "pic_init_qs_minus26 =3D %d, "
> +		=C2=A0 "chroma_qp_index_offset =3D %d, "
> +		=C2=A0 "second_chroma_qp_index_offset =3D %d, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->p.pic_parameter_set_id,
> =C2=A0		=C2=A0 __entry->p.seq_parameter_set_id,
> =C2=A0		=C2=A0 __entry->p.num_slice_groups_minus1,
> @@ -461,7 +469,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmp=
l,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matr=
ix,
> s)),
> =C2=A0	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
> +	TP_printk("scaling_list_4x4 =3D {%s}, scaling_list_8x8 =3D {%s}",
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> @@ -478,16 +486,16 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmp=
l,
> =C2=A0	TP_ARGS(p),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights=
,
> p)),
> =C2=A0	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("\nluma_log2_weight_denom %u\n"
> -		=C2=A0 "chroma_log2_weight_denom %u\n"
> -		=C2=A0 "weight_factor[0].luma_weight %s\n"
> -		=C2=A0 "weight_factor[0].luma_offset %s\n"
> -		=C2=A0 "weight_factor[0].chroma_weight {%s}\n"
> -		=C2=A0 "weight_factor[0].chroma_offset {%s}\n"
> -		=C2=A0 "weight_factor[1].luma_weight %s\n"
> -		=C2=A0 "weight_factor[1].luma_offset %s\n"
> -		=C2=A0 "weight_factor[1].chroma_weight {%s}\n"
> -		=C2=A0 "weight_factor[1].chroma_offset {%s}\n",
> +	TP_printk("luma_log2_weight_denom =3D %u, "
> +		=C2=A0 "chroma_log2_weight_denom =3D %u, "
> +		=C2=A0 "weight_factor[0].luma_weight =3D %s, "
> +		=C2=A0 "weight_factor[0].luma_offset =3D %s, "
> +		=C2=A0 "weight_factor[0].chroma_weight =3D {%s}, "
> +		=C2=A0 "weight_factor[0].chroma_offset =3D {%s}, "
> +		=C2=A0 "weight_factor[1].luma_weight =3D %s, "
> +		=C2=A0 "weight_factor[1].luma_offset =3D %s, "
> +		=C2=A0 "weight_factor[1].chroma_weight =3D {%s}, "
> +		=C2=A0 "weight_factor[1].chroma_offset =3D {%s}",
> =C2=A0		=C2=A0 __entry->p.luma_log2_weight_denom,
> =C2=A0		=C2=A0 __entry->p.chroma_log2_weight_denom,
> =C2=A0		=C2=A0 __print_array(__entry->p.weight_factors[0].luma_weight,
> @@ -526,20 +534,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmp=
l,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params=
,
> s)),
> =C2=A0	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nheader_bit_size %u\n"
> -		=C2=A0 "first_mb_in_slice %u\n"
> -		=C2=A0 "slice_type %s\n"
> -		=C2=A0 "colour_plane_id %u\n"
> -		=C2=A0 "redundant_pic_cnt %u\n"
> -		=C2=A0 "cabac_init_idc %u\n"
> -		=C2=A0 "slice_qp_delta %d\n"
> -		=C2=A0 "slice_qs_delta %d\n"
> -		=C2=A0 "disable_deblocking_filter_idc %u\n"
> -		=C2=A0 "slice_alpha_c0_offset_div2 %u\n"
> -		=C2=A0 "slice_beta_offset_div2 %u\n"
> -		=C2=A0 "num_ref_idx_l0_active_minus1 %u\n"
> -		=C2=A0 "num_ref_idx_l1_active_minus1 %u\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("header_bit_size =3D %u, "
> +		=C2=A0 "first_mb_in_slice =3D %u, "
> +		=C2=A0 "slice_type =3D %s, "
> +		=C2=A0 "colour_plane_id =3D %u, "
> +		=C2=A0 "redundant_pic_cnt =3D %u, "
> +		=C2=A0 "cabac_init_idc =3D %u, "
> +		=C2=A0 "slice_qp_delta =3D %d, "
> +		=C2=A0 "slice_qs_delta =3D %d, "
> +		=C2=A0 "disable_deblocking_filter_idc =3D %u, "
> +		=C2=A0 "slice_alpha_c0_offset_div2 =3D %u, "
> +		=C2=A0 "slice_beta_offset_div2 =3D %u, "
> +		=C2=A0 "num_ref_idx_l0_active_minus1 =3D %u, "
> +		=C2=A0 "num_ref_idx_l1_active_minus1 =3D %u, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->s.header_bit_size,
> =C2=A0		=C2=A0 __entry->s.first_mb_in_slice,
> =C2=A0		=C2=A0 __print_symbolic(__entry->s.slice_type,
> @@ -570,7 +578,7 @@ DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
> =C2=A0			 __field(int, i)),
> =C2=A0	TP_fast_assign(__entry->r =3D *r; __entry->i =3D i;),
> -	TP_printk("[%d]: fields %s index %u",
> +	TP_printk("[%d]: fields =3D %s, index =3D %u",
> =C2=A0		=C2=A0 __entry->i,
> =C2=A0		=C2=A0 __print_flags(__entry->r.fields, "|",
> =C2=A0		=C2=A0 {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> @@ -585,19 +593,19 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tm=
pl,
> =C2=A0	TP_ARGS(d),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_param=
s,
> d)),
> =C2=A0	TP_fast_assign(__entry->d =3D *d),
> -	TP_printk("\nnal_ref_idc %u\n"
> -		=C2=A0 "frame_num %u\n"
> -		=C2=A0 "top_field_order_cnt %d\n"
> -		=C2=A0 "bottom_field_order_cnt %d\n"
> -		=C2=A0 "idr_pic_id %u\n"
> -		=C2=A0 "pic_order_cnt_lsb %u\n"
> -		=C2=A0 "delta_pic_order_cnt_bottom %d\n"
> -		=C2=A0 "delta_pic_order_cnt0 %d\n"
> -		=C2=A0 "delta_pic_order_cnt1 %d\n"
> -		=C2=A0 "dec_ref_pic_marking_bit_size %u\n"
> -		=C2=A0 "pic_order_cnt_bit_size %u\n"
> -		=C2=A0 "slice_group_change_cycle %u\n"
> -		=C2=A0 "flags %s\n",
> +	TP_printk("nal_ref_idc =3D %u, "
> +		=C2=A0 "frame_num =3D %u, "
> +		=C2=A0 "top_field_order_cnt =3D %d, "
> +		=C2=A0 "bottom_field_order_cnt =3D %d, "
> +		=C2=A0 "idr_pic_id =3D %u, "
> +		=C2=A0 "pic_order_cnt_lsb =3D %u, "
> +		=C2=A0 "delta_pic_order_cnt_bottom =3D %d, "
> +		=C2=A0 "delta_pic_order_cnt0 =3D %d, "
> +		=C2=A0 "delta_pic_order_cnt1 =3D %d, "
> +		=C2=A0 "dec_ref_pic_marking_bit_size =3D %u, "
> +		=C2=A0 "pic_order_cnt_bit_size =3D %u, "
> +		=C2=A0 "slice_group_change_cycle =3D %u, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->d.nal_ref_idc,
> =C2=A0		=C2=A0 __entry->d.frame_num,
> =C2=A0		=C2=A0 __entry->d.top_field_order_cnt,
> @@ -625,8 +633,8 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
> =C2=A0			 __field(int, i)),
> =C2=A0	TP_fast_assign(__entry->e =3D *e; __entry->i =3D i;),
> -	TP_printk("[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s
> "
> -		=C2=A0 "top_field_order_cnt %d bottom_field_order_cnt %d flags
> %s",
> +	TP_printk("[%d]: reference_ts =3D %llu, pic_num =3D %u, frame_num =3D %=
u,
> fields =3D %s "
> +		=C2=A0 "top_field_order_cnt =3D %d, bottom_field_order_cnt =3D %d,
> flags =3D %s",
> =C2=A0		=C2=A0 __entry->i,
> =C2=A0		=C2=A0 __entry->e.reference_ts,
> =C2=A0		=C2=A0 __entry->e.pic_num,
> @@ -642,7 +650,6 @@ DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
> =C2=A0		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_ACTIVE, "ACTIVE"},
> =C2=A0		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM, "LONG_TERM"},
> =C2=A0		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_FIELD, "FIELD"})
> -
> =C2=A0	)
> =C2=A0);
> =C2=A0
> @@ -698,31 +705,31 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_sps, s)),
> =C2=A0	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nvideo_parameter_set_id %u\n"
> -		=C2=A0 "seq_parameter_set_id %u\n"
> -		=C2=A0 "pic_width_in_luma_samples %u\n"
> -		=C2=A0 "pic_height_in_luma_samples %u\n"
> -		=C2=A0 "bit_depth_luma_minus8 %u\n"
> -		=C2=A0 "bit_depth_chroma_minus8 %u\n"
> -		=C2=A0 "log2_max_pic_order_cnt_lsb_minus4 %u\n"
> -		=C2=A0 "sps_max_dec_pic_buffering_minus1 %u\n"
> -		=C2=A0 "sps_max_num_reorder_pics %u\n"
> -		=C2=A0 "sps_max_latency_increase_plus1 %u\n"
> -		=C2=A0 "log2_min_luma_coding_block_size_minus3 %u\n"
> -		=C2=A0 "log2_diff_max_min_luma_coding_block_size %u\n"
> -		=C2=A0 "log2_min_luma_transform_block_size_minus2 %u\n"
> -		=C2=A0 "log2_diff_max_min_luma_transform_block_size %u\n"
> -		=C2=A0 "max_transform_hierarchy_depth_inter %u\n"
> -		=C2=A0 "max_transform_hierarchy_depth_intra %u\n"
> -		=C2=A0 "pcm_sample_bit_depth_luma_minus1 %u\n"
> -		=C2=A0 "pcm_sample_bit_depth_chroma_minus1 %u\n"
> -		=C2=A0 "log2_min_pcm_luma_coding_block_size_minus3 %u\n"
> -		=C2=A0 "log2_diff_max_min_pcm_luma_coding_block_size %u\n"
> -		=C2=A0 "num_short_term_ref_pic_sets %u\n"
> -		=C2=A0 "num_long_term_ref_pics_sps %u\n"
> -		=C2=A0 "chroma_format_idc %u\n"
> -		=C2=A0 "sps_max_sub_layers_minus1 %u\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("video_parameter_set_id =3D %u, "
> +		=C2=A0 "seq_parameter_set_id =3D %u, "
> +		=C2=A0 "pic_width_in_luma_samples =3D %u, "
> +		=C2=A0 "pic_height_in_luma_samples =3D %u, "
> +		=C2=A0 "bit_depth_luma_minus8 =3D %u, "
> +		=C2=A0 "bit_depth_chroma_minus8 =3D %u, "
> +		=C2=A0 "log2_max_pic_order_cnt_lsb_minus4 =3D %u, "
> +		=C2=A0 "sps_max_dec_pic_buffering_minus1 =3D %u, "
> +		=C2=A0 "sps_max_num_reorder_pics =3D %u, "
> +		=C2=A0 "sps_max_latency_increase_plus1 =3D %u, "
> +		=C2=A0 "log2_min_luma_coding_block_size_minus3 =3D %u, "
> +		=C2=A0 "log2_diff_max_min_luma_coding_block_size =3D %u, "
> +		=C2=A0 "log2_min_luma_transform_block_size_minus2 =3D %u, "
> +		=C2=A0 "log2_diff_max_min_luma_transform_block_size =3D %u, "
> +		=C2=A0 "max_transform_hierarchy_depth_inter =3D %u, "
> +		=C2=A0 "max_transform_hierarchy_depth_intra =3D %u, "
> +		=C2=A0 "pcm_sample_bit_depth_luma_minus1 =3D %u, "
> +		=C2=A0 "pcm_sample_bit_depth_chroma_minus1 =3D %u, "
> +		=C2=A0 "log2_min_pcm_luma_coding_block_size_minus3 =3D %u, "
> +		=C2=A0 "log2_diff_max_min_pcm_luma_coding_block_size =3D %u, "
> +		=C2=A0 "num_short_term_ref_pic_sets =3D %u, "
> +		=C2=A0 "num_long_term_ref_pics_sps =3D %u, "
> +		=C2=A0 "chroma_format_idc =3D %u, "
> +		=C2=A0 "sps_max_sub_layers_minus1 =3D %u, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->s.video_parameter_set_id,
> =C2=A0		=C2=A0 __entry->s.seq_parameter_set_id,
> =C2=A0		=C2=A0 __entry->s.pic_width_in_luma_samples,
> @@ -767,22 +774,22 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
> =C2=A0	TP_ARGS(p),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_pps, p)),
> =C2=A0	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("\npic_parameter_set_id %u\n"
> -		=C2=A0 "num_extra_slice_header_bits %u\n"
> -		=C2=A0 "num_ref_idx_l0_default_active_minus1 %u\n"
> -		=C2=A0 "num_ref_idx_l1_default_active_minus1 %u\n"
> -		=C2=A0 "init_qp_minus26 %d\n"
> -		=C2=A0 "diff_cu_qp_delta_depth %u\n"
> -		=C2=A0 "pps_cb_qp_offset %d\n"
> -		=C2=A0 "pps_cr_qp_offset %d\n"
> -		=C2=A0 "num_tile_columns_minus1 %d\n"
> -		=C2=A0 "num_tile_rows_minus1 %d\n"
> -		=C2=A0 "column_width_minus1 %s\n"
> -		=C2=A0 "row_height_minus1 %s\n"
> -		=C2=A0 "pps_beta_offset_div2 %d\n"
> -		=C2=A0 "pps_tc_offset_div2 %d\n"
> -		=C2=A0 "log2_parallel_merge_level_minus2 %u\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("pic_parameter_set_id =3D %u, "
> +		=C2=A0 "num_extra_slice_header_bits =3D %u, "
> +		=C2=A0 "num_ref_idx_l0_default_active_minus1 =3D %u, "
> +		=C2=A0 "num_ref_idx_l1_default_active_minus1 =3D %u, "
> +		=C2=A0 "init_qp_minus26 =3D %d, "
> +		=C2=A0 "diff_cu_qp_delta_depth =3D %u, "
> +		=C2=A0 "pps_cb_qp_offset =3D %d, "
> +		=C2=A0 "pps_cr_qp_offset =3D %d, "
> +		=C2=A0 "num_tile_columns_minus1 =3D %d, "
> +		=C2=A0 "num_tile_rows_minus1 =3D %d, "
> +		=C2=A0 "column_width_minus1 =3D %s, "
> +		=C2=A0 "row_height_minus1 =3D %s, "
> +		=C2=A0 "pps_beta_offset_div2 =3D %d, "
> +		=C2=A0 "pps_tc_offset_div2 =3D %d, "
> +		=C2=A0 "log2_parallel_merge_level_minus2 =3D %u, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->p.pic_parameter_set_id,
> =C2=A0		=C2=A0 __entry->p.num_extra_slice_header_bits,
> =C2=A0		=C2=A0 __entry->p.num_ref_idx_l0_default_active_minus1,
> @@ -834,33 +841,33 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmp=
l,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_slice_params=
,
> s)),
> =C2=A0	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nbit_size %u\n"
> -		=C2=A0 "data_byte_offset %u\n"
> -		=C2=A0 "num_entry_point_offsets %u\n"
> -		=C2=A0 "nal_unit_type %u\n"
> -		=C2=A0 "nuh_temporal_id_plus1 %u\n"
> -		=C2=A0 "slice_type %u\n"
> -		=C2=A0 "colour_plane_id %u\n"
> -		=C2=A0 "slice_pic_order_cnt %d\n"
> -		=C2=A0 "num_ref_idx_l0_active_minus1 %u\n"
> -		=C2=A0 "num_ref_idx_l1_active_minus1 %u\n"
> -		=C2=A0 "collocated_ref_idx %u\n"
> -		=C2=A0 "five_minus_max_num_merge_cand %u\n"
> -		=C2=A0 "slice_qp_delta %d\n"
> -		=C2=A0 "slice_cb_qp_offset %d\n"
> -		=C2=A0 "slice_cr_qp_offset %d\n"
> -		=C2=A0 "slice_act_y_qp_offset %d\n"
> -		=C2=A0 "slice_act_cb_qp_offset %d\n"
> -		=C2=A0 "slice_act_cr_qp_offset %d\n"
> -		=C2=A0 "slice_beta_offset_div2 %d\n"
> -		=C2=A0 "slice_tc_offset_div2 %d\n"
> -		=C2=A0 "pic_struct %u\n"
> -		=C2=A0 "slice_segment_addr %u\n"
> -		=C2=A0 "ref_idx_l0 %s\n"
> -		=C2=A0 "ref_idx_l1 %s\n"
> -		=C2=A0 "short_term_ref_pic_set_size %u\n"
> -		=C2=A0 "long_term_ref_pic_set_size %u\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("bit_size =3D %u, "
> +		=C2=A0 "data_byte_offset =3D %u, "
> +		=C2=A0 "num_entry_point_offsets =3D %u, "
> +		=C2=A0 "nal_unit_type =3D %u, "
> +		=C2=A0 "nuh_temporal_id_plus1 =3D %u, "
> +		=C2=A0 "slice_type =3D %u, "
> +		=C2=A0 "colour_plane_id =3D %u, "
> +		=C2=A0 "slice_pic_order_cnt =3D %d, "
> +		=C2=A0 "num_ref_idx_l0_active_minus1 =3D %u, "
> +		=C2=A0 "num_ref_idx_l1_active_minus1 =3D %u, "
> +		=C2=A0 "collocated_ref_idx =3D %u, "
> +		=C2=A0 "five_minus_max_num_merge_cand =3D %u, "
> +		=C2=A0 "slice_qp_delta =3D %d, "
> +		=C2=A0 "slice_cb_qp_offset =3D %d, "
> +		=C2=A0 "slice_cr_qp_offset =3D %d, "
> +		=C2=A0 "slice_act_y_qp_offset =3D %d, "
> +		=C2=A0 "slice_act_cb_qp_offset =3D %d, "
> +		=C2=A0 "slice_act_cr_qp_offset =3D %d, "
> +		=C2=A0 "slice_beta_offset_div2 =3D %d, "
> +		=C2=A0 "slice_tc_offset_div2 =3D %d, "
> +		=C2=A0 "pic_struct =3D %u, "
> +		=C2=A0 "slice_segment_addr =3D %u, "
> +		=C2=A0 "ref_idx_l0 =3D %s, "
> +		=C2=A0 "ref_idx_l1 =3D %s, "
> +		=C2=A0 "short_term_ref_pic_set_size =3D %u, "
> +		=C2=A0 "long_term_ref_pic_set_size =3D %u, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->s.bit_size,
> =C2=A0		=C2=A0 __entry->s.data_byte_offset,
> =C2=A0		=C2=A0 __entry->s.num_entry_point_offsets,
> @@ -911,16 +918,16 @@ DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmp=
l,
> =C2=A0	TP_ARGS(p),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_pred_weight_table=
,
> p)),
> =C2=A0	TP_fast_assign(__entry->p =3D *p),
> -	TP_printk("\ndelta_luma_weight_l0 %s\n"
> -		=C2=A0 "luma_offset_l0 %s\n"
> -		=C2=A0 "delta_chroma_weight_l0 {%s}\n"
> -		=C2=A0 "chroma_offset_l0 {%s}\n"
> -		=C2=A0 "delta_luma_weight_l1 %s\n"
> -		=C2=A0 "luma_offset_l1 %s\n"
> -		=C2=A0 "delta_chroma_weight_l1 {%s}\n"
> -		=C2=A0 "chroma_offset_l1 {%s}\n"
> -		=C2=A0 "luma_log2_weight_denom %d\n"
> -		=C2=A0 "delta_chroma_log2_weight_denom %d\n",
> +	TP_printk("delta_luma_weight_l0 =3D %s, "
> +		=C2=A0 "luma_offset_l0 =3D %s, "
> +		=C2=A0 "delta_chroma_weight_l0 =3D {%s}, "
> +		=C2=A0 "chroma_offset_l0 =3D {%s}, "
> +		=C2=A0 "delta_luma_weight_l1 =3D %s, "
> +		=C2=A0 "luma_offset_l1 =3D %s, "
> +		=C2=A0 "delta_chroma_weight_l1 =3D {%s}, "
> +		=C2=A0 "chroma_offset_l1 =3D {%s}, "
> +		=C2=A0 "luma_log2_weight_denom =3D %d, "
> +		=C2=A0 "delta_chroma_log2_weight_denom =3D %d",
> =C2=A0		=C2=A0 __print_array(__entry->p.delta_luma_weight_l0,
> =C2=A0				ARRAY_SIZE(__entry->p.delta_luma_weight_l0),
> =C2=A0				sizeof(__entry->p.delta_luma_weight_l0[0])),
> @@ -959,12 +966,12 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_t=
mpl,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_scaling_matr=
ix,
> s)),
> =C2=A0	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nscaling_list_4x4 {%s}\n"
> -		=C2=A0 "scaling_list_8x8 {%s}\n"
> -		=C2=A0 "scaling_list_16x16 {%s}\n"
> -		=C2=A0 "scaling_list_32x32 {%s}\n"
> -		=C2=A0 "scaling_list_dc_coef_16x16 %s\n"
> -		=C2=A0 "scaling_list_dc_coef_32x32 %s\n",
> +	TP_printk("scaling_list_4x4 =3D {%s}, "
> +		=C2=A0 "scaling_list_8x8 =3D {%s}, "
> +		=C2=A0 "scaling_list_16x16 =3D {%s}, "
> +		=C2=A0 "scaling_list_32x32 =3D {%s}, "
> +		=C2=A0 "scaling_list_dc_coef_16x16 =3D %s, "
> +		=C2=A0 "scaling_list_dc_coef_32x32 =3D %s",
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> @@ -994,17 +1001,17 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_t=
mpl,
> =C2=A0	TP_ARGS(d),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_decode_param=
s,
> d)),
> =C2=A0	TP_fast_assign(__entry->d =3D *d),
> -	TP_printk("\npic_order_cnt_val %d\n"
> -		=C2=A0 "short_term_ref_pic_set_size %u\n"
> -		=C2=A0 "long_term_ref_pic_set_size %u\n"
> -		=C2=A0 "num_active_dpb_entries %u\n"
> -		=C2=A0 "num_poc_st_curr_before %u\n"
> -		=C2=A0 "num_poc_st_curr_after %u\n"
> -		=C2=A0 "num_poc_lt_curr %u\n"
> -		=C2=A0 "poc_st_curr_before %s\n"
> -		=C2=A0 "poc_st_curr_after %s\n"
> -		=C2=A0 "poc_lt_curr %s\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("pic_order_cnt_val =3D %d, "
> +		=C2=A0 "short_term_ref_pic_set_size =3D %u, "
> +		=C2=A0 "long_term_ref_pic_set_size =3D %u, "
> +		=C2=A0 "num_active_dpb_entries =3D %u, "
> +		=C2=A0 "num_poc_st_curr_before =3D %u, "
> +		=C2=A0 "num_poc_st_curr_after =3D %u, "
> +		=C2=A0 "num_poc_lt_curr =3D %u, "
> +		=C2=A0 "poc_st_curr_before =3D %s, "
> +		=C2=A0 "poc_st_curr_after =3D %s, "
> +		=C2=A0 "poc_lt_curr =3D %s, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __entry->d.pic_order_cnt_val,
> =C2=A0		=C2=A0 __entry->d.short_term_ref_pic_set_size,
> =C2=A0		=C2=A0 __entry->d.long_term_ref_pic_set_size,
> @@ -1033,8 +1040,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_t=
mpl,
> =C2=A0	TP_ARGS(lt),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_r=
ps,
> lt)),
> =C2=A0	TP_fast_assign(__entry->lt =3D *lt),
> -	TP_printk("\nflags %s\n"
> -		=C2=A0 "lt_ref_pic_poc_lsb_sps %x\n",
> +	TP_printk("flags =3D %s, "
> +		=C2=A0 "lt_ref_pic_poc_lsb_sps =3D %x",
> =C2=A0		=C2=A0 __print_flags(__entry->lt.flags, "|",
> =C2=A0		=C2=A0 {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
> =C2=A0		=C2=A0 ),
> @@ -1047,16 +1054,16 @@
> DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
> =C2=A0	TP_ARGS(st),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_r=
ps,
> st)),
> =C2=A0	TP_fast_assign(__entry->st =3D *st),
> -	TP_printk("\nflags %s\n"
> -		=C2=A0 "delta_idx_minus1: %u\n"
> -		=C2=A0 "delta_rps_sign: %u\n"
> -		=C2=A0 "abs_delta_rps_minus1: %u\n"
> -		=C2=A0 "num_negative_pics: %u\n"
> -		=C2=A0 "num_positive_pics: %u\n"
> -		=C2=A0 "used_by_curr_pic: %08x\n"
> -		=C2=A0 "use_delta_flag: %08x\n"
> -		=C2=A0 "delta_poc_s0_minus1: %s\n"
> -		=C2=A0 "delta_poc_s1_minus1: %s\n",
> +	TP_printk("flags =3D %s, "
> +		=C2=A0 "delta_idx_minus1 =3D %u, "
> +		=C2=A0 "delta_rps_sign =3D %u, "
> +		=C2=A0 "abs_delta_rps_minus1 =3D %u, "
> +		=C2=A0 "num_negative_pics =3D %u, "
> +		=C2=A0 "num_positive_pics =3D %u, "
> +		=C2=A0 "used_by_curr_pic =3D %08x, "
> +		=C2=A0 "use_delta_flag =3D %08x, "
> +		=C2=A0 "delta_poc_s0_minus1 =3D %s, "
> +		=C2=A0 "delta_poc_s1_minus1 =3D %s",
> =C2=A0		=C2=A0 __print_flags(__entry->st.flags, "|",
> =C2=A0		=C2=A0 {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED,
> "INTER_REF_PIC_SET_PRED"}
> =C2=A0		=C2=A0 ),
> @@ -1081,10 +1088,10 @@ DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
> =C2=A0	TP_ARGS(e),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_dpb_entry, e)),
> =C2=A0	TP_fast_assign(__entry->e =3D *e),
> -	TP_printk("\ntimestamp %llu\n"
> -		=C2=A0 "flags %s\n"
> -		=C2=A0 "field_pic %u\n"
> -		=C2=A0 "pic_order_cnt_val %d\n",
> +	TP_printk("timestamp =3D %llu, "
> +		=C2=A0 "flags =3D %s, "
> +		=C2=A0 "field_pic =3D %u, "
> +		=C2=A0 "pic_order_cnt_val =3D %d",
> =C2=A0		__entry->e.timestamp,
> =C2=A0		__print_flags(__entry->e.flags, "|",
> =C2=A0		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE,
> "LONG_TERM_REFERENCE"}
> @@ -1145,8 +1152,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> =C2=A0	TP_ARGS(s),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s=
)),
> =C2=A0	TP_fast_assign(__entry->s =3D *s;),
> -	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size
> %u\n"
> -		=C2=A0 "profile_and_level_indication %u\nchroma_format %u\nflags
> %s\n",
> +	TP_printk("horizontal_size =3D %u, vertical_size =3D %u, vbv_buffer_siz=
e
> =3D %u, "
> +		=C2=A0 "profile_and_level_indication =3D %u, chroma_format =3D %u,
> flags =3D %s",
> =C2=A0		=C2=A0 __entry->s.horizontal_size,
> =C2=A0		=C2=A0 __entry->s.vertical_size,
> =C2=A0		=C2=A0 __entry->s.vbv_buffer_size,
> @@ -1162,8 +1169,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
> =C2=A0	TP_ARGS(p),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)=
),
> =C2=A0	TP_fast_assign(__entry->p =3D *p;),
> -	TP_printk("\nbackward_ref_ts %llu\nforward_ref_ts %llu\nflags
> %s\nf_code {%s}\n"
> -		=C2=A0 "picture_coding_type: %u\npicture_structure
> %u\nintra_dc_precision %u\n",
> +	TP_printk("backward_ref_ts =3D %llu, forward_ref_ts =3D %llu, flags =3D=
 %s,
> f_code =3D {%s}, "
> +		=C2=A0 "picture_coding_type =3D %u, picture_structure =3D %u,
> intra_dc_precision =3D %u",
> =C2=A0		=C2=A0 __entry->p.backward_ref_ts,
> =C2=A0		=C2=A0 __entry->p.forward_ref_ts,
> =C2=A0		=C2=A0 __print_flags(__entry->p.flags, "|",
> @@ -1190,8 +1197,8 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
> =C2=A0	TP_ARGS(q),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisatio=
n,
> q)),
> =C2=A0	TP_fast_assign(__entry->q =3D *q;),
> -	TP_printk("\nintra_quantiser_matrix %s\nnon_intra_quantiser_matrix
> %s\n"
> -		=C2=A0 "chroma_intra_quantiser_matrix
> %s\nchroma_non_intra_quantiser_matrix %s\n",
> +	TP_printk("intra_quantiser_matrix =3D %s, non_intra_quantiser_matrix =
=3D
> %s, "
> +		=C2=A0 "chroma_intra_quantiser_matrix =3D %s,
> chroma_non_intra_quantiser_matrix =3D %s",
> =C2=A0		=C2=A0 __print_array(__entry->q.intra_quantiser_matrix,
> =C2=A0				ARRAY_SIZE(__entry-
> >q.intra_quantiser_matrix),
> =C2=A0				sizeof(__entry-
> >q.intra_quantiser_matrix[0])),
> @@ -1229,10 +1236,10 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
> =C2=A0	TP_ARGS(f),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> =C2=A0	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\nentropy.coeff_probs {%s}\n"
> -		=C2=A0 "entropy.y_mode_probs %s\n"
> -		=C2=A0 "entropy.uv_mode_probs %s\n"
> -		=C2=A0 "entropy.mv_probs {%s}",
> +	TP_printk("entropy.coeff_probs =3D {%s}, "
> +		=C2=A0 "entropy.y_mode_probs =3D %s, "
> +		=C2=A0 "entropy.uv_mode_probs =3D %s, "
> +		=C2=A0 "entropy.mv_probs =3D {%s}",
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->f.entropy.coeff_probs,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->f.entropy.coeff_probs),
> @@ -1255,41 +1262,41 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
> =C2=A0	TP_ARGS(f),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> =C2=A0	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\nsegment.quant_update %s\n"
> -		=C2=A0 "segment.lf_update %s\n"
> -		=C2=A0 "segment.segment_probs %s\n"
> -		=C2=A0 "segment.flags %s\n"
> -		=C2=A0 "lf.ref_frm_delta %s\n"
> -		=C2=A0 "lf.mb_mode_delta %s\n"
> -		=C2=A0 "lf.sharpness_level %u\n"
> -		=C2=A0 "lf.level %u\n"
> -		=C2=A0 "lf.flags %s\n"
> -		=C2=A0 "quant.y_ac_qi %u\n"
> -		=C2=A0 "quant.y_dc_delta %d\n"
> -		=C2=A0 "quant.y2_dc_delta %d\n"
> -		=C2=A0 "quant.y2_ac_delta %d\n"
> -		=C2=A0 "quant.uv_dc_delta %d\n"
> -		=C2=A0 "quant.uv_ac_delta %d\n"
> -		=C2=A0 "coder_state.range %u\n"
> -		=C2=A0 "coder_state.value %u\n"
> -		=C2=A0 "coder_state.bit_count %u\n"
> -		=C2=A0 "width %u\n"
> -		=C2=A0 "height %u\n"
> -		=C2=A0 "horizontal_scale %u\n"
> -		=C2=A0 "vertical_scale %u\n"
> -		=C2=A0 "version %u\n"
> -		=C2=A0 "prob_skip_false %u\n"
> -		=C2=A0 "prob_intra %u\n"
> -		=C2=A0 "prob_last %u\n"
> -		=C2=A0 "prob_gf %u\n"
> -		=C2=A0 "num_dct_parts %u\n"
> -		=C2=A0 "first_part_size %u\n"
> -		=C2=A0 "first_part_header_bits %u\n"
> -		=C2=A0 "dct_part_sizes %s\n"
> -		=C2=A0 "last_frame_ts %llu\n"
> -		=C2=A0 "golden_frame_ts %llu\n"
> -		=C2=A0 "alt_frame_ts %llu\n"
> -		=C2=A0 "flags %s",
> +	TP_printk("segment.quant_update =3D %s, "
> +		=C2=A0 "segment.lf_update =3D %s, "
> +		=C2=A0 "segment.segment_probs =3D %s, "
> +		=C2=A0 "segment.flags =3D %s, "
> +		=C2=A0 "lf.ref_frm_delta =3D %s, "
> +		=C2=A0 "lf.mb_mode_delta =3D %s, "
> +		=C2=A0 "lf.sharpness_level =3D %u, "
> +		=C2=A0 "lf.level =3D %u, "
> +		=C2=A0 "lf.flags =3D %s, "
> +		=C2=A0 "quant.y_ac_qi =3D %u, "
> +		=C2=A0 "quant.y_dc_delta =3D %d, "
> +		=C2=A0 "quant.y2_dc_delta =3D %d, "
> +		=C2=A0 "quant.y2_ac_delta =3D %d, "
> +		=C2=A0 "quant.uv_dc_delta =3D %d, "
> +		=C2=A0 "quant.uv_ac_delta =3D %d, "
> +		=C2=A0 "coder_state.range =3D %u, "
> +		=C2=A0 "coder_state.value =3D %u, "
> +		=C2=A0 "coder_state.bit_count =3D %u, "
> +		=C2=A0 "width =3D %u, "
> +		=C2=A0 "height =3D %u, "
> +		=C2=A0 "horizontal_scale =3D %u, "
> +		=C2=A0 "vertical_scale =3D %u, "
> +		=C2=A0 "version =3D %u, "
> +		=C2=A0 "prob_skip_false =3D %u, "
> +		=C2=A0 "prob_intra =3D %u, "
> +		=C2=A0 "prob_last =3D %u, "
> +		=C2=A0 "prob_gf =3D %u, "
> +		=C2=A0 "num_dct_parts =3D %u, "
> +		=C2=A0 "first_part_size =3D %u, "
> +		=C2=A0 "first_part_header_bits =3D %u, "
> +		=C2=A0 "dct_part_sizes =3D %s, "
> +		=C2=A0 "last_frame_ts =3D %llu, "
> +		=C2=A0 "golden_frame_ts =3D %llu, "
> +		=C2=A0 "alt_frame_ts =3D %llu, "
> +		=C2=A0 "flags =3D %s",
> =C2=A0		=C2=A0 __print_array(__entry->f.segment.quant_update,
> =C2=A0				ARRAY_SIZE(__entry->f.segment.quant_update),
> =C2=A0				sizeof(__entry->f.segment.quant_update[0])),
> @@ -1370,39 +1377,39 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
> =C2=A0	TP_ARGS(f),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
> =C2=A0	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\nlf.ref_deltas %s\n"
> -		=C2=A0 "lf.mode_deltas %s\n"
> -		=C2=A0 "lf.level %u\n"
> -		=C2=A0 "lf.sharpness %u\n"
> -		=C2=A0 "lf.flags %s\n"
> -		=C2=A0 "quant.base_q_idx %u\n"
> -		=C2=A0 "quant.delta_q_y_dc %d\n"
> -		=C2=A0 "quant.delta_q_uv_dc %d\n"
> -		=C2=A0 "quant.delta_q_uv_ac %d\n"
> -		=C2=A0 "seg.feature_data {%s}\n"
> -		=C2=A0 "seg.feature_enabled %s\n"
> -		=C2=A0 "seg.tree_probs %s\n"
> -		=C2=A0 "seg.pred_probs %s\n"
> -		=C2=A0 "seg.flags %s\n"
> -		=C2=A0 "flags %s\n"
> -		=C2=A0 "compressed_header_size %u\n"
> -		=C2=A0 "uncompressed_header_size %u\n"
> -		=C2=A0 "frame_width_minus_1 %u\n"
> -		=C2=A0 "frame_height_minus_1 %u\n"
> -		=C2=A0 "render_width_minus_1 %u\n"
> -		=C2=A0 "render_height_minus_1 %u\n"
> -		=C2=A0 "last_frame_ts %llu\n"
> -		=C2=A0 "golden_frame_ts %llu\n"
> -		=C2=A0 "alt_frame_ts %llu\n"
> -		=C2=A0 "ref_frame_sign_bias %s\n"
> -		=C2=A0 "reset_frame_context %s\n"
> -		=C2=A0 "frame_context_idx %u\n"
> -		=C2=A0 "profile %u\n"
> -		=C2=A0 "bit_depth %u\n"
> -		=C2=A0 "interpolation_filter %s\n"
> -		=C2=A0 "tile_cols_log2 %u\n"
> -		=C2=A0 "tile_rows_log_2 %u\n"
> -		=C2=A0 "reference_mode %s\n",
> +	TP_printk("lf.ref_deltas =3D %s, "
> +		=C2=A0 "lf.mode_deltas =3D %s, "
> +		=C2=A0 "lf.level =3D %u, "
> +		=C2=A0 "lf.sharpness =3D %u, "
> +		=C2=A0 "lf.flags =3D %s, "
> +		=C2=A0 "quant.base_q_idx =3D %u, "
> +		=C2=A0 "quant.delta_q_y_dc =3D %d, "
> +		=C2=A0 "quant.delta_q_uv_dc =3D %d, "
> +		=C2=A0 "quant.delta_q_uv_ac =3D %d, "
> +		=C2=A0 "seg.feature_data =3D {%s}, "
> +		=C2=A0 "seg.feature_enabled =3D %s, "
> +		=C2=A0 "seg.tree_probs =3D %s, "
> +		=C2=A0 "seg.pred_probs =3D %s, "
> +		=C2=A0 "seg.flags =3D %s, "
> +		=C2=A0 "flags =3D %s, "
> +		=C2=A0 "compressed_header_size =3D %u, "
> +		=C2=A0 "uncompressed_header_size =3D %u, "
> +		=C2=A0 "frame_width_minus_1 =3D %u, "
> +		=C2=A0 "frame_height_minus_1 =3D %u, "
> +		=C2=A0 "render_width_minus_1 =3D %u, "
> +		=C2=A0 "render_height_minus_1 =3D %u, "
> +		=C2=A0 "last_frame_ts =3D %llu, "
> +		=C2=A0 "golden_frame_ts =3D %llu, "
> +		=C2=A0 "alt_frame_ts =3D %llu, "
> +		=C2=A0 "ref_frame_sign_bias =3D %s, "
> +		=C2=A0 "reset_frame_context =3D %s, "
> +		=C2=A0 "frame_context_idx =3D %u, "
> +		=C2=A0 "profile =3D %u, "
> +		=C2=A0 "bit_depth =3D %u, "
> +		=C2=A0 "interpolation_filter =3D %s, "
> +		=C2=A0 "tile_cols_log2 =3D %u, "
> +		=C2=A0 "tile_rows_log_2 =3D %u, "
> +		=C2=A0 "reference_mode =3D %s",
> =C2=A0		=C2=A0 __print_array(__entry->f.lf.ref_deltas,
> =C2=A0				ARRAY_SIZE(__entry->f.lf.ref_deltas),
> =C2=A0				sizeof(__entry->f.lf.ref_deltas[0])),
> @@ -1487,20 +1494,20 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_=
tmpl,
> =C2=A0	TP_ARGS(h),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hd=
r,
> h)),
> =C2=A0	TP_fast_assign(__entry->h =3D *h;),
> -	TP_printk("\ntx_mode %s\n"
> -		=C2=A0 "tx8 {%s}\n"
> -		=C2=A0 "tx16 {%s}\n"
> -		=C2=A0 "tx32 {%s}\n"
> -		=C2=A0 "skip %s\n"
> -		=C2=A0 "inter_mode {%s}\n"
> -		=C2=A0 "interp_filter {%s}\n"
> -		=C2=A0 "is_inter %s\n"
> -		=C2=A0 "comp_mode %s\n"
> -		=C2=A0 "single_ref {%s}\n"
> -		=C2=A0 "comp_ref %s\n"
> -		=C2=A0 "y_mode {%s}\n"
> -		=C2=A0 "uv_mode {%s}\n"
> -		=C2=A0 "partition {%s}\n",
> +	TP_printk("tx_mode =3D %s, "
> +		=C2=A0 "tx8 =3D {%s}, "
> +		=C2=A0 "tx16 =3D {%s}, "
> +		=C2=A0 "tx32 =3D {%s}, "
> +		=C2=A0 "skip =3D %s, "
> +		=C2=A0 "inter_mode =3D {%s}, "
> +		=C2=A0 "interp_filter =3D {%s}, "
> +		=C2=A0 "is_inter =3D %s, "
> +		=C2=A0 "comp_mode =3D %s, "
> +		=C2=A0 "single_ref =3D {%s}, "
> +		=C2=A0 "comp_ref =3D %s, "
> +		=C2=A0 "y_mode =3D {%s}, "
> +		=C2=A0 "uv_mode =3D {%s}, "
> +		=C2=A0 "partition =3D {%s}",
> =C2=A0		=C2=A0 __print_symbolic(__entry->h.tx_mode,
> =C2=A0		=C2=A0 {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
> =C2=A0		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
> @@ -1563,7 +1570,7 @@ DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_t=
mpl,
> =C2=A0	TP_ARGS(h),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hd=
r,
> h)),
> =C2=A0	TP_fast_assign(__entry->h =3D *h;),
> -	TP_printk("\n coef {%s}",
> +	TP_printk("coef =3D {%s}",
> =C2=A0		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> =C2=A0				=C2=A0=C2=A0 __entry->h.coef,
> =C2=A0				=C2=A0=C2=A0 sizeof(__entry->h.coef),
> @@ -1576,15 +1583,15 @@ DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
> =C2=A0	TP_ARGS(p),
> =C2=A0	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
> =C2=A0	TP_fast_assign(__entry->p =3D *p;),
> -	TP_printk("\n joint %s\n"
> -		=C2=A0 "sign %s\n"
> -		=C2=A0 "classes {%s}\n"
> -		=C2=A0 "class0_bit %s\n"
> -		=C2=A0 "bits {%s}\n"
> -		=C2=A0 "class0_fr {%s}\n"
> -		=C2=A0 "fr {%s}\n"
> -		=C2=A0 "class0_hp %s\n"
> -		=C2=A0 "hp %s\n",
> +	TP_printk("joint =3D %s, "
> +		=C2=A0 "sign =3D %s, "
> +		=C2=A0 "classes =3D {%s}, "
> +		=C2=A0 "class0_bit =3D %s, "
> +		=C2=A0 "bits =3D {%s}, "
> +		=C2=A0 "class0_fr =3D {%s}, "
> +		=C2=A0 "fr =3D {%s}, "
> +		=C2=A0 "class0_hp =3D %s, "
> +		=C2=A0 "hp =3D %s",
> =C2=A0		=C2=A0 __print_array(__entry->p.joint,
> =C2=A0				ARRAY_SIZE(__entry->p.joint),
> =C2=A0				sizeof(__entry->p.joint[0])),

--=-PDVtxaEEKMrPa+JKVSrh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEKZwAKCRDZQZRRKWBy
9BPKAQCD69iGX1+Ta85ntUvH8XSDkKMYGHI68Ep+9fiykvJhbQEAqW0V3oJFXyzQ
XAwNXi2RfaINxS+2BgNp4t55Y/048Q8=
=i1YB
-----END PGP SIGNATURE-----

--=-PDVtxaEEKMrPa+JKVSrh--

