Return-Path: <linux-media+bounces-26238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B49A38C62
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 20:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C8E518931C6
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 19:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC2C237194;
	Mon, 17 Feb 2025 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="iGDDvY0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F038224AE4
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820530; cv=none; b=svBazGJYXeXmV4Du0cSA5LI7mKbIsO5AFa+9//iaMje/suawTNDPpV09BQx77N7pMLQMpZEm8gmvDnz8qDwLsEMD5BQ8Qyt74qVpAcN6J5iNjgK+kf7ktm7sisnUKYWR5jlL8O2Bb/ruuoynMfrxF67PtJYMWAKS/0MEncJhSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820530; c=relaxed/simple;
	bh=8Se1BJZJiElrV3tnKSC6keFdf3UpAPgUA2PzexRT2sM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQabM77Ey1GCGx7XYNw+eDBWKfJ/vbNZ7QrhhNEJq0oMPBreoN9UkG6Rfyq1+d03C4vLCYz0+FBfBae9u20OAKtEbG2g2I0tKw2WrKRITCcHIew6EKP4XxL+PZANipRFQKZ+L1+DLO4VMQTWLPEM9o0maxkdXxxu1UJ5EVbDark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=iGDDvY0U; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7be8f281714so498485185a.1
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 11:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739820528; x=1740425328; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=;
        b=iGDDvY0U78bhWRyRAdEOSaizGAzMIetpqd0IzgQ0YHfqA5JR16xbAfOHVpOw/+0VM2
         RuVssEUPc892WsXLKQaRqKqdI3ReVYGovuD1DETH5+DoXx4d8djmdwQZM28MZ9Fhrtck
         zaeMRhMQgdT1X+sxNVwhhGfrYHHzX73XaeiX0xrWgeT4rsJGjHKEQ/cClSvD82mZB1UF
         fXn38gA4/C0dLJ//V+k8aXIFFJiGNUC1LE0+KmRSy+x7VSu5CI6oODVqTYJLfXi0dYAv
         IsxZVF6sJZxMVrrTDmKbpP6dyxNGTP0zTitoBmjO3a/AjPTVdGg11Ny4vNUXXFivx4IW
         8lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820528; x=1740425328;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=;
        b=PD1AexHRXTtHtQxnkNsKBC0ZYX006RBBTP+KuBW5Sw7WfWmxlbjh9zaVLJaD5mHRTW
         nsHkI22IxAoKBJJGGDSwVc0VQ6PKaShEwLl6Hl8SemHnVFuo1WXLgKSZSTtUymzfgT1n
         oIAGNT1w2plZ+HmZHwixBNWceUxc5LX9YU3MiCl7EFj21sACFv5PpMAOnhSyeOpb57ne
         Lt+jflqIMAT+FvFNxMZx9+s2Qem0htbCJrar6DXagT2UtD6h0OCVYdBmcDxNO56CTjKt
         6n4B1pbl74d/Ak+crNCQ6gvu+3RTBPkxo/pj3jTB/oVeREThOQKCJtz5kNPrvwEVsonz
         Cmlg==
X-Forwarded-Encrypted: i=1; AJvYcCUFD0hLK37lGucNfgkrNi9VeUvR9wU1NgKNugIOgA/KjaozxqwuWUhyOEaVbembPhEfAJqfsJfm9Z7fAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxjYJIn5dKBESRL2dJ9D9nWAr96YoCzaLvjhvqqeyewprpSOsx
	m7UMzGF1p1NNSnlST1IOl2kcYDQeampOoepSmGpj1C9VZ8DzBOAGlqT9jOYi6OA=
X-Gm-Gg: ASbGncsE48NxwX/pyTV+9m43L6ykVQZ8t5bkJ+mjdO8BnhuUzxevs0QfQYKNwqWt+Q7
	quM8ya79Nbqysnt/MbtqBzbcQ/m3QZgv5pgV5akENXtmUGyI/1ZxCZ1ZEdSUCODE4bl2ONm3QvQ
	evVdjnkXn0NYviiwe6pmGHrFgskjxbQFeQZ7zYAKEy5WqIIngl5MQWtvFxKRtmQSRpkF31zj3MU
	RpXat5O3JMJrEYi4JPTsg2AlAEhUiJB9TgbeN73+uesC2nxelTy1C1p6yK3ahsL7hxuCLLz5tMK
	4DQeam+cBH/CQS2HvpkW
X-Google-Smtp-Source: AGHT+IF0M1JuegcbLy3i0Bijjwl67r9LgXH3tketiaHBXEgodxNXXo5qAbFCYzz/X43MZ2CJv0eXEA==
X-Received: by 2002:a05:620a:40c1:b0:7c0:7350:9adb with SMTP id af79cd13be357-7c08a9801b5mr1443794485a.11.1739820527975;
        Mon, 17 Feb 2025 11:28:47 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c096e87af7sm193307485a.79.2025.02.17.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:28:46 -0800 (PST)
Message-ID: <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Hebert <nhebert@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 17 Feb 2025 14:28:45 -0500
In-Reply-To: <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
References: 
	<20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
	 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0
 aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDA
 gQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDi
 cVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA
 8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Ro
 x8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2
 xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRB
 xUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05p
 Y29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQ
 Cgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGl
 xdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMC
 BBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZM
 Zm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG
 5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBU
 CCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOq
 ZEHAs+xabBgknYZIFPU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi Nathan,
>=20
> Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=A9c=
rit=C2=A0:
> > Mediatek devices that support HEVC also support the main still picture
> > profile, but today, the main still picture profile is excluded.
> >=20
> > This removes the skip mask for HEVC, and enables the main still
> > picture profile decoding.
> >=20
> > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > ---
> > On Mediatek devices that support HEVC decoding, HEVC Main Still Picture
> > profile is also supported by the SOC and firmware. However, this
> > capability is turned off in the vcodec driver.
> >=20
> > This removes the code that disables HEVC Main Still Picture profile
> > decoding. Validation of the decoder has been done via V4L2-backed
> > Android CTS tests on an MT8196 device.
>=20
> While its nice to know that you are working on upcoming SoC, we need
> confirmation that this is working on all the upstream stateless
> decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> which I can see has merged support without the linux-firmware file to
> go with it.
>=20
> I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> fix the situation with 8188 in linux-firmware, and CC me.

In case this is useful, we recommend providing fluster scores for the
codec, which in that case runs some public ITU conformance vectors.
Since most of the testing has been done with GStreamer, you may be able
to find old report and confirm it it works. GStreamer does not
currently filter the profile/level (on my todo), so it will try anyway.
IPRED_B_Nokia_3 is the one vector in the base suite that expose that
profile.

resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
  Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25 fps, 1=
200k tbr, 1200k tbn

regards,
Nicolas

>=20
> regards,
> Nicolas
>=20
> > ---
> > =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_statele=
ss.c=C2=A0=C2=A0 | 2 --
> > =C2=A01 file changed, 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec=
_dec_stateless.c
> > index afa224da0f41..d873159b9b30 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teless.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teless.c
> > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_state=
less_controls[] =3D {
> > =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > -			.menu_skip_mask =3D
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > =C2=A0		},
> > =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > =C2=A0	},
> >=20
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> >=20
> > Best regards,
>=20


