Return-Path: <linux-media+bounces-63281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GLAJJyjHWr5cgkAu9opvQ
	(envelope-from <linux-media+bounces-63281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:22:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 055AC621989
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBF893050265
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724ED3DA5B5;
	Mon,  1 Jun 2026 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0GDRC32"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF3346E70
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326931; cv=none; b=b2ZnaVk8XXiSZRTyNnpiFL+9qC51/eEynmK2t7OCyLTV91UeY4SvlYkstyCPWsMeKoTLxUxK3OQlWdgeO5YASTlY3OypMDJ2m5TguBE0HWPWleKFUpXcQNV++3jDbgfBdvRRH1Oynu+lYOKcoJ0ZnAf4yFm0ADt4mF5R47sh6MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326931; c=relaxed/simple;
	bh=ijMn6hFNtH4vj46jDFl+k3GmpEagD2tEMoEXLEU1gwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ozAAzFl9Zd2bvYkF+TW2kTeKsSvV8ITlUZIsP5wbMN9OiNEN+ZqZ/xB8Guk8PYldA33PkY41LqukBQBKadUsu5awFEtgIjoVg48a5PIsiUJyEq5qZ58TcQWw5nQFBTIHGOg4SDXPriJP94ygme96dGkduZHsj50jgSpzhtJwjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0GDRC32; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062851F00893;
	Mon,  1 Jun 2026 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780326928;
	bh=ETHC6PofZHNSa6n+0fxks01boysf4lsdpqQhMkvJj9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0GDRC32vn6/7aB/2rVJYndj0Q3nPvg6Nm5+FfRcyezLudfkWDRpywn8abZHJDQGL
	 Zt3pgH5mJnn+ZIvE/kTNroyH5sWPhFKEusvqV2dsvw7i/UQxG1RZzncZiLRo1+x/De
	 ApgE39pMmTlRridRx3Zvq08oysTwgL1QdMTLleYqk2nf94mH6EKOQ2XdjeQ0TMuKLw
	 LjgeJLOMxlUvOk9Av5EGFcQamrIHQiUiNn8q3wP5znRMfjyrB0DM8BREDYOr+372fR
	 LEeanrxwHyvcA1CRKVfIbI3mG8N1dQUaUl5GCbFXs37P+gGf7uEdroeRbr5X50ibc4
	 a05EpLOnDgOKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: vicodec: fix out-of-bounds write in FWHT encoder
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junrui Luo" <moonafterrain@outlook.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <SYBPR01MB7881C44480F77338B6A93C61AF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB7881C44480F77338B6A93C61AF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:15:27 +0000
Message-Id: <20260601151528.062851F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63281-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:replyto,outlook.com:email]
X-Rspamd-Queue-Id: 055AC621989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix leaving the stateless decoder broken for 4-componen=
t unencoded frames due to insufficient sizeimage multiplier.
- [High] Data corruption in `decode_plane()` when processing uncompressed p=
lanes for interleaved pixel formats.
--

commit 9d6dcf75887aba570509c5de466de5d05f1da49d
Author: Junrui Luo <moonafterrain@outlook.com>

media: vicodec: fix out-of-bounds write in FWHT encoder

vidioc_s_fmt_vid_out() sizes the encoder CAPTURE buffer from the compressed
descriptor pixfmt_fwht, whose sizeimage_mult is 3. This patch bumps
pixfmt_fwht.sizeimage_mult from 3 to 4, matching the largest components_num
among the supported raw formats, so the capture buffer is always large
enough for the unencoded fallback.

> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/=
media/test-drivers/vicodec/vicodec-core.c
> index 318e8330f16ae..3ff2d06742c20 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -63,7 +63,7 @@ struct pixfmt_info {
>  };
> =20
>  static const struct v4l2_fwht_pixfmt_info pixfmt_fwht =3D {
> -	V4L2_PIX_FMT_FWHT, 0, 3, 1, 1, 1, 1, 1, 0, 1
> +	V4L2_PIX_FMT_FWHT, 0, 4, 1, 1, 1, 1, 1, 0, 1
>  };
> =20
>  static const struct v4l2_fwht_pixfmt_info pixfmt_stateless_fwht =3D {

[Severity: High]
This isn't a bug introduced by this patch, but does leaving
pixfmt_stateless_fwht.sizeimage_mult at 3 break the stateless decoder for
4-component unencoded frames?

Since pixfmt_stateless_fwht.sizeimage_mult remains 3, vidioc_try_fmt() will
cap the sizeimage for compressed OUTPUT queue buffers at 3 * width * height.
If user space attempts to queue a valid 4-component unencoded frame, which
requires 4 * width * height bytes, will videobuf2 reject the buffer because
the payload exceeds the negotiated sizeimage?

[Severity: High]
This is a pre-existing issue, but looking at decode_plane() in
drivers/media/test-drivers/vicodec/codec-fwht.c, is there a data corruption
issue when processing uncompressed planes for interleaved pixel formats?

When falling back to decoding an uncompressed plane, the code uses:

	if (uncompressed) {
		int i;

		if (end_of_rlco_buf + 1 < *rlco + width * height / 2)
			return false;
		for (i =3D 0; i < height; i++) {
			memcpy(dst, *rlco, width);
			dst +=3D dst_stride;
			*rlco +=3D width / 2;
		}
		return true;
	}

Since this unpacking ignores the dst_step stride, which spaces out bytes for
interleaved formats like V4L2_PIX_FMT_RGB32 (dst_step =3D 4), does this
clobber the bytes belonging to other color components for the first
width / dst_step pixels of the row, and leave the rest of the row unwritten?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/SYBPR01MB7881C44480=
F77338B6A93C61AF152@SYBPR01MB7881.ausprd01.prod.outlook.com?part=3D1

