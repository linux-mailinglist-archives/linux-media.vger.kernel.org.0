Return-Path: <linux-media+bounces-18261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D89782FD
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 16:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D6D28A0C8
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9680638DFC;
	Fri, 13 Sep 2024 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="AqKwS/sA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D487E29CEF
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726239151; cv=none; b=OzTb987odWSKnNPB3dkz3Rdw5W5jfMa7ujt3+8tesg97Q7NR6+BothT/h8Wza0Ytg4NZgb5ctsv/P5tPniH9WXSuiwsa2vaNyRkOhC8k/uBk37465GfPuz4xyEZB3MRXOwoqZvRC63tOsKmsidQHHG5n8qitB2NwrA6CK8qklHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726239151; c=relaxed/simple;
	bh=bc19nmfDOzm1d2iw50r7gOBtML2goEgcuFtt/x25Lf8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=STuO6AKT9pGD2d8wtWN9G5wx6ZPBHB7C7e9Jhhp1pf+nhihj6vv0Q35hOb88wgjW+lMl0pYl5y6wCGR/mGnYUaUTkk5u8gS8bHFFqmAfJK850tk767IqB9vAiUbOo9u8uVMbY58M9bIUJvwBm7riJ1O28wm/vX0J6d0bVi37MF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=AqKwS/sA; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso2224548276.0
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1726239148; x=1726843948; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wh24t8XN3yHHOFZUwuYZW8sGA7Ptb+KwZsMuJbONzt0=;
        b=AqKwS/sA4j4V5jFweDuKGE6S/3UpSlfoZX2ugH7qbAdaB4fRWVU2sVGmG32/FzPn6x
         JvWItj61Uzh5aGWpnEuwRoDcJB2RfzgP8rgsn7FeQNeV7KjRUfHLhYSIydxd/FWlv7YA
         D5o9EFl0aO3kafDNbIZxKdiLb3cX3reooWmxL9U+aS5VNTawEpv3n891AhbffzeusJKe
         YD9ryaaXMBGlZ6kXnovS1hKpb1+lQpNMtV8vxHvFCX+8JZ3Fz5OsMAzSIbiqGoqhR8ef
         52KVsP31ufhn2j+UaK6LVLG7dvcByb41Nldu5l+CVyl6Na+XNQ5rv9spIgIgYm9pKHlc
         N03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726239148; x=1726843948;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wh24t8XN3yHHOFZUwuYZW8sGA7Ptb+KwZsMuJbONzt0=;
        b=Gekng6mrHq6sMrvoAL6Q15Ecza1XgFsGDIvASd4+Cj6L2fRxOMZO5jO+C7Rw+wdLvx
         Z03HQIPaUPmpCWFPxbgVejG1MK3cBWKATCHG2uzRfIgXDeIklFxSeLqb+IvwX1DC23WD
         2zNiTSUtgvrMbtdcSlnXbYG+Yula8I8xhSXPTGfHP1zmO0nbTUlYGAsYA8ldAK/XETr7
         btFvX3lmogxJmJYynB9oylh19U6YPSFDkaUrsLgEskfBi//QHnrpzgYcB5puztRVpbbu
         6FD6rZXI5MZVC8fyqDHHeFvx6bmtJBnMd1zZthSPmI5gvh9+GR+VC4afOUTz0u3EDGK1
         3qbQ==
X-Gm-Message-State: AOJu0YwpSPZYMt8lb5lVDl2BTX9REmwo0MOhUGvP1H2FBXkbABaY5myg
	DkmqY9tKi8Fz4VzCy5hJxENPPm9TZt/HyybKe14yDZJY1tBJ883UGhSwhbk6Jz8=
X-Google-Smtp-Source: AGHT+IGU94xKbiJ/NsGLlEWL1lJMESc5VD1fjhN/wg4OV5LxPQTPbPKdIdLKD8QBrO2C5Quex3OuFw==
X-Received: by 2002:a05:6902:2682:b0:e11:7b5b:18b0 with SMTP id 3f1490d57ef6-e1d9dc5fee7mr6441950276.47.1726239147763;
        Fri, 13 Sep 2024 07:52:27 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:9cac::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53474d632sm67209446d6.89.2024.09.13.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 07:52:27 -0700 (PDT)
Message-ID: <2042cabf9d8d2ca7faea485d2b5d21aa438a63d3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: verisilicon: av1: Fix reference video buffer
 pointer assignment
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, mchehab@kernel.org, 
	heiko@sntech.de, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Fri, 13 Sep 2024 10:52:26 -0400
In-Reply-To: <6c6e00fd-334c-41ae-963c-eeffb368b727@collabora.com>
References: 
	<01020191dc45365b-26b103cd-153a-4b74-a663-ed7beecc1713-000000@eu-west-1.amazonses.com>
	 <10f107089cf679bcabd03e49fc469bb89518deeb.camel@ndufresne.ca>
	 <6c6e00fd-334c-41ae-963c-eeffb368b727@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 11 septembre 2024 =C3=A0 10:36 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> Le 10/09/2024 =C3=A0 21:44, Nicolas Dufresne a =C3=A9crit=C2=A0:
> > Hi,
> >=20
> > Le mardi 10 septembre 2024 =C3=A0 14:10 +0000, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> > > Always get new destination buffer for reference frame because nothing
> > > garanty the one set previously is still valid or unused.
> > Mind documenting here which tests got fixed with this change ?
>=20
> Only one from chromium test suite:
> https://chromium.googlesource.com/chromium/src/media/+/refs/heads/main/te=
st/data/test-25fps.av1.ivf
>=20
> Fluster AV1 score remains unchanged.

We already integrated a lot of chromium tests in Fluster, would make sense =
to
include some more. Was this one missed ? or added later ?

>=20
> >=20
> > > Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > >   .../media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c    | 3 =
+--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av=
1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > > index 372dfcd0fcd9..2b9a1047479c 100644
> > > --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > > +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> > > @@ -161,8 +161,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(stru=
ct hantro_ctx *ctx,
> > >   		av1_dec->frame_refs[i].timestamp =3D timestamp;
> > >   		av1_dec->frame_refs[i].frame_type =3D frame->frame_type;
> > >   		av1_dec->frame_refs[i].order_hint =3D frame->order_hint;
> > > -		if (!av1_dec->frame_refs[i].vb2_ref)
> > > -			av1_dec->frame_refs[i].vb2_ref =3D hantro_get_dst_buf(ctx);
> > > +		av1_dec->frame_refs[i].vb2_ref =3D hantro_get_dst_buf(ctx);
> > Good catch, would still be nice to improve the commit message.
> >=20
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> >=20
> > >  =20
> > >   		for (j =3D 0; j < V4L2_AV1_TOTAL_REFS_PER_FRAME; j++)
> > >   			av1_dec->frame_refs[i].order_hints[j] =3D frame->order_hints[j];
> >=20


