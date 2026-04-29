Return-Path: <linux-media+bounces-60009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCmzLFJM8mnNpQEAu9opvQ
	(envelope-from <linux-media+bounces-60009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:22:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C993498EFA
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23B0E305FA18
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09223FF890;
	Wed, 29 Apr 2026 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hm+812Ej"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C77F2BDC1C;
	Wed, 29 Apr 2026 18:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486833; cv=none; b=th7F0wz2i6wy5CsBvze3e/JT3OqEhFVdbI/3Xia5jYpNDoYPTMFwrawnNLcR+mLqphgZAeNXRBNot3pVGPNlskIH4Tfstx/kPWFKvgNVqiJ1+fvlx2cEk7+EGbAU+TN+J9QF1CxKW8OZ/9P07GCgxHsOlhvAz/DeJMyv4m6z2sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486833; c=relaxed/simple;
	bh=A0yMYceW7lDwcUwccIpA/QSfnS2oI2fbmHhIXGMgNrg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VFfGH2xSWSPkYUim35RvLPZQ8HbvHOI6EuwJiob831oiy8gALEWTIG3tQWwUAST92dwLSEYxZd7/cUIWfKRKFxW1C2/3e+0tdBP1mSs8ei+lXNZWMp9LKADo2hyvGf9FRtU6nZnh2gIEfORk9bHmK/0g92T5azZiWXWL++az6M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hm+812Ej; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777486829;
	bh=A0yMYceW7lDwcUwccIpA/QSfnS2oI2fbmHhIXGMgNrg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Hm+812EjTEzVSta2gjpehhwEjWJF+qa66tY2OecXzYOm1GLRRVYHiGg9bN2T6L0FW
	 7hGZ8nF3Vu8srmnIG4XKKLaBJ0WA9Q3W8iMtxR6t7pNXnryUsHnv1xlvVXTQfkdQUt
	 aKs0X94GWOVm1+FYl4OSdB0inJ82EkT7fF3L88Jfb79s5+f74WtFEVbd49sJrNO6PW
	 XZpwUz+VHE9m+ii978yxA7t+ZB++HxvKVjsvn47KWwPE3Dw0ogOiDFA7y6GBGn2OqD
	 nfldy0M5a8tWS5xO8FFxYSQ+H0pG7aca7YxeS7G2I14Qhfu8jyFGDTm5mGO5eo6FvN
	 NpfZG5Nty6yCA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB45217E05FC;
	Wed, 29 Apr 2026 20:20:27 +0200 (CEST)
Message-ID: <8264cf9b4fd67607f7da3154729415ee95eb9a22.camel@collabora.com>
Subject: Re: [PATCH v3 3/4] media: rkvdec: common: Drop bitfields for the
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
Date: Wed, 29 Apr 2026 14:20:27 -0400
In-Reply-To: <20260402-rkvdec-use-bitwriter-v3-3-2072474ceaf4@collabora.com>
References: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
	 <20260402-rkvdec-use-bitwriter-v3-3-2072474ceaf4@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-CaMwafiS78tOboB1UQMY"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3C993498EFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60009-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


--=-CaMwafiS78tOboB1UQMY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 avril 2026 =C3=A0 10:06 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> Currently, the common code files for hevc and h264 use structs with
> bitfields to represent the HW RPS buffer.
>=20
> Because the bitfields are mostly unaligned and numerous, it brings compil=
er
> issues, especially with clang.
>=20
> To prevent that, switch to using the global bitwriter previously
> introduced instead.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-h264-common.c=C2=A0 | 51 +-----=
------
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-h264-common.h=C2=A0 | 40 +++---=
----
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc-common.c=C2=A0 | 93 ++++--=
----------------
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc-common.h=C2=A0 | 57 ++++--=
-------
> =C2=A04 files changed, 44 insertions(+), 197 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
> index e28f06394470..54639512e456 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
> @@ -21,51 +21,6 @@
> =C2=A0
> =C2=A0#define RKVDEC_NUM_REFLIST		3
> =C2=A0
> -static void set_dpb_info(struct rkvdec_rps_entry *entries,
> -			 u8 reflist,
> -			 u8 refnum,
> -			 u8 info,
> -			 bool bottom)
> -{
> -	struct rkvdec_rps_entry *entry =3D &entries[(reflist * 4) + refnum / 8]=
;
> -	u8 idx =3D refnum % 8;
> -
> -	switch (idx) {
> -	case 0:
> -		entry->dpb_info0 =3D info;
> -		entry->bottom_flag0 =3D bottom;
> -		break;
> -	case 1:
> -		entry->dpb_info1 =3D info;
> -		entry->bottom_flag1 =3D bottom;
> -		break;
> -	case 2:
> -		entry->dpb_info2 =3D info;
> -		entry->bottom_flag2 =3D bottom;
> -		break;
> -	case 3:
> -		entry->dpb_info3 =3D info;
> -		entry->bottom_flag3 =3D bottom;
> -		break;
> -	case 4:
> -		entry->dpb_info4 =3D info;
> -		entry->bottom_flag4 =3D bottom;
> -		break;
> -	case 5:
> -		entry->dpb_info5 =3D info;
> -		entry->bottom_flag5 =3D bottom;
> -		break;
> -	case 6:
> -		entry->dpb_info6 =3D info;
> -		entry->bottom_flag6 =3D bottom;
> -		break;
> -	case 7:
> -		entry->dpb_info7 =3D info;
> -		entry->bottom_flag7 =3D bottom;
> -		break;
> -	}
> -}
> -
> =C2=A0void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
> =C2=A0			struct rkvdec_h264_run *run)
> =C2=A0{
> @@ -111,7 +66,7 @@ void assemble_hw_rps(struct v4l2_h264_reflist_builder =
*builder,
> =C2=A0		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> =C2=A0			continue;
> =C2=A0
> -		hw_rps->frame_num[i] =3D builder->refs[i].frame_num;
> +		rkvdec_set_bw_field(hw_rps->info, RPS_FRAME_NUM(i), builder->refs[i].f=
rame_num);
> =C2=A0	}
> =C2=A0
> =C2=A0	for (j =3D 0; j < RKVDEC_NUM_REFLIST; j++) {
> @@ -138,7 +93,9 @@ void assemble_hw_rps(struct v4l2_h264_reflist_builder =
*builder,
> =C2=A0			dpb_valid =3D !!(run->ref_buf[ref->index]);
> =C2=A0			bottom =3D ref->fields =3D=3D V4L2_H264_BOTTOM_FIELD_REF;
> =C2=A0
> -			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bo=
ttom);
> +			rkvdec_set_bw_field(hw_rps->info, RPS_ENTRY_DPB_INFO(j, i),
> +					=C2=A0=C2=A0=C2=A0 ref->index | (dpb_valid << 4));
> +			rkvdec_set_bw_field(hw_rps->info, RPS_ENTRY_BOTTOM_FLAG(j, i), bottom=
);
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> index 5336370507d6..f04b700b863c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
> @@ -16,6 +16,7 @@
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0
> =C2=A0#include "rkvdec.h"
> +#include "rkvdec-bitwriter.h"
> =C2=A0
> =C2=A0struct rkvdec_h264_scaling_list {
> =C2=A0	u8 scaling_list_4x4[6][16];
> @@ -38,39 +39,16 @@ struct rkvdec_h264_run {
> =C2=A0	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
> =C2=A0};
> =C2=A0
> -struct rkvdec_rps_entry {
> -	u32 dpb_info0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off0:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off1:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off2:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off3:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off4:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag5:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off5:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off6:=C2=A0=C2=A0=C2=A0 1;
> -	u32 dpb_info7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5;
> -	u32 bottom_flag7:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1;
> -	u32 view_index_off7:=C2=A0=C2=A0=C2=A0 1;
> -} __packed;
> +#define RPS_FRAME_NUM(i)		BW_FIELD((i) * 16, 16)
> +#define RPS_ENTRY_DPB_INFO(l, e)	BW_FIELD(288 + (l) * 7 * 32 + (e) * 7, =
5) //l: 0-2, e: 0-31
> +#define RPS_ENTRY_BOTTOM_FLAG(l, e)	BW_FIELD(293 + (l) * 7 * 32 + (e) * =
7, 1) //l: 0-2, e: 0-31
> +#define RPS_ENTRY_VIEW_INDEX_OFF(l, e)	BW_FIELD(294 + (l) * 7 * 32 + (e)=
 * 7, 1) //l: 0-2, e: 0-31
> +
> +#define RKVDEC_H264_RPS_SIZE		ALIGN(288 + 3 * 7 * 32, 128)
> =C2=A0
> =C2=A0struct rkvdec_rps {
> -	u16 frame_num[16];
> -	u32 reserved0;
> -	struct rkvdec_rps_entry entries[12];
> -	u32 reserved1[66];
> -} __packed;
> +	u32 info[RKVDEC_H264_RPS_SIZE / 8 / 4];
> +};
> =C2=A0
> =C2=A0void lookup_ref_buf_idx(struct rkvdec_ctx *ctx, struct rkvdec_h264_=
run *run);
> =C2=A0void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index 3119f3bc9f98..f89602075121 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -74,72 +74,6 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run =
*run, u16 log2_min_cb_size
> =C2=A0	row_height[i] =3D pic_in_cts_height - sum;
> =C2=A0}
> =C2=A0
> -static void set_ref_poc(struct rkvdec_rps_short_term_ref_set *set, int p=
oc, int value, int flag)
> -{
> -	switch (poc) {
> -	case 0:
> -		set->delta_poc0 =3D value;
> -		set->used_flag0 =3D flag;
> -		break;
> -	case 1:
> -		set->delta_poc1 =3D value;
> -		set->used_flag1 =3D flag;
> -		break;
> -	case 2:
> -		set->delta_poc2 =3D value;
> -		set->used_flag2 =3D flag;
> -		break;
> -	case 3:
> -		set->delta_poc3 =3D value;
> -		set->used_flag3 =3D flag;
> -		break;
> -	case 4:
> -		set->delta_poc4 =3D value;
> -		set->used_flag4 =3D flag;
> -		break;
> -	case 5:
> -		set->delta_poc5 =3D value;
> -		set->used_flag5 =3D flag;
> -		break;
> -	case 6:
> -		set->delta_poc6 =3D value;
> -		set->used_flag6 =3D flag;
> -		break;
> -	case 7:
> -		set->delta_poc7 =3D value;
> -		set->used_flag7 =3D flag;
> -		break;
> -	case 8:
> -		set->delta_poc8 =3D value;
> -		set->used_flag8 =3D flag;
> -		break;
> -	case 9:
> -		set->delta_poc9 =3D value;
> -		set->used_flag9 =3D flag;
> -		break;
> -	case 10:
> -		set->delta_poc10 =3D value;
> -		set->used_flag10 =3D flag;
> -		break;
> -	case 11:
> -		set->delta_poc11 =3D value;
> -		set->used_flag11 =3D flag;
> -		break;
> -	case 12:
> -		set->delta_poc12 =3D value;
> -		set->used_flag12 =3D flag;
> -		break;
> -	case 13:
> -		set->delta_poc13 =3D value;
> -		set->used_flag13 =3D flag;
> -		break;
> -	case 14:
> -		set->delta_poc14 =3D value;
> -		set->used_flag14 =3D flag;
> -		break;
> -	}
> -}
> -
> =C2=A0static void assemble_scalingfactor0(struct rkvdec_ctx *ctx, u8 *out=
put,
> =C2=A0				=C2=A0=C2=A0=C2=A0 const struct v4l2_ctrl_hevc_scaling_matrix *=
input)
> =C2=A0{
> @@ -218,10 +152,11 @@ static void rkvdec_hevc_assemble_hw_lt_rps(struct r=
kvdec_hevc_run *run, struct r
> =C2=A0		return;
> =C2=A0
> =C2=A0	for (int i =3D 0; i < sps->num_long_term_ref_pics_sps; i++) {
> -		rps->refs[i].lt_ref_pic_poc_lsb =3D
> -			run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps;
> -		rps->refs[i].used_by_curr_pic_lt_flag =3D
> -			!!(run->ext_sps_lt_rps[i].flags & V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_=
LT);
> +		rkvdec_set_bw_field(rps->info, RPS_LT_REF_PIC_POC_LSB(i),
> +				=C2=A0=C2=A0=C2=A0 run->ext_sps_lt_rps[i].lt_ref_pic_poc_lsb_sps);
> +		rkvdec_set_bw_field(rps->info, RPS_LT_REF_USED_BY_CURR_PIC(i),
> +				=C2=A0=C2=A0=C2=A0 !!(run->ext_sps_lt_rps[i].flags &
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_U=
SED_LT));
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -235,18 +170,24 @@ static void rkvdec_hevc_assemble_hw_st_rps(struct r=
kvdec_hevc_run *run, struct r
> =C2=A0		int j =3D 0;
> =C2=A0		const struct calculated_rps_st_set *set =3D &calculated_rps_st_se=
ts[i];
> =C2=A0
> -		rps->short_term_ref_sets[i].num_negative =3D set->num_negative_pics;
> -		rps->short_term_ref_sets[i].num_positive =3D set->num_positive_pics;
> +		rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_NUM_NEGATIVE(i),
> +				=C2=A0=C2=A0=C2=A0 set->num_negative_pics);
> +		rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_NUM_POSITIVE(i),
> +				=C2=A0=C2=A0=C2=A0 set->num_positive_pics);
> =C2=A0
> =C2=A0		for (; j < set->num_negative_pics; j++) {
> -			set_ref_poc(&rps->short_term_ref_sets[i], j,
> -				=C2=A0=C2=A0=C2=A0 set->delta_poc_s0[j], set->used_by_curr_pic_s0[j]=
);
> +			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_DELTA_POC(i, j),
> +					=C2=A0=C2=A0=C2=A0 set->delta_poc_s0[j]);
> +			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_USED(i, j),
> +					=C2=A0=C2=A0=C2=A0 set->used_by_curr_pic_s0[j]);
> =C2=A0		}
> =C2=A0		poc =3D j;
> =C2=A0
> =C2=A0		for (j =3D 0; j < set->num_positive_pics; j++) {
> -			set_ref_poc(&rps->short_term_ref_sets[i], poc + j,
> -				=C2=A0=C2=A0=C2=A0 set->delta_poc_s1[j], set->used_by_curr_pic_s1[j]=
);
> +			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_DELTA_POC(i, poc + j),
> +					=C2=A0=C2=A0=C2=A0 set->delta_poc_s1[j]);
> +			rkvdec_set_bw_field(rps->info, RPS_ST_REF_SET_USED(i, poc + j),
> +					=C2=A0=C2=A0=C2=A0 set->used_by_curr_pic_s1[j]);
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> index 6f4faca4c091..2a9b7719ab2d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
> @@ -19,53 +19,24 @@
> =C2=A0#include <linux/types.h>
> =C2=A0
> =C2=A0#include "rkvdec.h"
> +#include "rkvdec-bitwriter.h"
> =C2=A0
> -struct rkvdec_rps_refs {
> -	u16 lt_ref_pic_poc_lsb;
> -	u16 used_by_curr_pic_lt_flag	: 1;
> -	u16 reserved			: 15;
> -} __packed;
> +#define RPS_LT_REF_PIC_POC_LSB(i)	BW_FIELD(0 + (i) * 32, 16) // i: 0-31
> +#define RPS_LT_REF_USED_BY_CURR_PIC(i)	BW_FIELD(16 + (i) * 32, 1) // i: =
0-31
> =C2=A0
> -struct rkvdec_rps_short_term_ref_set {
> -	u32 num_negative	: 4;
> -	u32 num_positive	: 4;
> -	u32 delta_poc0		: 16;
> -	u32 used_flag0		: 1;
> -	u32 delta_poc1		: 16;
> -	u32 used_flag1		: 1;
> -	u32 delta_poc2		: 16;
> -	u32 used_flag2		: 1;
> -	u32 delta_poc3		: 16;
> -	u32 used_flag3		: 1;
> -	u32 delta_poc4		: 16;
> -	u32 used_flag4		: 1;
> -	u32 delta_poc5		: 16;
> -	u32 used_flag5		: 1;
> -	u32 delta_poc6		: 16;
> -	u32 used_flag6		: 1;
> -	u32 delta_poc7		: 16;
> -	u32 used_flag7		: 1;
> -	u32 delta_poc8		: 16;
> -	u32 used_flag8		: 1;
> -	u32 delta_poc9		: 16;
> -	u32 used_flag9		: 1;
> -	u32 delta_poc10		: 16;
> -	u32 used_flag10		: 1;
> -	u32 delta_poc11		: 16;
> -	u32 used_flag11		: 1;
> -	u32 delta_poc12		: 16;
> -	u32 used_flag12		: 1;
> -	u32 delta_poc13		: 16;
> -	u32 used_flag13		: 1;
> -	u32 delta_poc14		: 16;
> -	u32 used_flag14		: 1;
> -	u32 reserved_bits	: 25;
> -	u32 reserved[3];
> -} __packed;
> +#define RPS_ST_REF_SET_NUM_NEGATIVE(i)	BW_FIELD(1024 + ((i) * 384), 4) /=
/ i: 0-63
> +#define RPS_ST_REF_SET_NUM_POSITIVE(i)	BW_FIELD(1028 + ((i) * 384), 4) /=
/ i: 0-63
> +
> +// i: 0-63, j: 0-14
> +#define RPS_ST_REF_SET_DELTA_POC(i, j)	BW_FIELD(1032 + ((i) * 384) + ((j=
) * 17), 16)
> +
> +// i: 0-63, j: 0-14
> +#define RPS_ST_REF_SET_USED(i, j)	BW_FIELD(1048 + ((i) * 384) + ((j) * 1=
7), 1)
> +
> +#define RKVDEC_RPS_HEVC_SIZE		ALIGN(1032 + 64 * 384, 128)
> =C2=A0
> =C2=A0struct rkvdec_rps {
> -	struct rkvdec_rps_refs refs[32];
> -	struct rkvdec_rps_short_term_ref_set short_term_ref_sets[64];
> +	u32 info[RKVDEC_RPS_HEVC_SIZE / 8 / 4];
> =C2=A0} __packed;
> =C2=A0
> =C2=A0struct rkvdec_hevc_run {

--=-CaMwafiS78tOboB1UQMY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJL6wAKCRDZQZRRKWBy
9HmWAP4j99Gdhf0kSjoVV5x6lFTaRPC/+obND4fWNFIIMYr7mAD+Pst2irzTyg1X
wLvdtndKSuGxx8PI/6sixkj6oZSj+Ag=
=Bq3l
-----END PGP SIGNATURE-----

--=-CaMwafiS78tOboB1UQMY--

