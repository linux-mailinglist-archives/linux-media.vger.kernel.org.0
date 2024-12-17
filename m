Return-Path: <linux-media+bounces-23615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E24479F509A
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC17A18909D2
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701071FCFF4;
	Tue, 17 Dec 2024 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HgCmCATx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5579A1FCFC5
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451380; cv=none; b=jt1GoxccWziqtLpJrLDttEv5qjC9NB1MtsYzo7ekuYso13XroVpCwXUXAxnS2sCv2Y1dUiZK5DtQj4iZMQj1G3XLOMtwrxzD+sNVHF+/z6gYdTMtSAyhCZhW/hcrrF1v3rA75/h0gR24NIruzMObtoVzSz9/T4J2h8bwddO6J8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451380; c=relaxed/simple;
	bh=RiVSbNS0zjX7Ot4Ch5L0a4Yk8i7Tn8ybYQODW7ZCzJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJugJqgXI7oCVSsD2s1Z4OjnLICoG9BeEk41T3Yk/uCMOtfPvxcZ0NO94VWmyNZLLSj17yt3SIRhx9Vmuu4XbzS3uXnb3t30J3qwjcSqk8dbx7VBV3TYWpRjJJq8Y0Q16bE/U4MH5Vi7F0BEukTDupS29AwCZLomhXbnG/8ATHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HgCmCATx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-728e729562fso4764195b3a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734451378; x=1735056178; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eiTrPqTSxV7Z6WLCrm6dsoSnnkuu1SkRHzAAp8QzufE=;
        b=HgCmCATxfRyPiikJuwV1fbrF/7qeObIQHNJXtI2W4MmuSHejl7YiOODKFIOFjtg2bI
         KUTKclWGgaFIqvsWVbHyFXo3G38gcmFOnDC7rSYWo1qFEybiK//zItwpIP8HWz7YKmm3
         NYCvAgpsCwZ7K96I41y7spBs2DhaLwsJIxvhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451378; x=1735056178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiTrPqTSxV7Z6WLCrm6dsoSnnkuu1SkRHzAAp8QzufE=;
        b=wFNvwqehOPEtWODlm71vrqmSCFOA8LTPgrLfN/BXtfwQbfbJ6tSMdhuwQeF3FhuojQ
         BNyxFGByEC71cFkmN70corGZD/1pgk1hqkN5OWSEIDvxMHJURLNL4UaZ+gDk14zGneVD
         Rq/u/efUg55OzaDF9H8MtYH/rfEA6U+X/I5zNyDkK3Pmq1FvgETIqf31Q92/xTVZK19I
         pxu/gPkIsJuSfNaSs8A5Z+RbCen5OHhTkKj36A/9c4FjtuONvl5h5Nm1c7tlD/WjDrPP
         loYyTR6742H9JWb/gPrS3F0h2gD7/qkcIVxYjYAviMZV9lVKc0gzjNhBdpBzl3TxG/Lz
         fiEA==
X-Forwarded-Encrypted: i=1; AJvYcCVaqIF8j5UxOH+rI2RZo7cMgsRFjc6AFZ+rNWzPIRQYumQB9IkfLB1elafRDAB+ohD/o+KnM9thB25f5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXoGfcvnSHzUO+tqEKIAkGwrr9QpOl0GVSiuGTew/2sAtawwM
	qOT490N76lwyXgJDH6kEAamM+78qsSyZT3h+QyL6ITy5E9Tu2a3/vivyQcbCItmwGyuHPEuDEGg
	=
X-Gm-Gg: ASbGnct2XddAFU6UQ7CTAMKA5lMZ9M8DM0BgDUMJ2qarH+kJDyt6W9YR3QjSgp++94m
	iJv3pWL8fw2LNblQfjWyBzemeGBJrZ8W1DdpRGJyNfOFMF/f947Aot3dtMvBUnojCaHNYqNSlX1
	fWBYdBLeFFC/nAjPkNzoiVkgHPuvCn7pHgEq/J+ywAmza2/pcAaylaqx0pKvqfw3AoWrfRTFf/8
	PNf+nxensxlbcmOdKv4OA0ZVNA7t+yqVbKR1fJ5j/9POeP4iatD4o4XjG//RL6fBNNxFqOeO5uU
	Ey0zP3nK/Y+lDZkJ99Kb658=
X-Google-Smtp-Source: AGHT+IHrweLHiRXUGilARWSMdiD3kb0vTshY++IUe6bAtAy/m+Yh1j5kCYxdl8G1Rc1hj3y5Bh7ZRg==
X-Received: by 2002:a05:6a20:9f05:b0:1e1:9fef:e958 with SMTP id adf61e73a8af0-1e1dfd1f5ffmr26692352637.9.1734451378452;
        Tue, 17 Dec 2024 08:02:58 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bade0dsm6810697b3a.164.2024.12.17.08.02.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 08:02:56 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7feffe7cdb7so3035237a12.1
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 08:02:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsp05GrM+8yBtmXvaGNv8RKGwiXCxSlH7XeHxBDZ9CNN5tLffBYhnvQ05R6xSOqqsiXAuS5gs0dXrrYg==@vger.kernel.org
X-Received: by 2002:a17:90b:3e8e:b0:2ea:2a8d:dd2a with SMTP id
 98e67ed59e1d1-2f2900a98b4mr23514834a91.27.1734451375530; Tue, 17 Dec 2024
 08:02:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217112138.1891708-1-isaac.scott@ideasonboard.com>
 <20241217112138.1891708-2-isaac.scott@ideasonboard.com> <CANiDSCtkgRJdPQmwPV6GStLMv_xEYC51LDED1St6i9bnmNEPfg@mail.gmail.com>
 <CANiDSCuJVn9sSP+OWNp+AVM9NCsYaLC_x2AdtPhwwGsVMVK3Lg@mail.gmail.com> <0cd5abccbbd307b0346fb4c542dc0a2764665fb7.camel@ideasonboard.com>
In-Reply-To: <0cd5abccbbd307b0346fb4c542dc0a2764665fb7.camel@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Dec 2024 17:02:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCv-KqBk9UQrdTztzS7+zczu-chFw7owECcfOoGLEtXa0w@mail.gmail.com>
X-Gm-Features: AbW1kvZ_OswdXxuL4IZIFzE1z50c4tND3mXGvVQwOy1CMYbIpFwsL6xLtLI50DU
Message-ID: <CANiDSCv-KqBk9UQrdTztzS7+zczu-chFw7owECcfOoGLEtXa0w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] media: uvcvideo: Add no drop parameter for
 MJPEG_NO_EOF quirk
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Dec 2024 at 16:43, Isaac Scott <isaac.scott@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Tue, 2024-12-17 at 13:08 +0100, Ricardo Ribalda wrote:
> > On Tue, 17 Dec 2024 at 12:58, Ricardo Ribalda <ribalda@chromium.org>
> > wrote:
> > >
> > > Hi Issac
> > >
> > >
> > > On Tue, 17 Dec 2024 at 12:22, Isaac Scott
> > > <isaac.scott@ideasonboard.com> wrote:
> > > >
> > > > In use cases where a camera needs to use the
> > > > UVC_QUIRK_MJPEG_NO_EOF,
> > > > erroneous frames that do not conform to MJPEG standards are
> > > > correctly
> > > > being marked as erroneous. However, when using the camera in a
> > > > product,
> > > > manufacturers usually want to enable the quirk in order to pass
> > > > the
> > > > buffers into user space. To do this, they have to enable the
> > > > uvc_no_drop
> > > > parameter. To avoid the extra steps to configure the kernel in
> > > > such a
> > > > way, enable the no_drop parameter by default to comply with this
> > > > use
> > > > case.
> > >
> > > I am not sure what you want to do with this patch.
> > >
> > > Why can't people simply set the quirk with
> > >
> > > modprobe uvcvideo quirks=0x20000
> >
> > Sorry, I meant
> >
> > modprobe uvcvideo nodrop=1
> >
> > or
> >
> > echo 1 > /sys/module/uvcvideo/parameters/nodrop
> >
>
> That would also work, absolutely!
>
> If a user has these cameras, they should always add the no_drop to
> avoid losing frames that would otherwise be discarded as they are
> erroneous.
>
> This quirk will always trigger, and it is likely they would want to
> have all the frames sent by the camera, while still marking them as
> errors they can handle later in user space if they want to.

Besides what Laurent is saying:
```
One issue with this is that it becomes impossible for someone to unset
the no_drop parameter.
```

There is also the issue that with your current implementation you are
changing the module parameter for ALL the cameras probed after this
one:

I believe that you have to do:
-       ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
+       ret = uvc_queue_init(queue, type, !uvc_no_drop_param &&
+                                         !(dev->quirks &
UVC_QUIRK_MJPEG_NO_EOF))


But maybe before that we need to have the discussion about: shall we
remove uvc_no_drop_param altogether?. We could start by swapping the
default value and see what happens....



>
> >
> >
> > --
> > Ricardo Ribalda
>
> Best wishes,
>
> Isaac



-- 
Ricardo Ribalda

