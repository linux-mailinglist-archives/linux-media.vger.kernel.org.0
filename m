Return-Path: <linux-media+bounces-24542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E766A07CCE
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 17:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083BA168CFD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABE321E094;
	Thu,  9 Jan 2025 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="yO+PK+0O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D19021A424
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438642; cv=none; b=j1Q9tRyUVNYrgI4r4pDQV78wvE7AX9PE/gvdjXgSyN0RDbuTK5EaBfGcSS3rzdsCg/00l1BEmbOz3DaY6EOXAOpZq3dpD1zWbdp7v35Sw7GpoZnLFJ7eaNBNstTLz9ljdjjokx1dY40Frr//wIVEarfmxouMWZvmHR25wCKcZ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438642; c=relaxed/simple;
	bh=Fq6DaAxirJFRN94AUdmcajaBmHdYYB6hBLRbAayKxTk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WHW9+9js+EjQ2S8zvzqnQSpONntp5kGI7b1PcBSXl3dVnxAEJ7k6K39gS1d0wW+LOKdCMHlm+/V2mEt6HrqAC+Ve1stBaY2KvRp29dv7H9n9S1Ug2jIa2bV1pwpN5vkUgYjz0jb/Xur/nOmQ3ZVmK8tKw6DkFgPiOqXDMuk5t3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=yO+PK+0O; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8ece4937fso8374536d6.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736438639; x=1737043439; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5oWxpn0SGtmyDXb93tRyzmtUmQKPaYv4078+mCEzpoE=;
        b=yO+PK+0OAwVNmL/uC2MGmWXtcUgz5hd8FYgOpJmaLUmGRBxgrptYuJ032ZT8c10ylu
         Yw1XtHffzJGsIIwFpGiPVzS6wpX+gC4KKNn+F/+s1Qj2uQMRLVCo72ZVisB0GRzG8dZP
         s3kqKod5QQX07gzAJlmBsLuKremVpOpIhfHeoyAlN8JViVTDjDGVyIxkfKGtyB48NHYf
         Yb+27RaROG0xuwKAet0ca/Y5yyn0abLhjKvJf0pVKaVrRZ5gksrZdjgV3ZQ2+ND7vm4S
         UkZwX9Q9hjnRNG3QRYAMKG1rjximrm0kglGA6vyjWFSw9EyJwjRJtF1EbWMB9cFHzpPY
         Bycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438639; x=1737043439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oWxpn0SGtmyDXb93tRyzmtUmQKPaYv4078+mCEzpoE=;
        b=rCGBSPX+F311BIm5IwQwppnVOFYaTpF3RhdROpr1FETaryzf/Q4ec9JXQqhXtZAoD2
         iH5JkSeLqog0XSe8OvZ+jLHO0zRJK+DTlDqlzFSNosJEtfuvjJOrP/De0WAYv8WDRSps
         uc9dvttbOv/vKHQSTF+jO/o/+BI2Vl6K7REyW4aPGRxTqfDY2V1BppIcor0cgCCaFGLr
         tc6qhWmDfOaTAksCcY7VHpiy80JJLwFMjeeoDAo42r7gM5rCkp1O8ctcBUP11MbwuMh1
         qzw0xFvjzjf0pkvYSDdjBiG/nAOlw2JPSirpwrsffGQfsdKQ+qv4bK1n+1OFS/Tf153N
         uPrA==
X-Forwarded-Encrypted: i=1; AJvYcCXZyzBFxwND4jnQRrCGAFcKwbaFyMe3b6AZT5xD/8CK7aoM60mdB5HD2S7eZkvhrxi0V8366FfmnbJDnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk7pb3tjsZp33cZe5Hk+Ne2h+hXpZBJU00uzJDoziejsv/LEHm
	uku1JK1jdGLwIE4vHjPV3yV+u9UA2qhISjO62dxHeWnJlhnifTHImAyKouaZZVS+VeoOrkCAjG5
	I4x4=
X-Gm-Gg: ASbGnctJsAfCV0PcHSbaFytwoFYkN9cgsTxddkl82NnUg74/rTP5D57CJ8Z94mwqeBp
	GlrfKE5OTRxWDosihRcOhqU75kCpvaAIjhcfg/R0+Zwi+2XL9wtAXqSzWyvpxeyFpXQpjJGURWW
	0ueAtqGk7CBlthh+8BXJaLPV1BWW45uzWBSJ71VIjo9sLCOngmw8KZ0TgB4fsuE7iE86G9TC3As
	N9oMw7HXRYURKeJfjuZjTw2NYo7St+M4ufgnlBpfV67fuGdpl7IPEJFEw==
X-Google-Smtp-Source: AGHT+IHEP9r9XQCkPOEzp+u0TLg6rUa7q7/plau936duR/pLj+daWig5JlHn1NDsNPPmeHHMicojCA==
X-Received: by 2002:a05:6214:300e:b0:6d8:95c9:af2b with SMTP id 6a1803df08f44-6df9b2adae6mr110180926d6.35.1736438639396;
        Thu, 09 Jan 2025 08:03:59 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137367sm202531376d6.65.2025.01.09.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:03:59 -0800 (PST)
Message-ID: <bed10b8bcd85b4c03737107ac0aea1375d18a50e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: docs: dev-decoder: Trigger dynamic source change
 for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Thu, 09 Jan 2025 11:03:58 -0500
In-Reply-To: <1c1bb1b3-7e58-4a49-83bb-2c560cd66858@oss.nxp.com>
References: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
	 <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
	 <1c1bb1b3-7e58-4a49-83bb-2c560cd66858@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 09 janvier 2025 =C3=A0 10:25 +0800, Ming Qian(OSS) a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 2025/1/9 3:34, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 07 janvier 2025 =C3=A0 14:36 +0900, Ming Qian a =C3=A9crit :
> > > If colorspace changes, the client needs to renegotiate the pipeline,
> > > otherwise the decoded frame may not be displayed correctly.
> > >=20
> > > If it can trigger an source change event, then client can switch to t=
he
> > > correct stream setting. And each frame can be displayed properly.
> > >=20
> > > So add colorspace as a trigger parameter for dynamic resolution chang=
e.
> > >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >   Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/=
Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > index ef8e8cf31f90..49566569ad26 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > @@ -932,7 +932,9 @@ reflected by corresponding queries):
> > >  =20
> > >   * the minimum number of buffers needed for decoding,
> > >  =20
> > > -* bit-depth of the bitstream has been changed.
> > > +* bit-depth of the bitstream has been changed,
> > > +
> > > +* colorspace of the bitstream has been changed.
> >=20
> > Did you really mean colorspace in the way this term is used in V4L2 ? W=
hat we
> > want this event to be used for is when the capture storage size or amou=
nt
> > changes, perhaps you mean when the capture pixelformat changes ? This w=
ill
> > indeed happen if you change the bit-depth, subsampling (not mentioned h=
ere
> > either) or change the way colors are repsented (RGB, YCbCr, etc.).
> >=20
>=20
> I am referring to the following attributes in v4l2_pix_fmt:
> 	__u32		colorspace;	/* enum v4l2_colorspace */
> 	__u32		ycbcr_enc;	/* enum v4l2_ycbcr_encoding */
> 	__u32		quantization;	/* enum v4l2_quantization */
> 	__u32		xfer_func;	/* enum v4l2_xfer_func */
>=20
> For decoder, they are parsed from the sequence header.
> Our issue is that when only these properties change in the middle of
> some bitstream, but not the resolution or dpb amount, the decoder needs
> to nofity the user.  As these properties are in v4l2_pix fmt, user need
> to get/set them via VIDIOC_G_FMT/VIDIOC_S_FMT.
> So in my opinion, it's reasonable to nitify user a source change event,
> then user can call v4l_g_fmt() and renegotiate the pipeline.
>=20
> Apart from this, all I can think of is that user call v4l_g_fmt() before
> dequeueing each frame. But I don't think this is a good idea.

I agree an event is better then this ...

>=20
> As these properties are parts of the v4l2_format, I think it's
> reasonable to handle their changes via the dynamic source change flow.
>=20
> We're currently facing some real cases on android.
>=20
> Or do you have any good suggestions? Then I can give a try.

But I think this is too much to put this under the changes
 =20
   #define V4L2_EVENT_SRC_CH_RESOLUTION            (1 << 0)

We include under "resolution" everything that affects the allocation. So pe=
rhaps
for this one we can introduce

   #define V4L2_EVENT_SRC_CH_COLORSPACE            (2 << 0)

Of course, userspace implementation will be needed. Anyone one else have an
opinion here ?

Nicolas

>=20
> Thanks,
> Ming
>=20
> > >  =20
> > >   Whenever that happens, the decoder must proceed as follows:
> > >  =20
> >=20


