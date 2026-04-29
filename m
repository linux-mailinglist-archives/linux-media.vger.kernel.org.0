Return-Path: <linux-media+bounces-60010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIEEG/5N8mkapgEAu9opvQ
	(envelope-from <linux-media+bounces-60010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:29:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7674990D2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A03D302A08A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB749426D2A;
	Wed, 29 Apr 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jmpRZXw2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B057423173;
	Wed, 29 Apr 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486915; cv=none; b=uDRaJXuEHoD/9LdItT3ODqA4JcABUiNF8ydzfc9ssAN6rbAQ7HxUK4CMrZ7gpAlKC1+04lrM+a7EU0Gx54cmEhaE1GHXe8dGvfzkkf06GXI8VzL+pDZMGr4FG0B6K9sXVB7QW+jmxg8e6+z+9DKe+46uShm5j8t2G6POIwBtVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486915; c=relaxed/simple;
	bh=0X/k387a1O4LJwyDNS/WwhaQm8XzmSAW0aJa1MHStww=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LyOvD7NuTf5q4vUboIeHyxS+JOYYnC4I9HqhDK3GZy/UZm8NR0Cn1ZPD7neO3Ht1tWJUdpuITi0tt7BSatE0zXPL4pZqFe+fb4X7I+/9NJhTYf/6irV1jHHLhAaQJpiXzcTPQ942qP8lqeEToDcjBsksgf0pRrobiEs6Fpdwa8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jmpRZXw2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777486908;
	bh=0X/k387a1O4LJwyDNS/WwhaQm8XzmSAW0aJa1MHStww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jmpRZXw29G3Vgejt2Mm0xzrUTuCRAI46xXhgwUt34tDILwuRuSNPkOU/6A9+5qaQl
	 nlEJz2lHcoEchj33y1E51OfggRjZpwI0vBOqGXkJRsphlAyNrCNd+dIg7GhZ6YvSyS
	 mgGKwyK3F+8X7cLYzYZi2E1/T6dlVzALvMtRvmxm3zc0zI5euaY+R33zq5FiHPWMMS
	 JNt723u0qEDeNpgKclASYxQ255Wnper78QOCmhPE4uBTnl7n57MRHgryLxn9xFDTPp
	 W8/8i4Vw3TiEhDVs3CVRDiO/X4cRnEM2o0b1DzYNcu9fiBXTxWuQrWQPXO2RHZIL1M
	 k278Dh12szg2w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3E9E17E05FC;
	Wed, 29 Apr 2026 20:21:46 +0200 (CEST)
Message-ID: <08f53eefdc5c0cb93f85442a2ed2b25480594a36.camel@collabora.com>
Subject: Re: [PATCH v3 4/4] media: rkvdec: vdpu383: Drop bitfields for the
 bitwriter
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers	 <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, kernel@collabora.com
Date: Wed, 29 Apr 2026 14:21:45 -0400
In-Reply-To: <20260402-rkvdec-use-bitwriter-v3-4-2072474ceaf4@collabora.com>
References: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
	 <20260402-rkvdec-use-bitwriter-v3-4-2072474ceaf4@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-cuXIzhlTWlMkNdsAD+t9"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1E7674990D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60010-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


--=-cuXIzhlTWlMkNdsAD+t9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 10:06 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> The VDPU383 support for hevc and h264 use structs with bitfields to
> represent the SPS and PPS.
>=20
> Because the fields are mostly unaligned and numerous, it brings compiler
> issues, especially with clang.
>=20
> To prevent that, switch to using the global bitwriter previously
> introduced instead.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Ok good, I'll pick this series and apply the tiny edits on patch 1.

> ---
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 351 ++++++----=
----
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 502 +++++++++-=
-----------
> =C2=A02 files changed, 360 insertions(+), 493 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> index fb4f849d7366..5ec755733916 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
> @@ -15,105 +15,64 @@
> =C2=A0#include "rkvdec-cabac.h"
> =C2=A0#include "rkvdec-vdpu383-regs.h"
> =C2=A0#include "rkvdec-h264-common.h"
> -
> -struct rkvdec_sps {
> -	u16 seq_parameter_set_id:			4;
> -	u16 profile_idc:				8;
> -	u16 constraint_set3_flag:			1;
> -	u16 chroma_format_idc:				2;
> -	u16 bit_depth_luma:				3;
> -	u16 bit_depth_chroma:				3;
> -	u16 qpprime_y_zero_transform_bypass_flag:	1;
> -	u16 log2_max_frame_num_minus4:			4;
> -	u16 max_num_ref_frames:				5;
> -	u16 pic_order_cnt_type:				2;
> -	u16 log2_max_pic_order_cnt_lsb_minus4:		4;
> -	u16 delta_pic_order_always_zero_flag:		1;
> -
> -	u16 pic_width_in_mbs:				16;
> -	u16 pic_height_in_mbs:				16;
> -
> -	u16 frame_mbs_only_flag:			1;
> -	u16 mb_adaptive_frame_field_flag:		1;
> -	u16 direct_8x8_inference_flag:			1;
> -	u16 mvc_extension_enable:			1;
> -	u16 num_views:					2;
> -	u16 view_id0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10=
;
> -	u16 view_id1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10=
;
> -} __packed;
> -
> -struct rkvdec_pps {
> -	u32 pic_parameter_set_id:				8;
> -	u32 pps_seq_parameter_set_id:				5;
> -	u32 entropy_coding_mode_flag:				1;
> -	u32 bottom_field_pic_order_in_frame_present_flag:	1;
> -	u32 num_ref_idx_l0_default_active_minus1:		5;
> -	u32 num_ref_idx_l1_default_active_minus1:		5;
> -	u32 weighted_pred_flag:					1;
> -	u32 weighted_bipred_idc:				2;
> -	u32 pic_init_qp_minus26:				7;
> -	u32 pic_init_qs_minus26:				6;
> -	u32 chroma_qp_index_offset:				5;
> -	u32 deblocking_filter_control_present_flag:		1;
> -	u32 constrained_intra_pred_flag:			1;
> -	u32 redundant_pic_cnt_present:				1;
> -	u32 transform_8x8_mode_flag:				1;
> -	u32 second_chroma_qp_index_offset:			5;
> -	u32 scaling_list_enable_flag:				1;
> -	u32 is_longterm:					16;
> -	u32 voidx:						16;
> -
> -	// dpb
> -	u32 pic_field_flag:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1;
> -	u32 pic_associated_flag:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 cur_top_field:					32;
> -	u32 cur_bot_field:					32;
> -
> -	u32 top_field_order_cnt0:				32;
> -	u32 bot_field_order_cnt0:				32;
> -	u32 top_field_order_cnt1:				32;
> -	u32 bot_field_order_cnt1:				32;
> -	u32 top_field_order_cnt2:				32;
> -	u32 bot_field_order_cnt2:				32;
> -	u32 top_field_order_cnt3:				32;
> -	u32 bot_field_order_cnt3:				32;
> -	u32 top_field_order_cnt4:				32;
> -	u32 bot_field_order_cnt4:				32;
> -	u32 top_field_order_cnt5:				32;
> -	u32 bot_field_order_cnt5:				32;
> -	u32 top_field_order_cnt6:				32;
> -	u32 bot_field_order_cnt6:				32;
> -	u32 top_field_order_cnt7:				32;
> -	u32 bot_field_order_cnt7:				32;
> -	u32 top_field_order_cnt8:				32;
> -	u32 bot_field_order_cnt8:				32;
> -	u32 top_field_order_cnt9:				32;
> -	u32 bot_field_order_cnt9:				32;
> -	u32 top_field_order_cnt10:				32;
> -	u32 bot_field_order_cnt10:				32;
> -	u32 top_field_order_cnt11:				32;
> -	u32 bot_field_order_cnt11:				32;
> -	u32 top_field_order_cnt12:				32;
> -	u32 bot_field_order_cnt12:				32;
> -	u32 top_field_order_cnt13:				32;
> -	u32 bot_field_order_cnt13:				32;
> -	u32 top_field_order_cnt14:				32;
> -	u32 bot_field_order_cnt14:				32;
> -	u32 top_field_order_cnt15:				32;
> -	u32 bot_field_order_cnt15:				32;
> -
> -	u32 ref_field_flags:					16;
> -	u32 ref_topfield_used:					16;
> -	u32 ref_botfield_used:					16;
> -	u32 ref_colmv_use_flag:					16;
> -
> -	u32 reserved0:						30;
> -	u32 reserved[3];
> -} __packed;
> +#include "rkvdec-bitwriter.h"
> +
> +#define SEQ_PARAMETER_SET_ID				BW_FIELD(0, 4)
> +#define PROFILE_IDC					BW_FIELD(4, 8)
> +#define CONSTRAINT_SET3_FLAG				BW_FIELD(12, 1)
> +#define CHROMA_FORMAT_IDC				BW_FIELD(13, 2)
> +#define BIT_DEPTH_LUMA					BW_FIELD(15, 3)
> +#define BIT_DEPTH_CHROMA				BW_FIELD(18, 3)
> +#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG		BW_FIELD(21, 1)
> +#define LOG2_MAX_FRAME_NUM_MINUS4			BW_FIELD(22, 4)
> +#define MAX_NUM_REF_FRAMES				BW_FIELD(26, 5)
> +#define PIC_ORDER_CNT_TYPE				BW_FIELD(31, 2)
> +#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4		BW_FIELD(33, 4)
> +#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG		BW_FIELD(37, 1)
> +#define PIC_WIDTH_IN_MBS				BW_FIELD(38, 16)
> +#define PIC_HEIGHT_IN_MBS				BW_FIELD(54, 16)
> +#define FRAME_MBS_ONLY_FLAG				BW_FIELD(70, 1)
> +#define MB_ADAPTIVE_FRAME_FIELD_FLAG			BW_FIELD(71, 1)
> +#define DIRECT_8X8_INFERENCE_FLAG			BW_FIELD(72, 1)
> +#define MVC_EXTENSION_ENABLE				BW_FIELD(73, 1)
> +#define NUM_VIEWS					BW_FIELD(74, 2)
> +#define VIEW_ID(i)					BW_FIELD(76 + ((i) * 10), 10) // i: 0-1
> +
> +#define PIC_PARAMETER_SET_ID				BW_FIELD(96, 8)
> +#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(104, 5)
> +#define ENTROPY_CODING_MODE_FLAG			BW_FIELD(109, 1)
> +#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	BW_FIELD(110, 1)
> +#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		BW_FIELD(111 + ((i) * 5)=
, 5) // i: 0-1
> +#define WEIGHTED_PRED_FLAG				BW_FIELD(121, 1)
> +#define WEIGHTED_BIPRED_IDC				BW_FIELD(122, 2)
> +#define PIC_INIT_QP_MINUS26				BW_FIELD(124, 7)
> +#define PIC_INIT_QS_MINUS26				BW_FIELD(131, 6)
> +#define CHROMA_QP_INDEX_OFFSET				BW_FIELD(137, 5)
> +#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		BW_FIELD(142, 1)
> +#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(143, 1)
> +#define REDUNDANT_PIC_CNT_PRESENT			BW_FIELD(144, 1)
> +#define TRANSFORM_8X8_MODE_FLAG				BW_FIELD(145, 1)
> +#define SECOND_CHROMA_QP_INDEX_OFFSET			BW_FIELD(146, 5)
> +#define SCALING_LIST_ENABLE_FLAG			BW_FIELD(151, 1)
> +#define IS_LONG_TERM(i)					BW_FIELD(152 + (i), 1) // i: 0-15
> +
> +#define PIC_FIELD_FLAG					BW_FIELD(184, 1)
> +#define PIC_ASSOCIATED_FLAG				BW_FIELD(185, 1)
> +#define CUR_TOP_FIELD					BW_FIELD(186, 32)
> +#define CUR_BOT_FIELD					BW_FIELD(218, 32)
> +
> +#define TOP_FIELD_ORDER_CNT(i)				BW_FIELD(250 + (i) * 64, 32) // i: 0-1=
5
> +#define BOT_FIELD_ORDER_CNT(i)				BW_FIELD(282 + (i) * 64, 32) // i: 0-1=
5
> +
> +#define REF_FIELD_FLAGS(i)				BW_FIELD(1274 + (i), 1) // i: 0-15
> +#define REF_TOPFIELD_USED(i)				BW_FIELD(1290 + (i), 1) // i: 0-15
> +#define REF_BOTFIELD_USED(i)				BW_FIELD(1306 + (i), 1) // i: 0-15
> +#define REF_COLMV_USE_FLAG(i)				BW_FIELD(1322 + (i), 1) // i: 0-15
> +
> +#define SPS_SIZE					ALIGN(1322 + 16, 128)
> =C2=A0
> =C2=A0struct rkvdec_sps_pps {
> -	struct rkvdec_sps sps;
> -	struct rkvdec_pps pps;
> +	u32 info[SPS_SIZE / 8 / 4];
> =C2=A0} __packed;
> =C2=A0
> =C2=A0/* Data structure describing auxiliary buffer format. */
> @@ -130,67 +89,6 @@ struct rkvdec_h264_ctx {
> =C2=A0	struct vdpu383_regs_h26x regs;
> =C2=A0};
> =C2=A0
> -static noinline_for_stack void set_field_order_cnt(struct rkvdec_pps *pp=
s, const struct v4l2_h264_dpb_entry *dpb)
> -{
> -	pps->top_field_order_cnt0 =3D dpb[0].top_field_order_cnt;
> -	pps->bot_field_order_cnt0 =3D dpb[0].bottom_field_order_cnt;
> -	pps->top_field_order_cnt1 =3D dpb[1].top_field_order_cnt;
> -	pps->bot_field_order_cnt1 =3D dpb[1].bottom_field_order_cnt;
> -	pps->top_field_order_cnt2 =3D dpb[2].top_field_order_cnt;
> -	pps->bot_field_order_cnt2 =3D dpb[2].bottom_field_order_cnt;
> -	pps->top_field_order_cnt3 =3D dpb[3].top_field_order_cnt;
> -	pps->bot_field_order_cnt3 =3D dpb[3].bottom_field_order_cnt;
> -	pps->top_field_order_cnt4 =3D dpb[4].top_field_order_cnt;
> -	pps->bot_field_order_cnt4 =3D dpb[4].bottom_field_order_cnt;
> -	pps->top_field_order_cnt5 =3D dpb[5].top_field_order_cnt;
> -	pps->bot_field_order_cnt5 =3D dpb[5].bottom_field_order_cnt;
> -	pps->top_field_order_cnt6 =3D dpb[6].top_field_order_cnt;
> -	pps->bot_field_order_cnt6 =3D dpb[6].bottom_field_order_cnt;
> -	pps->top_field_order_cnt7 =3D dpb[7].top_field_order_cnt;
> -	pps->bot_field_order_cnt7 =3D dpb[7].bottom_field_order_cnt;
> -	pps->top_field_order_cnt8 =3D dpb[8].top_field_order_cnt;
> -	pps->bot_field_order_cnt8 =3D dpb[8].bottom_field_order_cnt;
> -	pps->top_field_order_cnt9 =3D dpb[9].top_field_order_cnt;
> -	pps->bot_field_order_cnt9 =3D dpb[9].bottom_field_order_cnt;
> -	pps->top_field_order_cnt10 =3D dpb[10].top_field_order_cnt;
> -	pps->bot_field_order_cnt10 =3D dpb[10].bottom_field_order_cnt;
> -	pps->top_field_order_cnt11 =3D dpb[11].top_field_order_cnt;
> -	pps->bot_field_order_cnt11 =3D dpb[11].bottom_field_order_cnt;
> -	pps->top_field_order_cnt12 =3D dpb[12].top_field_order_cnt;
> -	pps->bot_field_order_cnt12 =3D dpb[12].bottom_field_order_cnt;
> -	pps->top_field_order_cnt13 =3D dpb[13].top_field_order_cnt;
> -	pps->bot_field_order_cnt13 =3D dpb[13].bottom_field_order_cnt;
> -	pps->top_field_order_cnt14 =3D dpb[14].top_field_order_cnt;
> -	pps->bot_field_order_cnt14 =3D dpb[14].bottom_field_order_cnt;
> -	pps->top_field_order_cnt15 =3D dpb[15].top_field_order_cnt;
> -	pps->bot_field_order_cnt15 =3D dpb[15].bottom_field_order_cnt;
> -}
> -
> -static noinline_for_stack void set_dec_params(struct rkvdec_pps *pps, co=
nst struct v4l2_ctrl_h264_decode_params *dec_params)
> -{
> -	const struct v4l2_h264_dpb_entry *dpb =3D dec_params->dpb;
> -
> -	for (int i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> -		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
> -			pps->is_longterm |=3D (1 << i);
> -		pps->ref_field_flags |=3D
> -		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)) << i;
> -		pps->ref_colmv_use_flag |=3D
> -		 (!!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) << i;
> -		pps->ref_topfield_used |=3D
> -		 (!!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF)) << i;
> -		pps->ref_botfield_used |=3D
> -			(!!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)) << i;
> -	}
> -	pps->pic_field_flag =3D
> -		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC);
> -	pps->pic_associated_flag =3D
> -		!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD);
> -
> -	pps->cur_top_field =3D dec_params->top_field_order_cnt;
> -	pps->cur_bot_field =3D dec_params->bottom_field_order_cnt;
> -}
> -
> =C2=A0static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> =C2=A0{
> @@ -202,6 +100,7 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	struct rkvdec_h264_priv_tbl *priv_tbl =3D h264_ctx->priv_tbl.cpu;
> =C2=A0	struct rkvdec_sps_pps *hw_ps;
> =C2=A0	u32 pic_width, pic_height;
> +	int i;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * HW read the SPS/PPS information from PPS packet index by PPS id=
.
> @@ -213,23 +112,25 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	memset(hw_ps, 0, sizeof(*hw_ps));
> =C2=A0
> =C2=A0	/* write sps */
> -	hw_ps->sps.seq_parameter_set_id =3D sps->seq_parameter_set_id;
> -	hw_ps->sps.profile_idc =3D sps->profile_idc;
> -	hw_ps->sps.constraint_set3_flag =3D !!(sps->constraint_set_flags & (1 <=
< 3));
> -	hw_ps->sps.chroma_format_idc =3D sps->chroma_format_idc;
> -	hw_ps->sps.bit_depth_luma =3D sps->bit_depth_luma_minus8;
> -	hw_ps->sps.bit_depth_chroma =3D sps->bit_depth_chroma_minus8;
> -	hw_ps->sps.qpprime_y_zero_transform_bypass_flag =3D
> -		!!(sps->flags & V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS);
> -	hw_ps->sps.log2_max_frame_num_minus4 =3D sps->log2_max_frame_num_minus4=
;
> -	hw_ps->sps.max_num_ref_frames =3D sps->max_num_ref_frames;
> -	hw_ps->sps.pic_order_cnt_type =3D sps->pic_order_cnt_type;
> -	hw_ps->sps.log2_max_pic_order_cnt_lsb_minus4 =3D
> -		sps->log2_max_pic_order_cnt_lsb_minus4;
> -	hw_ps->sps.delta_pic_order_always_zero_flag =3D
> -		!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
> -	hw_ps->sps.mvc_extension_enable =3D 0;
> -	hw_ps->sps.num_views =3D 0;
> +	rkvdec_set_bw_field(hw_ps->info, SEQ_PARAMETER_SET_ID, sps->seq_paramet=
er_set_id);
> +	rkvdec_set_bw_field(hw_ps->info, PROFILE_IDC, sps->profile_idc);
> +	rkvdec_set_bw_field(hw_ps->info, CONSTRAINT_SET3_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->constraint_set_flags & (1 << 3)));
> +	rkvdec_set_bw_field(hw_ps->info, CHROMA_FORMAT_IDC, sps->chroma_format_=
idc);
> +	rkvdec_set_bw_field(hw_ps->info, BIT_DEPTH_LUMA, sps->bit_depth_luma_mi=
nus8);
> +	rkvdec_set_bw_field(hw_ps->info, BIT_DEPTH_CHROMA, sps->bit_depth_chrom=
a_minus8);
> +	rkvdec_set_bw_field(hw_ps->info, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_=
TRANSFORM_BYPASS));
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_MAX_FRAME_NUM_MINUS4,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_max_frame_num_minus4);
> +	rkvdec_set_bw_field(hw_ps->info, MAX_NUM_REF_FRAMES, sps->max_num_ref_f=
rames);
> +	rkvdec_set_bw_field(hw_ps->info, PIC_ORDER_CNT_TYPE, sps->pic_order_cnt=
_type);
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_max_pic_order_cnt_lsb_minus4);
> +	rkvdec_set_bw_field(hw_ps->info, DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER=
_ALWAYS_ZERO));
> +	rkvdec_set_bw_field(hw_ps->info, MVC_EXTENSION_ENABLE, 0);
> +	rkvdec_set_bw_field(hw_ps->info, NUM_VIEWS, 0);
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Use the SPS values since they are already in macroblocks
> @@ -245,48 +146,72 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	if (!!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC))
> =C2=A0		pic_height /=3D 2;
> =C2=A0
> -	hw_ps->sps.pic_width_in_mbs =3D pic_width;
> -	hw_ps->sps.pic_height_in_mbs =3D pic_height;
> +	rkvdec_set_bw_field(hw_ps->info, PIC_WIDTH_IN_MBS, pic_width);
> +	rkvdec_set_bw_field(hw_ps->info, PIC_HEIGHT_IN_MBS, pic_height);
> =C2=A0
> -	hw_ps->sps.frame_mbs_only_flag =3D
> -		!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
> -	hw_ps->sps.mb_adaptive_frame_field_flag =3D
> -		!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
> -	hw_ps->sps.direct_8x8_inference_flag =3D
> -		!!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
> +	rkvdec_set_bw_field(hw_ps->info, FRAME_MBS_ONLY_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)=
);
> +	rkvdec_set_bw_field(hw_ps->info, MB_ADAPTIVE_FRAME_FIELD_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRA=
ME_FIELD));
> +	rkvdec_set_bw_field(hw_ps->info, DIRECT_8X8_INFERENCE_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFE=
RENCE));
> =C2=A0
> =C2=A0	/* write pps */
> -	hw_ps->pps.pic_parameter_set_id =3D pps->pic_parameter_set_id;
> -	hw_ps->pps.pps_seq_parameter_set_id =3D pps->seq_parameter_set_id;
> -	hw_ps->pps.entropy_coding_mode_flag =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
> -	hw_ps->pps.bottom_field_pic_order_in_frame_present_flag =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRE=
SENT);
> -	hw_ps->pps.num_ref_idx_l0_default_active_minus1 =3D
> -		pps->num_ref_idx_l0_default_active_minus1;
> -	hw_ps->pps.num_ref_idx_l1_default_active_minus1 =3D
> -		pps->num_ref_idx_l1_default_active_minus1;
> -	hw_ps->pps.weighted_pred_flag =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
> -	hw_ps->pps.weighted_bipred_idc =3D pps->weighted_bipred_idc;
> -	hw_ps->pps.pic_init_qp_minus26 =3D pps->pic_init_qp_minus26;
> -	hw_ps->pps.pic_init_qs_minus26 =3D pps->pic_init_qs_minus26;
> -	hw_ps->pps.chroma_qp_index_offset =3D pps->chroma_qp_index_offset;
> -	hw_ps->pps.deblocking_filter_control_present_flag =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
> -	hw_ps->pps.constrained_intra_pred_flag =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> -	hw_ps->pps.redundant_pic_cnt_present =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
> -	hw_ps->pps.transform_8x8_mode_flag =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
> -	hw_ps->pps.second_chroma_qp_index_offset =3D pps->second_chroma_qp_inde=
x_offset;
> -	hw_ps->pps.scaling_list_enable_flag =3D
> -		!!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
> -
> -	set_field_order_cnt(&hw_ps->pps, dpb);
> -	set_dec_params(&hw_ps->pps, dec_params);
> +	rkvdec_set_bw_field(hw_ps->info, PIC_PARAMETER_SET_ID, pps->pic_paramet=
er_set_id);
> +	rkvdec_set_bw_field(hw_ps->info, PPS_SEQ_PARAMETER_SET_ID, pps->seq_par=
ameter_set_id);
> +	rkvdec_set_bw_field(hw_ps->info, ENTROPY_CODING_MODE_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_=
MODE));
> +	rkvdec_set_bw_field(hw_ps->info, BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESEN=
T_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags &
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_H264_PPS_FLAG_BOTTOM_FIELD_=
PIC_ORDER_IN_FRAME_PRESENT));
> +	rkvdec_set_bw_field(hw_ps->info, NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(0)=
,
> +			=C2=A0=C2=A0=C2=A0 pps->num_ref_idx_l0_default_active_minus1);
> +	rkvdec_set_bw_field(hw_ps->info, NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(1)=
,
> +			=C2=A0=C2=A0=C2=A0 pps->num_ref_idx_l1_default_active_minus1);
> +	rkvdec_set_bw_field(hw_ps->info, WEIGHTED_PRED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED))=
;
> +	rkvdec_set_bw_field(hw_ps->info, WEIGHTED_BIPRED_IDC, pps->weighted_bip=
red_idc);
> +	rkvdec_set_bw_field(hw_ps->info, PIC_INIT_QP_MINUS26, pps->pic_init_qp_=
minus26);
> +	rkvdec_set_bw_field(hw_ps->info, PIC_INIT_QS_MINUS26, pps->pic_init_qs_=
minus26);
> +	rkvdec_set_bw_field(hw_ps->info, CHROMA_QP_INDEX_OFFSET, pps->chroma_qp=
_index_offset);
> +	rkvdec_set_bw_field(hw_ps->info, DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG=
,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILT=
ER_CONTROL_PRESENT));
> +	rkvdec_set_bw_field(hw_ps->info, CONSTRAINED_INTRA_PRED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INT=
RA_PRED));
> +	rkvdec_set_bw_field(hw_ps->info, REDUNDANT_PIC_CNT_PRESENT,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_C=
NT_PRESENT));
> +	rkvdec_set_bw_field(hw_ps->info, TRANSFORM_8X8_MODE_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_M=
ODE));
> +	rkvdec_set_bw_field(hw_ps->info, SECOND_CHROMA_QP_INDEX_OFFSET,
> +			=C2=A0=C2=A0=C2=A0 pps->second_chroma_qp_index_offset);
> +	rkvdec_set_bw_field(hw_ps->info, SCALING_LIST_ENABLE_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_=
PRESENT));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> +		rkvdec_set_bw_field(hw_ps->info, TOP_FIELD_ORDER_CNT(i),
> +				=C2=A0=C2=A0=C2=A0 dpb[i].top_field_order_cnt);
> +		rkvdec_set_bw_field(hw_ps->info, BOT_FIELD_ORDER_CNT(i),
> +				=C2=A0=C2=A0=C2=A0 dpb[i].bottom_field_order_cnt);
> +
> +		rkvdec_set_bw_field(hw_ps->info, IS_LONG_TERM(i),
> +				=C2=A0=C2=A0=C2=A0 !!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_T=
ERM));
> +		rkvdec_set_bw_field(hw_ps->info, REF_FIELD_FLAGS(i),
> +				=C2=A0=C2=A0=C2=A0 !!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)=
);
> +		rkvdec_set_bw_field(hw_ps->info, REF_COLMV_USE_FLAG(i),
> +				=C2=A0=C2=A0=C2=A0 !!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE=
));
> +		rkvdec_set_bw_field(hw_ps->info, REF_TOPFIELD_USED(i),
> +				=C2=A0=C2=A0=C2=A0 !!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF));
> +		rkvdec_set_bw_field(hw_ps->info, REF_BOTFIELD_USED(i),
> +				=C2=A0=C2=A0=C2=A0 !!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF));
> +	}
> +
> +	rkvdec_set_bw_field(hw_ps->info, PIC_FIELD_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG=
_FIELD_PIC));
> +	rkvdec_set_bw_field(hw_ps->info, PIC_ASSOCIATED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG=
_BOTTOM_FIELD));
> =C2=A0
> +	rkvdec_set_bw_field(hw_ps->info, CUR_TOP_FIELD, dec_params->top_field_o=
rder_cnt);
> +	rkvdec_set_bw_field(hw_ps->info, CUR_BOT_FIELD, dec_params->bottom_fiel=
d_order_cnt);
> =C2=A0}
> =C2=A0
> =C2=A0static void rkvdec_write_regs(struct rkvdec_ctx *ctx)
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index 96d938ee70b0..3575338a531a 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -13,149 +13,106 @@
> =C2=A0#include "rkvdec-rcb.h"
> =C2=A0#include "rkvdec-hevc-common.h"
> =C2=A0#include "rkvdec-vdpu383-regs.h"
> +#include "rkvdec-bitwriter.h"
> +
> +#define VIDEO_PARAMETER_SET_ID				BW_FIELD(0, 4)
> +#define SEQ_PARAMETER_SET_ID				BW_FIELD(4, 4)
> +#define CHROMA_FORMAT_IDC				BW_FIELD(8, 2)
> +#define PIC_WIDTH_IN_LUMA_SAMPLES			BW_FIELD(10, 16)
> +#define PIC_HEIGHT_IN_LUMA_SAMPLES			BW_FIELD(26, 16)
> +#define BIT_DEPTH_LUMA					BW_FIELD(42, 3)
> +#define BIT_DEPTH_CHROMA				BW_FIELD(45, 3)
> +#define LOG2_MAX_PIC_ORDER_CNT_LSB			BW_FIELD(48, 5)
> +#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	BW_FIELD(53, 2)
> +#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			BW_FIELD(55, 3)
> +#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			BW_FIELD(58, 3)
> +#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	BW_FIELD(61, 2)
> +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		BW_FIELD(63, 3)
> +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		BW_FIELD(66, 3)
> +#define SCALING_LIST_ENABLED_FLAG			BW_FIELD(69, 1)
> +#define AMP_ENABLED_FLAG				BW_FIELD(70, 1)
> +#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		BW_FIELD(71, 1)
> +#define PCM_ENABLED_FLAG				BW_FIELD(72, 1)
> +#define PCM_SAMPLE_BIT_DEPTH_LUMA			BW_FIELD(73, 4)
> +#define PCM_SAMPLE_BIT_DEPTH_CHROMA			BW_FIELD(77, 4)
> +#define PCM_LOOP_FILTER_DISABLED_FLAG			BW_FIELD(81, 1)
> +#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	BW_FIELD(82, 3)
> +#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		BW_FIELD(85, 3)
> +#define NUM_SHORT_TERM_REF_PIC_SETS			BW_FIELD(88, 7)
> +#define LONG_TERM_REF_PICS_PRESENT_FLAG			BW_FIELD(95, 1)
> +#define NUM_LONG_TERM_REF_PICS_SPS			BW_FIELD(96, 6)
> +#define SPS_TEMPORAL_MVP_ENABLED_FLAG			BW_FIELD(102, 1)
> +#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		BW_FIELD(103, 1)
> +#define SPS_MAX_DEC_PIC_BUFFERING_MINUS1		BW_FIELD(111, 4)
> +#define SEPARATE_COLOUR_PLANE_FLAG			BW_FIELD(115, 1)
> +#define HIGH_PRECISION_OFFSETS_ENABLED_FLAG		BW_FIELD(116, 1)
> +#define PERSISTENT_RICE_ADAPTATION_ENABLED_FLAG		BW_FIELD(117, 1)
> +
> +/* PPS */
> +#define PIC_PARAMETER_SET_ID				BW_FIELD(118, 6)
> +#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(124, 4)
> +#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		BW_FIELD(128, 1)
> +#define OUTPUT_FLAG_PRESENT_FLAG			BW_FIELD(129, 1)
> +#define NUM_EXTRA_SLICE_HEADER_BITS			BW_FIELD(130, 13)
> +#define SIGN_DATA_HIDING_ENABLED_FLAG			BW_FIELD(143, 1)
> +#define CABAC_INIT_PRESENT_FLAG				BW_FIELD(144, 1)
> +#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			BW_FIELD(145, 4)
> +#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			BW_FIELD(149, 4)
> +#define INIT_QP_MINUS26					BW_FIELD(153, 7)
> +#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(160, 1)
> +#define TRANSFORM_SKIP_ENABLED_FLAG			BW_FIELD(161, 1)
> +#define CU_QP_DELTA_ENABLED_FLAG			BW_FIELD(162, 1)
> +#define LOG2_MIN_CU_QP_DELTA_SIZE			BW_FIELD(163, 3)
> +#define PPS_CB_QP_OFFSET				BW_FIELD(166, 5)
> +#define PPS_CR_QP_OFFSET				BW_FIELD(171, 5)
> +#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	BW_FIELD(176, 1)
> +#define WEIGHTED_PRED_FLAG				BW_FIELD(177, 1)
> +#define WEIGHTED_BIPRED_FLAG				BW_FIELD(178, 1)
> +#define TRANSQUANT_BYPASS_ENABLED_FLAG			BW_FIELD(179, 1)
> +#define TILES_ENABLED_FLAG				BW_FIELD(180, 1)
> +#define ENTROPY_CODING_SYNC_ENABLED_FLAG		BW_FIELD(181, 1)
> +#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	BW_FIELD(182, 1)
> +#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		BW_FIELD(183, 1)
> +#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		BW_FIELD(184, 1)
> +#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		BW_FIELD(185, 1)
> +#define PPS_BETA_OFFSET_DIV2				BW_FIELD(186, 4)
> +#define PPS_TC_OFFSET_DIV2				BW_FIELD(190, 4)
> +#define LISTS_MODIFICATION_PRESENT_FLAG			BW_FIELD(194, 1)
> +#define LOG2_PARALLEL_MERGE_LEVEL			BW_FIELD(195, 3)
> +#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	BW_FIELD(198, 1)
> +
> +/* pps extensions */
> +#define LOG2_MAX_TRANSFORM_SKIP_BLOCK_SIZE		BW_FIELD(202, 2)
> +#define CROSS_COMPONENT_PREDICTION_ENABLED_FLAG		BW_FIELD(204, 1)
> +#define CHROMA_QP_OFFSET_LIST_ENABLED_FLAG		BW_FIELD(205, 1)
> +#define LOG2_MIN_CU_CHROMA_QP_DELTA_SIZE		BW_FIELD(206, 3)
> +#define CB_QP_OFFSET_LIST(i)				BW_FIELD(209 + (i) * 5, 5) // i: 0-5
> +#define CB_CR_OFFSET_LIST(i)				BW_FIELD(239 + (i) * 5, 5) // i: 0-5
> +#define CHROMA_QP_OFFSET_LIST_LEN_MINUS1		BW_FIELD(269, 3)
> +
> +/* mvc0 && mvc1 */
> +#define MVC_FF						BW_FIELD(272, 16)
> +#define MVC_00						BW_FIELD(288, 9)
> +
> +/* poc info */
> +#define RESERVED2					BW_FIELD(297, 3)
> +#define CURRENT_POC					BW_FIELD(300, 32)
> +#define REF_PIC_POC(i)					BW_FIELD(332 + (i) * 32, 32) // i: 0-14
> +#define RESERVED3					BW_FIELD(812, 32)
> +#define REF_IS_VALID(i)					BW_FIELD(844 + (i), 1) // i: 0-14
> +#define RESERVED4					BW_FIELD(859, 1)
> +
> +/* tile info*/
> +#define NUM_TILE_COLUMNS				BW_FIELD(860, 5)
> +#define NUM_TILE_ROWS					BW_FIELD(865, 5)
> +#define COLUMN_WIDTH(i)					BW_FIELD(870 + (i) * 12, 12) // i: 0-19
> +#define ROW_HEIGHT(i)					BW_FIELD(1110 + (i) * 12, 12) // i: 0-21
> +
> +#define HEVC_SPS_SIZE					ALIGN(1110 + 22 * 12, 256)
> =C2=A0
> =C2=A0struct rkvdec_hevc_sps_pps {
> -	// SPS
> -	u16 video_parameters_set_id			: 4;
> -	u16 seq_parameters_set_id_sps			: 4;
> -	u16 chroma_format_idc				: 2;
> -	u16 width					: 16;
> -	u16 height					: 16;
> -	u16 bit_depth_luma				: 3;
> -	u16 bit_depth_chroma				: 3;
> -	u16 max_pic_order_count_lsb			: 5;
> -	u16 diff_max_min_luma_coding_block_size		: 2;
> -	u16 min_luma_coding_block_size			: 3;
> -	u16 min_transform_block_size			: 3;
> -	u16 diff_max_min_transform_block_size		: 2;
> -	u16 max_transform_hierarchy_depth_inter		: 3;
> -	u16 max_transform_hierarchy_depth_intra		: 3;
> -	u16 scaling_list_enabled_flag			: 1;
> -	u16 amp_enabled_flag				: 1;
> -	u16 sample_adaptive_offset_enabled_flag		: 1;
> -	u16 pcm_enabled_flag				: 1;
> -	u16 pcm_sample_bit_depth_luma			: 4;
> -	u16 pcm_sample_bit_depth_chroma			: 4;
> -	u16 pcm_loop_filter_disabled_flag		: 1;
> -	u16 diff_max_min_pcm_luma_coding_block_size	: 3;
> -	u16 min_pcm_luma_coding_block_size		: 3;
> -	u16 num_short_term_ref_pic_sets			: 7;
> -	u16 long_term_ref_pics_present_flag		: 1;
> -	u16 num_long_term_ref_pics_sps			: 6;
> -	u16 sps_temporal_mvp_enabled_flag		: 1;
> -	u16 strong_intra_smoothing_enabled_flag		: 1;
> -	u16 reserved0					: 7;
> -	u16 sps_max_dec_pic_buffering_minus1		: 4;
> -	u16 separate_colour_plane_flag			: 1;
> -	u16 high_precision_offsets_enabled_flag		: 1;
> -	u16 persistent_rice_adaptation_enabled_flag	: 1;
> -
> -	// PPS
> -	u16 picture_parameters_set_id			: 6;
> -	u16 seq_parameters_set_id_pps			: 4;
> -	u16 dependent_slice_segments_enabled_flag	: 1;
> -	u16 output_flag_present_flag			: 1;
> -	u16 num_extra_slice_header_bits			: 13;
> -	u16 sign_data_hiding_enabled_flag		: 1;
> -	u16 cabac_init_present_flag			: 1;
> -	u16 num_ref_idx_l0_default_active		: 4;
> -	u16 num_ref_idx_l1_default_active		: 4;
> -	u16 init_qp_minus26				: 7;
> -	u16 constrained_intra_pred_flag			: 1;
> -	u16 transform_skip_enabled_flag			: 1;
> -	u16 cu_qp_delta_enabled_flag			: 1;
> -	u16 log2_min_cb_size				: 3;
> -	u16 pps_cb_qp_offset				: 5;
> -	u16 pps_cr_qp_offset				: 5;
> -	u16 pps_slice_chroma_qp_offsets_present_flag	: 1;
> -	u16 weighted_pred_flag				: 1;
> -	u16 weighted_bipred_flag			: 1;
> -	u16 transquant_bypass_enabled_flag		: 1;
> -	u16 tiles_enabled_flag				: 1;
> -	u16 entropy_coding_sync_enabled_flag		: 1;
> -	u16 pps_loop_filter_across_slices_enabled_flag	: 1;
> -	u16 loop_filter_across_tiles_enabled_flag	: 1;
> -	u16 deblocking_filter_override_enabled_flag	: 1;
> -	u16 pps_deblocking_filter_disabled_flag		: 1;
> -	u16 pps_beta_offset_div2			: 4;
> -	u16 pps_tc_offset_div2				: 4;
> -	u16 lists_modification_present_flag		: 1;
> -	u16 log2_parallel_merge_level			: 3;
> -	u16 slice_segment_header_extension_present_flag	: 1;
> -	u16 reserved1					: 3;
> -
> -	// pps extensions
> -	u16 log2_max_transform_skip_block_size		: 2;
> -	u16 cross_component_prediction_enabled_flag	: 1;
> -	u16 chroma_qp_offset_list_enabled_flag		: 1;
> -	u16 log2_min_cu_chroma_qp_delta_size		: 3;
> -	u16 cb_qp_offset_list0				: 5;
> -	u16 cb_qp_offset_list1				: 5;
> -	u16 cb_qp_offset_list2				: 5;
> -	u16 cb_qp_offset_list3				: 5;
> -	u16 cb_qp_offset_list4				: 5;
> -	u16 cb_qp_offset_list5				: 5;
> -	u16 cb_cr_offset_list0				: 5;
> -	u16 cb_cr_offset_list1				: 5;
> -	u16 cb_cr_offset_list2				: 5;
> -	u16 cb_cr_offset_list3				: 5;
> -	u16 cb_cr_offset_list4				: 5;
> -	u16 cb_cr_offset_list5				: 5;
> -	u16 chroma_qp_offset_list_len_minus1		: 3;
> -
> -	/* mvc0 && mvc1 */
> -	u16 mvc_ff					: 16;
> -	u16 mvc_00					: 9;
> -
> -	/* poc info */
> -	u16 reserved2					: 3;
> -	u32 current_poc					: 32;
> -	u32 ref_pic_poc0				: 32;
> -	u32 ref_pic_poc1				: 32;
> -	u32 ref_pic_poc2				: 32;
> -	u32 ref_pic_poc3				: 32;
> -	u32 ref_pic_poc4				: 32;
> -	u32 ref_pic_poc5				: 32;
> -	u32 ref_pic_poc6				: 32;
> -	u32 ref_pic_poc7				: 32;
> -	u32 ref_pic_poc8				: 32;
> -	u32 ref_pic_poc9				: 32;
> -	u32 ref_pic_poc10				: 32;
> -	u32 ref_pic_poc11				: 32;
> -	u32 ref_pic_poc12				: 32;
> -	u32 ref_pic_poc13				: 32;
> -	u32 ref_pic_poc14				: 32;
> -	u32 reserved3					: 32;
> -	u32 ref_is_valid				: 15;
> -	u32 reserved4					: 1;
> -
> -	/* tile info*/
> -	u16 num_tile_columns				: 5;
> -	u16 num_tile_rows				: 5;
> -	u32 column_width0				: 24;
> -	u32 column_width1				: 24;
> -	u32 column_width2				: 24;
> -	u32 column_width3				: 24;
> -	u32 column_width4				: 24;
> -	u32 column_width5				: 24;
> -	u32 column_width6				: 24;
> -	u32 column_width7				: 24;
> -	u32 column_width8				: 24;
> -	u32 column_width9				: 24;
> -	u32 row_height0					: 24;
> -	u32 row_height1					: 24;
> -	u32 row_height2					: 24;
> -	u32 row_height3					: 24;
> -	u32 row_height4					: 24;
> -	u32 row_height5					: 24;
> -	u32 row_height6					: 24;
> -	u32 row_height7					: 24;
> -	u32 row_height8					: 24;
> -	u32 row_height9					: 24;
> -	u32 row_height10				: 24;
> -	u32 reserved5					: 2;
> -	u32 padding;
> -} __packed;
> +	u32 info[HEVC_SPS_SIZE / 8 / 4];
> +};
> =C2=A0
> =C2=A0struct rkvdec_hevc_priv_tbl {
> =C2=A0	struct rkvdec_hevc_sps_pps param_set;
> @@ -171,51 +128,6 @@ struct rkvdec_hevc_ctx {
> =C2=A0	struct vdpu383_regs_h26x		regs;
> =C2=A0};
> =C2=A0
> -static void set_column_row(struct rkvdec_hevc_sps_pps *hw_ps, u16 *colum=
n, u16 *row)
> -{
> -	hw_ps->column_width0 =3D column[0] | (column[1] << 12);
> -	hw_ps->row_height0 =3D row[0] | (row[1] << 12);
> -	hw_ps->column_width1 =3D column[2] | (column[3] << 12);
> -	hw_ps->row_height1 =3D row[2] | (row[3] << 12);
> -	hw_ps->column_width2 =3D column[4] | (column[5] << 12);
> -	hw_ps->row_height2 =3D row[4] | (row[5] << 12);
> -	hw_ps->column_width3 =3D column[6] | (column[7] << 12);
> -	hw_ps->row_height3 =3D row[6] | (row[7] << 12);
> -	hw_ps->column_width4 =3D column[8] | (column[9] << 12);
> -	hw_ps->row_height4 =3D row[8] | (row[9] << 12);
> -	hw_ps->column_width5 =3D column[10] | (column[11] << 12);
> -	hw_ps->row_height5 =3D row[10] | (row[11] << 12);
> -	hw_ps->column_width6 =3D column[12] | (column[13] << 12);
> -	hw_ps->row_height6 =3D row[12] | (row[13] << 12);
> -	hw_ps->column_width7 =3D column[14] | (column[15] << 12);
> -	hw_ps->row_height7 =3D row[14] | (row[15] << 12);
> -	hw_ps->column_width8 =3D column[16] | (column[17] << 12);
> -	hw_ps->row_height8 =3D row[16] | (row[17] << 12);
> -	hw_ps->column_width9 =3D column[18] | (column[19] << 12);
> -	hw_ps->row_height9 =3D row[18] | (row[19] << 12);
> -
> -	hw_ps->row_height10 =3D row[20] | (row[21] << 12);
> -}
> -
> -static void set_pps_ref_pic_poc(struct rkvdec_hevc_sps_pps *hw_ps, const=
 struct v4l2_hevc_dpb_entry *dpb)
> -{
> -	hw_ps->ref_pic_poc0 =3D dpb[0].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc1 =3D dpb[1].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc2 =3D dpb[2].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc3 =3D dpb[3].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc4 =3D dpb[4].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc5 =3D dpb[5].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc6 =3D dpb[6].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc7 =3D dpb[7].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc8 =3D dpb[8].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc9 =3D dpb[9].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc10 =3D dpb[10].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc11 =3D dpb[11].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc12 =3D dpb[12].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc13 =3D dpb[13].pic_order_cnt_val;
> -	hw_ps->ref_pic_poc14 =3D dpb[14].pic_order_cnt_val;
> -}
> -
> =C2=A0static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> =C2=A0{
> @@ -245,104 +157,130 @@ static void assemble_hw_pps(struct rkvdec_ctx *ct=
x,
> =C2=A0	memset(hw_ps, 0, sizeof(*hw_ps));
> =C2=A0
> =C2=A0	/* write sps */
> -	hw_ps->video_parameters_set_id =3D sps->video_parameter_set_id;
> -	hw_ps->seq_parameters_set_id_sps =3D sps->seq_parameter_set_id;
> -	hw_ps->chroma_format_idc =3D sps->chroma_format_idc;
> +	rkvdec_set_bw_field(hw_ps->info, VIDEO_PARAMETER_SET_ID, sps->video_par=
ameter_set_id);
> +	rkvdec_set_bw_field(hw_ps->info, SEQ_PARAMETER_SET_ID, sps->seq_paramet=
er_set_id);
> +	rkvdec_set_bw_field(hw_ps->info, CHROMA_FORMAT_IDC, sps->chroma_format_=
idc);
> =C2=A0
> =C2=A0	log2_min_cb_size =3D sps->log2_min_luma_coding_block_size_minus3 +=
 3;
> =C2=A0	width =3D sps->pic_width_in_luma_samples;
> =C2=A0	height =3D sps->pic_height_in_luma_samples;
> -	hw_ps->width =3D width;
> -	hw_ps->height =3D height;
> -	hw_ps->bit_depth_luma =3D sps->bit_depth_luma_minus8 + 8;
> -	hw_ps->bit_depth_chroma =3D sps->bit_depth_chroma_minus8 + 8;
> -	hw_ps->max_pic_order_count_lsb =3D sps->log2_max_pic_order_cnt_lsb_minu=
s4 + 4;
> -	hw_ps->diff_max_min_luma_coding_block_size =3D sps->log2_diff_max_min_l=
uma_coding_block_size;
> -	hw_ps->min_luma_coding_block_size =3D sps->log2_min_luma_coding_block_s=
ize_minus3 + 3;
> -	hw_ps->min_transform_block_size =3D sps->log2_min_luma_transform_block_=
size_minus2 + 2;
> -	hw_ps->diff_max_min_transform_block_size =3D
> -		sps->log2_diff_max_min_luma_transform_block_size;
> -	hw_ps->max_transform_hierarchy_depth_inter =3D sps->max_transform_hiera=
rchy_depth_inter;
> -	hw_ps->max_transform_hierarchy_depth_intra =3D sps->max_transform_hiera=
rchy_depth_intra;
> -	hw_ps->scaling_list_enabled_flag =3D
> -		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED);
> -	hw_ps->amp_enabled_flag =3D !!(sps->flags & V4L2_HEVC_SPS_FLAG_AMP_ENAB=
LED);
> -	hw_ps->sample_adaptive_offset_enabled_flag =3D
> -		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET);
> +
> +	rkvdec_set_bw_field(hw_ps->info, PIC_WIDTH_IN_LUMA_SAMPLES, width);
> +	rkvdec_set_bw_field(hw_ps->info, PIC_HEIGHT_IN_LUMA_SAMPLES, height);
> +	rkvdec_set_bw_field(hw_ps->info, BIT_DEPTH_LUMA, sps->bit_depth_luma_mi=
nus8 + 8);
> +	rkvdec_set_bw_field(hw_ps->info, BIT_DEPTH_CHROMA, sps->bit_depth_chrom=
a_minus8 + 8);
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_MAX_PIC_ORDER_CNT_LSB,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_max_pic_order_cnt_lsb_minus4 + 4);
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SI=
ZE,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_diff_max_min_luma_coding_block_size);
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_MIN_LUMA_CODING_BLOCK_SIZE,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_min_luma_coding_block_size_minus3 + 3);
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_MIN_TRANSFORM_BLOCK_SIZE,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_min_luma_transform_block_size_minus2 + 2=
);
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK=
_SIZE,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_diff_max_min_luma_transform_block_size);
> +	rkvdec_set_bw_field(hw_ps->info, MAX_TRANSFORM_HIERARCHY_DEPTH_INTER,
> +			=C2=A0=C2=A0=C2=A0 sps->max_transform_hierarchy_depth_inter);
> +	rkvdec_set_bw_field(hw_ps->info, MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA,
> +			=C2=A0=C2=A0=C2=A0 sps->max_transform_hierarchy_depth_intra);
> +	rkvdec_set_bw_field(hw_ps->info, SCALING_LIST_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_EN=
ABLED));
> +	rkvdec_set_bw_field(hw_ps->info, AMP_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_HEVC_SPS_FLAG_AMP_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE=
_OFFSET));
> =C2=A0
> =C2=A0	pcm_enabled =3D !!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED);
> -	hw_ps->pcm_enabled_flag =3D pcm_enabled;
> -	hw_ps->pcm_sample_bit_depth_luma =3D
> -		pcm_enabled ? sps->pcm_sample_bit_depth_luma_minus1 + 1 : 0;
> -	hw_ps->pcm_sample_bit_depth_chroma =3D
> -		pcm_enabled ? sps->pcm_sample_bit_depth_chroma_minus1 + 1 : 0;
> -	hw_ps->pcm_loop_filter_disabled_flag =3D
> -		!!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED);
> -	hw_ps->diff_max_min_pcm_luma_coding_block_size =3D
> -		sps->log2_diff_max_min_pcm_luma_coding_block_size;
> -	hw_ps->min_pcm_luma_coding_block_size =3D
> -		pcm_enabled ? sps->log2_min_pcm_luma_coding_block_size_minus3 + 3 : 0;
> -	hw_ps->num_short_term_ref_pic_sets =3D sps->num_short_term_ref_pic_sets=
;
> -	hw_ps->long_term_ref_pics_present_flag =3D
> -		!!(sps->flags & V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT);
> -	hw_ps->num_long_term_ref_pics_sps =3D sps->num_long_term_ref_pics_sps;
> -	hw_ps->sps_temporal_mvp_enabled_flag =3D
> -		!!(sps->flags & V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED);
> -	hw_ps->strong_intra_smoothing_enabled_flag =3D
> -		!!(sps->flags & V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED);
> -	hw_ps->sps_max_dec_pic_buffering_minus1 =3D sps->sps_max_dec_pic_buffer=
ing_minus1;
> +	rkvdec_set_bw_field(hw_ps->info, PCM_ENABLED_FLAG, pcm_enabled);
> +	rkvdec_set_bw_field(hw_ps->info, PCM_SAMPLE_BIT_DEPTH_LUMA,
> +			=C2=A0=C2=A0=C2=A0 pcm_enabled ? sps->pcm_sample_bit_depth_luma_minus=
1 + 1 : 0);
> +	rkvdec_set_bw_field(hw_ps->info, PCM_SAMPLE_BIT_DEPTH_CHROMA,
> +			=C2=A0=C2=A0=C2=A0 pcm_enabled ? sps->pcm_sample_bit_depth_chroma_min=
us1 + 1 : 0);
> +	rkvdec_set_bw_field(hw_ps->info, PCM_LOOP_FILTER_DISABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER=
_DISABLED));
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOC=
K_SIZE,
> +			=C2=A0=C2=A0=C2=A0 sps->log2_diff_max_min_pcm_luma_coding_block_size)=
;
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE,
> +			=C2=A0=C2=A0=C2=A0 pcm_enabled ? sps->log2_min_pcm_luma_coding_block_=
size_minus3 + 3 : 0);
> +	rkvdec_set_bw_field(hw_ps->info, NUM_SHORT_TERM_REF_PIC_SETS,
> +			=C2=A0=C2=A0=C2=A0 sps->num_short_term_ref_pic_sets);
> +	rkvdec_set_bw_field(hw_ps->info, LONG_TERM_REF_PICS_PRESENT_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_P=
ICS_PRESENT));
> +	rkvdec_set_bw_field(hw_ps->info, NUM_LONG_TERM_REF_PICS_SPS,
> +			=C2=A0=C2=A0=C2=A0 sps->num_long_term_ref_pics_sps);
> +	rkvdec_set_bw_field(hw_ps->info, SPS_TEMPORAL_MVP_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MV=
P_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, STRONG_INTRA_SMOOTHING_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(sps->flags & V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SM=
OOTHING_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, SPS_MAX_DEC_PIC_BUFFERING_MINUS1,
> +			=C2=A0=C2=A0=C2=A0 sps->sps_max_dec_pic_buffering_minus1);
> =C2=A0
> =C2=A0	/* write pps */
> -	hw_ps->picture_parameters_set_id =3D pps->pic_parameter_set_id;
> -	hw_ps->seq_parameters_set_id_pps =3D sps->seq_parameter_set_id;
> -	hw_ps->dependent_slice_segments_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED);
> -	hw_ps->output_flag_present_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_=
OUTPUT_FLAG_PRESENT);
> -	hw_ps->num_extra_slice_header_bits =3D pps->num_extra_slice_header_bits=
;
> -	hw_ps->sign_data_hiding_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED);
> -	hw_ps->cabac_init_present_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_C=
ABAC_INIT_PRESENT);
> -	hw_ps->num_ref_idx_l0_default_active =3D pps->num_ref_idx_l0_default_ac=
tive_minus1 + 1;
> -	hw_ps->num_ref_idx_l1_default_active =3D pps->num_ref_idx_l1_default_ac=
tive_minus1 + 1;
> -	hw_ps->init_qp_minus26 =3D pps->init_qp_minus26;
> -	hw_ps->constrained_intra_pred_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED);
> -	hw_ps->transform_skip_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED);
> -	hw_ps->cu_qp_delta_enabled_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_=
CU_QP_DELTA_ENABLED);
> -	hw_ps->log2_min_cb_size =3D log2_min_cb_size +
> -				=C2=A0 sps->log2_diff_max_min_luma_coding_block_size -
> -				=C2=A0 pps->diff_cu_qp_delta_depth;
> -	hw_ps->pps_cb_qp_offset =3D pps->pps_cb_qp_offset;
> -	hw_ps->pps_cr_qp_offset =3D pps->pps_cr_qp_offset;
> -	hw_ps->pps_slice_chroma_qp_offsets_present_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT=
);
> -	hw_ps->weighted_pred_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHT=
ED_PRED);
> -	hw_ps->weighted_bipred_flag =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIG=
HTED_BIPRED);
> -	hw_ps->transquant_bypass_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED);
> +	rkvdec_set_bw_field(hw_ps->info, PIC_PARAMETER_SET_ID, pps->pic_paramet=
er_set_id);
> +	rkvdec_set_bw_field(hw_ps->info, SEQ_PARAMETER_SET_ID, sps->seq_paramet=
er_set_id);
> +	rkvdec_set_bw_field(hw_ps->info, DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE=
_SEGMENT_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, OUTPUT_FLAG_PRESENT_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRE=
SENT));
> +	rkvdec_set_bw_field(hw_ps->info, NUM_EXTRA_SLICE_HEADER_BITS,
> +			=C2=A0=C2=A0=C2=A0 pps->num_extra_slice_header_bits);
> +	rkvdec_set_bw_field(hw_ps->info, SIGN_DATA_HIDING_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDIN=
G_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, CABAC_INIT_PRESENT_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRES=
ENT));
> +	rkvdec_set_bw_field(hw_ps->info, NUM_REF_IDX_L0_DEFAULT_ACTIVE,
> +			=C2=A0=C2=A0=C2=A0 pps->num_ref_idx_l0_default_active_minus1 + 1);
> +	rkvdec_set_bw_field(hw_ps->info, NUM_REF_IDX_L1_DEFAULT_ACTIVE,
> +			=C2=A0=C2=A0=C2=A0 pps->num_ref_idx_l1_default_active_minus1 + 1);
> +	rkvdec_set_bw_field(hw_ps->info, INIT_QP_MINUS26, pps->init_qp_minus26)=
;
> +	rkvdec_set_bw_field(hw_ps->info, CONSTRAINED_INTRA_PRED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_CONSTRAINED_INT=
RA_PRED));
> +	rkvdec_set_bw_field(hw_ps->info, TRANSFORM_SKIP_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_=
ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, CU_QP_DELTA_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENA=
BLED));
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_MIN_CU_QP_DELTA_SIZE, log2_min_cb=
_size +
> +			=C2=A0=C2=A0=C2=A0 sps->log2_diff_max_min_luma_coding_block_size -
> +			=C2=A0=C2=A0=C2=A0 pps->diff_cu_qp_delta_depth);
> +	rkvdec_set_bw_field(hw_ps->info, PPS_CB_QP_OFFSET, pps->pps_cb_qp_offse=
t);
> +	rkvdec_set_bw_field(hw_ps->info, PPS_CR_QP_OFFSET, pps->pps_cr_qp_offse=
t);
> +	rkvdec_set_bw_field(hw_ps->info, PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FL=
AG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags &
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHR=
OMA_QP_OFFSETS_PRESENT));
> +	rkvdec_set_bw_field(hw_ps->info, WEIGHTED_PRED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED))=
;
> +	rkvdec_set_bw_field(hw_ps->info, WEIGHTED_BIPRED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED=
));
> +	rkvdec_set_bw_field(hw_ps->info, TRANSQUANT_BYPASS_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPA=
SS_ENABLED));
> =C2=A0	tiles_enabled =3D !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED=
);
> -	hw_ps->tiles_enabled_flag =3D tiles_enabled;
> -	hw_ps->entropy_coding_sync_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED);
> -	hw_ps->pps_loop_filter_across_slices_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABL=
ED);
> -	hw_ps->loop_filter_across_tiles_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED);
> -	hw_ps->deblocking_filter_override_enabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED)=
;
> -	hw_ps->pps_deblocking_filter_disabled_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER);
> -	hw_ps->pps_beta_offset_div2 =3D pps->pps_beta_offset_div2;
> -	hw_ps->pps_tc_offset_div2 =3D pps->pps_tc_offset_div2;
> -	hw_ps->lists_modification_present_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT);
> -	hw_ps->log2_parallel_merge_level =3D pps->log2_parallel_merge_level_min=
us2 + 2;
> -	hw_ps->slice_segment_header_extension_present_flag =3D
> -		!!(pps->flags & V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRES=
ENT);
> -	hw_ps->num_tile_columns =3D tiles_enabled ? pps->num_tile_columns_minus=
1 + 1 : 1;
> -	hw_ps->num_tile_rows =3D tiles_enabled ? pps->num_tile_rows_minus1 + 1 =
: 1;
> -	hw_ps->mvc_ff =3D 0xffff;
> +	rkvdec_set_bw_field(hw_ps->info, TILES_ENABLED_FLAG, tiles_enabled);
> +	rkvdec_set_bw_field(hw_ps->info, ENTROPY_CODING_SYNC_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_=
SYNC_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_=
FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags &
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILT=
ER_ACROSS_SLICES_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACR=
OSS_TILES_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLA=
G,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags &
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_HEVC_PPS_FLAG_DEBLOCKING_FI=
LTER_OVERRIDE_ENABLED));
> +	rkvdec_set_bw_field(hw_ps->info, PPS_DEBLOCKING_FILTER_DISABLED_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEB=
LOCKING_FILTER));
> +	rkvdec_set_bw_field(hw_ps->info, PPS_BETA_OFFSET_DIV2, pps->pps_beta_of=
fset_div2);
> +	rkvdec_set_bw_field(hw_ps->info, PPS_TC_OFFSET_DIV2, pps->pps_tc_offset=
_div2);
> +	rkvdec_set_bw_field(hw_ps->info, LISTS_MODIFICATION_PRESENT_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags & V4L2_HEVC_PPS_FLAG_LISTS_MODIFICAT=
ION_PRESENT));
> +	rkvdec_set_bw_field(hw_ps->info, LOG2_PARALLEL_MERGE_LEVEL,
> +			=C2=A0=C2=A0=C2=A0 pps->log2_parallel_merge_level_minus2 + 2);
> +	rkvdec_set_bw_field(hw_ps->info, SLICE_SEGMENT_HEADER_EXTENSION_PRESENT=
_FLAG,
> +			=C2=A0=C2=A0=C2=A0 !!(pps->flags &
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT=
_HEADER_EXTENSION_PRESENT));
> +	rkvdec_set_bw_field(hw_ps->info, NUM_TILE_COLUMNS,
> +			=C2=A0=C2=A0=C2=A0 tiles_enabled ? pps->num_tile_columns_minus1 + 1 :=
 1);
> +	rkvdec_set_bw_field(hw_ps->info, NUM_TILE_ROWS,
> +			=C2=A0=C2=A0=C2=A0 tiles_enabled ? pps->num_tile_rows_minus1 + 1 : 1)=
;
> +	rkvdec_set_bw_field(hw_ps->info, MVC_FF, 0xffff);
> =C2=A0
> =C2=A0	// Setup tiles information
> =C2=A0	memset(column_width, 0, sizeof(column_width));
> @@ -367,15 +305,19 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0		row_height[0] =3D (height + max_cu_width - 1) / max_cu_width;
> =C2=A0	}
> =C2=A0
> -	set_column_row(hw_ps, column_width, row_height);
> +	for (i =3D 0; i < 20; i++)
> +		rkvdec_set_bw_field(hw_ps->info, COLUMN_WIDTH(i), column_width[i]);
> +	for (i =3D 0; i < 22; i++)
> +		rkvdec_set_bw_field(hw_ps->info, ROW_HEIGHT(i), row_height[i]);
> =C2=A0
> =C2=A0	// Setup POC information
> -	hw_ps->current_poc =3D dec_params->pic_order_cnt_val;
> +	rkvdec_set_bw_field(hw_ps->info, CURRENT_POC, dec_params->pic_order_cnt=
_val);
> =C2=A0
> -	set_pps_ref_pic_poc(hw_ps, dec_params->dpb);
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> -		u32 valid =3D !!(dec_params->num_active_dpb_entries > i);
> -		hw_ps->ref_is_valid |=3D valid << i;
> +		rkvdec_set_bw_field(hw_ps->info, REF_IS_VALID(i),
> +				=C2=A0=C2=A0=C2=A0 !!(dec_params->num_active_dpb_entries > i));
> +		rkvdec_set_bw_field(hw_ps->info, REF_PIC_POC(i),
> +				=C2=A0=C2=A0=C2=A0 dec_params->dpb[i].pic_order_cnt_val);
> =C2=A0	}
> =C2=A0}
> =C2=A0

--=-cuXIzhlTWlMkNdsAD+t9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJMOgAKCRDZQZRRKWBy
9KUOAQDL6IGY3XxfppPwl7yPDY39MERudDFnRsy/kTFZPtinbwEA+IpiEhyHdcOi
1EHbkTibWMWJAHevWn4nAnCW1r97/gI=
=aqW9
-----END PGP SIGNATURE-----

--=-cuXIzhlTWlMkNdsAD+t9--

