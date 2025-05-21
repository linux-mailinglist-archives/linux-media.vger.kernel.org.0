Return-Path: <linux-media+bounces-33053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D63ABFCF1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 20:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104C216B194
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 18:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AB628F511;
	Wed, 21 May 2025 18:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="aymjgJ1v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC437289821
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747852796; cv=none; b=UeNS0cNRjs7fHsRd0L71a9gRbWXEH+kd9teSpp7HoxJbV7VA5xlRTREUvy8mqYCyq/0T6JqG5QeAvsc1hCAPiEgAQmGb4x25GKYuWPG5ShGUma2ej+TvTmYAEQlxR9+z4USdZs/FqT6DKMHUXaor7zSNIxEDf6IWRbA99zkTdjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747852796; c=relaxed/simple;
	bh=t78CBbtKx4VCyGVqyGKwmC1MBF16ubBxQ702/ru36O4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WyhR9OA/X4basN4Wg3XXbuE628IF0rb25X4yesqNIjwOT4hJ7VqcoI+L/pL+1ibGVo10KdtsCYFcY+EOH8m5DJdkk7qYt+Rs8npfYMMsSTX/aXV34WjWqCKhwJRSmA9GitD+uiGWeEKzetYNA4BQZugy/FhywSZ6LrkkbB5BJOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=aymjgJ1v; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5f720c717so959852785a.0
        for <linux-media@vger.kernel.org>; Wed, 21 May 2025 11:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747852793; x=1748457593; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C9hN/ALYj6MAmLNmuqeaYYS+ymrl+13ez5PlAjoRPF8=;
        b=aymjgJ1vTf73h4tOmhLcN6n6POy4l2Yl7vIGEdSkjSmBc6lGu0e4DKk7srjpPmNttA
         HBcSsXJd9rEYOVc/2aIOqgE2lwbV+4U4Ru/P6xWm+uTc9SdqzFp9uavehznqLjWZVWdb
         3b1LcQPUWgEdXoK/jMalGOIeKaT1WAMldI6rtqnuswcPKMSQxyceeB4Nm+tvj+rbrKXG
         ZaCZPxO3dQjq2BqHR8DGkslM8yi2Xw560RUrv3ZexJGohIRnFqZe4GLLr17F6PQn1vd8
         nRRIoP7yvfTFUclyjfmKuobC2ojwJko/SMf6DlN7x9GljSawM7IPUjisdDawL+uiq2xV
         IbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747852793; x=1748457593;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9hN/ALYj6MAmLNmuqeaYYS+ymrl+13ez5PlAjoRPF8=;
        b=N3M91rTdzMldmVfbXsS4f/43AkdtYQ+FOj9V906NUcdF4P3FhRcbrZP4ImGLmL9WaH
         yo9pAFJASBJi2UOGtVpGy/Jkk9AZ1cILbmxXumMyFf+qiIccI1mclRnjY2eLAtt4+MqG
         vjFbBiqW0RA/MFM9dPPhVoEOvldRkUw1K4bNg6On9yJPEggM/iz0BHXIXM0hh13MS6UA
         xd//VeZNy72+8VaxwGK0WRK8YE1vWMRobTah6jvyLLXJHVyqGA2yaJJ4GR2avWvfLY1n
         v5BNcVpgTQr9TtOrESh7vPrV9Z9yiFmJbP7dhpyvw7CpDUznMEGEAodHc5eSE4tHTa4B
         133Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBKrJ3ke7TAhXCzYPVu4BntavjvNu2oEX1y3dCsTUUx9Jwo5wJzE7pr89+8VXGJHpv+Dt+MoLfCLmkwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzASToUVxpKq5rt8IdCX+q8yTtSXP4jlV1ia8/vlwd1CUWKrKfC
	RdXrVdV4vYD47KYdd1HJYnLnnCoAJ1AL53ZqyBr3zo+GRTFr0y+kZxCeprbYSmHt3JY=
X-Gm-Gg: ASbGncvQ3KEMDfRzj6TlP8vKSKB30D6a+uroM6NprJ7EercmZYZXnz726a0VmmhJz25
	TW4qTCVrtqtkONT6G/TxpW3Mxtf6WNfGYfSlpMts0Zl/Xn0xObBuahbSpzeDMJeg8Jy5JiOMcvl
	DSAYA+hX1hR1KgtKx7dReiLtUMAkwZPZhqgmmY0CRLJxKiYcI8DIX7ZRelJTlkqM7fLKKBN4rS0
	F8SMdLT7YsELaBskJIMm8y7ClIINyZS+bRBDMSgTG7SlgMlQSzWya3DSNfgXcW+pgIwQm3b5JIC
	5irv3cid65ga1HMyIpqhpmGZh7vUo901nJjagDmnhJHVA6kZISZekrvM
X-Google-Smtp-Source: AGHT+IEH1yg96f+6LtDU7dk/LUCmzgUoLgGpjjtmworILuCaY55up0WZsaGhvzPy17yVEqZT5x/cRQ==
X-Received: by 2002:a05:620a:1982:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7cd46af8c77mr3443038785a.8.1747852792554;
        Wed, 21 May 2025 11:39:52 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bc2dbsm913992085a.15.2025.05.21.11.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 11:39:52 -0700 (PDT)
Message-ID: <0f751cf4a8998b6c6b9046d4e1cb25646709f75a.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: amphion: Add H264 and HEVC profile and level
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Wed, 21 May 2025 14:39:51 -0400
In-Reply-To: <36d644aa-5143-4a5a-a01e-a67792288ba3@oss.nxp.com>
References: <20250512020137.211-1-ming.qian@oss.nxp.com>
	 <3e794e17ab846e29fb5922dc94b969b8cf9334a8.camel@ndufresne.ca>
	 <36d644aa-5143-4a5a-a01e-a67792288ba3@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mercredi 21 mai 2025 =C3=A0 09:23 +0800, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
>=20
> Hi Nicolas,
>=20
> On 2025/5/21 5:04, Nicolas Dufresne wrote:
> > Hi Ming,
> >=20
> > got one final question below...
> >=20
> > Le lundi 12 mai 2025 =C3=A0 10:01 +0800, ming.qian@oss.nxp.com=C2=A0a =
=C3=A9crit :
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > >=20
> > > For format H264 and HEVC, the firmware can report the parsed profile =
idc
> > > and level idc to driver, these information may be useful.
> > > Implement the H264 and HEVC profile and level control to report them.
> > >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > > v4
> > > - Fix a building warning reported by kernel test robot
> > >=20
> > > v3
> > > - Check H264 Constrained Baseline Profile
> > > - Check H264 Level 1b
> > > - Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH
> > > - Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH
> > >=20
> > > v2
> > > - Add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
> > > ---
> > > =C2=A0 drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 59 +++++++++
> > > =C2=A0 drivers/media/platform/amphion/vpu_defs.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 ++
> > > =C2=A0 drivers/media/platform/amphion/vpu_helpers.c | 123 +++++++++++=
++++++++
> > > =C2=A0 drivers/media/platform/amphion/vpu_helpers.h |=C2=A0=C2=A0 7 +=
+
> > > =C2=A0 drivers/media/platform/amphion/vpu_malone.c=C2=A0 |=C2=A0=C2=
=A0 5 +-
> > > =C2=A0 5 files changed, 205 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/pl=
atform/amphion/vdec.c
> > > index 85d518823159..55067d9405c2 100644
> > > --- a/drivers/media/platform/amphion/vdec.c
> > > +++ b/drivers/media/platform/amphion/vdec.c
> > > @@ -232,6 +232,35 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
> > > =C2=A0=C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
> > > =C2=A0=C2=A0			=C2=A0 0, 1, 1, 0);
> > > =C2=A0=20
> > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_PRO=
FILE,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE=
_MULTIVIEW_HIGH,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_H264=
_PROFILE_BASELINE) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE=
_MAIN);
> > > +
> > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_LEV=
EL,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6=
_2,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4=
_0);
> > > +
> > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_PRO=
FILE,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE=
_MAIN_10,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_HEVC=
_PROFILE_MAIN) |
> > > +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE=
_MAIN);
> > > +
> > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_LEV=
EL,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_6=
_2,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_4=
);
> > > +
> > > =C2=A0=C2=A0	ctrl =3D v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ct=
rl_ops,
> > > =C2=A0=C2=A0				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
> > > =C2=A0=C2=A0	if (ctrl)
> > > @@ -1166,6 +1195,35 @@ static void vdec_clear_slots(struct vpu_inst *=
inst)
> > > =C2=A0=C2=A0	}
> > > =C2=A0 }
> > > =C2=A0=20
> > > +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32=
 val)
> > > +{
> > > +	struct v4l2_ctrl *ctrl =3D v4l2_ctrl_find(&inst->ctrl_handler, id);
> > > +
> > > +	if (ctrl)
> > > +		v4l2_ctrl_s_ctrl(ctrl, val);
> > > +}
> > > +
> > > +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, st=
ruct vpu_dec_codec_info *hdr)
> > > +{
> > > +	switch (inst->out_format.pixfmt) {
> > > +	case V4L2_PIX_FMT_H264:
> > > +	case V4L2_PIX_FMT_H264_MVC:
> > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_profile(hdr));
> > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_level(hdr));
> > > +		break;
> > > +	case V4L2_PIX_FMT_HEVC:
> > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_profile(hdr));
> > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_level(hdr));
> > > +		break;
> > > +	default:
> > > +		return;
> > > +	}
> > > +}
> > > +
> > > =C2=A0 static void vdec_event_seq_hdr(struct vpu_inst *inst, struct v=
pu_dec_codec_info *hdr)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	struct vdec_t *vdec =3D inst->priv;
> > > @@ -1189,6 +1247,7 @@ static void vdec_event_seq_hdr(struct vpu_inst =
*inst, struct vpu_dec_codec_info
> > > =C2=A0=C2=A0	vdec_init_crop(inst);
> > > =C2=A0=C2=A0	vdec_init_mbi(inst);
> > > =C2=A0=C2=A0	vdec_init_dcp(inst);
> > > +	vdec_update_v4l2_profile_level(inst, hdr);
> > > =C2=A0=C2=A0	if (!vdec->seq_hdr_found) {
> > > =C2=A0=C2=A0		vdec->seq_tag =3D vdec->codec_info.tag;
> > > =C2=A0=C2=A0		if (vdec->is_source_changed) {
> > > diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/medi=
a/platform/amphion/vpu_defs.h
> > > index 428d988cf2f7..f56245ae2205 100644
> > > --- a/drivers/media/platform/amphion/vpu_defs.h
> > > +++ b/drivers/media/platform/amphion/vpu_defs.h
> > > @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
> > > =C2=A0=C2=A0	u32 decoded_height;
> > > =C2=A0=C2=A0	struct v4l2_fract frame_rate;
> > > =C2=A0=C2=A0	u32 dsp_asp_ratio;
> > > +	u32 profile_idc;
> > > =C2=A0=C2=A0	u32 level_idc;
> > > =C2=A0=C2=A0	u32 bit_depth_luma;
> > > =C2=A0=C2=A0	u32 bit_depth_chroma;
> > > @@ -147,6 +148,17 @@ struct vpu_dec_codec_info {
> > > =C2=A0=C2=A0	u32 mbi_size;
> > > =C2=A0=C2=A0	u32 dcp_size;
> > > =C2=A0=C2=A0	u32 stride;
> > > +	union {
> > > +		struct {
> > > +			u32 constraint_set5_flag : 1;
> > > +			u32 constraint_set4_flag : 1;
> > > +			u32 constraint_set3_flag : 1;
> > > +			u32 constraint_set2_flag : 1;
> > > +			u32 constraint_set1_flag : 1;
> > > +			u32 constraint_set0_flag : 1;
> > > +		};
> > > +		u32 constraint_set_flags;
> >=20
> > Shouldn't this be u8 all over to match the fact the firmware reports th=
is over a single byte ?
> >=20
> > Nicolas
> >=20
>=20
> firmware use u32 to transmit message data:
> 	struct vpu_rpc_event_header {
> 		u32 index;
> 		u32 id;
> 		u32 num;
> 	};
>=20
> 	struct vpu_rpc_event {
> 		struct vpu_rpc_event_header hdr;
> 		u32 data[128];
> 	};
>=20
> And in amphion vpu decoder firmware 1.10.0, it increase the data number o=
f
> SEQ_HDR_FOUND event from 28 to 29. the constraint_set_flags is stored in
> the data[28], so although only 6 bits are used, u32 is still used here.
>=20
> 	if (pkt->hdr.num > 28)
> 		info->constraint_set_flags =3D pkt->data[28];

Ack, I should have checked the definition instead of assuming. Patch queued=
.

regards
Nicolas

>=20
> Regards,
> Ming
>=20
> > > +	};
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 struct vpu_dec_pic_info {
> > > diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/m=
edia/platform/amphion/vpu_helpers.c
> > > index d12310af9ebc..886d5632388e 100644
> > > --- a/drivers/media/platform/amphion/vpu_helpers.c
> > > +++ b/drivers/media/platform/amphion/vpu_helpers.c
> > > @@ -509,3 +509,126 @@ const char *vpu_codec_state_name(enum vpu_codec=
_state state)
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0	return "<unknown>";
> > > =C2=A0 }
> > > +
> > > +struct codec_id_mapping {
> > > +	u32 id;
> > > +	u32 v4l2_id;
> > > +};
> > > +
> > > +static struct codec_id_mapping h264_profiles[] =3D {
> > > +	{66,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
> > > +	{77,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
> > > +	{88,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
> > > +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH}
> > > +};
> > > +
> > > +static struct codec_id_mapping h264_levels[] =3D {
> > > +	{10,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
> > > +	{9,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1B},
> > > +	{11,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
> > > +	{12,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
> > > +	{13,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
> > > +	{20,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
> > > +	{21,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
> > > +	{22,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
> > > +	{30,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
> > > +	{31,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
> > > +	{32,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
> > > +	{40,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
> > > +	{41,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
> > > +	{42,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
> > > +	{50,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
> > > +	{51,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
> > > +	{52,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
> > > +	{60,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
> > > +	{61,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
> > > +	{62,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
> > > +};
> > > +
> > > +static struct codec_id_mapping hevc_profiles[] =3D {
> > > +	{1,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
> > > +	{2,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
> > > +};
> > > +
> > > +static struct codec_id_mapping hevc_levels[] =3D {
> > > +	{30,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
> > > +	{60,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
> > > +	{63,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
> > > +	{90,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
> > > +	{93,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
> > > +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
> > > +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
> > > +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
> > > +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
> > > +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
> > > +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
> > > +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
> > > +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
> > > +};
> > > +
> > > +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, =
u32 array_sz)
> > > +{
> > > +	u32 i;
> > > +
> > > +	if (!array || !array_sz)
> > > +		return 0;
> > > +
> > > +	for (i =3D 0; i < array_sz; i++) {
> > > +		if (id =3D=3D array[i].id)
> > > +			return array[i].v4l2_id;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr)
> > > +{
> > > +	if (!hdr)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * In H.264 Document section A.2.1.1 Constrained Baseline profile
> > > +	 * Conformance of a bitstream to the Constrained Baseline profile i=
s indicated by
> > > +	 * profile_idc being equal to 66 with constraint_set1_flag being eq=
ual to 1.
> > > +	 */
> > > +	if (hdr->profile_idc =3D=3D 66 && hdr->constraint_set1_flag)
> > > +		return V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE;
> > > +
> > > +	return vpu_find_v4l2_id(hdr->profile_idc, h264_profiles, ARRAY_SIZE=
(h264_profiles));
> > > +}
> > > +
> > > +u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr)
> > > +{
> > > +	if (!hdr)
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * In H.264 Document section 7.4.2.1.1 Sequence parameter set data =
semantics
> > > +	 * If profile_idc is equal to 66, 77, or 88 and level_idc is equal =
to 11,
> > > +	 * constraint_set3_flag equal to 1 indicates that the coded video s=
equence
> > > +	 * obeys all constraints specified in Annex A for level 1b
> > > +	 * and constraint_set3_flag equal to 0 indicates that the coded vid=
eo sequence
> > > +	 * obeys all constraints specified in Annex A for level 1.1.
> > > +	 */
> > > +	if (hdr->level_idc =3D=3D 11 && hdr->constraint_set3_flag &&
> > > +	=C2=A0=C2=A0=C2=A0 (hdr->profile_idc =3D=3D 66 || hdr->profile_idc =
=3D=3D 77 || hdr->profile_idc =3D=3D 88))
> > > +		return V4L2_MPEG_VIDEO_H264_LEVEL_1B;
> > > +
> > > +	return vpu_find_v4l2_id(hdr->level_idc, h264_levels, ARRAY_SIZE(h26=
4_levels));
> > > +}
> > > +
> > > +u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr)
> > > +{
> > > +	if (!hdr)
> > > +		return 0;
> > > +
> > > +	return vpu_find_v4l2_id(hdr->profile_idc, hevc_profiles, ARRAY_SIZE=
(hevc_profiles));
> > > +}
> > > +
> > > +u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr)
> > > +{
> > > +	if (!hdr)
> > > +		return 0;
> > > +
> > > +	return vpu_find_v4l2_id(hdr->level_idc, hevc_levels, ARRAY_SIZE(hev=
c_levels));
> > > +}
> > > diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/m=
edia/platform/amphion/vpu_helpers.h
> > > index 0eaddb07190d..6c0554ccf3b3 100644
> > > --- a/drivers/media/platform/amphion/vpu_helpers.h
> > > +++ b/drivers/media/platform/amphion/vpu_helpers.h
> > > @@ -6,6 +6,8 @@
> > > =C2=A0 #ifndef _AMPHION_VPU_HELPERS_H
> > > =C2=A0 #define _AMPHION_VPU_HELPERS_H
> > > =C2=A0=20
> > > +#include "vpu_defs.h"
> > > +
> > > =C2=A0 struct vpu_pair {
> > > =C2=A0=C2=A0	u32 src;
> > > =C2=A0=C2=A0	u32 dst;
> > > @@ -70,4 +72,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptran=
sfers, u32 *pmatrix, u32 *pfu
> > > =C2=A0=20
> > > =C2=A0 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 s=
rc);
> > > =C2=A0 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 d=
st);
> > > +
> > > +u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);
> > > +u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr);
> > > +u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr);
> > > +u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr);
> > > =C2=A0 #endif
> > > diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/me=
dia/platform/amphion/vpu_malone.c
> > > index feca7d4220ed..ba688566dffd 100644
> > > --- a/drivers/media/platform/amphion/vpu_malone.c
> > > +++ b/drivers/media/platform/amphion/vpu_malone.c
> > > @@ -908,7 +908,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_=
rpc_event *pkt,
> > > =C2=A0=C2=A0	info->frame_rate.numerator =3D 1000;
> > > =C2=A0=C2=A0	info->frame_rate.denominator =3D pkt->data[8];
> > > =C2=A0=C2=A0	info->dsp_asp_ratio =3D pkt->data[9];
> > > -	info->level_idc =3D pkt->data[10];
> > > +	info->profile_idc =3D (pkt->data[10] >> 8) & 0xff;
> > > +	info->level_idc =3D pkt->data[10] & 0xff;
> > > =C2=A0=C2=A0	info->bit_depth_luma =3D pkt->data[13];
> > > =C2=A0=C2=A0	info->bit_depth_chroma =3D pkt->data[14];
> > > =C2=A0=C2=A0	info->chroma_fmt =3D pkt->data[15];
> > > @@ -925,6 +926,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_=
rpc_event *pkt,
> > > =C2=A0=C2=A0		info->pixfmt =3D V4L2_PIX_FMT_NV12M_10BE_8L128;
> > > =C2=A0=C2=A0	else
> > > =C2=A0=C2=A0		info->pixfmt =3D V4L2_PIX_FMT_NV12M_8L128;
> > > +	if (pkt->hdr.num > 28)
> > > +		info->constraint_set_flags =3D pkt->data[28];
> > > =C2=A0=C2=A0	if (info->frame_rate.numerator && info->frame_rate.denom=
inator) {
> > > =C2=A0=C2=A0		unsigned long n, d;
> > > =C2=A0=20
> > >=20
> > > base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21

