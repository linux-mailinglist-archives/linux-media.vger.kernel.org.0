Return-Path: <linux-media+bounces-51321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLBGDzHYcWk+MgAAu9opvQ
	(envelope-from <linux-media+bounces-51321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:56:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364862B73
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 836B9501A89
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6665346797;
	Thu, 22 Jan 2026 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e/23ornS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DBA2701CB
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068174; cv=none; b=uo0awKGz5Wsly5rnUPkLdhD22nmBLPgLxJrNI2sYptKYfTrfNwDBD6Jcy/5iOoRlJHtInAIx36RzDmXi9NnK75IwKYzZNeTi6MdHiN3a78UJZiQCAVibpGUqFQxKrIBst5FFKk/ig8uu/w8NhZHqQ3WT4exjo6cCDVby2P4XzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068174; c=relaxed/simple;
	bh=XLEsoAL7Og30kEwKeNdXOqECEYNqoNEocBxK9ydj6fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyJ4aJgkL8dBv+fufMLRdoETBEWMcesuHaFpSTTk1YtkMsPD73f1RmlUmX6+56AC6ZuiIuZ2G1vq7vCUMfqFjn5vhUsXrOOJ8PVJoAXl5DrUJAyskdmFh3CK+TCKQsHfjuzUnS7mPRShUspBe3g0hHqAltBmZGqCyqU2YcWfSEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e/23ornS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59b7be7496dso614457e87.0
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 23:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769068166; x=1769672966; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q9j9Kfu0kMW+ZRsoruAiIemqlTW7NT2TBCggLxpnpo=;
        b=e/23ornSYLVRtScD2NCJ0ufa2u8QF8QCV0OozQinnYffCl5U6DRbD9tyKASWCk/uLw
         bLketvzeVIWqVDIQAopzBI+UXzz/2UK/nPVzv5enRUcgKlC4QtjZEcDKFYzQwtzy2rQr
         Q2zGZpbdI6odNjDekFm9UH2SHYwibtbi9qPi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769068166; x=1769672966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Q9j9Kfu0kMW+ZRsoruAiIemqlTW7NT2TBCggLxpnpo=;
        b=Hi586+hZL7v21Z+UK2brl1UmCFHa6DtsV3jiFN3rrNbg/APqLuKOItDesf5oeMicej
         m+qftZTd0+NxJXQ0S3ChPstjDEPPZ+wt2By2wZXiA0RMglkc1APW0jGMZirj2aPefIOy
         0utMgcqL0wl5gLbWzaCKMZNE6o4oYNQCKbrB+4/KmTyUdGXuabBQt+JNwEaNdPYjuWkp
         /Z97PXJJe3AKYgcB0lu8FZfU5uSCZQ741yHlbeND7PFgVCOQ6XL4JIAvgQYZ6uV9n1of
         0evPDupBbH6vYoFvq5eYKvfgOw7G/BFF48d9OWJ3a3dDlsjzanOmJMgOTikJ+rHaF8cl
         58Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUSGoFSABxz1VX9QYTXIG38Cty/qo8WOfPm1tZlIyTf8ci4Z58OZy3omY9XjyqXxkWD4bBAAAxjak2MfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeO4GkjqcS0sk7M2rQGbvktsb46SqdGI1bMNyBgOBpUAycnhRw
	zPQLfsHn3fUiibSevI7yzeD10QTxkk37Lz3QTXnfEchGU9JB1sag3BIXNgxSXEIwyeAgK2K6VFr
	t77Y=
X-Gm-Gg: AZuq6aKv6Rj1nZ1ozpmiFPFbQmjdvvRzZgrzf9TSMmRrhZDQWz2Xtx8yO2oitcGMaWt
	9yqgk73WQs03Cf1vCi99WZsi4MHRehnZp7bLnRCQ6+P+Ba86ZnwEZXBVFBsnlCT5bbZoMTEKU+V
	rNXRaNhFILtQZPFY1XAg/cSVsmEDa4MtZOkdrdaLgFHIoehNC+O9UjQpJTptcl/P/FS8soJfTOj
	snyJDclR5P2/CznIDs6Z+8ASp5oVEY/tYfxVgTmJjMzRQWcAtKgYH/OSAKnaXW+QGlAd1XBV3zm
	Zk60fmHxxOrRxIVxsgK8NVaXObkOgGNVnevDjXdkjdtKefztCKGv5T2ATP2/ibUTGv17QMsOveQ
	0WBQiUcav+rJmAMjX0NxGrlRk+Rodqf60g96vTc1uEC8gFrJF+PLIFlynOKoISchE27dZcjepeU
	fChuncLxLAhf/vVQUsmLuvYcKWlgo/3z4oKTl8yKumBgGOgfsTbKtk
X-Received: by 2002:a05:6512:ac3:b0:59d:d679:2a6d with SMTP id 2adb3069b0e04-59dd6792dd6mr1115708e87.23.1769068165732;
        Wed, 21 Jan 2026 23:49:25 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397ae4sm5374032e87.59.2026.01.21.23.49.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 23:49:24 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso6764451fa.1
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 23:49:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVb1P7M4gGb4tGnEQGJioq34W7w5LqlRfqTY4ul6LLTV5sVYEBJd3MI/H+ZS9nG919hHRq6Lwe5eQROBg==@vger.kernel.org
X-Received: by 2002:a05:6512:398f:b0:59b:6ae7:63ee with SMTP id
 2adb3069b0e04-59bafdb63b3mr7178063e87.3.1769068163788; Wed, 21 Jan 2026
 23:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
 <20260114-uvc-alloc-urb-v1-3-cedf3fb66711@chromium.org> <20260122014952.GC183118@killaraus>
In-Reply-To: <20260122014952.GC183118@killaraus>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 22 Jan 2026 08:49:11 +0100
X-Gmail-Original-Message-ID: <CANiDSCu96Sf6DzU+_+sFH4h6=aN9zV7+rLrn-Kxs-1Q5HCdOZg@mail.gmail.com>
X-Gm-Features: AZwV_QiNAhfSNAVz2pI-KwvwBDkLbbG88UyJX9kOSoRvrskdhXWhM0HDmYq6yuI
Message-ID: <CANiDSCu96Sf6DzU+_+sFH4h6=aN9zV7+rLrn-Kxs-1Q5HCdOZg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: use min() for npacket calculation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Laurent Pinchart <laurent.pinchart@skynet.be>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[chromium.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51321-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9364862B73
X-Rspamd-Action: no action

Hi Laurent

On Thu, 22 Jan 2026 at 02:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Jan 14, 2026 at 10:32:15AM +0000, Ricardo Ribalda wrote:
> > Make the code slightly more appealing by making use of min(). There
> > shall not be any functional change from this patch.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 59eb95a4b70c05b1a12986e908b7e9979b064fd0..db02080f15772e0bc1d5cfcadd32463f4e6ea045 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1808,9 +1808,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
> >        * Compute the number of packets. Bulk endpoints might transfer UVC
> >        * payloads across multiple URBs.
> >        */
> > -     npackets = DIV_ROUND_UP(size, psize);
> > -     if (npackets > UVC_MAX_PACKETS)
> > -             npackets = UVC_MAX_PACKETS;
> > +     npackets = min(UVC_MAX_PACKETS, DIV_ROUND_UP(size, psize));
>
> Do you think this improves readability ? I find the existing code easier
> to read, its purpose is immediately clear: it computes npackets and
> clamps it to a max value. With min() I have to pause and think.

I guess it is a matter of taste. I left it as a separate patch for that reason.

>
> I'll take patches 1/3 and 2/3 in my tree already as 1/3 fixes an issue.
Thanks!


Regards!

>
> >
> >       /* Retry allocations until one succeed. */
> >       for (; npackets > 0; npackets /= 2) {
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

