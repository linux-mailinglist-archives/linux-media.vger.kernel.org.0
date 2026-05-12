Return-Path: <linux-media+bounces-61254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIAvFy0nA2qj1AEAu9opvQ
	(envelope-from <linux-media+bounces-61254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:12:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BF520DA1
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBE483035BD6
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5614B3E173B;
	Tue, 12 May 2026 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WkX6ZEo2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC603E1727
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591092; cv=none; b=geQDxSkyBMX6SsevKu3O0yjlhvWIJIS01YueIK01mOCnSlG0cF/LAwuJAB5dIZYakHT22gh7xTMyKrke+qrcVBuPzTKMkJU65kqoj6Dh1bog5ukkmO/ptRP0FIkrC3r0vZb1VNrboN7gYP9/ES2AD7dphxzLXUsUzusOeTphDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591092; c=relaxed/simple;
	bh=Bwj6SG50tx7zvCHLHz9Mv5NCilc8mOQIbDilUe5gM8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIctbDxeWJG3F3gJ8iyaaz3eJCvHUKk6ep6T1XCKfjvt3c/XEK9eOC6FOsdwoa7+80aUAzcT0KKktxtKThv/9OdLeiQpi3U0S2AzctwgWNKUPvXY+uT2IHch3Wg7q3nUFw5rFmGNy4FXS1dJHKHxEfj715XsKMd76zWcY+L453Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WkX6ZEo2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bcd3c190f71so435143866b.0
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778591089; x=1779195889; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QciNpbOfQQYRXUiwuR9rhHSVvAPPydKWFQzyM2egsY8=;
        b=WkX6ZEo2Wwgs90bnIMplPh71zlEV/HzeoIe6f+KowWtp+fGsj+1c4vz0hnZlKyJOLL
         XLZHUclebEBkBkHMPNuArIevXHcuapsMIwsvFjRNda/uL6xiVxE5C8g+PqwkAnJF94Ab
         eYDouiS9fVRGGdpTVlPbtnFt6d0G97C0KSbo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591089; x=1779195889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QciNpbOfQQYRXUiwuR9rhHSVvAPPydKWFQzyM2egsY8=;
        b=kERpNuQw2jVt+rLXBVbZlfaDk/tm4cBxjoxbIjuMIrFGNUBhYSdK1JLjxCOrChjcQt
         Xtuvp1t2oC3VXZp08QZXQ7iJtMet0/CLvVm8/40sqgu1SRG9ZlEtjfloikq2kWFBawWj
         nIoPpATOhiIm2K/b60BBRf5akR99cgx+/jU01s/nC/pNR2yzXpMIQMw4we6NCMMYXlTV
         vucx5qQkbQc8hdRZeXhrtUmAfQODiWagOFtpSMQt0X+RW4HgbpO368bjerRkbAQg3JRJ
         hhVNCuJkAF+VwI1HPdT4wwecnqvpMa1zllNvfDfHSSgnGQXKV8P3HBRdRg/dsoCYFUzr
         fuqw==
X-Forwarded-Encrypted: i=1; AFNElJ/HlH8IfxfTtfgfavO4ZThEldLKz/wh60oB2jumf0Csnb4k/gkgPqaHeJJHjcjRWtnS+k4Rz3MpiBEswg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrdibv7yJmP+DbA6CweHdiKUurSJorEO12DDBk8juTq1gC+qdB
	CGcH4ndSiNA3Lgjo84vN5n2Ef1C7Z4TWwKEKg3h6/LeHEbLqkbJIIbLj/d7Cw9/chYwToHh3xTG
	h6HxtNnjE
X-Gm-Gg: Acq92OFjAA6iUgg6JKevDyeg2Pb0Ba7EhnnhzHyx+OEQUaXZ+mDjh/iWFsYPcPPGRNr
	CbI20tkdCj7VyEPEWiyUwJOE3qB7rT4WMuPtZ2XfUInDe066lzGZ8H4qglzaSDgbPy9xKUOuYYG
	HzTaDN8hF445/RopdJ8YTZT0A5kuoyrN0OR8pd/mqQXX7wJOmKzplWHq17+lDW1dPhepcA+2n8u
	t7cASfJaKv59taVWSbZgDRkyo5cCRGPD8qmwBnSSfI6K74+2dYXv6ej7bSXW/RMcJ5Bw06aUdaM
	Dlfx7TefR/6NnbWtEbkEnxGQMieE8ftZxGBatwTrMGdoOEGHHAwiHFlaCQW5292muX8f+CiNtQE
	sLOihc8yHTwVaUi7Yp2S9pfBy+BohHW468jjouN/2FxffdeMOL8iTRpo8wgMpPRXHjPAY7T18wv
	MaCPct7tamQKuaCy82I7mCt7sVNjrwKpgm5aWaxeyWJWfpGtJIBs9/rLUx/nED
X-Received: by 2002:a17:907:c29:b0:ba7:f5fd:ede0 with SMTP id a640c23a62f3a-bcc11a6e057mr786313066b.6.1778591089056;
        Tue, 12 May 2026 06:04:49 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d638sm4920884a12.22.2026.05.12.06.04.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 06:04:47 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bccb9dca1beso512337766b.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:04:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//rvr5keFA8nrKINsuFUqcVMDq3f/oJ9QYtnxtnxcZnTIIoATvB4M/QqKrhwh/SUXHT2oh5wbk7dee1A==@vger.kernel.org
X-Received: by 2002:a17:906:4786:b0:bc1:6ec9:453b with SMTP id
 a640c23a62f3a-bcc14d9dfeemr813452166b.42.1778591085452; Tue, 12 May 2026
 06:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-3-aa42e3865204@chromium.org> <20260511155125.GD3043805@killaraus.ideasonboard.com>
 <CANiDSCs5jeEN7OL1PDc0XXtCP5Op2jpnWJyw7WR4Vn_Z7ECYOQ@mail.gmail.com> <20260512123827.GB4128@killaraus.ideasonboard.com>
In-Reply-To: <20260512123827.GB4128@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 May 2026 15:04:32 +0200
X-Gmail-Original-Message-ID: <CANiDSCvrrhweC66+mAp1MxrG+8yEeBBpeOOSguxR0xO1kFA00w@mail.gmail.com>
X-Gm-Features: AVHnY4JzE1Xda9TZIe55UwfOZ72LTVW2oLWCakhoC3PmZeuGo55v4k9oMaLJ5Zk
Message-ID: <CANiDSCvrrhweC66+mAp1MxrG+8yEeBBpeOOSguxR0xO1kFA00w@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: uvcvideo: Relax the constrains for
 interpolating the hw clock
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 294BF520DA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61254-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Laurent

On Tue, 12 May 2026 at 14:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, May 11, 2026 at 05:58:30PM +0200, Ricardo Ribalda wrote:
> > On Mon, 11 May 2026 at 17:51, Laurent Pinchart wrote:
> > > On Mon, Mar 23, 2026 at 01:10:30PM +0000, Ricardo Ribalda wrote:
> > > > In the initial version we set the min value to 250msec. Looks like
> > > > 100msec can also provide a good value.
> > >
> > > I'd like to know where the value comes from and how it has been tested.
> >
> > I used the Android CTS framework for testing. It checks in multiple
> > places that the timestamps are stable.
>
> You deleted the information from the comment below, and didn't mention
> anything in the commit message, so I was wondering if the situation has
> changed. I'd like to retain the information somewhere.

I believe it should be fixed in v2. Looks like I have to send a v3
anyway :P so I will double check that it is still there.

Thanks!


>
> > > > Now that we are at it, refactor a bit the code to make it cleaner.
> > >
> > > Do you mean using a macro ? You can mention that explicitly here.
> > >
> > > > Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_video.c | 18 +++++++++++-------
> > > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index c7ebedb3450f..dcbc0941ffe6 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -494,6 +494,13 @@ static int uvc_commit_video(struct uvc_streaming *stream,
> > > >   * Clocks and timestamps
> > > >   */
> > > >
> > > > +/*
> > > > + * The accuracy of the hardware timestamping depends on having enough data to
> > > > + * interpolate between the different clock domains. This value is sof cycles,
> > > > + * this is, milliseconds.
> > > > + */
> > > > +#define MIN_HW_TIMESTAMP_DIFF 100
> > >
> > > UVC prefix.
> > >
> > > > +
> > > >  static inline ktime_t uvc_video_get_time(void)
> > > >  {
> > > >       if (uvc_clock_param == CLOCK_MONOTONIC)
> > > > @@ -834,15 +841,12 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
> > > >               y2 += 2048 << 16;
> > > >
> > > >       /*
> > > > -      * Have at least 1/4 of a second of timestamps before we
> > > > -      * try to do any calculation. Otherwise we do not have enough
> > > > -      * precision. This value was determined by running Android CTS
> > > > -      * on different devices.
> > > > +      * Check that we have enough data to do the interpolation.
> > > >        *
> > > > -      * dev_sof runs at 1KHz, and we have a fixed point precision of
> > > > -      * 16 bits.
> > > > +      * y1 and y2 are dev_sof with a fixed point precision of 16 bits.
> > > >        */
> > > > -     if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
> > > > +     if (clock->size != clock->count &&
> > > > +         (y2 - y1) < (MIN_HW_TIMESTAMP_DIFF << 16))
> > > >               goto done;
> > > >
> > > >       y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

