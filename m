Return-Path: <linux-media+bounces-30064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF400A865B9
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 20:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0601BA1839
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 18:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D4126FDBC;
	Fri, 11 Apr 2025 18:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zBsWChSo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFFA23E342
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 18:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744397270; cv=none; b=tPxBkmT//LsqSOCaVG4OH66AOPB94AlTMjVnszBZv9b5+TJwxF/yA3wocG9OlS7xUJVVhgBFEkKPS1iWWeMrQXYl9+80zc5e+0ZeX4fiAMmpcF7kydwEY64ZGjskuqsQR4TjZzJ+FzPfMMKkdthghFfpmaT3ZvmpWPRhZ9r/AsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744397270; c=relaxed/simple;
	bh=igfmk052ohOfBX0sJswb9359FPqtwwRUyoS0iYxyj+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MvjAh46KI4CT4zJ2wgLkWYjWbWkfydMsH1mMzfTY+rWm1JF6NUvr4btxOimRpuuDzicuK4EDdP0JR9cpfKEQ+l+PgyqaHq4xrtDnsWhfPH9244Llh8zncAFSrgEgMa74TNxToFyR7SJXf/0dP67+k5NLNDccbpCuFpyq7z7yHCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zBsWChSo; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c55500d08cso210393285a.0
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 11:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744397267; x=1745002067; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=zBsWChSox7ZhlMvsteMOMcQqiUximK3oCwHzZQ4O778uJdwX9oTFMz9C5u5l0D42h1
         bc9FykbUc4zzcfPnIRT637kMziKAlQjxejIeEzU2LYYAIxPwMhijU9RlUlwXOyaaOO77
         WhkZiD1uw5+S1lwLQW1lVQ2EvQl7aq7c6ZF41sbcM+BbM/eavj6wfVvVd8AKWhQr3KH3
         c0R8/T0PVsn/mbYteUk8O+JJ+r7Fpd6sZ2CzuZ13V637RBYcR5y4CDAMWdMEDlMsycsv
         9/kfRnzkBTe/DlcCk5Ul8XHqA+xK2Y2evDtedBuTzfPQevWnEu6K3aWZ+Xq044rgKZGv
         6iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744397267; x=1745002067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsKwnpTHjMkgeZIljAagk5lvn0NCV/Em7Uj95pOpDGI=;
        b=YYcB2B6v3xVaFWAqVo8b7pPsSrh1UVBBu9qhsR/iJ8edac6ABsN+9feCTOuMz6+SyE
         lZXriWwMxVr5QdjLbA+MMOaa4jtWFMCEEx2+PyF3TbHB2599QDarGv/C694KddComei2
         p+fBoOXA/F4xZMBc7kcAz03qG1STs6Ni7q60V9VlamUFetdxXEBSTpMJo2G7rxK+YYLM
         4VnDo6NEPX8C8CGTe37seWaQ2DzM+tUnEjNWN7NfzMrgnWCobvTP/hbD2mJ5GE6q4moa
         bwHpLtZ3/La7XSMzPogu+qPICX6Lc3idRNWzOEOolcZ1i1zTtvj7VXX5HEDxElQLwYAJ
         cFxg==
X-Forwarded-Encrypted: i=1; AJvYcCU1sGW1zo3ZfmY1MU/iCYfSmJqGq1yW9yBVrmsZ6EyMwwWSTJ78aENcTo+Z2aOs5bCKTKEv2yMU6rfE0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM2sFQp62VQkr7wDSnOYugx0vp3/u109dMZedZ+/4vbIlrNneT
	JrVwX0WBhb3Q3Vq84r1RjRUwWgQeKoO+gpjoLFKisnlJlwiWlqYwSB7LNUHl3EY=
X-Gm-Gg: ASbGncsUMABmIFplTr3NrLAFw8v9gPRxixTbrF+Bq5E5LnP12EYn+U37L3u2nrjkOME
	OWuuvXE2Pn10nHrVx4Rju4+0xYziy8xbXt0cxXgLU+4PODX3r9WowmGrV7yUDNsqk9yt1Vi51gs
	f303d4tzEkvEZJYuY+oV7psJ5noCvWQ4A2kF7pxsD0uEbHL3tTyoqNVhgXnraE5dc9sRL6lKIcx
	QKiZGU+qxNoDRVZxo+eY22HZ9Oz4dutEdVfA8/a4x/u7Myls1Yw7lIz6LimbrdC8MYn+bWCQHOC
	o9ubJRhleTCIPynCCuDaLSOdgL9oG8iPBJUOx6m7xvE77w==
X-Google-Smtp-Source: AGHT+IFtKnV9+w0FwXGSzvq+4jUfFCuVoEptoZcv67KhNBh18LEdtioKg5wo6qZbIxlKb9n37yn5ZQ==
X-Received: by 2002:a05:620a:17a9:b0:7c5:57d6:ce3c with SMTP id af79cd13be357-7c7af1328a8mr627352285a.22.1744397266859;
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8951969sm298592885a.45.2025.04.11.11.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:47:46 -0700 (PDT)
Message-ID: <588eb09a61dea0c07e02c8b474972c6ca9b3b3e8.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data()
 ahead
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 mirela.rabulea@oss.nxp.com, 	shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, 	festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, 	imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 11 Apr 2025 14:47:44 -0400
In-Reply-To: <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
	 <20250411074347.809-2-ming.qian@oss.nxp.com>
	 <Z/kpBXvJe/n2YHg7@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 11 avril 2025 =C3=A0 10:36 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Fri, Apr 11, 2025 at 03:43:40PM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data(=
)
> > allowing to call that function during allocation failures.
> > No functional changes are made.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> > =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 46=
 +++++++++++--------
> > =C2=A01 file changed, 26 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/m=
edia/platform/nxp/imx-jpeg/mxc-jpeg.c
> > index 0e6ee997284b..b2f7e9ad1885 100644
> > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_=
data *slot_data)
> > =C2=A0	return -1;
> > =C2=A0}
> >=20
> > +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > +{
> > +	/* free descriptor for decoding/encoding phase */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.desc,
> > +			=C2=A0 jpeg->slot_data.desc_handle);
> > +	jpeg->slot_data.desc =3D NULL;
> > +	jpeg->slot_data.desc_handle =3D 0;
>=20
> You add above two lines, it is not simple move function. Move above two
> line change to next patch.

What about just making this its own commit, give you the chance to
write down that your making that function safe to be called multiple
times ?

Nicolas

>=20
> Frank
>=20
> > +
> > +	/* free descriptor for encoder configuration phase / decoder DHT */
> > +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > +			=C2=A0 jpeg->slot_data.cfg_desc,
> > +			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > +	jpeg->slot_data.cfg_desc_handle =3D 0;
> > +	jpeg->slot_data.cfg_desc =3D NULL;
>=20
> The same here.
>=20
> > +
> > +	/* free configuration stream */
> > +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > +			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > +	jpeg->slot_data.cfg_stream_vaddr =3D NULL;
> > +	jpeg->slot_data.cfg_stream_handle =3D 0;
>=20
> The same here.
>=20
> > +
> > +	jpeg->slot_data.used =3D false;
> > +}
> > +
> > =C2=A0static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
> > =C2=A0{
> > =C2=A0	struct mxc_jpeg_desc *desc;
> > @@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jp=
eg_dev *jpeg)
> > =C2=A0	return false;
> > =C2=A0}
> >=20
> > -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
> > -{
> > -	/* free descriptor for decoding/encoding phase */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.desc,
> > -			=C2=A0 jpeg->slot_data.desc_handle);
> > -
> > -	/* free descriptor for encoder configuration phase / decoder DHT */
> > -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> > -			=C2=A0 jpeg->slot_data.cfg_desc,
> > -			=C2=A0 jpeg->slot_data.cfg_desc_handle);
> > -
> > -	/* free configuration stream */
> > -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_vaddr,
> > -			=C2=A0 jpeg->slot_data.cfg_stream_handle);
> > -
> > -	jpeg->slot_data.used =3D false;
> > -}
> > -
> > =C2=A0static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ct=
x *ctx,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*src_buf,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_buffer =
*dst_buf)
> > --
> > 2.43.0-rc1
> >=20

