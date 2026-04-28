Return-Path: <linux-media+bounces-59880-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Mu/NYsK8Wn1cAEAu9opvQ
	(envelope-from <linux-media+bounces-59880-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:29:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E318748B23D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4237130B3701
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A6747CC80;
	Tue, 28 Apr 2026 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZFiJvI5f"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D543D75A6;
	Tue, 28 Apr 2026 19:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404456; cv=none; b=Y33TVlwNdJAS+TYODn9zrayCcAat0EKYBZ7z7CrIJKfii6lss843+zeES2yLWIoN2bkAktJJAzu7FhqV9YYikXyJ2WuEBnFxvRBhm3iuh/VyUd6aJKb4dkR3GdIMvPr1m13cNkNdkQjvGRzIKdht4BKAw09QsyA0c03Wvmw7UfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404456; c=relaxed/simple;
	bh=jsnKa9MtBGJIpfNbhNYgbl1GfN7EUO0X45rGFu5uakk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tzy7PiIbXcONTYisZgXXsLVVIYKXFieWhq9jJ3XXaP7IeDwyqZD5XoDNBLl10EUIOmBov5WIbis+vxeZ6d6SxXF39/hSBUPGWBmzAMZ5huqAFZUM8UM3hYRnuska7xgSVNMr1re4eRR7qcF8JgE6HGwkVXAuPSz0oDKzW+ARejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZFiJvI5f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777404448;
	bh=jsnKa9MtBGJIpfNbhNYgbl1GfN7EUO0X45rGFu5uakk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ZFiJvI5fqiNCJ7M2rNAQH7jVK2YbcB0mKZIDwIsYwTO8ELmF3qUbXgeBWYXK0RqLn
	 BXdpnzECt/dQneQrrIc/v8JtWjop/bND0qCREXJEcbnA+1B28bLLDT7cxC8Vux4/cF
	 7MJbHcWKQlgk4wEI1j0zGOzZ0/jtAyvuHtX82zNl6LCt50eOBag2gEPnb3CiqtSdWh
	 n39tFBv9+2iV+yqFXMoinOdPbzgTNL9awIzM/+2dD8TfU/VTB0KYcRl0ozGYTjy5sD
	 F+KFxJN0ujvoL81PYGH7ogN6BZRNCx9f/zW7iICnieRvH2I2iZCGSh6fHgJaSYubQ2
	 MQfY/IWD56khQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A8F017E131F;
	Tue, 28 Apr 2026 21:27:25 +0200 (CEST)
Message-ID: <514f697a6fe99b7af84df0f8d290fb479c847b11.camel@collabora.com>
Subject: Re: [PATCH 01/11] media: Move visl traces to v4l2-core
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
Date: Tue, 28 Apr 2026 15:27:23 -0400
In-Reply-To: <20260212162328.192217-2-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-2-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-89W3h8ZnTLeTuYe6dkj2"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: E318748B23D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59880-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
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


--=-89W3h8ZnTLeTuYe6dkj2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> The visl driver defines traces for all stateless controls.
> Move those definition to a new v4l2_requests.h file and expose them for
> all drivers to use.
>=20
> As each event can be enabled individually in userspace, group them all in
> the same v4l2_requests event folder.
>=20
> Later, it can also be used by v4l2-core to trace controls as they are
> being set.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/test-drivers/visl/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0drivers/media/test-drivers/visl/visl-dec.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 8 +-
> =C2=A0.../media/test-drivers/visl/visl-trace-av1.h=C2=A0 |=C2=A0 314 ----
> =C2=A0.../media/test-drivers/visl/visl-trace-fwht.h |=C2=A0=C2=A0 66 -
> =C2=A0.../media/test-drivers/visl/visl-trace-h264.h |=C2=A0 349 ----
> =C2=A0.../media/test-drivers/visl/visl-trace-hevc.h |=C2=A0 464 -----
> =C2=A0.../test-drivers/visl/visl-trace-mpeg2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 99 -
> =C2=A0.../test-drivers/visl/visl-trace-points.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 11 -
> =C2=A0.../media/test-drivers/visl/visl-trace-vp8.h=C2=A0 |=C2=A0 156 --
> =C2=A0.../media/test-drivers/visl/visl-trace-vp9.h=C2=A0 |=C2=A0 292 ---
> =C2=A0drivers/media/v4l2-core/v4l2-trace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 45 +
> =C2=A0include/trace/events/v4l2_requests.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1645 +++++++++++++++++
> =C2=A012 files changed, 1692 insertions(+), 1759 deletions(-)
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-av1.h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.=
h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.=
h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-hevc.=
h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2=
.h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-point=
s.c
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
> =C2=A0delete mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
> =C2=A0create mode 100644 include/trace/events/v4l2_requests.h

Might want to check if the name of that header make sense. This is tracing
compound control structures, which can't be traced generically otherwise, I
could imagine this to be extended to any compound controls ?

Nicolas

>=20
> diff --git a/drivers/media/test-drivers/visl/Makefile b/drivers/media/tes=
t-drivers/visl/Makefile
> index fb4d5ae1b17f..a5049e2af844 100644
> --- a/drivers/media/test-drivers/visl/Makefile
> +++ b/drivers/media/test-drivers/visl/Makefile
> @@ -1,5 +1,5 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0+
> -visl-y :=3D visl-core.o visl-video.o visl-dec.o visl-trace-points.o
> +visl-y :=3D visl-core.o visl-video.o visl-dec.o
> =C2=A0
> =C2=A0ifeq ($(CONFIG_VISL_DEBUGFS),y)
> =C2=A0=C2=A0 visl-y +=3D visl-debugfs.o
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/t=
est-drivers/visl/visl-dec.c
> index 6bbf93757047..d49208e83726 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -7,18 +7,12 @@
> =C2=A0#include "visl.h"
> =C2=A0#include "visl-debugfs.h"
> =C2=A0#include "visl-dec.h"
> -#include "visl-trace-fwht.h"
> -#include "visl-trace-mpeg2.h"
> -#include "visl-trace-vp8.h"
> -#include "visl-trace-vp9.h"
> -#include "visl-trace-h264.h"
> -#include "visl-trace-hevc.h"
> -#include "visl-trace-av1.h"
> =C2=A0
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/workqueue.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/tpg/v4l2-tpg.h>
> +#include <trace/events/v4l2_requests.h>
> =C2=A0
> =C2=A0#define LAST_BUF_IDX (V4L2_AV1_REF_LAST_FRAME - V4L2_AV1_REF_LAST_F=
RAME)
> =C2=A0#define LAST2_BUF_IDX (V4L2_AV1_REF_LAST2_FRAME - V4L2_AV1_REF_LAST=
_FRAME)
> diff --git a/drivers/media/test-drivers/visl/visl-trace-av1.h b/drivers/m=
edia/test-drivers/visl/visl-trace-av1.h
> deleted file mode 100644
> index 09f205de53df..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-av1.h
> +++ /dev/null
> @@ -1,314 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#if !defined(_VISL_TRACE_AV1_H_) || defined(TRACE_HEADER_MULTI_READ)
> -#define _VISL_TRACE_AV1_H_
> -
> -#include <linux/tracepoint.h>
> -#include "visl.h"
> -
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM visl_av1_controls
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_sequence, s)),
> -	TP_fast_assign(__entry->s =3D *s;),
> -	TP_printk("\nflags %s\nseq_profile: %u\norder_hint_bits: %u\nbit_depth:=
 %u\n"
> -		=C2=A0 "max_frame_width_minus_1: %u\nmax_frame_height_minus_1: %u\n",
> -		=C2=A0 __print_flags(__entry->s.flags, "|",
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK, "USE_128X128_SU=
PERBLOCK"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA, "ENABLE_FILTER_INT=
RA"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER, "ENABLE_INTRA=
_EDGE_FILTER"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND, "ENABLE_INT=
ERINTRA_COMPOUND"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND, "ENABLE_MASKED_=
COMPOUND"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION, "ENABLE_WARPED_MO=
TION"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER, "ENABLE_DUAL_FILTER=
"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT, "ENABLE_ORDER_HINT"}=
,
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP, "ENABLE_JNT_COMP"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS, "ENABLE_REF_FRAME=
_MVS"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES, "ENABLE_SUPERRES"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF, "ENABLE_CDEF"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION, "ENABLE_RESTORATION=
"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME, "MONO_CHROME"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE, "COLOR_RANGE"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X, "SUBSAMPLING_X"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y, "SUBSAMPLING_Y"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT, "FILM_GRAIN_=
PARAMS_PRESENT"},
> -		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q, "SEPARATE_UV_DELTA=
_Q"}),
> -		=C2=A0 __entry->s.seq_profile,
> -		=C2=A0 __entry->s.order_hint_bits,
> -		=C2=A0 __entry->s.bit_depth,
> -		=C2=A0 __entry->s.max_frame_width_minus_1,
> -		=C2=A0 __entry->s.max_frame_height_minus_1
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
> -	TP_ARGS(t),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_tile_group_entry, =
t)),
> -	TP_fast_assign(__entry->t =3D *t;),
> -	TP_printk("\ntile_offset: %u\n tile_size: %u\n tile_row: %u\ntile_col: =
%u\n",
> -		=C2=A0 __entry->t.tile_offset,
> -		=C2=A0 __entry->t.tile_size,
> -		=C2=A0 __entry->t.tile_row,
> -		=C2=A0 __entry->t.tile_col
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\ntile_info.flags: %s\ntile_info.context_update_tile_id: %u\=
n"
> -		=C2=A0 "tile_info.tile_cols: %u\ntile_info.tile_rows: %u\n"
> -		=C2=A0 "tile_info.mi_col_starts: %s\ntile_info.mi_row_starts: %s\n"
> -		=C2=A0 "tile_info.width_in_sbs_minus_1: %s\ntile_info.height_in_sbs_mi=
nus_1: %s\n"
> -		=C2=A0 "tile_info.tile_size_bytes: %u\nquantization.flags: %s\n"
> -		=C2=A0 "quantization.base_q_idx: %u\nquantization.delta_q_y_dc: %d\n"
> -		=C2=A0 "quantization.delta_q_u_dc: %d\nquantization.delta_q_u_ac: %d\n=
"
> -		=C2=A0 "quantization.delta_q_v_dc: %d\nquantization.delta_q_v_ac: %d\n=
"
> -		=C2=A0 "quantization.qm_y: %u\nquantization.qm_u: %u\nquantization.qm_=
v: %u\n"
> -		=C2=A0 "quantization.delta_q_res: %u\nsuperres_denom: %u\nsegmentation=
.flags: %s\n"
> -		=C2=A0 "segmentation.last_active_seg_id: %u\nsegmentation.feature_enab=
led:%s\n"
> -		=C2=A0 "loop_filter.flags: %s\nloop_filter.level: %s\nloop_filter.shar=
pness: %u\n"
> -		=C2=A0 "loop_filter.ref_deltas: %s\nloop_filter.mode_deltas: %s\n"
> -		=C2=A0 "loop_filter.delta_lf_res: %u\ncdef.damping_minus_3: %u\ncdef.b=
its: %u\n"
> -		=C2=A0 "cdef.y_pri_strength: %s\ncdef.y_sec_strength: %s\n"
> -		=C2=A0 "cdef.uv_pri_strength: %s\ncdef.uv_sec_strength:%s\nskip_mode_f=
rame: %s\n"
> -		=C2=A0 "primary_ref_frame: %u\nloop_restoration.flags: %s\n"
> -		=C2=A0 "loop_restoration.lr_unit_shift: %u\nloop_restoration.lr_uv_shi=
ft: %u\n"
> -		=C2=A0 "loop_restoration.frame_restoration_type: %s\n"
> -		=C2=A0 "loop_restoration.loop_restoration_size: %s\nflags: %s\norder_h=
int: %u\n"
> -		=C2=A0 "upscaled_width: %u\nframe_width_minus_1: %u\nframe_height_minu=
s_1: %u\n"
> -		=C2=A0 "render_width_minus_1: %u\nrender_height_minus_1: %u\ncurrent_f=
rame_id: %u\n"
> -		=C2=A0 "buffer_removal_time: %s\norder_hints: %s\nreference_frame_ts: =
%s\n"
> -		=C2=A0 "ref_frame_idx: %s\nrefresh_frame_flags: %u\n",
> -		=C2=A0 __print_flags(__entry->f.tile_info.flags, "|",
> -		=C2=A0 {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING, "UNIFORM_TILE_SP=
ACING"}),
> -		=C2=A0 __entry->f.tile_info.context_update_tile_id,
> -		=C2=A0 __entry->f.tile_info.tile_cols,
> -		=C2=A0 __entry->f.tile_info.tile_rows,
> -		=C2=A0 __print_array(__entry->f.tile_info.mi_col_starts,
> -				ARRAY_SIZE(__entry->f.tile_info.mi_col_starts),
> -				sizeof(__entry->f.tile_info.mi_col_starts[0])),
> -		=C2=A0 __print_array(__entry->f.tile_info.mi_row_starts,
> -				ARRAY_SIZE(__entry->f.tile_info.mi_row_starts),
> -				sizeof(__entry->f.tile_info.mi_row_starts[0])),
> -		=C2=A0 __print_array(__entry->f.tile_info.width_in_sbs_minus_1,
> -				ARRAY_SIZE(__entry->f.tile_info.width_in_sbs_minus_1),
> -				sizeof(__entry->f.tile_info.width_in_sbs_minus_1[0])),
> -		=C2=A0 __print_array(__entry->f.tile_info.height_in_sbs_minus_1,
> -				ARRAY_SIZE(__entry->f.tile_info.height_in_sbs_minus_1),
> -				sizeof(__entry->f.tile_info.height_in_sbs_minus_1[0])),
> -		=C2=A0 __entry->f.tile_info.tile_size_bytes,
> -		=C2=A0 __print_flags(__entry->f.quantization.flags, "|",
> -		=C2=A0 {V4L2_AV1_QUANTIZATION_FLAG_DIFF_UV_DELTA, "DIFF_UV_DELTA"},
> -		=C2=A0 {V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX, "USING_QMATRIX"},
> -		=C2=A0 {V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT, "DELTA_Q_PRESENT"}=
),
> -		=C2=A0 __entry->f.quantization.base_q_idx,
> -		=C2=A0 __entry->f.quantization.delta_q_y_dc,
> -		=C2=A0 __entry->f.quantization.delta_q_u_dc,
> -		=C2=A0 __entry->f.quantization.delta_q_u_ac,
> -		=C2=A0 __entry->f.quantization.delta_q_v_dc,
> -		=C2=A0 __entry->f.quantization.delta_q_v_ac,
> -		=C2=A0 __entry->f.quantization.qm_y,
> -		=C2=A0 __entry->f.quantization.qm_u,
> -		=C2=A0 __entry->f.quantization.qm_v,
> -		=C2=A0 __entry->f.quantization.delta_q_res,
> -		=C2=A0 __entry->f.superres_denom,
> -		=C2=A0 __print_flags(__entry->f.segmentation.flags, "|",
> -		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_ENABLED, "ENABLED"},
> -		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP, "UPDATE_MAP"},
> -		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE, "TEMPORAL_UPDATE"}=
,
> -		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_UPDATE_DATA, "UPDATE_DATA"},
> -		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_SEG_ID_PRE_SKIP, "SEG_ID_PRE_SKIP"}=
),
> -		=C2=A0 __entry->f.segmentation.last_active_seg_id,
> -		=C2=A0 __print_array(__entry->f.segmentation.feature_enabled,
> -				ARRAY_SIZE(__entry->f.segmentation.feature_enabled),
> -				sizeof(__entry->f.segmentation.feature_enabled[0])),
> -		=C2=A0 __print_flags(__entry->f.loop_filter.flags, "|",
> -		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED, "DELTA_ENABLED"},
> -		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_UPDATE, "DELTA_UPDATE"},
> -		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT, "DELTA_LF_PRESENT"=
},
> -		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI, "DELTA_LF_MULTI"}),
> -		=C2=A0 __print_array(__entry->f.loop_filter.level,
> -				ARRAY_SIZE(__entry->f.loop_filter.level),
> -				sizeof(__entry->f.loop_filter.level[0])),
> -		=C2=A0 __entry->f.loop_filter.sharpness,
> -		=C2=A0 __print_array(__entry->f.loop_filter.ref_deltas,
> -				ARRAY_SIZE(__entry->f.loop_filter.ref_deltas),
> -				sizeof(__entry->f.loop_filter.ref_deltas[0])),
> -		=C2=A0 __print_array(__entry->f.loop_filter.mode_deltas,
> -				ARRAY_SIZE(__entry->f.loop_filter.mode_deltas),
> -				sizeof(__entry->f.loop_filter.mode_deltas[0])),
> -		=C2=A0 __entry->f.loop_filter.delta_lf_res,
> -		=C2=A0 __entry->f.cdef.damping_minus_3,
> -		=C2=A0 __entry->f.cdef.bits,
> -		=C2=A0 __print_array(__entry->f.cdef.y_pri_strength,
> -				ARRAY_SIZE(__entry->f.cdef.y_pri_strength),
> -				sizeof(__entry->f.cdef.y_pri_strength[0])),
> -		=C2=A0 __print_array(__entry->f.cdef.y_sec_strength,
> -				ARRAY_SIZE(__entry->f.cdef.y_sec_strength),
> -				sizeof(__entry->f.cdef.y_sec_strength[0])),
> -		=C2=A0 __print_array(__entry->f.cdef.uv_pri_strength,
> -				ARRAY_SIZE(__entry->f.cdef.uv_pri_strength),
> -				sizeof(__entry->f.cdef.uv_pri_strength[0])),
> -		=C2=A0 __print_array(__entry->f.cdef.uv_sec_strength,
> -				ARRAY_SIZE(__entry->f.cdef.uv_sec_strength),
> -				sizeof(__entry->f.cdef.uv_sec_strength[0])),
> -		=C2=A0 __print_array(__entry->f.skip_mode_frame,
> -				ARRAY_SIZE(__entry->f.skip_mode_frame),
> -				sizeof(__entry->f.skip_mode_frame[0])),
> -		=C2=A0 __entry->f.primary_ref_frame,
> -		=C2=A0 __print_flags(__entry->f.loop_restoration.flags, "|",
> -		=C2=A0 {V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR, "USES_LR"},
> -		=C2=A0 {V4L2_AV1_LOOP_RESTORATION_FLAG_USES_CHROMA_LR, "USES_CHROMA_LR=
"}),
> -		=C2=A0 __entry->f.loop_restoration.lr_unit_shift,
> -		=C2=A0 __entry->f.loop_restoration.lr_uv_shift,
> -		=C2=A0 __print_array(__entry->f.loop_restoration.frame_restoration_typ=
e,
> -				ARRAY_SIZE(__entry->f.loop_restoration.frame_restoration_type),
> -				sizeof(__entry->f.loop_restoration.frame_restoration_type[0])),
> -		=C2=A0 __print_array(__entry->f.loop_restoration.loop_restoration_size=
,
> -				ARRAY_SIZE(__entry->f.loop_restoration.loop_restoration_size),
> -				sizeof(__entry->f.loop_restoration.loop_restoration_size[0])),
> -		=C2=A0 __print_flags(__entry->f.flags, "|",
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME, "SHOWABLE_FRAME"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE, "ERROR_RESILIENT_MOD=
E"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE, "DISABLE_CDF_UPDATE"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS, "ALLOW_SCREEN_=
CONTENT_TOOLS"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV, "FORCE_INTEGER_MV"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC, "ALLOW_INTRABC"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_USE_SUPERRES, "USE_SUPERRES"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV, "ALLOW_HIGH_PRECI=
SION_MV"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE, "IS_MOTION_MODE=
_SWITCHABLE"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS, "USE_REF_FRAME_MVS"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF,
> -		=C2=A0=C2=A0 "DISABLE_FRAME_END_UPDATE_CDF"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION, "ALLOW_WARPED_MOTION"=
},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT, "REFERENCE_SELECT"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET, "REDUCED_TX_SET"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED, "SKIP_MODE_ALLOWED"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT, "SKIP_MODE_PRESENT"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE, "FRAME_SIZE_OVERRIDE"=
},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT, "BUFFER_REMOV=
AL_TIME_PRESENT"},
> -		=C2=A0 {V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING, "FRAME_REFS_SH=
ORT_SIGNALING"}),
> -		=C2=A0 __entry->f.order_hint,
> -		=C2=A0 __entry->f.upscaled_width,
> -		=C2=A0 __entry->f.frame_width_minus_1,
> -		=C2=A0 __entry->f.frame_height_minus_1,
> -		=C2=A0 __entry->f.render_width_minus_1,
> -		=C2=A0 __entry->f.render_height_minus_1,
> -		=C2=A0 __entry->f.current_frame_id,
> -		=C2=A0 __print_array(__entry->f.buffer_removal_time,
> -				ARRAY_SIZE(__entry->f.buffer_removal_time),
> -				sizeof(__entry->f.buffer_removal_time[0])),
> -		=C2=A0 __print_array(__entry->f.order_hints,
> -				ARRAY_SIZE(__entry->f.order_hints),
> -				sizeof(__entry->f.order_hints[0])),
> -		=C2=A0 __print_array(__entry->f.reference_frame_ts,
> -				ARRAY_SIZE(__entry->f.reference_frame_ts),
> -				sizeof(__entry->f.reference_frame_ts[0])),
> -		=C2=A0 __print_array(__entry->f.ref_frame_idx,
> -				ARRAY_SIZE(__entry->f.ref_frame_idx),
> -				sizeof(__entry->f.ref_frame_idx[0])),
> -		=C2=A0 __entry->f.refresh_frame_flags
> -	)
> -);
> -
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_film_grain, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\nflags %s\ncr_mult: %u\ngrain_seed: %u\n"
> -		=C2=A0 "film_grain_params_ref_idx: %u\nnum_y_points: %u\npoint_y_value=
: %s\n"
> -		=C2=A0 "point_y_scaling: %s\nnum_cb_points: %u\npoint_cb_value: %s\n"
> -		=C2=A0 "point_cb_scaling: %s\nnum_cr_points: %u\npoint_cr_value: %s\n"
> -		=C2=A0 "point_cr_scaling: %s\ngrain_scaling_minus_8: %u\nar_coeff_lag:=
 %u\n"
> -		=C2=A0 "ar_coeffs_y_plus_128: %s\nar_coeffs_cb_plus_128: %s\n"
> -		=C2=A0 "ar_coeffs_cr_plus_128: %s\nar_coeff_shift_minus_6: %u\n"
> -		=C2=A0 "grain_scale_shift: %u\ncb_mult: %u\ncb_luma_mult: %u\ncr_luma_=
mult: %u\n"
> -		=C2=A0 "cb_offset: %u\ncr_offset: %u\n",
> -		=C2=A0 __print_flags(__entry->f.flags, "|",
> -		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
> -		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
> -		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA, "CHROMA_SCA=
LING_FROM_LUMA"},
> -		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_OVERLAP, "OVERLAP"},
> -		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_CLIP_TO_RESTRICTED_RANGE, "CLIP_TO_RE=
STRICTED_RANGE"}),
> -		=C2=A0 __entry->f.cr_mult,
> -		=C2=A0 __entry->f.grain_seed,
> -		=C2=A0 __entry->f.film_grain_params_ref_idx,
> -		=C2=A0 __entry->f.num_y_points,
> -		=C2=A0 __print_array(__entry->f.point_y_value,
> -				ARRAY_SIZE(__entry->f.point_y_value),
> -				sizeof(__entry->f.point_y_value[0])),
> -		=C2=A0 __print_array(__entry->f.point_y_scaling,
> -				ARRAY_SIZE(__entry->f.point_y_scaling),
> -				sizeof(__entry->f.point_y_scaling[0])),
> -		=C2=A0 __entry->f.num_cb_points,
> -		=C2=A0 __print_array(__entry->f.point_cb_value,
> -				ARRAY_SIZE(__entry->f.point_cb_value),
> -				sizeof(__entry->f.point_cb_value[0])),
> -		=C2=A0 __print_array(__entry->f.point_cb_scaling,
> -				ARRAY_SIZE(__entry->f.point_cb_scaling),
> -				sizeof(__entry->f.point_cb_scaling[0])),
> -		=C2=A0 __entry->f.num_cr_points,
> -		=C2=A0 __print_array(__entry->f.point_cr_value,
> -				ARRAY_SIZE(__entry->f.point_cr_value),
> -				sizeof(__entry->f.point_cr_value[0])),
> -		=C2=A0 __print_array(__entry->f.point_cr_scaling,
> -				ARRAY_SIZE(__entry->f.point_cr_scaling),
> -				sizeof(__entry->f.point_cr_scaling[0])),
> -		=C2=A0 __entry->f.grain_scaling_minus_8,
> -		=C2=A0 __entry->f.ar_coeff_lag,
> -		=C2=A0 __print_array(__entry->f.ar_coeffs_y_plus_128,
> -				ARRAY_SIZE(__entry->f.ar_coeffs_y_plus_128),
> -				sizeof(__entry->f.ar_coeffs_y_plus_128[0])),
> -		=C2=A0 __print_array(__entry->f.ar_coeffs_cb_plus_128,
> -				ARRAY_SIZE(__entry->f.ar_coeffs_cb_plus_128),
> -				sizeof(__entry->f.ar_coeffs_cb_plus_128[0])),
> -		=C2=A0 __print_array(__entry->f.ar_coeffs_cr_plus_128,
> -				ARRAY_SIZE(__entry->f.ar_coeffs_cr_plus_128),
> -				sizeof(__entry->f.ar_coeffs_cr_plus_128[0])),
> -		=C2=A0 __entry->f.ar_coeff_shift_minus_6,
> -		=C2=A0 __entry->f.grain_scale_shift,
> -		=C2=A0 __entry->f.cb_mult,
> -		=C2=A0 __entry->f.cb_luma_mult,
> -		=C2=A0 __entry->f.cr_luma_mult,
> -		=C2=A0 __entry->f.cb_offset,
> -		=C2=A0 __entry->f.cr_offset
> -	)
> -)
> -
> -DEFINE_EVENT(v4l2_ctrl_av1_seq_tmpl, v4l2_ctrl_av1_sequence,
> -	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_av1_frame_tmpl, v4l2_ctrl_av1_frame,
> -	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
> -	TP_ARGS(f)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_av1_tge_tmpl, v4l2_ctrl_av1_tile_group_entry,
> -	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
> -	TP_ARGS(t)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_av1_film_grain_tmpl, v4l2_ctrl_av1_film_grain,
> -	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
> -	TP_ARGS(f)
> -);
> -
> -#endif
> -
> -#undef TRACE_INCLUDE_PATH
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> -#define TRACE_INCLUDE_FILE visl-trace-av1
> -#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-fwht.h b/drivers/=
media/test-drivers/visl/visl-trace-fwht.h
> deleted file mode 100644
> index 54b119359ff5..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-fwht.h
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#if !defined(_VISL_TRACE_FWHT_H_) || defined(TRACE_HEADER_MULTI_READ)
> -#define _VISL_TRACE_FWHT_H_
> -
> -#include <linux/tracepoint.h>
> -#include "visl.h"
> -
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM visl_fwht_controls
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(
> -			 __field(u64, backward_ref_ts)
> -			 __field(u32, version)
> -			 __field(u32, width)
> -			 __field(u32, height)
> -			 __field(u32, flags)
> -			 __field(u32, colorspace)
> -			 __field(u32, xfer_func)
> -			 __field(u32, ycbcr_enc)
> -			 __field(u32, quantization)
> -			 ),
> -	TP_fast_assign(
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->backward_ref_ts =3D p->b=
ackward_ref_ts;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->version =3D p->version;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->width =3D p->width;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->height =3D p->height;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->flags =3D p->flags;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->colorspace =3D p->colors=
pace;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->xfer_func =3D p->xfer_fu=
nc;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->ycbcr_enc =3D p->ycbcr_e=
nc;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->quantization =3D p->quan=
tization;
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ),
> -	TP_printk("backward_ref_ts %llu version %u width %u height %u flags %s =
colorspace %u xfer_func %u ycbcr_enc %u quantization %u",
> -		=C2=A0 __entry->backward_ref_ts, __entry->version, __entry->width, __e=
ntry->height,
> -		=C2=A0 __print_flags(__entry->flags, "|",
> -		=C2=A0 {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
> -		=C2=A0 {V4L2_FWHT_FL_IS_BOTTOM_FIRST, "IS_BOTTOM_FIRST"},
> -		=C2=A0 {V4L2_FWHT_FL_IS_ALTERNATE, "IS_ALTERNATE"},
> -		=C2=A0 {V4L2_FWHT_FL_IS_BOTTOM_FIELD, "IS_BOTTOM_FIELD"},
> -		=C2=A0 {V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED, "LUMA_IS_UNCOMPRESSED"},
> -		=C2=A0 {V4L2_FWHT_FL_CB_IS_UNCOMPRESSED, "CB_IS_UNCOMPRESSED"},
> -		=C2=A0 {V4L2_FWHT_FL_CR_IS_UNCOMPRESSED, "CR_IS_UNCOMPRESSED"},
> -		=C2=A0 {V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED, "ALPHA_IS_UNCOMPRESSED"},
> -		=C2=A0 {V4L2_FWHT_FL_I_FRAME, "I_FRAME"},
> -		=C2=A0 {V4L2_FWHT_FL_PIXENC_HSV, "PIXENC_HSV"},
> -		=C2=A0 {V4L2_FWHT_FL_PIXENC_RGB, "PIXENC_RGB"},
> -		=C2=A0 {V4L2_FWHT_FL_PIXENC_YUV, "PIXENC_YUV"}),
> -		=C2=A0 __entry->colorspace, __entry->xfer_func, __entry->ycbcr_enc,
> -		=C2=A0 __entry->quantization)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_fwht_params_tmpl, v4l2_ctrl_fwht_params,
> -	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> -	TP_ARGS(p)
> -);
> -
> -#endif
> -
> -#undef TRACE_INCLUDE_PATH
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> -#define TRACE_INCLUDE_FILE visl-trace-fwht
> -#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-h264.h b/drivers/=
media/test-drivers/visl/visl-trace-h264.h
> deleted file mode 100644
> index d84296a01deb..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-h264.h
> +++ /dev/null
> @@ -1,349 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#if !defined(_VISL_TRACE_H264_H_) || defined(TRACE_HEADER_MULTI_READ)
> -#define _VISL_TRACE_H264_H_
> -
> -#include <linux/tracepoint.h>
> -#include "visl.h"
> -
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM visl_h264_controls
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
> -	TP_fast_assign(__entry->s =3D *s),
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
> -		=C2=A0 __entry->s.profile_idc,
> -		=C2=A0 __print_flags(__entry->s.constraint_set_flags, "|",
> -		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG"},
> -		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET1_FLAG, "CONSTRAINT_SET1_FLAG"},
> -		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET2_FLAG, "CONSTRAINT_SET2_FLAG"},
> -		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET3_FLAG, "CONSTRAINT_SET3_FLAG"},
> -		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET4_FLAG, "CONSTRAINT_SET4_FLAG"},
> -		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET5_FLAG, "CONSTRAINT_SET5_FLAG"}),
> -		=C2=A0 __entry->s.level_idc,
> -		=C2=A0 __entry->s.seq_parameter_set_id,
> -		=C2=A0 __entry->s.chroma_format_idc,
> -		=C2=A0 __entry->s.bit_depth_luma_minus8,
> -		=C2=A0 __entry->s.bit_depth_chroma_minus8,
> -		=C2=A0 __entry->s.log2_max_frame_num_minus4,
> -		=C2=A0 __entry->s.pic_order_cnt_type,
> -		=C2=A0 __entry->s.log2_max_pic_order_cnt_lsb_minus4,
> -		=C2=A0 __entry->s.max_num_ref_frames,
> -		=C2=A0 __entry->s.num_ref_frames_in_pic_order_cnt_cycle,
> -		=C2=A0 __print_array(__entry->s.offset_for_ref_frame,
> -				ARRAY_SIZE(__entry->s.offset_for_ref_frame),
> -				sizeof(__entry->s.offset_for_ref_frame[0])),
> -		=C2=A0 __entry->s.offset_for_non_ref_pic,
> -		=C2=A0 __entry->s.offset_for_top_to_bottom_field,
> -		=C2=A0 __entry->s.pic_width_in_mbs_minus1,
> -		=C2=A0 __entry->s.pic_height_in_map_units_minus1,
> -		=C2=A0 __print_flags(__entry->s.flags, "|",
> -		=C2=A0 {V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE, "SEPARATE_COLOUR_PLA=
NE"},
> -		=C2=A0 {V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS, "QPPRIME_Y=
_ZERO_TRANSFORM_BYPASS"},
> -		=C2=A0 {V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO, "DELTA_PIC_ORD=
ER_ALWAYS_ZERO"},
> -		=C2=A0 {V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED, "GAPS_IN_F=
RAME_NUM_VALUE_ALLOWED"},
> -		=C2=A0 {V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY, "FRAME_MBS_ONLY"},
> -		=C2=A0 {V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD, "MB_ADAPTIVE_FRAME=
_FIELD"},
> -		=C2=A0 {V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE, "DIRECT_8X8_INFERENCE=
"}
> -		=C2=A0 ))
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
> -	TP_fast_assign(__entry->p =3D *p),
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
> -		=C2=A0 __entry->p.pic_parameter_set_id,
> -		=C2=A0 __entry->p.seq_parameter_set_id,
> -		=C2=A0 __entry->p.num_slice_groups_minus1,
> -		=C2=A0 __entry->p.num_ref_idx_l0_default_active_minus1,
> -		=C2=A0 __entry->p.num_ref_idx_l1_default_active_minus1,
> -		=C2=A0 __entry->p.weighted_bipred_idc,
> -		=C2=A0 __entry->p.pic_init_qp_minus26,
> -		=C2=A0 __entry->p.pic_init_qs_minus26,
> -		=C2=A0 __entry->p.chroma_qp_index_offset,
> -		=C2=A0 __entry->p.second_chroma_qp_index_offset,
> -		=C2=A0 __print_flags(__entry->p.flags, "|",
> -		=C2=A0 {V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE, "ENTROPY_CODING_MODE"}=
,
> -		=C2=A0 {V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT, "B=
OTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT"},
> -		=C2=A0 {V4L2_H264_PPS_FLAG_WEIGHTED_PRED, "WEIGHTED_PRED"},
> -		=C2=A0 {V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "DEBLOCK=
ING_FILTER_CONTROL_PRESENT"},
> -		=C2=A0 {V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED, "CONSTRAINED_INTRA_=
PRED"},
> -		=C2=A0 {V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT, "REDUNDANT_PIC_C=
NT_PRESENT"},
> -		=C2=A0 {V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE, "TRANSFORM_8X8_MODE"},
> -		=C2=A0 {V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT, "SCALING_MATRIX_PRE=
SENT"}
> -		=C2=A0 ))
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matrix, s=
)),
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> -				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->s.scaling_list_8x8,
> -				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_8x8),
> -				=C2=A0=C2=A0 false)
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights, p))=
,
> -	TP_fast_assign(__entry->p =3D *p),
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
> -		=C2=A0 __entry->p.luma_log2_weight_denom,
> -		=C2=A0 __entry->p.chroma_log2_weight_denom,
> -		=C2=A0 __print_array(__entry->p.weight_factors[0].luma_weight,
> -				ARRAY_SIZE(__entry->p.weight_factors[0].luma_weight),
> -				sizeof(__entry->p.weight_factors[0].luma_weight[0])),
> -		=C2=A0 __print_array(__entry->p.weight_factors[0].luma_offset,
> -				ARRAY_SIZE(__entry->p.weight_factors[0].luma_offset),
> -				sizeof(__entry->p.weight_factors[0].luma_offset[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.weight_factors[0].chroma_weight,
> -				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[0].chroma_weight),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.weight_factors[0].chroma_offset,
> -				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[0].chroma_offset),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->p.weight_factors[1].luma_weight,
> -				ARRAY_SIZE(__entry->p.weight_factors[1].luma_weight),
> -				sizeof(__entry->p.weight_factors[1].luma_weight[0])),
> -		=C2=A0 __print_array(__entry->p.weight_factors[1].luma_offset,
> -				ARRAY_SIZE(__entry->p.weight_factors[1].luma_offset),
> -				sizeof(__entry->p.weight_factors[1].luma_offset[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.weight_factors[1].chroma_weight,
> -				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[1].chroma_weight),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.weight_factors[1].chroma_offset,
> -				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[1].chroma_offset),
> -				=C2=A0=C2=A0 false)
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params, s))=
,
> -	TP_fast_assign(__entry->s =3D *s),
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
> -		=C2=A0 __entry->s.header_bit_size,
> -		=C2=A0 __entry->s.first_mb_in_slice,
> -		=C2=A0 __print_symbolic(__entry->s.slice_type,
> -		=C2=A0 {V4L2_H264_SLICE_TYPE_P, "P"},
> -		=C2=A0 {V4L2_H264_SLICE_TYPE_B, "B"},
> -		=C2=A0 {V4L2_H264_SLICE_TYPE_I, "I"},
> -		=C2=A0 {V4L2_H264_SLICE_TYPE_SP, "SP"},
> -		=C2=A0 {V4L2_H264_SLICE_TYPE_SI, "SI"}),
> -		=C2=A0 __entry->s.colour_plane_id,
> -		=C2=A0 __entry->s.redundant_pic_cnt,
> -		=C2=A0 __entry->s.cabac_init_idc,
> -		=C2=A0 __entry->s.slice_qp_delta,
> -		=C2=A0 __entry->s.slice_qs_delta,
> -		=C2=A0 __entry->s.disable_deblocking_filter_idc,
> -		=C2=A0 __entry->s.slice_alpha_c0_offset_div2,
> -		=C2=A0 __entry->s.slice_beta_offset_div2,
> -		=C2=A0 __entry->s.num_ref_idx_l0_active_minus1,
> -		=C2=A0 __entry->s.num_ref_idx_l1_active_minus1,
> -		=C2=A0 __print_flags(__entry->s.flags, "|",
> -		=C2=A0 {V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED, "DIRECT_SPATIAL_M=
V_PRED"},
> -		=C2=A0 {V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH, "SP_FOR_SWITCH"})
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
> -	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> -	TP_ARGS(r, i),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
> -			 __field(int, i)),
> -	TP_fast_assign(__entry->r =3D *r; __entry->i =3D i;),
> -	TP_printk("[%d]: fields %s index %u",
> -		=C2=A0 __entry->i,
> -		=C2=A0 __print_flags(__entry->r.fields, "|",
> -		=C2=A0 {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> -		=C2=A0 {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
> -		=C2=A0 {V4L2_H264_FRAME_REF, "FRAME_REF"}),
> -		=C2=A0 __entry->r.index
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> -	TP_ARGS(d),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_params, d)=
),
> -	TP_fast_assign(__entry->d =3D *d),
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
> -		=C2=A0 __entry->d.nal_ref_idc,
> -		=C2=A0 __entry->d.frame_num,
> -		=C2=A0 __entry->d.top_field_order_cnt,
> -		=C2=A0 __entry->d.bottom_field_order_cnt,
> -		=C2=A0 __entry->d.idr_pic_id,
> -		=C2=A0 __entry->d.pic_order_cnt_lsb,
> -		=C2=A0 __entry->d.delta_pic_order_cnt_bottom,
> -		=C2=A0 __entry->d.delta_pic_order_cnt0,
> -		=C2=A0 __entry->d.delta_pic_order_cnt1,
> -		=C2=A0 __entry->d.dec_ref_pic_marking_bit_size,
> -		=C2=A0 __entry->d.pic_order_cnt_bit_size,
> -		=C2=A0 __entry->d.slice_group_change_cycle,
> -		=C2=A0 __print_flags(__entry->d.flags, "|",
> -		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC, "IDR_PIC"},
> -		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC, "FIELD_PIC"},
> -		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD, "BOTTOM_FIELD"},
> -		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_PFRAME, "PFRAME"},
> -		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_BFRAME, "BFRAME"})
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
> -	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> -	TP_ARGS(e, i),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
> -			 __field(int, i)),
> -	TP_fast_assign(__entry->e =3D *e; __entry->i =3D i;),
> -	TP_printk("[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s "
> -		=C2=A0 "top_field_order_cnt %d bottom_field_order_cnt %d flags %s",
> -		=C2=A0 __entry->i,
> -		=C2=A0 __entry->e.reference_ts,
> -		=C2=A0 __entry->e.pic_num,
> -		=C2=A0 __entry->e.frame_num,
> -		=C2=A0 __print_flags(__entry->e.fields, "|",
> -		=C2=A0 {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> -		=C2=A0 {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
> -		=C2=A0 {V4L2_H264_FRAME_REF, "FRAME_REF"}),
> -		=C2=A0 __entry->e.top_field_order_cnt,
> -		=C2=A0 __entry->e.bottom_field_order_cnt,
> -		=C2=A0 __print_flags(__entry->e.flags, "|",
> -		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_VALID, "VALID"},
> -		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_ACTIVE, "ACTIVE"},
> -		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM, "LONG_TERM"},
> -		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_FIELD, "FIELD"})
> -
> -	)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_h264_sps_tmpl, v4l2_ctrl_h264_sps,
> -	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_h264_pps_tmpl, v4l2_ctrl_h264_pps,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> -	TP_ARGS(p)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_h264_scaling_matrix_tmpl, v4l2_ctrl_h264_scaling_=
matrix,
> -	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_h264_pred_weights_tmpl, v4l2_ctrl_h264_pred_weigh=
ts,
> -	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> -	TP_ARGS(p)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_h264_slice_params_tmpl, v4l2_ctrl_h264_slice_para=
ms,
> -	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list0,
> -	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> -	TP_ARGS(r, i)
> -);
> -
> -DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list1,
> -	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> -	TP_ARGS(r, i)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_h264_decode_params_tmpl, v4l2_ctrl_h264_decode_pa=
rams,
> -	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> -	TP_ARGS(d)
> -);
> -
> -DEFINE_EVENT(v4l2_h264_dpb_entry_tmpl, v4l2_h264_dpb_entry,
> -	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> -	TP_ARGS(e, i)
> -);
> -
> -#endif
> -
> -#undef TRACE_INCLUDE_PATH
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> -#define TRACE_INCLUDE_FILE visl-trace-h264
> -#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-hevc.h b/drivers/=
media/test-drivers/visl/visl-trace-hevc.h
> deleted file mode 100644
> index 963914c463db..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-hevc.h
> +++ /dev/null
> @@ -1,464 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -#include "linux/v4l2-controls.h"
> -#if !defined(_VISL_TRACE_HEVC_H_) || defined(TRACE_HEADER_MULTI_READ)
> -#define _VISL_TRACE_HEVC_H_
> -
> -#include <linux/tracepoint.h>
> -#include "visl.h"
> -
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM visl_hevc_controls
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_sps, s)),
> -	TP_fast_assign(__entry->s =3D *s),
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
> -		=C2=A0 __entry->s.video_parameter_set_id,
> -		=C2=A0 __entry->s.seq_parameter_set_id,
> -		=C2=A0 __entry->s.pic_width_in_luma_samples,
> -		=C2=A0 __entry->s.pic_height_in_luma_samples,
> -		=C2=A0 __entry->s.bit_depth_luma_minus8,
> -		=C2=A0 __entry->s.bit_depth_chroma_minus8,
> -		=C2=A0 __entry->s.log2_max_pic_order_cnt_lsb_minus4,
> -		=C2=A0 __entry->s.sps_max_dec_pic_buffering_minus1,
> -		=C2=A0 __entry->s.sps_max_num_reorder_pics,
> -		=C2=A0 __entry->s.sps_max_latency_increase_plus1,
> -		=C2=A0 __entry->s.log2_min_luma_coding_block_size_minus3,
> -		=C2=A0 __entry->s.log2_diff_max_min_luma_coding_block_size,
> -		=C2=A0 __entry->s.log2_min_luma_transform_block_size_minus2,
> -		=C2=A0 __entry->s.log2_diff_max_min_luma_transform_block_size,
> -		=C2=A0 __entry->s.max_transform_hierarchy_depth_inter,
> -		=C2=A0 __entry->s.max_transform_hierarchy_depth_intra,
> -		=C2=A0 __entry->s.pcm_sample_bit_depth_luma_minus1,
> -		=C2=A0 __entry->s.pcm_sample_bit_depth_chroma_minus1,
> -		=C2=A0 __entry->s.log2_min_pcm_luma_coding_block_size_minus3,
> -		=C2=A0 __entry->s.log2_diff_max_min_pcm_luma_coding_block_size,
> -		=C2=A0 __entry->s.num_short_term_ref_pic_sets,
> -		=C2=A0 __entry->s.num_long_term_ref_pics_sps,
> -		=C2=A0 __entry->s.chroma_format_idc,
> -		=C2=A0 __entry->s.sps_max_sub_layers_minus1,
> -		=C2=A0 __print_flags(__entry->s.flags, "|",
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE, "SEPARATE_COLOUR_PLA=
NE"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED, "SCALING_LIST_ENABLED=
"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_AMP_ENABLED, "AMP_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET, "SAMPLE_ADAPTIVE_OF=
FSET"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_PCM_ENABLED, "PCM_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED, "V4L2_HEVC_SPS_FL=
AG_PCM_LOOP_FILTER_DISABLED"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT, "LONG_TERM_REF_=
PICS_PRESENT"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED, "TEMPORAL_MVP_ENA=
BLED"},
> -		=C2=A0 {V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED, "STRONG_INT=
RA_SMOOTHING_ENABLED"}
> -	))
> -
> -);
> -
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_pps, p)),
> -	TP_fast_assign(__entry->p =3D *p),
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
> -		=C2=A0 __entry->p.pic_parameter_set_id,
> -		=C2=A0 __entry->p.num_extra_slice_header_bits,
> -		=C2=A0 __entry->p.num_ref_idx_l0_default_active_minus1,
> -		=C2=A0 __entry->p.num_ref_idx_l1_default_active_minus1,
> -		=C2=A0 __entry->p.init_qp_minus26,
> -		=C2=A0 __entry->p.diff_cu_qp_delta_depth,
> -		=C2=A0 __entry->p.pps_cb_qp_offset,
> -		=C2=A0 __entry->p.pps_cr_qp_offset,
> -		=C2=A0 __entry->p.num_tile_columns_minus1,
> -		=C2=A0 __entry->p.num_tile_rows_minus1,
> -		=C2=A0 __print_array(__entry->p.column_width_minus1,
> -				ARRAY_SIZE(__entry->p.column_width_minus1),
> -				sizeof(__entry->p.column_width_minus1[0])),
> -		=C2=A0 __print_array(__entry->p.row_height_minus1,
> -				ARRAY_SIZE(__entry->p.row_height_minus1),
> -				sizeof(__entry->p.row_height_minus1[0])),
> -		=C2=A0 __entry->p.pps_beta_offset_div2,
> -		=C2=A0 __entry->p.pps_tc_offset_div2,
> -		=C2=A0 __entry->p.log2_parallel_merge_level_minus2,
> -		=C2=A0 __print_flags(__entry->p.flags, "|",
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED, "DEPENDENT=
_SLICE_SEGMENT_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT, "OUTPUT_FLAG_PRESENT"}=
,
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED, "SIGN_DATA_HIDING=
_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT, "CABAC_INIT_PRESENT"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED, "CONSTRAINED_INTRA_=
PRED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED, "CU_QP_DELTA_ENABLED"}=
,
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT, "PPS_S=
LICE_CHROMA_QP_OFFSETS_PRESENT"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED, "WEIGHTED_PRED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED, "WEIGHTED_BIPRED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED, "TRANSQUANT_BYPA=
SS_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_TILES_ENABLED, "TILES_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED, "ENTROPY_CODIN=
G_SYNC_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED, "LOOP_FIL=
TER_ACROSS_TILES_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED, "PPS=
_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED, "DEBLOC=
KING_FILTER_OVERRIDE_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER, "DISABLE_DEB=
LOCKING_FILTER"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT, "LISTS_MODIFICA=
TION_PRESENT"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT, "SL=
ICE_SEGMENT_HEADER_EXTENSION_PRESENT"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "DEBLOCK=
ING_FILTER_CONTROL_PRESENT"},
> -		=C2=A0 {V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING, "UNIFORM_SPACING"}
> -	))
> -
> -);
> -
> -
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_slice_params, s))=
,
> -	TP_fast_assign(__entry->s =3D *s),
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
> -		=C2=A0 __entry->s.bit_size,
> -		=C2=A0 __entry->s.data_byte_offset,
> -		=C2=A0 __entry->s.num_entry_point_offsets,
> -		=C2=A0 __entry->s.nal_unit_type,
> -		=C2=A0 __entry->s.nuh_temporal_id_plus1,
> -		=C2=A0 __entry->s.slice_type,
> -		=C2=A0 __entry->s.colour_plane_id,
> -		=C2=A0 __entry->s.slice_pic_order_cnt,
> -		=C2=A0 __entry->s.num_ref_idx_l0_active_minus1,
> -		=C2=A0 __entry->s.num_ref_idx_l1_active_minus1,
> -		=C2=A0 __entry->s.collocated_ref_idx,
> -		=C2=A0 __entry->s.five_minus_max_num_merge_cand,
> -		=C2=A0 __entry->s.slice_qp_delta,
> -		=C2=A0 __entry->s.slice_cb_qp_offset,
> -		=C2=A0 __entry->s.slice_cr_qp_offset,
> -		=C2=A0 __entry->s.slice_act_y_qp_offset,
> -		=C2=A0 __entry->s.slice_act_cb_qp_offset,
> -		=C2=A0 __entry->s.slice_act_cr_qp_offset,
> -		=C2=A0 __entry->s.slice_beta_offset_div2,
> -		=C2=A0 __entry->s.slice_tc_offset_div2,
> -		=C2=A0 __entry->s.pic_struct,
> -		=C2=A0 __entry->s.slice_segment_addr,
> -		=C2=A0 __print_array(__entry->s.ref_idx_l0,
> -				ARRAY_SIZE(__entry->s.ref_idx_l0),
> -				sizeof(__entry->s.ref_idx_l0[0])),
> -		=C2=A0 __print_array(__entry->s.ref_idx_l1,
> -				ARRAY_SIZE(__entry->s.ref_idx_l1),
> -				sizeof(__entry->s.ref_idx_l1[0])),
> -		=C2=A0 __entry->s.short_term_ref_pic_set_size,
> -		=C2=A0 __entry->s.long_term_ref_pic_set_size,
> -		=C2=A0 __print_flags(__entry->s.flags, "|",
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA, "SLICE_SAO_LUMA"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA, "SLICE_SAO_CHROM=
A"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED, "SLICE=
_TEMPORAL_MVP_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO, "MVD_L1_ZERO"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT, "CABAC_INIT"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0, "COLLOCATED_FR=
OM_L0"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV, "USE_INTEGER_MV"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED, =
"SLICE_DEBLOCKING_FILTER_DISABLED"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_EN=
ABLED, "SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
> -		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT, "DEPENDEN=
T_SLICE_SEGMENT"}
> -
> -	))
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
> -	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_pred_weight_table, p))=
,
> -	TP_fast_assign(__entry->p =3D *p),
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
> -		=C2=A0 __print_array(__entry->p.delta_luma_weight_l0,
> -				ARRAY_SIZE(__entry->p.delta_luma_weight_l0),
> -				sizeof(__entry->p.delta_luma_weight_l0[0])),
> -		=C2=A0 __print_array(__entry->p.luma_offset_l0,
> -				ARRAY_SIZE(__entry->p.luma_offset_l0),
> -				sizeof(__entry->p.luma_offset_l0[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.delta_chroma_weight_l0,
> -				=C2=A0=C2=A0 sizeof(__entry->p.delta_chroma_weight_l0),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.chroma_offset_l0,
> -				=C2=A0=C2=A0 sizeof(__entry->p.chroma_offset_l0),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->p.delta_luma_weight_l1,
> -				ARRAY_SIZE(__entry->p.delta_luma_weight_l1),
> -				sizeof(__entry->p.delta_luma_weight_l1[0])),
> -		=C2=A0 __print_array(__entry->p.luma_offset_l1,
> -				ARRAY_SIZE(__entry->p.luma_offset_l1),
> -				sizeof(__entry->p.luma_offset_l1[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.delta_chroma_weight_l1,
> -				=C2=A0=C2=A0 sizeof(__entry->p.delta_chroma_weight_l1),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.chroma_offset_l1,
> -				=C2=A0=C2=A0 sizeof(__entry->p.chroma_offset_l1),
> -				=C2=A0=C2=A0 false),
> -		__entry->p.luma_log2_weight_denom,
> -		__entry->p.delta_chroma_log2_weight_denom
> -
> -	))
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s=
)),
> -	TP_fast_assign(__entry->s =3D *s),
> -	TP_printk("\nscaling_list_4x4 {%s}\n"
> -		=C2=A0 "scaling_list_8x8 {%s}\n"
> -		=C2=A0 "scaling_list_16x16 {%s}\n"
> -		=C2=A0 "scaling_list_32x32 {%s}\n"
> -		=C2=A0 "scaling_list_dc_coef_16x16 %s\n"
> -		=C2=A0 "scaling_list_dc_coef_32x32 %s\n",
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> -				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->s.scaling_list_8x8,
> -				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_8x8),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->s.scaling_list_16x16,
> -				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_16x16),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->s.scaling_list_32x32,
> -				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_32x32),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->s.scaling_list_dc_coef_16x16,
> -				ARRAY_SIZE(__entry->s.scaling_list_dc_coef_16x16),
> -				sizeof(__entry->s.scaling_list_dc_coef_16x16[0])),
> -		=C2=A0 __print_array(__entry->s.scaling_list_dc_coef_32x32,
> -				ARRAY_SIZE(__entry->s.scaling_list_dc_coef_32x32),
> -				sizeof(__entry->s.scaling_list_dc_coef_32x32[0]))
> -	))
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
> -	TP_ARGS(d),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_decode_params, d)=
),
> -	TP_fast_assign(__entry->d =3D *d),
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
> -		=C2=A0 __entry->d.pic_order_cnt_val,
> -		=C2=A0 __entry->d.short_term_ref_pic_set_size,
> -		=C2=A0 __entry->d.long_term_ref_pic_set_size,
> -		=C2=A0 __entry->d.num_active_dpb_entries,
> -		=C2=A0 __entry->d.num_poc_st_curr_before,
> -		=C2=A0 __entry->d.num_poc_st_curr_after,
> -		=C2=A0 __entry->d.num_poc_lt_curr,
> -		=C2=A0 __print_array(__entry->d.poc_st_curr_before,
> -				ARRAY_SIZE(__entry->d.poc_st_curr_before),
> -				sizeof(__entry->d.poc_st_curr_before[0])),
> -		=C2=A0 __print_array(__entry->d.poc_st_curr_after,
> -				ARRAY_SIZE(__entry->d.poc_st_curr_after),
> -				sizeof(__entry->d.poc_st_curr_after[0])),
> -		=C2=A0 __print_array(__entry->d.poc_lt_curr,
> -				ARRAY_SIZE(__entry->d.poc_lt_curr),
> -				sizeof(__entry->d.poc_lt_curr[0])),
> -		=C2=A0 __print_flags(__entry->d.flags, "|",
> -		=C2=A0 {V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC, "IRAP_PIC"},
> -		=C2=A0 {V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC, "IDR_PIC"},
> -		=C2=A0 {V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR, "NO_OUTPUT_OF_=
PRIOR"}
> -	))
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> -	TP_ARGS(lt),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, l=
t)),
> -	TP_fast_assign(__entry->lt =3D *lt),
> -	TP_printk("\nflags %s\n"
> -		=C2=A0 "lt_ref_pic_poc_lsb_sps %x\n",
> -		=C2=A0 __print_flags(__entry->lt.flags, "|",
> -		=C2=A0 {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
> -		=C2=A0 ),
> -		=C2=A0 __entry->lt.lt_ref_pic_poc_lsb_sps
> -	)
> -)
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> -	TP_ARGS(st),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, s=
t)),
> -	TP_fast_assign(__entry->st =3D *st),
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
> -		=C2=A0 __print_flags(__entry->st.flags, "|",
> -		=C2=A0 {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_R=
EF_PIC_SET_PRED"}
> -		=C2=A0 ),
> -		=C2=A0 __entry->st.delta_idx_minus1,
> -		=C2=A0 __entry->st.delta_rps_sign,
> -		=C2=A0 __entry->st.abs_delta_rps_minus1,
> -		=C2=A0 __entry->st.num_negative_pics,
> -		=C2=A0 __entry->st.num_positive_pics,
> -		=C2=A0 __entry->st.used_by_curr_pic,
> -		=C2=A0 __entry->st.use_delta_flag,
> -		=C2=A0 __print_array(__entry->st.delta_poc_s0_minus1,
> -				ARRAY_SIZE(__entry->st.delta_poc_s0_minus1),
> -				sizeof(__entry->st.delta_poc_s0_minus1[0])),
> -		=C2=A0 __print_array(__entry->st.delta_poc_s1_minus1,
> -				ARRAY_SIZE(__entry->st.delta_poc_s1_minus1),
> -				sizeof(__entry->st.delta_poc_s1_minus1[0]))
> -	)
> -)
> -
> -
> -DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
> -	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> -	TP_ARGS(e),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_dpb_entry, e)),
> -	TP_fast_assign(__entry->e =3D *e),
> -	TP_printk("\ntimestamp %llu\n"
> -		=C2=A0 "flags %s\n"
> -		=C2=A0 "field_pic %u\n"
> -		=C2=A0 "pic_order_cnt_val %d\n",
> -		__entry->e.timestamp,
> -		__print_flags(__entry->e.flags, "|",
> -		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE, "LONG_TERM_REFERENCE"}
> -		=C2=A0 ),
> -		__entry->e.field_pic,
> -		__entry->e.pic_order_cnt_val
> -	))
> -
> -DEFINE_EVENT(v4l2_ctrl_hevc_sps_tmpl, v4l2_ctrl_hevc_sps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_hevc_pps_tmpl, v4l2_ctrl_hevc_pps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
> -	TP_ARGS(p)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_hevc_slice_params_tmpl, v4l2_ctrl_hevc_slice_para=
ms,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_hevc_pred_weight_table_tmpl, v4l2_hevc_pred_weight_tab=
le,
> -	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
> -	TP_ARGS(p)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_hevc_scaling_matrix_tmpl, v4l2_ctrl_hevc_scaling_=
matrix,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_hevc_decode_params_tmpl, v4l2_ctrl_hevc_decode_pa=
rams,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
> -	TP_ARGS(d)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl, v4l2_ctrl_hevc_ext_sps_=
lt_rps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> -	TP_ARGS(lt)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl, v4l2_ctrl_hevc_ext_sps_=
st_rps,
> -	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> -	TP_ARGS(st)
> -);
> -
> -DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
> -	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> -	TP_ARGS(e)
> -);
> -
> -#endif
> -
> -#undef TRACE_INCLUDE_PATH
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> -#define TRACE_INCLUDE_FILE visl-trace-hevc
> -#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-mpeg2.h b/drivers=
/media/test-drivers/visl/visl-trace-mpeg2.h
> deleted file mode 100644
> index ba6c65481194..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-mpeg2.h
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#if !defined(_VISL_TRACE_MPEG2_H_) || defined(TRACE_HEADER_MULTI_READ)
> -#define _VISL_TRACE_MPEG2_H_
> -
> -#include <linux/tracepoint.h>
> -#include "visl.h"
> -
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM visl_mpeg2_controls
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> -	TP_ARGS(s),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
> -	TP_fast_assign(__entry->s =3D *s;),
> -	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n=
"
> -		=C2=A0 "profile_and_level_indication %u\nchroma_format %u\nflags %s\n"=
,
> -		=C2=A0 __entry->s.horizontal_size,
> -		=C2=A0 __entry->s.vertical_size,
> -		=C2=A0 __entry->s.vbv_buffer_size,
> -		=C2=A0 __entry->s.profile_and_level_indication,
> -		=C2=A0 __entry->s.chroma_format,
> -		=C2=A0 __print_flags(__entry->s.flags, "|",
> -		=C2=A0 {V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE, "PROGRESSIVE"})
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
> -	TP_fast_assign(__entry->p =3D *p;),
> -	TP_printk("\nbackward_ref_ts %llu\nforward_ref_ts %llu\nflags %s\nf_cod=
e {%s}\n"
> -		=C2=A0 "picture_coding_type: %u\npicture_structure %u\nintra_dc_precis=
ion %u\n",
> -		=C2=A0 __entry->p.backward_ref_ts,
> -		=C2=A0 __entry->p.forward_ref_ts,
> -		=C2=A0 __print_flags(__entry->p.flags, "|",
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST, "TOP_FIELD_FIRST"},
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT, "FRAME_PRED_DCT"},
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV, "CONCEALMENT_MV"},
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE, "Q_SCALE_TYPE"},
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_INTRA_VLC, "INTA_VLC"},
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_ALT_SCAN, "ALT_SCAN"},
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST, "REPEAT_FIRST"},
> -		=C2=A0 {V4L2_MPEG2_PIC_FLAG_PROGRESSIVE, "PROGRESSIVE"}),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.f_code,
> -				=C2=A0=C2=A0 sizeof(__entry->p.f_code),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __entry->p.picture_coding_type,
> -		=C2=A0 __entry->p.picture_structure,
> -		=C2=A0 __entry->p.intra_dc_precision
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> -	TP_ARGS(q),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)=
),
> -	TP_fast_assign(__entry->q =3D *q;),
> -	TP_printk("\nintra_quantiser_matrix %s\nnon_intra_quantiser_matrix %s\n=
"
> -		=C2=A0 "chroma_intra_quantiser_matrix %s\nchroma_non_intra_quantiser_m=
atrix %s\n",
> -		=C2=A0 __print_array(__entry->q.intra_quantiser_matrix,
> -				ARRAY_SIZE(__entry->q.intra_quantiser_matrix),
> -				sizeof(__entry->q.intra_quantiser_matrix[0])),
> -		=C2=A0 __print_array(__entry->q.non_intra_quantiser_matrix,
> -				ARRAY_SIZE(__entry->q.non_intra_quantiser_matrix),
> -				sizeof(__entry->q.non_intra_quantiser_matrix[0])),
> -		=C2=A0 __print_array(__entry->q.chroma_intra_quantiser_matrix,
> -				ARRAY_SIZE(__entry->q.chroma_intra_quantiser_matrix),
> -				sizeof(__entry->q.chroma_intra_quantiser_matrix[0])),
> -		=C2=A0 __print_array(__entry->q.chroma_non_intra_quantiser_matrix,
> -				ARRAY_SIZE(__entry->q.chroma_non_intra_quantiser_matrix),
> -				sizeof(__entry->q.chroma_non_intra_quantiser_matrix[0]))
> -		=C2=A0 )
> -)
> -
> -DEFINE_EVENT(v4l2_ctrl_mpeg2_seq_tmpl, v4l2_ctrl_mpeg2_sequence,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> -	TP_ARGS(s)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_mpeg2_pic_tmpl, v4l2_ctrl_mpeg2_picture,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> -	TP_ARGS(p)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_mpeg2_quant_tmpl, v4l2_ctrl_mpeg2_quantisation,
> -	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> -	TP_ARGS(q)
> -);
> -
> -#endif
> -
> -#undef TRACE_INCLUDE_PATH
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> -#define TRACE_INCLUDE_FILE visl-trace-mpeg2
> -#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-points.c b/driver=
s/media/test-drivers/visl/visl-trace-points.c
> deleted file mode 100644
> index 321ff732c682..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-points.c
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#include "visl.h"
> -
> -#define CREATE_TRACE_POINTS
> -#include "visl-trace-fwht.h"
> -#include "visl-trace-mpeg2.h"
> -#include "visl-trace-vp8.h"
> -#include "visl-trace-vp9.h"
> -#include "visl-trace-h264.h"
> -#include "visl-trace-hevc.h"
> -#include "visl-trace-av1.h"
> diff --git a/drivers/media/test-drivers/visl/visl-trace-vp8.h b/drivers/m=
edia/test-drivers/visl/visl-trace-vp8.h
> deleted file mode 100644
> index dabe17d69ddc..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-vp8.h
> +++ /dev/null
> @@ -1,156 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#if !defined(_VISL_TRACE_VP8_H_) || defined(TRACE_HEADER_MULTI_READ)
> -#define _VISL_TRACE_VP8_H_
> -
> -#include <linux/tracepoint.h>
> -#include "visl.h"
> -
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM visl_vp8_controls
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
> -	TP_printk("\nentropy.coeff_probs {%s}\n"
> -		=C2=A0 "entropy.y_mode_probs %s\n"
> -		=C2=A0 "entropy.uv_mode_probs %s\n"
> -		=C2=A0 "entropy.mv_probs {%s}",
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->f.entropy.coeff_probs,
> -				=C2=A0=C2=A0 sizeof(__entry->f.entropy.coeff_probs),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->f.entropy.y_mode_probs,
> -				ARRAY_SIZE(__entry->f.entropy.y_mode_probs),
> -				sizeof(__entry->f.entropy.y_mode_probs[0])),
> -		=C2=A0 __print_array(__entry->f.entropy.uv_mode_probs,
> -				ARRAY_SIZE(__entry->f.entropy.uv_mode_probs),
> -				sizeof(__entry->f.entropy.uv_mode_probs[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->f.entropy.mv_probs,
> -				=C2=A0=C2=A0 sizeof(__entry->f.entropy.mv_probs),
> -				=C2=A0=C2=A0 false)
> -		=C2=A0 )
> -)
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
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
> -		=C2=A0 __print_array(__entry->f.segment.quant_update,
> -				ARRAY_SIZE(__entry->f.segment.quant_update),
> -				sizeof(__entry->f.segment.quant_update[0])),
> -		=C2=A0 __print_array(__entry->f.segment.lf_update,
> -				ARRAY_SIZE(__entry->f.segment.lf_update),
> -				sizeof(__entry->f.segment.lf_update[0])),
> -		=C2=A0 __print_array(__entry->f.segment.segment_probs,
> -				ARRAY_SIZE(__entry->f.segment.segment_probs),
> -				sizeof(__entry->f.segment.segment_probs[0])),
> -		=C2=A0 __print_flags(__entry->f.segment.flags, "|",
> -		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_ENABLED, "SEGMENT_ENABLED"},
> -		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP, "SEGMENT_UPDATE_MAP"},
> -		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA, "SEGMENT_UPDATE_FEA=
TURE_DATA"},
> -		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE, "SEGMENT_DELTA_VALUE_M=
ODE"}),
> -		=C2=A0 __print_array(__entry->f.lf.ref_frm_delta,
> -				ARRAY_SIZE(__entry->f.lf.ref_frm_delta),
> -				sizeof(__entry->f.lf.ref_frm_delta[0])),
> -		=C2=A0 __print_array(__entry->f.lf.mb_mode_delta,
> -				ARRAY_SIZE(__entry->f.lf.mb_mode_delta),
> -				sizeof(__entry->f.lf.mb_mode_delta[0])),
> -		=C2=A0 __entry->f.lf.sharpness_level,
> -		=C2=A0 __entry->f.lf.level,
> -		=C2=A0 __print_flags(__entry->f.lf.flags, "|",
> -		=C2=A0 {V4L2_VP8_LF_ADJ_ENABLE, "LF_ADJ_ENABLED"},
> -		=C2=A0 {V4L2_VP8_LF_DELTA_UPDATE, "LF_DELTA_UPDATE"},
> -		=C2=A0 {V4L2_VP8_LF_FILTER_TYPE_SIMPLE, "LF_FILTER_TYPE_SIMPLE"}),
> -		=C2=A0 __entry->f.quant.y_ac_qi,
> -		=C2=A0 __entry->f.quant.y_dc_delta,
> -		=C2=A0 __entry->f.quant.y2_dc_delta,
> -		=C2=A0 __entry->f.quant.y2_ac_delta,
> -		=C2=A0 __entry->f.quant.uv_dc_delta,
> -		=C2=A0 __entry->f.quant.uv_ac_delta,
> -		=C2=A0 __entry->f.coder_state.range,
> -		=C2=A0 __entry->f.coder_state.value,
> -		=C2=A0 __entry->f.coder_state.bit_count,
> -		=C2=A0 __entry->f.width,
> -		=C2=A0 __entry->f.height,
> -		=C2=A0 __entry->f.horizontal_scale,
> -		=C2=A0 __entry->f.vertical_scale,
> -		=C2=A0 __entry->f.version,
> -		=C2=A0 __entry->f.prob_skip_false,
> -		=C2=A0 __entry->f.prob_intra,
> -		=C2=A0 __entry->f.prob_last,
> -		=C2=A0 __entry->f.prob_gf,
> -		=C2=A0 __entry->f.num_dct_parts,
> -		=C2=A0 __entry->f.first_part_size,
> -		=C2=A0 __entry->f.first_part_header_bits,
> -		=C2=A0 __print_array(__entry->f.dct_part_sizes,
> -				ARRAY_SIZE(__entry->f.dct_part_sizes),
> -				sizeof(__entry->f.dct_part_sizes[0])),
> -		=C2=A0 __entry->f.last_frame_ts,
> -		=C2=A0 __entry->f.golden_frame_ts,
> -		=C2=A0 __entry->f.alt_frame_ts,
> -		=C2=A0 __print_flags(__entry->f.flags, "|",
> -		=C2=A0 {V4L2_VP8_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
> -		=C2=A0 {V4L2_VP8_FRAME_FLAG_EXPERIMENTAL, "EXPERIMENTAL"},
> -		=C2=A0 {V4L2_VP8_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> -		=C2=A0 {V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF, "MB_NO_SKIP_COEFF"},
> -		=C2=A0 {V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN, "SIGN_BIAS_GOLDEN"},
> -		=C2=A0 {V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT, "SIGN_BIAS_ALT"})
> -		=C2=A0 )
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_vp8_frame_tmpl, v4l2_ctrl_vp8_frame,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_vp8_entropy_tmpl, v4l2_ctrl_vp8_entropy,
> -	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> -	TP_ARGS(f)
> -);
> -
> -#endif
> -
> -#undef TRACE_INCLUDE_PATH
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> -#define TRACE_INCLUDE_FILE visl-trace-vp8
> -#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-vp9.h b/drivers/m=
edia/test-drivers/visl/visl-trace-vp9.h
> deleted file mode 100644
> index 362b92b07f93..000000000000
> --- a/drivers/media/test-drivers/visl/visl-trace-vp9.h
> +++ /dev/null
> @@ -1,292 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#if !defined(_VISL_TRACE_VP9_H_) || defined(TRACE_HEADER_MULTI_READ)
> -#define _VISL_TRACE_VP9_H_
> -
> -#include <linux/tracepoint.h>
> -#include "visl.h"
> -
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM visl_vp9_controls
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> -	TP_ARGS(f),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
> -	TP_fast_assign(__entry->f =3D *f;),
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
> -		=C2=A0 __print_array(__entry->f.lf.ref_deltas,
> -				ARRAY_SIZE(__entry->f.lf.ref_deltas),
> -				sizeof(__entry->f.lf.ref_deltas[0])),
> -		=C2=A0 __print_array(__entry->f.lf.mode_deltas,
> -				ARRAY_SIZE(__entry->f.lf.mode_deltas),
> -				sizeof(__entry->f.lf.mode_deltas[0])),
> -		=C2=A0 __entry->f.lf.level,
> -		=C2=A0 __entry->f.lf.sharpness,
> -		=C2=A0 __print_flags(__entry->f.lf.flags, "|",
> -		=C2=A0 {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED, "DELTA_ENABLED"},
> -		=C2=A0 {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE, "DELTA_UPDATE"}),
> -		=C2=A0 __entry->f.quant.base_q_idx,
> -		=C2=A0 __entry->f.quant.delta_q_y_dc,
> -		=C2=A0 __entry->f.quant.delta_q_uv_dc,
> -		=C2=A0 __entry->f.quant.delta_q_uv_ac,
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->f.seg.feature_data,
> -				=C2=A0=C2=A0 sizeof(__entry->f.seg.feature_data),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->f.seg.feature_enabled,
> -				ARRAY_SIZE(__entry->f.seg.feature_enabled),
> -				sizeof(__entry->f.seg.feature_enabled[0])),
> -		=C2=A0 __print_array(__entry->f.seg.tree_probs,
> -				ARRAY_SIZE(__entry->f.seg.tree_probs),
> -				sizeof(__entry->f.seg.tree_probs[0])),
> -		=C2=A0 __print_array(__entry->f.seg.pred_probs,
> -				ARRAY_SIZE(__entry->f.seg.pred_probs),
> -				sizeof(__entry->f.seg.pred_probs[0])),
> -		=C2=A0 __print_flags(__entry->f.seg.flags, "|",
> -		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_ENABLED, "ENABLED"},
> -		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP, "UPDATE_MAP"},
> -		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE, "TEMPORAL_UPDATE"}=
,
> -		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA, "UPDATE_DATA"},
> -		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE, "ABS_OR_DELTA_=
UPDATE"}),
> -		=C2=A0 __print_flags(__entry->f.flags, "|",
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT, "ERROR_RESILIENT"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_INTRA_ONLY, "INTRA_ONLY"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV, "ALLOW_HIGH_PREC_MV"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX, "REFRESH_FRAME_CTX"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE, "PARALLEL_DEC_MODE"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING, "X_SUBSAMPLING"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING, "Y_SUBSAMPLING"},
> -		=C2=A0 {V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING, "COLOR_RANGE_FULL_=
SWING"}),
> -		=C2=A0 __entry->f.compressed_header_size,
> -		=C2=A0 __entry->f.uncompressed_header_size,
> -		=C2=A0 __entry->f.frame_width_minus_1,
> -		=C2=A0 __entry->f.frame_height_minus_1,
> -		=C2=A0 __entry->f.render_width_minus_1,
> -		=C2=A0 __entry->f.render_height_minus_1,
> -		=C2=A0 __entry->f.last_frame_ts,
> -		=C2=A0 __entry->f.golden_frame_ts,
> -		=C2=A0 __entry->f.alt_frame_ts,
> -		=C2=A0 __print_symbolic(__entry->f.ref_frame_sign_bias,
> -		=C2=A0 {V4L2_VP9_SIGN_BIAS_LAST, "SIGN_BIAS_LAST"},
> -		=C2=A0 {V4L2_VP9_SIGN_BIAS_GOLDEN, "SIGN_BIAS_GOLDEN"},
> -		=C2=A0 {V4L2_VP9_SIGN_BIAS_ALT, "SIGN_BIAS_ALT"}),
> -		=C2=A0 __print_symbolic(__entry->f.reset_frame_context,
> -		=C2=A0 {V4L2_VP9_RESET_FRAME_CTX_NONE, "RESET_FRAME_CTX_NONE"},
> -		=C2=A0 {V4L2_VP9_RESET_FRAME_CTX_SPEC, "RESET_FRAME_CTX_SPEC"},
> -		=C2=A0 {V4L2_VP9_RESET_FRAME_CTX_ALL, "RESET_FRAME_CTX_ALL"}),
> -		=C2=A0 __entry->f.frame_context_idx,
> -		=C2=A0 __entry->f.profile,
> -		=C2=A0 __entry->f.bit_depth,
> -		=C2=A0 __print_symbolic(__entry->f.interpolation_filter,
> -		=C2=A0 {V4L2_VP9_INTERP_FILTER_EIGHTTAP, "INTERP_FILTER_EIGHTTAP"},
> -		=C2=A0 {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH, "INTERP_FILTER_EIGHTTA=
P_SMOOTH"},
> -		=C2=A0 {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP, "INTERP_FILTER_EIGHTTAP=
_SHARP"},
> -		=C2=A0 {V4L2_VP9_INTERP_FILTER_BILINEAR, "INTERP_FILTER_BILINEAR"},
> -		=C2=A0 {V4L2_VP9_INTERP_FILTER_SWITCHABLE, "INTERP_FILTER_SWITCHABLE"}=
),
> -		=C2=A0 __entry->f.tile_cols_log2,
> -		=C2=A0 __entry->f.tile_rows_log2,
> -		=C2=A0 __print_symbolic(__entry->f.reference_mode,
> -		=C2=A0 {V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE, "REFERENCE_MODE_SING=
LE_REFERENCE"},
> -		=C2=A0 {V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE, "REFERENCE_MODE_CO=
MPOUND_REFERENCE"},
> -		=C2=A0 {V4L2_VP9_REFERENCE_MODE_SELECT, "REFERENCE_MODE_SELECT"}))
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)=
),
> -	TP_fast_assign(__entry->h =3D *h;),
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
> -		=C2=A0 __print_symbolic(__entry->h.tx_mode,
> -		=C2=A0 {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
> -		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
> -		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_16X16, "TX_MODE_ALLOW_16X16"},
> -		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_32X32, "TX_MODE_ALLOW_32X32"},
> -		=C2=A0 {V4L2_VP9_TX_MODE_SELECT, "TX_MODE_SELECT"}),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.tx8,
> -				=C2=A0=C2=A0 sizeof(__entry->h.tx8),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.tx16,
> -				=C2=A0=C2=A0 sizeof(__entry->h.tx16),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.tx32,
> -				=C2=A0=C2=A0 sizeof(__entry->h.tx32),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->h.skip,
> -				ARRAY_SIZE(__entry->h.skip),
> -				sizeof(__entry->h.skip[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.inter_mode,
> -				=C2=A0=C2=A0 sizeof(__entry->h.inter_mode),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.interp_filter,
> -				=C2=A0=C2=A0 sizeof(__entry->h.interp_filter),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->h.is_inter,
> -				ARRAY_SIZE(__entry->h.is_inter),
> -				sizeof(__entry->h.is_inter[0])),
> -		=C2=A0 __print_array(__entry->h.comp_mode,
> -				ARRAY_SIZE(__entry->h.comp_mode),
> -				sizeof(__entry->h.comp_mode[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.single_ref,
> -				=C2=A0=C2=A0 sizeof(__entry->h.single_ref),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->h.comp_ref,
> -				ARRAY_SIZE(__entry->h.comp_ref),
> -				sizeof(__entry->h.comp_ref[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.y_mode,
> -				=C2=A0=C2=A0 sizeof(__entry->h.y_mode),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.uv_mode,
> -				=C2=A0=C2=A0 sizeof(__entry->h.uv_mode),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.partition,
> -				=C2=A0=C2=A0 sizeof(__entry->h.partition),
> -				=C2=A0=C2=A0 false)
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)=
),
> -	TP_fast_assign(__entry->h =3D *h;),
> -	TP_printk("\n coef {%s}",
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->h.coef,
> -				=C2=A0=C2=A0 sizeof(__entry->h.coef),
> -				=C2=A0=C2=A0 false)
> -	)
> -);
> -
> -DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
> -	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> -	TP_ARGS(p),
> -	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
> -	TP_fast_assign(__entry->p =3D *p;),
> -	TP_printk("\n joint %s\n"
> -		=C2=A0 "sign %s\n"
> -		=C2=A0 "classes {%s}\n"
> -		=C2=A0 "class0_bit %s\n"
> -		=C2=A0 "bits {%s}\n"
> -		=C2=A0 "class0_fr {%s}\n"
> -		=C2=A0 "fr {%s}\n"
> -		=C2=A0 "class0_hp %s\n"
> -		=C2=A0 "hp %s\n",
> -		=C2=A0 __print_array(__entry->p.joint,
> -				ARRAY_SIZE(__entry->p.joint),
> -				sizeof(__entry->p.joint[0])),
> -		=C2=A0 __print_array(__entry->p.sign,
> -				ARRAY_SIZE(__entry->p.sign),
> -				sizeof(__entry->p.sign[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.classes,
> -				=C2=A0=C2=A0 sizeof(__entry->p.classes),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->p.class0_bit,
> -				ARRAY_SIZE(__entry->p.class0_bit),
> -				sizeof(__entry->p.class0_bit[0])),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.bits,
> -				=C2=A0=C2=A0 sizeof(__entry->p.bits),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.class0_fr,
> -				=C2=A0=C2=A0 sizeof(__entry->p.class0_fr),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> -				=C2=A0=C2=A0 __entry->p.fr,
> -				=C2=A0=C2=A0 sizeof(__entry->p.fr),
> -				=C2=A0=C2=A0 false),
> -		=C2=A0 __print_array(__entry->p.class0_hp,
> -				ARRAY_SIZE(__entry->p.class0_hp),
> -				sizeof(__entry->p.class0_hp[0])),
> -		=C2=A0 __print_array(__entry->p.hp,
> -				ARRAY_SIZE(__entry->p.hp),
> -				sizeof(__entry->p.hp[0]))
> -	)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_vp9_frame_tmpl, v4l2_ctrl_vp9_frame,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> -	TP_ARGS(f)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_vp9_compressed_hdr_tmpl, v4l2_ctrl_vp9_compressed=
_hdr,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h)
> -);
> -
> -DEFINE_EVENT(v4l2_ctrl_vp9_compressed_coef_tmpl, v4l2_ctrl_vp9_compresse=
d_coeff,
> -	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> -	TP_ARGS(h)
> -);
> -
> -
> -DEFINE_EVENT(v4l2_vp9_mv_probs_tmpl, v4l2_vp9_mv_probs,
> -	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> -	TP_ARGS(p)
> -);
> -
> -#endif
> -
> -#undef TRACE_INCLUDE_PATH
> -#undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> -#define TRACE_INCLUDE_FILE visl-trace-vp9
> -#include <trace/define_trace.h>
> diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-co=
re/v4l2-trace.c
> index 95f3b02e1f84..9ce54c1968ef 100644
> --- a/drivers/media/v4l2-core/v4l2-trace.c
> +++ b/drivers/media/v4l2-core/v4l2-trace.c
> @@ -5,8 +5,53 @@
> =C2=A0
> =C2=A0#define CREATE_TRACE_POINTS
> =C2=A0#include <trace/events/v4l2.h>
> +#include <trace/events/v4l2_requests.h>
> =C2=A0
> =C2=A0EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_done);
> =C2=A0EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
> =C2=A0EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
> =C2=A0EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
> +
> +/* Export AV1 controls */
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_sequence);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_frame);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_tile_group_entry);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_film_grain);
> +
> +/* Export FWHT controls */
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_fwht_params);
> +
> +/* Export H264 controls */
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_h264_sps);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_h264_pps);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_h264_scaling_matrix);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_h264_pred_weights);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_h264_slice_params);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_h264_ref_pic_list0);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_h264_ref_pic_list1);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_h264_decode_params);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_h264_dpb_entry);
> +
> +/* Export HEVC controls */
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_hevc_sps);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_hevc_pps);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_hevc_slice_params);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hevc_pred_weight_table);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_hevc_scaling_matrix);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_hevc_decode_params);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hevc_dpb_entry);
> +
> +/* Export MPEG2 controls */
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_mpeg2_sequence);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_mpeg2_picture);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_mpeg2_quantisation);
> +
> +/* Export VP8 controls */
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_vp8_frame);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_vp8_entropy);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_vp9_frame);
> +
> +/* Export VP9 controls */
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_vp9_compressed_hdr);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_vp9_compressed_coeff);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_vp9_mv_probs);
> diff --git a/include/trace/events/v4l2_requests.h b/include/trace/events/=
v4l2_requests.h
> new file mode 100644
> index 000000000000..1e137d39d5fe
> --- /dev/null
> +++ b/include/trace/events/v4l2_requests.h
> @@ -0,0 +1,1645 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#if !defined(_TRACE_V4L2_REQUESTS_H_) || defined(TRACE_HEADER_MULTI_READ=
)
> +#define _TRACE_V4L2_REQUESTS_H_
> +
> +#include <linux/tracepoint.h>
> +#include <linux/v4l2-controls.h>
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM v4l2_requests
> +
> +/* AV1 controls */
> +DECLARE_EVENT_CLASS(v4l2_ctrl_av1_seq_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_sequence, s)),
> +	TP_fast_assign(__entry->s =3D *s;),
> +	TP_printk("\nflags %s\nseq_profile: %u\norder_hint_bits: %u\nbit_depth:=
 %u\n"
> +		=C2=A0 "max_frame_width_minus_1: %u\nmax_frame_height_minus_1: %u\n",
> +		=C2=A0 __print_flags(__entry->s.flags, "|",
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE, "STILL_PICTURE"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK, "USE_128X128_SU=
PERBLOCK"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA, "ENABLE_FILTER_INT=
RA"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER, "ENABLE_INTRA=
_EDGE_FILTER"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND, "ENABLE_INT=
ERINTRA_COMPOUND"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND, "ENABLE_MASKED_=
COMPOUND"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION, "ENABLE_WARPED_MO=
TION"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER, "ENABLE_DUAL_FILTER=
"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT, "ENABLE_ORDER_HINT"}=
,
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP, "ENABLE_JNT_COMP"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS, "ENABLE_REF_FRAME=
_MVS"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES, "ENABLE_SUPERRES"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF, "ENABLE_CDEF"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION, "ENABLE_RESTORATION=
"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME, "MONO_CHROME"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE, "COLOR_RANGE"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X, "SUBSAMPLING_X"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y, "SUBSAMPLING_Y"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT, "FILM_GRAIN_=
PARAMS_PRESENT"},
> +		=C2=A0 {V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q, "SEPARATE_UV_DELTA=
_Q"}),
> +		=C2=A0 __entry->s.seq_profile,
> +		=C2=A0 __entry->s.order_hint_bits,
> +		=C2=A0 __entry->s.bit_depth,
> +		=C2=A0 __entry->s.max_frame_width_minus_1,
> +		=C2=A0 __entry->s.max_frame_height_minus_1
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_av1_tge_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
> +	TP_ARGS(t),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_tile_group_entry, =
t)),
> +	TP_fast_assign(__entry->t =3D *t;),
> +	TP_printk("\ntile_offset: %u\n tile_size: %u\n tile_row: %u\ntile_col: =
%u\n",
> +		=C2=A0 __entry->t.tile_offset,
> +		=C2=A0 __entry->t.tile_size,
> +		=C2=A0 __entry->t.tile_row,
> +		=C2=A0 __entry->t.tile_col
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_av1_frame_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_frame, f)),
> +	TP_fast_assign(__entry->f =3D *f;),
> +	TP_printk("\ntile_info.flags: %s\ntile_info.context_update_tile_id: %u\=
n"
> +		=C2=A0 "tile_info.tile_cols: %u\ntile_info.tile_rows: %u\n"
> +		=C2=A0 "tile_info.mi_col_starts: %s\ntile_info.mi_row_starts: %s\n"
> +		=C2=A0 "tile_info.width_in_sbs_minus_1: %s\ntile_info.height_in_sbs_mi=
nus_1: %s\n"
> +		=C2=A0 "tile_info.tile_size_bytes: %u\nquantization.flags: %s\n"
> +		=C2=A0 "quantization.base_q_idx: %u\nquantization.delta_q_y_dc: %d\n"
> +		=C2=A0 "quantization.delta_q_u_dc: %d\nquantization.delta_q_u_ac: %d\n=
"
> +		=C2=A0 "quantization.delta_q_v_dc: %d\nquantization.delta_q_v_ac: %d\n=
"
> +		=C2=A0 "quantization.qm_y: %u\nquantization.qm_u: %u\nquantization.qm_=
v: %u\n"
> +		=C2=A0 "quantization.delta_q_res: %u\nsuperres_denom: %u\nsegmentation=
.flags: %s\n"
> +		=C2=A0 "segmentation.last_active_seg_id: %u\nsegmentation.feature_enab=
led:%s\n"
> +		=C2=A0 "loop_filter.flags: %s\nloop_filter.level: %s\nloop_filter.shar=
pness: %u\n"
> +		=C2=A0 "loop_filter.ref_deltas: %s\nloop_filter.mode_deltas: %s\n"
> +		=C2=A0 "loop_filter.delta_lf_res: %u\ncdef.damping_minus_3: %u\ncdef.b=
its: %u\n"
> +		=C2=A0 "cdef.y_pri_strength: %s\ncdef.y_sec_strength: %s\n"
> +		=C2=A0 "cdef.uv_pri_strength: %s\ncdef.uv_sec_strength:%s\nskip_mode_f=
rame: %s\n"
> +		=C2=A0 "primary_ref_frame: %u\nloop_restoration.flags: %s\n"
> +		=C2=A0 "loop_restoration.lr_unit_shift: %u\nloop_restoration.lr_uv_shi=
ft: %u\n"
> +		=C2=A0 "loop_restoration.frame_restoration_type: %s\n"
> +		=C2=A0 "loop_restoration.loop_restoration_size: %s\nflags: %s\norder_h=
int: %u\n"
> +		=C2=A0 "upscaled_width: %u\nframe_width_minus_1: %u\nframe_height_minu=
s_1: %u\n"
> +		=C2=A0 "render_width_minus_1: %u\nrender_height_minus_1: %u\ncurrent_f=
rame_id: %u\n"
> +		=C2=A0 "buffer_removal_time: %s\norder_hints: %s\nreference_frame_ts: =
%s\n"
> +		=C2=A0 "ref_frame_idx: %s\nrefresh_frame_flags: %u\n",
> +		=C2=A0 __print_flags(__entry->f.tile_info.flags, "|",
> +		=C2=A0 {V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING, "UNIFORM_TILE_SP=
ACING"}),
> +		=C2=A0 __entry->f.tile_info.context_update_tile_id,
> +		=C2=A0 __entry->f.tile_info.tile_cols,
> +		=C2=A0 __entry->f.tile_info.tile_rows,
> +		=C2=A0 __print_array(__entry->f.tile_info.mi_col_starts,
> +				ARRAY_SIZE(__entry->f.tile_info.mi_col_starts),
> +				sizeof(__entry->f.tile_info.mi_col_starts[0])),
> +		=C2=A0 __print_array(__entry->f.tile_info.mi_row_starts,
> +				ARRAY_SIZE(__entry->f.tile_info.mi_row_starts),
> +				sizeof(__entry->f.tile_info.mi_row_starts[0])),
> +		=C2=A0 __print_array(__entry->f.tile_info.width_in_sbs_minus_1,
> +				ARRAY_SIZE(__entry->f.tile_info.width_in_sbs_minus_1),
> +				sizeof(__entry->f.tile_info.width_in_sbs_minus_1[0])),
> +		=C2=A0 __print_array(__entry->f.tile_info.height_in_sbs_minus_1,
> +				ARRAY_SIZE(__entry->f.tile_info.height_in_sbs_minus_1),
> +				sizeof(__entry->f.tile_info.height_in_sbs_minus_1[0])),
> +		=C2=A0 __entry->f.tile_info.tile_size_bytes,
> +		=C2=A0 __print_flags(__entry->f.quantization.flags, "|",
> +		=C2=A0 {V4L2_AV1_QUANTIZATION_FLAG_DIFF_UV_DELTA, "DIFF_UV_DELTA"},
> +		=C2=A0 {V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX, "USING_QMATRIX"},
> +		=C2=A0 {V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT, "DELTA_Q_PRESENT"}=
),
> +		=C2=A0 __entry->f.quantization.base_q_idx,
> +		=C2=A0 __entry->f.quantization.delta_q_y_dc,
> +		=C2=A0 __entry->f.quantization.delta_q_u_dc,
> +		=C2=A0 __entry->f.quantization.delta_q_u_ac,
> +		=C2=A0 __entry->f.quantization.delta_q_v_dc,
> +		=C2=A0 __entry->f.quantization.delta_q_v_ac,
> +		=C2=A0 __entry->f.quantization.qm_y,
> +		=C2=A0 __entry->f.quantization.qm_u,
> +		=C2=A0 __entry->f.quantization.qm_v,
> +		=C2=A0 __entry->f.quantization.delta_q_res,
> +		=C2=A0 __entry->f.superres_denom,
> +		=C2=A0 __print_flags(__entry->f.segmentation.flags, "|",
> +		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_ENABLED, "ENABLED"},
> +		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP, "UPDATE_MAP"},
> +		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE, "TEMPORAL_UPDATE"}=
,
> +		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_UPDATE_DATA, "UPDATE_DATA"},
> +		=C2=A0 {V4L2_AV1_SEGMENTATION_FLAG_SEG_ID_PRE_SKIP, "SEG_ID_PRE_SKIP"}=
),
> +		=C2=A0 __entry->f.segmentation.last_active_seg_id,
> +		=C2=A0 __print_array(__entry->f.segmentation.feature_enabled,
> +				ARRAY_SIZE(__entry->f.segmentation.feature_enabled),
> +				sizeof(__entry->f.segmentation.feature_enabled[0])),
> +		=C2=A0 __print_flags(__entry->f.loop_filter.flags, "|",
> +		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED, "DELTA_ENABLED"},
> +		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_UPDATE, "DELTA_UPDATE"},
> +		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT, "DELTA_LF_PRESENT"=
},
> +		=C2=A0 {V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI, "DELTA_LF_MULTI"}),
> +		=C2=A0 __print_array(__entry->f.loop_filter.level,
> +				ARRAY_SIZE(__entry->f.loop_filter.level),
> +				sizeof(__entry->f.loop_filter.level[0])),
> +		=C2=A0 __entry->f.loop_filter.sharpness,
> +		=C2=A0 __print_array(__entry->f.loop_filter.ref_deltas,
> +				ARRAY_SIZE(__entry->f.loop_filter.ref_deltas),
> +				sizeof(__entry->f.loop_filter.ref_deltas[0])),
> +		=C2=A0 __print_array(__entry->f.loop_filter.mode_deltas,
> +				ARRAY_SIZE(__entry->f.loop_filter.mode_deltas),
> +				sizeof(__entry->f.loop_filter.mode_deltas[0])),
> +		=C2=A0 __entry->f.loop_filter.delta_lf_res,
> +		=C2=A0 __entry->f.cdef.damping_minus_3,
> +		=C2=A0 __entry->f.cdef.bits,
> +		=C2=A0 __print_array(__entry->f.cdef.y_pri_strength,
> +				ARRAY_SIZE(__entry->f.cdef.y_pri_strength),
> +				sizeof(__entry->f.cdef.y_pri_strength[0])),
> +		=C2=A0 __print_array(__entry->f.cdef.y_sec_strength,
> +				ARRAY_SIZE(__entry->f.cdef.y_sec_strength),
> +				sizeof(__entry->f.cdef.y_sec_strength[0])),
> +		=C2=A0 __print_array(__entry->f.cdef.uv_pri_strength,
> +				ARRAY_SIZE(__entry->f.cdef.uv_pri_strength),
> +				sizeof(__entry->f.cdef.uv_pri_strength[0])),
> +		=C2=A0 __print_array(__entry->f.cdef.uv_sec_strength,
> +				ARRAY_SIZE(__entry->f.cdef.uv_sec_strength),
> +				sizeof(__entry->f.cdef.uv_sec_strength[0])),
> +		=C2=A0 __print_array(__entry->f.skip_mode_frame,
> +				ARRAY_SIZE(__entry->f.skip_mode_frame),
> +				sizeof(__entry->f.skip_mode_frame[0])),
> +		=C2=A0 __entry->f.primary_ref_frame,
> +		=C2=A0 __print_flags(__entry->f.loop_restoration.flags, "|",
> +		=C2=A0 {V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR, "USES_LR"},
> +		=C2=A0 {V4L2_AV1_LOOP_RESTORATION_FLAG_USES_CHROMA_LR, "USES_CHROMA_LR=
"}),
> +		=C2=A0 __entry->f.loop_restoration.lr_unit_shift,
> +		=C2=A0 __entry->f.loop_restoration.lr_uv_shift,
> +		=C2=A0 __print_array(__entry->f.loop_restoration.frame_restoration_typ=
e,
> +				ARRAY_SIZE(__entry->f.loop_restoration.frame_restoration_type),
> +				sizeof(__entry->f.loop_restoration.frame_restoration_type[0])),
> +		=C2=A0 __print_array(__entry->f.loop_restoration.loop_restoration_size=
,
> +				ARRAY_SIZE(__entry->f.loop_restoration.loop_restoration_size),
> +				sizeof(__entry->f.loop_restoration.loop_restoration_size[0])),
> +		=C2=A0 __print_flags(__entry->f.flags, "|",
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME, "SHOWABLE_FRAME"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE, "ERROR_RESILIENT_MOD=
E"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE, "DISABLE_CDF_UPDATE"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS, "ALLOW_SCREEN_=
CONTENT_TOOLS"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV, "FORCE_INTEGER_MV"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC, "ALLOW_INTRABC"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_USE_SUPERRES, "USE_SUPERRES"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV, "ALLOW_HIGH_PRECI=
SION_MV"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE, "IS_MOTION_MODE=
_SWITCHABLE"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS, "USE_REF_FRAME_MVS"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF,
> +		=C2=A0=C2=A0 "DISABLE_FRAME_END_UPDATE_CDF"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION, "ALLOW_WARPED_MOTION"=
},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT, "REFERENCE_SELECT"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET, "REDUCED_TX_SET"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED, "SKIP_MODE_ALLOWED"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT, "SKIP_MODE_PRESENT"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE, "FRAME_SIZE_OVERRIDE"=
},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT, "BUFFER_REMOV=
AL_TIME_PRESENT"},
> +		=C2=A0 {V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING, "FRAME_REFS_SH=
ORT_SIGNALING"}),
> +		=C2=A0 __entry->f.order_hint,
> +		=C2=A0 __entry->f.upscaled_width,
> +		=C2=A0 __entry->f.frame_width_minus_1,
> +		=C2=A0 __entry->f.frame_height_minus_1,
> +		=C2=A0 __entry->f.render_width_minus_1,
> +		=C2=A0 __entry->f.render_height_minus_1,
> +		=C2=A0 __entry->f.current_frame_id,
> +		=C2=A0 __print_array(__entry->f.buffer_removal_time,
> +				ARRAY_SIZE(__entry->f.buffer_removal_time),
> +				sizeof(__entry->f.buffer_removal_time[0])),
> +		=C2=A0 __print_array(__entry->f.order_hints,
> +				ARRAY_SIZE(__entry->f.order_hints),
> +				sizeof(__entry->f.order_hints[0])),
> +		=C2=A0 __print_array(__entry->f.reference_frame_ts,
> +				ARRAY_SIZE(__entry->f.reference_frame_ts),
> +				sizeof(__entry->f.reference_frame_ts[0])),
> +		=C2=A0 __print_array(__entry->f.ref_frame_idx,
> +				ARRAY_SIZE(__entry->f.ref_frame_idx),
> +				sizeof(__entry->f.ref_frame_idx[0])),
> +		=C2=A0 __entry->f.refresh_frame_flags
> +	)
> +);
> +
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_av1_film_grain_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_av1_film_grain, f)),
> +	TP_fast_assign(__entry->f =3D *f;),
> +	TP_printk("\nflags %s\ncr_mult: %u\ngrain_seed: %u\n"
> +		=C2=A0 "film_grain_params_ref_idx: %u\nnum_y_points: %u\npoint_y_value=
: %s\n"
> +		=C2=A0 "point_y_scaling: %s\nnum_cb_points: %u\npoint_cb_value: %s\n"
> +		=C2=A0 "point_cb_scaling: %s\nnum_cr_points: %u\npoint_cr_value: %s\n"
> +		=C2=A0 "point_cr_scaling: %s\ngrain_scaling_minus_8: %u\nar_coeff_lag:=
 %u\n"
> +		=C2=A0 "ar_coeffs_y_plus_128: %s\nar_coeffs_cb_plus_128: %s\n"
> +		=C2=A0 "ar_coeffs_cr_plus_128: %s\nar_coeff_shift_minus_6: %u\n"
> +		=C2=A0 "grain_scale_shift: %u\ncb_mult: %u\ncb_luma_mult: %u\ncr_luma_=
mult: %u\n"
> +		=C2=A0 "cb_offset: %u\ncr_offset: %u\n",
> +		=C2=A0 __print_flags(__entry->f.flags, "|",
> +		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN, "APPLY_GRAIN"},
> +		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN, "UPDATE_GRAIN"},
> +		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA, "CHROMA_SCA=
LING_FROM_LUMA"},
> +		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_OVERLAP, "OVERLAP"},
> +		=C2=A0 {V4L2_AV1_FILM_GRAIN_FLAG_CLIP_TO_RESTRICTED_RANGE, "CLIP_TO_RE=
STRICTED_RANGE"}),
> +		=C2=A0 __entry->f.cr_mult,
> +		=C2=A0 __entry->f.grain_seed,
> +		=C2=A0 __entry->f.film_grain_params_ref_idx,
> +		=C2=A0 __entry->f.num_y_points,
> +		=C2=A0 __print_array(__entry->f.point_y_value,
> +				ARRAY_SIZE(__entry->f.point_y_value),
> +				sizeof(__entry->f.point_y_value[0])),
> +		=C2=A0 __print_array(__entry->f.point_y_scaling,
> +				ARRAY_SIZE(__entry->f.point_y_scaling),
> +				sizeof(__entry->f.point_y_scaling[0])),
> +		=C2=A0 __entry->f.num_cb_points,
> +		=C2=A0 __print_array(__entry->f.point_cb_value,
> +				ARRAY_SIZE(__entry->f.point_cb_value),
> +				sizeof(__entry->f.point_cb_value[0])),
> +		=C2=A0 __print_array(__entry->f.point_cb_scaling,
> +				ARRAY_SIZE(__entry->f.point_cb_scaling),
> +				sizeof(__entry->f.point_cb_scaling[0])),
> +		=C2=A0 __entry->f.num_cr_points,
> +		=C2=A0 __print_array(__entry->f.point_cr_value,
> +				ARRAY_SIZE(__entry->f.point_cr_value),
> +				sizeof(__entry->f.point_cr_value[0])),
> +		=C2=A0 __print_array(__entry->f.point_cr_scaling,
> +				ARRAY_SIZE(__entry->f.point_cr_scaling),
> +				sizeof(__entry->f.point_cr_scaling[0])),
> +		=C2=A0 __entry->f.grain_scaling_minus_8,
> +		=C2=A0 __entry->f.ar_coeff_lag,
> +		=C2=A0 __print_array(__entry->f.ar_coeffs_y_plus_128,
> +				ARRAY_SIZE(__entry->f.ar_coeffs_y_plus_128),
> +				sizeof(__entry->f.ar_coeffs_y_plus_128[0])),
> +		=C2=A0 __print_array(__entry->f.ar_coeffs_cb_plus_128,
> +				ARRAY_SIZE(__entry->f.ar_coeffs_cb_plus_128),
> +				sizeof(__entry->f.ar_coeffs_cb_plus_128[0])),
> +		=C2=A0 __print_array(__entry->f.ar_coeffs_cr_plus_128,
> +				ARRAY_SIZE(__entry->f.ar_coeffs_cr_plus_128),
> +				sizeof(__entry->f.ar_coeffs_cr_plus_128[0])),
> +		=C2=A0 __entry->f.ar_coeff_shift_minus_6,
> +		=C2=A0 __entry->f.grain_scale_shift,
> +		=C2=A0 __entry->f.cb_mult,
> +		=C2=A0 __entry->f.cb_luma_mult,
> +		=C2=A0 __entry->f.cr_luma_mult,
> +		=C2=A0 __entry->f.cb_offset,
> +		=C2=A0 __entry->f.cr_offset
> +	)
> +)
> +
> +DEFINE_EVENT(v4l2_ctrl_av1_seq_tmpl, v4l2_ctrl_av1_sequence,
> +	TP_PROTO(const struct v4l2_ctrl_av1_sequence *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_av1_frame_tmpl, v4l2_ctrl_av1_frame,
> +	TP_PROTO(const struct v4l2_ctrl_av1_frame *f),
> +	TP_ARGS(f)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_av1_tge_tmpl, v4l2_ctrl_av1_tile_group_entry,
> +	TP_PROTO(const struct v4l2_ctrl_av1_tile_group_entry *t),
> +	TP_ARGS(t)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_av1_film_grain_tmpl, v4l2_ctrl_av1_film_grain,
> +	TP_PROTO(const struct v4l2_ctrl_av1_film_grain *f),
> +	TP_ARGS(f)
> +);
> +
> +/* FWHT controls */
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(
> +			 __field(u64, backward_ref_ts)
> +			 __field(u32, version)
> +			 __field(u32, width)
> +			 __field(u32, height)
> +			 __field(u32, flags)
> +			 __field(u32, colorspace)
> +			 __field(u32, xfer_func)
> +			 __field(u32, ycbcr_enc)
> +			 __field(u32, quantization)
> +			 ),
> +	TP_fast_assign(
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->backward_ref_ts =3D p->b=
ackward_ref_ts;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->version =3D p->version;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->width =3D p->width;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->height =3D p->height;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->flags =3D p->flags;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->colorspace =3D p->colors=
pace;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->xfer_func =3D p->xfer_fu=
nc;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->ycbcr_enc =3D p->ycbcr_e=
nc;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->quantization =3D p->quan=
tization;
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ),
> +	TP_printk("backward_ref_ts %llu version %u width %u height %u flags %s =
colorspace %u xfer_func %u ycbcr_enc %u quantization %u",
> +		=C2=A0 __entry->backward_ref_ts, __entry->version, __entry->width, __e=
ntry->height,
> +		=C2=A0 __print_flags(__entry->flags, "|",
> +		=C2=A0 {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
> +		=C2=A0 {V4L2_FWHT_FL_IS_BOTTOM_FIRST, "IS_BOTTOM_FIRST"},
> +		=C2=A0 {V4L2_FWHT_FL_IS_ALTERNATE, "IS_ALTERNATE"},
> +		=C2=A0 {V4L2_FWHT_FL_IS_BOTTOM_FIELD, "IS_BOTTOM_FIELD"},
> +		=C2=A0 {V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED, "LUMA_IS_UNCOMPRESSED"},
> +		=C2=A0 {V4L2_FWHT_FL_CB_IS_UNCOMPRESSED, "CB_IS_UNCOMPRESSED"},
> +		=C2=A0 {V4L2_FWHT_FL_CR_IS_UNCOMPRESSED, "CR_IS_UNCOMPRESSED"},
> +		=C2=A0 {V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED, "ALPHA_IS_UNCOMPRESSED"},
> +		=C2=A0 {V4L2_FWHT_FL_I_FRAME, "I_FRAME"},
> +		=C2=A0 {V4L2_FWHT_FL_PIXENC_HSV, "PIXENC_HSV"},
> +		=C2=A0 {V4L2_FWHT_FL_PIXENC_RGB, "PIXENC_RGB"},
> +		=C2=A0 {V4L2_FWHT_FL_PIXENC_YUV, "PIXENC_YUV"}),
> +		=C2=A0 __entry->colorspace, __entry->xfer_func, __entry->ycbcr_enc,
> +		=C2=A0 __entry->quantization)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_fwht_params_tmpl, v4l2_ctrl_fwht_params,
> +	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> +	TP_ARGS(p)
> +);
> +
> +/* H264 controls */
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
> +	TP_fast_assign(__entry->s =3D *s),
> +	TP_printk("\nprofile_idc %u\n"
> +		=C2=A0 "constraint_set_flags %s\n"
> +		=C2=A0 "level_idc %u\n"
> +		=C2=A0 "seq_parameter_set_id %u\n"
> +		=C2=A0 "chroma_format_idc %u\n"
> +		=C2=A0 "bit_depth_luma_minus8 %u\n"
> +		=C2=A0 "bit_depth_chroma_minus8 %u\n"
> +		=C2=A0 "log2_max_frame_num_minus4 %u\n"
> +		=C2=A0 "pic_order_cnt_type %u\n"
> +		=C2=A0 "log2_max_pic_order_cnt_lsb_minus4 %u\n"
> +		=C2=A0 "max_num_ref_frames %u\n"
> +		=C2=A0 "num_ref_frames_in_pic_order_cnt_cycle %u\n"
> +		=C2=A0 "offset_for_ref_frame %s\n"
> +		=C2=A0 "offset_for_non_ref_pic %d\n"
> +		=C2=A0 "offset_for_top_to_bottom_field %d\n"
> +		=C2=A0 "pic_width_in_mbs_minus1 %u\n"
> +		=C2=A0 "pic_height_in_map_units_minus1 %u\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __entry->s.profile_idc,
> +		=C2=A0 __print_flags(__entry->s.constraint_set_flags, "|",
> +		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG"},
> +		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET1_FLAG, "CONSTRAINT_SET1_FLAG"},
> +		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET2_FLAG, "CONSTRAINT_SET2_FLAG"},
> +		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET3_FLAG, "CONSTRAINT_SET3_FLAG"},
> +		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET4_FLAG, "CONSTRAINT_SET4_FLAG"},
> +		=C2=A0 {V4L2_H264_SPS_CONSTRAINT_SET5_FLAG, "CONSTRAINT_SET5_FLAG"}),
> +		=C2=A0 __entry->s.level_idc,
> +		=C2=A0 __entry->s.seq_parameter_set_id,
> +		=C2=A0 __entry->s.chroma_format_idc,
> +		=C2=A0 __entry->s.bit_depth_luma_minus8,
> +		=C2=A0 __entry->s.bit_depth_chroma_minus8,
> +		=C2=A0 __entry->s.log2_max_frame_num_minus4,
> +		=C2=A0 __entry->s.pic_order_cnt_type,
> +		=C2=A0 __entry->s.log2_max_pic_order_cnt_lsb_minus4,
> +		=C2=A0 __entry->s.max_num_ref_frames,
> +		=C2=A0 __entry->s.num_ref_frames_in_pic_order_cnt_cycle,
> +		=C2=A0 __print_array(__entry->s.offset_for_ref_frame,
> +				ARRAY_SIZE(__entry->s.offset_for_ref_frame),
> +				sizeof(__entry->s.offset_for_ref_frame[0])),
> +		=C2=A0 __entry->s.offset_for_non_ref_pic,
> +		=C2=A0 __entry->s.offset_for_top_to_bottom_field,
> +		=C2=A0 __entry->s.pic_width_in_mbs_minus1,
> +		=C2=A0 __entry->s.pic_height_in_map_units_minus1,
> +		=C2=A0 __print_flags(__entry->s.flags, "|",
> +		=C2=A0 {V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE, "SEPARATE_COLOUR_PLA=
NE"},
> +		=C2=A0 {V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS, "QPPRIME_Y=
_ZERO_TRANSFORM_BYPASS"},
> +		=C2=A0 {V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO, "DELTA_PIC_ORD=
ER_ALWAYS_ZERO"},
> +		=C2=A0 {V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED, "GAPS_IN_F=
RAME_NUM_VALUE_ALLOWED"},
> +		=C2=A0 {V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY, "FRAME_MBS_ONLY"},
> +		=C2=A0 {V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD, "MB_ADAPTIVE_FRAME=
_FIELD"},
> +		=C2=A0 {V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE, "DIRECT_8X8_INFERENCE=
"}
> +		=C2=A0 ))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
> +	TP_fast_assign(__entry->p =3D *p),
> +	TP_printk("\npic_parameter_set_id %u\n"
> +		=C2=A0 "seq_parameter_set_id %u\n"
> +		=C2=A0 "num_slice_groups_minus1 %u\n"
> +		=C2=A0 "num_ref_idx_l0_default_active_minus1 %u\n"
> +		=C2=A0 "num_ref_idx_l1_default_active_minus1 %u\n"
> +		=C2=A0 "weighted_bipred_idc %u\n"
> +		=C2=A0 "pic_init_qp_minus26 %d\n"
> +		=C2=A0 "pic_init_qs_minus26 %d\n"
> +		=C2=A0 "chroma_qp_index_offset %d\n"
> +		=C2=A0 "second_chroma_qp_index_offset %d\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __entry->p.pic_parameter_set_id,
> +		=C2=A0 __entry->p.seq_parameter_set_id,
> +		=C2=A0 __entry->p.num_slice_groups_minus1,
> +		=C2=A0 __entry->p.num_ref_idx_l0_default_active_minus1,
> +		=C2=A0 __entry->p.num_ref_idx_l1_default_active_minus1,
> +		=C2=A0 __entry->p.weighted_bipred_idc,
> +		=C2=A0 __entry->p.pic_init_qp_minus26,
> +		=C2=A0 __entry->p.pic_init_qs_minus26,
> +		=C2=A0 __entry->p.chroma_qp_index_offset,
> +		=C2=A0 __entry->p.second_chroma_qp_index_offset,
> +		=C2=A0 __print_flags(__entry->p.flags, "|",
> +		=C2=A0 {V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE, "ENTROPY_CODING_MODE"}=
,
> +		=C2=A0 {V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT, "B=
OTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT"},
> +		=C2=A0 {V4L2_H264_PPS_FLAG_WEIGHTED_PRED, "WEIGHTED_PRED"},
> +		=C2=A0 {V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "DEBLOCK=
ING_FILTER_CONTROL_PRESENT"},
> +		=C2=A0 {V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED, "CONSTRAINED_INTRA_=
PRED"},
> +		=C2=A0 {V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT, "REDUNDANT_PIC_C=
NT_PRESENT"},
> +		=C2=A0 {V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE, "TRANSFORM_8X8_MODE"},
> +		=C2=A0 {V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT, "SCALING_MATRIX_PRE=
SENT"}
> +		=C2=A0 ))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matrix, s=
)),
> +	TP_fast_assign(__entry->s =3D *s),
> +	TP_printk("\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> +				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->s.scaling_list_8x8,
> +				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_8x8),
> +				=C2=A0=C2=A0 false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights, p))=
,
> +	TP_fast_assign(__entry->p =3D *p),
> +	TP_printk("\nluma_log2_weight_denom %u\n"
> +		=C2=A0 "chroma_log2_weight_denom %u\n"
> +		=C2=A0 "weight_factor[0].luma_weight %s\n"
> +		=C2=A0 "weight_factor[0].luma_offset %s\n"
> +		=C2=A0 "weight_factor[0].chroma_weight {%s}\n"
> +		=C2=A0 "weight_factor[0].chroma_offset {%s}\n"
> +		=C2=A0 "weight_factor[1].luma_weight %s\n"
> +		=C2=A0 "weight_factor[1].luma_offset %s\n"
> +		=C2=A0 "weight_factor[1].chroma_weight {%s}\n"
> +		=C2=A0 "weight_factor[1].chroma_offset {%s}\n",
> +		=C2=A0 __entry->p.luma_log2_weight_denom,
> +		=C2=A0 __entry->p.chroma_log2_weight_denom,
> +		=C2=A0 __print_array(__entry->p.weight_factors[0].luma_weight,
> +				ARRAY_SIZE(__entry->p.weight_factors[0].luma_weight),
> +				sizeof(__entry->p.weight_factors[0].luma_weight[0])),
> +		=C2=A0 __print_array(__entry->p.weight_factors[0].luma_offset,
> +				ARRAY_SIZE(__entry->p.weight_factors[0].luma_offset),
> +				sizeof(__entry->p.weight_factors[0].luma_offset[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.weight_factors[0].chroma_weight,
> +				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[0].chroma_weight),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.weight_factors[0].chroma_offset,
> +				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[0].chroma_offset),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->p.weight_factors[1].luma_weight,
> +				ARRAY_SIZE(__entry->p.weight_factors[1].luma_weight),
> +				sizeof(__entry->p.weight_factors[1].luma_weight[0])),
> +		=C2=A0 __print_array(__entry->p.weight_factors[1].luma_offset,
> +				ARRAY_SIZE(__entry->p.weight_factors[1].luma_offset),
> +				sizeof(__entry->p.weight_factors[1].luma_offset[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.weight_factors[1].chroma_weight,
> +				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[1].chroma_weight),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.weight_factors[1].chroma_offset,
> +				=C2=A0=C2=A0 sizeof(__entry->p.weight_factors[1].chroma_offset),
> +				=C2=A0=C2=A0 false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params, s))=
,
> +	TP_fast_assign(__entry->s =3D *s),
> +	TP_printk("\nheader_bit_size %u\n"
> +		=C2=A0 "first_mb_in_slice %u\n"
> +		=C2=A0 "slice_type %s\n"
> +		=C2=A0 "colour_plane_id %u\n"
> +		=C2=A0 "redundant_pic_cnt %u\n"
> +		=C2=A0 "cabac_init_idc %u\n"
> +		=C2=A0 "slice_qp_delta %d\n"
> +		=C2=A0 "slice_qs_delta %d\n"
> +		=C2=A0 "disable_deblocking_filter_idc %u\n"
> +		=C2=A0 "slice_alpha_c0_offset_div2 %u\n"
> +		=C2=A0 "slice_beta_offset_div2 %u\n"
> +		=C2=A0 "num_ref_idx_l0_active_minus1 %u\n"
> +		=C2=A0 "num_ref_idx_l1_active_minus1 %u\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __entry->s.header_bit_size,
> +		=C2=A0 __entry->s.first_mb_in_slice,
> +		=C2=A0 __print_symbolic(__entry->s.slice_type,
> +		=C2=A0 {V4L2_H264_SLICE_TYPE_P, "P"},
> +		=C2=A0 {V4L2_H264_SLICE_TYPE_B, "B"},
> +		=C2=A0 {V4L2_H264_SLICE_TYPE_I, "I"},
> +		=C2=A0 {V4L2_H264_SLICE_TYPE_SP, "SP"},
> +		=C2=A0 {V4L2_H264_SLICE_TYPE_SI, "SI"}),
> +		=C2=A0 __entry->s.colour_plane_id,
> +		=C2=A0 __entry->s.redundant_pic_cnt,
> +		=C2=A0 __entry->s.cabac_init_idc,
> +		=C2=A0 __entry->s.slice_qp_delta,
> +		=C2=A0 __entry->s.slice_qs_delta,
> +		=C2=A0 __entry->s.disable_deblocking_filter_idc,
> +		=C2=A0 __entry->s.slice_alpha_c0_offset_div2,
> +		=C2=A0 __entry->s.slice_beta_offset_div2,
> +		=C2=A0 __entry->s.num_ref_idx_l0_active_minus1,
> +		=C2=A0 __entry->s.num_ref_idx_l1_active_minus1,
> +		=C2=A0 __print_flags(__entry->s.flags, "|",
> +		=C2=A0 {V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED, "DIRECT_SPATIAL_M=
V_PRED"},
> +		=C2=A0 {V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH, "SP_FOR_SWITCH"})
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
> +	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(r, i),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
> +			 __field(int, i)),
> +	TP_fast_assign(__entry->r =3D *r; __entry->i =3D i;),
> +	TP_printk("[%d]: fields %s index %u",
> +		=C2=A0 __entry->i,
> +		=C2=A0 __print_flags(__entry->r.fields, "|",
> +		=C2=A0 {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> +		=C2=A0 {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
> +		=C2=A0 {V4L2_H264_FRAME_REF, "FRAME_REF"}),
> +		=C2=A0 __entry->r.index
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> +	TP_ARGS(d),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_params, d)=
),
> +	TP_fast_assign(__entry->d =3D *d),
> +	TP_printk("\nnal_ref_idc %u\n"
> +		=C2=A0 "frame_num %u\n"
> +		=C2=A0 "top_field_order_cnt %d\n"
> +		=C2=A0 "bottom_field_order_cnt %d\n"
> +		=C2=A0 "idr_pic_id %u\n"
> +		=C2=A0 "pic_order_cnt_lsb %u\n"
> +		=C2=A0 "delta_pic_order_cnt_bottom %d\n"
> +		=C2=A0 "delta_pic_order_cnt0 %d\n"
> +		=C2=A0 "delta_pic_order_cnt1 %d\n"
> +		=C2=A0 "dec_ref_pic_marking_bit_size %u\n"
> +		=C2=A0 "pic_order_cnt_bit_size %u\n"
> +		=C2=A0 "slice_group_change_cycle %u\n"
> +		=C2=A0 "flags %s\n",
> +		=C2=A0 __entry->d.nal_ref_idc,
> +		=C2=A0 __entry->d.frame_num,
> +		=C2=A0 __entry->d.top_field_order_cnt,
> +		=C2=A0 __entry->d.bottom_field_order_cnt,
> +		=C2=A0 __entry->d.idr_pic_id,
> +		=C2=A0 __entry->d.pic_order_cnt_lsb,
> +		=C2=A0 __entry->d.delta_pic_order_cnt_bottom,
> +		=C2=A0 __entry->d.delta_pic_order_cnt0,
> +		=C2=A0 __entry->d.delta_pic_order_cnt1,
> +		=C2=A0 __entry->d.dec_ref_pic_marking_bit_size,
> +		=C2=A0 __entry->d.pic_order_cnt_bit_size,
> +		=C2=A0 __entry->d.slice_group_change_cycle,
> +		=C2=A0 __print_flags(__entry->d.flags, "|",
> +		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC, "IDR_PIC"},
> +		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC, "FIELD_PIC"},
> +		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD, "BOTTOM_FIELD"},
> +		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_PFRAME, "PFRAME"},
> +		=C2=A0 {V4L2_H264_DECODE_PARAM_FLAG_BFRAME, "BFRAME"})
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
> +	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> +	TP_ARGS(e, i),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
> +			 __field(int, i)),
> +	TP_fast_assign(__entry->e =3D *e; __entry->i =3D i;),
> +	TP_printk("[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s "
> +		=C2=A0 "top_field_order_cnt %d bottom_field_order_cnt %d flags %s",
> +		=C2=A0 __entry->i,
> +		=C2=A0 __entry->e.reference_ts,
> +		=C2=A0 __entry->e.pic_num,
> +		=C2=A0 __entry->e.frame_num,
> +		=C2=A0 __print_flags(__entry->e.fields, "|",
> +		=C2=A0 {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> +		=C2=A0 {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
> +		=C2=A0 {V4L2_H264_FRAME_REF, "FRAME_REF"}),
> +		=C2=A0 __entry->e.top_field_order_cnt,
> +		=C2=A0 __entry->e.bottom_field_order_cnt,
> +		=C2=A0 __print_flags(__entry->e.flags, "|",
> +		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_VALID, "VALID"},
> +		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_ACTIVE, "ACTIVE"},
> +		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM, "LONG_TERM"},
> +		=C2=A0 {V4L2_H264_DPB_ENTRY_FLAG_FIELD, "FIELD"})
> +
> +	)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_sps_tmpl, v4l2_ctrl_h264_sps,
> +	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_pps_tmpl, v4l2_ctrl_h264_pps,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_scaling_matrix_tmpl, v4l2_ctrl_h264_scaling_=
matrix,
> +	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_pred_weights_tmpl, v4l2_ctrl_h264_pred_weigh=
ts,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_slice_params_tmpl, v4l2_ctrl_h264_slice_para=
ms,
> +	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list0,
> +	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(r, i)
> +);
> +
> +DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list1,
> +	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(r, i)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_decode_params_tmpl, v4l2_ctrl_h264_decode_pa=
rams,
> +	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> +	TP_ARGS(d)
> +);
> +
> +DEFINE_EVENT(v4l2_h264_dpb_entry_tmpl, v4l2_h264_dpb_entry,
> +	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> +	TP_ARGS(e, i)
> +);
> +
> +/* HEVC controls */
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_sps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_sps, s)),
> +	TP_fast_assign(__entry->s =3D *s),
> +	TP_printk("\nvideo_parameter_set_id %u\n"
> +		=C2=A0 "seq_parameter_set_id %u\n"
> +		=C2=A0 "pic_width_in_luma_samples %u\n"
> +		=C2=A0 "pic_height_in_luma_samples %u\n"
> +		=C2=A0 "bit_depth_luma_minus8 %u\n"
> +		=C2=A0 "bit_depth_chroma_minus8 %u\n"
> +		=C2=A0 "log2_max_pic_order_cnt_lsb_minus4 %u\n"
> +		=C2=A0 "sps_max_dec_pic_buffering_minus1 %u\n"
> +		=C2=A0 "sps_max_num_reorder_pics %u\n"
> +		=C2=A0 "sps_max_latency_increase_plus1 %u\n"
> +		=C2=A0 "log2_min_luma_coding_block_size_minus3 %u\n"
> +		=C2=A0 "log2_diff_max_min_luma_coding_block_size %u\n"
> +		=C2=A0 "log2_min_luma_transform_block_size_minus2 %u\n"
> +		=C2=A0 "log2_diff_max_min_luma_transform_block_size %u\n"
> +		=C2=A0 "max_transform_hierarchy_depth_inter %u\n"
> +		=C2=A0 "max_transform_hierarchy_depth_intra %u\n"
> +		=C2=A0 "pcm_sample_bit_depth_luma_minus1 %u\n"
> +		=C2=A0 "pcm_sample_bit_depth_chroma_minus1 %u\n"
> +		=C2=A0 "log2_min_pcm_luma_coding_block_size_minus3 %u\n"
> +		=C2=A0 "log2_diff_max_min_pcm_luma_coding_block_size %u\n"
> +		=C2=A0 "num_short_term_ref_pic_sets %u\n"
> +		=C2=A0 "num_long_term_ref_pics_sps %u\n"
> +		=C2=A0 "chroma_format_idc %u\n"
> +		=C2=A0 "sps_max_sub_layers_minus1 %u\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __entry->s.video_parameter_set_id,
> +		=C2=A0 __entry->s.seq_parameter_set_id,
> +		=C2=A0 __entry->s.pic_width_in_luma_samples,
> +		=C2=A0 __entry->s.pic_height_in_luma_samples,
> +		=C2=A0 __entry->s.bit_depth_luma_minus8,
> +		=C2=A0 __entry->s.bit_depth_chroma_minus8,
> +		=C2=A0 __entry->s.log2_max_pic_order_cnt_lsb_minus4,
> +		=C2=A0 __entry->s.sps_max_dec_pic_buffering_minus1,
> +		=C2=A0 __entry->s.sps_max_num_reorder_pics,
> +		=C2=A0 __entry->s.sps_max_latency_increase_plus1,
> +		=C2=A0 __entry->s.log2_min_luma_coding_block_size_minus3,
> +		=C2=A0 __entry->s.log2_diff_max_min_luma_coding_block_size,
> +		=C2=A0 __entry->s.log2_min_luma_transform_block_size_minus2,
> +		=C2=A0 __entry->s.log2_diff_max_min_luma_transform_block_size,
> +		=C2=A0 __entry->s.max_transform_hierarchy_depth_inter,
> +		=C2=A0 __entry->s.max_transform_hierarchy_depth_intra,
> +		=C2=A0 __entry->s.pcm_sample_bit_depth_luma_minus1,
> +		=C2=A0 __entry->s.pcm_sample_bit_depth_chroma_minus1,
> +		=C2=A0 __entry->s.log2_min_pcm_luma_coding_block_size_minus3,
> +		=C2=A0 __entry->s.log2_diff_max_min_pcm_luma_coding_block_size,
> +		=C2=A0 __entry->s.num_short_term_ref_pic_sets,
> +		=C2=A0 __entry->s.num_long_term_ref_pics_sps,
> +		=C2=A0 __entry->s.chroma_format_idc,
> +		=C2=A0 __entry->s.sps_max_sub_layers_minus1,
> +		=C2=A0 __print_flags(__entry->s.flags, "|",
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE, "SEPARATE_COLOUR_PLA=
NE"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED, "SCALING_LIST_ENABLED=
"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_AMP_ENABLED, "AMP_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET, "SAMPLE_ADAPTIVE_OF=
FSET"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_PCM_ENABLED, "PCM_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED, "V4L2_HEVC_SPS_FL=
AG_PCM_LOOP_FILTER_DISABLED"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT, "LONG_TERM_REF_=
PICS_PRESENT"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED, "TEMPORAL_MVP_ENA=
BLED"},
> +		=C2=A0 {V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED, "STRONG_INT=
RA_SMOOTHING_ENABLED"}
> +	))
> +
> +);
> +
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_pps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_pps, p)),
> +	TP_fast_assign(__entry->p =3D *p),
> +	TP_printk("\npic_parameter_set_id %u\n"
> +		=C2=A0 "num_extra_slice_header_bits %u\n"
> +		=C2=A0 "num_ref_idx_l0_default_active_minus1 %u\n"
> +		=C2=A0 "num_ref_idx_l1_default_active_minus1 %u\n"
> +		=C2=A0 "init_qp_minus26 %d\n"
> +		=C2=A0 "diff_cu_qp_delta_depth %u\n"
> +		=C2=A0 "pps_cb_qp_offset %d\n"
> +		=C2=A0 "pps_cr_qp_offset %d\n"
> +		=C2=A0 "num_tile_columns_minus1 %d\n"
> +		=C2=A0 "num_tile_rows_minus1 %d\n"
> +		=C2=A0 "column_width_minus1 %s\n"
> +		=C2=A0 "row_height_minus1 %s\n"
> +		=C2=A0 "pps_beta_offset_div2 %d\n"
> +		=C2=A0 "pps_tc_offset_div2 %d\n"
> +		=C2=A0 "log2_parallel_merge_level_minus2 %u\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __entry->p.pic_parameter_set_id,
> +		=C2=A0 __entry->p.num_extra_slice_header_bits,
> +		=C2=A0 __entry->p.num_ref_idx_l0_default_active_minus1,
> +		=C2=A0 __entry->p.num_ref_idx_l1_default_active_minus1,
> +		=C2=A0 __entry->p.init_qp_minus26,
> +		=C2=A0 __entry->p.diff_cu_qp_delta_depth,
> +		=C2=A0 __entry->p.pps_cb_qp_offset,
> +		=C2=A0 __entry->p.pps_cr_qp_offset,
> +		=C2=A0 __entry->p.num_tile_columns_minus1,
> +		=C2=A0 __entry->p.num_tile_rows_minus1,
> +		=C2=A0 __print_array(__entry->p.column_width_minus1,
> +				ARRAY_SIZE(__entry->p.column_width_minus1),
> +				sizeof(__entry->p.column_width_minus1[0])),
> +		=C2=A0 __print_array(__entry->p.row_height_minus1,
> +				ARRAY_SIZE(__entry->p.row_height_minus1),
> +				sizeof(__entry->p.row_height_minus1[0])),
> +		=C2=A0 __entry->p.pps_beta_offset_div2,
> +		=C2=A0 __entry->p.pps_tc_offset_div2,
> +		=C2=A0 __entry->p.log2_parallel_merge_level_minus2,
> +		=C2=A0 __print_flags(__entry->p.flags, "|",
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED, "DEPENDENT=
_SLICE_SEGMENT_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT, "OUTPUT_FLAG_PRESENT"}=
,
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED, "SIGN_DATA_HIDING=
_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT, "CABAC_INIT_PRESENT"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED, "CONSTRAINED_INTRA_=
PRED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED, "CU_QP_DELTA_ENABLED"}=
,
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT, "PPS_S=
LICE_CHROMA_QP_OFFSETS_PRESENT"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED, "WEIGHTED_PRED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED, "WEIGHTED_BIPRED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED, "TRANSQUANT_BYPA=
SS_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_TILES_ENABLED, "TILES_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED, "ENTROPY_CODIN=
G_SYNC_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED, "LOOP_FIL=
TER_ACROSS_TILES_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED, "PPS=
_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED, "DEBLOC=
KING_FILTER_OVERRIDE_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER, "DISABLE_DEB=
LOCKING_FILTER"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT, "LISTS_MODIFICA=
TION_PRESENT"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT, "SL=
ICE_SEGMENT_HEADER_EXTENSION_PRESENT"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "DEBLOCK=
ING_FILTER_CONTROL_PRESENT"},
> +		=C2=A0 {V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING, "UNIFORM_SPACING"}
> +	))
> +
> +);
> +
> +
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_slice_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_slice_params, s))=
,
> +	TP_fast_assign(__entry->s =3D *s),
> +	TP_printk("\nbit_size %u\n"
> +		=C2=A0 "data_byte_offset %u\n"
> +		=C2=A0 "num_entry_point_offsets %u\n"
> +		=C2=A0 "nal_unit_type %u\n"
> +		=C2=A0 "nuh_temporal_id_plus1 %u\n"
> +		=C2=A0 "slice_type %u\n"
> +		=C2=A0 "colour_plane_id %u\n"
> +		=C2=A0 "slice_pic_order_cnt %d\n"
> +		=C2=A0 "num_ref_idx_l0_active_minus1 %u\n"
> +		=C2=A0 "num_ref_idx_l1_active_minus1 %u\n"
> +		=C2=A0 "collocated_ref_idx %u\n"
> +		=C2=A0 "five_minus_max_num_merge_cand %u\n"
> +		=C2=A0 "slice_qp_delta %d\n"
> +		=C2=A0 "slice_cb_qp_offset %d\n"
> +		=C2=A0 "slice_cr_qp_offset %d\n"
> +		=C2=A0 "slice_act_y_qp_offset %d\n"
> +		=C2=A0 "slice_act_cb_qp_offset %d\n"
> +		=C2=A0 "slice_act_cr_qp_offset %d\n"
> +		=C2=A0 "slice_beta_offset_div2 %d\n"
> +		=C2=A0 "slice_tc_offset_div2 %d\n"
> +		=C2=A0 "pic_struct %u\n"
> +		=C2=A0 "slice_segment_addr %u\n"
> +		=C2=A0 "ref_idx_l0 %s\n"
> +		=C2=A0 "ref_idx_l1 %s\n"
> +		=C2=A0 "short_term_ref_pic_set_size %u\n"
> +		=C2=A0 "long_term_ref_pic_set_size %u\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __entry->s.bit_size,
> +		=C2=A0 __entry->s.data_byte_offset,
> +		=C2=A0 __entry->s.num_entry_point_offsets,
> +		=C2=A0 __entry->s.nal_unit_type,
> +		=C2=A0 __entry->s.nuh_temporal_id_plus1,
> +		=C2=A0 __entry->s.slice_type,
> +		=C2=A0 __entry->s.colour_plane_id,
> +		=C2=A0 __entry->s.slice_pic_order_cnt,
> +		=C2=A0 __entry->s.num_ref_idx_l0_active_minus1,
> +		=C2=A0 __entry->s.num_ref_idx_l1_active_minus1,
> +		=C2=A0 __entry->s.collocated_ref_idx,
> +		=C2=A0 __entry->s.five_minus_max_num_merge_cand,
> +		=C2=A0 __entry->s.slice_qp_delta,
> +		=C2=A0 __entry->s.slice_cb_qp_offset,
> +		=C2=A0 __entry->s.slice_cr_qp_offset,
> +		=C2=A0 __entry->s.slice_act_y_qp_offset,
> +		=C2=A0 __entry->s.slice_act_cb_qp_offset,
> +		=C2=A0 __entry->s.slice_act_cr_qp_offset,
> +		=C2=A0 __entry->s.slice_beta_offset_div2,
> +		=C2=A0 __entry->s.slice_tc_offset_div2,
> +		=C2=A0 __entry->s.pic_struct,
> +		=C2=A0 __entry->s.slice_segment_addr,
> +		=C2=A0 __print_array(__entry->s.ref_idx_l0,
> +				ARRAY_SIZE(__entry->s.ref_idx_l0),
> +				sizeof(__entry->s.ref_idx_l0[0])),
> +		=C2=A0 __print_array(__entry->s.ref_idx_l1,
> +				ARRAY_SIZE(__entry->s.ref_idx_l1),
> +				sizeof(__entry->s.ref_idx_l1[0])),
> +		=C2=A0 __entry->s.short_term_ref_pic_set_size,
> +		=C2=A0 __entry->s.long_term_ref_pic_set_size,
> +		=C2=A0 __print_flags(__entry->s.flags, "|",
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA, "SLICE_SAO_LUMA"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA, "SLICE_SAO_CHROM=
A"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED, "SLICE=
_TEMPORAL_MVP_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO, "MVD_L1_ZERO"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT, "CABAC_INIT"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0, "COLLOCATED_FR=
OM_L0"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV, "USE_INTEGER_MV"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED, =
"SLICE_DEBLOCKING_FILTER_DISABLED"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_EN=
ABLED, "SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED"},
> +		=C2=A0 {V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT, "DEPENDEN=
T_SLICE_SEGMENT"}
> +
> +	))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_hevc_pred_weight_table_tmpl,
> +	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_pred_weight_table, p))=
,
> +	TP_fast_assign(__entry->p =3D *p),
> +	TP_printk("\ndelta_luma_weight_l0 %s\n"
> +		=C2=A0 "luma_offset_l0 %s\n"
> +		=C2=A0 "delta_chroma_weight_l0 {%s}\n"
> +		=C2=A0 "chroma_offset_l0 {%s}\n"
> +		=C2=A0 "delta_luma_weight_l1 %s\n"
> +		=C2=A0 "luma_offset_l1 %s\n"
> +		=C2=A0 "delta_chroma_weight_l1 {%s}\n"
> +		=C2=A0 "chroma_offset_l1 {%s}\n"
> +		=C2=A0 "luma_log2_weight_denom %d\n"
> +		=C2=A0 "delta_chroma_log2_weight_denom %d\n",
> +		=C2=A0 __print_array(__entry->p.delta_luma_weight_l0,
> +				ARRAY_SIZE(__entry->p.delta_luma_weight_l0),
> +				sizeof(__entry->p.delta_luma_weight_l0[0])),
> +		=C2=A0 __print_array(__entry->p.luma_offset_l0,
> +				ARRAY_SIZE(__entry->p.luma_offset_l0),
> +				sizeof(__entry->p.luma_offset_l0[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.delta_chroma_weight_l0,
> +				=C2=A0=C2=A0 sizeof(__entry->p.delta_chroma_weight_l0),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.chroma_offset_l0,
> +				=C2=A0=C2=A0 sizeof(__entry->p.chroma_offset_l0),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->p.delta_luma_weight_l1,
> +				ARRAY_SIZE(__entry->p.delta_luma_weight_l1),
> +				sizeof(__entry->p.delta_luma_weight_l1[0])),
> +		=C2=A0 __print_array(__entry->p.luma_offset_l1,
> +				ARRAY_SIZE(__entry->p.luma_offset_l1),
> +				sizeof(__entry->p.luma_offset_l1[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.delta_chroma_weight_l1,
> +				=C2=A0=C2=A0 sizeof(__entry->p.delta_chroma_weight_l1),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.chroma_offset_l1,
> +				=C2=A0=C2=A0 sizeof(__entry->p.chroma_offset_l1),
> +				=C2=A0=C2=A0 false),
> +		__entry->p.luma_log2_weight_denom,
> +		__entry->p.delta_chroma_log2_weight_denom
> +
> +	))
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_scaling_matrix_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_scaling_matrix, s=
)),
> +	TP_fast_assign(__entry->s =3D *s),
> +	TP_printk("\nscaling_list_4x4 {%s}\n"
> +		=C2=A0 "scaling_list_8x8 {%s}\n"
> +		=C2=A0 "scaling_list_16x16 {%s}\n"
> +		=C2=A0 "scaling_list_32x32 {%s}\n"
> +		=C2=A0 "scaling_list_dc_coef_16x16 %s\n"
> +		=C2=A0 "scaling_list_dc_coef_32x32 %s\n",
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->s.scaling_list_4x4,
> +				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_4x4),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->s.scaling_list_8x8,
> +				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_8x8),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->s.scaling_list_16x16,
> +				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_16x16),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->s.scaling_list_32x32,
> +				=C2=A0=C2=A0 sizeof(__entry->s.scaling_list_32x32),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->s.scaling_list_dc_coef_16x16,
> +				ARRAY_SIZE(__entry->s.scaling_list_dc_coef_16x16),
> +				sizeof(__entry->s.scaling_list_dc_coef_16x16[0])),
> +		=C2=A0 __print_array(__entry->s.scaling_list_dc_coef_32x32,
> +				ARRAY_SIZE(__entry->s.scaling_list_dc_coef_32x32),
> +				sizeof(__entry->s.scaling_list_dc_coef_32x32[0]))
> +	))
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_decode_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
> +	TP_ARGS(d),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_decode_params, d)=
),
> +	TP_fast_assign(__entry->d =3D *d),
> +	TP_printk("\npic_order_cnt_val %d\n"
> +		=C2=A0 "short_term_ref_pic_set_size %u\n"
> +		=C2=A0 "long_term_ref_pic_set_size %u\n"
> +		=C2=A0 "num_active_dpb_entries %u\n"
> +		=C2=A0 "num_poc_st_curr_before %u\n"
> +		=C2=A0 "num_poc_st_curr_after %u\n"
> +		=C2=A0 "num_poc_lt_curr %u\n"
> +		=C2=A0 "poc_st_curr_before %s\n"
> +		=C2=A0 "poc_st_curr_after %s\n"
> +		=C2=A0 "poc_lt_curr %s\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __entry->d.pic_order_cnt_val,
> +		=C2=A0 __entry->d.short_term_ref_pic_set_size,
> +		=C2=A0 __entry->d.long_term_ref_pic_set_size,
> +		=C2=A0 __entry->d.num_active_dpb_entries,
> +		=C2=A0 __entry->d.num_poc_st_curr_before,
> +		=C2=A0 __entry->d.num_poc_st_curr_after,
> +		=C2=A0 __entry->d.num_poc_lt_curr,
> +		=C2=A0 __print_array(__entry->d.poc_st_curr_before,
> +				ARRAY_SIZE(__entry->d.poc_st_curr_before),
> +				sizeof(__entry->d.poc_st_curr_before[0])),
> +		=C2=A0 __print_array(__entry->d.poc_st_curr_after,
> +				ARRAY_SIZE(__entry->d.poc_st_curr_after),
> +				sizeof(__entry->d.poc_st_curr_after[0])),
> +		=C2=A0 __print_array(__entry->d.poc_lt_curr,
> +				ARRAY_SIZE(__entry->d.poc_lt_curr),
> +				sizeof(__entry->d.poc_lt_curr[0])),
> +		=C2=A0 __print_flags(__entry->d.flags, "|",
> +		=C2=A0 {V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC, "IRAP_PIC"},
> +		=C2=A0 {V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC, "IDR_PIC"},
> +		=C2=A0 {V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR, "NO_OUTPUT_OF_=
PRIOR"}
> +	))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> +	TP_ARGS(lt),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_lt_rps, l=
t)),
> +	TP_fast_assign(__entry->lt =3D *lt),
> +	TP_printk("\nflags %s\n"
> +		=C2=A0 "lt_ref_pic_poc_lsb_sps %x\n",
> +		=C2=A0 __print_flags(__entry->lt.flags, "|",
> +		=C2=A0 {V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT, "USED_LT"}
> +		=C2=A0 ),
> +		=C2=A0 __entry->lt.lt_ref_pic_poc_lsb_sps
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> +	TP_ARGS(st),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_hevc_ext_sps_st_rps, s=
t)),
> +	TP_fast_assign(__entry->st =3D *st),
> +	TP_printk("\nflags %s\n"
> +		=C2=A0 "delta_idx_minus1: %u\n"
> +		=C2=A0 "delta_rps_sign: %u\n"
> +		=C2=A0 "abs_delta_rps_minus1: %u\n"
> +		=C2=A0 "num_negative_pics: %u\n"
> +		=C2=A0 "num_positive_pics: %u\n"
> +		=C2=A0 "used_by_curr_pic: %08x\n"
> +		=C2=A0 "use_delta_flag: %08x\n"
> +		=C2=A0 "delta_poc_s0_minus1: %s\n"
> +		=C2=A0 "delta_poc_s1_minus1: %s\n",
> +		=C2=A0 __print_flags(__entry->st.flags, "|",
> +		=C2=A0 {V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED, "INTER_R=
EF_PIC_SET_PRED"}
> +		=C2=A0 ),
> +		=C2=A0 __entry->st.delta_idx_minus1,
> +		=C2=A0 __entry->st.delta_rps_sign,
> +		=C2=A0 __entry->st.abs_delta_rps_minus1,
> +		=C2=A0 __entry->st.num_negative_pics,
> +		=C2=A0 __entry->st.num_positive_pics,
> +		=C2=A0 __entry->st.used_by_curr_pic,
> +		=C2=A0 __entry->st.use_delta_flag,
> +		=C2=A0 __print_array(__entry->st.delta_poc_s0_minus1,
> +				ARRAY_SIZE(__entry->st.delta_poc_s0_minus1),
> +				sizeof(__entry->st.delta_poc_s0_minus1[0])),
> +		=C2=A0 __print_array(__entry->st.delta_poc_s1_minus1,
> +				ARRAY_SIZE(__entry->st.delta_poc_s1_minus1),
> +				sizeof(__entry->st.delta_poc_s1_minus1[0]))
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_hevc_dpb_entry_tmpl,
> +	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> +	TP_ARGS(e),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_hevc_dpb_entry, e)),
> +	TP_fast_assign(__entry->e =3D *e),
> +	TP_printk("\ntimestamp %llu\n"
> +		=C2=A0 "flags %s\n"
> +		=C2=A0 "field_pic %u\n"
> +		=C2=A0 "pic_order_cnt_val %d\n",
> +		__entry->e.timestamp,
> +		__print_flags(__entry->e.flags, "|",
> +		{V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE, "LONG_TERM_REFERENCE"}
> +		=C2=A0 ),
> +		__entry->e.field_pic,
> +		__entry->e.pic_order_cnt_val
> +	))
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_sps_tmpl, v4l2_ctrl_hevc_sps,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_sps *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_pps_tmpl, v4l2_ctrl_hevc_pps,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_pps *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_slice_params_tmpl, v4l2_ctrl_hevc_slice_para=
ms,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_slice_params *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_hevc_pred_weight_table_tmpl, v4l2_hevc_pred_weight_tab=
le,
> +	TP_PROTO(const struct v4l2_hevc_pred_weight_table *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_scaling_matrix_tmpl, v4l2_ctrl_hevc_scaling_=
matrix,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_scaling_matrix *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_decode_params_tmpl, v4l2_ctrl_hevc_decode_pa=
rams,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_decode_params *d),
> +	TP_ARGS(d)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_lt_rps_tmpl, v4l2_ctrl_hevc_ext_sps_=
lt_rps,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_lt_rps *lt),
> +	TP_ARGS(lt)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_hevc_ext_sps_st_rps_tmpl, v4l2_ctrl_hevc_ext_sps_=
st_rps,
> +	TP_PROTO(const struct v4l2_ctrl_hevc_ext_sps_st_rps *st),
> +	TP_ARGS(st)
> +);
> +
> +DEFINE_EVENT(v4l2_hevc_dpb_entry_tmpl, v4l2_hevc_dpb_entry,
> +	TP_PROTO(const struct v4l2_hevc_dpb_entry *e),
> +	TP_ARGS(e)
> +);
> +
> +/* MPEG2 controls */
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
> +	TP_fast_assign(__entry->s =3D *s;),
> +	TP_printk("\nhorizontal_size %u\nvertical_size %u\nvbv_buffer_size %u\n=
"
> +		=C2=A0 "profile_and_level_indication %u\nchroma_format %u\nflags %s\n"=
,
> +		=C2=A0 __entry->s.horizontal_size,
> +		=C2=A0 __entry->s.vertical_size,
> +		=C2=A0 __entry->s.vbv_buffer_size,
> +		=C2=A0 __entry->s.profile_and_level_indication,
> +		=C2=A0 __entry->s.chroma_format,
> +		=C2=A0 __print_flags(__entry->s.flags, "|",
> +		=C2=A0 {V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE, "PROGRESSIVE"})
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
> +	TP_fast_assign(__entry->p =3D *p;),
> +	TP_printk("\nbackward_ref_ts %llu\nforward_ref_ts %llu\nflags %s\nf_cod=
e {%s}\n"
> +		=C2=A0 "picture_coding_type: %u\npicture_structure %u\nintra_dc_precis=
ion %u\n",
> +		=C2=A0 __entry->p.backward_ref_ts,
> +		=C2=A0 __entry->p.forward_ref_ts,
> +		=C2=A0 __print_flags(__entry->p.flags, "|",
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST, "TOP_FIELD_FIRST"},
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT, "FRAME_PRED_DCT"},
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV, "CONCEALMENT_MV"},
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE, "Q_SCALE_TYPE"},
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_INTRA_VLC, "INTA_VLC"},
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_ALT_SCAN, "ALT_SCAN"},
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST, "REPEAT_FIRST"},
> +		=C2=A0 {V4L2_MPEG2_PIC_FLAG_PROGRESSIVE, "PROGRESSIVE"}),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.f_code,
> +				=C2=A0=C2=A0 sizeof(__entry->p.f_code),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __entry->p.picture_coding_type,
> +		=C2=A0 __entry->p.picture_structure,
> +		=C2=A0 __entry->p.intra_dc_precision
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> +	TP_ARGS(q),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)=
),
> +	TP_fast_assign(__entry->q =3D *q;),
> +	TP_printk("\nintra_quantiser_matrix %s\nnon_intra_quantiser_matrix %s\n=
"
> +		=C2=A0 "chroma_intra_quantiser_matrix %s\nchroma_non_intra_quantiser_m=
atrix %s\n",
> +		=C2=A0 __print_array(__entry->q.intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.intra_quantiser_matrix),
> +				sizeof(__entry->q.intra_quantiser_matrix[0])),
> +		=C2=A0 __print_array(__entry->q.non_intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.non_intra_quantiser_matrix),
> +				sizeof(__entry->q.non_intra_quantiser_matrix[0])),
> +		=C2=A0 __print_array(__entry->q.chroma_intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.chroma_intra_quantiser_matrix),
> +				sizeof(__entry->q.chroma_intra_quantiser_matrix[0])),
> +		=C2=A0 __print_array(__entry->q.chroma_non_intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.chroma_non_intra_quantiser_matrix),
> +				sizeof(__entry->q.chroma_non_intra_quantiser_matrix[0]))
> +		=C2=A0 )
> +)
> +
> +DEFINE_EVENT(v4l2_ctrl_mpeg2_seq_tmpl, v4l2_ctrl_mpeg2_sequence,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_mpeg2_pic_tmpl, v4l2_ctrl_mpeg2_picture,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_mpeg2_quant_tmpl, v4l2_ctrl_mpeg2_quantisation,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> +	TP_ARGS(q)
> +);
> +
> +/* VP8 controls */
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> +	TP_fast_assign(__entry->f =3D *f;),
> +	TP_printk("\nentropy.coeff_probs {%s}\n"
> +		=C2=A0 "entropy.y_mode_probs %s\n"
> +		=C2=A0 "entropy.uv_mode_probs %s\n"
> +		=C2=A0 "entropy.mv_probs {%s}",
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->f.entropy.coeff_probs,
> +				=C2=A0=C2=A0 sizeof(__entry->f.entropy.coeff_probs),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->f.entropy.y_mode_probs,
> +				ARRAY_SIZE(__entry->f.entropy.y_mode_probs),
> +				sizeof(__entry->f.entropy.y_mode_probs[0])),
> +		=C2=A0 __print_array(__entry->f.entropy.uv_mode_probs,
> +				ARRAY_SIZE(__entry->f.entropy.uv_mode_probs),
> +				sizeof(__entry->f.entropy.uv_mode_probs[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->f.entropy.mv_probs,
> +				=C2=A0=C2=A0 sizeof(__entry->f.entropy.mv_probs),
> +				=C2=A0=C2=A0 false)
> +		=C2=A0 )
> +)
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> +	TP_fast_assign(__entry->f =3D *f;),
> +	TP_printk("\nsegment.quant_update %s\n"
> +		=C2=A0 "segment.lf_update %s\n"
> +		=C2=A0 "segment.segment_probs %s\n"
> +		=C2=A0 "segment.flags %s\n"
> +		=C2=A0 "lf.ref_frm_delta %s\n"
> +		=C2=A0 "lf.mb_mode_delta %s\n"
> +		=C2=A0 "lf.sharpness_level %u\n"
> +		=C2=A0 "lf.level %u\n"
> +		=C2=A0 "lf.flags %s\n"
> +		=C2=A0 "quant.y_ac_qi %u\n"
> +		=C2=A0 "quant.y_dc_delta %d\n"
> +		=C2=A0 "quant.y2_dc_delta %d\n"
> +		=C2=A0 "quant.y2_ac_delta %d\n"
> +		=C2=A0 "quant.uv_dc_delta %d\n"
> +		=C2=A0 "quant.uv_ac_delta %d\n"
> +		=C2=A0 "coder_state.range %u\n"
> +		=C2=A0 "coder_state.value %u\n"
> +		=C2=A0 "coder_state.bit_count %u\n"
> +		=C2=A0 "width %u\n"
> +		=C2=A0 "height %u\n"
> +		=C2=A0 "horizontal_scale %u\n"
> +		=C2=A0 "vertical_scale %u\n"
> +		=C2=A0 "version %u\n"
> +		=C2=A0 "prob_skip_false %u\n"
> +		=C2=A0 "prob_intra %u\n"
> +		=C2=A0 "prob_last %u\n"
> +		=C2=A0 "prob_gf %u\n"
> +		=C2=A0 "num_dct_parts %u\n"
> +		=C2=A0 "first_part_size %u\n"
> +		=C2=A0 "first_part_header_bits %u\n"
> +		=C2=A0 "dct_part_sizes %s\n"
> +		=C2=A0 "last_frame_ts %llu\n"
> +		=C2=A0 "golden_frame_ts %llu\n"
> +		=C2=A0 "alt_frame_ts %llu\n"
> +		=C2=A0 "flags %s",
> +		=C2=A0 __print_array(__entry->f.segment.quant_update,
> +				ARRAY_SIZE(__entry->f.segment.quant_update),
> +				sizeof(__entry->f.segment.quant_update[0])),
> +		=C2=A0 __print_array(__entry->f.segment.lf_update,
> +				ARRAY_SIZE(__entry->f.segment.lf_update),
> +				sizeof(__entry->f.segment.lf_update[0])),
> +		=C2=A0 __print_array(__entry->f.segment.segment_probs,
> +				ARRAY_SIZE(__entry->f.segment.segment_probs),
> +				sizeof(__entry->f.segment.segment_probs[0])),
> +		=C2=A0 __print_flags(__entry->f.segment.flags, "|",
> +		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_ENABLED, "SEGMENT_ENABLED"},
> +		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP, "SEGMENT_UPDATE_MAP"},
> +		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA, "SEGMENT_UPDATE_FEA=
TURE_DATA"},
> +		=C2=A0 {V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE, "SEGMENT_DELTA_VALUE_M=
ODE"}),
> +		=C2=A0 __print_array(__entry->f.lf.ref_frm_delta,
> +				ARRAY_SIZE(__entry->f.lf.ref_frm_delta),
> +				sizeof(__entry->f.lf.ref_frm_delta[0])),
> +		=C2=A0 __print_array(__entry->f.lf.mb_mode_delta,
> +				ARRAY_SIZE(__entry->f.lf.mb_mode_delta),
> +				sizeof(__entry->f.lf.mb_mode_delta[0])),
> +		=C2=A0 __entry->f.lf.sharpness_level,
> +		=C2=A0 __entry->f.lf.level,
> +		=C2=A0 __print_flags(__entry->f.lf.flags, "|",
> +		=C2=A0 {V4L2_VP8_LF_ADJ_ENABLE, "LF_ADJ_ENABLED"},
> +		=C2=A0 {V4L2_VP8_LF_DELTA_UPDATE, "LF_DELTA_UPDATE"},
> +		=C2=A0 {V4L2_VP8_LF_FILTER_TYPE_SIMPLE, "LF_FILTER_TYPE_SIMPLE"}),
> +		=C2=A0 __entry->f.quant.y_ac_qi,
> +		=C2=A0 __entry->f.quant.y_dc_delta,
> +		=C2=A0 __entry->f.quant.y2_dc_delta,
> +		=C2=A0 __entry->f.quant.y2_ac_delta,
> +		=C2=A0 __entry->f.quant.uv_dc_delta,
> +		=C2=A0 __entry->f.quant.uv_ac_delta,
> +		=C2=A0 __entry->f.coder_state.range,
> +		=C2=A0 __entry->f.coder_state.value,
> +		=C2=A0 __entry->f.coder_state.bit_count,
> +		=C2=A0 __entry->f.width,
> +		=C2=A0 __entry->f.height,
> +		=C2=A0 __entry->f.horizontal_scale,
> +		=C2=A0 __entry->f.vertical_scale,
> +		=C2=A0 __entry->f.version,
> +		=C2=A0 __entry->f.prob_skip_false,
> +		=C2=A0 __entry->f.prob_intra,
> +		=C2=A0 __entry->f.prob_last,
> +		=C2=A0 __entry->f.prob_gf,
> +		=C2=A0 __entry->f.num_dct_parts,
> +		=C2=A0 __entry->f.first_part_size,
> +		=C2=A0 __entry->f.first_part_header_bits,
> +		=C2=A0 __print_array(__entry->f.dct_part_sizes,
> +				ARRAY_SIZE(__entry->f.dct_part_sizes),
> +				sizeof(__entry->f.dct_part_sizes[0])),
> +		=C2=A0 __entry->f.last_frame_ts,
> +		=C2=A0 __entry->f.golden_frame_ts,
> +		=C2=A0 __entry->f.alt_frame_ts,
> +		=C2=A0 __print_flags(__entry->f.flags, "|",
> +		=C2=A0 {V4L2_VP8_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
> +		=C2=A0 {V4L2_VP8_FRAME_FLAG_EXPERIMENTAL, "EXPERIMENTAL"},
> +		=C2=A0 {V4L2_VP8_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> +		=C2=A0 {V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF, "MB_NO_SKIP_COEFF"},
> +		=C2=A0 {V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN, "SIGN_BIAS_GOLDEN"},
> +		=C2=A0 {V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT, "SIGN_BIAS_ALT"})
> +		=C2=A0 )
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp8_frame_tmpl, v4l2_ctrl_vp8_frame,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp8_entropy_tmpl, v4l2_ctrl_vp8_entropy,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f)
> +);
> +
> +/* VP9 controls */
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
> +	TP_fast_assign(__entry->f =3D *f;),
> +	TP_printk("\nlf.ref_deltas %s\n"
> +		=C2=A0 "lf.mode_deltas %s\n"
> +		=C2=A0 "lf.level %u\n"
> +		=C2=A0 "lf.sharpness %u\n"
> +		=C2=A0 "lf.flags %s\n"
> +		=C2=A0 "quant.base_q_idx %u\n"
> +		=C2=A0 "quant.delta_q_y_dc %d\n"
> +		=C2=A0 "quant.delta_q_uv_dc %d\n"
> +		=C2=A0 "quant.delta_q_uv_ac %d\n"
> +		=C2=A0 "seg.feature_data {%s}\n"
> +		=C2=A0 "seg.feature_enabled %s\n"
> +		=C2=A0 "seg.tree_probs %s\n"
> +		=C2=A0 "seg.pred_probs %s\n"
> +		=C2=A0 "seg.flags %s\n"
> +		=C2=A0 "flags %s\n"
> +		=C2=A0 "compressed_header_size %u\n"
> +		=C2=A0 "uncompressed_header_size %u\n"
> +		=C2=A0 "frame_width_minus_1 %u\n"
> +		=C2=A0 "frame_height_minus_1 %u\n"
> +		=C2=A0 "render_width_minus_1 %u\n"
> +		=C2=A0 "render_height_minus_1 %u\n"
> +		=C2=A0 "last_frame_ts %llu\n"
> +		=C2=A0 "golden_frame_ts %llu\n"
> +		=C2=A0 "alt_frame_ts %llu\n"
> +		=C2=A0 "ref_frame_sign_bias %s\n"
> +		=C2=A0 "reset_frame_context %s\n"
> +		=C2=A0 "frame_context_idx %u\n"
> +		=C2=A0 "profile %u\n"
> +		=C2=A0 "bit_depth %u\n"
> +		=C2=A0 "interpolation_filter %s\n"
> +		=C2=A0 "tile_cols_log2 %u\n"
> +		=C2=A0 "tile_rows_log_2 %u\n"
> +		=C2=A0 "reference_mode %s\n",
> +		=C2=A0 __print_array(__entry->f.lf.ref_deltas,
> +				ARRAY_SIZE(__entry->f.lf.ref_deltas),
> +				sizeof(__entry->f.lf.ref_deltas[0])),
> +		=C2=A0 __print_array(__entry->f.lf.mode_deltas,
> +				ARRAY_SIZE(__entry->f.lf.mode_deltas),
> +				sizeof(__entry->f.lf.mode_deltas[0])),
> +		=C2=A0 __entry->f.lf.level,
> +		=C2=A0 __entry->f.lf.sharpness,
> +		=C2=A0 __print_flags(__entry->f.lf.flags, "|",
> +		=C2=A0 {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED, "DELTA_ENABLED"},
> +		=C2=A0 {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE, "DELTA_UPDATE"}),
> +		=C2=A0 __entry->f.quant.base_q_idx,
> +		=C2=A0 __entry->f.quant.delta_q_y_dc,
> +		=C2=A0 __entry->f.quant.delta_q_uv_dc,
> +		=C2=A0 __entry->f.quant.delta_q_uv_ac,
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->f.seg.feature_data,
> +				=C2=A0=C2=A0 sizeof(__entry->f.seg.feature_data),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->f.seg.feature_enabled,
> +				ARRAY_SIZE(__entry->f.seg.feature_enabled),
> +				sizeof(__entry->f.seg.feature_enabled[0])),
> +		=C2=A0 __print_array(__entry->f.seg.tree_probs,
> +				ARRAY_SIZE(__entry->f.seg.tree_probs),
> +				sizeof(__entry->f.seg.tree_probs[0])),
> +		=C2=A0 __print_array(__entry->f.seg.pred_probs,
> +				ARRAY_SIZE(__entry->f.seg.pred_probs),
> +				sizeof(__entry->f.seg.pred_probs[0])),
> +		=C2=A0 __print_flags(__entry->f.seg.flags, "|",
> +		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_ENABLED, "ENABLED"},
> +		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP, "UPDATE_MAP"},
> +		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE, "TEMPORAL_UPDATE"}=
,
> +		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA, "UPDATE_DATA"},
> +		=C2=A0 {V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE, "ABS_OR_DELTA_=
UPDATE"}),
> +		=C2=A0 __print_flags(__entry->f.flags, "|",
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT, "ERROR_RESILIENT"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_INTRA_ONLY, "INTRA_ONLY"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV, "ALLOW_HIGH_PREC_MV"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX, "REFRESH_FRAME_CTX"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE, "PARALLEL_DEC_MODE"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING, "X_SUBSAMPLING"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING, "Y_SUBSAMPLING"},
> +		=C2=A0 {V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING, "COLOR_RANGE_FULL_=
SWING"}),
> +		=C2=A0 __entry->f.compressed_header_size,
> +		=C2=A0 __entry->f.uncompressed_header_size,
> +		=C2=A0 __entry->f.frame_width_minus_1,
> +		=C2=A0 __entry->f.frame_height_minus_1,
> +		=C2=A0 __entry->f.render_width_minus_1,
> +		=C2=A0 __entry->f.render_height_minus_1,
> +		=C2=A0 __entry->f.last_frame_ts,
> +		=C2=A0 __entry->f.golden_frame_ts,
> +		=C2=A0 __entry->f.alt_frame_ts,
> +		=C2=A0 __print_symbolic(__entry->f.ref_frame_sign_bias,
> +		=C2=A0 {V4L2_VP9_SIGN_BIAS_LAST, "SIGN_BIAS_LAST"},
> +		=C2=A0 {V4L2_VP9_SIGN_BIAS_GOLDEN, "SIGN_BIAS_GOLDEN"},
> +		=C2=A0 {V4L2_VP9_SIGN_BIAS_ALT, "SIGN_BIAS_ALT"}),
> +		=C2=A0 __print_symbolic(__entry->f.reset_frame_context,
> +		=C2=A0 {V4L2_VP9_RESET_FRAME_CTX_NONE, "RESET_FRAME_CTX_NONE"},
> +		=C2=A0 {V4L2_VP9_RESET_FRAME_CTX_SPEC, "RESET_FRAME_CTX_SPEC"},
> +		=C2=A0 {V4L2_VP9_RESET_FRAME_CTX_ALL, "RESET_FRAME_CTX_ALL"}),
> +		=C2=A0 __entry->f.frame_context_idx,
> +		=C2=A0 __entry->f.profile,
> +		=C2=A0 __entry->f.bit_depth,
> +		=C2=A0 __print_symbolic(__entry->f.interpolation_filter,
> +		=C2=A0 {V4L2_VP9_INTERP_FILTER_EIGHTTAP, "INTERP_FILTER_EIGHTTAP"},
> +		=C2=A0 {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH, "INTERP_FILTER_EIGHTTA=
P_SMOOTH"},
> +		=C2=A0 {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP, "INTERP_FILTER_EIGHTTAP=
_SHARP"},
> +		=C2=A0 {V4L2_VP9_INTERP_FILTER_BILINEAR, "INTERP_FILTER_BILINEAR"},
> +		=C2=A0 {V4L2_VP9_INTERP_FILTER_SWITCHABLE, "INTERP_FILTER_SWITCHABLE"}=
),
> +		=C2=A0 __entry->f.tile_cols_log2,
> +		=C2=A0 __entry->f.tile_rows_log2,
> +		=C2=A0 __print_symbolic(__entry->f.reference_mode,
> +		=C2=A0 {V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE, "REFERENCE_MODE_SING=
LE_REFERENCE"},
> +		=C2=A0 {V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE, "REFERENCE_MODE_CO=
MPOUND_REFERENCE"},
> +		=C2=A0 {V4L2_VP9_REFERENCE_MODE_SELECT, "REFERENCE_MODE_SELECT"}))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)=
),
> +	TP_fast_assign(__entry->h =3D *h;),
> +	TP_printk("\ntx_mode %s\n"
> +		=C2=A0 "tx8 {%s}\n"
> +		=C2=A0 "tx16 {%s}\n"
> +		=C2=A0 "tx32 {%s}\n"
> +		=C2=A0 "skip %s\n"
> +		=C2=A0 "inter_mode {%s}\n"
> +		=C2=A0 "interp_filter {%s}\n"
> +		=C2=A0 "is_inter %s\n"
> +		=C2=A0 "comp_mode %s\n"
> +		=C2=A0 "single_ref {%s}\n"
> +		=C2=A0 "comp_ref %s\n"
> +		=C2=A0 "y_mode {%s}\n"
> +		=C2=A0 "uv_mode {%s}\n"
> +		=C2=A0 "partition {%s}\n",
> +		=C2=A0 __print_symbolic(__entry->h.tx_mode,
> +		=C2=A0 {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
> +		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
> +		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_16X16, "TX_MODE_ALLOW_16X16"},
> +		=C2=A0 {V4L2_VP9_TX_MODE_ALLOW_32X32, "TX_MODE_ALLOW_32X32"},
> +		=C2=A0 {V4L2_VP9_TX_MODE_SELECT, "TX_MODE_SELECT"}),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.tx8,
> +				=C2=A0=C2=A0 sizeof(__entry->h.tx8),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.tx16,
> +				=C2=A0=C2=A0 sizeof(__entry->h.tx16),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.tx32,
> +				=C2=A0=C2=A0 sizeof(__entry->h.tx32),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->h.skip,
> +				ARRAY_SIZE(__entry->h.skip),
> +				sizeof(__entry->h.skip[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.inter_mode,
> +				=C2=A0=C2=A0 sizeof(__entry->h.inter_mode),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.interp_filter,
> +				=C2=A0=C2=A0 sizeof(__entry->h.interp_filter),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->h.is_inter,
> +				ARRAY_SIZE(__entry->h.is_inter),
> +				sizeof(__entry->h.is_inter[0])),
> +		=C2=A0 __print_array(__entry->h.comp_mode,
> +				ARRAY_SIZE(__entry->h.comp_mode),
> +				sizeof(__entry->h.comp_mode[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.single_ref,
> +				=C2=A0=C2=A0 sizeof(__entry->h.single_ref),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->h.comp_ref,
> +				ARRAY_SIZE(__entry->h.comp_ref),
> +				sizeof(__entry->h.comp_ref[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.y_mode,
> +				=C2=A0=C2=A0 sizeof(__entry->h.y_mode),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.uv_mode,
> +				=C2=A0=C2=A0 sizeof(__entry->h.uv_mode),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.partition,
> +				=C2=A0=C2=A0 sizeof(__entry->h.partition),
> +				=C2=A0=C2=A0 false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)=
),
> +	TP_fast_assign(__entry->h =3D *h;),
> +	TP_printk("\n coef {%s}",
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->h.coef,
> +				=C2=A0=C2=A0 sizeof(__entry->h.coef),
> +				=C2=A0=C2=A0 false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
> +	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
> +	TP_fast_assign(__entry->p =3D *p;),
> +	TP_printk("\n joint %s\n"
> +		=C2=A0 "sign %s\n"
> +		=C2=A0 "classes {%s}\n"
> +		=C2=A0 "class0_bit %s\n"
> +		=C2=A0 "bits {%s}\n"
> +		=C2=A0 "class0_fr {%s}\n"
> +		=C2=A0 "fr {%s}\n"
> +		=C2=A0 "class0_hp %s\n"
> +		=C2=A0 "hp %s\n",
> +		=C2=A0 __print_array(__entry->p.joint,
> +				ARRAY_SIZE(__entry->p.joint),
> +				sizeof(__entry->p.joint[0])),
> +		=C2=A0 __print_array(__entry->p.sign,
> +				ARRAY_SIZE(__entry->p.sign),
> +				sizeof(__entry->p.sign[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.classes,
> +				=C2=A0=C2=A0 sizeof(__entry->p.classes),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->p.class0_bit,
> +				ARRAY_SIZE(__entry->p.class0_bit),
> +				sizeof(__entry->p.class0_bit[0])),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.bits,
> +				=C2=A0=C2=A0 sizeof(__entry->p.bits),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.class0_fr,
> +				=C2=A0=C2=A0 sizeof(__entry->p.class0_fr),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +				=C2=A0=C2=A0 __entry->p.fr,
> +				=C2=A0=C2=A0 sizeof(__entry->p.fr),
> +				=C2=A0=C2=A0 false),
> +		=C2=A0 __print_array(__entry->p.class0_hp,
> +				ARRAY_SIZE(__entry->p.class0_hp),
> +				sizeof(__entry->p.class0_hp[0])),
> +		=C2=A0 __print_array(__entry->p.hp,
> +				ARRAY_SIZE(__entry->p.hp),
> +				sizeof(__entry->p.hp[0]))
> +	)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp9_frame_tmpl, v4l2_ctrl_vp9_frame,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> +	TP_ARGS(f)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp9_compressed_hdr_tmpl, v4l2_ctrl_vp9_compressed=
_hdr,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp9_compressed_coef_tmpl, v4l2_ctrl_vp9_compresse=
d_coeff,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h)
> +);
> +
> +
> +DEFINE_EVENT(v4l2_vp9_mv_probs_tmpl, v4l2_vp9_mv_probs,
> +	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> +	TP_ARGS(p)
> +);
> +
> +#endif /* if !defined(_TRACE_V4L2_REQUESTS_H_) || defined(TRACE_HEADER_M=
ULTI_READ) */
> +
> +#include <trace/define_trace.h>

--=-89W3h8ZnTLeTuYe6dkj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEKGwAKCRDZQZRRKWBy
9MWTAP9bhEJeUZoESm4XvuhOGCvsIk8yKEwXlr43CDVGjxbuqQD7BmyHQEAQ7BMa
neNEVYWZyzbRpxHw2YDDgMa0+Ve6mwM=
=Mgwh
-----END PGP SIGNATURE-----

--=-89W3h8ZnTLeTuYe6dkj2--

