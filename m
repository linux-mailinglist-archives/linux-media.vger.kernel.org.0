Return-Path: <linux-media+bounces-66017-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TvAlEt2/QmrqAQoAu9opvQ
	(envelope-from <linux-media+bounces-66017-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:56:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64E6DE2A0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:56:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=KuC6lRCy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66017-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66017-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91195304E667
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B122DB788;
	Mon, 29 Jun 2026 18:55:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4137B028
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 18:55:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782759351; cv=none; b=NdklJPshxLdnwPNSMLjExCp4CxeLDQiglo5xtQKRfo58ULGMv/IO9S+ZZGs2ydsN93bOg2r63eBQOsruj85uZXPVwqX1roP+dDfECHs+/XOLhv/Bgwvudi4g13dlaFkqmHdY428+fGkb2IM24FY0j2TRmlox0i68HeOgEcj1d1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782759351; c=relaxed/simple;
	bh=6XEyvFm45RFpQRmroon/fQJy6RQP6vEOBkY+lsSQYMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JK9IiPeiMqJncBdmEW7rwR+njJBIHv/akxROfbM5zyEL2Hz/3+ubYft9ZxWzRNCVRgNjRWqeCcozWDsmbRq30TQDvhzsIf6JshDbbiqPLBmmcncrEpw12f8S56eQe7kwmBBh4fanhc7PNJ5QgrsWnxQxrvuCrvgu0mZS/zp43hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KuC6lRCy; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so2942027a12.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782759348; x=1783364148; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OOeKw0Dt0Ml12xsRcK2OOzf5cXKN/GeXGXmRNdKFNY=;
        b=KuC6lRCyfjm9SCpHGN4Ru5mq4/Qygygx6Ctrka4sJiPBnevcckWJcnBCve5MLhW5CU
         j9GQaPOcVZrK0Eha7rx/rwNespFhvC9aHa3E3TbT5JPhwgEaeNqZ3s2DexzfoD5apfll
         oDnbjEUe+uA9QxFnHlfLrmzRHdclVCygAFKoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782759348; x=1783364148;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OOeKw0Dt0Ml12xsRcK2OOzf5cXKN/GeXGXmRNdKFNY=;
        b=MNJaFiAk6ngMRqCABlpyLOoFaFZZULFsuWoWVVQKZR5o71ANeagMcpbELGWvXvtLBM
         oY9YNaVAYTvrR+F0EZILo4eHKgVqabNScn9nM/tW+6ESaDBS8ekK8eohkgGz4dKQhqWl
         /vK+xfpB5HD1ZyAQ1n5+rUH3b8FOix9BUmbmp3CTI3/z3IXDqQUDvT3fLSepUSxShQZ2
         KgR9SvOrQW7I1SbrpLZQla3wfgI0RAqb7ZYGn727MtMdcnTY3CTfhWe5Hm9MpiGKMHce
         DZ61cd+Ghj40Mpet/UpYZ0cUrkwT/i7x1a2KqTQTlUFmjJHmp85jeZseGAqavSae5V8f
         JDWw==
X-Forwarded-Encrypted: i=1; AHgh+Rolxa0jHgvxNQ6x4CobLaPGMi1DrRXhLQKqrNP1bhLZo93kBnDP/gjKaSS2g2NklbK7s2leY+7uj8nK6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWzp1LcDRGwG2NUfOGK7YsQNDOrJJx2hsbu3i6QzRNsjjBWwsW
	cFkHE1F2kIFAHk11MR2J9Ud+ZhAZF68wPZDNzpfJVYdDZFiS/PBg9o1yhjCFJDpz2CMc9qG/8uh
	3wtNLCFje
X-Gm-Gg: AfdE7cketPVaHzo71faanwaLJMw/W2t3Jb72fXFE4FY4lS0vLG1f7D0njj5At3FEbpr
	zlbswLebD+qWGprppb3EUiLk8ZrOlZjOl1702DbYhQdHUZuTrO7m4ROCIkrvh4gHscec32p+YBm
	hX9b8PwqXwr8o/kM3vAL49qZZDjoQ5xxUChvI3aKQ1SbExvwGNDzV4Nts2v7ygKB6qiK70xn8YP
	O/AQ50TT6hwmAcsQWnwKvqhQdc5wUSEDh7Zh0NEfCuXqoYHU0HQJ1eRr95Ua3xXDXOAB9EW5yVM
	yOBwMsLU9W5TPTVwZpqifEy8jH2dp4IEfYUE1oGa5qkevMxslxl2vXWxQMIwpU43TiW/uhypqp1
	wJp7ehwV2AK73IGwkZaN6zmODnIehOPKtJdpdLmPKnhBKzbsrP9CknPgZ5w8JSTmQc2ZvhEfbTB
	HNV5TUuDJtS5f3r6J+vN8L9ukVqBQsJvacfWmQD5JGxVIg9Rculr+6qtUOpKxo
X-Received: by 2002:a17:907:6ea4:b0:be2:7f13:8e33 with SMTP id a640c23a62f3a-c128730a922mr22750466b.45.1782759348379;
        Mon, 29 Jun 2026 11:55:48 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d694cfsm5204666b.16.2026.06.29.11.55.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 11:55:47 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1274802697so115470666b.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:55:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8pSrZNbb9L4WUGv7wdmIk+k++dj/ZrUTQWlpE7n1v1zO6ruuX3GeIL+LhE+DXTidheuhOKWL1RDrwGsw==@vger.kernel.org
X-Received: by 2002:a17:907:3c94:b0:c12:44b4:c8ae with SMTP id
 a640c23a62f3a-c12873932bemr21730366b.61.1782759345856; Mon, 29 Jun 2026
 11:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
 <CANiDSCviTcv6mYmE9Ha8xh7r+kEuwGUoT18sdb2J=HzTFVhLoQ@mail.gmail.com> <CAD0bCtmJ88fC3zXhU5nDxugagjNMmY=FS7sO40x3OsAe41L+qg@mail.gmail.com>
In-Reply-To: <CAD0bCtmJ88fC3zXhU5nDxugagjNMmY=FS7sO40x3OsAe41L+qg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 20:55:32 +0200
X-Gmail-Original-Message-ID: <CANiDSCvQAo940t6son-QHoOdYT3KGHoQMhiNis7HwER+WhiPUQ@mail.gmail.com>
X-Gm-Features: AVVi8CdCFjbiMd_LoXX23FhHoQCVsdtCvgzrIVV27LBuwVwhXZXklfhUOLmni1E
Message-ID: <CANiDSCvQAo940t6son-QHoOdYT3KGHoQMhiNis7HwER+WhiPUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: add quirks for per-device stream
 error handling
To: =?UTF-8?Q?Pol_Fern=C3=A1ndez_Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-66017-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fernandezfernandezpol@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB64E6DE2A0

Hi Pol

On Mon, 29 Jun 2026 at 19:48, Pol Fern=C3=A1ndez Fern=C3=A1ndez
<fernandezfernandezpol@gmail.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the feedback.
>
> The original detection was in MATLAB, and the same corruption is reproduc=
ible in guvcview. However, the issue is not application-specific: I've conf=
irmed the same corruption on a second machine running Ubuntu 24 with a stoc=
k kernel. It does not reproduce on two Windows 11 machines with the same C9=
20, and does not reproduce with other UVC cameras on the same Linux system =
(tested with a Logitech BRIO 100 and an HP 950 4K Pro). Capturing in YUYV o=
n the same system produces zero corruption, confirming the problem is speci=
fic to the MJPEG encoder path. This points to a specific interaction betwee=
n this device's firmware and the Linux uvcvideo driver.

I just sent a patch to guvcview to fix handling the invalid frames:
https://sourceforge.net/p/guvcview/discussion/general/thread/4af26b96c8/
I hope they carry it soon.

You need to ping your MATLAB support so they fix their code.

Have you tried with the nodrop parameter?

>
> The patch series addresses two separate contributing factors:
>
> Regarding UVC_QUIRK_NO_FORCE_QUALITY: uvcvideo unconditionally overrides =
wCompQuality with GET_MAX (61 for this device) during probe negotiation, di=
scarding the camera's GET_CUR value of 0, which this firmware uses to indic=
ate adaptive encoding mode. The Windows UVC driver does not perform this ov=
erride, and the camera works correctly there. Forcing maximum quality incre=
ases encoder pressure and raises the frequency of UVC_STREAM_ERR events. Th=
is is a driver-side behavior that contributes to the problem independently =
of what any application does.
>
> Regarding UVC_QUIRK_DROP_STREAM_ERR: uvc_no_drop_param=3D0 would address =
the symptom, but it applies globally to all UVC cameras on the system. A pe=
r-device quirk limits the behavior change strictly to the device with the c=
onfirmed firmware bug.

I do not think there is a firmware bug. It is flagging the invalid
frames properly; userspace is processing invalid frames.

>
> Best regards!
> Pol Fern=C3=A1ndez Fern=C3=A1ndez
>
> El lun, 29 jun 2026 a las 18:55, Ricardo Ribalda (<ribalda@chromium.org>)=
 escribi=C3=B3:
>>
>> Hi Pol
>>
>> What application are you using to fetch frames? It should not process
>> frames with the error flag.
>>
>> If you cannot fix your application, why don't you set the parameter no_p=
rod to 0
>>
>> Something like:
>> rmmod uvcvideo
>> modprobe uvcvideo nodrop=3D0
>>
>> Regards!
>>
>> On Mon, 29 Jun 2026 at 18:38, Pol Fern=C3=A1ndez Fern=C3=A1ndez
>> <fernandezfernandezpol@gmail.com> wrote:
>> >
>> > The UVC_STREAM_ERR bit in the payload header signals that the device
>> > could not deliver a frame correctly. By default, uvcvideo delivers
>> > these frames to userspace with V4L2_BUF_FLAG_ERROR when uvc_no_drop_pa=
ram
>> > is set (the default). Applications that rely on strict JPEG decoders
>> > (e.g. libjpeg) will display gray bands for the incomplete portion of
>> > the image, since libjpeg fills undecodable MCU rows with a neutral gra=
y
>> > when the EOI marker is missing.
>> >
>> > Add UVC_QUIRK_DROP_STREAM_ERR to force-drop frames flagged with
>> > UVC_STREAM_ERR for specific devices, regardless of the uvc_no_drop_par=
am
>> > module parameter. This ensures applications never receive truncated fr=
ames
>> > from devices known to set UVC_STREAM_ERR on genuine encoding errors.
>> > The existing uvc_queue_to_stream() helper is used to reach the device
>> > quirks from within uvc_queue_buffer_complete().
>> >
>> > Additionally, uvcvideo unconditionally overrides the camera's probed
>> > wCompQuality with the maximum value returned by GET_MAX. For devices
>> > whose firmware treats wCompQuality=3D0 as an adaptive encoding mode (w=
here
>> > the encoder adjusts quality dynamically to fit within the available US=
B
>> > bandwidth), this override increases encoding pressure and can contribu=
te
>> > to UVC_STREAM_ERR events. Add UVC_QUIRK_NO_FORCE_QUALITY to preserve
>> > the camera's default quality value during probe negotiation.
>> >
>> > Signed-off-by: Pol Fern=C3=A1ndez Fern=C3=A1ndez <fernandezfernandezpo=
l@gmail.com>
>> > ---
>> >  drivers/media/usb/uvc/uvc_queue.c | 3 ++-
>> >  drivers/media/usb/uvc/uvc_video.c | 3 ++-
>> >  drivers/media/usb/uvc/uvcvideo.h  | 2 ++
>> >  3 files changed, 6 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/=
uvcvideo.h
>> > index XXXXXXX..XXXXXXX 100644
>> > --- a/drivers/media/usb/uvc/uvcvideo.h
>> > +++ b/drivers/media/usb/uvc/uvcvideo.h
>> > @@ -81,6 +81,8 @@
>> >  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
>> >  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
>> >  #define UVC_QUIRK_MSXU_META            0x00040000
>> > +#define UVC_QUIRK_DROP_STREAM_ERR      0x00080000
>> > +#define UVC_QUIRK_NO_FORCE_QUALITY     0x00100000
>> >
>> >  /* Format flags */
>> >  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
>> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc=
/uvc_video.c
>> > index XXXXXXX..XXXXXXX 100644
>> > --- a/drivers/media/usb/uvc/uvc_video.c
>> > +++ b/drivers/media/usb/uvc/uvc_video.c
>> > @@ -451,7 +451,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
>> >                 if (ret < 0)
>> >                         goto done;
>> >
>> > -               probe->wCompQuality =3D probe_max.wCompQuality;
>> > +               if (!(stream->dev->quirks & UVC_QUIRK_NO_FORCE_QUALITY=
))
>> > +                       probe->wCompQuality =3D probe_max.wCompQuality=
;
>> >         }
>> >
>> >         for (i =3D 0; i < 2; ++i) {
>> > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc=
/uvc_queue.c
>> > index XXXXXXX..XXXXXXX 100644
>> > --- a/drivers/media/usb/uvc/uvc_queue.c
>> > +++ b/drivers/media/usb/uvc/uvc_queue.c
>> > @@ -357,7 +357,8 @@ static void uvc_queue_buffer_complete(struct kref =
*ref)
>> >         struct vb2_buffer *vb =3D &buf->buf.vb2_buf;
>> >         struct uvc_video_queue *queue =3D vb2_get_drv_priv(vb->vb2_que=
ue);
>> >
>> > -       if (buf->error && !uvc_no_drop_param) {
>> > +       if (buf->error && (!uvc_no_drop_param ||
>> > +           (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_=
STREAM_ERR))) {
>> >                 uvc_queue_buffer_requeue(queue, buf);
>> >                 return;
>> >         }
>> > --
>> > 2.43.0
>> >
>>
>>
>> --
>> Ricardo Ribalda



--=20
Ricardo Ribalda

