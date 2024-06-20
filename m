Return-Path: <linux-media+bounces-13834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED50910937
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ADB71F24612
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4CC1AED5D;
	Thu, 20 Jun 2024 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M4AFZ3nC"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C621AE0B3;
	Thu, 20 Jun 2024 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895845; cv=none; b=XByK4QztIbyvR2M8PhI2Wb2c5cEm5DTqDzfgpEQanYd5AJ2mcpQUhvRN/VnXKr4Q4gpGz786w3OvHyxmmtK276t5tzSJaZtaumJfIydzOxSNY8876x7SCrHYQQbj3am5qi2+h5J+EauBvZrdmO9M/j6EhOS2gC9uwEB3+/lwNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895845; c=relaxed/simple;
	bh=x/vZAHZVKlbt1TM2vckPahTO9LL1ZOh2lyhpbR2qC0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBPwOgiWHyrieL6CXhfqkkxWzpK0psejsW76ONkNHwAHXHn/ngtD2yalck6BmwvvPh36Gfj9jSjJ7UkPgHP4XDNk4+2ThXibKQB8e9Yx6b6uFWYX41rW4nE3FLCxjsngVk7DCVtWIa+Z/ozfELlbEAmDgVW9mPN95gYZse7X6nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M4AFZ3nC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718895841;
	bh=x/vZAHZVKlbt1TM2vckPahTO9LL1ZOh2lyhpbR2qC0g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M4AFZ3nCd77ATlvL9HOelsIQ0B1xH9kKkCDwtoVUzNbsW6pWjogrjNAlrvj5FbPWS
	 cubpgiijA0MrP6coFE67bTImg4BDZTo3Ii+Yiup5/lLwVFn9H3QJm7N0m9b+61xLCC
	 ZRDATubUG9LqaK8eWKxacVtTOdXPgw9f0hBDcrG+R/0HFBmkG7ShsH2/RlD7qZXek4
	 KysfT8FpG0RGWyz1CdNsEPsrAdnU8UAC0Fs7V7GsFI2GvJoo19mDP+7feajl03+n/b
	 7G3H9YuZQm84Rln+px3aSrCoho92e2/fNtGDbGFwAcOZJ6bJOXkAntIWArNXIeEOp/
	 55BivXZ/uMlDg==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E58E73780C1F;
	Thu, 20 Jun 2024 15:03:57 +0000 (UTC)
Message-ID: <2349746d488f4edf9c7c40df5e15ff70d3ec67b7.camel@collabora.com>
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, detlev.casanova@collabora.com
Cc: andy.yan@rock-chips.com, benjamin.gaignard@collabora.com, 
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 daniel.almeida@collabora.com,  devicetree@vger.kernel.org,
 didi.debian@cknow.org, dsimic@manjaro.org,  ezequiel@vanguardiasur.com.ar,
 gregkh@linuxfoundation.org, heiko@sntech.de,  hverkuil-cisco@xs4all.nl,
 jonas@kwiboo.se, knaerzche@gmail.com, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, mchehab@kernel.org,
 paul.kocialkowski@bootlin.com,  robh@kernel.org,
 sebastian.reichel@collabora.com
Date: Thu, 20 Jun 2024 11:03:54 -0400
In-Reply-To: <20240619174623.270706-1-liujianfeng1994@gmail.com>
References: <20240619150029.59730-3-detlev.casanova@collabora.com>
	 <20240619174623.270706-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jianfeng,

Le jeudi 20 juin 2024 =C3=A0 01:46 +0800, Jianfeng Liu a =C3=A9crit=C2=A0:
> Hi Detlev,
>=20
> On Wed, 19 Jun 2024 10:57:19 -0400, Detlev Casanova wrote:
> > +	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +		height *=3D 2;
> > +
> > +	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> > +	    height > ctx->coded_fmt.fmt.pix_mp.height)
> > +		return -EINVAL;
>=20
> I did further invesatigation on chromium. I find that before real video
> is decoded, chromium will call VIDIOC_STREAMON twice with value of
> sps->flags 0:
>=20
> At the first time width and height are 16; ctx->coded_fmt.fmt.pix_mp.widt=
h
> and coded_fmt.fmt.pix_mp.height are 16, which are the min size of decoder=
;

This falls short of a specification to support the uninitialized usage by
Chromium. That being said, we do make an effort to try and have a valid def=
ault
SPS control and OUTPUT format combination. So my suggestion would be to set
V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY in the default compound control init. Thi=
s
way, 0x0 get translate to 16x16 instead of 16x32, thus will work with more
drivers.

Chromium these days is not being tested on anything else then MTK, which ha=
s a
64x64 minimum size, this is why they never get into this issue. This driver
validation is entirely correct. Removing in some cases is unsafe, it would =
need
to be replaced with STREAMON only validation of the CAPTURE sizes (which
currently is validate by implied propagation of valid SPS/OUTPUT).

**not even compiled tested, just to illustrate**

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2=
-
core/v4l2-ctrls-core.c
index c4d995f32191..a55e165ea9c3 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -111,6 +111,7 @@ static void std_init_compound(const struct v4l2_ctrl *c=
trl,
u32 idx,
        struct v4l2_ctrl_vp9_frame *p_vp9_frame;
        struct v4l2_ctrl_fwht_params *p_fwht_params;
        struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
+       struct v4l2_ctrl_h264_sps *p_h264_sps;
        struct v4l2_ctrl_av1_sequence *p_av1_sequence;
        void *p =3D ptr.p + idx * ctrl->elem_size;
=20
@@ -179,6 +180,18 @@ static void std_init_compound(const struct v4l2_ctrl *=
ctrl,
u32 idx,
                 */
                memset(p_h264_scaling_matrix, 16,
sizeof(*p_h264_scaling_matrix));
                break;
+       case V4L2_CTRL_TYPE_H264_SPS:
+               p_h264_sps =3D p;
+               /*
+                * Without V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY,
+                * frame_mbs_only_flag set to 0 will translate to a miniumu=
m
+                * height of 32 (see H.264 specification 7-8). Some driver =
may
+                * have a minimum size lower then 32, which would fail
+                * validation with the SPS value. Set this flag, so that th=
ere
+                * is now doubling in the height, allowing a valid default.
+                */
+               p_h264_sps->flags =3D V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY;
+               break;
        }
 }

Nicolas

> At the second time width and height are still 16; while
> coded_fmt.fmt.pix_mp.width is 1920 and coded_fmt.fmt.pix_mp.height is
> 1088, which are the real size of video.
>=20
> So VIDIOC_STREAMON will fall at the first time call because sps->flags is
> 0 so V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set, and then height is
> doubled to 32 which is larger than 16.
>=20
> What do you think if we skip doubling height if sps->flags is 0 and at th=
e
> same time V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is not set? The following hac=
k
> did fix my chromium:
>=20
> --- a/drivers/staging/media/rkvdec2/rkvdec2-h264.c
> +++ b/drivers/staging/media/rkvdec2/rkvdec2-h264.c
> @@ -767,7 +767,7 @@ static int rkvdec2_h264_validate_sps(struct rkvdec2_c=
tx *ctx,
>          * which is half the final height (see (7-18) in the
>          * specification)
>          */
> -       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> +       if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) && sps->fla=
gs)
>                 height *=3D 2;
> =20
>         if (width > ctx->coded_fmt.fmt.pix_mp.width ||
>=20
> Best regards
> Jianfeng


