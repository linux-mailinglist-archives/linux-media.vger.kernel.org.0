Return-Path: <linux-media+bounces-56581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMTiGp/SvWktCgMAu9opvQ
	(envelope-from <linux-media+bounces-56581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 00:05:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CCF2E2331
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 00:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0109303DD62
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 23:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B2738AC72;
	Fri, 20 Mar 2026 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afe7LchN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97546383C8E
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 23:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774047864; cv=pass; b=NQiV4FZXLYkDN95OGCdagY6hU26AXTAl+pqhp7dISCbWVkpTTEuQHYMyr64AB+rHTFbQkIY4mg4Mt5rxlSEJASP66CC8F9FA7Kw4SAB6smvu0Imy0KAztLBli537do+GrprLH0PEiYqiO2wNSTN7zuBhdYPCH+6CyiXifLeAyPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774047864; c=relaxed/simple;
	bh=kbqvkak9EEUmypXJ+V4POVMtjCcscJp2HOu7ZIFqzvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRYvErd7Igrp1E4aAoL9TrzBN6eMSh8mhiccVAcnxuHCqftE68MOPHxPTjs2bg0soxQZdK8BwhKF5puTDnDdrepSgTFwMIyNxUS0M1LjWzXLnJcSHuUGqhA7xy/dmpZ5eGAq1q/EL7fe+ol38sTvMOoSVCKJfjXnt7SZ5jmRB+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afe7LchN; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b98133bdc4bso292074566b.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 16:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774047861; cv=none;
        d=google.com; s=arc-20240605;
        b=c/cSRuZNRwRwcqUadT/0VTdJdaNwgdpWQKDanagWVJUzNS4WXnHmgWJW2DrcA13VC2
         mjwBdyQ8yVMYSozGdAxE2nBZp7Np3L0kM36/O/qLGfmc7WNRb7G+qlIleLeMDauhQWy1
         QQBV0uy/meAFAcjS9RsgdJFlrRukxbxmQJYTfRZn0SF9M6EZyMWl473X9v4GLlxRJCCu
         dxryNcNvPn7cqGJnhWPpW6acZPmXLNqNSHED0W+i/5QevA55pm6JLZj2xtivKqlRmuIp
         0D7gp7lW8JIdLQXQMvXkR/ydvTDLc4XU5LJXvYFpAlGhuwTj/oWSo1aqoCz/N6f9gwik
         tztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R77uxUSpcwOmp5Wd2oi4VVJJwyjwUIqXwqU/MR5HNeY=;
        fh=CAjlMFzc+Vi+2JoLX9EU5h6yEzIEb6C+GitRjlQUsII=;
        b=NrsxGIY5av4RlYGhc3D6jOmeZ2B1/+mZAi7m0ILa41b0pkIA185QERRKFtArfYww67
         n7XW+CRHsb+TXe8JIW1AtlYhRmYUvDYHRF4tS9slNE60eYybMuVykxKPZC6NZsrmRxDV
         bVBKvKzZMRRIFe7aHgBt9aPqxoBacM8Ac9nXdebn2gpeoKi1g3a3dIEEnzRgzMbqEx1K
         eYgw/4Jw1gVDYbxIUlbrxwKm1t/XA81pM7HumLe7HfmASUHo6kdgfwhMbr8jLIHv0SwM
         oAt6PozAFaLLQ7SP3eQSm7t636MZ+xpdGY8/zDrKxDyXZASOsKTi/3v7o8G3vaRyex+f
         DbIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774047861; x=1774652661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R77uxUSpcwOmp5Wd2oi4VVJJwyjwUIqXwqU/MR5HNeY=;
        b=afe7LchNPwWuBwmTeNK7akkbMJ090DBcjdXiHBHztDK8jj6qHYo7PlH9qm6hocauip
         Z09jdkbrIZBOCyA0dQmIcicUQoVeCz7OKpgYDDiW+Pmg9rn3neRCXMzNK1/FyZg/xK6j
         DzSMDIEzHlxd7YqPL3cXyoHIYzkHRsbiOhBFZupLhPibqBFUUnSBETWIlyM2g2VP9YUs
         ejsVcjOsoIBnX+FiPAoTvw5baRFlVePSE4DeyHhcfosKAbelQSj+KUgh/zYp0Yhim/qd
         s570FPBJGy7WQvMhKT5+7qOTPEDYg9C8smt8loqsvd0ekpN7wC+LZys2hEqq+QZp8OS7
         JjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774047861; x=1774652661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R77uxUSpcwOmp5Wd2oi4VVJJwyjwUIqXwqU/MR5HNeY=;
        b=OyGEqxfqMovij99EaDu1EGIpKw2YuqQycuJjay0T5fqsctlUChjjbrxHjpPdAASIXL
         +yZXYtDYOAUX4FqtFjweQKwcq0UEZGJ+E1L32U2Y/34AIiUeu3l6O/MVxBGzvz0q7wrr
         vFbUOZ9JqqpiC3u8yhyUygsWRkXCLB30+DPfMOTGQzpAhOYGfoXwbMRAntBsiDx/joJD
         p9UxMYgRnXQq9fsZpCeeA9lxTv0VaVY04nOsJ2wxfaPBPk0aq+ZPNOz3xOQmhxnSV+ZA
         hn+UZ7uRwO9wz8LUbNTrulsREXcQZcR0fV7mMp4xFRpxpdwI6ZrMmrWk/LRlDAQp6ZIR
         FGog==
X-Gm-Message-State: AOJu0YztdAYCG0Ry7FXX7MNrvcl3smsJYK6bHdw64M83VhlYNebjUAuE
	cozs9VItnSPTbxC4YibwznrFDvwK1Fl6+SoMcy8MzqCw0AqXL8nLKe0Pl64UqUumNIAh1mahSK1
	PnSOr6IlvAbDiTQhzkftN2KFuLyVcYDo=
X-Gm-Gg: ATEYQzzXRcMlIyifxTpJmcpOsTfu5zvznjMwjTq/6++RbQQz8DJmv3Oo+RZiH2mblQC
	EirfLCm/NB/2nZoiTVIRz/quGNsTVBVdNJixbIJ5yIElr3BZFRd7gr8tPcPKiA1x/9L6P4PCACH
	w3dYCECsrceAPBU/bncRKjdNHPqoCPL39Qii9w7gZRG4n+qSXku3J2Ph94RjishvEoLFncyQE1+
	LuPeLOlLNG7yxpT7xifcKEe/gRhqPcKV+WgA+zJ7o7YDgCxbCKMRwH+Jcw2wqvwA3O2GKcOGAOc
	UDWgpNrHICegh+p/jn8Wi+6FZ2gNvyS2LQshgN7/pVaV3pITpysbo37wEGsxEHttiWqq9JIOiJa
	y0V5qdw==
X-Received: by 2002:a17:907:1604:b0:b96:ecc3:781b with SMTP id
 a640c23a62f3a-b982f0a9521mr383867366b.1.1774047860663; Fri, 20 Mar 2026
 16:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320010212.31425-1-rosenp@gmail.com> <202603201138.FAEE6A52B@keescook>
In-Reply-To: <202603201138.FAEE6A52B@keescook>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Mar 2026 16:04:09 -0700
X-Gm-Features: AaiRm50CnYdiewqTJThc98ujLgqJxlMjDYoRsDJZo2ihylZD1znGEKhaKiTTpZA
Message-ID: <CAKxU2N8LCFMFxFnJp586M2bs7J2gjyoOFH7H8MPYPU8XGpEA6A@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: kzalloc + kcalloc to kzalloc_flex
To: Kees Cook <kees@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56581-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D8CCF2E2331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:42=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 06:02:12PM -0700, Rosen Penev wrote:
> > There's no need to allocate these separately.
> >
> > Add __counted_by for extra runtime analysis. Moved counting variable
> > allocation to right after allocation as required by __counted_by.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> This looks reasonable to me.
>
> One thought I've had while reviewing your flex-array patches is that I
> want to make sure you're doing your test builds with
> KCFLAGS=3D-Wflexible-array-member-not-at-end
> so that you can validate there's no new uses of the target structures
> being composed within other structures while making these changes.
I did that globally. Too many pre-existing issues with that.

I mostly just run make menuconfig on linux-next and see what happens.
>
> That looks clear here, but I think going forward, it would be worth
> mentioning it as part of the commit log. Something like:
>
>   This structure is not composed within other structures, confirmed with
>   builds using -Wflexible-array-member-not-at-end.
>
> or similar.
>
> Reviewed-by: Kees Cook <kees@kernel.org>
>
> -Kees
>
> > ---
> >  drivers/media/usb/em28xx/em28xx-cards.c | 18 ++----------------
> >  drivers/media/usb/em28xx/em28xx.h       |  3 ++-
> >  2 files changed, 4 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/us=
b/em28xx/em28xx-cards.c
> > index d7075ebabceb..c278e48b3428 100644
> > --- a/drivers/media/usb/em28xx/em28xx-cards.c
> > +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> > @@ -3567,9 +3567,6 @@ void em28xx_free_device(struct kref *ref)
> >       if (!dev->disconnected)
> >               em28xx_release_resources(dev);
> >
> > -     if (dev->ts =3D=3D PRIMARY_TS)
> > -             kfree(dev->alt_max_pkt_size_isoc);
> > -
> >       kfree(dev);
> >  }
> >  EXPORT_SYMBOL_GPL(em28xx_free_device);
> > @@ -3912,21 +3909,13 @@ static int em28xx_usb_probe(struct usb_interfac=
e *intf,
> >       }
> >
> >       /* allocate memory for our device state and initialize it */
> > -     dev =3D kzalloc_obj(*dev);
> > +     dev =3D kzalloc_flex(*dev, alt_max_pkt_size_isoc, intf->num_altse=
tting);
> >       if (!dev) {
> >               retval =3D -ENOMEM;
> >               goto err;
> >       }
> >
> > -     /* compute alternate max packet sizes */
> > -     dev->alt_max_pkt_size_isoc =3D kcalloc(intf->num_altsetting,
> > -                                          sizeof(dev->alt_max_pkt_size=
_isoc[0]),
> > -                                          GFP_KERNEL);
> > -     if (!dev->alt_max_pkt_size_isoc) {
> > -             kfree(dev);
> > -             retval =3D -ENOMEM;
> > -             goto err;
> > -     }
> > +     dev->num_alt =3D intf->num_altsetting;
> >
> >       /* Get endpoints */
> >       for (i =3D 0; i < intf->num_altsetting; i++) {
> > @@ -4028,8 +4017,6 @@ static int em28xx_usb_probe(struct usb_interface =
*intf,
> >                       dev->dvb_ep_bulk ? " bulk" : "",
> >                       dev->dvb_ep_isoc ? " isoc" : "");
> >
> > -     dev->num_alt =3D intf->num_altsetting;
> > -
> >       if ((unsigned int)card[nr] < em28xx_bcount)
> >               dev->model =3D card[nr];
> >
> > @@ -4163,7 +4150,6 @@ static int em28xx_usb_probe(struct usb_interface =
*intf,
> >       return 0;
> >
> >  err_free:
> > -     kfree(dev->alt_max_pkt_size_isoc);
> >       kfree(dev);
> >
> >  err:
> > diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28=
xx/em28xx.h
> > index f3449c240d21..1c2f92927889 100644
> > --- a/drivers/media/usb/em28xx/em28xx.h
> > +++ b/drivers/media/usb/em28xx/em28xx.h
> > @@ -730,7 +730,6 @@ struct em28xx {
> >       int packet_multiplier;  // multiplier for wMaxPacketSize, used fo=
r
> >                               // URB buffer size definition
> >       int num_alt;            // number of alternative settings
> > -     unsigned int *alt_max_pkt_size_isoc; // array of isoc wMaxPacketS=
ize
> >       unsigned int analog_xfer_bulk:1;        // use bulk instead of is=
oc
> >                                               // transfers for analog
> >       int dvb_alt_isoc;       // alternate setting for DVB isoc transfe=
rs
> > @@ -772,6 +771,8 @@ struct em28xx {
> >
> >       struct em28xx   *dev_next;
> >       int ts;
> > +
> > +     unsigned int alt_max_pkt_size_isoc[] __counted_by(num_alt); // ar=
ray of isoc wMaxPacketSize
> >  };
> >
> >  #define kref_to_dev(d) container_of(d, struct em28xx, ref)
> > --
> > 2.53.0
> >
> >
>
> --
> Kees Cook

