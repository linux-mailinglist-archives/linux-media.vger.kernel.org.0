Return-Path: <linux-media+bounces-7826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E6088C51D
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 15:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E85371C62031
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 14:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A35512E1E2;
	Tue, 26 Mar 2024 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hWaMRUFH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F312DD97
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711463267; cv=none; b=pYb9LgL4Kyq9YieUE9R2d3llgcjfqQHCkdZNWcKXqS8FDjMXjS0TqyWsP4yvVM8m0z2ZCJYh2r8TPCvO/0Lw+8kPFF8wBPl8L9fWUlvmQDsAX3283NQamU7nQlb/3ZrEvESjnZjOD0nm+hkDVsd7xaFiNDmPJJNegDxGAq6kJgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711463267; c=relaxed/simple;
	bh=JGMLiMEqo/ugZVNDsBHPJqbYVvBLqNX6oNDGExzL0/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEKf7EnmSJ9wx/r02Bc7k83Y16GPAB0w0ZhCX5nfCbn1TkKUkH/wuzI3B/AsJDMV35aQFv3WsopuTl7Gd6cio7fp9CgfH2SCvmnRB3a9efQ1S0jOryJ44fbqD55w9acczPpXIIv694qEiFi12v5DTEcf9UWUOVyZVcDDdfr59qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hWaMRUFH; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-430c41f3f89so48946581cf.0
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711463264; x=1712068064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoDdW4b3h35Fn8JvKyOiN549aSte5PnUw/1LIB5ClwU=;
        b=hWaMRUFHkLa9NRm4NhJzR1CyfQyaN+azCwc3FVrARq5y2VKdOPWAsLYLraS6OZTRMe
         RSyvWyijHdXz0ukBFz+6zZAnpZQFkjBC3PeRqHA2uhVgVkDr1iLRUcKiRAbMDeGVnb1H
         sxMhut42j8XanJuCepLWDNiMYue450cTjxGUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711463264; x=1712068064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoDdW4b3h35Fn8JvKyOiN549aSte5PnUw/1LIB5ClwU=;
        b=NYs2bYKLS4O9e/JI+pCXcxCvBaKsFxfce4Q0SQtmTDiDvbWFcT6bzY/aBepYWYtlSb
         obekaiPvFSSjobsW91R0Go1cg1DlgigyYw0xnivHExZ0XvaiMJICS9B5teB4l/4qORzM
         cFTf+/YmQFSw7vK83KNTAt/Z0KfOw75fBMQB8noJw9fthfWNtUZbycaMMef1PxgNWt7T
         7DdocEjU5XbZk75Rhqm6Xv558IPreI1E80Jryj+98vi2O3WacAYULhZyg6Q0Yj4RjcmT
         8Sz44Lwiovjm7rl9Tos5ehBWs0mxJDVcKmVmWdvVtIi5NvQNWgsMEtWAXptSFBooOfP3
         vgXg==
X-Forwarded-Encrypted: i=1; AJvYcCX5bsx/9Ua56bidMQiVJAxb0CkNao0j1DlbO+qxIqP46E0ibuH7V8Vjh+S/awkFD2jJDDiHiQXXx3CIvabjlGVww0CeR2K2cpdVlqg=
X-Gm-Message-State: AOJu0Yz73h3kRuiULVMP2VHbtkun7HtuWiCeJB2st3KgxSz4T8qrFzEk
	VcTig2F8Uj4I5f4SH1jgfp0SejrESqk6hacF4VxdqVe1phG8Sl5mDETy3uGkrX/RONDbvKxtr6Z
	z3g==
X-Google-Smtp-Source: AGHT+IHzxvTrpC8PNEAgTb8i8/jkljU2CWO/iSjTdJ1CgdFkNBp7SYRnGQX/klTbjtUekLYCULKA8w==
X-Received: by 2002:ac8:5806:0:b0:431:3867:2b00 with SMTP id g6-20020ac85806000000b0043138672b00mr2391372qtg.34.1711463264432;
        Tue, 26 Mar 2024 07:27:44 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id eh15-20020a05622a578f00b004309cd26bedsm3724463qtb.72.2024.03.26.07.27.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 07:27:43 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6963c0c507eso55329946d6.1
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 07:27:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUh0Fp1ZATqlnsOj+hwtHfrRgUU4dDe1a8o6QAYTiDSpcwrBQ4TAqYMV6baHT9quQ4Fezka6HWBkvcHr5ZKMUIKmhvQeUPLwaJYrHk=
X-Received: by 2002:a05:6214:27e1:b0:690:b479:527e with SMTP id
 jt1-20020a05621427e100b00690b479527emr2874535qvb.13.1711463263089; Tue, 26
 Mar 2024 07:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325-obsbot-quirk-fix-relative-ptz-speed-v1-1-0eb1387d98c7@securitylive.com>
 <6e6b75a15cdc6a1239edc4d49b927b187ed20054.camel@irl.hu> <CAMB8T1ULcfBOB5VwZzUtvRnp4FvtBCFWxxTdb+OJK8FOpjKCXA@mail.gmail.com>
 <ec0430f6e687fc5e1a19338e381804b9d6aeabba.camel@irl.hu> <CAMB8T1Vv7CMqhH1ZY6fouxsE6r+6JbmeLnuFma_0_de814UoMA@mail.gmail.com>
 <CAMB8T1VWGaWtE0k5en4-xhE69G=OyFnhqJ3mexcgNSuvO_7uUQ@mail.gmail.com>
 <CANiDSCvGfA=B5YCQhSMRW-0cTQNWKGytQF74z9F_x-77WFPHpw@mail.gmail.com> <CAMB8T1W5K68fX4jw=V8+kqc8eT2HGCv75PAidO0Nkzy-A1jFAQ@mail.gmail.com>
In-Reply-To: <CAMB8T1W5K68fX4jw=V8+kqc8eT2HGCv75PAidO0Nkzy-A1jFAQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Mar 2024 15:27:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCu7qRnySQn=YJ=pkOOYe50H89CDw_AGu287LfjWebnnYQ@mail.gmail.com>
Message-ID: <CANiDSCu7qRnySQn=YJ=pkOOYe50H89CDw_AGu287LfjWebnnYQ@mail.gmail.com>
Subject: Re: [PATCH] uvcvideo: Remo OBSBOT quirk fix for incorrect relative
 min pan/tilt/zoom speeds
To: John Bauer <john@oxt.co>
Cc: Gergo Koteles <soyer@irl.hu>, johnebgood@securitylive.com, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linh.tp.vu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John

On Tue, 26 Mar 2024 at 09:15, John Bauer <john@oxt.co> wrote:
>
> According to the spec bPanRelative and bTiltRelative are of "Signed
> Number" but bPanSpeed and bTiltSpeed are of "Number". I think this
> implies that a negative number is not possible for a minimum here.
>
> It is very beneficial that the direction and speed are condensed into
> one value, it greatly simplifies control as shown in a test I just did
> below.
>
> Here is a quick test I just did with the patch I'll be sending
> shortly: https://www.youtube.com/watch?v=3D1XqWPROw49s

That looks pretty cool :)

Thanks!

>
> Thanks,
> John
>
> On Tue, Mar 26, 2024 at 2:47=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > Hi Jon, Hi Gergo
> >
> > On Tue, 26 Mar 2024 at 07:23, John Bauer <john@oxt.co> wrote:
> > >
> > > After looking through the current implementation all of the proper ch=
ecks are done in the getter and setter for the pan/tilt/zoom controls so th=
e only change needed is the 2 locations to get/check/set the minimum when n=
eeded. Thankfully all the code that does the hard work is already implement=
ed. I'll be submitting another patch that summarizes our findings.
> >
> >
> > My issue with the spec is that it is not clear about what GET_MIN
> > should return.  Is it the minimum absolute value for that control, or
> > the minimum value in that direction?
> >
> > In other words, can we have a device with a range (-10,20) (-A,B), or
> > only (-20,20) (-A,A) is allowed.
> >
> > If there is no device that supports (-A,B), then we do not need a quirk=
.
> >
> > Regards!
> >
> >
> > >
> > > Thanks,
> > > John
> > >
> > >
> > >
> > > On Mon, Mar 25, 2024 at 10:42=E2=80=AFPM John Bauer <john@oxt.co> wro=
te:
> > >>
> > >> Ok, I get you now Gergo, I think I got lucky and I think you're righ=
t! Digging into the UVC 1.5 spec I can see why this works, the first byte i=
n each 2 byte pair signifying the direction is just getting the signed bit =
set when a negative value is applied to both bytes so there should probably=
 be some checks.
> > >>
> > >> Here from the UVC 1.5 spec:  CT_PANTILT_RELATIVE_CONTROL
> > >> +--------+---------------+------+---------------+-------------------=
-----------------------------+
> > >> | Offset |     Field     | Size |     Value     |                  D=
escription                   |
> > >> +--------+---------------+------+---------------+-------------------=
-----------------------------+
> > >> |      0 | bPanRelative  |    1 | Signed Number | 0: Stop, 1: clockw=
ise, 0xFF: counter-clockwise |
> > >> |      1 | bPanSpeed     |    1 | Number        | Speed of the Pan m=
ovement                      |
> > >> |      2 | bTiltRelative |    1 | Signed Number | 0: Stop, 1: tilt u=
p, 0xFF: tilt down           |
> > >> |      3 | bTiltSpeed    |    1 | Number        | Speed for the Tilt=
 movement                    |
> > >> +--------+---------------+------+---------------+-------------------=
-----------------------------+
> > >>
> > >> I think it is the direction of the original implementation which is =
way easier to use than having 2 controls anyway, I would say it's preferred=
, it's how I have all my analog stick controls mappings.
> > >>
> > >> While the OBSBOT firmware implementation may handle any signed negat=
ive value in the direction byte we should probably check and make sure it c=
onforms to spec with 0xFF for counter clockwise and down.
> > >>
> > >> In the current implementation both pan and tilt each use 2 bytes:
> > >>
> > >> {
> > >> .id =3D V4L2_CID_PAN_SPEED,
> > >> .entity =3D UVC_GUID_UVC_CAMERA,
> > >> .selector =3D UVC_CT_PANTILT_RELATIVE_CONTROL,
> > >> .size =3D 16,
> > >> .offset =3D 0,
> > >> .v4l2_type =3D V4L2_CTRL_TYPE_INTEGER,
> > >> .data_type =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > >> .get =3D uvc_ctrl_get_rel_speed,
> > >> .set =3D uvc_ctrl_set_rel_speed,
> > >> },
> > >> {
> > >> .id =3D V4L2_CID_TILT_SPEED,
> > >> .entity =3D UVC_GUID_UVC_CAMERA,
> > >> .selector =3D UVC_CT_PANTILT_RELATIVE_CONTROL,
> > >> .size =3D 16,
> > >> .offset =3D 16,
> > >> .v4l2_type =3D V4L2_CTRL_TYPE_INTEGER,
> > >> .data_type =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > >> .get =3D uvc_ctrl_get_rel_speed,
> > >> .set =3D uvc_ctrl_set_rel_speed,
> > >> },
> > >>
> > >> Going to do some testing and report back.
> > >>
> > >> Thanks,
> > >> John
> > >>
> > >>
> > >>
> > >> On Mon, Mar 25, 2024 at 9:23=E2=80=AFPM Gergo Koteles <soyer@irl.hu>=
 wrote:
> > >>>
> > >>> Hi John,
> > >>>
> > >>> On Mon, 2024-03-25 at 20:51 -0500, John Bauer wrote:
> > >>>
> > >>> I understand this patch might not be the ideal or proper solution; =
but it works. I don't think the UVC
> > >>> implementation can be trusted on these cameras, just like the Windo=
ws DirectShow implementation is off.
> > >>> I put this patch out there as I have encountered many Linux users w=
ho are struggling to get proper
> > >>> control of these awesome cameras. If the patch dies here for now, t=
hat's OK, at least there's a possible
> > >>> patch for those in need.
> > >>>
> > >>>
> > >>> Sorry, maybe I didn't phrase it well. Based on the UVC specs, I thi=
nk your patch is good for all UVC PTZ cameras, so you don't need to use UVC=
_QUIRK_OBSBOT_MIN_SETTINGS quirk entry, just apply the quirk changes to all=
 cameras.
> > >>>
> > >>> Thanks for doing this!
> > >>>
> > >>> Regards,
> > >>> Gergo
> > >>>
> >
> >
> > --
> > Ricardo Ribalda



--=20
Ricardo Ribalda

