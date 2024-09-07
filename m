Return-Path: <linux-media+bounces-17883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC8970424
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 23:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6E61C21228
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 21:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A681684B4;
	Sat,  7 Sep 2024 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg9a0+87"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F012FB34;
	Sat,  7 Sep 2024 21:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725743379; cv=none; b=Yq0vFEKhxi4rxwCTBKJqgP/JzVcUjLydQepUDoau8i8oq2ixIJLkw/S8kalDTttB7dqaUi9f330bt6XFaV81gSLvEpxuMa2icBCc+QtmyjW+KJQfRnwqoKK0zV6x/7YzWlG8Nk/E4MrUdAJbNX1At+neHAehGyzGRTqHYxoJF4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725743379; c=relaxed/simple;
	bh=1uW+d9sdd9rkWbcIfoEFXdx2VuskJkACySH3FP3tVCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhH15rGoqJsdRAv9yRHMDrUG+cH/I9XptB1dIxq3BH1wfa9+bykcA3A4HPDy882wAxPbVRMFG/g0yuP6Qxl+qzEH5ixqygs1V3foUBfmB8xu2ytAhT7G80tzRO+23kKLyq3LE/UiwwwdHQGJiiIFd94r1eXF3jTcOH3NRxEKWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zg9a0+87; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-501213e5ad4so1749267e0c.0;
        Sat, 07 Sep 2024 14:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725743377; x=1726348177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hpm7Wbd4ocOfdFXAT5w9pBvB6n52buALCd75XKBjrDk=;
        b=Zg9a0+87depCbov2II9zwe7ukNaLh7JLgFjqQzKGZYvRCw4v0Jd9VE7CGo/80t92d+
         R0Voj8aOdUB7eVZPhMbr8mzfrSJ+0sJk5f60mgnWmyLNP9gCW4WVsspw/zfCcrXKpffy
         Kfv9TxNOFDM6XkvadF/3QKeMIWQb2Da8q7NbE9kdmloeIdzd7H6YNZSUxAIPbExU0ySq
         CBPh4kYpyB8xYNpnmYOgotjzzdDzX+c/vZro1rp8NJT3zpTGtN7TL24CJr1/NRHdfPcv
         DkX0Vc36LaG4ghCNHo0tOumq0zpvXbYJ7jsC/mYsmoxgw9xjUghXeyleQMVZgAUnisTH
         GB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725743377; x=1726348177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hpm7Wbd4ocOfdFXAT5w9pBvB6n52buALCd75XKBjrDk=;
        b=DaG7ucCpK3DQErDmpykSRqCZWpL+gHBPFvyEdfYjHhS463gZK343dRw5pvcjXRgxJ2
         EKMgpRBYgeIBSBdEPY9vOu0ouTXdaTc9rO8J4gz2LpPZXDtewNsr75HJV/LXT1khy+Iu
         VCfFe+U1XtmNK4100uojmn39z4E2+kfXoQUL6vc3LScLvBHmYXQX8M1ExqJR3zi8IR2F
         0LiNQ7e9zBm/LCUXeVLRtLrihT1m6A6ep4JGCAioqWnBQTYne1DqGisnlTS86btmsLSe
         LgboxxcMReLoHALhbxu3xCS3LSZpd1a4j+j2pDuYw9rPuxhh5rmIMWSlGSthQZQWk+IH
         EpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtUrWQPFfGNIj5OwwrILbDKAGXbguJgK2Z0VLSR3AXHRsihZvCK5SZvi4jUnZcHWnB0w9E16YfCpRqEj0=@vger.kernel.org, AJvYcCWTilKG1/xyPZPB8P2EhxRTqDhtFXtr5jJUr8QEO5BL/n0ll8bbOBSIfNr0VG+/8n7L6iDv1ID0We79+Es=@vger.kernel.org, AJvYcCXQKFE2HBMa+HlUfZz+GanOCoYl6aZjCYGzd4cHTTe61jfK2IkL9MP5nJ4FS68PCI7WdiYIW42WS/byAhOCTAZYRz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+N3M+Z7Se3E3k/fYRNjsTGZE3ImRCfy67ygEdaKOUhsXIlHYm
	jQZdkT/XSn55LL7/00EG6JW58LEHuiSLhMUQ548xhCNGSoNQQaYZoBqzYIVy8B4EZweJA6q/nkB
	foTwHqfz4ON0FjrigqJxMrdtQY/I=
X-Google-Smtp-Source: AGHT+IEhcuTzXRccMQGFpEATlEj14efd9tg5Xvp4VsfLp241dvgxYYTyuRZefVy7hzFsMIln7bsE+brQAq3I+qvAYBs=
X-Received: by 2002:a05:6122:904:b0:4ef:58c8:4777 with SMTP id
 71dfb90a1353d-5019d455718mr5666056e0c.4.1725743376525; Sat, 07 Sep 2024
 14:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240906231038.GC12915@pendragon.ideasonboard.com>
In-Reply-To: <20240906231038.GC12915@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 7 Sep 2024 22:09:10 +0100
Message-ID: <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>
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

Thank you for the review.

On Sat, Sep 7, 2024 at 12:10=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Sep 06, 2024 at 06:39:46PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
> > virtual channel should be processed from the four available VCs. To
> > retrieve this information from the connected subdevice, the
> > .get_frame_desc() function is called.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 29 +++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index bbf4674f888d..6101a070e785 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -433,12 +433,41 @@ void rzg2l_cru_stop_image_processing(struct rzg2l=
_cru_dev *cru)
> >       spin_unlock_irqrestore(&cru->qlock, flags);
> >  }
> >
> > +static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> > +{
> > +     struct v4l2_mbus_frame_desc fd =3D { };
> > +     struct media_pad *pad;
> > +     int ret;
> > +
> > +     pad =3D media_pad_remote_pad_unique(&cru->ip.pads[1]);
>
> It would be nice to use RZG2L_CRU_IP_SOURCE here instead of hardcoding
> the pad number. That would require moving rzg2l_csi2_pads to the shared
> header. You can do that on top.
>
With the below comment we dont need to move rzg2l_csi2_pads into the
shared header.

> An now that I've said that, is it really the source pad you need here ?
>
Ouch you are right.

> > +     if (IS_ERR(pad))
> > +             return PTR_ERR(pad);
>
> Can this happen, or would the pipeline fail to validate ? I think you
> can set the MUST_CONNECT flag on the sink pad, then you'll have a
> guarantee something will be connected.
>
After adding the MUST_CONNECT flag, I wouldn't need the  above
media_pad_remote_pad_unique()...

> > +
> > +     ret =3D v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc,
> > +                            pad->index, &fd);
... and here I can use '0' instead or do you prefer RZG2L_CRU_IP_SINK
(I say because we are calling into remote subdev of IP which is CSI so
the RZG2L_CRU_IP_SINK wont make sense)?

> > +     if (ret < 0 && ret !=3D -ENOIOCTLCMD)
>
> Printing an error message would help debugging.
>
OK, I will add.

> > +             return ret;
> > +     /* If remote subdev does not implement .get_frame_desc default to=
 VC0. */
> > +     if (ret =3D=3D -ENOIOCTLCMD)
> > +             return 0;
> > +
> > +     if (fd.type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>
> An error message would help here too I think.
>
OK, I will add.

> > +             return -EINVAL;
> > +
> > +     return fd.num_entries ? fd.entry[0].bus.csi2.vc : 0;
>
> I think you should return an error if fd.num_entries is 0, that
> shouldn't happen.
>
OK, I will add.

> > +}
> > +
> >  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> >  {
> >       struct v4l2_mbus_framefmt *fmt =3D rzg2l_cru_ip_get_src_fmt(cru);
> >       unsigned long flags;
> >       int ret;
> >
> > +     ret =3D rzg2l_cru_get_virtual_channel(cru);
> > +     if (ret < 0)
> > +             return ret;
> > +     cru->csi.channel =3D ret;
>
> How about passing the value to the function that needs it, instead of
> storing it in cru->csi.channel ? You can do that on top and drop the
> csi.channel field.
>
OK, let me check if this can be done.

Cheers,
Prabhakar

