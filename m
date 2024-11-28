Return-Path: <linux-media+bounces-22280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC679DBDB4
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 23:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE932B21001
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A22E1C4608;
	Thu, 28 Nov 2024 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erO4Um6a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E866AD4B
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732834178; cv=none; b=WfsSfVB7XEqn7vYa6bK3bJMZh8KfNbCtPV+LF4itaRYJpOlg+9pxSoa99EX5TBUvNMvkUFdKket0f++FuKpM2GeAdq+KTloHDJ2PFLdtaqc+E9PvXcA9RHFmEuj1ae7o6iGE+694JhSwdckdp6BML0iU+qpbHBs+rJr7ZKuHHhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732834178; c=relaxed/simple;
	bh=rZN46DC9os36Zuk7x5PJgJE93JDKl3ns7HgDJz6pmU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IA+aQII5LQjYOX2BG/gkLsxX3X1Rh4Bb7jGUIjcCdxxyQwY6FXhjGenjhlKWAOjS/rdJwE3wxiNcBpmFjACV67kK1k5GHXSgIYrjv7VhOapN1L8JnQMRKpE2NbZOJcPfFQ+Vs2wO4NQ048fBOmX5eqstUNHC5cgZFOlR5hHrHL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erO4Um6a; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4adde46ccf8so335531137.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 14:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732834176; x=1733438976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r0rjNzrsjLF0belU9ewTgcm8PTwXJTXwJjtfoXG2qg=;
        b=erO4Um6a4uACipWSLbAxjuBxepqlmvBUOZnro3jtaNiVft9sdI4RJey0BdSdKPQRPl
         tMa3A3C9tY1k7SxCSw6OR+NNRQ44pIh3mm7aq5J9Cu1QIDi/7sPgof1Wd/bhGXXagAFt
         73l/owqxEeSHZIrmJF1JUF02W9lq6O5F2xRTodzo6bVMz8QDi3WDn60cevL9DLy0eiDj
         JpAGGR8x2bMs0/OGyAHJpPKnq86KCTa8vCS3KE/57ng/KxoGkxcp9wS7VSG9O43NLMdw
         PSMZobxtcwCVAOqZUhMJ1INa+l1euZS92RLR6bNpiJWDAOhtudXAQjTMe9XLuZ3MZgNy
         4WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732834176; x=1733438976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r0rjNzrsjLF0belU9ewTgcm8PTwXJTXwJjtfoXG2qg=;
        b=XEhTDssCq2OoYibobNuxA75UpHq+cOALOeptPrOQJ9avqG7nSa0d2KNhkrF6ol3ckB
         r5Do2eWrHryhhzG/MK6xdlCoQG0mf9DGj+0P1dd5ahdt6fMab2lt1a8FFZNeHYW1+2hI
         2tlm5ES2933PPAGfMTFLA18ufYZnpmCJfp8RFumFxT6mkuEfjTu/Iibxy6DhW1I6lWoq
         wTCSgeynPDsjgcVnnAUP5LvhGf/eA/2AgZ6s6TYWL8GPYM1inWtCFT/nalHRsOnNbdBx
         H4qvp7BmtcP7B3fK7cRa22La2WGNAD0m5Oz1cSHHfBN5EwzEFx5nI/fPprPH87MsTEIe
         MWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCYNtTmuH1NOGJvoOsoOJMg4I/elR+gjdL7ba06gITPpX9HqmU8NPq2HffKisfDbPdc78f4Rprba7n8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDLUZgMUH+82k9eqwSTPx/iDM19Y7PhnGQaq3boXQsX0STbgH
	ug09QUVHEwYOyOdp3eG6f8PNtr1FOkzTtk65G5GBNlEjNSDkPnGBh2eGpTlMkEHku5uYKziqaUP
	/y6jH3XjATSDjUpMoB2O7Ca6a31Q=
X-Gm-Gg: ASbGncu9Y4S+ocJPtDL4vjmA+FnbSgqEdpF8hKvWG9sxdS75T0GFeIQBvn4ZM3u1QCX
	ZLTym/SeLx/i9cZ0XmD1Lr9iSPsOSfQ==
X-Google-Smtp-Source: AGHT+IEcEl0mfQFQdmPo3vTd8dHy5EzlHQEaHLzdUTGWh2lGfhr8Z8U0Xe4t5TYtfv5JAqXDvpkgfl9ph7r0NQ7tc98=
X-Received: by 2002:a05:6102:f11:b0:4af:2d25:c47d with SMTP id
 ada2fe7eead31-4af4491a0ddmr11729992137.18.1732834176040; Thu, 28 Nov 2024
 14:49:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128152338.4583-1-hdegoede@redhat.com> <20241128152338.4583-2-hdegoede@redhat.com>
 <CAPybu_254vEO4u-3kxz-hi=mDaMj_WVGRqZJgy9gdHQZT++pxA@mail.gmail.com>
In-Reply-To: <CAPybu_254vEO4u-3kxz-hi=mDaMj_WVGRqZJgy9gdHQZT++pxA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 28 Nov 2024 23:49:20 +0100
Message-ID: <CAPybu_1jzxkdtdZ0oTrbhBZBm+N6O+aYG_K1rnzAAoyP9is+6Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: ov2740: Debug log chip ID
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 5:38=E2=80=AFPM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> On Thu, Nov 28, 2024 at 4:23=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:
> >
> > Calling the identify function may get delayed till the first stream-on,
> > add a dev_dbg() to it so that we know when it has run. This is useful
> > to debug bring-up problems related to regulators / clks / GPIOs.
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> > ---
> >  drivers/media/i2c/ov2740.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > index 387c529d9736..e7a611967b40 100644
> > --- a/drivers/media/i2c/ov2740.c
> > +++ b/drivers/media/i2c/ov2740.c
> > @@ -644,6 +644,8 @@ static int ov2740_identify_module(struct ov2740 *ov=
2740)
> >                 return -ENXIO;
> >         }
> >
> > +       dev_dbg(&client->dev, "chip id: %x\n", val);
> > +
> nit: I would have written 0x%x instead, but the previous lines there
> is %x !=3D %x..
> So up to you :)
>
> >         ov2740->identified =3D true;
> >
> >         return 0;
> > --
> > 2.47.0
> >
> >
>
>
> --
> Ricardo Ribalda



--=20
Ricardo Ribalda

