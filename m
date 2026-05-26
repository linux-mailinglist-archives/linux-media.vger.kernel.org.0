Return-Path: <linux-media+bounces-62755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEVXLNBaFWp7UgcAu9opvQ
	(envelope-from <linux-media+bounces-62755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:33:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3995D27D3
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B2D0301CCDC
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73F038F620;
	Tue, 26 May 2026 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DLXMi+l1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0020FAA4
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784394; cv=none; b=eiAyk5qaXnQ3mjPHYHpdD67EwC+wOzBE7cLWKdmQTfytnFnshvnS3wKbUnWi3m6xiSB9/rkmNZMmgAlpzvQZkT55HIkUYTZC6zI/CHdK17bC6RP1nZfL/jtc/I3TLD/N3yFvCTNFR2lLFra0Mmpnaf15CyouU0H01PeJKwQGo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784394; c=relaxed/simple;
	bh=iDkKNtUUanU9hXStuhynXYQg8eVFq87yws+j/jOm0T4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zs9W1wkM/ltl7l8yypC2jii9GEJEpJwP3G1oT++c6ljj39VzrC1LAKpMFd6YhplvrcmrJnlLpHzZP2pFrl4QD7CJ66jyvcP0pdt3goz9p66zg8nPrIdTuH7n4B59sI4Xj1sEpDnV1vHN4fLK37KX8d80kRQOwEqOjCS0D3DK3P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DLXMi+l1; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68707d88626so12296938a12.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 01:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779784391; x=1780389191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i5qikf62bMmqCriKKZDG3uzq6vsC76p+Tzz2yJ5JYRU=;
        b=DLXMi+l1ZEWubKFx7EqU97+VxEIEUMUZQtEX9aLTX7zKGzPgOkMyonXe/w7TPeZWpP
         SbS5+5RrqAxo9taIZS4Lv5LmMJxM4WQIbRwqzzumD92m01bER0c5s2dfS211PvSIJ/X/
         d6vdXUG8GeUNpIjiFkOVKBeM3HcaUppYE5iEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784391; x=1780389191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5qikf62bMmqCriKKZDG3uzq6vsC76p+Tzz2yJ5JYRU=;
        b=pKaFdnnQSA6a94x5aYrLEFbepKfAiRoYBB+8Y3HAqCr6VP4MbIvUNmtCfVtTZng0vq
         4SicJkzJa05hG/GozRmt+/IO+AviCsjSupQdpPsJNIj/KOexNUNFmrJEOXTM0m6IkUub
         7lPHukr3RnsTj4naWsi5HhQdDi0A5t2S9QGcTNNz8ctvxxyY3tc6QKveyrUP5jROjElb
         T4CblQSgX1RAtUy8bTIIY+Ovc49Gfw/oKypbn/P+gNevS2wQDFVFOFnfZ0UlYDPmcvVt
         5OTV6ADC+QxZBVlXGMe/npTYr8SZVG+e0VkR/+4hi7r3P4etRMyptLZYhFlwHNn0+UO7
         dKvg==
X-Gm-Message-State: AOJu0YzmJis6PmIMC6c+ol/pSJy6TlOGzghCNEo0Ahkho5DbLgpNR8DX
	fkpqJY6VBMKBCKeZo0hvf0CkhQ12aMYXHKwHuRnVMBdeiu4onhPaL0khjzi+yGkf2F+aKudQIK5
	kQzE=
X-Gm-Gg: Acq92OFE8LZOasbwCSIGBDlDOsEu+yHEq1nuIcf6TvrqvwZZSJwEmoAyGcCHs7TGp9O
	nZs7Ktst0TrIIrdKhBnUqVWF6Wp0opk7Diq/3V3PDg/utUMnrg/bN1WQ41si9xl7LOqHP4eAmrF
	l4ov/VPF952n+TGSzB5WOazIgRoBqvBOzWuipQWPoqaUJ8rHq2ckOi5Pwed1hQOhis1Fo+sZeLl
	hvZcDjq5MXiJQJD+bIFYt9CTj/Mf6QUVTO+w8QIhrCF9xySulfuTO4glaBETDwZ4A9eVXCt1zvA
	zZYeWGKEKMvpLAbT99qCFaIrG+snRl+ROiMr75/wwv0ZUKfYHtQwU2jomHlqwtvOOrsy5CPYE6x
	ALB8h8DbemFu05iDU/Eekw97GAcetYP8F+8MCR7Yd3ctRtNjfuRJPprHDVzeoeFUaNxKlxuHqLt
	RqN2mttubvlMn+LoMdZ99F2lGRfEcOpyJ3epW64jfFi4BPz+uvUKyzOzYPZa2p
X-Received: by 2002:a17:907:e98c:b0:bdb:3dbd:4953 with SMTP id a640c23a62f3a-bdd22a3db89mr1051778966b.10.1779784391165;
        Tue, 26 May 2026 01:33:11 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc69d716dsm473057566b.62.2026.05.26.01.33.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 01:33:10 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd56d108454so1861528066b.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 01:33:10 -0700 (PDT)
X-Received: by 2002:a17:906:dc8b:b0:bd5:7c2:7621 with SMTP id
 a640c23a62f3a-bdd26bd8e30mr1151693666b.48.1779784389340; Tue, 26 May 2026
 01:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522225402.247080-1-sakari.ailus@linux.intel.com>
 <CANiDSCtH7treRe_2Y7h9YoiAfRGXZoX9pHNpLhcaoT2qS5+mFA@mail.gmail.com> <ahVZAJrW8RxpWe8U@kekkonen.localdomain>
In-Reply-To: <ahVZAJrW8RxpWe8U@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 May 2026 10:32:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCufMS4b14QJxaC0vs2joy1r4y04AFDMOphFObwUOLasRA@mail.gmail.com>
X-Gm-Features: AVHnY4KdOS0k5_IIXnsWiSjhmDTA1QrT7xtDHW_eb6Uc5iRPK5oDaA0pEgmYh3k
Message-ID: <CANiDSCufMS4b14QJxaC0vs2joy1r4y04AFDMOphFObwUOLasRA@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: ipu3-imgu: Ensure correct binary selection
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62755-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0F3995D27D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Tue, 26 May 2026 at 10:25, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Mon, May 25, 2026 at 05:08:51PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> >
> >
> > On Sat, 23 May 2026 at 00:55, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > The ImgU has two sets of binaries, those that support striping (fixed at
> > > 2) and those that don't. There's overlap between the stripes and so that
> > > implies a minimum width for the images themselves, or the Bayer downscale
> > > rectangle in particular.
> > >
> > > Take this account in binary selection.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > > Hi Ricardo,
> > >
> > > I'm not sure if this makes smatch happy but it somehow addresses the issue
> > > it found. In the end it's up to the userspace to configure this
> > > correctly...
> >
> > Smatch should be calmed now:
> >
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/c32fe4c4918c9aa49f61359e3b42619c4d8686de
>
> I dislike that because it's written simply to appease smatch and does not
> properly even try to address a problem. Can you try to revert it once
> this patch is merged? At the very least we need a comment on why that check
> is there.

I think instead of reverting the patch, I think it would make more sense to do:

- if (offset > 65535)
+ if (WARN_ON(offset > 65535))

I believe it would be safer, that way if the condition changes in the
caller we will catch this error earlier.




>
> >
> > But if you want to add more tests, you are of course welcome :)
> >
> > >
> > > Compile tested only.
> > >
> > > - Sakari
> > >
> > >  drivers/staging/media/ipu3/ipu3-css.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> > > index 8063401246fb..3e4e03a8fa3a 100644
> > > --- a/drivers/staging/media/ipu3/ipu3-css.c
> > > +++ b/drivers/staging/media/ipu3/ipu3-css.c
> > > @@ -1613,6 +1613,12 @@ static int imgu_css_find_binary(struct imgu_css *css,
> > >                     in->height > bi->info.isp.sp.input.max_height)
> > >                         continue;
> > >
> > > +               /* Check the striping overlap isn't wider than the stripe. */
> > > +               if (bi->info.isp.sp.iterator.num_stripes > 1 &&
> > > +                   rects[IPU3_CSS_RECT_BDS].width <
> > > +                   4 * IPU3_UAPI_ISP_VEC_ELEMS * 2)
> > > +                       continue;
> > > +
> > >                 if (imgu_css_queue_enabled(&queue[IPU3_CSS_QUEUE_OUT])) {
> > >                         if (bi->info.isp.num_output_pins <= 0)
> > >                                 continue;
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

