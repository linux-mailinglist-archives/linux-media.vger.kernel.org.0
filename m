Return-Path: <linux-media+bounces-10568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F38B8FDA
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 20:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1319284084
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 18:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24031607B4;
	Wed,  1 May 2024 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="R2lImR6M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5715146D53
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714589211; cv=none; b=nIByDgUcr8Yt0OX/8+YS9fNIKqke55dGPgg+KsUPp9MljCe6k8qA3ECHFfwJEmi4suRHH6jeNKiQa5djQz7JVJT9JYFOO0rGM9/DOAl5XzgL8asqZjXZVgbqUIvt8AqvppzCREtX6n6OXGZy9Vm4skhu/LdQAjPxAKxu+CX2/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714589211; c=relaxed/simple;
	bh=ux7+SqAdbRTtDx1gmbLxYGdmF1JS5Qkzy1TZr0bcy/0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j7amjiUrZA7ZODk6MuvmILSdl4T4izvWBWn24agQOrA66IBjQ40VJ3bnj2f/MxgNVdiLapFr3LGksItXJ29PhL4tBWrDJP1aNY/Jtfg0uTN0Y5UXFzXZLe3Ho0xmom5h1O7S87Fv3Mv6YmTPMr3sWA77goejKs59ky8+11Pv6Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=R2lImR6M; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5aa28cde736so4578758eaf.1
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 11:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1714589209; x=1715194009; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sjnTK7sX+orTt833c6yQg86g6degsgrMKlZ028YznqA=;
        b=R2lImR6MPGrOrDw2fHKFuJsmaYTBRngsDKHaFeKg850o1GYMm7Kibf+Z0V1RAhJG78
         UNfmM7EtZQqKTfBiVAY8oZ1DOkIf+CPWs8Srk34l/WJNU3stQjdYKAUnyDVMqLQt+ria
         /zp5TzdKUsWQRFdlLPqRX2XpT0x0mtENOVZdV1VqX+P+7rjdIyeOX3EWCeITAKqnX9QW
         FxweYTCLIe+2K/w02s63sZR5J7U0vd8Vk3Q374AYWDVcwBK/ziBaCqx4Lb9kTEEVEV8b
         hSpuIytiS0A9s2ikqCWReNbtq3LfQ3FrErEVQH/Ug3Gn+KJoQl9VpwFwCx/IOYs997cs
         nS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714589209; x=1715194009;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjnTK7sX+orTt833c6yQg86g6degsgrMKlZ028YznqA=;
        b=Q+62nwOyU2KIS5J8kn50ixTQREQ7MXoFeXi7fc5aVo3cmgbdZANk8tmPUqaeA00Ie0
         42izvHnH1KPkJiHE2DmrPsZGQsIc6K8s9IO8xfPnlg7XMQO3DiYOVGj94s59Rs3Zs8vH
         XsZe4puEE2lStw1sRap0NMe8tlwWLsjx2HVEz5dpbq0vswdCnV0RdEKf7xMcFRgXE+br
         bIfHfVMeYfYb+4D3bdRxwhT8gf4n7Zh0JwgVwFQZetTq9vAIkNgRwI8q9cIOua5hSdek
         U12bpIn2q+L8Brb24OrOOXyNWaXCp55haBzdj0/eimYOU60zO3UZSBfxie8vd2SdV0b9
         OWAA==
X-Gm-Message-State: AOJu0Yy9//ZQyLbLx+26oE4p929Tu7kerKUYKWQRBAImZmQ33CIp6t3u
	ef8BaBmX64JwhZ0j/YD5Ge4qek36fg+2rJbkVp22V8BBBAAqp0BE/HIMCnLQRJo=
X-Google-Smtp-Source: AGHT+IFikq9imwO8d9lct9bJIy4edgbPj9z+SVNTloqiU5wfpCOSN2nB05I6MpwyMp2HWtWuFeBH/w==
X-Received: by 2002:a05:6358:290b:b0:183:fb12:39f6 with SMTP id y11-20020a056358290b00b00183fb1239f6mr4788968rwb.14.1714589208903;
        Wed, 01 May 2024 11:46:48 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id cs18-20020ad44c52000000b006a0f4d06452sm678689qvb.88.2024.05.01.11.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 11:46:48 -0700 (PDT)
Message-ID: <c9517c20d094aec91f02dfbc70fd582251338436.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/4] media: chips-media: wave5: Support SPS/PPS
 generation for each IDR
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, lafley.kim@chipsnmedia.com, b-brnich@ti.com, 
	jackson.lee@chipnsmedia.com, "Jackson.lee" <jackson.lee@chipsnmedia.com>
Date: Wed, 01 May 2024 14:46:47 -0400
In-Reply-To: <20240430013900.187-2-nas.chung@chipsnmedia.com>
References: <20240430013900.187-1-nas.chung@chipsnmedia.com>
	 <20240430013900.187-2-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 30 avril 2024 =C3=A0 10:38 +0900, Nas Chung a =C3=A9crit=C2=A0:
> From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
>=20
> Provide a control to toggle (0 =3D off / 1 =3D on), whether the SPS and
> PPS are generated for every IDR.
>=20
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../platform/chips-media/wave5/wave5-hw.c     | 19 +++++++++++++++----
>  .../chips-media/wave5/wave5-vpu-enc.c         |  7 +++++++
>  .../platform/chips-media/wave5/wave5-vpuapi.h |  1 +
>  3 files changed, 23 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/driver=
s/media/platform/chips-media/wave5/wave5-hw.c
> index 2d82791f575e..fff6e66b66e4 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -23,6 +23,15 @@
>  #define FEATURE_AVC_ENCODER		BIT(1)
>  #define FEATURE_HEVC_ENCODER		BIT(0)
> =20
> +#define ENC_AVC_INTRA_IDR_PARAM_MASK	0x7ff
> +#define ENC_AVC_INTRA_PERIOD_SHIFT		6
> +#define ENC_AVC_IDR_PERIOD_SHIFT		17
> +#define ENC_AVC_FORCED_IDR_HEADER_SHIFT		28
> +
> +#define ENC_HEVC_INTRA_QP_SHIFT			3
> +#define ENC_HEVC_FORCED_IDR_HEADER_SHIFT	9
> +#define ENC_HEVC_INTRA_PERIOD_SHIFT		16
> +
>  /* Decoder support fields */
>  #define FEATURE_AVC_DECODER		BIT(3)
>  #define FEATURE_HEVC_DECODER		BIT(2)
> @@ -1601,12 +1610,14 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *i=
nst)
> =20
>  	if (inst->std =3D=3D W_AVC_ENC)
>  		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, p_param->intra_qp=
 |
> -				((p_param->intra_period & 0x7ff) << 6) |
> -				((p_param->avc_idr_period & 0x7ff) << 17));
> +				((p_param->intra_period & ENC_AVC_INTRA_IDR_PARAM_MASK) << ENC_AVC_I=
NTRA_PERIOD_SHIFT) |
> +				((p_param->avc_idr_period & ENC_AVC_INTRA_IDR_PARAM_MASK) << ENC_AVC=
_IDR_PERIOD_SHIFT) |
> +				(p_param->forced_idr_header_enable << ENC_AVC_FORCED_IDR_HEADER_SHIF=
T));
>  	else if (inst->std =3D=3D W_HEVC_ENC)
>  		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
> -			      p_param->decoding_refresh_type | (p_param->intra_qp << 3) |
> -				(p_param->intra_period << 16));
> +			      p_param->decoding_refresh_type | (p_param->intra_qp << ENC_HEVC=
_INTRA_QP_SHIFT) |
> +			      (p_param->forced_idr_header_enable << ENC_HEVC_FORCED_IDR_HEADE=
R_SHIFT) |
> +			      (p_param->intra_period << ENC_HEVC_INTRA_PERIOD_SHIFT));
> =20
>  	reg_val =3D (p_param->rdo_skip << 2) |
>  		(p_param->lambda_scaling_enable << 3) |
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index a45a2f699000..a23908011a39 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1061,6 +1061,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *c=
trl)
>  	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
>  		inst->enc_param.entropy_coding_mode =3D ctrl->val;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
> +		inst->enc_param.forced_idr_header_enable =3D ctrl->val;
> +		break;
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>  		break;
>  	default:
> @@ -1219,6 +1222,7 @@ static void wave5_set_enc_openparam(struct enc_open=
_param *open_param,
>  		else
>  			open_param->wave_param.intra_refresh_arg =3D num_ctu_row;
>  	}
> +	open_param->wave_param.forced_idr_header_enable =3D input.forced_idr_he=
ader_enable;
>  }
> =20
>  static int initialize_sequence(struct vpu_instance *inst)
> @@ -1701,6 +1705,9 @@ static int wave5_vpu_open_enc(struct file *filp)
>  			  0, 1, 1, 0);
>  	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
>  			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
> +	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> +			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
> +			  0, 1, 1, 0);
> =20
>  	if (v4l2_ctrl_hdl->error) {
>  		ret =3D -ENODEV;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index edc50450ddb8..554c40b2e002 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -566,6 +566,7 @@ struct enc_wave_param {
>  	u32 lambda_scaling_enable: 1; /* enable lambda scaling using custom GOP=
 */
>  	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 tran=
sform */
>  	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
> +	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR f=
rame */
>  };
> =20
>  struct enc_open_param {


