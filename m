Return-Path: <linux-media+bounces-58309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIBGFa1X12kFMggAu9opvQ
	(envelope-from <linux-media+bounces-58309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:39:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4433C721C
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 09:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 841AC300B473
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 07:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1D034C815;
	Thu,  9 Apr 2026 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="hgTf+7pq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B783290C7
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720352; cv=pass; b=mzJ04jO/dwvsjUawl7b5MjEAhk1eVCTKEbmSKVDoaXBdSzorTtI7E+aUg6vKPI37FCa3JTboYtIGlaWBacZ1vigYoRuWTkTeU5iN8dRLdSOTVzuHr8/kFLIVayvGfJDXka9GmvxFbV5CXfJ/cYy4irFg8GSpkO2wG65ZHSP5Wp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720352; c=relaxed/simple;
	bh=3FgneMfmSZvBmGVUZNDZOU/z5vLC0MLmUAZd8nOxzaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szSMk4xeIT8o/YoCMz8C65Yumkvj4chZ23BEHoeO0L4sJcXA1pGSa5S6IT8CGWuS2a6JnRm4VjvCZbE214wdIQP+syPhB9Cg9xQ90cUpmKFybJQyjpxF7O25Rq97blO+5i3PBAtmaZCvJDrDNWjF3BqqfAS8Y2l3Y6ahYYNVclE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=hgTf+7pq; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64edf260b49so879782d50.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 00:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775720349; cv=none;
        d=google.com; s=arc-20240605;
        b=AiegrDno3/5v2uQMywewofYEE69YkPfyy0DbQFMoZd8jr0PD78VCvXumNtro7FHXUK
         6KuxV8zfTDi6mqkEh3mqoeI23hr/08lj4Tc03+0yaiH8BWTn7egx+BkSZ6aY/eG/POUt
         ezSyqobDBAe5IqBLg/PCzSPtJ+MAKB7gIhzYf5ooXiDHbrtdL9h2le7Xs4G0NUSjw0Mq
         l7FOO/R6BBUuOX3OeB16eIVU+FEfwwjzIE5BI8QBWU/Z9jBCDMmAsR91WZGc/TAVaVhO
         V6ztFvzSOwAhOmRYMnPGus+Hcqq/Jyp8YerVM9OZTybQ5NQbUSF3WhdKuo/Y0pZw+3zl
         /dsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3cBtzKA6zOvJq0dVyyoDONOpQrZn2nA943/DyCLWNqM=;
        fh=t9PJZeYlEnu9IWdwOxjqvg7D4jGomvVmyuqAqTvf6Xg=;
        b=cO1cWfdrCJqx5d8mhtl0MnvrwFMhOMkDzpfg/V0HQ07ZXTVmmZFQUsbgU0USUtelGW
         UqqzlfWWcIP/SxAcJVIKg+Lq5YC5eFNoajUNN7LKY8zAIsl6urfrujbgf1xKUOXbU8ul
         LOSKVSFgufbexIgUW6QFGTS4L+KzC/DlD/4fGiORmtfeulNvjWimV0MLaFui9ee0P5uw
         8QB/nbRefH/+95fEceMrcVh/1u4XFD3BdZ/oOBYImv6/Q240BYao4QNfyv5WtbawJcTy
         5r5M7W7/YKIWJlzBSJBwrAf69tue6JlOVdQPRgCxCljPRDjFo1Smi0OelHmwyn2OGiJv
         dCDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775720349; x=1776325149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cBtzKA6zOvJq0dVyyoDONOpQrZn2nA943/DyCLWNqM=;
        b=hgTf+7pqRgdRhN0Pc2ziGSGsg2jkow+NZTh9id1Z502cX5UvwQAVFbWETKNYjFA4W8
         80zI0+Htk5bP4rTtEdx0vqHb/zkcnA/dBSJpvcGNq4PIUnyOH5MLk4qtvPvUeqG0o0no
         ViIyWRRNOtj+wpuhJzTCid5R1douH2Wq5AZyoPtWnJh+eoIrBavFqpGE9y2A2ppeW+2j
         sWql2jCkk9wrzFqlCLczvYnmN6rWt2JwVov5vh44+3oqwLCo7zU81X7BS82Qoe1MRTpn
         dR+Kx5uY09x/OGvCSYmmakOpRiEU0I3haqF6IJNhXi9gLdo68TE6U76wLUK5qGVEdeMY
         GGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720349; x=1776325149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3cBtzKA6zOvJq0dVyyoDONOpQrZn2nA943/DyCLWNqM=;
        b=cDSx99vqTEtEB9NFgwT4qnW80DHs3MlmfEpD9uBD0ED70BdflhaG0KxDXq5oIK+JtU
         YfRWskgzqPsRkK7M2JEjhiR6ElMSLI8AnFybd+41RaSFwx5nQplpfuPJrJ98eFklD5Ti
         hgs6omIZ120vBBxdaoOpTr6GvU5mj2vWpr1xqqWiY73Yvdgbp71lFbRujztqa1RpUo8n
         qZ9DnGBsvtgk0OYZWnpPyY85hLGp5p5jisLPEOAD3STH80sZNIiKJMs9UKZnxTCpBpEn
         vfl9xTrcYJPQtrSuNTvVUL3MAULzhwI3T3OglFUKXAoInpOn7n8KMmS3y8XE+vRnoxDb
         umCg==
X-Forwarded-Encrypted: i=1; AJvYcCWyfAdWw6tmdm94HmXlF8G777Fknq03S2OBUrraaYJA53CFvshoUf8IYgDLJDRpuuybhkYKwgZcOZCnlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP9xau5PaP6VikmwHxXaR4KNhVQk49wfu4iQpWAxzTmiFZ5gi3
	6jkb9Yfjf7rt+i1t+LhllNreljAZbU8jnR9HoUPsEvtdLC7mnpqD0V+tIZdVG89jVEnok7nqJay
	qanAt5phEurabv+NzOokKp4ssgEnGrBGqNRa5r5nT
X-Gm-Gg: AeBDiesno7cSOJTAvtHjXpM1tw4X77rbX5S+noOjoVozLb61eYmL3nWDWp7ehIDF508
	TkkoB1nulmV2+317UBCiU4czCji2yJcab8CWlnbYClUZsbYp6n+tTF0TnA+rkKNtHbtANSVDhRR
	0txkSv6niyAD6re8z5hMhZQ2gB2eUfc7W5w7xPXSNgqQ//ll8Tnq47TWNba1c+qifOCtL1M4l95
	ZRHzDfT4q5ZabESHDPT8vximXmK1c3dINUaIHKs/B2MbDCA1t+yWSw1txDPUI+mvCrjRS06nrtD
	LvDh
X-Received: by 2002:a53:cb4d:0:b0:650:4854:10ec with SMTP id
 956f58d0204a3-6518724c408mr1415526d50.35.1775720349504; Thu, 09 Apr 2026
 00:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-4-jp@jphein.com>
 <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
In-Reply-To: <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 00:38:57 -0700
X-Gm-Features: AQROBzDdDRMw_0wKog-GLSZlGIy1Z2m8p2K4km-SpSb6lQdMirbNnmXbHdqt6FU
Message-ID: <CAD5VvzCRd=3UPFTgxsq7CzcfWBbDionHL1=UeW-31rFPx5fU9w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-58309-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,mail.gmail.com:mid,jphein.com:dkim,jphein.com:email,jphein.com:url,launchpad.net:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C4433C721C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

On Thu, 9 Apr 2026 at 08:49, Ricardo Ribalda <ribalda@chromium.org> wrote:
> When we add a quirk to the list we include the output of `lsusb -v -d
> 1532:` to the commit message. Please add it to your next version.

Added the Device Descriptor section from lsusb -v to the v6 commit
message for patch 2/2.

Thanks,
JP

On Wed, Apr 8, 2026 at 11:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi JP
>
> When we add a quirk to the list we include the output of `lsusb -v -d
> 1532:` to the commit message. Please add it to your next version.
>
> Thanks!
>
> On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
> >
> > The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
> > two failure modes that cascade into full xHCI host controller death,
> > disconnecting every USB device on the bus:
> >
> >   1. LPM/autosuspend resume: the device fails to reinitialize its UVC
> >      endpoints on resume, producing EPIPE on SET_CUR. The stalled
> >      endpoint triggers an xHCI stop-endpoint timeout.
> >
> >   2. Rapid control transfers: sustained rapid SET_CUR operations
> >      (hundreds over several seconds) overwhelm the firmware.
> >
> > Add the device to the UVC driver table with:
> >
> >   - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
> >     skip error-code queries after EPIPE to prevent crash trigger #2.
> >
> >   - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
> >     that trigger crash #1. Same approach as Insta360 Link.
> >
> >   - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
> >     path. Same approach as Logitech Rally Bar.
> >
> > Cc: stable@vger.kernel.org
> > Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
> > Signed-off-by: JP Hein <jp@jphein.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index b0ca81d92..e8b4de942 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2920,6 +2920,23 @@ static const struct usb_device_id uvc_ids[] =3D =
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
> > +
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



--=20
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

