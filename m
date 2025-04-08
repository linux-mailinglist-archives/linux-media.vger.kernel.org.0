Return-Path: <linux-media+bounces-29673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8578CA81760
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF4E37B1238
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7C7254AF2;
	Tue,  8 Apr 2025 21:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="u8YgKA/w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C37254878
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 21:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146218; cv=none; b=tfbHSiDtPj0Hs8TTU+H/Os3jiInyvHoo5FIH3mxDYYhIx7tFUMn9RGhRVJ1PIwy0MPE/JmUQkevIyI9uUPgD1nb+ZBQ+QTm8GrbtTZ7C7EvZPVhME1L7yHk3YhNSv8dfigOUzNuNP1WByBeuRlsh8Yw7upwAm/DP1dwSa6elThE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146218; c=relaxed/simple;
	bh=y8zs7myUh/XxhHHshPzfVZ+iRzf6l2Y4xTvulmW7Yco=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gImF+1UzE+xd5sBhGNZQrDmrNJJ8VWNz2Jx2+juIo9M5IUeIZ1ZhtEAdlTLj/ioqQnlqI1DL0IWzoW0IVUlkgmQ/fRtya/i6Nc0CQb8p3SFHfOlJc5fH6aBRL5vSYBHbapKCy6pBzcdiMG5n81uDSz8poiFvcm8v1zQBsjCy08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=u8YgKA/w; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e39d1db2so352875285a.3
        for <linux-media@vger.kernel.org>; Tue, 08 Apr 2025 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744146215; x=1744751015; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StXUt2o98UrEzmCyhxaifjhbyPqbhX1WlryMmKDUzOY=;
        b=u8YgKA/ww9uHmNvtSsCGJNDTayimiHx2tIIdLYBGWh6leSRXKZnPt0VfI6wmBKRpn2
         BYixmK5f73+tHLAUJl7CMpj3GMfIs1F5YiuKOz9o9LVgVJYfYKMlQuIX2umh3PmKKJPm
         I6aGMvt9umkdxeXQljPJt9L4M9jX3ZMEmUb/ay2sbG2a8GkzwJMomQfYy98nWT66NT5Z
         nCpJZAvWwe6STSOE6gRpCGsTDbOPm0RZDX7AJmspiltQ2V6UYcQJEodcBWaspf4pV3WZ
         69+Ub8a5assvIkujAs+eZJvNQaSFFIvwY580mr4QBGbTOpU/HwtTpKcrU4Y7MTKEh2st
         YqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146215; x=1744751015;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StXUt2o98UrEzmCyhxaifjhbyPqbhX1WlryMmKDUzOY=;
        b=Us7ap8DtYDvzzi9+RVxlVLFt3V/ydoy91MN4Pia1Ug10p8eaQYInytEOqbSJq38Yfr
         04ZyzrAliLkeIK3RbHmasFitBA2ecvh8ji3kldB4tSZ+jdr2uDweyOuNdACedlMPLOcy
         k8zkMJEwrnUZJOG4IiFeTplqQobaR8/lPvcnL/8dXZ6Jvi0F2nES0FP7V7cgRYzOyNIm
         VAOK9424n0wUnPq3b287p8amkjDGZGy4/KrGEaucxO33OUv/87QZHHx6LGLfylLCk3xL
         Se3DCWhLuOy+ylRiqNif5Gs6JMkvoFPwHi++Ap2iR2lGNpe1urfYG4ZileSFtb+QkwaS
         HK+A==
X-Forwarded-Encrypted: i=1; AJvYcCUVx4DGNLGx9ICLpIckBeWEjVoe7anccc1sQPbE7OVR0fg8aqiF62k/kjbUIgOMFJtYPC0xv8jDue9MWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLMRVuJZJdiFNKb6XpON94/1J9l+0s7Tu6CdOdwH2B6Fv4AnN2
	tCvvjs+UGwHSmoLPceFBymJIDs0+EhTrpyv/Jmw3Y0VJMuTD0lDppxOrl1pNMcM=
X-Gm-Gg: ASbGncugppq4MM6OymF6xPosxVt7MOB6pwrAegTE10OhMQeou1Y/Zu+y6z8+kIGox5G
	Zz/r8keyRrAxibeRbQl48QNgkus4IKxwcmtEkojT3P850nuVFvjEIk+7eQ50XkYadwv9ruIyu+0
	WlSsFc/GY5XuT0HXnR7qh77nWMxcGbBS/B66KxqMEbeU2N9ICuO8F7/Qp6iPrDWiX8z/9sbO30m
	ZQowGf35NiB28Jggi7s2+HtPBhyN8QhYy+BBDOV75wW2PsaGmeGdGAa9BPaM4jhvbCQABRChqtQ
	oEquADOoo0YjR9jhQjUZ5JSMako0Ik/PzOXL9N2BVfPD29+fztuDBZswRT7R
X-Google-Smtp-Source: AGHT+IFgnJHxAWsuf+QM5cxegWPMvcG8OTlQh/+tfcVS0Sbd6RBnpzz0kQLkyoaYTeZ2+H1M6atR2A==
X-Received: by 2002:a05:620a:40c8:b0:7c5:6375:144c with SMTP id af79cd13be357-7c79cbd7654mr96683485a.23.1744146215399;
        Tue, 08 Apr 2025 14:03:35 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75bcbesm803695785a.38.2025.04.08.14.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 14:03:34 -0700 (PDT)
Message-ID: <d4515a3dbbba33a45c0dc1c68e47b9a1f0dbbb6e.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/4] media: v4l: dev-decoder: Add source change
 V4L2_EVENT_SRC_CH_COLORSPACE
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian
 <ming.qian@oss.nxp.com>, 	mchehab@kernel.org
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 08 Apr 2025 17:03:33 -0400
In-Reply-To: <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
	 <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Hans,

Le lundi 07 avril 2025 =C3=A0 11:54 +0200, Hans Verkuil a =C3=A9crit=C2=A0:
> On 17/01/2025 07:19, Ming Qian wrote:
> > Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
> > indicates colorspace change in the stream.
> > The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
> > the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > ---
> > =C2=A0Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 ++++=
+++++
> > =C2=A0.../userspace-api/media/videodev2.h.rst.exceptions=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A03 files changed, 11 insertions(+)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b=
/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > index 8db103760930..91e6b86c976d 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
> > @@ -369,6 +369,15 @@ call.
> > =C2=A0	loss of signal and so restarting streaming I/O is required in or=
der for
> > =C2=A0	the hardware to synchronize to the video signal.
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x0002
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - This event gets triggered when a colo=
rsapce change is detected at
>=20
> colorsapce -> colorspace
>=20
> > +	an input. This can come from a video decoder. Applications will query
>=20
> It can also come from a video receiver. E.g. an HDMI source changes color=
space
> signaling, but not the resolution.
>=20
> > +	the new colorspace information (if any, the signal may also have been
> > +	lost)
>=20
> Missing . at the end. Also, if the signal is lost, then that is a CH_RESO=
LUTION
> change, not CH_COLORSPACE.
>=20
> > +
> > +	For stateful decoders follow the guidelines in :ref:`decoder`.
>=20
> I think this should emphasize that if CH_COLORSPACE is set, but not CH_RE=
SOLUTION,
> then only the colorspace changed and there is no need to reallocate buffe=
rs.
>=20
> I also wonder if the description of CH_RESOLUTION should be enhanced to e=
xplain
> that this might also imply a colorspace change. I'm not sure what existin=
g codec
> drivers do if there is a colorspace change but no resolution change.
>=20
> I'm a bit concerned about backwards compatibility issues: if a userspace =
application
> doesn't understand this new flag and just honors CH_RESOLUTION, then it w=
ould
> never react to just a colorspace change.
>=20
> Nicolas, does gstreamer look at these flags?

So its used in two places:

At runtime (shared between HDMI receiver and decoders):

    if ((event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION) =3D=3D
0) {
      GST_DEBUG_OBJECT (v4l2object->dbg_obj,
          "Received non-resolution source-change, ignoring.");
      goto again;
    }


Meaning we currently completely ignore the event if it does not have
the flag. And the second usage is while waiting for the initial
resolution:

      if (event.type =3D=3D V4L2_EVENT_SOURCE_CHANGE &&
          (event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION))
{
        GST_DEBUG_OBJECT (v4l2object->dbg_obj,
            "Can't streamon capture as the resolution have changed.");
        ret =3D GST_V4L2_FLOW_RESOLUTION_CHANGE;
      }



I remember some doc explaining that once we receive that even we must
cycle through streamoff/on, but can't find it now, I'll check further
tomorrow. I wanted to check if that was specific to
V4L2_EVENT_SRC_CH_RESOLUTION or global to V4L2_EVENT_SOURCE_CHANGE.
Also, there is likely some difference between codec and HDMI.

I think backward compatibility will be difficult on that one. I'm happy
that you find the time to have a look, and looking for good ideas.

Nicolas


>=20
> Regards,
>=20
> 	Hans
>=20
> > +
> > =C2=A0Return Value
> > =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =C2=A0
> > diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptio=
ns b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > index 35d3456cc812..ac47c6d9448b 100644
> > --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> > @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-change=
s-flags
> > =C2=A0replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
> > =C2=A0
> > =C2=A0replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
> > +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
> > =C2=A0
> > =C2=A0replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_even=
t_motion_det`
> > =C2=A0
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index c8cb2796130f..242242c8e57b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
> > =C2=A0};
> > =C2=A0
> > =C2=A0#define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
> > +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
> > =C2=A0
> > =C2=A0struct v4l2_event_src_change {
> > =C2=A0	__u32 changes;

