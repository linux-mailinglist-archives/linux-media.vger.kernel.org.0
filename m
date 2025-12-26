Return-Path: <linux-media+bounces-49578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 949CACDEB1F
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 13:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C84A3300855F
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 12:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C13320CAB;
	Fri, 26 Dec 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxDROA42"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3422320A33
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766751928; cv=none; b=NgIHN4VTLgO000MGPiw1U9G2IP0Y/L1SxIwcIiYyG0nDPZF+luqhYWGb1eaXPVAm22dHL3K6+B1hvXpl41yajp+SaYrMKwp7kpWnl4l1dpURqxIEekWV1KIxWq0Jymm79SykZ17NQQ622SerThEJTJH6CzYuRyBjYG8jpdrZBBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766751928; c=relaxed/simple;
	bh=s0igInVi2fsL8o4Z4M/V+k7XSMGGxM39qOmVRGDnFFo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CJ9ikpx9fgouRcsjP0HyLpdcRk5JQa6xTyNlla9AhzLwoRR2/JZwUc40FQu9eDKjm8HQGK+If0qNp5QXA4p+aCEDVUAzX0GT4Fi5NjBX47WpK2tvSiTLbpuVyvrTWl+/MxiQh6qJnEmzOAHvQXTYkdC8WwM2VA+f05nKpZKLDs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxDROA42; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso58774985e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 04:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766751924; x=1767356724; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/QWZMgTcROcYFJ0cFP0webMTrmmuMu3SFDdjIFr7Xg=;
        b=WxDROA42RUsr0RY3rgG+wgchKtUffrDJ3mducqIIRnG6S4wXv8RNF/Wxe1NDCsKszJ
         nJLhqzIzqYWYv3vIYrHNtnKnmXFsnVbalMuCOX5PDYmJrHnzcLnUMhrcQeUj/MANVmuz
         EwVmyjjdQXAWobnVt9hXJy2uMl6gsobG4YrLrM1lrSECsAMZfEbniPJJ1f5F1yNHSF2Q
         o91AFXXS3oHFyWmBdnsgmeY3omOg5LUT72ikVUVRrhcT6A0Lte4uoSP1KBwFyoLy3g1D
         mQ1CIH1y6ZYubF6YW/DYicj8umCJxt5/aisihz654x6GbAyiwxOPGaNUK2Ff96cbX+hl
         5NEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766751924; x=1767356724;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/QWZMgTcROcYFJ0cFP0webMTrmmuMu3SFDdjIFr7Xg=;
        b=dI9hd+UAVE6e4CzMMf2cLg05nX10EXHbkatHwCakOJ8zXBRYlkd7oLtrnUwOSUnk05
         h8jRKhIReY93GrLKUMwFa8TB2HtP1zsW5qetomNrwuuy3Vi9Hbb8qubflbmi2cIIehRk
         XcLptYMxDPPvbKNG2yxGucvw5xVPtfnSpL9pVxj067QHsmbErc5xwQutPeou3N3qSqQi
         Nmo6025QLdnbupct26Wusz8ij3jsZ6PdeQdK/UL6rAX7xgxnjv63+uqYT+pVgjUqEaxg
         M2XIvahJtORoeecvpHGzCOYZmeESQ8J66/i1zB5egxqOppYiKKArVJbK8vv5dTRkJSTX
         gh1w==
X-Forwarded-Encrypted: i=1; AJvYcCVIKhp61n/AY1ap7izA/u+yc/REh/QVoHDjL15pxNdYP/sbYSakvU3VW6N/cNZCtogDLEKyvD9cjBJdWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQZP/73q+jQqXAHe7Z6zr2GGWmFXAXabVDzYVS6KYP5pmE3BT
	nmixMjTSqS83JYpjlo2VzuXixcyoYj1IKgLZuYR2D3cPlozAWGL13KqD
X-Gm-Gg: AY/fxX5w0Ic0X7nKY5Bv/rOd/2Cq6OvyY8b4YLdRXvJtfMpUFbZzPDQHulYGIf53PL7
	nT4AC0TwZ8lS7G0+NcFirx619CxwLPgc4ZrJT7j0iuPpdKosFCvowB6VOekAHxAUbyjbQDFKXqx
	SujXgwJTJpYtUesujps/BxT+TMB20VdjIIvatZNT+QVtgve2FQWj+uk0R9AYgaPVjC/8cVcKOA+
	PdeCqXpr13G5MXqV8asMa/+3owkLeGwJBq4qIS/sfJd+0yMdw5/n43JQVkkLL7jEGVOWpduEPYX
	zVv5yYRpg2yyj7kAM0B/0VuPQg1E0KBVwnYZeREcNaOuK0tEDsp8x+fh7vSMztMLQfBP5BMgr17
	jQux93gOrbMJgIuTipkVgjkm3JneVKF3fe8m/aqqjnbgQwmZz4O440uAGR2U1uHqkm56coUFQKI
	iV/xITetKOsbEWZ3oWx0Y/eBvT2ACP9ZHN1O3bZODXZikwH8A5NjDlGP66bL+H4RJqLpKLQrFlq
	7g8WjJb1g==
X-Google-Smtp-Source: AGHT+IGc8Z2MAoLbOks33fyQFWGK5GI9Gp1WejsRvglw//425ZHkxFEhT7LmB7wnFeheTO44I6eLuA==
X-Received: by 2002:a05:600c:620d:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d19569c23mr295125695e9.16.1766751924042;
        Fri, 26 Dec 2025 04:25:24 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm45346320f8f.24.2025.12.26.04.25.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Dec 2025 04:25:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH v2 2/3] media: rkvdec: Add support for the VDPU346 variant
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <DF84QZ0YBLY8.2DYCSM2EQIF5@cknow-tech.com>
Date: Fri, 26 Dec 2025 16:25:09 +0400
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas.collabora@collabora.com>,
 =?utf-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <71EA9FB8-83DB-4785-86C1-2E6BA9C739D9@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
 <20251226113140.573759-3-christianshewitt@gmail.com>
 <DF84QZ0YBLY8.2DYCSM2EQIF5@cknow-tech.com>
To: Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)

> On 26 Dec 2025, at 4:00=E2=80=AFpm, Diederik de Haas =
<diederik@cknow-tech.com> wrote:
>=20
> Hi Christian,
>=20
> On Fri Dec 26, 2025 at 12:31 PM CET, Christian Hewitt wrote:
>> VDPU346 is similar to VDPU381 but with a single core and limited
>> to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
>> AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.
>>=20
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>
>> ---
>> .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 =
++++++++++++++++++
>> 1 file changed, 103 insertions(+)
>>=20
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index e547057dc75f..6b39e99d8a8b 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -236,6 +236,62 @@ static const struct rkvdec_ctrls =
rkvdec_hevc_ctrls =3D {
>> .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>> };
>>=20
>> +static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] =3D {
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>> + .cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + .cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + .cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
>> + .cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + .cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + .cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>> + .cfg.menu_skip_mask =3D
>> + BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>> + .cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + .cfg.dims =3D { 65 },
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + .cfg.dims =3D { 65 },
>> + },
>> +};
>> +
>> +static const struct rkvdec_ctrls vdpu346_hevc_ctrls =3D {
>> + .ctrls =3D vdpu346_hevc_ctrl_descs,
>> + .num_ctrls =3D ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
>> +};
>> +
>> static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
>> {
>> .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> @@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc =
rk3288_coded_fmts[] =3D {
>> }
>> };
>>=20
>> +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
>> + {
>> + .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>> + .frmsize =3D {
>> + .min_width =3D 64,
>> + .max_width =3D 65472,
>=20
> This should be 4096 according to page 469 of RK3568 TRM Part 2 ...
>=20
>> + .step_width =3D 64,
>> + .min_height =3D 64,
>> + .max_height =3D 65472,
>=20
> ... and this 2304.
>=20
>> + .step_height =3D 16,
>> + },
>> + .ctrls =3D &vdpu346_hevc_ctrls,
>> + .ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>> + .decoded_fmts =3D rkvdec_hevc_decoded_fmts,
>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> + },
>> + {
>> + .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>> + .frmsize =3D {
>> + .min_width =3D 64,
>> + .max_width =3D  65520,
>=20
> This too should be 4096 according to page 469 of RK3568 TRM Part 2 ...
>=20
>> + .step_width =3D 64,
>> + .min_height =3D 64,
>> + .max_height =3D  65520,
>=20
> ... and this 2304.
>=20
> I guess this also explains the 'green images' Nicolas noticed.

Quite probably. I=E2=80=99ve picked the above changes into my working =
tree
(for those following it) and will send a v3 series in response to
the next revision of Detlev=E2=80=99s patches.

> + .step_height =3D 16,
>> + },
>> + .ctrls =3D &rkvdec_h264_ctrls,
>> + .ops =3D &rkvdec_vdpu381_h264_fmt_ops,
>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>> + .decoded_fmts =3D rkvdec_h264_decoded_fmts,
>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> + },
>=20
> I see you've reversed the order of the blocks so that HEVC now comes
> before the H264 block. While that makes it consistent with what Detlev
> has in their v7 and with the existing code in the driver ... I =
actually
> prefer having H264 before HEVC as the alphabetical sorting order is
> H264 before HEVC.
> In the existing code the VP9 'stuff' is listed below H264 and HEVC.
>=20
> But then Detlev should do that too in their patch set ... and =
'ideally'
> the order of the existing code be updated to be alphabetically too.
>=20
> OTOH, a consistent order works for me too.

I believe the reorder was requested by Nic (offline from the list) so
there=E2=80=99s probably a reason behind it. I=E2=80=99ll keep things =
aligned to the
order in Detlev=E2=80=99s series (whatever that is).

Christian


> Cheers,
>  Diederik
>=20
>> +};
>> +
>> static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>> {
>> .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>> @@ -1643,6 +1734,14 @@ static const struct rkvdec_variant_ops =
vdpu381_variant_ops =3D {
>> .flatten_matrices =3D transpose_and_flatten_matrices,
>> };
>>=20
>> +static const struct rkvdec_variant vdpu346_variant =3D {
>> + .coded_fmts =3D vdpu346_coded_fmts,
>> + .num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
>> + .rcb_sizes =3D vdpu381_rcb_sizes,
>> + .num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
>> + .ops =3D &vdpu381_variant_ops,
>> +};
>> +
>> static const struct rkvdec_variant vdpu381_variant =3D {
>> .coded_fmts =3D vdpu381_coded_fmts,
>> .num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
>> @@ -1691,6 +1790,10 @@ static const struct of_device_id =
of_rkvdec_match[] =3D {
>> .compatible =3D "rockchip,rk3399-vdec",
>> .data =3D &rk3399_rkvdec_variant,
>> },
>> + {
>> + .compatible =3D "rockchip,rk3568-vdec",
>> + .data =3D &vdpu346_variant,
>> + },
>> {
>> .compatible =3D "rockchip,rk3588-vdec",
>> .data =3D &vdpu381_variant,



