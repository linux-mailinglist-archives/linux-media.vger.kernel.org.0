Return-Path: <linux-media+bounces-62922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNcrO+g4F2os9gcAu9opvQ
	(envelope-from <linux-media+bounces-62922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 20:33:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F15E914D
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 20:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D38E43035AA5
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 18:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FC14611EE;
	Wed, 27 May 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gTYRjMNm"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D203EFD13;
	Wed, 27 May 2026 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779906499; cv=pass; b=Nw5kSBZKuWvwcI5wem9CCjA/mS9PBoD92g+PIr+pytSE3vP4+mLOb3/su67wrnblNA28+C31R4N/BZ0fWLQ/24xBxN/N2/Zx+2JiIN6zGiw+8N87OFTTA1V81MOvJP74JoGpW4o5R+qVRjYNac1mNdCHZ6kvn1DS5H/jQyed5gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779906499; c=relaxed/simple;
	bh=Iy6wOAQqZEUo0P3pnQwTrVwOgtwl2lPVwudMmwktNRI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SWidA89Nd/vg8o828GMz/m2AvVwkGT4OeOzDz3xyOXWwmYe/9jFY0H/TxidIGLIQCVs4kAy2m8Ph7BC541NmOKtsUAXPTyyd3trbOW8ovQH45xZD8RzHy5bEVHIybjAJC7cPEQBkfqAqf4gCvSdtwfFPjmQ6SUIUehEZJotUUAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=gTYRjMNm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779906494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MQooxO27rQquXN+Y3OPnZ4ZJd6EAXWMGEsgSj6mW8hOdKm8wVN0pytrPkEH595ccp5wIIC8H9+OJ8/F1SJ0yhhK2QB2Ius3hpUrKJBazD/CqfLvjEiziOhrVhh7j6ohNG3VLNMXNo0HndEHHrn3FtIJxXF1lG2p7xVvYnL4P+Rc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779906494; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i2bpJqzf3qyre4gJeXpQEDn9l0ezgAlFMGUGp0jBM9M=; 
	b=DUmvO7pEmsoGDNcz5K2GNZBugwOqr5ViDFTKGNs1pzlbNtSDKS9/QaxG30QjTYH4nOCnn+TsE0j6UTmqBr7u0LMDlZXQ4nqC2iOmFMf+i/gGm2Ps6lrDqzGYVCvdeeLrc5pmWkjiF9bjmFre7rPzLFsTcVn78kPV8Tb4IfeWDB8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779906494;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=i2bpJqzf3qyre4gJeXpQEDn9l0ezgAlFMGUGp0jBM9M=;
	b=gTYRjMNmfmJ/qG2IF4RPb6vle910GjO3yjGb8zTA9Kc17EXAAhtJwZc6lYai6c8a
	8wySaAbAmsGRJ16PVYfWhx+KYRbzXuZBNtBeqUFN65id4VTJE49oDNuGW25Y7vW9683
	Fhcfl09F7OGvZNLIPC7XD6lUu7vnZSROum3MGHHA=
Received: by mx.zohomail.com with SMTPS id 1779906492457727.5353037434861;
	Wed, 27 May 2026 11:28:12 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] media: vidtv: Use crc32_be() instead of open coding
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260316211542.50912-1-ebiggers@kernel.org>
Date: Wed, 27 May 2026 15:27:55 -0300
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0B7E3E4-318D-4037-AD61-1A43EB550271@collabora.com>
References: <20260316211542.50912-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62922-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 4C1F15E914D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On 16 Mar 2026, at 18:15, Eric Biggers <ebiggers@kernel.org> wrote:
>=20
> dvb_crc32() does exactly the same computation as the crc32_be() =
library
> function.  Just call crc32_be() instead.
>=20
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> drivers/media/test-drivers/vidtv/Kconfig     |  1 +
> drivers/media/test-drivers/vidtv/vidtv_psi.c | 57 +-------------------
> 2 files changed, 2 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vidtv/Kconfig =
b/drivers/media/test-drivers/vidtv/Kconfig
> index e511e51c0b5b..8cb10b75603b 100644
> --- a/drivers/media/test-drivers/vidtv/Kconfig
> +++ b/drivers/media/test-drivers/vidtv/Kconfig
> @@ -1,9 +1,10 @@
> # SPDX-License-Identifier: GPL-2.0-only
> config DVB_VIDTV
> tristate "Virtual DVB Driver (vidtv)"
> depends on DVB_CORE && MEDIA_SUPPORT && I2C
> + select CRC32
> help
>  The virtual DVB test driver serves as a reference DVB driver and =
helps
>  validate the existing APIs in the media subsystem. It can also aid =
developers
>  working on userspace applications.
>=20
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c =
b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> index 685a1f7b2fb1..1b6225d65ef3 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -29,65 +29,10 @@
> #define CRC_SIZE_IN_BYTES 4
> #define MAX_VERSION_NUM 32
> #define INITIAL_CRC 0xffffffff
> #define ISO_LANGUAGE_CODE_LEN 3
>=20
> -static const u32 CRC_LUT[256] =3D {
> - /* from libdvbv5 */
> - 0x00000000, 0x04c11db7, 0x09823b6e, 0x0d4326d9, 0x130476dc, =
0x17c56b6b,
> - 0x1a864db2, 0x1e475005, 0x2608edb8, 0x22c9f00f, 0x2f8ad6d6, =
0x2b4bcb61,
> - 0x350c9b64, 0x31cd86d3, 0x3c8ea00a, 0x384fbdbd, 0x4c11db70, =
0x48d0c6c7,
> - 0x4593e01e, 0x4152fda9, 0x5f15adac, 0x5bd4b01b, 0x569796c2, =
0x52568b75,
> - 0x6a1936c8, 0x6ed82b7f, 0x639b0da6, 0x675a1011, 0x791d4014, =
0x7ddc5da3,
> - 0x709f7b7a, 0x745e66cd, 0x9823b6e0, 0x9ce2ab57, 0x91a18d8e, =
0x95609039,
> - 0x8b27c03c, 0x8fe6dd8b, 0x82a5fb52, 0x8664e6e5, 0xbe2b5b58, =
0xbaea46ef,
> - 0xb7a96036, 0xb3687d81, 0xad2f2d84, 0xa9ee3033, 0xa4ad16ea, =
0xa06c0b5d,
> - 0xd4326d90, 0xd0f37027, 0xddb056fe, 0xd9714b49, 0xc7361b4c, =
0xc3f706fb,
> - 0xceb42022, 0xca753d95, 0xf23a8028, 0xf6fb9d9f, 0xfbb8bb46, =
0xff79a6f1,
> - 0xe13ef6f4, 0xe5ffeb43, 0xe8bccd9a, 0xec7dd02d, 0x34867077, =
0x30476dc0,
> - 0x3d044b19, 0x39c556ae, 0x278206ab, 0x23431b1c, 0x2e003dc5, =
0x2ac12072,
> - 0x128e9dcf, 0x164f8078, 0x1b0ca6a1, 0x1fcdbb16, 0x018aeb13, =
0x054bf6a4,
> - 0x0808d07d, 0x0cc9cdca, 0x7897ab07, 0x7c56b6b0, 0x71159069, =
0x75d48dde,
> - 0x6b93dddb, 0x6f52c06c, 0x6211e6b5, 0x66d0fb02, 0x5e9f46bf, =
0x5a5e5b08,
> - 0x571d7dd1, 0x53dc6066, 0x4d9b3063, 0x495a2dd4, 0x44190b0d, =
0x40d816ba,
> - 0xaca5c697, 0xa864db20, 0xa527fdf9, 0xa1e6e04e, 0xbfa1b04b, =
0xbb60adfc,
> - 0xb6238b25, 0xb2e29692, 0x8aad2b2f, 0x8e6c3698, 0x832f1041, =
0x87ee0df6,
> - 0x99a95df3, 0x9d684044, 0x902b669d, 0x94ea7b2a, 0xe0b41de7, =
0xe4750050,
> - 0xe9362689, 0xedf73b3e, 0xf3b06b3b, 0xf771768c, 0xfa325055, =
0xfef34de2,
> - 0xc6bcf05f, 0xc27dede8, 0xcf3ecb31, 0xcbffd686, 0xd5b88683, =
0xd1799b34,
> - 0xdc3abded, 0xd8fba05a, 0x690ce0ee, 0x6dcdfd59, 0x608edb80, =
0x644fc637,
> - 0x7a089632, 0x7ec98b85, 0x738aad5c, 0x774bb0eb, 0x4f040d56, =
0x4bc510e1,
> - 0x46863638, 0x42472b8f, 0x5c007b8a, 0x58c1663d, 0x558240e4, =
0x51435d53,
> - 0x251d3b9e, 0x21dc2629, 0x2c9f00f0, 0x285e1d47, 0x36194d42, =
0x32d850f5,
> - 0x3f9b762c, 0x3b5a6b9b, 0x0315d626, 0x07d4cb91, 0x0a97ed48, =
0x0e56f0ff,
> - 0x1011a0fa, 0x14d0bd4d, 0x19939b94, 0x1d528623, 0xf12f560e, =
0xf5ee4bb9,
> - 0xf8ad6d60, 0xfc6c70d7, 0xe22b20d2, 0xe6ea3d65, 0xeba91bbc, =
0xef68060b,
> - 0xd727bbb6, 0xd3e6a601, 0xdea580d8, 0xda649d6f, 0xc423cd6a, =
0xc0e2d0dd,
> - 0xcda1f604, 0xc960ebb3, 0xbd3e8d7e, 0xb9ff90c9, 0xb4bcb610, =
0xb07daba7,
> - 0xae3afba2, 0xaafbe615, 0xa7b8c0cc, 0xa379dd7b, 0x9b3660c6, =
0x9ff77d71,
> - 0x92b45ba8, 0x9675461f, 0x8832161a, 0x8cf30bad, 0x81b02d74, =
0x857130c3,
> - 0x5d8a9099, 0x594b8d2e, 0x5408abf7, 0x50c9b640, 0x4e8ee645, =
0x4a4ffbf2,
> - 0x470cdd2b, 0x43cdc09c, 0x7b827d21, 0x7f436096, 0x7200464f, =
0x76c15bf8,
> - 0x68860bfd, 0x6c47164a, 0x61043093, 0x65c52d24, 0x119b4be9, =
0x155a565e,
> - 0x18197087, 0x1cd86d30, 0x029f3d35, 0x065e2082, 0x0b1d065b, =
0x0fdc1bec,
> - 0x3793a651, 0x3352bbe6, 0x3e119d3f, 0x3ad08088, 0x2497d08d, =
0x2056cd3a,
> - 0x2d15ebe3, 0x29d4f654, 0xc5a92679, 0xc1683bce, 0xcc2b1d17, =
0xc8ea00a0,
> - 0xd6ad50a5, 0xd26c4d12, 0xdf2f6bcb, 0xdbee767c, 0xe3a1cbc1, =
0xe760d676,
> - 0xea23f0af, 0xeee2ed18, 0xf0a5bd1d, 0xf464a0aa, 0xf9278673, =
0xfde69bc4,
> - 0x89b8fd09, 0x8d79e0be, 0x803ac667, 0x84fbdbd0, 0x9abc8bd5, =
0x9e7d9662,
> - 0x933eb0bb, 0x97ffad0c, 0xafb010b1, 0xab710d06, 0xa6322bdf, =
0xa2f33668,
> - 0xbcb4666d, 0xb8757bda, 0xb5365d03, 0xb1f740b4
> -};
> -
> -static u32 dvb_crc32(u32 crc, u8 *data, u32 len)
> -{
> - /* from libdvbv5 */
> - while (len--)
> - crc =3D (crc << 8) ^ CRC_LUT[((crc >> 24) ^ *data++) & 0xff];
> - return crc;
> -}
> -
> static void vidtv_psi_update_version_num(struct vidtv_psi_table_header =
*h)
> {
> h->version++;
> }
>=20
> @@ -173,11 +118,11 @@ static u32 vidtv_psi_ts_psi_write_into(struct =
psi_write_args *args)
>=20
> if (!args->crc && !args->is_crc)
> pr_warn_ratelimited("Missing CRC for chunk\n");
>=20
> if (args->crc)
> - *args->crc =3D dvb_crc32(*args->crc, args->from, args->len);
> + *args->crc =3D crc32_be(*args->crc, args->from, args->len);
>=20
> if (args->new_psi_section && !aligned) {
> pr_warn_ratelimited("Cannot write a new PSI section in a misaligned =
buffer\n");
>=20
> /* forcibly align and hope for the best */
>=20
> base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>


