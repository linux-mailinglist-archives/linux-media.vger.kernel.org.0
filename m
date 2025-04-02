Return-Path: <linux-media+bounces-29249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750AA7925E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 17:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FDC318901A6
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 15:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DCE165F1F;
	Wed,  2 Apr 2025 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qHVtGo2N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0115103F
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608668; cv=none; b=YZGxKGvxmCs2ZhxcLOUYZ7pVvmjhDBpJKsTimideXCg9/LdZ/0pZvnHQbd1B+zjjX4BcWZ1Qom2/J+ES3dhLU6blmkCbw0CcPh4t2fawIN/zCwUHS9afAMtwbmGcLTefzx7fOfoFCgKY/R3UUC+p+Z7mVErKkcwocs70BJTtPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608668; c=relaxed/simple;
	bh=a+jzbY8HG5fDsHMKsIn9+P1jaVjiV3EsjcvsWqE6Nnc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lqVYibEXopho0CXqlsuTIURB4Kl+3efLkmXaRohhVyJFGuDnkcZY2uHmNLlpa7uo9ZXYF2dzx/5e4ZF6gHzsnTEbSSl4rP6U5CTYBgY6jKOQKEfU8YxQSeJfdbA50geD93HS29Gpp4O1IwmVmdPv/KWHihmSk/pOtnqVr591Doo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=qHVtGo2N; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47686580529so70611421cf.2
        for <linux-media@vger.kernel.org>; Wed, 02 Apr 2025 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608665; x=1744213465; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a+jzbY8HG5fDsHMKsIn9+P1jaVjiV3EsjcvsWqE6Nnc=;
        b=qHVtGo2NJqhEI+lMJQEj+aNJf/XSiU4XeXq+EgzDWCFHrzXinI7wgzYwHSx7Ql5vr6
         kfgT/7JP3MpvwkNe+JPsw8UiIDjrgAPdJ2nYB2hzQllbdTzgqFWN6z03JWy/LpFWYmux
         GEesm5o6YjeIgl1x9s9TpHY163ENwP2Inf59cJJfZSJyi5erRkTalKKrsR1Bn8SRIy0m
         0LOX6smHR/QSghc2vHNLMPW4nMPaeiusN1keQldS1U5lI/DaVI+iWXBp1p7rsLxqenud
         B2P1ogIfJnXCOiN4ewtyaLE7PecFvv05yX6F8B2dOaRrkhk727BfnI74wVj+YI6XggwS
         U56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608665; x=1744213465;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+jzbY8HG5fDsHMKsIn9+P1jaVjiV3EsjcvsWqE6Nnc=;
        b=JwDxGKi5ugXcvs5PRRgCHYt1dMPzzXWXstlJ9fu8Avshum+2ljzwCxnssNafwBPuER
         sxDFnqDIrDHgjKK3SvOaaJW3DDFBaRoJkV6jhjSQBGTLNzXWDtBvYhcJ9XTuIksX45WP
         jyFWNngC73pGhD+cYej/r3+NM0IKl3XZbqWmGePlOmUYmLeoQhVV/4IJ6kHVkSuNM4G+
         +0QFIqW1i+Pf+eYHTFkg2IrqNFU+6B49rpMrDMKlxy1u4ROKFiibi2quLnzvMgz9qx4b
         8vKpe5DP6bxXMEBG10kuVoG7qhytNBtnUAQtQpgrQkkYQ51XDKKRsLRB0w3+yTjvcl+l
         N4KA==
X-Gm-Message-State: AOJu0YzQGprZKA5ezygXU75xtUHmOxTInAN2ZyBgorXNEOF02zgd6fg/
	DfGjwuqf2dRrByjwGFbhJu1/eT4fxUpnz4G0reuWq1xLnvE9PWhwTqONAjqJ6f0=
X-Gm-Gg: ASbGncsLnrYzfWBQmQqgHCF3lrWgP5TGqVPYCvpwf64ixZiBrb9a0Oo8l5KmsTLrcso
	/DzLiIJ+LyUFHQYzfHtNiTJAMn/n7kvtIrAX5868DY2WxZzlES5Jglof3Q/pqivOcvu0RHQAnpT
	Ab4/SaFwnFHpjDsAStfhCktHVLF+R6tSbEeZUfc0RTdDaiRoG0vF0zIJAlNOv+Ck+INwqfjxdr2
	E8B/4cTRlP8hhPGMWSIF5oUFFPJGdCt/vi9GZAFzJ6Hej/lewRetnLbeR94nwIgSObzsluYnOP9
	wLbP2rSKHos6bDHXrDbVtshPFuvpGCdpfuaj/YQoLDBWuYXE2Q==
X-Google-Smtp-Source: AGHT+IEc+BZhUW+/6NwnShxb96e828exddiZl8c+iUpF+yyVytLTniyS9bVUuXTF/eUSpSRYwnxUUQ==
X-Received: by 2002:a05:622a:1820:b0:476:980c:109f with SMTP id d75a77b69052e-477e4b69912mr233296321cf.19.1743608665282;
        Wed, 02 Apr 2025 08:44:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a4a62fsm81446731cf.25.2025.04.02.08.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:44:24 -0700 (PDT)
Message-ID: <9f22aaa07b1fa11e7e1dee35598bafe5a3461ea7.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v0 0/3] Performance improvement of decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Wed, 02 Apr 2025 11:44:23 -0400
In-Reply-To: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
References: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mercredi 19 mars 2025 =C3=A0 12:50 +0900, Jackson.lee a =C3=A9crit=C2=A0=
:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> The wave5 codec driver is a stateful encoder/decoder.
> The following patches is for improving decoder performance.=20
>=20
> v4l2-compliance results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>=20
> Buffer ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not=
 supported
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not=
 supported
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_REQBUFS/CREATE_BUF=
S/QUERYBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test CREATE_BUFS maximum buffe=
rs: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_EXPBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test Requests: OK (Not Support=
ed)
>=20
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, War=
nings: 2=20
> Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0, War=
nings: 0
>=20
> Fluster test results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.=
0 Using 1 parallel job(s)
> Ran 133/147 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 68.517 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test fai=
ls because of a missing frame and slight corruption,
> =C2=A02 tests fail because of sizes which are incompatible with the IP, 1=
1 tests fail because of unsupported 10 bit format)
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Us=
ing 1 parallel job(s)
> Ran 78/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 35.015 secs

I'd be more confortable if I could get test report using 2 or 3
parallel instances.

Also, have you conducted manual "seek" tests, and stress tested the
dynamic resolution changes ? We don't have automated tests for these
anywhere yet.

Nicolas

>=20
> (57 fail because the hardware is unable to decode=C2=A0 MBAFF / FMO / Fie=
ld / Extended profile streams.)
>=20
>=20
> Jackson Lee (3):
> =C2=A0 media: chips-media: wave5: Improve performance of decoder
> =C2=A0 media: chips-media: wave5: Reduce high CPU load
> =C2=A0 media: chips-media: wave5: Fix Null reference while testing fluste=
r
>=20
> =C2=A0.../platform/chips-media/wave5/wave5-helper.c |=C2=A0 10 +-
> =C2=A0.../chips-media/wave5/wave5-vpu-dec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 361 ++++++++++--------
> =C2=A0.../chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../platform/chips-media/wave5/wave5-vpu.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 69 +++-
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.c |=C2=A0 25 +-
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.h |=C2=A0 12 +-
> =C2=A06 files changed, 307 insertions(+), 178 deletions(-)

