Return-Path: <linux-media+bounces-56815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMfGFtdFwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:05:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F5304533
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C247831B345F
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 07:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F94C35AC24;
	Tue, 24 Mar 2026 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpnTVyaj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF8538C43C
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339023; cv=none; b=j5z7p9iSdeNCZQaOjoK2+i2u6kXBYRZ1V49tknnKte9Gt5p6kEl2IwO/V2BJ0ufUfO2kPS2x86SJ0d85C9NpbY31nCPDnA9rldDk6+2V6afnjFNrfPSBP3PqzLkprKT/VTMSpvS91mxJA60hXa5RrzQd5N841ctzu73J7wAse40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339023; c=relaxed/simple;
	bh=p70KRl2iyiH98RwY4hlNKdUPjdh2xLhI1lhyiI1eZxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxjqH2AOjlR7/eX4FT56U1RWQ8HJBQaX8G8W5bbuclnG0snDA60NcM2p5C7kPhcAgrgtUy9hrdoRj+MzXE2M7MLX1xu6lioM9G5dm02xBxGnTjubfD1jypMfHlMr0ESIJsyC6YdqLNJSHqsdggBi8wNbR20EGFfsOQvktKticR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpnTVyaj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso6913345e9.2
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 00:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339011; x=1774943811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=dpnTVyajGyko46qKfF9oJZ1GoBN61/iuw4gwkAxiw9Ll46ZAqTJVFYZrsldIOyDn74
         h3p8oVpQkKr0YssyhCg8+qEtDtb/aeLZkrFMYamO/b8E3Y9zBUOTOv/4/C9n2NBkU9To
         NSmqlYGdp7WaPR+cW8/3yV/ZW/MSbWQGHp9N3nX+ScTT1yarC54UtPoTh+Wr6cMHBLRA
         zd5w2UvE0LYGytWlgpEWbKlV3NLYp89sBtnWnhQtkuVxEjUERifwzVCg5BuXKAFVP2Hb
         mU8/mSX7IeKJgZJyfS0v6tBVbjrVxYKuAwjmx30s84SevOVN3DCxF/mm+WNxLeH57HEK
         1ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339011; x=1774943811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=WkZyzsQIvGowMmyYwwPpiT2r8ZG1OCRRjGw4POKvFW2+itAcfY7AJjfOIi0TxNRkgi
         zAwhsuevJggMv98UJ9nq9at50vntIW2pGmYIzDCJbvMJzfB66ogLu4BA4KY+KAAxijgd
         GS09Rg7dKPtfrb1ydbCobrW1Ek4QQarpvrQ2/pfpiO9LnlyEGDbVIMZzVzjNNyfnkYJu
         vi5ZnRztdkv3obp/YHyoMtSiYFiOK6iZ+KSwFrekTMvlTx4pgHiY2V1i+kElhSbxROzm
         DplAQta6G6/nu5n6GWdt87uLq5A+hpPkuVF5KxD1+KbRQwDBta4+eGobjfuuKjPwel+W
         LbWg==
X-Gm-Message-State: AOJu0YxvB1xcSnDrJD9mgPzZSVvVMWBSm5BVLZj4uJ8n7MiIMVjX/Kj2
	bGxOZFU4ssoeWoFsAWbAcY/y5iMIl9kGlbQmNlLvH2uLvRsKocJDP3b7
X-Gm-Gg: ATEYQzwdib0jVHB7AGS4lpT3m9hs6+bDkI3rjoZCNUaCMlo5nri8TvouF+nX6JtwbnT
	a15mH0wAZYrgx+C7kY2NirPnt36M015guxOoZJ30nY0dLwpjBsbO0vQyrrL8vpo+HWBcDerFcLa
	cSrsx3G+UMPt4ruM71pBmhRYO7tezvw43xosEn9HtfEqXNPbnxrRzmQIg0frnuzzvsKxeq384K4
	aANPihnyZYvdVms/HcDLiITL4M9uvZmtSwNRNv8RNk+ErCx3tNXj7VGSrELvmkoGAOByNsA5FBl
	7GmRoNZK3Slh3Mxxe93mbXmppXcpkKzcKBoYtUM/D9ScS04wWRvRynT0u88cTpgjUQ4N2/CVJFF
	7wRCv3Dc45X1Qe0CVZ8waulsPLvoLjwawfTREzNUjPRZl9B9ld/EXx9yhLhY/rgSG24YnM28kgj
	71QDxTs+576+L9ICFY0WwhzbeO57YgrgsIvJFR05VOJsgZ2RCg2K1nPvmV2wH1eDD8Z8PPJQus4
	4v3Fr/tjFg=
X-Received: by 2002:a05:600c:4707:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-486fee231cdmr200567305e9.21.1774339011116;
        Tue, 24 Mar 2026 00:56:51 -0700 (PDT)
Received: from jernej-laptop.localnet (31.red-83-50-72.dynamicip.rima-tde.net. [83.50.72.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487110dd718sm12885685e9.29.2026.03.24.00.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:56:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn,
 nicolas.dufresne@collabora.com
Subject: Re: [PATCH] media: cedrus: validate H.264 reference list indices
Date: Tue, 24 Mar 2026 08:56:46 +0100
Message-ID: <5056688.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
References: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56815-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,bootlin.com:url]
X-Rspamd-Queue-Id: AB3F5304533
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CC: Nicolas

Dne torek, 24. marec 2026 ob 03:04:31 Srednjeevropski standardni =C4=8Das j=
e Pengpeng Hou napisal(a):
> Cedrus validates HEVC slice reference lists in cedrus_try_ctrl(), but
> the H.264 path still consumes ref_pic_list0/ref_pic_list1 indices
> straight from the stateless slice control. Those indices are later
> used to index the fixed-size decode_params->dpb[] array in
> _cedrus_write_ref_list().
>=20
> Reject H.264 slice controls whose active reference counts or
> reference indices exceed V4L2_H264_NUM_DPB_ENTRIES before the driver
> reaches the DPB lookup. This keeps the validation next to the existing
> Cedrus stateless control checks and avoids driver-specific
> out-of-bounds reads from malformed userspace control payloads.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

This has same issue as doing it in common code, e.g. it would break
userspace.

One improvement would be to skip all indices which have value higher
or equal to V4L2_H264_NUM_DPB_ENTRIES here:

https://elixir.bootlin.com/linux/v6.19.9/source/drivers/staging/media/sunxi=
/cedrus/cedrus_h264.c#L212

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index d68da1eaa7aa..905084c097a9 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -42,6 +42,29 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 !=3D 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_h264_slice_params *slice =3D ctrl->p_new.p_h264=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_H264_NUM_DPB_ENTRIES)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_pic_list0[i].index >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_pic_list1[i].index >=3D
> +				    V4L2_H264_NUM_DPB_ENTRIES)
> +					return -EINVAL;
> +		}
>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_c=
tx, hdl);
>=20





