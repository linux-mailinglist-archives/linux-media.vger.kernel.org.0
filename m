Return-Path: <linux-media+bounces-56663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAevGUT0wGkwPAQAu9opvQ
	(envelope-from <linux-media+bounces-56663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:05:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE0A2EE0C9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C65B30080AD
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F1036EA82;
	Mon, 23 Mar 2026 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHYEZfdu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F731FE44A
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253101; cv=none; b=Y3GWhznknvIIW6Bt1vHoIFeHmi7ykBq+Y5VL63Wnsj9E7x0C9dQ42QkAdp4KJUPkWHQPZfMGloLokzuocFbOysMOI4dmZadkw1mo89w9DEzWhVy2Hmjv48V+mI29ltnjunTFkLQBOA7S/7uX+9IkfPHX7KQJP4LLBT+HZJvqIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253101; c=relaxed/simple;
	bh=uEdsCzaHopkYv6CEizYbfcQBuyNgQoePrple8BRlyJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssA9NNdJUicLO4TW80jHuSdkVVU0wYeS2jEckg2VqRBA38wrm07cEAU5mcuJ5PLuiFW0cuYYCpNycogqKWFEdrGdK3qmA5Pn+mdAh97vGP/7hZ4mJIVIzsE4FkEumE7KLX2s5F2rHu9waT0fg2ZBO3U6fL3s2QNxheNT9aolH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHYEZfdu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so39336555e9.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253098; x=1774857898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=bHYEZfduksr6kthDL56g5u6ZE5Q4wzEzBNTzIUfBO1pCb7GNa1RHVfNfq+ZWHGyXVE
         W/14CHzrnAQdDK4iW9wSvBEcuSPa6yY566Pa+cBMzobO+LlpTYbplmvyzjq3uXB41ZkW
         IKlchhubw+5W2Y5ERv1HSL9NeUYBsSW9o8ucE8lLDdGKvW7WE1D+6Ubd5B3NgCiSohfq
         xSnCt91A/Yrt/SlmvAbAAMb5cwMUHWgMcOkZQhhppXeDI4LOq8RKondAktU8z9SMRQoJ
         8H1sgIu8suwP5kzljXrSPSRPto9207ehaWyzrdnMt8tycZ/S81D6tnYSmbqvRiJsW+uV
         +i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253098; x=1774857898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=UA++vuZxDUk+eg7c7hYoNUwsa0lLOOQOTiFGGbK9addM1sLiqs3zwRIpPc8n+Tw04R
         ZEiIBRMkZXRfKdDFqBsdkAXwH6ioZfr6ON3dwWSjaOvl3Nrt+YikYtDeNp5X+/N7oXhV
         DtbIDwVGAIPLxE7AzzXkw2ylvXv6uvS28PX6NTPBF8hi1Fov2Yi01rfzpvKhNAKsTLr3
         baJkLj6IRWDgMw1v3Lou/YpXU3GSOsYqx3h6JiOU2lPdSHxZzIAjzi6IH2LUv123y2Qr
         a5tH/bvQ2GbEynUqvj2+Cl4xLhRqs2WdsDqB+dnlAfNVnaYrl7i8r9XcwQknoy45oWvm
         ROdA==
X-Forwarded-Encrypted: i=1; AJvYcCUc7ecD2/tMSfdQKIVvxtpmV+YwwGRetaBxk6mtQkGfh41ZTrs6zVQzUiFF1nC6eu2eXiwXFwYnDTPH8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69Cs6SJFqHcVyQ11xvz1iM8TbbH2XZ85FaCG2wX7+Hlr460xl
	GWlsqboXbrGDnUYDvWHEbew3MJd7XXFUoq8geZM2Ulc+GXrLorghqIqG
X-Gm-Gg: ATEYQzwS+IR3Fm9WaMwWh+gH8ddfHBRwQyPHeN/rPyE6gpznFap20Tq09ZY34/4fz8R
	v5u4LoQh9QPMdQgi1zmWKO6GeVr5UCp5N0feJhUEDulSB3qfzXlXSaHqka+ImRPQET4E7jPfIWK
	+AqsSjaKS3qFn/IJ052ILtmsXtMkbOhDpzdeZLtAFMo/EgBumSTM5N2oyENrxfV9jXszgnVXREE
	SUNv2HlPmHMhQqKjaj+Unzv7ZBX1jeLIh2XxdmWreYtYEFw0i9GLcz7pZYNfaSNMnJOkokisAoV
	PtOeYc1j8DiXOvIBweqb4IrqiCt2W9LHf5Q7ZxXIGAGmpFVf0kADTkQsX+FJ8/xpMHAVCKqqHiI
	jJgnCGWl3W2Gvkao8gfvJAxiLN1C/IHBZnb5vGJVG26A7D1AAYNs4q8+ilYl8cQ9zPyZmBjnGVp
	PK5OZpILxUwieWAOjClghFArxg5AA5wd2/TnkTCPrLBqu7tU1r26J5S2W9aLe4xKYW/4kFMHv9Q
	1kSkWYv
X-Received: by 2002:a05:600c:4e8e:b0:485:3e6c:aacb with SMTP id 5b1f17b1804b1-486feda8c69mr158012695e9.4.1774253098203;
        Mon, 23 Mar 2026 01:04:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-69-125.dynamic.telemach.net. [178.79.69.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d452sm76320155e9.19.2026.03.23.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:04:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 pengpeng@iscas.ac.cn
Subject: Re: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 09:04:56 +0100
Message-ID: <2402496.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
References: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56663-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EE0A2EE0C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dne ponedeljek, 23. marec 2026 ob 08:03:14 Srednjeevropski standardni =C4=
=8Das je Pengpeng Hou napisal(a):
> Cedrus consumes HEVC slice parameters directly from stateless V4L2
> controls, but it does not validate the active reference counts or the
> ref_idx_l0/ref_idx_l1 values before using them in fixed-size 16-entry
> reference arrays. Oversized counts or indices can therefore walk past
> the end of those arrays in the HEVC decode path.
>=20
> Reject HEVC slice controls whose active reference counts or reference
> indices exceed V4L2_HEVC_DPB_ENTRIES_NUM_MAX.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

There is nothing Cedrus specific here. Why not move it to common code?

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff0e..d68da1eaa7aa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,28 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  			ctx->bit_depth =3D bit_depth;
>  			cedrus_reset_cap_format(ctx);
>  		}
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_hevc_slice_params *slice =3D ctrl->p_new.p_hevc=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_idx_l0[i] >=3D V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_idx_l1[i] >=3D
> +				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +					return -EINVAL;
> +		}
>  	}
> =20
>  	return 0;
>=20





