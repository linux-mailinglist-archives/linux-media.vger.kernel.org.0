Return-Path: <linux-media+bounces-30734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76611A9762F
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB343BB8F6
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 19:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C08298CD1;
	Tue, 22 Apr 2025 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="2AhcQFKs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADA4298CB9
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351598; cv=none; b=RGT6mrQWE10QHKO4+u4L4n8GPECh5u14a1QAnC/jgOZagavI7T70hhWPw8o8ghVeRvDO2p6h84Dc6ozmymtWKObCCI/E2lSbJYXVHn4aXlHdBb9KmSlC8gi4M6IbN5WE8JvhdA2lN7M3xER4DhN1aTHukZdkA+XuiA0tSXRcNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351598; c=relaxed/simple;
	bh=IwAWbmdSxUyTMHT5B54kwJAXHfPAJQo/18ZEaaxAN2w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ccRpdi2CnPTol+w9VoGvyKf5wmMheF77ksaVk84DfwMkyygE3YKJaJ5IOZYQVl3WFhRM5Wg7mMSUBBXBynOYLS5V9P2p534uX/5hfC4G/UkUq//l7pYc3sawYkjS/3DK94SSnNg5jsQMrrufIu6mC6+xnXNgwHm6XyHjBI+fB0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=2AhcQFKs; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f7019422so55461816d6.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 12:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351594; x=1745956394; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYsIXJ0VH1fBZwKk67xkFa5qHHB2W1M/DHJM5j7x72w=;
        b=2AhcQFKsPB4b1eeIxXxxcG015taR+aZtipBkxzTXTbpguZshQyMv5AEVC7rnK9yAvR
         tRzvocT1BRhFvoO7WbuZKB0FpsjgRJw6acoBJLq95FoauWCifk3xmVgSXhRbfC71GBDu
         w6SSGOTRqyTrgb6CVwJMnWaXMTz98CIuAz5zcqzHFmfjsd3pvys1JRGWC8DCjluiamgN
         WneSIModrXsioHPhES6t8guG/FfstQXwqcpEbVRX6X1JnWg+7Eb/xNSk5Lte9qCyCs8v
         rKHh+EAmo7BpepNQcHOTd2LctY6E1ByvKIm1FyDI+jh3qlFiO7MMGRnEEqOcyu0/A0kT
         oNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351594; x=1745956394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rYsIXJ0VH1fBZwKk67xkFa5qHHB2W1M/DHJM5j7x72w=;
        b=lXHMTTrLAPncs2KJyt7A7rKqC6VRtlesp6b3k5deZ45hrzHXTlvMMV2vw5BJ+vbQF+
         IL6I4M+2bm3BhyfMpOt6dYfEbwPcHL5WLUljq2se+xRF0xwHkHFaVgEqW5CFa4D2I38O
         6hIoq52dq46ixHrQp8UO+qm7LmiZSqnybQLYWt99UTJTvmiTM76XLZVB9VbgBEMWUUSN
         QKGRJtYC97sKNsW5fxfFlnsubLgP88OnL7F5Mgmb46yIvcKsUQofy/fmiXwuYxuu/UVm
         nvz7dbp/cSnPT8RxRJl6doeiqqN+q4RCAjoWGKqorc4FlWgfUdXNv5FjZYtmcjWpvQ0R
         Weeg==
X-Forwarded-Encrypted: i=1; AJvYcCXVBNzuJ/7O+GHRhC8YYnbeXfRNEqxCYmqaSpXkF9a7+0qayRee/EUjY0q13fd2y1R12kucbm3BuEfHBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwLbWBYArtni0avn+n3zjq74kmcDaLh0koXfXa6l/ezo0BJpO4
	P2kROeSbTdZ+lcHewkVgC9fPF/oAfqw/lEtcQN7NK/Uftm9jy1ryXgi6rD8qCVQ=
X-Gm-Gg: ASbGncssHrsEbfgLIlZO2yLIgFHvX1sBg54WbFUrTNbJoFuvABdWsuvGEcuoLo5dzIF
	oY47DVFe17hWLB5ktklVURbhgOAN6M4RTSwYIzWum/nsZ73yB8ThcnTYCTweg35dAfgq4g+cbHz
	6++hovq1GqRDktugPu9niJygRONE6y0mBf32ZM/n3QkYKQ8RTIjLEQ8PVoNp6VCrNMwK0dXAYXS
	sTE3tHiHN+19uprZc+RLEni0ZTuQa/6aM+0AF+M6lFL194hnL+77gckc25AJh0PTDnwdABlo6Qk
	k7GEU5SPJA+1VQXpyJfRwewLzt+/aIpho3tWM7ZG6JyP5w==
X-Google-Smtp-Source: AGHT+IFx37IZxz2XZRa4HUxytJgkJVsEXuyDvydowgtq1jU/C5yFgExdGRxaZiK2dG6HIZZz2N702A==
X-Received: by 2002:a05:6214:21e7:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f2c4656c2cmr318324046d6.31.1745351593565;
        Tue, 22 Apr 2025 12:53:13 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcfd0sm61261036d6.82.2025.04.22.12.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:53:12 -0700 (PDT)
Message-ID: <419ba5e518be4a35ed0277f749ca9a317f6bff5c.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/3] media: uapi: add WebP uAPI
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jean-Michel Hautbois
 <jeanmichel.hautbois@ideasonboard.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 15:53:11 -0400
In-Reply-To: <20241121131904.261230-2-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
	 <20241121131904.261230-2-hugues.fruchet@foss.st.com>
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

sorry for the late come back.

Le jeudi 21 novembre 2024 =C3=A0 14:19 +0100, Hugues Fruchet a =C3=A9crit=
=C2=A0:
> This patch adds the WebP picture decoding kernel uAPI.
>=20
> This design is based on currently available VP8 API implementation and
> aims to support the development of WebP stateless video codecs
> on Linux.

Should mention that this new pix fmt is added to make it possible to
support both intra-only and VP8 with reference, while advertising
different frame sizes.

>=20
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> ---
> =C2=A0.../userspace-api/media/v4l/biblio.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++++
> =C2=A0.../media/v4l/pixfmt-compressed.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++++
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> =C2=A04 files changed, 28 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documenta=
tion/userspace-api/media/v4l/biblio.rst
> index 35674eeae20d..df3e963fc54f 100644
> --- a/Documentation/userspace-api/media/v4l/biblio.rst
> +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> @@ -447,3 +447,12 @@ AV1
> =C2=A0:title:=C2=A0=C2=A0=C2=A0=C2=A0 AV1 Bitstream & Decoding Process Sp=
ecification
> =C2=A0
> =C2=A0:author:=C2=A0=C2=A0=C2=A0 Peter de Rivaz, Argon Design Ltd, Jack H=
aughton, Argon Design Ltd
> +
> +.. _webp:
> +
> +WEBP
> +=3D=3D=3D=3D
> +
> +:title:=C2=A0=C2=A0=C2=A0=C2=A0 WEBP picture Bitstream & Decoding Proces=
s Specification
> +
> +:author:=C2=A0=C2=A0=C2=A0 Google (https://developers.google.com/speed/w=
ebp)
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index 806ed73ac474..08a989511e7d 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -169,6 +169,23 @@ Compressed Formats
> =C2=A0	this pixel format. The output buffer must contain the appropriate =
number
> =C2=A0	of macroblocks to decode a full corresponding frame to the matchin=
g
> =C2=A0	capture buffer.
> +=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-WEBP-FRAME:
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``V4L2_PIX_FMT_WEBP_FRAME``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 'WEBP'

After plenty of thinking, WebP is a container the support 2 codecs. We
should not name this WebP, but instead VP8_INTRA_FRAME. Meaning, intra
only VP8 decoder.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - WEBP VP8 parsed frame, excluding WEBP R=
IFF header, keeping only the VP8
> +	bitstream including the frame header, as extracted from the container.

This comment will then not be needed, since VP8_INTRA will make it
clear.

regards,
Nicolas

> +	This format is adapted for stateless video decoders that implement a
> +	WEBP pipeline with the :ref:`stateless_decoder`.
> +	Metadata associated with the frame to decode is required to be passed
> +	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
> +	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
> +	Because of key frames only bitstream, ``V4L2_VP8_FRAME_FLAG_KEY_FRAME``
> +	flag must be set, see :ref:`Frame Flags <vp8_frame_flags>`.
> +	Exactly one output and one capture buffer must be provided for use with
> +	this pixel format. The output buffer must contain the appropriate numbe=
r
> +	of macroblocks to decode a full corresponding frame to the matching
> +	capture buffer.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 * .. _V4L2-PIX-FMT-VP9:
> =C2=A0
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 0304daa8471d..e2ff03d0d773 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1501,6 +1501,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
> =C2=A0		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr =3D "VC-1 (SMPTE 412M Annex =
L)"; break;
> =C2=A0		case V4L2_PIX_FMT_VP8:		descr =3D "VP8"; break;
> =C2=A0		case V4L2_PIX_FMT_VP8_FRAME:=C2=A0=C2=A0=C2=A0 descr =3D "VP8 Fra=
me"; break;
> +		case V4L2_PIX_FMT_WEBP_FRAME:=C2=A0=C2=A0=C2=A0 descr =3D "WEBP VP8 Fr=
ame"; break;
> =C2=A0		case V4L2_PIX_FMT_VP9:		descr =3D "VP9"; break;
> =C2=A0		case V4L2_PIX_FMT_VP9_FRAME:=C2=A0=C2=A0=C2=A0 descr =3D "VP9 Fra=
me"; break;
> =C2=A0		case V4L2_PIX_FMT_HEVC:		descr =3D "HEVC"; break; /* aka H.265 */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index e7c4dce39007..09fff269e852 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -757,6 +757,7 @@ struct v4l2_pix_format {
> =C2=A0#define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /*=
 SMPTE 421M Annex L compliant stream */
> =C2=A0#define V4L2_PIX_FMT_VP8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc(=
'V', 'P', '8', '0') /* VP8 */
> =C2=A0#define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* V=
P8 parsed frame */
> +#define V4L2_PIX_FMT_WEBP_FRAME v4l2_fourcc('W', 'B', 'P', 'F') /* WEBP =
VP8 parsed frame */
> =C2=A0#define V4L2_PIX_FMT_VP9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc(=
'V', 'P', '9', '0') /* VP9 */
> =C2=A0#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* V=
P9 parsed frame */
> =C2=A0#define V4L2_PIX_FMT_HEVC=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fourcc('H', =
'E', 'V', 'C') /* HEVC aka H.265 */

