Return-Path: <linux-media+bounces-30738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A4A9769A
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4700317498D
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC8C28CF69;
	Tue, 22 Apr 2025 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Y3Ao1b+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971F1DF979
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745352931; cv=none; b=KJB1nB7LvvSJufdutYaF2LGPFpIWTd8EscMCBXrCiaShb301jDhvo/YYnEE1SpDRoQNM5HVP5D1nbEO9iNBBs7XEt51XmD2psQhnh5pM/2W7N2GXLHtqffu8F2FCabHhLwo9FsUFsWuGCpgv1MVl/aEbzsZqQIqhHY/Amqk75XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745352931; c=relaxed/simple;
	bh=wNORhVYlgTJse9QfgWQWMbFqYMq1ZPqAa96KFCBdsj8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAuruzcy57LlI4QBRSplDDOdq//eMyPAvxYFQ1Y4yEjKbVNhQqUXD4D9x/GaFq6TFHNzI4WVpjYofsCZZcDjLl6t458PZ9Vcxd/nd6UBt6JWbUuTChb+wun0MHmSrq2MajrXxQeZxj7QpcpaSIkL1r+KcG7DTNbg79cO9CSCnLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Y3Ao1b+g; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5ba363f1aso738536085a.0
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745352928; x=1745957728; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FfIoYR2Hk8OscvFDt1woJsVwZTyVIxPWRqw5VTDHqxU=;
        b=Y3Ao1b+g0tVDH2sqhlHaH72SAFtp9IFMxkZCHDQll6zowN2zaz0uVNbmdz8pDcrLHC
         I/VWjCepH4mnOyzxQSqSVtNGcVwGki/MkSGtLehufiWAB5DSu8oZ5ZuFarpI9m1eERu+
         ogK3vOqZUIxlvdGQIk65O8x7mlHLNTz4viXnd0xtu5ZbjoCp3cxZkyYBLhbAAFdDhJeG
         orTl0kao911wG6lAdgVIBVa8yBn+0U3UvrnmuCwowzbZ2QMOXIYls9M8TjNkPuXtVOEM
         svqAumiylHcS9cy7SrXa1O6N9wIbtD9FaXigsVzYhfpWS5vPvViFOLtGq0bEszmTf4F2
         Ca1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745352928; x=1745957728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfIoYR2Hk8OscvFDt1woJsVwZTyVIxPWRqw5VTDHqxU=;
        b=p3nk7dfZvywIb/ZZcQmRTS7/IPO1nAZKIpIqcQwcX7LBA3W+ABAwU4XBWiOgoUXzVA
         tg3nEzWTM0ywMWkaNNOVMBWKjUsSZnP/PSSIY5+o3BU+OYxCI80Txq4EtIDxp5miUPkK
         y6tlRBPmgiL0UoST+8y9CrVZ1FVhWjlilJgvycpYA8wB9ldwbLdBP5zbjOoRWREQdRu7
         3VvuId3ySnx1vJAjMPA/QQv7idN9XfN6+8rwtvTw0VbhtoN3Fh3OkIxQzda+hKJ32der
         0VHR0yYt+0OoaVEKGN5oBpii/vIGk8r/GQV5WNHylnOwWL9BVVkCgsQ6u0cfa1BJv7jx
         KVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIcRPbugM3fcyGFqXqvYCHtwmrfKSCLXZ6AY7m9iwpMwy9kbzVT6bECohTQFogalnNhNUccCX+o7Bjnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtH2lP41XjccfU0CvZXNSJXTr1Y5b3M0ViA5B0cmkhP4C7vUo
	DnbDrUSz0y6yCT0U7zD0yr7SDDEXVr0Usm2gwALs+GNe/8mZhvuic2/RDn7FEpSjCtPk1bSgSjc
	N1Lc=
X-Gm-Gg: ASbGncspinM8SKkJusyz2mBb7MqGmmet1IZuGFq4dmvUupBf3chNN1AlH7wQ1EGynM1
	0zE5qst61oJ0O6iPDfthvyguxAcc+JeBeTNcs6FN4OxOWtfmIUIK/+/WR1SFxmLsN+ORkSGLRGC
	8S1uq9yj91uGmimffhC02Cidung+38IcNgTaL0PY3KmCRKjnvRbcQZHbQl9jiKz/bDQ/S0eZIV3
	KI4XeBPo6TCs864JjoSytDDLfpfyGCrdUZweHxzpH+pjia8u0i0GwweGhzj8kZYakg7PlwOtn2O
	PtIp+H5JCNBBxqZ8Ces7K6oD8eGP6A4h7mFKyzlOxTzIHc+sB7+7o1gv
X-Google-Smtp-Source: AGHT+IE5UyDb3sP+B1E0k8WlUIn5epHst96b+MCPIWCRdWJrnaIbCMq4o4Z31SsOW5ok7mHv5BAPog==
X-Received: by 2002:a05:620a:1a07:b0:7c7:827b:46bf with SMTP id af79cd13be357-7c928015f8dmr2301315685a.39.1745352928409;
        Tue, 22 Apr 2025 13:15:28 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b6e198sm590055985a.103.2025.04.22.13.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:15:27 -0700 (PDT)
Message-ID: <74eb0589ae54855db1d2024591d501989e30027a.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: amphion: Add H264 and HEVC profile and level
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 16:15:25 -0400
In-Reply-To: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
References: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ming,

Le mardi 10 d=C3=A9cembre 2024 =C3=A0 18:33 +0900, Ming Qian a =C3=A9crit=
=C2=A0:
> From: Ming Qian <ming.qian@nxp.com>
>=20
> For format H264 and HEVC, the firmware can report the parsed profile idc
> and level idc to driver, the information may be useful.
> Implement the H264 and HEVC profile and level control to report them.
>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
> v2
> -- add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
>=20
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 61 +++++++++++++
> =C2=A0drivers/media/platform/amphion/vpu_defs.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A0drivers/media/platform/amphion/vpu_helpers.c | 93 +++++++++++++++++=
+++
> =C2=A0drivers/media/platform/amphion/vpu_helpers.h |=C2=A0 5 ++
> =C2=A0drivers/media/platform/amphion/vpu_malone.c=C2=A0 |=C2=A0 3 +-
> =C2=A05 files changed, 162 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index ca8f7319503a..61d5598ee6a1 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -232,6 +232,37 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
> =C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
> =C2=A0			=C2=A0 0, 1, 1, 0);
> =C2=A0
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_PROFILE=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MUL=
TIVIEW_HIGH,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_H264_PRO=
FILE_BASELINE) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |

You've added it here, but you will never report it, see my comment
below.

> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),

Shall we advertise multiview and stereo ? My impression is that we lack
a mechanism to actually signal the stereo layout, or which view each
buffers came from. I'm thinking, you can can't test it, we should just
fail on these ?

> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BAS=
ELINE);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_PROFILE=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAI=
N_10,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_HEVC_PRO=
FILE_MAIN) |
> +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAI=
N);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
> +
> =C2=A0	ctrl =3D v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
> =C2=A0				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
> =C2=A0	if (ctrl)
> @@ -1166,6 +1197,35 @@ static void vdec_clear_slots(struct vpu_inst *inst=
)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val=
)
> +{
> +	struct v4l2_ctrl *ctrl =3D v4l2_ctrl_find(&inst->ctrl_handler, id);
> +
> +	if (ctrl)
> +		v4l2_ctrl_s_ctrl(ctrl, val);
> +}
> +
> +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct=
 vpu_dec_codec_info *hdr)
> +{
> +	switch (inst->out_format.pixfmt) {
> +	case V4L2_PIX_FMT_H264:
> +	case V4L2_PIX_FMT_H264_MVC:
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_profile(hdr->profil=
e_idc));
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_level(hdr->level_id=
c));
> +		break;
> +	case V4L2_PIX_FMT_HEVC:
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_profile(hdr->profil=
e_idc));
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_level(hdr->level_id=
c));
> +		break;
> +	default:
> +		return;
> +	}
> +}
> +
> =C2=A0static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_de=
c_codec_info *hdr)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> @@ -1189,6 +1249,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *ins=
t, struct vpu_dec_codec_info
> =C2=A0	vdec_init_crop(inst);
> =C2=A0	vdec_init_mbi(inst);
> =C2=A0	vdec_init_dcp(inst);
> +	vdec_update_v4l2_profile_level(inst, hdr);
> =C2=A0	if (!vdec->seq_hdr_found) {
> =C2=A0		vdec->seq_tag =3D vdec->codec_info.tag;
> =C2=A0		if (vdec->is_source_changed) {
> diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/pl=
atform/amphion/vpu_defs.h
> index 428d988cf2f7..606f9d61a265 100644
> --- a/drivers/media/platform/amphion/vpu_defs.h
> +++ b/drivers/media/platform/amphion/vpu_defs.h
> @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
> =C2=A0	u32 decoded_height;
> =C2=A0	struct v4l2_fract frame_rate;
> =C2=A0	u32 dsp_asp_ratio;
> +	u32 profile_idc;
> =C2=A0	u32 level_idc;
> =C2=A0	u32 bit_depth_luma;
> =C2=A0	u32 bit_depth_chroma;
> diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media=
/platform/amphion/vpu_helpers.c
> index d12310af9ebc..108b75ceb4ae 100644
> --- a/drivers/media/platform/amphion/vpu_helpers.c
> +++ b/drivers/media/platform/amphion/vpu_helpers.c
> @@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_codec_stat=
e state)
> =C2=A0	}
> =C2=A0	return "<unknown>";
> =C2=A0}
> +
> +struct codec_id_mapping {
> +	u32 id;
> +	u32 v4l2_id;
> +};
> +
> +static struct codec_id_mapping h264_profiles[] =3D {
> +	{66,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
> +	{77,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
> +	{88,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
> +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
> +	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
> +	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
> +};
> +
> +static struct codec_id_mapping h264_levels[] =3D {
> +	{10,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
> +	{9,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1B},
> +	{11,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
> +	{12,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
> +	{13,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
> +	{20,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
> +	{21,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
> +	{22,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
> +	{30,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
> +	{31,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
> +	{32,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
> +	{40,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
> +	{41,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
> +	{42,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
> +	{50,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
> +	{51,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
> +	{52,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
> +	{60,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
> +	{61,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
> +	{62,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
> +};
> +
> +static struct codec_id_mapping hevc_profiles[] =3D {
> +	{1,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
> +	{2,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
> +};
> +
> +static struct codec_id_mapping hevc_levels[] =3D {
> +	{30,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
> +	{60,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
> +	{63,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
> +	{90,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
> +	{93,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
> +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
> +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
> +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
> +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
> +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
> +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
> +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
> +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
> +};
> +
> +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 =
array_sz)
> +{
> +	u32 i;
> +
> +	if (!array || !array_sz)
> +		return 0;
> +
> +	for (i =3D 0; i < array_sz; i++) {
> +		if (id =3D=3D array[i].id)
> +			return array[i].v4l2_id;
> +	}
> +
> +	return 0;
> +}
> +
> +u32 vpu_get_h264_v4l2_profile(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_profiles));
> +}
> +
> +u32 vpu_get_h264_v4l2_level(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_levels));
> +}
> +
> +u32 vpu_get_hevc_v4l2_profile(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
> +}
> +
> +u32 vpu_get_hevc_v4l2_level(u32 idc)
> +{
> +	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_levels));
> +}
> diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media=
/platform/amphion/vpu_helpers.h
> index 0eaddb07190d..dc5fb1ca2d33 100644
> --- a/drivers/media/platform/amphion/vpu_helpers.h
> +++ b/drivers/media/platform/amphion/vpu_helpers.h
> @@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfer=
s, u32 *pmatrix, u32 *pfu
> =C2=A0
> =C2=A0int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
> =C2=A0int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
> +
> +u32 vpu_get_h264_v4l2_profile(u32 idc);
> +u32 vpu_get_h264_v4l2_level(u32 idc);
> +u32 vpu_get_hevc_v4l2_profile(u32 idc);
> +u32 vpu_get_hevc_v4l2_level(u32 idc);
> =C2=A0#endif
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 4769c053c6c2..5c6b2a841b6f 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_=
event *pkt,
> =C2=A0	info->frame_rate.numerator =3D 1000;
> =C2=A0	info->frame_rate.denominator =3D pkt->data[8];
> =C2=A0	info->dsp_asp_ratio =3D pkt->data[9];
> -	info->level_idc =3D pkt->data[10];
> +	info->profile_idc =3D (pkt->data[10] >> 8) & 0xff;

The data should normally also include the sps_constraint_set1_flag,
which differentiate baseline from constrained-baseline. I would also be
very surprised if the decoders supports ASO/FMO.

Nicolas

> +	info->level_idc =3D pkt->data[10] & 0xff;
> =C2=A0	info->bit_depth_luma =3D pkt->data[13];
> =C2=A0	info->bit_depth_chroma =3D pkt->data[14];
> =C2=A0	info->chroma_fmt =3D pkt->data[15];

