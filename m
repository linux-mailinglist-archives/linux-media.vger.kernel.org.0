Return-Path: <linux-media+bounces-31221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4DCA9F4A3
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 17:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD4977A7125
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 15:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D38F27A115;
	Mon, 28 Apr 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="t4tLLXug"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD902566E2
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854597; cv=none; b=oMu1+xpa6jYMtHAf9A2b7Z14I7J7ifiBOF2FbiLlpW6MaH9jOy3WyCM9k0FyEof30qjdIHz3kZw+dbakn6/V61kpDJShyGsjl3/k78Dzw4c3McIbMwcYXmMh+Jk4/TXNAiRFz3uFOqyHG+s/siPotyBhD65zkSROlYmUluJAQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854597; c=relaxed/simple;
	bh=T+0zUwFG34pf1XDFY5WUwG4Hdkp0ZBanQkoXkUoVhwg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f1m5IvuwnMKB+5nntq0xT3k1QPeHUnDFbsm7llhYoJjCo9Q2Z22mc1IVZVIqTjAvDovBS/IzQeos6CjueZuTsPVQl+GLmVZvnBhdSkRctARL8go6XlXAwIaGdJYgNTnBx20FKVIK/y6MErMz5zxzQh/GN0T8ai5eijiqatdpVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=t4tLLXug; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecf0e07954so79002086d6.1
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745854593; x=1746459393; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4s77mP+aXHVnwDrJa9wz0BjHNRnKSn8vcA3GIllhh7k=;
        b=t4tLLXugLNSMT9zl9+PCyILZyvoTOBlfn2ALV629fEI0f6ZubwBgekDjmIlY51MBn+
         qaHoYJM+1GebVhKFR6wLKxYj26A+e1+rZ+qxpjWN26JiL5VSrYJnpH0c/8D6iWNBKbVo
         nQgmFbBquv5FC1q/crGp3pg5tLDTFDNKGqZbbGQOT7SamjLIqFJ8w+RlWmktMQJS81tt
         vLjGvr0kvCvX5YGk+2jXFLlOsEGBeDOA+Q50OkLHiQmgR0WTq5ehP6ScBhwn8FAPU6tZ
         APstgnAp10n6UydIEBGR7Diiqx0HhdlY7B0q7QJnL0f48oHkX1oyhzE/sIWasg+2J/9t
         nQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745854593; x=1746459393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4s77mP+aXHVnwDrJa9wz0BjHNRnKSn8vcA3GIllhh7k=;
        b=GN6127GHCu14I0U9H20Vfuqb4p7cmfCyQzxLUZWQ3CBxBOdhgRHm/QmJ251oMjoOiD
         GHYxGzffhAx7tZVZkOSqL6KPfM3Yt5k0KBIdCfl+FoKwEUTFUJ6119YXQR8KlbntJF5L
         iUN5CT8kbb3s+CfHPDsYwnIC6R5rBzSzI9sR6rD52oXLPeeurcAI0Ahlvjck77ZD0S1F
         Ts/buNnHCxLiTgKtfiVXm/eJ93ZRAYbUAlVW+Db6tPHILmLjMI1R1ZEVkZJhJF4Y4tDs
         OS/m50Cp2puvfuIEJfWpVSOpAFns9hDsPyk+O2hzOeR22AlvM8JlawT0gDQf/ngf8RGt
         xdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR5Xfa0Npl/5hoyju9DkgL6X9YYXYnZxtKHfhSH2SNe45mAHWJ+Llrujw+It2v6xu6KNn4hH9gEXQVKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMEa4Mohf/EiWSdetIt4xlgcLtbtzHlTJxEAKWGyr1sQeximPS
	l+CUO/sBsgNy6g981sCzC28Aydy8Bq1wTWXLI2hNN23Kt9ZXGZW7/2ciDkoZIEo=
X-Gm-Gg: ASbGnctXoGtHWbr4wuGT7RhFfOhcdto5RQuLdAYkMhLJuR17UOJhHe99R5O84okKsFZ
	NuDNs1UMOMk7WXXfvcEb6S2xVWXtsj6pFA4fs863VFlmFugeQeQxNfehnO0QO7vxYucMkDCACus
	IY8ZSYI9tCbUI4s6EhsAuOyS3Wy9gL8jzZFEv2+Pb5YhR/h4KxXHeC8Iz+WbQLdI7np8qLnwH/J
	5VjYUrqy5DlHRqTK2sPDR1vY8y9PtqbAnBx/8nyufgX8xIDAozFDILqoqfGOCpSUA8MRI1CnWnd
	nymRCYpWfEYPRKwCFA2ypIc6pyYnw120u9LcgSUgW0YFxQ==
X-Google-Smtp-Source: AGHT+IFydyQgt8+hX6oHv7I3+R5vxYQo32+nBN0WWoJP83EwPy05Rm+1efR0rfQFgn/GZ1An5Oq7oA==
X-Received: by 2002:a05:6214:d4e:b0:6f4:c8cd:abcc with SMTP id 6a1803df08f44-6f4d1dc90b8mr178871376d6.0.1745854592768;
        Mon, 28 Apr 2025 08:36:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf904sm62513926d6.101.2025.04.28.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:36:32 -0700 (PDT)
Message-ID: <833134215fcd22360cf8aceb61539c7c03dcaa02.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: amphion: Add H264 and HEVC profile and level
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@nxp.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>,  "hverkuil-cisco@xs4all.nl"	
 <hverkuil-cisco@xs4all.nl>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org"	
 <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
 "kernel@pengutronix.de"	 <kernel@pengutronix.de>, "festevam@gmail.com"
 <festevam@gmail.com>, "X.H. Bao"	 <xiahong.bao@nxp.com>, Eagle Zhou
 <eagle.zhou@nxp.com>, "imx@lists.linux.dev"	 <imx@lists.linux.dev>,
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 28 Apr 2025 11:36:31 -0400
In-Reply-To: <AS8PR04MB824782B77E0253BF2C82823EE7862@AS8PR04MB8247.eurprd04.prod.outlook.com>
References: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
	 <74eb0589ae54855db1d2024591d501989e30027a.camel@ndufresne.ca>
	 <a60b84d8-a179-4c33-aed0-1f2ad1857f7b@oss.nxp.com>
	 <caaa10071d063069a4f479862b38f304c89da21e.camel@ndufresne.ca>
	 <AS8PR04MB824782B77E0253BF2C82823EE7862@AS8PR04MB8247.eurprd04.prod.outlook.com>
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

Le dimanche 27 avril 2025 =C3=A0 01:44 +0000, Ming Qian a =C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On 2025/4/26 3:53, Nicolas Dufresne wrote:
> > Le vendredi 25 avril 2025 =C3=A0 10:33 +0800, Ming Qian(OSS) a =C3=A9cr=
it=C2=A0:
> > >=20
> > > Hi Nicolas,
> > >=20
> > > On 2025/4/23 4:15, Nicolas Dufresne wrote:
> > > > Hi Ming,
> > > >=20
> > > > Le mardi 10 d=C3=A9cembre 2024 =C3=A0 18:33 +0900, Ming Qian a =C3=
=A9crit :
> > > > > From: Ming Qian <ming.qian@nxp.com>
> > > > >=20
> > > > > For format H264 and HEVC, the firmware can report the parsed prof=
ile idc
> > > > > and level idc to driver, the information may be useful.
> > > > > Implement the H264 and HEVC profile and level control to report t=
hem.
> > > > >=20
> > > > > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > > > > ---
> > > > > v2
> > > > > -- add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASEL=
INE
> > > > >=20
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 61 +++++++++++++
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_defs.h=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_helpers.c | 93 ++=
++++++++++++++++++
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_helpers.h |=C2=A0=
 5 ++
> > > > > =C2=A0=C2=A0 drivers/media/platform/amphion/vpu_malone.c=C2=A0 |=
=C2=A0 3 +-
> > > > > =C2=A0=C2=A0 5 files changed, 162 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/medi=
a/platform/amphion/vdec.c
> > > > > index ca8f7319503a..61d5598ee6a1 100644
> > > > > --- a/drivers/media/platform/amphion/vdec.c
> > > > > +++ b/drivers/media/platform/amphion/vdec.c
> > > > > @@ -232,6 +232,37 @@ static int vdec_ctrl_init(struct vpu_inst *i=
nst)
> > > > > =C2=A0=C2=A0=C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY=
_ENABLE,
> > > > > =C2=A0=C2=A0=C2=A0			=C2=A0 0, 1, 1, 0);
> > > > > =C2=A0=C2=A0=20
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264=
_PROFILE,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PRO=
FILE_MULTIVIEW_HIGH,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_=
H264_PROFILE_BASELINE) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> > > >=20
> > > > You've added it here, but you will never report it, see my comment
> > > > below.
> > > Yes, you're right,
> > > firmware can't report the sps_constraint_set1_flag yet,
> > > so we need to request a firmware interface change to report the
> > > sps_constraint_set1_flag.
> > >=20
> > > If we remove PROFILE_CONSTRAINED_BASELINE here, then these streams wi=
ll
> > > failed to play with gstreamer.
> > > If we keep it here, then these stremas can be played, but driver will
> > > report wrong profile.
> > >=20
> > > Maybe we need to change the firmware interface firstly.
> >=20
> > Well, all software have bugs, even the firm ones. Just comment about
> > it.
> >=20
> > Perhaps you already said, but does Amphion really support ASO/FMO ?
> > Since if you don't really support it, you may just drop BASELINE and
> > always report CONSTRAINED_BASELINE. Accuracy will come with a firmware
> > update.
> >=20
>=20
> I'm not sure whether Amphion malone decoder can support ASO or not.
> But the firmware does not filter out this feature.
> And firmware do filter out the FMO, so FMO is not supported.
>=20
> The CONSTRAINED_BASELINE is subset of BASELINE, some streams maybe=20
> encoded with BASELINE profile, without enabling ASO or FMO. This is=20
> probably not uncommon. For these streams, I think we still need to=20
> support, so driver can't drop BASELINE profile.

In the past we had agreed that userspace should handle that, so that
drivers don't have to lie about it. That being said, for stateful it
means the firmware must not immediately reject it, and only fail when
it notices an unsupported feature. So in some ways, it have to have
some support for it. For ASO, it is detected while parsing VCL, can't
be seen in the SPS or PPS, so that makes it the hardest. A constrained
decoder, will imediatly ail if the mb offset of the first VCL is not 0.
An baseline decoder is suppose to accumulate until it see the start of
the next VCL (pic_num change mostly) and then reorder.

Short story, for stateful, I'm fine either way, so feel free to keep it
that way.

>=20
> By the way, amphion firmware doesn't check the sps_constraint_set1_flag=
=20
> to tell CONSTRAINED_BASELINE or BASELINE. I'll request a firmware change=
=20
> firstly.

This would be nice at least for accurate reporting, as it can help
debugging. Meanwhile, we should also support existing firmware.

Nicolas

>=20
> Regards,
> Ming
>=20
>=20
> > >=20
> > > >=20
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),
> > > >=20
> > > > Shall we advertise multiview and stereo ? My impression is that we =
lack
> > > > a mechanism to actually signal the stereo layout, or which view eac=
h
> > > > buffers came from. I'm thinking, you can can't test it, we should j=
ust
> > > > fail on these ?
> > > >=20
> > >=20
> > > You're right, they're not tested, I will remove them.
> > >=20
> > >=20
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PRO=
FILE_BASELINE);
> > > > > +
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264=
_LEVEL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEV=
EL_6_2,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEV=
EL_4_0);
> > > > > +
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC=
_PROFILE,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PRO=
FILE_MAIN_10,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_=
HEVC_PROFILE_MAIN) |
> > > > > +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PRO=
FILE_MAIN);
> > > > > +
> > > > > +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC=
_LEVEL,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEV=
EL_6_2,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEV=
EL_4);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0	ctrl =3D v4l2_ctrl_new_std(&inst->ctrl_handler=
, &vdec_ctrl_ops,
> > > > > =C2=A0=C2=A0=C2=A0				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1=
, 2);
> > > > > =C2=A0=C2=A0=C2=A0	if (ctrl)
> > > > > @@ -1166,6 +1197,35 @@ static void vdec_clear_slots(struct vpu_in=
st *inst)
> > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > =C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0=20
> > > > > +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id,=
 u32 val)
> > > > > +{
> > > > > +	struct v4l2_ctrl *ctrl =3D v4l2_ctrl_find(&inst->ctrl_handler, =
id);
> > > > > +
> > > > > +	if (ctrl)
> > > > > +		v4l2_ctrl_s_ctrl(ctrl, val);
> > > > > +}
> > > > > +
> > > > > +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst=
, struct vpu_dec_codec_info *hdr)
> > > > > +{
> > > > > +	switch (inst->out_format.pixfmt) {
> > > > > +	case V4L2_PIX_FMT_H264:
> > > > > +	case V4L2_PIX_FMT_H264_MVC:
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_profile(hdr=
->profile_idc));
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_level(hdr->=
level_idc));
> > > > > +		break;
> > > > > +	case V4L2_PIX_FMT_HEVC:
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_profile(hdr=
->profile_idc));
> > > > > +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_level(hdr->=
level_idc));
> > > > > +		break;
> > > > > +	default:
> > > > > +		return;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > =C2=A0=C2=A0 static void vdec_event_seq_hdr(struct vpu_inst *inst=
, struct vpu_dec_codec_info *hdr)
> > > > > =C2=A0=C2=A0 {
> > > > > =C2=A0=C2=A0=C2=A0	struct vdec_t *vdec =3D inst->priv;
> > > > > @@ -1189,6 +1249,7 @@ static void vdec_event_seq_hdr(struct vpu_i=
nst *inst, struct vpu_dec_codec_info
> > > > > =C2=A0=C2=A0=C2=A0	vdec_init_crop(inst);
> > > > > =C2=A0=C2=A0=C2=A0	vdec_init_mbi(inst);
> > > > > =C2=A0=C2=A0=C2=A0	vdec_init_dcp(inst);
> > > > > +	vdec_update_v4l2_profile_level(inst, hdr);
> > > > > =C2=A0=C2=A0=C2=A0	if (!vdec->seq_hdr_found) {
> > > > > =C2=A0=C2=A0=C2=A0		vdec->seq_tag =3D vdec->codec_info.tag;
> > > > > =C2=A0=C2=A0=C2=A0		if (vdec->is_source_changed) {
> > > > > diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/=
media/platform/amphion/vpu_defs.h
> > > > > index 428d988cf2f7..606f9d61a265 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_defs.h
> > > > > +++ b/drivers/media/platform/amphion/vpu_defs.h
> > > > > @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
> > > > > =C2=A0=C2=A0=C2=A0	u32 decoded_height;
> > > > > =C2=A0=C2=A0=C2=A0	struct v4l2_fract frame_rate;
> > > > > =C2=A0=C2=A0=C2=A0	u32 dsp_asp_ratio;
> > > > > +	u32 profile_idc;
> > > > > =C2=A0=C2=A0=C2=A0	u32 level_idc;
> > > > > =C2=A0=C2=A0=C2=A0	u32 bit_depth_luma;
> > > > > =C2=A0=C2=A0=C2=A0	u32 bit_depth_chroma;
> > > > > diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drive=
rs/media/platform/amphion/vpu_helpers.c
> > > > > index d12310af9ebc..108b75ceb4ae 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_helpers.c
> > > > > +++ b/drivers/media/platform/amphion/vpu_helpers.c
> > > > > @@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_co=
dec_state state)
> > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > =C2=A0=C2=A0=C2=A0	return "<unknown>";
> > > > > =C2=A0=C2=A0 }
> > > > > +
> > > > > +struct codec_id_mapping {
> > > > > +	u32 id;
> > > > > +	u32 v4l2_id;
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping h264_profiles[] =3D {
> > > > > +	{66,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
> > > > > +	{77,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
> > > > > +	{88,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
> > > > > +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
> > > > > +	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
> > > > > +	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping h264_levels[] =3D {
> > > > > +	{10,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
> > > > > +	{9,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1B},
> > > > > +	{11,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
> > > > > +	{12,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
> > > > > +	{13,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
> > > > > +	{20,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
> > > > > +	{21,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
> > > > > +	{22,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
> > > > > +	{30,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
> > > > > +	{31,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
> > > > > +	{32,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
> > > > > +	{40,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
> > > > > +	{41,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
> > > > > +	{42,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
> > > > > +	{50,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
> > > > > +	{51,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
> > > > > +	{52,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
> > > > > +	{60,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
> > > > > +	{61,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
> > > > > +	{62,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping hevc_profiles[] =3D {
> > > > > +	{1,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
> > > > > +	{2,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
> > > > > +};
> > > > > +
> > > > > +static struct codec_id_mapping hevc_levels[] =3D {
> > > > > +	{30,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
> > > > > +	{60,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
> > > > > +	{63,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
> > > > > +	{90,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
> > > > > +	{93,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
> > > > > +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
> > > > > +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
> > > > > +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
> > > > > +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
> > > > > +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
> > > > > +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
> > > > > +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
> > > > > +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
> > > > > +};
> > > > > +
> > > > > +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *arr=
ay, u32 array_sz)
> > > > > +{
> > > > > +	u32 i;
> > > > > +
> > > > > +	if (!array || !array_sz)
> > > > > +		return 0;
> > > > > +
> > > > > +	for (i =3D 0; i < array_sz; i++) {
> > > > > +		if (id =3D=3D array[i].id)
> > > > > +			return array[i].v4l2_id;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_h264_v4l2_profile(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_pro=
files));
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_h264_v4l2_level(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_level=
s));
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_hevc_v4l2_profile(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_pro=
files));
> > > > > +}
> > > > > +
> > > > > +u32 vpu_get_hevc_v4l2_level(u32 idc)
> > > > > +{
> > > > > +	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_level=
s));
> > > > > +}
> > > > > diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drive=
rs/media/platform/amphion/vpu_helpers.h
> > > > > index 0eaddb07190d..dc5fb1ca2d33 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_helpers.h
> > > > > +++ b/drivers/media/platform/amphion/vpu_helpers.h
> > > > > @@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *p=
transfers, u32 *pmatrix, u32 *pfu
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 =
cnt, u32 src);
> > > > > =C2=A0=C2=A0 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 =
cnt, u32 dst);
> > > > > +
> > > > > +u32 vpu_get_h264_v4l2_profile(u32 idc);
> > > > > +u32 vpu_get_h264_v4l2_level(u32 idc);
> > > > > +u32 vpu_get_hevc_v4l2_profile(u32 idc);
> > > > > +u32 vpu_get_hevc_v4l2_level(u32 idc);
> > > > > =C2=A0=C2=A0 #endif
> > > > > diff --git a/drivers/media/platform/amphion/vpu_malone.c b/driver=
s/media/platform/amphion/vpu_malone.c
> > > > > index 4769c053c6c2..5c6b2a841b6f 100644
> > > > > --- a/drivers/media/platform/amphion/vpu_malone.c
> > > > > +++ b/drivers/media/platform/amphion/vpu_malone.c
> > > > > @@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct =
vpu_rpc_event *pkt,
> > > > > =C2=A0=C2=A0=C2=A0	info->frame_rate.numerator =3D 1000;
> > > > > =C2=A0=C2=A0=C2=A0	info->frame_rate.denominator =3D pkt->data[8];
> > > > > =C2=A0=C2=A0=C2=A0	info->dsp_asp_ratio =3D pkt->data[9];
> > > > > -	info->level_idc =3D pkt->data[10];
> > > > > +	info->profile_idc =3D (pkt->data[10] >> 8) & 0xff;
> > > >=20
> > > > The data should normally also include the sps_constraint_set1_flag,
> > > > which differentiate baseline from constrained-baseline. I would als=
o be
> > > > very surprised if the decoders supports ASO/FMO.
> > > >=20
> > > > Nicolas
> > > >=20
> > >=20
> > > As mentioned above, I'll try to request a firmware change to report
> > > sps_constraint_set1_flag, then driver can report
> > > PROFILE_CONSTRAINED_BASELINE correctly.
> >=20
> > Ack.
> >=20
> > regards,
> > Nicolas
> >=20
> > >=20
> > > Regards,
> > > Ming
> > >=20
> > > > > +	info->level_idc =3D pkt->data[10] & 0xff;
> > > > > =C2=A0=C2=A0=C2=A0	info->bit_depth_luma =3D pkt->data[13];
> > > > > =C2=A0=C2=A0=C2=A0	info->bit_depth_chroma =3D pkt->data[14];
> > > > > =C2=A0=C2=A0=C2=A0	info->chroma_fmt =3D pkt->data[15];

