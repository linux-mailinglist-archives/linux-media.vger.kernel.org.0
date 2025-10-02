Return-Path: <linux-media+bounces-43635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D29BB3E81
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 14:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F02919C7EA3
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 12:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAF33101D0;
	Thu,  2 Oct 2025 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="czOtJEs5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA91230CD84
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759408685; cv=none; b=aZyhBmJ4OEKAFrUuabK784EpmohTfs1b+p5iBn1AJpalgKObtl+bSx9Pcx+eK2sJsOYsuYWUDwMMgGyFLNdIh4/KIyBNu+ozW8EYLMkrhFeAgeRdQMUuFM8hWKMc7gWqHWjMm9fuynQrBggPj4bC1UrRXXMDaBfH2JCgU+ygD4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759408685; c=relaxed/simple;
	bh=0d4GnoqxtkOwWQrPiHjtNf6Gn71YfqDC+uHjCJZ31cw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T/rpoSufikAspUT7xU2rWfw4wiA0Y/9sFX9Usw1qEUvnCJNrRcVWQiMw6d80kYEGG4XCJdxDAtOOoNuuA0Dmt7TpQTm3W07EuM51Wtttxl0k5vHlZ+pji96aoJGiGVmCPNPR7zQdPEUx9LWsalGSAxJs+Vf9Idl0iKcenyUyljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=czOtJEs5; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7ea50f94045so23362856d6.1
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 05:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759408682; x=1760013482; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NHfRQ+iuxKkzwVBnfyZ6vWnoqN5WJp/4cKj2bT9r2oU=;
        b=czOtJEs5xzHUnZDTRsJw6agtIa7Fv9iNVKysxJb5DAxbjJ68HE+SeWnK1j/YqKFzFe
         2CpXFQzPYO6gUQIwpx2P/S8iZFldAY/W//w/w2zxshStQ+wxDSH9kqZzxJp9k2rGBi7W
         dWdJgBQ0xJbYxZyXN3TwgecsZgnY8WxYzBm1djQYKFVZQlNV0yYrPPeT2S1xTnuFjUC/
         5ixnmgzRKta0WEY7KpTOxIvl1Z1FVqsp0bA4MzlnkOqyVtOwbwZznyDv5fSet630hZmu
         hMLkEB+UQ10wUI0GaHrlrYVvZWzugYyG5vHH1f3fKwQPo/6l1t4G7VrrjNlAtuPAfxJ2
         9Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408682; x=1760013482;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHfRQ+iuxKkzwVBnfyZ6vWnoqN5WJp/4cKj2bT9r2oU=;
        b=bzUXgLzw6rKVSX2XwfAM6gUmz0AfiqQcgu1uLHHh6MyCSv9iUweY3VYmhTg7gWJDSp
         9rOaE71oh/doO78VbW8DxnTi/BRGkV8Ks/U4jyw6QsRrkfMZqozoH5AAKaxMnx1M1/yP
         0ccXI5vt6ThX5MNds/uEGQW2c4TTDUYoEKOrygWwKLTGWzkD5uXNGTeHvdMBOlVi2Ykt
         YXKfsbwYLtNs3v/C9Hv3VBzPtDGVMkUBBZxzITB2lag21XDJ01YExk7hPxOzl5l07Bor
         NCITqg92uUfIugeOiXgvSSLz9ZkKb5aoaaIOIhnCxYE/JM7XEHnEgnOEohUpDDG5GHHC
         ppqg==
X-Gm-Message-State: AOJu0YyCNhvCxZNhOwlF6GoLSNj8/25aXgT1k0vOtm+7YT34zXrjwaPg
	Bqw0dr+RwsVHgzqoUmVkl1GlfInjvBGlvzZHGjjmRbvRofAPWV4a2unGuplFxEfpDQQ=
X-Gm-Gg: ASbGncv/NVAnpKbZm3f8Pyex9q1T2RNnIpyhgAl0O7L/VhrLPYoaZ8S21T2aGk8vAaf
	qvcgcQUapfNwTpSG2feoN4dQ24GIQ4rsnbegbIBD4VxFIoVYDx+TYCAErpD+WNKPiJjWubKrerw
	YVVsRg/+IS0vFBn3Xgw5t/7zxbi25hE0Eagaaq8knsbWouJp0AzgGlTAz34Jm8zTXFrJlHR9QUR
	qh1gUpgI05HaoL6uyRYg0JD0zHWC+fnybVULRF+6BZcnSdn1bH35HQf8dRgiKeJK6Ii8CZ10KTh
	wYnrIyqaY9/FdfpPHJ/L7ckm/iVrG7Lp8fLHSjOIuAtc3IJ4OIEUqy0TchbVoAnxU4ADjVZWX+5
	iHQbsejDnWb6tYxCdHiUPwLeLcnTYLAQfuWWpy1TCALZlDd3xRh/h
X-Google-Smtp-Source: AGHT+IECtCSMYodlKeFTIOb8HiB8SZxVCHzIO6URism5fJlGRY+TVm9sBlQVd3VRXMwFRSiYAn8NFg==
X-Received: by 2002:ad4:5c45:0:b0:84d:5b71:8a99 with SMTP id 6a1803df08f44-878b96f1074mr37155496d6.3.1759408682453;
        Thu, 02 Oct 2025 05:38:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:ebd3::5ac? ([2606:6d00:17:ebd3::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bd783b3esm18801766d6.36.2025.10.02.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:38:01 -0700 (PDT)
Message-ID: <ec3e93e72e326db4e61fed33ade0547935ab6dca.camel@ndufresne.ca>
Subject: Re: [PATCH 5/5] media: iris: Add internal buffer calculation for
 AV1 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bryan O'Donoghue <bod@kernel.org>, Deepa Guthyappa Madivalara	
 <deepa.madivalara@oss.qualcomm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Thu, 02 Oct 2025 08:38:00 -0400
In-Reply-To: <e273f195-fb5e-4b4f-bf97-63ea51ed875f@kernel.org>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
	 <mbltuHnjNkwD91EqWND77oi8XN26tEarsTmT_fLVkZQYkc7-V_RpAVWo8KC8AnzeyV74zXurscVRHHfAL35xFw==@protonmail.internalid>
	 <20251001-av1_irisdecoder-v1-5-9fb08f3b96a0@oss.qualcomm.com>
	 <e273f195-fb5e-4b4f-bf97-63ea51ed875f@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cPfiuid/iXTdUGeROojX"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-cPfiuid/iXTdUGeROojX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 02 octobre 2025 =C3=A0 00:30 +0100, Bryan O'Donoghue a =C3=A9crit=
=C2=A0:
> On 01/10/2025 20:00, Deepa Guthyappa Madivalara wrote:
> > Implement internal buffer count and size calculations for AV1 decoder.
> >=20
> > Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcom=
m.com>
> > ---
> > =C2=A0 drivers/media/platform/qcom/iris/iris_buffer.h=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 .../platform/qcom/iris/iris_hfi_gen2_command.c=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 -
> > =C2=A0 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 255 +++++++=
+++++++++++++-
> > =C2=A0 drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 105 +++++++=
++
> > =C2=A0 4 files changed, 357 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/m=
edia/platform/qcom/iris/iris_buffer.h
> > index 5ef365d9236c7cbdee24a4614789b3191881968b..75bb767761824c4c02e0df9=
b765896cc093be333 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> > @@ -27,6 +27,7 @@ struct iris_inst;
> > =C2=A0=C2=A0 * @BUF_SCRATCH_1: buffer to store decoding/encoding contex=
t data for HW
> > =C2=A0=C2=A0 * @BUF_SCRATCH_2: buffer to store encoding context data fo=
r HW
> > =C2=A0=C2=A0 * @BUF_VPSS: buffer to store VPSS context data for HW
> > + * @BUF_PARTIAL: buffer for AV1 IBC data
> > =C2=A0=C2=A0 * @BUF_TYPE_MAX: max buffer types
> > =C2=A0=C2=A0 */
> > =C2=A0 enum iris_buffer_type {
> > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b=
/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > index e3a8b031b3f191a6d18e1084db34804a8172439c..000bf75ba74ace5e1058591=
0cda02975b0c34304 100644
> > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > @@ -488,7 +488,6 @@ static int iris_hfi_gen2_set_linear_stride_scanline=
(struct iris_inst *inst, u32
> >=20
> > =C2=A0 static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 pl=
ane)
> > =C2=A0 {
> > -	struct iris_inst_hfi_gen2 *inst_hfi_gen2 =3D to_iris_inst_hfi_gen2(in=
st);
> > =C2=A0=C2=A0	u32 port =3D iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VI=
DEO_OUTPUT_MPLANE);
> > =C2=A0=C2=A0	u32 tier =3D inst->fw_caps[TIER].value;
> >=20
> > diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drive=
rs/media/platform/qcom/iris/iris_vpu_buffer.c
> > index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..17d3a7ae79e994257d59690=
6cb4c17250a11a0cb 100644
> > --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> > @@ -9,6 +9,14 @@
> > =C2=A0 #include "iris_hfi_gen2_defines.h"
> >=20
> > =C2=A0 #define HFI_MAX_COL_FRAME 6
> > +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT (8)
> > +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH (32)
> > +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT (8)
> > +#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH (16)
> > +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT (4)
> > +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH (48)
> > +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_HEIGHT (4)
> > +#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_UV_TILE_WIDTH (24)
> >=20
> > =C2=A0 #ifndef SYSTEM_LAL_TILE10
> > =C2=A0 #define SYSTEM_LAL_TILE10 192
> > @@ -39,6 +47,31 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32=
 frame_height, u32 num_vpp_p
> > =C2=A0=C2=A0	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, =
num_vpp_pipes);
> > =C2=A0 }
> >=20
> > +static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, =
u32 num_vpp_pipes)
> > +{
> > +	u32 size_yuv, size_bin_hdr, size_bin_res;
> > +
> > +	size_yuv =3D ((frame_width * frame_height) <=3D BIN_BUFFER_THRESHOLD)=
 ?
> > +		((BIN_BUFFER_THRESHOLD * 3) >> 1) :
> > +		((frame_width * frame_height * 3) >> 1);
> > +	size_bin_hdr =3D size_yuv * AV1_CABAC_HDR_RATIO_HD_TOT;
> > +	size_bin_res =3D size_yuv * AV1_CABAC_RES_RATIO_HD_TOT;
> > +	size_bin_hdr =3D ALIGN(size_bin_hdr / num_vpp_pipes,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 DMA_ALIGNMENT) * num_vpp_pipes;
> > +	size_bin_res =3D ALIGN(size_bin_res / num_vpp_pipes,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 DMA_ALIGNMENT) * num_vpp_pipes;
> > +
> > +	return size_bin_hdr + size_bin_res;
> > +}
> > +
> > +static u32 hfi_buffer_bin_av1d(u32 frame_width, u32 frame_height, u32 =
num_vpp_pipes)
> > +{
> > +	u32 n_aligned_h =3D ALIGN(frame_height, 16);
> > +	u32 n_aligned_w =3D ALIGN(frame_width, 16);
> > +
> > +	return size_av1d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipe=
s);
> > +}
> > +
> > =C2=A0 static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_h=
eight, u32 num_vpp_pipes)
> > =C2=A0 {
> > =C2=A0=C2=A0	u32 product =3D frame_width * frame_height;
> > @@ -110,6 +143,20 @@ static u32 hfi_buffer_comv_h265d(u32 frame_width, =
u32 frame_height, u32 _comv_bu
> > =C2=A0=C2=A0	return (_size * (_comv_bufcount)) + 512;
> > =C2=A0 }
>=20
> What's this alignment stuffed onto the end about ?
>=20
> Please guys give these magic numbers meaningful names.

That would be nice, then I'll be able to document that for Hantro AV1 decod=
er
too. It was assumed when we picked the driver that the table was hardware
specific, but if its not, a drivers/media/v4l2-core/v4l2-av1.c is welcome.

>> drivers/media/platform/verisilicon/hantro_hw.h:555=20
static inline size_t
hantro_av1_mv_size(unsigned int width, unsigned int height)
{
	size_t num_sbs =3D hantro_av1_num_sbs(width) * hantro_av1_num_sbs(height);

	return ALIGN(num_sbs * 384, 16) * 2 + 512;
}

>=20
> > +static u32 hfi_buffer_comv_av1d(u32 frame_width, u32 frame_height, u32=
 comv_bufcount)
> > +{
> > +	u32 size;
> > +
> > +	size =3D=C2=A0 2 * ALIGN(MAX(((frame_width + 63) / 64) *
> > +		((frame_height + 63) / 64) * 512,

This looks like div_round_up()  ?

> > +		((frame_width + 127) / 128) *
> > +		((frame_height + 127) / 128) * 2816),
> > +		DMA_ALIGNMENT);
> > +	size *=3D comv_bufcount;
>=20
>=20
> I'm sure this calculation is right and produces the correct value in all=
=20
> instances - probably anyway but also does it ?
>=20
> It is not obvious looking at this code that it is obviously correct.
>=20
> I have a similar comment for alot of these Iris patches - we end up with=
=20
> highly complex calculations using magic numbers which my guess would be=
=20
> even people immersed in the firmware/driver/silicon development have a=
=20
> hard time looking at and "just knowing" the code is correct.
>=20
> Please reduce these calculations down to some kind of define that - for=
=20
> example an intelligent programmer - an oxymoron of a term I accept -=20
> could read the code and actually understand what is going on.
>=20
> That programmer might even be yourself. You should be able to come along=
=20
> in two, five, eight years time, look at a code snippet and pretty much=
=20
> understand what it is doing and why without having to have a deep=20
> epiphany when doing it.
>=20
> These complex clauses stuffed with magic numbers and sometimes bitshfts=
=20
> with a few alignments thrown in for good measure are inscrutable.

I agree with this, when the driver is not from the hardware maker, this can=
 be
justified, but since you have full access to the documentation and probably=
 can
ask the designers, it would be nicer to replace 64, 128, 512 and 2816 by na=
med
macro or const. Its not a blame, many drivers are like this already.

Nicolas

>=20
> > +	return size;
> > +}
> > +
> > =C2=A0 static u32 size_h264d_bse_cmd_buf(u32 frame_height)
> > =C2=A0 {
> > =C2=A0=C2=A0	u32 height =3D ALIGN(frame_height, 32);
> > @@ -174,6 +221,20 @@ static u32 hfi_buffer_persist_h264d(void)
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 DMA_ALIGNMENT);
> > =C2=A0 }
> >=20
> > +static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 =
total_ref_count)
> > +{
> > +	u32 comv_size, size;
> > +
> > +	comv_size =3D=C2=A0 hfi_buffer_comv_av1d(max_width, max_height, total=
_ref_count);
> > +	size =3D ALIGN((SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA +
> > +	AV1D_NUM_HW_PIC_BUF * (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM) +
> > +	AV1D_NUM_FRAME_HEADERS * (SIZE_AV1D_FRAME_HEADER +
> > +	2 * SIZE_AV1D_PROB_TABLE) + comv_size + HDR10_HIST_EXTRADATA_SIZE +
> > +	SIZE_AV1D_METADATA * AV1D_NUM_HW_PIC_BUF), DMA_ALIGNMENT);
> > +
> > +	return ALIGN(size, DMA_ALIGNMENT);
> > +}
> > +
> > =C2=A0 static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_=
height, u32 num_vpp_pipes)
> > =C2=A0 {
> > =C2=A0=C2=A0	u32 size_bse =3D size_h264d_bse_cmd_buf(frame_height);
> > @@ -459,6 +520,148 @@ static u32 hfi_buffer_line_h264d(u32 frame_width,=
 u32 frame_height,
> > =C2=A0=C2=A0	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
> > =C2=A0 }
> >=20
> > +static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_h=
eight)
> > +{
> > +	u32 y_width, y_width_a =3D 128;
> > +
> > +	y_width =3D ALIGN(frame_width, y_width_a);
> > +
> > +	return (256 * ((y_width + 31) / 32 + (AV1D_MAX_TILE_COLS - 1)));
> > +}
> > +
> > +static u32 size_av1d_lb_opb_wr1_tp10_ubwc(u32 frame_width, u32 frame_h=
eight)
> > +{
> > +	u32 y_width, y_width_a =3D 256;
> > +
> > +	y_width =3D ALIGN(frame_width, 192);
> > +	y_width =3D ALIGN(y_width * 4 / 3, y_width_a);
> > +
> > +	return (256 * ((y_width + 47) / 48 + (AV1D_MAX_TILE_COLS - 1)));
>=20
> y_width is a thing times 4 divided by 3 aligned to 192.
>=20
> OK
>=20
> Then we return 256 * ((y_width + 47?) / 48 + (A_DEFINE_NICE - 1)));
>=20
> 47 ? The magic number in the routine above is 31.
>=20
> I don't think I'd be comfortable giving an RB for this. You guys need to=
=20
> take steps to make your code more digestable - zapping the complex=20
> bit-shifts and magic numbers.
>=20
> I don't see how a reviewer can really be expected to fit this into their=
=20
> head and say "yep LGTM" needs to be decoded both for the sake of the=20
> reviewer and for future coders, perhaps even future you trying to figure=
=20
> out where the bug is..
>=20
> ---
> bod

--=-cPfiuid/iXTdUGeROojX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN5yKAAKCRDZQZRRKWBy
9GM5AP9PQ+96ubSTSmSoYKcEFZCqxdJf2kQ0fNvVju9/TUwmZwD/V7e+K4h1x6zM
cjQ68tEKISQ5BcqGwLuPHsxOmUHKaQI=
=5wKo
-----END PGP SIGNATURE-----

--=-cPfiuid/iXTdUGeROojX--

