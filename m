Return-Path: <linux-media+bounces-58460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOJwHJg+2GlqaQgAu9opvQ
	(envelope-from <linux-media+bounces-58460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:04:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DC3D0B42
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 220C3302410B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 00:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B6954739;
	Fri, 10 Apr 2026 00:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="cXJUnTom"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8775B40DFC4
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 00:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775779323; cv=pass; b=QNf6mjnBZBH3AYhJG8FZ2P4xFC00cxc1MV4l3hnJLeWH7OnlwlMDOEkpll2vgwqkTfnNjCRDFL/eFUQXxe99IzhB9NzTf45dnuR0LiMM8in4X6cQUowS6Qzg8ZNdODLzOHzzWPRVxHccJ8oV70sw2AO+KY1H/Jd9kCyNk+jXr6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775779323; c=relaxed/simple;
	bh=OqkhPKuwJTgVvODTDio79Bncv8rCq1GOtat4+zlBoAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJ8qtJAox+0XfwgSKIFz8T+S8JxZf4G4G3qE4VexT9dK8GztpMq2q1shX578OuQfhV1L193kAd7/UK6/YkII65SvL82bS94lyP9nJzdcwdQwF5CgjwmlAfA0EHCtzMHuGlLsmjwJLZiPNsMw1Jn/WPjnwJ1Z5iC6JgaVwGyodmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=cXJUnTom; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-466ec4c6846so532732b6e.3
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 17:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775779320; cv=none;
        d=google.com; s=arc-20240605;
        b=JyuMc3nPFph8ZoWaf62vWcs2xxpSeX/16qyDQjW0hwtp3zV7uRM3VrCbwcJLsbFIu6
         6YWin6hzQfRribFaby8VKald/I12f2c1DoPfWOFVksZEd5iBLjpKPZqCVjFvWp38Bj8A
         zBECuYFnWnbpmKdraJAif751OpWVOGmJcVOdpZBTCjlm8h84N4wJYXcnPgLMGGvlowQl
         5IKIlFMpVkta73NBAJCivXTKXkRWIb3kLr5tABxby3tF4wa6+45k2TtuW2dsxq1W17x/
         CrH/GiwHQyXQbI3dh2wN25TUkcsu5HtqMmnhsCWlY2OoOOIf/Zij0h1ho1phkeOBT7XD
         dRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jc78a/EunYqTwvivmXqfl8KojEjyw2hs8EqL5eaIqdI=;
        fh=Z7FI3SOfCdMa5RWMTH9JKMK8RJ7+Bs/6pHQ2PinI2BM=;
        b=QQv0XfNsMriarSIwaletYlrGBnsUBphC/C7lEezyni6KtQ3I+rTgnK0DuUW+VuageS
         lDmxcQpTMYtz6PE5yVMIJ2QSqddZVonySPk/n91BYNcnLmWhbNx40qvt4SJ1v+8E7Dyq
         js1Qwmm45EKanaDFuC1EsFjyUVVB2/q0OD9GsREhduAPXwFFzo2r0wu/jHHRdQMVP6Qh
         UPxQmVkjTQJO5SFVtPWksio6gNuCRa9rhsgb+AptnniXB4wWXXC+jZzyffnXW9LpMPFK
         gu1TGBPkkGvyGBssZKsv/GVjS/JqTNwl+BHdvuGye4pbeEx6nxImofc7hFRzi+Dl2ENa
         wPxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775779320; x=1776384120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jc78a/EunYqTwvivmXqfl8KojEjyw2hs8EqL5eaIqdI=;
        b=cXJUnTomVzDEReB7K2NFAIpl9uD8icE0IohbdSArkJ/0d6FCNFKjts7/arpGbvfQEX
         cR/Bzia9IE2lLt2a2Ww7g/yOBvekY2lSP7FkslsaSTnInVpd1umGRRlqfTe4R9rubZTQ
         O3dtnJXnuDlcFU8FVbp/viP8TwAgEKGSfFSekBn4JW0MpGHwzG+fjGSXcWgQP2g76e5W
         mLwgMwkR/ElgyJuBx804TBEFlFZT6yha1bJhSDQHaQdRXuH47iWzL6sMYTUB6RPnCcSv
         LEuyLr3H+E2Uwa+Kj3vJvE1DngPNeXLRBEAN5Y0LgKMFrcMEU3LP4lYLfHYE0tabNtmT
         KoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775779320; x=1776384120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jc78a/EunYqTwvivmXqfl8KojEjyw2hs8EqL5eaIqdI=;
        b=EJzbJ9qmiJseq8GIFclNoc9JVWPNV6gbormwtYHThdRCzjeiVmIDVuDZjRlEmvpkac
         upcqzhDDypGfTiuobdKWexVTMIYhO/v+jrjpZJG6z0XWfo/JOPjI64f878Wwd7P7QbWU
         MdKGSBvkPQOnzh8Og6zeN1j9RVvPiKaM4meq3gSEvs9jPOBBxrStsAQYvVxUQ610h+Zo
         I9rONgYJ1LAHXjLbY9TKKxlzm2jg2PyIaUSs32T1puN/ZklYG4O96vDg/48TPNgrQbBY
         uUxqLbv/XXIVyKINP0kOss1+dKfCJYYftPTpvasI5YdH3UXY8Q3lt5qyXSDDLNKbl0x3
         yh4g==
X-Forwarded-Encrypted: i=1; AJvYcCWu1bGhWrgTbSr4RVSwJu/2CF3ofdpVxdk5t7Mp+6CFP+IiCquWP2PVzhngU/sHh6JEvGb9QssQ83gmpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEa2pqQ5M+qSBnNEUb9JJgKGPvR6soZ2yArQK12rm0FxUaLCNF
	Skg5bHIAL+Gl+Ad2xR2Wm2vp1TA+dXCFJmpdtPHrpEaSUGMl5oPAROpTiGzPWAunYmcBIysuyJj
	3uNYxo7YW1ZX1+hWJgvWuXuW34X2MtnVF8zfBdnTr
X-Gm-Gg: AeBDievep5WPccJ2npQ4Kd0vmW+O4Pf5l+x5fpc+5QDXg5jjAb9VPHPJ5odBu7vEyrT
	0q18bqRam5d+PlT4IuAME2fYTQkDcmt+4uCgjAp05XhOlzbqfzBvKrUaHdYBhFPSdJym1VI4RuK
	3EDEPDqKUtEee0af7WaeWJosASJP2MgwsTsKa83+dy5m/JFovETlIJh3voHR4G+MqPuX4BcmkTt
	kkZmdXnW1ElmLGP/QRGNabYnrfHKlOjQtYWE2Xo9GYwSGtfhcktsmEsiSwse5aKrbFFpdERT2h/
	lnHW
X-Received: by 2002:a05:6808:4e83:b0:450:c602:751d with SMTP id
 5614622812f47-4789f30a117mr478569b6e.21.1775779316316; Thu, 09 Apr 2026
 17:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com> <20260409221749.5e6bccab.michal.pecio@gmail.com>
In-Reply-To: <20260409221749.5e6bccab.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 17:01:45 -0700
X-Gm-Features: AQROBzCWR2NkuRnQiJgvPU8426NPJ01KrykU49Mu-hXTwhh-nbRO23E0Iqy8PeU
Message-ID: <CAD5VvzBQLGDrbrds=OrOOh5ptmVjP+nyq-jRHF5dCFzw+S6iQA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58460-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-hardware.org:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A69DC3D0B42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thanks for the detailed analysis.

> crash-6.17-stock-stress-20260330.log
> Empty file, not sure why included at all.

Sorry about that -- removed.

> Not sure why usb_set_interface() is called. Is this the start
> streaming case mentioned in some email? What was happening before?

Yes, this is the start-streaming path. The app (Google Meet via
browser) opens the video device, which triggers usb_set_interface()
to select the alt setting for the isochronous endpoint. The LPM
disable failure happens during that transition.

> It's suspicious that wBytesPerInterval of the endpoint is 8,
> wMaxPacket is 64 and URBs are 16 bytes.

Interesting find. I had not looked at the interrupt endpoint
descriptors closely.

> Would it be possible to repeat this test with the patch below?

Absolutely. I will apply your patch, rebuild xhci-hcd, reproduce
the crash with dynamic debug enabled (xhci_hcd +p, usbcore +p),
only the Kiyo connected, and grab dmesg via SSH during the crash.

The CI bot flagged a dts-bindings failure on v6 but all code checks
(compile, smatch, sparse, checkpatch) passed -- unrelated to the
UVC patches.

Will follow up with traces.

Thanks,
JP



On Thu, Apr 9, 2026 at 1:17=E2=80=AFPM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Thu, 9 Apr 2026 10:02:47 +0200, Michal Pecio wrote:
> > On Thu, 9 Apr 2026 08:45:17 +0200, Ricardo Ribalda wrote:
> > > A usb device shall not be able crash the whole USB host. I believe
> > > that you already captured some logs and the USB guys are looking
> > > into it. I'd really like to hear what they have to say after
> > > reviewing them.
> >
> > Sorry, I forgot about this bug. I will take a closer look at logs
> > later today.
>
> lsusb -v of identical(?) device is found here:
> http://linux-hardware.org/?probe=3Da1cd74d9ac&log=3Dlsusb
>
> And I'm looking at the logs here:
> https://github.com/jphein/kiyo-xhci-fix/tree/main/kernel-patches/crash-ev=
idence
>
> crash-6.17-stock-stress-20260330.log
> Empty file, not sure why included at all.
>
> crash-6.17-video-call-20260330.log
> No debug messages. At some point:
> Mar 30 10:00:52 katana kernel: usb 2-3.4: disable of device-initiated U1 =
failed.
> Mar 30 10:00:53 katana kernel: usb 2-3.4: Failed to set U2 timeout to 0x0=
,error code -110
> Mar 30 10:00:53 katana kernel: uvcvideo 2-3.4:1.1: usb_set_interface Fail=
ed to disable LPM
> Mar 30 10:00:54 katana kernel: usb 2-3.4: Failed to query (SET_CUR) UVC c=
ontrol 11 on unit 3: -71 (exp. 1).
> Mar 30 10:00:54 katana kernel: usb 2-3.4: Failed to query (SET_CUR) UVC c=
ontrol 11 on unit 3: -71 (exp. 1).
> Mar 30 10:00:54 katana kernel: usb 2-3.4: Failed to query (SET_CUR) UVC c=
ontrol 11 on unit 3: -71 (exp. 1).
>
> Not sure if the LPM thing is the cause or a symptom of general EP 0
> disfunction, as seen in subsequent EPROTO errors.
>
> Not sure why usb_set_interface() is called. Is this the start streaming
> case mentioned in some email? What was happening before?
>
> stall-6.17-stock-no-workarounds-20260330.log
> All sorts of repeating errors, including stall on EP1IN ("ep 2") which
> is supposedly isochronous and shouldn't. Clearly some broken state, not
> sure how things got there.
>
> stall-6.17-stress-during-call-20260330.log
> This is the most interesting one.
>
> The first slightly unusual thing is repeated unlinks on EP5IN (int),
> not sure why uvcvideo would do that, possibly result of the stess test.
> I know that such pattern alone can break ASMedia host controllers for
> no reason I understand, though this one is Intel.
>
> It's suspicious that wBytesPerInterval of the endpoint is 8, wMaxPacket
> is 64 and URBs are 16 bytes. Just in case, I attach a test patch which
> rises wBytesPerInterval to match wMaxPacketSize.
>
> The first definite anomaly is Transaction Error on EP5IN:
> Mar 30 16:59:16 katana kernel: xhci_hcd 0000:00:14.0: Transfer error for =
slot 18 ep 10 on endpoint
> Mar 30 16:59:16 katana kernel: xhci_hcd 0000:00:14.0: Hard-reset ep 10, s=
lot 18
>
> Not sure why endpoint reset follows immediately without retries.
> The test patch also removes one potential reason. We might see whether
> the retries will fail, or if retrying until the transfer succeeds
> magically prevents the subsequent disaster. Perhaps the device gets
> unusually upset about sequence mismatch on this endpoint, which results
> from not clearing this halt condition properly (known problem).
>
> Five seconds later two control URBs are unlinked:
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 00000000=
122aa5e2, dev 3.1, ep 0x0, starting at offset 0x11e227b40
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: // Ding dong!
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 00000000=
8a55bcd3, dev 3.1, ep 0x0, starting at offset 0x11e227b20
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Not queuing Stop En=
dpoint on slot 18 ep 0 in state 0x44
>
> Probably timeout, i.e. things got stuck. Oddly, state 0x44 indicates
> that this control endpoint has previously halted - error or stall.
>
> Higher layers notice that things are timing out:
>
> Mar 30 16:59:21 katana kernel: usb 2-3.1: pipewire timed out on ep0out le=
n=3D0/0
> Mar 30 16:59:21 katana kernel: usb 2-3.1: disable of device-initiated U1 =
failed.
> Mar 30 16:59:21 katana kernel: usb 2-3.1: ThreadPoolSingl timed out on ep=
0out len=3D0/1
>
> Nothing works from now. At some point the parent hub reports
> disconnection and reconnection. Still nothing works.
>
> ---
>
> Would it be possible to repeat this test with the patch below?
> It overrides the suspicious wBytesPerInterval and hopefully enables
> retries of this failed interrupt URB. We will see what happens.
>
> xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 1d50c91afd7f..17d78b4e07bf 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1464,6 +1464,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>         mult =3D xhci_get_endpoint_mult(xhci, udev, ep);
>         max_packet =3D xhci_usb_endpoint_maxp(udev, ep);
>         max_burst =3D xhci_get_endpoint_max_burst(udev, ep);
> +       if (interval && max_esit_payload < max_packet) {
> +               xhci_err(xhci, "max_esit_payload %d -> %d\n", max_esit_pa=
yload, max_packet);
> +               max_esit_payload =3D max_packet;
> +       }
>         avg_trb_len =3D max_esit_payload;
>
>         /* FIXME dig Mult and streams info out of ep companion desc */
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 98ef014c8dee..e5823650850a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2544,6 +2544,7 @@ static void process_bulk_intr_td(struct xhci_hcd *x=
hci, struct xhci_virt_ep *ep,
>                 td->status =3D 0;
>                 break;
>         case COMP_SHORT_PACKET:
> +               ep->err_count =3D 0;
>                 td->status =3D 0;
>                 break;
>         case COMP_STOPPED_SHORT_PACKET:
>
>
>
>

