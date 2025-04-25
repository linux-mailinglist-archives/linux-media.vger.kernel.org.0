Return-Path: <linux-media+bounces-31083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2446A9D26E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 21:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095D83B173B
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 19:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCD6224256;
	Fri, 25 Apr 2025 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="0rm/lqgP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AAF221F09
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 19:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610792; cv=none; b=PS6BqbKzT021PakM/BexH2GWD+1OACCodlJ9637gtumZSNj5Ut8mHkwMKuUjaBuui+4DsFmp8puq2BvOWmnIyyhSMiXGj2SkJZ4ew9mgQvIJH+ae8O6eZdmMsgk8rJwEkgtPX3UrqR7ITJTg+t+Vx5gl9hpVgODxNoUSbdQFFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610792; c=relaxed/simple;
	bh=Y5C7KPF31bWMAP9UhNg3114GEq0WggQvTKtqWabySFA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oa8nSdVgX8ZSb/2zhfHHwtNEDr834pXsrbnlxhQcxLnS0+8nbRwZTtCXFiWHVIXZxeIJaWFKuQ6SIdKCGcwgJeZhV4sa5k5l4rPLK6YoYrih3+pyrZtqnWsus5mcs4V9bA2eXNs8uZmwhDoI6j4USlDsIl4CBbmXMpzt20sazIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=0rm/lqgP; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476977848c4so34552061cf.1
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745610788; x=1746215588; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wt8B9nTCn0eAZgxc9op2qQJ6BYjG71UbDMrD5GbI4Jg=;
        b=0rm/lqgP+boTNXHEgxuWZ9Lpip1NHa8MxljCPDjVEreg90ktNm7XssIcWBm2caG0Q8
         acA5fDTzp+w44cPnnoghp30SNAe/a8oXDX276O2ZGznT/Vk8PY0NXM5jBUlse/xEjKiP
         Y2qnop5ktmbaVK3sdy2dQ04AdAhmMCGPPbqwDxdw6rUYC/+9pUajZNPH3LZ8XfaOSzZY
         ES4eXmovHB4spDnfOiAJoCe9aSxg8oTBOXXdUMiKMVFN9BE3km40/ONwCdWhf8ON2pwP
         Ygri2lIeCdz8Wp6y9gOTIfgeHRj5zY86BwPVD4l0oRmJsFlXza7Ft4zMY77I0DdvbXY1
         Kwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610788; x=1746215588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wt8B9nTCn0eAZgxc9op2qQJ6BYjG71UbDMrD5GbI4Jg=;
        b=GXhzGq9zgZ2H1gVwDgW3xMHJv8lZk3flOaEScJ8gDekU+K5YMLqoxXEd1R6vOptd2Y
         1cBy4JcjQ7ArpYqqPbjJtks88ydv9py3fQFpIK6nUnVpNz52l1d10IJ31rA3bQaKVUaO
         srd28mrKuiMW0k6jakGQZbjEFaQn3bOSgge6nLR51eZt7rFc1lFIyJmDFF2TwT0yaK5e
         DhZPZqVro9RNerBQ0yJ7LJYNBwXw4d466xdfMpNph8Rkjncg8jiZrOiFZW5Iukh1itni
         qev/l2FQA9yiMbGb0JNXfomDg7TVmLCIq01gEzoTnaGisHreWU5DsT4+KuVTnvWTKEYw
         S3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUGTteq78oB+drGj0qUJ+zLkKpaJ2lm3qz/oLWUQ0fQka33V0jtZXoBbC+5pr2RHu3ejfDt1jbzKQgO3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYetePzjF+ilOybHRcOeNyfNInNbuqGJBkeo0vTQKHJDzY9vD
	dCDvs+wS2wM0Qp4fG56213zoW6+5YZHQJkKMD57e58rGJUtwJgowROQ/YFDMMj8=
X-Gm-Gg: ASbGncupBJhXjS+6CSgcDN6RExkrYEfRrqxqVpaflBamd4L7PKT6uOJc5JmNCXj/1R9
	qMpmys9kL4PJJSVe+XTAXVIayoo0aJc/W3iEN+cghMPFvKJriAy92n6LM2LFwe+PwphFeNsvW3n
	Hg2YNLAKJRG7ldrmojADEDLYH/WlXlVIKFZ97p6ITs+09I+lcP2unkeY5EOG7zc5Wbb686rWsf2
	XUeaYKwg1BixiZiAdFm06i2Od+Qb52AJR3FETTKhEIHGwEN3EAZ6Jb1I8kMF2jv3bL1Gj4rHpjj
	Jqd7Fdz5FKnTCPUwAmEUqTdEU9Fntr/Qu9IRvNpdpbqTFA==
X-Google-Smtp-Source: AGHT+IFMLFuWYiXmXdeMfcqXK9z4q0il2a/+Hb0D4aJrdvIX38onY7UScAxm1896adYcr/O8aKhgHQ==
X-Received: by 2002:ac8:5d8e:0:b0:478:f747:1b7d with SMTP id d75a77b69052e-4801c2c33a9mr49742981cf.6.1745610788509;
        Fri, 25 Apr 2025 12:53:08 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea16932a8sm29078491cf.58.2025.04.25.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:53:08 -0700 (PDT)
Message-ID: <caaa10071d063069a4f479862b38f304c89da21e.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: amphion: Add H264 and HEVC profile and level
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 25 Apr 2025 15:53:07 -0400
In-Reply-To: <a60b84d8-a179-4c33-aed0-1f2ad1857f7b@oss.nxp.com>
References: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
	 <74eb0589ae54855db1d2024591d501989e30027a.camel@ndufresne.ca>
	 <a60b84d8-a179-4c33-aed0-1f2ad1857f7b@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 25 avril 2025 =C3=A0 10:33 +0800, Ming Qian(OSS) a =C3=A9crit=
=C2=A0:
>=20
> Hi Nicolas,
>=20
> On 2025/4/23 4:15, Nicolas Dufresne wrote:
> > Hi Ming,
> >=20
> > Le mardi 10 d=C3=A9cembre 2024 =C3=A0 18:33 +0900, Ming Qian a =C3=A9cr=
it :
> > > From: Ming Qian <ming.qian@nxp.com>
> > >=20
> > > For format H264 and HEVC, the firmware can report the parsed profile =
idc
> > > and level idc to driver, the information may be useful.
> > > Implement the H264 and HEVC profile and level control to report them.
> > >=20
> > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > ---
> > > v2
> > > -- add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
> > >=20
> > > =C2=A0 drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 61 +++++++++++++
> > > =C2=A0 drivers/media/platform/amphion/vpu_defs.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > =C2=A0 drivers/media/platform/amphion/vpu_helpers.c | 93 ++++++++++++=
++++++++
> > > =C2=A0 drivers/media/platform/amphion/vpu_helpers.h |=C2=A0 5 ++
> > > =C2=A0 drivers/media/platform/amphion/vpu_malone.c=C2=A0 |=C2=A0 3 +-
> > > =C2=A0 5 files changed, 162 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/pl=
atform/amphion/vdec.c
> > > index ca8f7319503a..61d5598ee6a1 100644
> > > --- a/drivers/media/platform/amphion/vdec.c
> > > +++ b/drivers/media/platform/amphion/vdec.c
> > > @@ -232,6 +232,37 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
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
> >=20
> > You've added it here, but you will never report it, see my comment
> > below.
> Yes, you're right,
> firmware can't report the sps_constraint_set1_flag yet,
> so we need to request a firmware interface change to report the
> sps_constraint_set1_flag.
>=20
> If we remove PROFILE_CONSTRAINED_BASELINE here, then these streams will
> failed to play with gstreamer.
> If we keep it here, then these stremas can be played, but driver will
> report wrong profile.
>=20
> Maybe we need to change the firmware interface firstly.

Well, all software have bugs, even the firm ones. Just comment about
it.

Perhaps you already said, but does Amphion really support ASO/FMO ?
Since if you don't really support it, you may just drop BASELINE and
always report CONSTRAINED_BASELINE. Accuracy will come with a firmware
update.

>=20
> >=20
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
> > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),
> >=20
> > Shall we advertise multiview and stereo ? My impression is that we lack
> > a mechanism to actually signal the stereo layout, or which view each
> > buffers came from. I'm thinking, you can can't test it, we should just
> > fail on these ?
> >=20
>=20
> You're right, they're not tested, I will remove them.
>=20
>=20
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE=
_BASELINE);
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
> > > @@ -1166,6 +1197,35 @@ static void vdec_clear_slots(struct vpu_inst *=
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
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_profile(hdr->pr=
ofile_idc));
> > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_level(hdr->leve=
l_idc));
> > > +		break;
> > > +	case V4L2_PIX_FMT_HEVC:
> > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_profile(hdr->pr=
ofile_idc));
> > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_level(hdr->leve=
l_idc));
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
> > > @@ -1189,6 +1249,7 @@ static void vdec_event_seq_hdr(struct vpu_inst =
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
> > > index 428d988cf2f7..606f9d61a265 100644
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
> > > diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/m=
edia/platform/amphion/vpu_helpers.c
> > > index d12310af9ebc..108b75ceb4ae 100644
> > > --- a/drivers/media/platform/amphion/vpu_helpers.c
> > > +++ b/drivers/media/platform/amphion/vpu_helpers.c
> > > @@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_codec_=
state state)
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
> > > +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
> > > +	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
> > > +	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
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
> > > +u32 vpu_get_h264_v4l2_profile(u32 idc)
> > > +{
> > > +	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_profile=
s));
> > > +}
> > > +
> > > +u32 vpu_get_h264_v4l2_level(u32 idc)
> > > +{
> > > +	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_levels));
> > > +}
> > > +
> > > +u32 vpu_get_hevc_v4l2_profile(u32 idc)
> > > +{
> > > +	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_profile=
s));
> > > +}
> > > +
> > > +u32 vpu_get_hevc_v4l2_level(u32 idc)
> > > +{
> > > +	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_levels));
> > > +}
> > > diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/m=
edia/platform/amphion/vpu_helpers.h
> > > index 0eaddb07190d..dc5fb1ca2d33 100644
> > > --- a/drivers/media/platform/amphion/vpu_helpers.h
> > > +++ b/drivers/media/platform/amphion/vpu_helpers.h
> > > @@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptran=
sfers, u32 *pmatrix, u32 *pfu
> > > =C2=A0=20
> > > =C2=A0 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 s=
rc);
> > > =C2=A0 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 d=
st);
> > > +
> > > +u32 vpu_get_h264_v4l2_profile(u32 idc);
> > > +u32 vpu_get_h264_v4l2_level(u32 idc);
> > > +u32 vpu_get_hevc_v4l2_profile(u32 idc);
> > > +u32 vpu_get_hevc_v4l2_level(u32 idc);
> > > =C2=A0 #endif
> > > diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/me=
dia/platform/amphion/vpu_malone.c
> > > index 4769c053c6c2..5c6b2a841b6f 100644
> > > --- a/drivers/media/platform/amphion/vpu_malone.c
> > > +++ b/drivers/media/platform/amphion/vpu_malone.c
> > > @@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_=
rpc_event *pkt,
> > > =C2=A0=C2=A0	info->frame_rate.numerator =3D 1000;
> > > =C2=A0=C2=A0	info->frame_rate.denominator =3D pkt->data[8];
> > > =C2=A0=C2=A0	info->dsp_asp_ratio =3D pkt->data[9];
> > > -	info->level_idc =3D pkt->data[10];
> > > +	info->profile_idc =3D (pkt->data[10] >> 8) & 0xff;
> >=20
> > The data should normally also include the sps_constraint_set1_flag,
> > which differentiate baseline from constrained-baseline. I would also be
> > very surprised if the decoders supports ASO/FMO.
> >=20
> > Nicolas
> >=20
>=20
> As mentioned above, I'll try to request a firmware change to report
> sps_constraint_set1_flag, then driver can report
> PROFILE_CONSTRAINED_BASELINE correctly.

Ack.

regards,
Nicolas

>=20
> Regards,
> Ming
>=20
> > > +	info->level_idc =3D pkt->data[10] & 0xff;
> > > =C2=A0=C2=A0	info->bit_depth_luma =3D pkt->data[13];
> > > =C2=A0=C2=A0	info->bit_depth_chroma =3D pkt->data[14];
> > > =C2=A0=C2=A0	info->chroma_fmt =3D pkt->data[15];

