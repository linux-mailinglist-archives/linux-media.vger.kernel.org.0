Return-Path: <linux-media+bounces-6187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2E86CFF2
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 18:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F85D28584B
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 17:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A30778279;
	Thu, 29 Feb 2024 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RwWqCEwa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7564AEF3
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709225875; cv=none; b=r404GKOiNxLSUnUOs8yoJfFFK8cfPOoXVP0Sy4cenzKQW8lXPUewzptWKKHWDvHbcriw7bOFXr3ScNuusgfDSSaK1WCU0Myq3bwlJcjdO8hxMy0K0OyP/Flwb6xoQ0LND/rBXHARzACb+XvbhUiOF3DgbGFb4Yt+i8898NC2GuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709225875; c=relaxed/simple;
	bh=/iw69Wo9b7FEqCXecpxEQgFw9ugs5Mjc606tFUFxMt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rnvmqiQQTpzb/mqQyL4+sIKiPm4RvIS8abYv5S4C1sV75uJQhtEA0aJLNfm+tUg+FuaXLY+4X/wlPn3GOkWU3ZulllovUg5VIcBKgIh+RIoWvGBYnk4cxHQ6oMrR/pAf96sXHk75+Ngt8HhfOihaJgRS7ID23CpyeKH7ra+ezyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RwWqCEwa; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5a05923b689so445947eaf.0
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709225873; x=1709830673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wIQGu3rSrz7XnTQlEMgB0HP/EAY1ehgeyK1F+l2GXOk=;
        b=RwWqCEwa7i3XY5L79QT61EhFpmWOExPkAvv1qBNe1ppoEB+VO+eFEeqasTTHyo4dM5
         iaCasV6IySwvysO66r0W2FfIh9v734+ZYgARzqs9OMPCSXgY9noOjBvcE58xK1/Ls2ha
         +bBh0j7Tp0n1jQctmYLZJRt747HS9ae/Pyi6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709225873; x=1709830673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIQGu3rSrz7XnTQlEMgB0HP/EAY1ehgeyK1F+l2GXOk=;
        b=rdfp8tb5pl8KoLTdZLthZ9E1d576AYRVAggsEY+otUTs+wETY/LvWdha4m6cqHwNT/
         VyDCnxt4YlH+LfoTE3AL6Wu9VBrW3YnLpR27cHAzoGW8Us/DN1bK3AZVSCW66PLziFqw
         y1WEs23+kRfUzZUv+Qpa/BcLt0IlZv4HG0Ae3gJ4jNSGeWgfnlDc3bpjg4HdtPwx8Rpj
         Wfq+7j1utmPHV8kieGsNhvY1KixjM6mJX9zbu5GVcHSX+QjmA7q/0mB/sakytMmeuQJU
         8XI/6m/RKy1tlXvjpwKBJ6KwLpn6vqhLEq3asQHT5ASH2mN8Br7um13wEgc2T9HjqRDm
         8rpg==
X-Forwarded-Encrypted: i=1; AJvYcCW+K1gEiKf0sMrP/tSy5gwl+VCCxGJ558flQiL8z4ZL3eSuThkwjc8HqXueZMKIZszRTlY73X2e7o+8rTZCLfHFkoSDfTGBJ9o6YeE=
X-Gm-Message-State: AOJu0Yx7El3O+k05vz6qaRcNOMW2XU3RaaBYl3jx8MfJjJe0wo0BGcSI
	mC6a2R89ZDPp8KFIRD16RJEmg5/yaS8l+TdGaSVjSkHM9YvHjy2Bk2FZlHjnKf+N8e3h2B5FBgM
	=
X-Google-Smtp-Source: AGHT+IEQgShAKjZa0Kk++kzzQThmUUURqA3bsCpXuB3adtjUbGC4OOUl3u21GqiG4Tr72IWxYvwd9g==
X-Received: by 2002:a4a:9288:0:b0:5a0:e925:d413 with SMTP id i8-20020a4a9288000000b005a0e925d413mr1974643ooh.0.1709225873263;
        Thu, 29 Feb 2024 08:57:53 -0800 (PST)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id y19-20020a4a6513000000b005a0d40935b7sm356890ooc.26.2024.02.29.08.57.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 08:57:52 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a05923b689so445933eaf.0
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 08:57:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGEpydGSmSNiqmV0qqW+k1yW6ceR8JMKNDWvZlcZ1UquYLjCeJkA2D3pHUeu5uzNFPpcX5iY8pxb9kGNUr62lsPVHnCkqsQrf19Go=
X-Received: by 2002:a05:6358:441e:b0:17b:5c4b:90a with SMTP id
 z30-20020a056358441e00b0017b5c4b090amr3320345rwc.5.1709225871313; Thu, 29 Feb
 2024 08:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108-rallybar-v4-1-a7450641e41b@chromium.org>
 <20240204105227.GB25334@pendragon.ideasonboard.com> <ca89eb86-a566-422c-9448-d8d5254d54b8@suse.com>
 <6aade777-d97c-4c65-b542-14ce5b39abb6@rowland.harvard.edu>
 <20240213104725.GC5012@pendragon.ideasonboard.com> <CANiDSCvqEkzD_-pUExT2Aci9t_tfFPWusnjST5iF-5N9yiob4g@mail.gmail.com>
In-Reply-To: <CANiDSCvqEkzD_-pUExT2Aci9t_tfFPWusnjST5iF-5N9yiob4g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 29 Feb 2024 17:57:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCsqER=3OqzxRKYR_vs4as5aO1bfSXmFJtNmzw1kznd_wQ@mail.gmail.com>
Message-ID: <CANiDSCsqER=3OqzxRKYR_vs4as5aO1bfSXmFJtNmzw1kznd_wQ@mail.gmail.com>
Subject: Re: [PATCH v4] media: ucvideo: Add quirk for Logitech Rally Bar
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Oliver, friendly ping

On Mon, 19 Feb 2024 at 16:13, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Oliver
>
> Would you prefer a version like this?
>
> https://lore.kernel.org/all/20231222-rallybar-v2-1-5849d62a9514@chromium.org/
>
> If so I can re-submit a version with the 3 vid/pids.  Alan, would you
> be happy with that?
>
> Regards!
>
> On Tue, 13 Feb 2024 at 11:47, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Mon, Feb 12, 2024 at 02:04:31PM -0500, Alan Stern wrote:
> > > On Mon, Feb 12, 2024 at 01:22:42PM +0100, Oliver Neukum wrote:
> > > > On 04.02.24 11:52, Laurent Pinchart wrote:
> > > > > Hi Ricardo,
> > > > >
> > > > > Thank you for the patch.
> > > >
> > > > Hi,
> > > >
> > > > sorry for commenting on this late, but this patch has
> > > > a fundamental issue. In fact this issue is the reason the
> > > > handling for quirks is in usbcore at all.
> > > >
> > > > If you leave the setting/clearing of this flag to a driver you
> > > > are introducing a race condition. The driver may or may not be
> > > > present at the time a device is enumerated. And you have
> > > > no idea how long the autosuspend delay is on a system
> > > > and what its default policy is regarding suspending
> > > > devices.
> > > > That means that a device can have been suspended and
> > > > resumed before it is probed. On a device that needs
> > > > RESET_RESUME, we are in trouble.
> > >
> > > Not necessarily.  If the driver knows that one of these devices may
> > > already have been suspend and resumed, it can issue its own preemptive
> > > reset at probe time.
> > >
> > > > The inverse issue will arise if a device does not react
> > > > well to RESET_RESUME. You cannot rule out that a device
> > > > that must not be reset will be reset.
> > >
> > > That's a separate issue, with its own list of potential problems.
> > >
> > > > I am sorry, but it seems to me that the exceptions need
> > > > to go into usbcore.
> > >
> > > If we do then we may want to come up with a better scheme for seeing
> > > which devices need to have a quirk flag set.  A static listing probably
> > > won't be good enough; the decision may have to be made dynamically.
> >
> > I don't mind either way personally. Oliver, could you try to find a good
> > solution with Ricardo ? I'll merge the outcome.
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

