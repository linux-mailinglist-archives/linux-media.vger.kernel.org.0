Return-Path: <linux-media+bounces-60008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEDHG7hM8mkFpgEAu9opvQ
	(envelope-from <linux-media+bounces-60008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:23:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8350498FAE
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32B2E30C1C1E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C8141B370;
	Wed, 29 Apr 2026 18:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HskHMxJx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5731F98F;
	Wed, 29 Apr 2026 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486753; cv=none; b=iaKLsFOmqea5S3dm/GPB15Ws6VSA7raXL00seIjxGTbiUHfDcGOIYMuGDuLHF78xW06iZTUuMmD9D4/yHJQjxrV5Vf82srqZiSQbz2F9crcrSmZqqUtB+VAc/plCNTleyTq1IpHvOXKtKZVl7TNkGCkNeSe/NTXlvscwL8b0UMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486753; c=relaxed/simple;
	bh=aKkWYLMkVydYaDKEDSTeDvwoHCxjqPm2bm20iAVQW7s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N2NFz0VOW/zrCG/a+ZemtAgpiKNNgAoUnmuGGWtwoCXaCzjWvBTLJzTKfjuLW4sSY+DoSY2beA7zWIIJIZpGW40dENtQXvxoZGDGuOUZU35DBlWg1NJ/X8ZXKvSCgfysNBl8SFJDfMccyudYgNrmvVoLlVjYT12jgjoqyVDUy4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HskHMxJx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777486748;
	bh=aKkWYLMkVydYaDKEDSTeDvwoHCxjqPm2bm20iAVQW7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HskHMxJxLNoM4UT54NMSOopHYhguS3MqaAeJHFPG/OxIqT/0Ncotfmgvvtt/iY13g
	 yyq2VzAMLwYVqSbPR4unU/rRmVQWLK+oZJmNpo7Wo7zjmpmbFzozzbIbyk57neHHCC
	 Wg+WXu+O5RJtzrwRhS+u84PTMUftspTvUsBNDWHKStvUDVrDSfRO3wZTqYp94Y7Ugm
	 JZPQrO7HGvBobnt6ZyF/gWZ7twaO99jCEAAW6C7yDgQpEMGiogh/ii5Gnggsi0pOgy
	 FpYWYy7u6tPkkLWcPIyEGgxc/tCosdJRADtLSaHKVrKVROVH9lunZgSSJE3cf+JX+/
	 bWi+BzU5N7NUw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CE5B17E1513;
	Wed, 29 Apr 2026 20:19:06 +0200 (CEST)
Message-ID: <e268ac45881daa62df13566a52daf078d6f531e6.camel@collabora.com>
Subject: Re: [PATCH v3 2/4] media: rkvdec: Use the global bitwriter instead
 of local one
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
Date: Wed, 29 Apr 2026 14:19:05 -0400
In-Reply-To: <20260402-rkvdec-use-bitwriter-v3-2-2072474ceaf4@collabora.com>
References: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
	 <20260402-rkvdec-use-bitwriter-v3-2-2072474ceaf4@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-7J5DwcbCHSuKKFphTuCX"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: E8350498FAE
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60008-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--=-7J5DwcbCHSuKKFphTuCX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 10:06 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> Both rkvdec-h264.c and rkvdec-hevc.c use their own bitwriter
> function and macros.
>=20
> Move to using the global one introduced before.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-h264.c=C2=A0=C2=A0 | 109 =
++++++-------
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0 | 171 =
+++++++++------------
> =C2=A02 files changed, 119 insertions(+), 161 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-h264.c
> index d3202cecb988..ffa606038192 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> @@ -16,6 +16,7 @@
> =C2=A0#include "rkvdec-regs.h"
> =C2=A0#include "rkvdec-cabac.h"
> =C2=A0#include "rkvdec-h264-common.h"
> +#include "rkvdec-bitwriter.h"
> =C2=A0
> =C2=A0/* Size with u32 units. */
> =C2=A0#define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
> @@ -25,56 +26,48 @@ struct rkvdec_sps_pps_packet {
> =C2=A0	u32 info[8];
> =C2=A0};
> =C2=A0
> -struct rkvdec_ps_field {
> -	u16 offset;
> -	u8 len;
> -};
> -
> -#define PS_FIELD(_offset, _len) \
> -	((struct rkvdec_ps_field){ _offset, _len })
> -
> -#define SEQ_PARAMETER_SET_ID				PS_FIELD(0, 4)
> -#define PROFILE_IDC					PS_FIELD(4, 8)
> -#define CONSTRAINT_SET3_FLAG				PS_FIELD(12, 1)
> -#define CHROMA_FORMAT_IDC				PS_FIELD(13, 2)
> -#define BIT_DEPTH_LUMA					PS_FIELD(15, 3)
> -#define BIT_DEPTH_CHROMA				PS_FIELD(18, 3)
> -#define QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG		PS_FIELD(21, 1)
> -#define LOG2_MAX_FRAME_NUM_MINUS4			PS_FIELD(22, 4)
> -#define MAX_NUM_REF_FRAMES				PS_FIELD(26, 5)
> -#define PIC_ORDER_CNT_TYPE				PS_FIELD(31, 2)
> -#define LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4		PS_FIELD(33, 4)
> -#define DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG		PS_FIELD(37, 1)
> -#define PIC_WIDTH_IN_MBS				PS_FIELD(38, 9)
> -#define PIC_HEIGHT_IN_MBS				PS_FIELD(47, 9)
> -#define FRAME_MBS_ONLY_FLAG				PS_FIELD(56, 1)
> -#define MB_ADAPTIVE_FRAME_FIELD_FLAG			PS_FIELD(57, 1)
> -#define DIRECT_8X8_INFERENCE_FLAG			PS_FIELD(58, 1)
> -#define MVC_EXTENSION_ENABLE				PS_FIELD(59, 1)
> -#define NUM_VIEWS					PS_FIELD(60, 2)
> -#define VIEW_ID(i)					PS_FIELD(62 + ((i) * 10), 10)
> -#define NUM_ANCHOR_REFS_L(i)				PS_FIELD(82 + ((i) * 11), 1)
> -#define ANCHOR_REF_L(i)				PS_FIELD(83 + ((i) * 11), 10)
> -#define NUM_NON_ANCHOR_REFS_L(i)			PS_FIELD(104 + ((i) * 11), 1)
> -#define NON_ANCHOR_REFS_L(i)				PS_FIELD(105 + ((i) * 11), 10)
> -#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 8)
> -#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(136, 5)
> -#define ENTROPY_CODING_MODE_FLAG			PS_FIELD(141, 1)
> -#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	PS_FIELD(142, 1)
> -#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		PS_FIELD(143 + ((i) * 5)=
, 5)
> -#define WEIGHTED_PRED_FLAG				PS_FIELD(153, 1)
> -#define WEIGHTED_BIPRED_IDC				PS_FIELD(154, 2)
> -#define PIC_INIT_QP_MINUS26				PS_FIELD(156, 7)
> -#define PIC_INIT_QS_MINUS26				PS_FIELD(163, 6)
> -#define CHROMA_QP_INDEX_OFFSET				PS_FIELD(169, 5)
> -#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		PS_FIELD(174, 1)
> -#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(175, 1)
> -#define REDUNDANT_PIC_CNT_PRESENT			PS_FIELD(176, 1)
> -#define TRANSFORM_8X8_MODE_FLAG			PS_FIELD(177, 1)
> -#define SECOND_CHROMA_QP_INDEX_OFFSET			PS_FIELD(178, 5)
> -#define SCALING_LIST_ENABLE_FLAG			PS_FIELD(183, 1)
> -#define SCALING_LIST_ADDRESS				PS_FIELD(184, 32)
> -#define IS_LONG_TERM(i)				PS_FIELD(216 + (i), 1)
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
> +#define PIC_WIDTH_IN_MBS				BW_FIELD(38, 9)
> +#define PIC_HEIGHT_IN_MBS				BW_FIELD(47, 9)
> +#define FRAME_MBS_ONLY_FLAG				BW_FIELD(56, 1)
> +#define MB_ADAPTIVE_FRAME_FIELD_FLAG			BW_FIELD(57, 1)
> +#define DIRECT_8X8_INFERENCE_FLAG			BW_FIELD(58, 1)
> +#define MVC_EXTENSION_ENABLE				BW_FIELD(59, 1)
> +#define NUM_VIEWS					BW_FIELD(60, 2)
> +#define VIEW_ID(i)					BW_FIELD(62 + ((i) * 10), 10)
> +#define NUM_ANCHOR_REFS_L(i)				BW_FIELD(82 + ((i) * 11), 1)
> +#define ANCHOR_REF_L(i)				BW_FIELD(83 + ((i) * 11), 10)
> +#define NUM_NON_ANCHOR_REFS_L(i)			BW_FIELD(104 + ((i) * 11), 1)
> +#define NON_ANCHOR_REFS_L(i)				BW_FIELD(105 + ((i) * 11), 10)
> +#define PIC_PARAMETER_SET_ID				BW_FIELD(128, 8)
> +#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(136, 5)
> +#define ENTROPY_CODING_MODE_FLAG			BW_FIELD(141, 1)
> +#define BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT_FLAG	BW_FIELD(142, 1)
> +#define NUM_REF_IDX_L_DEFAULT_ACTIVE_MINUS1(i)		BW_FIELD(143 + ((i) * 5)=
, 5)
> +#define WEIGHTED_PRED_FLAG				BW_FIELD(153, 1)
> +#define WEIGHTED_BIPRED_IDC				BW_FIELD(154, 2)
> +#define PIC_INIT_QP_MINUS26				BW_FIELD(156, 7)
> +#define PIC_INIT_QS_MINUS26				BW_FIELD(163, 6)
> +#define CHROMA_QP_INDEX_OFFSET				BW_FIELD(169, 5)
> +#define DEBLOCKING_FILTER_CONTROL_PRESENT_FLAG		BW_FIELD(174, 1)
> +#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(175, 1)
> +#define REDUNDANT_PIC_CNT_PRESENT			BW_FIELD(176, 1)
> +#define TRANSFORM_8X8_MODE_FLAG			BW_FIELD(177, 1)
> +#define SECOND_CHROMA_QP_INDEX_OFFSET			BW_FIELD(178, 5)
> +#define SCALING_LIST_ENABLE_FLAG			BW_FIELD(183, 1)
> +#define SCALING_LIST_ADDRESS				BW_FIELD(184, 32)
> +#define IS_LONG_TERM(i)				BW_FIELD(216 + (i), 1)
> =C2=A0
> =C2=A0/* Data structure describing auxiliary buffer format. */
> =C2=A0struct rkvdec_h264_priv_tbl {
> @@ -91,20 +84,6 @@ struct rkvdec_h264_ctx {
> =C2=A0	struct rkvdec_regs regs;
> =C2=A0};
> =C2=A0
> -static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 val=
ue)
> -{
> -	u8 bit =3D field.offset % 32, word =3D field.offset / 32;
> -	u64 mask =3D GENMASK_ULL(bit + field.len - 1, bit);
> -	u64 val =3D ((u64)value << bit) & mask;
> -
> -	buf[word] &=3D ~mask;
> -	buf[word] |=3D val;
> -	if (bit + field.len > 32) {
> -		buf[word + 1] &=3D ~(mask >> 32);
> -		buf[word + 1] |=3D val >> 32;
> -	}
> -}
> -
> =C2=A0static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> =C2=A0{
> @@ -128,7 +107,7 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	hw_ps =3D &priv_tbl->param_set[pps->pic_parameter_set_id];
> =C2=A0	memset(hw_ps, 0, sizeof(*hw_ps));
> =C2=A0
> -#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
> +#define WRITE_PPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, =
value)
> =C2=A0	/* write sps */
> =C2=A0	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
> =C2=A0	WRITE_PPS(sps->profile_idc, PROFILE_IDC);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index ac8b825d080a..87abf93dfd5e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -18,6 +18,7 @@
> =C2=A0#include "rkvdec-regs.h"
> =C2=A0#include "rkvdec-cabac.h"
> =C2=A0#include "rkvdec-hevc-common.h"
> +#include "rkvdec-bitwriter.h"
> =C2=A0
> =C2=A0/* Size in u8/u32 units. */
> =C2=A0#define RKV_SCALING_LIST_SIZE		1360
> @@ -34,80 +35,72 @@ struct rkvdec_rps_packet {
> =C2=A0	u32 info[RKV_RPS_SIZE];
> =C2=A0};
> =C2=A0
> -struct rkvdec_ps_field {
> -	u16 offset;
> -	u8 len;
> -};
> -
> -#define PS_FIELD(_offset, _len) \
> -	((struct rkvdec_ps_field){ _offset, _len })
> -
> =C2=A0/* SPS */
> -#define VIDEO_PARAMETER_SET_ID				PS_FIELD(0, 4)
> -#define SEQ_PARAMETER_SET_ID				PS_FIELD(4, 4)
> -#define CHROMA_FORMAT_IDC				PS_FIELD(8, 2)
> -#define PIC_WIDTH_IN_LUMA_SAMPLES			PS_FIELD(10, 13)
> -#define PIC_HEIGHT_IN_LUMA_SAMPLES			PS_FIELD(23, 13)
> -#define BIT_DEPTH_LUMA					PS_FIELD(36, 4)
> -#define BIT_DEPTH_CHROMA				PS_FIELD(40, 4)
> -#define LOG2_MAX_PIC_ORDER_CNT_LSB			PS_FIELD(44, 5)
> -#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	PS_FIELD(49, 2)
> -#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			PS_FIELD(51, 3)
> -#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			PS_FIELD(54, 3)
> -#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	PS_FIELD(57, 2)
> -#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		PS_FIELD(59, 3)
> -#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		PS_FIELD(62, 3)
> -#define SCALING_LIST_ENABLED_FLAG			PS_FIELD(65, 1)
> -#define AMP_ENABLED_FLAG				PS_FIELD(66, 1)
> -#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		PS_FIELD(67, 1)
> -#define PCM_ENABLED_FLAG				PS_FIELD(68, 1)
> -#define PCM_SAMPLE_BIT_DEPTH_LUMA			PS_FIELD(69, 4)
> -#define PCM_SAMPLE_BIT_DEPTH_CHROMA			PS_FIELD(73, 4)
> -#define PCM_LOOP_FILTER_DISABLED_FLAG			PS_FIELD(77, 1)
> -#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	PS_FIELD(78, 3)
> -#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		PS_FIELD(81, 3)
> -#define NUM_SHORT_TERM_REF_PIC_SETS			PS_FIELD(84, 7)
> -#define LONG_TERM_REF_PICS_PRESENT_FLAG			PS_FIELD(91, 1)
> -#define NUM_LONG_TERM_REF_PICS_SPS			PS_FIELD(92, 6)
> -#define SPS_TEMPORAL_MVP_ENABLED_FLAG			PS_FIELD(98, 1)
> -#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		PS_FIELD(99, 1)
> +#define VIDEO_PARAMETER_SET_ID				BW_FIELD(0, 4)
> +#define SEQ_PARAMETER_SET_ID				BW_FIELD(4, 4)
> +#define CHROMA_FORMAT_IDC				BW_FIELD(8, 2)
> +#define PIC_WIDTH_IN_LUMA_SAMPLES			BW_FIELD(10, 13)
> +#define PIC_HEIGHT_IN_LUMA_SAMPLES			BW_FIELD(23, 13)
> +#define BIT_DEPTH_LUMA					BW_FIELD(36, 4)
> +#define BIT_DEPTH_CHROMA				BW_FIELD(40, 4)
> +#define LOG2_MAX_PIC_ORDER_CNT_LSB			BW_FIELD(44, 5)
> +#define LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE	BW_FIELD(49, 2)
> +#define LOG2_MIN_LUMA_CODING_BLOCK_SIZE			BW_FIELD(51, 3)
> +#define LOG2_MIN_TRANSFORM_BLOCK_SIZE			BW_FIELD(54, 3)
> +#define LOG2_DIFF_MAX_MIN_LUMA_TRANSFORM_BLOCK_SIZE	BW_FIELD(57, 2)
> +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTER		BW_FIELD(59, 3)
> +#define MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA		BW_FIELD(62, 3)
> +#define SCALING_LIST_ENABLED_FLAG			BW_FIELD(65, 1)
> +#define AMP_ENABLED_FLAG				BW_FIELD(66, 1)
> +#define SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG		BW_FIELD(67, 1)
> +#define PCM_ENABLED_FLAG				BW_FIELD(68, 1)
> +#define PCM_SAMPLE_BIT_DEPTH_LUMA			BW_FIELD(69, 4)
> +#define PCM_SAMPLE_BIT_DEPTH_CHROMA			BW_FIELD(73, 4)
> +#define PCM_LOOP_FILTER_DISABLED_FLAG			BW_FIELD(77, 1)
> +#define LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	BW_FIELD(78, 3)
> +#define LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE		BW_FIELD(81, 3)
> +#define NUM_SHORT_TERM_REF_PIC_SETS			BW_FIELD(84, 7)
> +#define LONG_TERM_REF_PICS_PRESENT_FLAG			BW_FIELD(91, 1)
> +#define NUM_LONG_TERM_REF_PICS_SPS			BW_FIELD(92, 6)
> +#define SPS_TEMPORAL_MVP_ENABLED_FLAG			BW_FIELD(98, 1)
> +#define STRONG_INTRA_SMOOTHING_ENABLED_FLAG		BW_FIELD(99, 1)
> =C2=A0/* PPS */
> -#define PIC_PARAMETER_SET_ID				PS_FIELD(128, 6)
> -#define PPS_SEQ_PARAMETER_SET_ID			PS_FIELD(134, 4)
> -#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		PS_FIELD(138, 1)
> -#define OUTPUT_FLAG_PRESENT_FLAG			PS_FIELD(139, 1)
> -#define NUM_EXTRA_SLICE_HEADER_BITS			PS_FIELD(140, 13)
> -#define SIGN_DATA_HIDING_ENABLED_FLAG			PS_FIELD(153, 1)
> -#define CABAC_INIT_PRESENT_FLAG				PS_FIELD(154, 1)
> -#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			PS_FIELD(155, 4)
> -#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			PS_FIELD(159, 4)
> -#define INIT_QP_MINUS26					PS_FIELD(163, 7)
> -#define CONSTRAINED_INTRA_PRED_FLAG			PS_FIELD(170, 1)
> -#define TRANSFORM_SKIP_ENABLED_FLAG			PS_FIELD(171, 1)
> -#define CU_QP_DELTA_ENABLED_FLAG			PS_FIELD(172, 1)
> -#define LOG2_MIN_CU_QP_DELTA_SIZE			PS_FIELD(173, 3)
> -#define PPS_CB_QP_OFFSET				PS_FIELD(176, 5)
> -#define PPS_CR_QP_OFFSET				PS_FIELD(181, 5)
> -#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	PS_FIELD(186, 1)
> -#define WEIGHTED_PRED_FLAG				PS_FIELD(187, 1)
> -#define WEIGHTED_BIPRED_FLAG				PS_FIELD(188, 1)
> -#define TRANSQUANT_BYPASS_ENABLED_FLAG			PS_FIELD(189, 1)
> -#define TILES_ENABLED_FLAG				PS_FIELD(190, 1)
> -#define ENTROPY_CODING_SYNC_ENABLED_FLAG		PS_FIELD(191, 1)
> -#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	PS_FIELD(192, 1)
> -#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		PS_FIELD(193, 1)
> -#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		PS_FIELD(194, 1)
> -#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		PS_FIELD(195, 1)
> -#define PPS_BETA_OFFSET_DIV2				PS_FIELD(196, 4)
> -#define PPS_TC_OFFSET_DIV2				PS_FIELD(200, 4)
> -#define LISTS_MODIFICATION_PRESENT_FLAG			PS_FIELD(204, 1)
> -#define LOG2_PARALLEL_MERGE_LEVEL			PS_FIELD(205, 3)
> -#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	PS_FIELD(208, 1)
> -#define NUM_TILE_COLUMNS				PS_FIELD(212, 5)
> -#define NUM_TILE_ROWS					PS_FIELD(217, 5)
> -#define COLUMN_WIDTH(i)					PS_FIELD(256 + ((i) * 8), 8)
> -#define ROW_HEIGHT(i)					PS_FIELD(416 + ((i) * 8), 8)
> -#define SCALING_LIST_ADDRESS				PS_FIELD(592, 32)
> +#define PIC_PARAMETER_SET_ID				BW_FIELD(128, 6)
> +#define PPS_SEQ_PARAMETER_SET_ID			BW_FIELD(134, 4)
> +#define DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG		BW_FIELD(138, 1)
> +#define OUTPUT_FLAG_PRESENT_FLAG			BW_FIELD(139, 1)
> +#define NUM_EXTRA_SLICE_HEADER_BITS			BW_FIELD(140, 13)
> +#define SIGN_DATA_HIDING_ENABLED_FLAG			BW_FIELD(153, 1)
> +#define CABAC_INIT_PRESENT_FLAG				BW_FIELD(154, 1)
> +#define NUM_REF_IDX_L0_DEFAULT_ACTIVE			BW_FIELD(155, 4)
> +#define NUM_REF_IDX_L1_DEFAULT_ACTIVE			BW_FIELD(159, 4)
> +#define INIT_QP_MINUS26					BW_FIELD(163, 7)
> +#define CONSTRAINED_INTRA_PRED_FLAG			BW_FIELD(170, 1)
> +#define TRANSFORM_SKIP_ENABLED_FLAG			BW_FIELD(171, 1)
> +#define CU_QP_DELTA_ENABLED_FLAG			BW_FIELD(172, 1)
> +#define LOG2_MIN_CU_QP_DELTA_SIZE			BW_FIELD(173, 3)
> +#define PPS_CB_QP_OFFSET				BW_FIELD(176, 5)
> +#define PPS_CR_QP_OFFSET				BW_FIELD(181, 5)
> +#define PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG	BW_FIELD(186, 1)
> +#define WEIGHTED_PRED_FLAG				BW_FIELD(187, 1)
> +#define WEIGHTED_BIPRED_FLAG				BW_FIELD(188, 1)
> +#define TRANSQUANT_BYPASS_ENABLED_FLAG			BW_FIELD(189, 1)
> +#define TILES_ENABLED_FLAG				BW_FIELD(190, 1)
> +#define ENTROPY_CODING_SYNC_ENABLED_FLAG		BW_FIELD(191, 1)
> +#define PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED_FLAG	BW_FIELD(192, 1)
> +#define LOOP_FILTER_ACROSS_TILES_ENABLED_FLAG		BW_FIELD(193, 1)
> +#define DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG		BW_FIELD(194, 1)
> +#define PPS_DEBLOCKING_FILTER_DISABLED_FLAG		BW_FIELD(195, 1)
> +#define PPS_BETA_OFFSET_DIV2				BW_FIELD(196, 4)
> +#define PPS_TC_OFFSET_DIV2				BW_FIELD(200, 4)
> +#define LISTS_MODIFICATION_PRESENT_FLAG			BW_FIELD(204, 1)
> +#define LOG2_PARALLEL_MERGE_LEVEL			BW_FIELD(205, 3)
> +#define SLICE_SEGMENT_HEADER_EXTENSION_PRESENT_FLAG	BW_FIELD(208, 1)
> +#define NUM_TILE_COLUMNS				BW_FIELD(212, 5)
> +#define NUM_TILE_ROWS					BW_FIELD(217, 5)
> +#define COLUMN_WIDTH(i)					BW_FIELD(256 + ((i) * 8), 8)
> +#define ROW_HEIGHT(i)					BW_FIELD(416 + ((i) * 8), 8)
> +#define SCALING_LIST_ADDRESS				BW_FIELD(592, 32)
> =C2=A0
> =C2=A0/* Data structure describing auxiliary buffer format. */
> =C2=A0struct rkvdec_hevc_priv_tbl {
> @@ -123,20 +116,6 @@ struct rkvdec_hevc_ctx {
> =C2=A0	struct rkvdec_regs regs;
> =C2=A0};
> =C2=A0
> -static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 val=
ue)
> -{
> -	u8 bit =3D field.offset % 32, word =3D field.offset / 32;
> -	u64 mask =3D GENMASK_ULL(bit + field.len - 1, bit);
> -	u64 val =3D ((u64)value << bit) & mask;
> -
> -	buf[word] &=3D ~mask;
> -	buf[word] |=3D val;
> -	if (bit + field.len > 32) {
> -		buf[word + 1] &=3D ~(mask >> 32);
> -		buf[word + 1] |=3D val >> 32;
> -	}
> -}
> -
> =C2=A0static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct rkvdec_hevc_run *run)
> =C2=A0{
> @@ -159,7 +138,7 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	hw_ps =3D &priv_tbl->param_set[pps->pic_parameter_set_id];
> =C2=A0	memset(hw_ps, 0, sizeof(*hw_ps));
> =C2=A0
> -#define WRITE_PPS(value, field) set_ps_field(hw_ps->info, field, value)
> +#define WRITE_PPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, =
value)
> =C2=A0	/* write sps */
> =C2=A0	WRITE_PPS(sps->video_parameter_set_id, VIDEO_PARAMETER_SET_ID);
> =C2=A0	WRITE_PPS(sps->seq_parameter_set_id, SEQ_PARAMETER_SET_ID);
> @@ -321,17 +300,17 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
> =C2=A0	int i, j;
> =C2=A0	unsigned int lowdelay;
> =C2=A0
> -#define WRITE_RPS(value, field) set_ps_field(hw_ps->info, field, value)
> +#define WRITE_RPS(value, field) rkvdec_set_bw_field(hw_ps->info, field, =
value)
> =C2=A0
> -#define REF_PIC_LONG_TERM_L0(i)			PS_FIELD((i) * 5, 1)
> -#define REF_PIC_IDX_L0(i)			PS_FIELD(1 + ((i) * 5), 4)
> -#define REF_PIC_LONG_TERM_L1(i)			PS_FIELD(((i) < 5 ? 75 : 132) + ((i) *=
 5), 1)
> -#define REF_PIC_IDX_L1(i)			PS_FIELD(((i) < 4 ? 76 : 128) + ((i) * 5), 4=
)
> +#define REF_PIC_LONG_TERM_L0(n)			BW_FIELD((n) * 5, 1)
> +#define REF_PIC_IDX_L0(n)			BW_FIELD(1 + ((n) * 5), 4)
> +#define REF_PIC_LONG_TERM_L1(n)			BW_FIELD(((n) < 5 ? 75 : 132) + ((n) *=
 5), 1)
> +#define REF_PIC_IDX_L1(n)			BW_FIELD(((n) < 4 ? 76 : 128) + ((n) * 5), 4=
)
> =C2=A0
> -#define LOWDELAY				PS_FIELD(182, 1)
> -#define LONG_TERM_RPS_BIT_OFFSET		PS_FIELD(183, 10)
> -#define SHORT_TERM_RPS_BIT_OFFSET		PS_FIELD(193, 9)
> -#define NUM_RPS_POC				PS_FIELD(202, 4)
> +#define LOWDELAY				BW_FIELD(182, 1)
> +#define LONG_TERM_RPS_BIT_OFFSET		BW_FIELD(183, 10)
> +#define SHORT_TERM_RPS_BIT_OFFSET		BW_FIELD(193, 9)
> +#define NUM_RPS_POC				BW_FIELD(202, 4)
> =C2=A0
> =C2=A0	for (j =3D 0; j < run->num_slices; j++) {
> =C2=A0		uint st_bit_offset =3D 0;

--=-7J5DwcbCHSuKKFphTuCX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJLmQAKCRDZQZRRKWBy
9OtdAQDsXgDaQJ5QWC2uV7idSOAMyDqpiWGytBk391AuN9YnagEA9iavH7NA0e04
oxkvS/tcQvIgJMx8lLzxUF5DYHFo2Qo=
=LaNz
-----END PGP SIGNATURE-----

--=-7J5DwcbCHSuKKFphTuCX--

