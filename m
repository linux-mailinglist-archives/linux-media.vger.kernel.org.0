Return-Path: <linux-media+bounces-58319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMomBKdg12keNQgAu9opvQ
	(envelope-from <linux-media+bounces-58319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 10:17:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E93C7A0D
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 10:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 911ED30610F4
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 08:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA2239EF2F;
	Thu,  9 Apr 2026 08:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="R8TpHwQH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85670397E81
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722406; cv=pass; b=AQU0KZojshxsUPMEkDeSj65/Dx0klE/f3NtxhRbjHRvTwFJ5SVcZpbn+bf2k93UGTMXfsNn6ib240EfBHSzivBd/elXVmiMuCNEgkx7y75PQZXKJG+eZsZWMqUOY0gXp05TZ8SGOnxQBFsmmdAVpg6i0boOiKzSEkI55sU1MMxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722406; c=relaxed/simple;
	bh=IJJYXkJSgLMENY1RzS7Emu2PbcjlpJ+pewoYr3PdWPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtEeCDIqpxM0AJUzsqXZetoLo2/KbC+Ijmdxq9hSe8U9MAxERsQxTvl7hYz92CMZA1A95yij40Gg0+DH8irQLvlztBV1hMngeFlV0F0ud6sUyCV1eNJI9RQ3m+LmNQrDSyYOR7ZsnnaHPO4R5NfYYx4b9hJjbqc9CP/gICNFTWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=R8TpHwQH; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ee82e853cso454437d50.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 01:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722403; cv=none;
        d=google.com; s=arc-20240605;
        b=Pi61mhP165FA5Wk6gY7z0+pfHaHr71sjaYAfvmkb1JFjL69FHp9SMR2dyR6ylQ5npu
         7lO8xG3k02odxl3FsfhVj5f93IWA63MRSsGA9/cLCI5WnmAT2qEvi8VsxGwXlu4rLtFF
         nmJwsBGDoVc0xTIDcnAR4I8jpPoKPo/4XZY7v3mLXBKNSCspdvwGg/Woetho8/WzmzUa
         V5gXcya5izhJZ45rkIxONDq4eayz450NWmQ2aDTux57nk14qGJGCS3wzs1R6mhVBc7Nd
         A0niSr2XG7AY9Che2188Ds126H7LFTIV3gDwI7t4M6RlLVfqMvKZf6/6pufyxJqa6exH
         +3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m2T0HzcPHFjquEbAcpJZqmSt5vKZwxpwTJQgZ4CtwnQ=;
        fh=iEH9txxlNKcMHtmkcyBY3uOkAwrgcC8H4jFqVaJ2VYk=;
        b=VUPcUHiMqEpggwb2t3uIGLndFgYnrCypy+BQ3pjgsJ9fckuQOUUUKFvI6DxdU08DA6
         URv2UXg9uE6qntUVsdyN2HQdcGBBS50uoseoPkepZcmwqj9dOCI7I3s0pdgU9aluexGd
         nQ+5Nj+sFBapXghPY/U0r3Amkv5AWWWsNMP8S4Et3EbBg8L3NQr/X2is7l+9qTqKvgRl
         V+1woLhij/HrDrTpD7X+DCazj5stIu50JKfhWxjJpkpoF78Fiy+pJLewN0REF4vaTz4O
         H4PjxRsTon21jfh5U8IzTvSJLUZ1aY9X4HM1Klohf42dpzfRBsUhOtKfhzjJdw0z1ORg
         CNUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775722403; x=1776327203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2T0HzcPHFjquEbAcpJZqmSt5vKZwxpwTJQgZ4CtwnQ=;
        b=R8TpHwQHR0C5fE1XpMhj0YXU5pMD0j3cC++5/Pu6XlDxDV2Y5X6tcTcNCG5oIhEA3h
         8paBrzcelWNhdM4T3kDdc/6MacF5Mv6Mrxylv0g6liz3tTNpf3kn/M2VAhSV0uqP5s+Q
         inZYRrN8z35Adq9FAe2OUV+ITnuIecPUZBYJ2LzPICRwXuHy51XSLNKv0YJOI3WKOc2P
         1cvN0e/WJoIw9UEwC99X4eCJBYrkZ7YX4n+/5G0yQTzDAclzU5W5Hhvtrwb1lFMNyYTr
         HazAIMIbHoWxy5kwhWveSilaZRB9JxfhURTk0s0TE8s2WbIW+ztSg+/+B1PKBj9NkN34
         WrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722403; x=1776327203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2T0HzcPHFjquEbAcpJZqmSt5vKZwxpwTJQgZ4CtwnQ=;
        b=POXBk6x9Y/LfRt6gp6ZPWYZJMRFwZIDx7nydlg+zKUQ3rmYS+XjDyu9NHE3YZ9xrtS
         ohS6TmQiWW38mgoauPBJ9r4/NmP8Tsq/ZNkdmFzcH3Y7R8fM+jvfs/EaJvDjS2QA1KmK
         OTxpCx7qIjtZvEBIRJs1aKeHf3Al5UDkTunA4j8EfgmijyHnC5/nu+OZop3y8i0Q9ElL
         xkxjC0Ih9KTeFfGroZf+kzypHOln74PmXLf/zbBwo1R4D3OaIjAGlh1/EujzHESDrXmo
         Ky06WzoTSNHEsGjSd+QJqWJofmjCXMXDfSHhPRMQiBl8v7EXDCmt3ej60YBxHgJ3stpJ
         y0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIGhhIzIb5FyZShLBnL8FmYUEI4FzxsuksIuDwwZzAuMDYFRSINnEnPkBpQWFPBuA5CGjjYdet1Grt4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4q7ZKXc0J1s9PDszr/izTW7obOm9mpgmLhr5xhvvLk+8sHiuS
	E8Q+rCEhOOPYybRVyR618W+oiks6yCRZrv8oMJGTWRKE4YXqNu20ekdjQzGSKyIG7ljZsRNVvYY
	EN17IuekinfpJ6UeUgz4UlqwnR1BwhbKHsfOEyVpY
X-Gm-Gg: AeBDievpCpbnu80U1G2sOlQv8wkDPBk5tkBKBcvgy8KDvWiTamG3IP+PNYH4Rwsrk8l
	xDrNUQT9gmb0reXcqcmqaHlMty6SuKzheIeNtRisHGoZ31EvYpz0CJcgT0wro6AXgg+nP50lEaK
	5Th9dVXV1J7EfsN41jHLzoP02mWeULNpZRHaO6iBz6PDjK8yXyJt0Xt+vpmQmXMSG4uNiv0TccT
	Nwnzeje0l78aTpbQ1vdtV35wfO3Cx7vq38U77V08vZXCWhIIn57aww8yQiIUzA03XM0U6U9Vs+X
	mvhp
X-Received: by 2002:a05:690e:190b:b0:650:4bc9:afce with SMTP id
 956f58d0204a3-6504bc9ca70mr21794740d50.63.1775722403434; Thu, 09 Apr 2026
 01:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260409074242.2115657-1-jp@jphein.com>
 <20260409074242.2115657-3-jp@jphein.com> <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
In-Reply-To: <CANiDSCvNLVO7EEMO-FzSD1cteoMUTcftaXqvw5-AW-VqKLkNxA@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 01:13:12 -0700
X-Gm-Features: AQROBzD_A3xnAuqRKEGC2IfuxUge1mX9ZzVr0JIXFoo5GdzaKM2lsdH9M6XQj7U
Message-ID: <CAD5VvzBQEvRPQiyeaEEXBRQjmNRWN5L1_-RCmR3KNnOYBkUUYQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: uvcvideo: add Razer Kiyo Pro to device info table
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
	TAGGED_FROM(0.00)[bounces-58319-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: AD3E93C7A0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Full lsusb -vv output included in the v7 commit message.

Thanks,
JP



On Thu, Apr 9, 2026 at 12:58=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi
>
> On Thu, 9 Apr 2026 at 09:44, JP Hein <jp@jphein.com> wrote:
> >
> > Add a device entry for the Razer Kiyo Pro (1532:0e05) with quirks to
> > work around firmware bugs that crash the xHCI host controller:
> >
> >   UVC_QUIRK_CTRL_THROTTLE   - rate-limit control transfers and skip
> >                                error-code queries after EPIPE
> >   UVC_QUIRK_DISABLE_AUTOSUSPEND - prevent runtime suspend
> >   UVC_QUIRK_NO_RESET_RESUME - skip post-reset reinitialization
> >
> > The firmware (v1.5.0.1) has two failure modes: it stalls endpoints
> > under rapid control transfers (~25 without delay), and it fails to
> > reinitialize properly after USB power state transitions. Both can
> > cascade into xHCI controller death, disconnecting all USB devices on
> > the bus.
> >
> > Bug reproduced on two separate Kiyo Pro units running simultaneously,
> > confirming the issue is not unit-specific.
> >
> > lsusb -v:
> >   Bus 002 Device 002: ID 1532:0e05 Razer USA, Ltd Razer Kiyo Pro
> >   Device Descriptor:
> >     bLength                18
> >     bDescriptorType         1
> >     bcdUSB               3.20
> >     bDeviceClass          239 Miscellaneous Device
> >     bDeviceSubClass         2 [unknown]
> >     bDeviceProtocol         1 Interface Association
> >     bMaxPacketSize0         9
> >     idVendor           0x1532 Razer USA, Ltd
> >     idProduct          0x0e05 Razer Kiyo Pro
> >     bcdDevice            8.21
> >     iManufacturer           1 Razer Inc
> >     iProduct                2 Razer Kiyo Pro
> >     iSerial                 0
> >
>
> Is this the whole output of lsusb?? Can you try with lsusb -vv?
>
> > Signed-off-by: JP Hein <jp@jphein.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index 775bede..9b6df8e 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2880,6 +2880,22 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >           .bInterfaceSubClass   =3D 1,
> >           .bInterfaceProtocol   =3D 0,
> >           .driver_info          =3D (kernel_ulong_t)&uvc_quirk_probe_mi=
nmax },
> > +
> > +       /*
> > +        * Razer Kiyo Pro -- firmware crashes under rapid control trans=
fers
> > +        * and on LPM/autosuspend resume, cascading into xHCI controlle=
r
> > +        * death that disconnects all USB devices on the bus.
> > +        */
> > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             =3D 0x1532,
> > +         .idProduct            =3D 0x0e05,
> > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   =3D 1,
> > +         .bInterfaceProtocol   =3D 0,
> > +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROT=
TLE
> > +                                       | UVC_QUIRK_DISABLE_AUTOSUSPEND
> > +                                       | UVC_QUIRK_NO_RESET_RESUME) },
> >         /* Kurokesu C1 PRO */
> >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > --
> > 2.43.0
> >
>
>
> --
> Ricardo Ribalda

