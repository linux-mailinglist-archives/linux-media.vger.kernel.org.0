Return-Path: <linux-media+bounces-4884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBA84F8F4
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6B991C21115
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 15:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2827603D;
	Fri,  9 Feb 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="QG9ie1r/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAF94D58C
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707494135; cv=none; b=Oh6oxxSMYiJOWigH1V8/qUCnhLluukaXN1vFVULuqZYV9xSoVpp6zMD3PXOMWBoIn3tZwXcpTDB5LYYsw/di2jDaEJuwoHBAnRgb1cbxZ9eEYA5OK1mlvzqpPMDk/mvbRpNF1DfTLL9gBKJ0WFrzjy1fFPGOmCxHDBRFc+przGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707494135; c=relaxed/simple;
	bh=ajwh+x3ecx0Z0fRorHHcgBJQq6Eh3+skNKTPLpFGi+Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rx+WwhmnJi4lZTFE587UWHuT3Q3hQXCZ5yoO8jCr5Pxen1ghXWA+NODYpAEjTRCdYYXfYW/73ngt9d5IgVex/rjvIaNNgDLl2f2VKESm2/ousRHdOBBKGVI9fI8ocTnocE07cMspIOQDve+Xjl0UO0SRPnqyyPXksUMbFyIWN9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=QG9ie1r/; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-783dc658bd9so52037485a.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707494133; x=1708098933; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NntcZomGF7QIa8tXa6Kdi904IyxO2ZFDhwzU/Sa6iOA=;
        b=QG9ie1r/qLE1sa5fohsxDTvw3abQqsLOWnFz7euHQeLntgZ4B0/AIr6JHwMYlk9OKB
         mm38SZTLV7A96/UK73DbXMSFeC6d2aW6KmHH5TH+qxcKrzlDqc2HWqxWk+yUF6JchE6+
         wlxsoZdoyH+4RiAyG5yhqLPl+my0KY5ofJM/l11PwtZBxM6DFucvVtVjYNSex1TiSVbD
         +1yynTlHuTYzT+/4RmYJ3eWUjtg4iTc4IPQVZCC8k+xTUTIG004I/8Ko/DAUVDglq6+d
         NBpGmhuGYt4zoTn1oR8n4m6DZqtVltDgfZHWnvTkDAVggjOlJtWuDkyA8KpdiW9SZNuh
         g/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707494133; x=1708098933;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NntcZomGF7QIa8tXa6Kdi904IyxO2ZFDhwzU/Sa6iOA=;
        b=XIH8oo7CRdYhonAuiewyEFnwmdNgH1TPApCNE9/XTDz/n6gU4OTy6mlA5kQ95R/51k
         yhCCpyncRDPcAVvR3SdZwEbWrGenCXX6wmwRroc4wjauesbxol7C/eENuYvt3oGPRKBd
         QIcR+02NswLOhp7tyz7KkdegHApGdVrtqVqnzRZ8d/45a9wNEtxq6Vo0+7fSFg/KuvvX
         G/5CP05GaSvGwo/ZVYkI9UIILeSLBLi8RcWisFXdWZ0Gxr9bhrydL5BYd1+EqIubFN5w
         WarUm35vAzhRb+59gZPgW1pcklpoJrE4otDW/Zuw4Y0zqQvw19YL4kj5YgJfFzgHsU4J
         PPQw==
X-Gm-Message-State: AOJu0YzMFlflIvxi4HekW33FGO5CkjnrLjjz5XDD9vamAVVa4Tnq4wKX
	pmHKUJKa1dZ/Uum+KbFNnJsU13xPZWG4lGBjFNVvVg5bl3Orbd8KrWyf9ebzArU=
X-Google-Smtp-Source: AGHT+IEuYI+rsrBSlGggn+2Q31B4DGjAB1VBAvblEhBkPFSGCI4SMYCMjM9NtnCxZCwUoO7fFjY17w==
X-Received: by 2002:a05:620a:1a88:b0:785:b193:5c3a with SMTP id bl8-20020a05620a1a8800b00785b1935c3amr2733634qkb.10.1707494132811;
        Fri, 09 Feb 2024 07:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwDS2hO0HolXtnYkD7EsL5zuXul1hd0er7Iincsj1rKo6qvowa+P+PsfgqHo4BKQCICpOvspsEhysRW2BEMqRqmF2L75Fno9Aty7Q=
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id br40-20020a05620a462800b00783e3b030e7sm829025qkb.33.2024.02.09.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 07:55:32 -0800 (PST)
Message-ID: <64bd73f38cc1aaa1f68530ce39efac1d294adb3f.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: atomisp: make dbgopt static
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 09 Feb 2024 10:55:31 -0500
In-Reply-To: <c9ae83a9-de76-433a-8d1a-0aae69e50629@xs4all.nl>
References: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
	 <186826ed0f3d3ff42171fdabb30897f03575141a.1706865681.git.hverkuil-cisco@xs4all.nl>
	 <c9ae83a9-de76-433a-8d1a-0aae69e50629@xs4all.nl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 02 f=C3=A9vrier 2024 =C3=A0 11:04 +0100, Hans Verkuil a =C3=A9c=
rit=C2=A0:
> On 02/02/2024 10:21, Hans Verkuil wrote:
> > This fixes a sparse warning:
> >=20
> > drivers/staging/media/atomisp/pci/atomisp_drvfs.c:40:14: warning: symbo=
l 'dbgopt' was not declared. Should it be static?
> >=20
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>=20
> Fixes: b03301870d9b ("media: atomisp: Replace atomisp_drvfs attr with usi=
ng driver.dev_groups attr")

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/driver=
s/staging/media/atomisp/pci/atomisp_drvfs.c
> > index 293171da1266..ba7dd569a55a 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
> > @@ -37,7 +37,7 @@
> >   *        bit 1: running binary
> >   *        bit 2: memory statistic
> >   */
> > -unsigned int dbgopt =3D OPTION_BIN_LIST;
> > +static unsigned int dbgopt =3D OPTION_BIN_LIST;
> > =20
> >  static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
> >  				    unsigned int opt)
>=20
>=20


