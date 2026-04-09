Return-Path: <linux-media+bounces-58318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIPeEHlg12keNQgAu9opvQ
	(envelope-from <linux-media+bounces-58318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 10:16:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D186C3C79EF
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 10:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25AD930849F1
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 08:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522C839769F;
	Thu,  9 Apr 2026 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="ph39ttqx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B438C419
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722369; cv=pass; b=IhG9tvJdExUygWpb478oKe7VipvouoFdTsPpxkUKbfImteOKbssIOAN5toA3A/2dt19hTJin1CU3IW74duD0/ElhhkO8MMMt/zwQ9Ao2GWNclOfvTELLP/hymGLbwWIEW61nDEJbrINHXBYL1m1jzvmt7Lu07btlB6fs4Z+K9vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722369; c=relaxed/simple;
	bh=zoxUDL/qAxsCJiz4aFeQJrqOxFYUx9bQNxNKoGNuXFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2IxenrChmpYy+5Aj7722WFsKH2yo2oD1+4L/lYGov/NEdP08kvsu9XcJfaAJTa75iyZ8NYieEHGCubnWNPUifZ0p5H48UCZ/Qr/G43+63MofJI+EqlvyWZwzmbK4LtXmTbt0XVmd8S6y0ej4KPZKwiyC90vacJV4jJDiRf0CoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=ph39ttqx; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6505ef94043so623045d50.2
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 01:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722367; cv=none;
        d=google.com; s=arc-20240605;
        b=YP7ieC3cPpffig45ogTvmlCrL/V5F3jp1zIoK9Cw2AuMlPv6UMzQrwH8/y6doidy+0
         vqIkeSJlHAJs8bhl+obsATypQfXbKBjs+COZEIa7jZ3u9uj72nPGGWzvdTS1wpKTT6WM
         dY2lT8+jCyQ3lx0luqEtKvKNzMjkM+7RVXpcnSfo4dkyKiLrmsg1TWRB2KCcoCn9UEvo
         DlSZHbA87g+lAzqSI0vLd+d9UCZGTT4S3z/29Jl1kQrylM/z+4Tk3QdKy2ejNjH6Gvv5
         Bf2lM9vpIOB+CsJXJ7qNgSi3nmFUsddeNqfPf8hs6IQZ5AQ0I9sETt8VZkBfd/TrXEke
         kHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmJkY2vpo7l8EzEMqyrVo1q5VZsFRi51zVqa7I4LQhY=;
        fh=Sl5hTj/opNW2DMZcUgVGC2Bflm/eCFH0VagXOZl/UR8=;
        b=PLWkuUfW+D2JCqi8mcjZMk4CDQTeBiCqdbuE91UnMkc7hK4jh4CeK41/7ANvt8O+l5
         SWWa9eGlRf6gg9ChIT86Bp/oVobeqTnZvRRJiaMn0F6d0nzR2Pl9ipXHy1Zb34a+Tyir
         DQSeL6mTHcV+fzja+PEJBWqhjX17UVdRH4Voc55NTYHGIFDcXW0dbAQdZtyffKua9EFF
         RjMludZ33tQf3S10GNCik0bt3bFklFDXNw7RYfBbn0jgqyoS/b/wgrubVPxOAeYa6OH9
         WxByK2pEf1Dm4mcSdyYyBSD22Afyo0ndQcay1nWsHEmCW75jJ910VGd6rgCsU33LL7tt
         +Drg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775722367; x=1776327167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmJkY2vpo7l8EzEMqyrVo1q5VZsFRi51zVqa7I4LQhY=;
        b=ph39ttqxeXcTgTAjjkB6S3Y9NMoCDvBKIVrURAV7IIzr0Ub21hCvpv2SH2+4E5B1u+
         xZJ17Z/gOsl260sjX2HLstNbpmjDmC0tau2GWUBaEsjSW7qDMp/LfD3yKK7Ln8i6TLsg
         pwWc4m2yymNc7pKgcFe9KHp1Y23WEnMtaOMAW8ioeRq4YPVI/WGmLWbgYEuVEHYilYo9
         DCrhKR9iokOvlGVQJ3V0nEurQv3xaJVxdOAhOlpx0Ri1QF4Gv5mCXkQgnA2AuknE2qQl
         spHTvrhVwmVEo9QudBGf35YVVLglobJ7+wViKKKK6tu1zoXN9aBsdEaaycTnfqPulCPC
         ZKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722367; x=1776327167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmJkY2vpo7l8EzEMqyrVo1q5VZsFRi51zVqa7I4LQhY=;
        b=scvu5fCXE6UO7e37T+x84VCXyeNzvCELv4VZtGGr+FiXBPJDLYAnU4WVS6EkWPpd4W
         fVYtdLQOPdYzTcTQtkrHzxDuG0RWI/QF9umEN8JpbsuJiP5wnN0qt9bturt6sjM/DNwk
         oXlNgA4qscH28TCEKxDYnb8R57++3BGO8nT0SzxF9HtYlABK1Nb2vNs8DqmOBNwcaB7s
         ZVMRzooFOYqce7XxMTuZRDnUXN5j3D7eDK86AP6DasRIUeJXLJxRXXmimR3CoDXafo1A
         O3028rDIoiSIrfUn4x2BRtWYwJAbdDds19fNv0uYHz5hOQ5oAH/LRA0VWEW+HcqZv4iu
         7IdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDPFcXwr9txwtcr6k3zCf8jf22E9fbeTT3iXRDiBKB1G/yaPmE3Xp+7Ef9ewWIiqqRQJVmbWFlQdgr4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOMIshpiBz7OltJRBH9hn+MVgfEvHxe8B8FFznVWVhhBJzu+s
	zhydnoM1elGMjpMA9/k7lOgiRbVB6fK5FLt3fENc6yNjqItZxNNV6y7INmKeUIxKRwdJgDPVIGB
	ehtSc+y0YW59og/3KwDg1hjaYZBrbWOtp54SnDDuV
X-Gm-Gg: AeBDieuKw2ZMph238ztdgqxMAIjBFtx/B3B+dodTf3do6+SS/4Jh6LozQLn1yK7kOqQ
	1keDzcUZy8HP0h0tIvSu/L8mg6ffbYNm8lHZh++lf2xFfsukP92Hgg4z8I1qb4rsL24LT+brzQo
	9KrWTWmWfQ/21mzr0yKTttLRAPWLQOGx1/BRIDj+tv4zsct9lMopjbqOKfyLkNSluOmZWdalUb6
	cU+3xVhn8vM2gB5JwvCYEeZG+pEbwnom2OokIKRjGkxFE3BhLnYAAxsDxNX/ZK4tdZ/TsdN3yK+
	D5fO
X-Received: by 2002:a05:690e:440d:b0:650:12eb:16db with SMTP id
 956f58d0204a3-6504887cb9bmr15515722d50.50.1775722367308; Thu, 09 Apr 2026
 01:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260409074242.2115657-1-jp@jphein.com>
 <20260409074242.2115657-2-jp@jphein.com> <CANiDSCva8V5+h6QsHLXEsJfjMPYaoGWKzZcvH9u2wgXCs-jRdw@mail.gmail.com>
In-Reply-To: <CANiDSCva8V5+h6QsHLXEsJfjMPYaoGWKzZcvH9u2wgXCs-jRdw@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 01:12:35 -0700
X-Gm-Features: AQROBzCwzQ7ycElepf9PBapl3c7uBo9xilIRFgRQoulJ62oC_O-o8mkGeVIs1f0
Message-ID: <CAD5VvzDx3GeNndtAOZjaZYntEh2-+08KP2OT0Sq3rd4u243BFg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile USB firmware
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-58318-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email]
X-Rspamd-Queue-Id: D186C3C79EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Agreed -- the error-code query goes through __uvc_query_ctrl() now,
so it gets the 50ms throttle automatically. Dropped in v7.

Thanks,
JP



On Thu, Apr 9, 2026 at 12:57=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> On Thu, 9 Apr 2026 at 09:44, JP Hein <jp@jphein.com> wrote:
> >
> > Some UVC devices have firmware that locks up under sustained rapid
> > USB control transfers, crashing the xHCI host controller and taking
> > all USB devices on the bus with it.
> >
> > The Razer Kiyo Pro (1532:0e05) is the first known example: approximatel=
y
> > 25 rapid consecutive control transfers cause the firmware to stall an
> > endpoint. The kernel's standard UVC error recovery (GET_CUR on
> > UVC_VC_REQUEST_ERROR_CODE_CONTROL) then sends a second transfer to the
> > already-stalling device, amplifying the failure into complete firmware
> > lockup and xHCI controller death.
> >
> > Add UVC_QUIRK_CTRL_THROTTLE which:
> >   - Rate-limits all USB control transfers to 50ms intervals in
> >     __uvc_query_ctrl(), the lowest-level UVC control transfer function,
> >     ensuring all callers are throttled including uvc_set_video_ctrl()
> >     which bypasses uvc_query_ctrl()
> >   - Skips the error-code query after EPIPE to avoid amplifying stalls
> >
> > The 50ms interval was determined experimentally: the device is stable
> > at this rate under sustained operation, while shorter intervals
> > eventually trigger the firmware bug.
> >
> > Signed-off-by: JP Hein <jp@jphein.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 30 ++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvcvideo.h  |  3 +++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/=
uvc_video.c
> > index a5013a7..cee93ac 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -36,6 +36,26 @@ static int __uvc_query_ctrl(struct uvc_device *dev, =
u8 query, u8 unit,
> >         u8 type =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE;
> >         unsigned int pipe;
> >
> > +       /*
> > +        * Rate-limit control transfers for devices with fragile firmwa=
re.
> > +        * The Razer Kiyo Pro locks up under sustained rapid control
> > +        * transfers (hundreds without delay), crashing the xHCI contro=
ller.
> > +        * Throttle in this low-level function to cover all callers,
> > +        * including uvc_set_video_ctrl() which bypasses uvc_query_ctrl=
().
> > +        */
> > +       if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE) {
> > +               unsigned long min_interval =3D msecs_to_jiffies(50);
> > +
> > +               if (dev->last_ctrl_jiffies &&
> > +                   time_before(jiffies,
> > +                               dev->last_ctrl_jiffies + min_interval))=
 {
> > +                       unsigned long wait =3D dev->last_ctrl_jiffies +
> > +                                            min_interval - jiffies;
> > +                       msleep(jiffies_to_msecs(wait));
> > +               }
> > +               dev->last_ctrl_jiffies =3D jiffies;
> > +       }
> > +
> >         pipe =3D (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
> >                               : usb_sndctrlpipe(dev->udev, 0);
> >         type |=3D (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
> > @@ -108,6 +128,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 quer=
y, u8 unit,
> >                 return ret < 0 ? ret : -EPIPE;
> >         }
> >
> > +       /*
> > +        * Skip the error code query for devices that crash under load.
> > +        * The standard error-code query (GET_CUR on
> > +        * UVC_VC_REQUEST_ERROR_CODE_CONTROL) sends a second USB transf=
er to
> > +        * a device that is already stalling, which can amplify the fai=
lure
> > +        * into a full firmware lockup and xHCI controller death.
> > +        */
> > +       if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)
> > +               return -EPIPE;
>
> I do not believe this is needed anymore now that the check is in the
> inner funcion
>
> > +
> >         /* Reuse data[0] to request the error code. */
> >         tmp =3D *(u8 *)data;
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 757254f..31f2af5 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -78,6 +78,7 @@
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
> >  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
> >  #define UVC_QUIRK_MSXU_META            0x00040000
> > +#define UVC_QUIRK_CTRL_THROTTLE                0x00080000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> > @@ -583,6 +584,8 @@ struct uvc_device {
> >         struct usb_interface *intf;
> >         unsigned long warnings;
> >         u32 quirks;
> > +       /* UVC control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
> > +       unsigned long last_ctrl_jiffies;
> >         int intfnum;
> >         char name[32];
> >
> > --
> > 2.43.0
> >
>
>
> --
> Ricardo Ribalda

