Return-Path: <linux-media+bounces-17978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1285E97148F
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 11:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 399161C21C46
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C051B3B34;
	Mon,  9 Sep 2024 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHlZCiGz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413F175D21;
	Mon,  9 Sep 2024 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875909; cv=none; b=FqoPtGsI+V2N8SlvAp1r6a9UIK5thc6OjIGLoAIdx0TPKIgQfbwBo5X9XGtCZHmZGqK1lj52PfkJt/qC2a8IJkuNGKCNvl3OneBi0x39B7xDmxuGr+Bb3PLoaLigIaya01E2Tq0YhhZDHd4Ys8rBPfycDhDl6xQtzfIzyQFtLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875909; c=relaxed/simple;
	bh=LVIvggWx9okkjphgwe8v15SEynfFwX8oqWrkOSgdIo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4XjiCGiPFFM8ObzfhPDjU8Iv29ZqscEvYwmiuQSOp5pRpa0TR34u0nqTTNThZyk6Jd24pNBU+8rSrIhGnr+iGOtVDB8yy4cjI6mXUdtgeR7ISmZtVO7WE/AhEvWGQibuNVsrmQjDhej+s384W7eUt4kHbbpUpuQU3hus2NKFj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHlZCiGz; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5011af337d4so1008910e0c.2;
        Mon, 09 Sep 2024 02:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725875906; x=1726480706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vXr5MYP3MaCznj178+QFs36rLC7YPn0W4A/1x+u4iA=;
        b=IHlZCiGzb9XnFUdxKgMd76hj7J/L0uzuJvQLPh/YV937kQqtMi4YaNNrgf+QNDSdsU
         EjKu+YXP2Qn6AJ4pfC7ME1LFIAGyHD+WLGIu3EoRfz/P22IojSFZ0wO4zkQqewgvank/
         7zPwR8LdOS6KnXYyOc24pep1iFuqfZSzxlyEP/hJeOTtJaxZt63UEDLkORFly64XggU6
         +BQKM1NMIwQCUWLxepxwRsqfliRU0dIlqyfyPKvVTlZV9VoXsi9Gz8oL7RTEDDXfZm2v
         AUhXxCOQNcyklWM54RSxaEifQj5d+ilp/PddBH9A2Q7Bnu19WpXzmRHja2jSEggyVgcZ
         Xtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725875906; x=1726480706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vXr5MYP3MaCznj178+QFs36rLC7YPn0W4A/1x+u4iA=;
        b=l4p2NyaO7aC2NAkxPSuBs3e0fUXpDkKV74JuY91CG/7Wr5C2GrQreieEQt87lJtcet
         4L9hfLOt+fmQ76Q4tTJoWdKSh4H6Y2rK2Fi136n08ik4z9FWKIEYjyDZqg3+izxxVLiM
         0V9EM1J3vcaBVthezBOUDM6Xa8ArunqJuxPGYdsv/xhmcRFMjIt97VA2k6M8At696JHO
         ccj2Qv0bqwOgSsOmWiGJeibwN0Zlbp4ywgteK1Mpq25lgHYboXLg2XsHsGC9nJB6WATo
         TRcR+DkcjWdtmsPb6zut7TH5H7+8awpB362eCP9aakAshiNxGR86AgEYdUVyECHbgZyM
         stPA==
X-Forwarded-Encrypted: i=1; AJvYcCUqJUhkveMm5qHjU4lqwa1hZCE0xeH2OHVQGCUkC2cPnp3w8QDC5VrBAM/haK3CMM3hcJ0Bx2tXZRTPEpM=@vger.kernel.org, AJvYcCV/2YMQFtILAb/4KF33gZihb0g6S66L5O5862PJ5Xg7WW9RROOFae6kYOxRoFMuv7YZ/IMZLhh2aemn9Po=@vger.kernel.org, AJvYcCWeHj9s2LtTzqW0W6vlcckHWMp5eG2Yiq74kpZ1cqxdG+bm5zZ8B5O79pvdQcCRa2Gi2wGGWWpFrkgXVHJR9p0563E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9UxPQ4QEfECDKkEaYgyHYB1YChmAkr+Zzi1OYQOAOV82WOyw8
	WF5MTMyeatxjn16XtmqyXuowwrJDZ+FyyPZTG+0HgOErwyoaNPS8S/xg1e8kgDEzxidwVFLeiew
	+exs6ehhLDGTeQSkIbmG5pL9Cjxmw63Xzego=
X-Google-Smtp-Source: AGHT+IHWUNk6PSIpHRo/S6Q6vUcYhzUZqQeoS4TJrOOJdeT6aKW89Wd7vzflrxrozR9H4bP1QStHecV8aEjgi5wXqaY=
X-Received: by 2002:a05:6122:2a01:b0:502:b056:f4a with SMTP id
 71dfb90a1353d-502be91a0b7mr3816926e0c.8.1725875905751; Mon, 09 Sep 2024
 02:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906231038.GC12915@pendragon.ideasonboard.com> <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>
 <20240908223905.GG15491@pendragon.ideasonboard.com>
In-Reply-To: <20240908223905.GG15491@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Sep 2024 10:57:59 +0100
Message-ID: <CA+V-a8sEgOmL5P=YDZB4EnFy=RSFWjCVVPuBFYr39qSB83D_qQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: platform: rzg2l-cru: rzg2l-video: Retrieve
 virtual channel information
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Sun, Sep 8, 2024 at 11:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Sat, Sep 07, 2024 at 10:09:10PM +0100, Lad, Prabhakar wrote:
> > On Sat, Sep 7, 2024 at 12:10=E2=80=AFAM Laurent Pinchart wrote:
> > > On Fri, Sep 06, 2024 at 06:39:46PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify w=
hich
> > > > virtual channel should be processed from the four available VCs. To
> > > > retrieve this information from the connected subdevice, the
> > > > .get_frame_desc() function is called.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 29 +++++++++++++++=
++++
> > > >  1 file changed, 29 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c=
 b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index bbf4674f888d..6101a070e785 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -433,12 +433,41 @@ void rzg2l_cru_stop_image_processing(struct r=
zg2l_cru_dev *cru)
> > > >       spin_unlock_irqrestore(&cru->qlock, flags);
> > > >  }
> > > >
> > > > +static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru=
)
> > > > +{
> > > > +     struct v4l2_mbus_frame_desc fd =3D { };
> > > > +     struct media_pad *pad;
> > > > +     int ret;
> > > > +
> > > > +     pad =3D media_pad_remote_pad_unique(&cru->ip.pads[1]);
> > >
> > > It would be nice to use RZG2L_CRU_IP_SOURCE here instead of hardcodin=
g
> > > the pad number. That would require moving rzg2l_csi2_pads to the shar=
ed
> > > header. You can do that on top.
> >
> > With the below comment we dont need to move rzg2l_csi2_pads into the
> > shared header.
> >
> > > An now that I've said that, is it really the source pad you need here=
 ?
> >
> > Ouch you are right.
> >
> > > > +     if (IS_ERR(pad))
> > > > +             return PTR_ERR(pad);
> > >
> > > Can this happen, or would the pipeline fail to validate ? I think you
> > > can set the MUST_CONNECT flag on the sink pad, then you'll have a
> > > guarantee something will be connected.
> >
> > After adding the MUST_CONNECT flag, I wouldn't need the  above
> > media_pad_remote_pad_unique()...
> >
> > > > +
> > > > +     ret =3D v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc,
> > > > +                            pad->index, &fd);
> >
> > ... and here I can use '0' instead
>
> Can you ? You need to call the operation on the pad of the connected
> entity that is connected to tbe sink pad of the IP entity. That would be
> the source pad of the CSI-2 RX in this case, but it can't be hardcoded
> as it could also bethe source pad of a parallel sensor (once support for
> that will be implemented). I think you therefore need to keep the
> media_pad_remote_pad_unique() call.
>
media pipeline for RZ/G2L is [0].

Calling media_pad_remote_pad_unique() with sink pad of IP entity will
return source pad of CSI-Rx, where the pad index will be '1', passing
pad index '1' to .get_frame_desc to CSI subdev and then OV5645 subdev
would return -EINVAL.

I need to update patch [1] instead of just forwarding the pad index to
remote subdev I'll need to do the same as done IP subdev ie in CSI
subdev call media_pad_remote_pad_unique() on sink pad of CSI which
will return OV5465 source pad, and this will have a pad index of '0'.
The CSI get_frame_desc() will look something like below:

static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int p=
ad,
                     struct v4l2_mbus_frame_desc *fd)
{
    struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
    struct media_pad *remote_pad;

    if (!csi2->remote_source)
        return -ENODEV;

    remote_pad =3D media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]=
);
    if (IS_ERR(remote_pad)) {
        dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
            csi2->remote_source->name, PTR_ERR(remote_pad));
        return PTR_ERR(remote_pad);
    }
    return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
remote_pad->index, fd);
}

For the parallel input case I plan to implement something similar to
R-Car vin with bool flag 'is_csi' where we skip calling
'rzg2l_cru_get_virtual_channel'.

[0] https://postimg.cc/rz0vSMLC
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024090617=
3947.282402-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

