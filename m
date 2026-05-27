Return-Path: <linux-media+bounces-62921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDQZGNs3F2os9gcAu9opvQ
	(envelope-from <linux-media+bounces-62921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 20:28:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D565E9078
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 20:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30E14311775F
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 18:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FEB3E314A;
	Wed, 27 May 2026 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFT/JVWk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01643634C
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906254; cv=none; b=ACIz6IqDW6/XLOWIJ9+tohx/NmoN54uHPwg2DuG2uuNL/xfD4/bfTKb/H/YPfEkYWuGT5cFf6+RX92+EhoQ5aYPLcCn09aX9ooPVWBeUqw6rg7c/B/vmQTYlqxDRaD50qLG4FYtMpTNVxsXM+5DxuRRoyHc8fnl89XMopxPdT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906254; c=relaxed/simple;
	bh=qp9K/3cS0pG9zWKWFca2vEbmK1ssVJPII5yj/CIL3M0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MqMx/xMAL74IKaEHciOoKfEwiXdV4oGFYzu/X4uOV1+v/lwTP8H6Qu15u9PRuqxtutpkyYbDGBVvv14J7RSxm/TLuMKxVzY++URti80973C7fXl9pJISGPWYTZBQ5nMly73SyJ0j/x8wMkJidn0HGmkWQhrYLsDtcyJYOs9rqOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFT/JVWk; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-956948531a1so3231916241.2
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779906252; x=1780511052; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd6WPsmpHHxuMf/zvpz0H0wHHTn09zA0RhogIFQgbbc=;
        b=dFT/JVWkc0/zUesbUoMMOrl+VZAnDs62txncQXaoV1HkAoh0cbdCspcgnXS4Ob5APJ
         VUPEcQ0nsRP+rcAwT2IviVBoDbduspz4TTVC2o3TtA3GC30ZYSEcjCsTjP08vfzkP8Yu
         1cjNUr5fZeNE319FwZ0h2YItJfPIPsQcy+K/RxhgHfIPN+skJ2T++41LYlb8cbzn/LBf
         E4KSrQ7YmnF7CA4q6pXALrc8fPRCCQ8ye9rGGCJIf7H9aHLywNXdrcwb2HSwdPW/zB8Q
         3OoysZJUPufzFjuGvl5XVgEvlnRl0560Br/4s8cHTsSOdUB/tq+uIbKIUEzl7YWwVj5I
         +V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779906252; x=1780511052;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vd6WPsmpHHxuMf/zvpz0H0wHHTn09zA0RhogIFQgbbc=;
        b=W6D5+FLIeDakHAYtPNy9b7zWhUDqxsxN917qs6D7kBeOo9zDKIvCcsvAPqBH6VkkHd
         MoX+TLUXkwkZJkjtALJQT4DaAo/0pwWMDt6SOsvg52RGia90ZggLvQLwBIYz7PTtISzL
         y7+bziuktR/KDX6xAkTjVJpGSl9lg6585hFHIZ4iIF8wym7lRQfcORahQLQRhP7kzABt
         Jglr2As4r4/koOaAAArre8wODMJirGgrkg8fDHYoTt1e/pzelpnCVRZr6YsDAv5OEW/s
         FmdBXm1ToEahcSd0UxJn+itStyLb7wesOzdeQIDzyWDJpICCtvP/faCb9DAVyECYN4W+
         1Y1w==
X-Gm-Message-State: AOJu0YxfPHIbTeZvFgt74j+soOKWKZwf1sIdjADmbn7rTp8f/yTA42te
	y2tOZYAK2S7T/MrHAs5sOvazvOZdpLddNW+OgEPj9bI4OrzlNp8qRuTe
X-Gm-Gg: Acq92OFmoGEnqSXO7ei+8mGUEgwn5QDpJF61g8KpQmgw0tvDpmVZpTeALjtHGxsAXFY
	El7ImfQa5IpIogXi6cSE+e13kUIcx2V+85121Ndl304TLXtvJr/A5ID41qXosgdzSMu58xbXt46
	mH6XhxcPMcavD5hka2WoapdTEbhDdWpAl1KFlSwYSeZs7JLzPp2A2jUPY9Cbpj1j9+kGtjSZAWW
	S78hoTCJSjQNL138ldm93pp8hSk03L8grYCifHxyuH5cEYFOF9IsBkOCN03zUv+HHfiRc4ySbbW
	ZLubsdKCdcydAwqfUp01cv5ymxTRvdY1gGhuomELvv73OwHkEqOnUHdfQHpEbF1hckVcCC6Exjh
	D0E7+T8VJcTrTKgLFrMfHzG7a+zC+J233PNH8UlWk+bRVrGn7ulAGgW1I09zH/drx3SjsRSgMxH
	0ribOcF7oQqWdRW8CHD234kO6B844BQCJXK3EdIlqY8cE6PllOj6ntV8+r5ig=
X-Received: by 2002:a05:6102:358b:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-67c7c0768c0mr10873413137.15.1779906251765;
        Wed, 27 May 2026 11:24:11 -0700 (PDT)
Received: from smtpclient.apple ([2804:7f1:c241:beb:ac74:e239:72fd:21b5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fc9a0fd00sm18339581137.0.2026.05.27.11.24.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2026 11:24:11 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [patch 1/1] drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
From: Daniel Almeida <dwlsalmeida@gmail.com>
In-Reply-To: <20260526222709.608471F000E9@smtp.kernel.org>
Date: Wed, 27 May 2026 15:23:55 -0300
Cc: linux-media@vger.kernel.org,
 mchehab@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <14D4F3BF-744B-474B-947A-2CC52D9EA185@gmail.com>
References: <20260526222709.608471F000E9@smtp.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62921-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwlsalmeida@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: C8D565E9078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On 26 May 2026, at 19:27, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
> Date: Tue May 26 03:14:09 PM PDT 2026
>=20
> csky allmodconfig, gcc-15.2.0:
>=20
> drivers/media/v4l2-core/v4l2-vp9.c: In function =
'v4l2_vp9_adapt_noncoef_probs':
> drivers/media/v4l2-core/v4l2-vp9.c:1834:1: error: the frame size of =
1436 bytes is larger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
>=20
> The amount of inlining in there is simply nuts.  This patch =
semi-randomly
> uninlines various things and fixes the above.
>=20
> Ad the .text size reduction is tremendous:
>=20
> ts:/usr/src/25> size drivers/media/v4l2-core/v4l2-vp9.o
>   text   data    bss    dec    hex filename
>  22450     36      0  22486   57d6 =
drivers/media/v4l2-core/v4l2-vp9.o-before
>  16144     36      0  16180   3f34 =
drivers/media/v4l2-core/v4l2-vp9.o-after
>=20
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>=20
> drivers/media/v4l2-core/v4l2-vp9.c |   30 +++++++++++++--------------
> 1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> --- =
a/drivers/media/v4l2-core/v4l2-vp9.c~drivers-media-v4l2-core-v4l2-vp9c-red=
uce-inlining
> +++ a/drivers/media/v4l2-core/v4l2-vp9.c
> @@ -1582,25 +1582,25 @@ static inline u8 noncoef_merge_prob(u8 p
>  * merge_prob(p[9], c[9], [10])
>  */
>=20
> -static inline void merge_probs_variant_a(u8 *p, const u32 *c, u16 =
count_sat, u32 update_factor)
> +static noinline_for_stack void merge_probs_variant_a(u8 *p, const u32 =
*c, u16 count_sat, u32 update_factor)
> {
> p[1] =3D merge_prob(p[1], c[0], c[1] + c[2], count_sat, =
update_factor);
> p[2] =3D merge_prob(p[2], c[1], c[2], count_sat, update_factor);
> }
>=20
> -static inline void merge_probs_variant_b(u8 *p, const u32 *c, u16 =
count_sat, u32 update_factor)
> +static noinline_for_stack void merge_probs_variant_b(u8 *p, const u32 =
*c, u16 count_sat, u32 update_factor)
> {
> p[0] =3D merge_prob(p[0], c[0], c[1], count_sat, update_factor);
> }
>=20
> -static inline void merge_probs_variant_c(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_c(u8 *p, const u32 =
*c)
> {
> p[0] =3D noncoef_merge_prob(p[0], c[2], c[1] + c[0] + c[3]);
> p[1] =3D noncoef_merge_prob(p[1], c[0], c[1] + c[3]);
> p[2] =3D noncoef_merge_prob(p[2], c[1], c[3]);
> }
>=20
> -static void merge_probs_variant_d(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_d(u8 *p, const u32 =
*c)
> {
> u32 sum =3D 0, s2;
>=20
> @@ -1624,20 +1624,20 @@ static void merge_probs_variant_d(u8 *p,
> p[8] =3D noncoef_merge_prob(p[8], c[6], c[7]);
> }
>=20
> -static inline void merge_probs_variant_e(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_e(u8 *p, const u32 =
*c)
> {
> p[0] =3D noncoef_merge_prob(p[0], c[0], c[1] + c[2] + c[3]);
> p[1] =3D noncoef_merge_prob(p[1], c[1], c[2] + c[3]);
> p[2] =3D noncoef_merge_prob(p[2], c[2], c[3]);
> }
>=20
> -static inline void merge_probs_variant_f(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_f(u8 *p, const u32 =
*c)
> {
> p[0] =3D noncoef_merge_prob(p[0], c[0], c[1] + c[2]);
> p[1] =3D noncoef_merge_prob(p[1], c[1], c[2]);
> }
>=20
> -static void merge_probs_variant_g(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_g(u8 *p, const u32 =
*c)
> {
> u32 sum;
>=20
> @@ -1659,12 +1659,12 @@ static void merge_probs_variant_g(u8 *p,
> }
>=20
> /* 8.4.3 Coefficient probability adaptation process */
> -static inline void adapt_probs_variant_a_coef(u8 *p, const u32 *c, =
u32 update_factor)
> +static noinline_for_stack void adapt_probs_variant_a_coef(u8 *p, =
const u32 *c, u32 update_factor)
> {
> merge_probs_variant_a(p, c, 24, update_factor);
> }
>=20
> -static inline void adapt_probs_variant_b_coef(u8 *p, const u32 *c, =
u32 update_factor)
> +static noinline_for_stack void adapt_probs_variant_b_coef(u8 *p, =
const u32 *c, u32 update_factor)
> {
> merge_probs_variant_b(p, c, 24, update_factor);
> }
> @@ -1724,33 +1724,33 @@ static inline void adapt_probs_variant_b
> merge_probs_variant_b(p, c, 20, 128);
> }
>=20
> -static inline void adapt_probs_variant_c(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_c(u8 *p, const u32 =
*c)
> {
> merge_probs_variant_c(p, c);
> }
>=20
> -static inline void adapt_probs_variant_d(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_d(u8 *p, const u32 =
*c)
> {
> merge_probs_variant_d(p, c);
> }
>=20
> -static inline void adapt_probs_variant_e(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_e(u8 *p, const u32 =
*c)
> {
> merge_probs_variant_e(p, c);
> }
>=20
> -static inline void adapt_probs_variant_f(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_f(u8 *p, const u32 =
*c)
> {
> merge_probs_variant_f(p, c);
> }
>=20
> -static inline void adapt_probs_variant_g(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_g(u8 *p, const u32 =
*c)
> {
> merge_probs_variant_g(p, c);
> }
>=20
> /* 8.4.4 Non coefficient probability adaptation process, adapt_prob() =
*/
> -static inline u8 adapt_prob(u8 prob, const u32 counts[2])
> +static noinline_for_stack u8 adapt_prob(u8 prob, const u32 counts[2])
> {
> return noncoef_merge_prob(prob, counts[0], counts[1]);
> }
> _
>=20


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

