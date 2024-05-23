Return-Path: <linux-media+bounces-11822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 620718CD392
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 15:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CEFAB218D3
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8D014B077;
	Thu, 23 May 2024 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1NdlwvX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9A41D52D;
	Thu, 23 May 2024 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470188; cv=none; b=XR6F82KXcpcCecV8wQO4Qy5m7I+1LFu43UUFJYPp9Fiz2SGBNRf/dqkTw+QrmulI3ShuECzuGTBxVjHR1xrEzZWoZZhI5gJJcXD7GHfGTOj+kH0ezAXU4azW6c3OTBuWdNLySuGfBwZkR7QIQ3BKrtChp5cV7w6lR7JNBOgxozA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470188; c=relaxed/simple;
	bh=HfO10miRj/En55ix6RsWM7ErWsVGO7O8xMQcsVwjejI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=e5pQcAen4mZmsWAjc7la3w3HSgI5HRTE1PF61HwkZMljV4PeCy2K9n5mNVBQDHr3FkWcyWnxCEHUnmUSbaGrkM4MSG6JV5qxCt2Q1xs1cHbHUJorZy0oXYMuQwNELqFgdMcrC/zP4zORvecr5XXilpLz23GVRZxUkRe7hOKSsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1NdlwvX; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2bd8e2fba43so2043314a91.1;
        Thu, 23 May 2024 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716470186; x=1717074986; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krAgymTN13Qe0M2nWYZtjIVSErtkmVKszicusS4cC9A=;
        b=G1NdlwvXjtM9o7OkyCXbg4/EYmyczH2B7kUKdRuHDPq0obhE8AmVPtreFJlKNsfmhw
         NoBj/rSCcDPX+2QDAAnJ0P+xmMFMClRVIEfl8yfuGFjoVrVRBSRZPkgnp9922JcM1QFN
         YnKmR62OqPMK0Wn9+MuuLVQOwRD6BtPhB3NiJO0Asd8KL2OCjnV8hjd+wBZi0Rp6QEAo
         rK+SK5C+QX+V91uugNTujEEpyOgi9p5SZqMiUE71MYSaPlvWi/aDNh4+nzH6+Wavx/s9
         H1yLutvEgJVUdyelz+qO5nHiMzOAgsXpu/uG+LFJvDQC661bpMUygWgmkiIa9vVtQfiq
         Fwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716470186; x=1717074986;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krAgymTN13Qe0M2nWYZtjIVSErtkmVKszicusS4cC9A=;
        b=Zk9aWeufOZ/bPs0jerZX9nHBoSWuniEXklWd1sLp3nSgEE8/FBUFCTnb0NLJT+I3Ev
         XHeKDJxcB3MKVxqeoEnG4sOUMvkMy13E+fgVDCLd1TmfxAwdrh8koTK/tyZ5BqmeLelN
         WXfbjP8z+uGZma/1OwqVqcWoc0aw5UOZPx6vm/4m49p0AGumRBUR225NtWIEVjU6y0KD
         BS74pNJWSaDubJPC/hyhaLFNychAzeCN1CtAwTBZbkfsfNksnt0sTPHnIgA7n8BcpF9t
         XDTLuZmR0CwxAmtF3sNjLh3fJ0w//HSK4D+ejSbxGllY2oNDBjXLstcSl/+wm/Erz0S4
         9YUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpI8HJA9oSAbk5BXwWLwN/AkEfqb6fcyn+ORtac0ElXRIwp/DSxKzBliA3dx2eBuj5m2VI+s97mwqYLyF7exxUzAaTYPLAPppsOon1UI9we0OPcm+giAxoemiMbczCg+przMZZOam/uf0=
X-Gm-Message-State: AOJu0YwE2sQiCXQVxI+302uedoQkvOSnWMh5+xvUregbuX8wv1imqbVA
	DTXSKoqC/5H5w1n3+UmiYhuvc+sggOwQ1M03bsFT8eXhHN4Vt9ix51+omUjOIKWs1RqpVt0ohgJ
	ycSPKQAujnu83N0E95oCSeQAO9Bg=
X-Google-Smtp-Source: AGHT+IGGKXZE1/r1vCy2g5iZb2l6KTFjQQ+D0yfJv8nQ7uq+0DQUFpfSrtuv/8ELCMJoYu/xdvdwecFz4i+iDwweleo=
X-Received: by 2002:a17:90b:1916:b0:2be:c0:f088 with SMTP id
 98e67ed59e1d1-2be00c0f107mr286624a91.38.1716470186007; Thu, 23 May 2024
 06:16:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com>
 <CANXPkT6Bcj0Xbn308jNGp-vqTEcB9LKtUjZ1_zS-tc7KuBEMwA@mail.gmail.com> <CANXPkT7Sv3TSNaPuPMVdpST4vGYZrvh+cfuEX7WjO+i0SP__PA@mail.gmail.com>
In-Reply-To: <CANXPkT7Sv3TSNaPuPMVdpST4vGYZrvh+cfuEX7WjO+i0SP__PA@mail.gmail.com>
From: YongSu Yoo <yongsuyoo0215@gmail.com>
Date: Thu, 23 May 2024 22:16:15 +0900
Message-ID: <CANXPkT6GdjfmRr5rzJfqc0N1O2dAOneZKhLA4yCejGc3hV2kTA@mail.gmail.com>
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into CA_RESET
To: mchehab@kernel.org, yongsuyoo0215@gmail.com, v4bel@theori.io, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear All

Can you review this patch ?
Can you share how this modification is going ?

2024=EB=85=84 5=EC=9B=94 1=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:54, Yo=
ngSu Yoo <yongsuyoo0215@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Dear All
>
> Can you review this patch ?
> Can you share how this modification is going ?
>
> 2024=EB=85=84 4=EC=9B=94 11=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 9:02,=
 YongSu Yoo <yongsuyoo0215@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > Dear All
> >
> > Can you review this patch ?
> > Can you share how this modification is going ?
> >
> > 2024=EB=85=84 3=EC=9B=94 8=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 9:13=
, <yongsuyoo0215@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> > >
> > > From: Yongsu yoo <yongsuyoo0215@gmail.com>
> > >
> > > Signed-off-by:Yongsu Yoo <yongsuyoo0215@gmail.com>
> > >
> > > In source/drivers/media/dvb-core/dvb_ca_en50221.c, if the CA_RESET io=
ctl
> > > is called, in a normal case, the state of the thread of the
> > > dvb_ca_en50221_thread_state_machine will transit like below order.
> > > DVB_CA_SLOTSTATE_NONE -> DVB_CA_SLOTSTATE_UNINITIALISED ->
> > > DVB_CA_SLOTSTATE_WAITREADY -> DVB_CA_SLOTSTATE_VALIDATE ->
> > > DVB_CA_SLOTSTATE_WAITFR -> DVB_CA_SLOTSTATE_LINKINIT ->
> > > DVB_CA_SLOTSTATE_RUNNING
> > > But in some problem cases, the state will become DVB_CA_SLOTSTATE_INV=
ALID.
> > > Among the above mentioned states, the DVB_CA_SLOTSTATE_NONE and
> > > the DVB_CA_SLOTSTATE_INVALID are "already stablized" states,
> > > whereas other states are "transiting" states.
> > > The "already stablized" states mean no matter how long time we wait,
> > > the state will not be changed.
> > > The "transiting" states mean the states whose final state is not yet
> > > determined. The state keeps to be changed. Only after some time passe=
s,
> > > we get to know whether the final state will be DVB_CA_SLOTSTATE_RUNNI=
NG
> > > or DVB_CA_SLOTSTATE_INVALID.
> > > During the "transiting" states, we do not yet know whether the
> > > CA_RESET operation, which triggered the "transiting" states, will
> > > succeed or fail. For this reason, during the "transiting" states, if
> > > another CA_RESET ioctl is called and if this new CA_RESET ioctl
> > > operation begins again, it will be meaningless and waste time.
> > > For preventing this problem from happening, we make CA_RESET ioctl do
> > > nothing and only return EBUSY if the ioctl is called during the
> > > "transiting" states.
> > > ---
> > >  drivers/media/dvb-core/dvb_ca_en50221.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/=
dvb-core/dvb_ca_en50221.c
> > > index baf64540dc00..2e8aec354b7c 100644
> > > --- a/drivers/media/dvb-core/dvb_ca_en50221.c
> > > +++ b/drivers/media/dvb-core/dvb_ca_en50221.c
> > > @@ -1362,13 +1362,19 @@ static int dvb_ca_en50221_io_do_ioctl(struct =
file *file,
> > >                         struct dvb_ca_slot *sl =3D &ca->slot_info[slo=
t];
> > >
> > >                         mutex_lock(&sl->slot_lock);
> > > -                       if (sl->slot_state !=3D DVB_CA_SLOTSTATE_NONE=
) {
> > > +                       if ((sl->slot_state =3D=3D DVB_CA_SLOTSTATE_R=
UNNING) ||
> > > +                           (sl->slot_state =3D=3D DVB_CA_SLOTSTATE_I=
NVALID)) {
> > >                                 dvb_ca_en50221_slot_shutdown(ca, slot=
);
> > >                                 if (ca->flags & DVB_CA_EN50221_FLAG_I=
RQ_CAMCHANGE)
> > >                                         dvb_ca_en50221_camchange_irq(=
ca->pub,
> > >                                                                      =
slot,
> > >                                                                      =
DVB_CA_EN50221_CAMCHANGE_INSERTED);
> > >                         }
> > > +                       else {
> > > +                               if (sl->slot_state !=3D DVB_CA_SLOTST=
ATE_NONE) {
> > > +                                       err =3D -EBUSY;
> > > +                               }
> > > +                       }
> > >                         mutex_unlock(&sl->slot_lock);
> > >                 }
> > >                 ca->next_read_slot =3D 0;
> > > --
> > > 2.17.1
> > >

