Return-Path: <linux-media+bounces-22416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B169DFE70
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 11:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78A45162B9F
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55091FC0E4;
	Mon,  2 Dec 2024 10:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ivX9+RPv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06146434
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 10:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134300; cv=none; b=nEJ5WzueGI5yc1o14RspqkCNDvW5P4GGr42NeUyLTQT3SoQNk79ZyZOh2ZuNyOCOkP03tfXePubBmRAR5hyqeQ+E+6royxaFCN8RhuYorEqDuduqMLU5LT1NNgbyMVtCqk143uPNRT7IXtCOl830qfRo8ZLQ/blQURqGOQcr49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134300; c=relaxed/simple;
	bh=U7rbdYbZDh7xSxahV1mY9FJE7hACVUQFMBHdEHN/0rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8aMH4YoPr9JD9YXtXDzLBvT/Hv5BClT8cOnsSY9hhsJa+cxC9HV5taQzLNI4EW6fg2i2RpZazuc78DakrdC9R3JthBDPuVNsJDkaEeOqLquXgJss71mKFNF+4tnMY2uYKy7cb03H0kvNUp9q/Arep1GJcW5TGffySsGSJkYRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ivX9+RPv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2156e078563so10011095ad.2
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 02:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733134297; x=1733739097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=knJS7mj1YtFquz8cQCj19OIgQjQc2GxbLndLnPuEFF0=;
        b=ivX9+RPvksd6SUHksxhadP6lPe6xE+vwPsJQcpdtEjqb8hbJVzmm/yqSyb+Jo3N10x
         BxOtnx6iGSRlzru1+gQMrXchMmZBIupsUdbgi7myQFck6YYp8hvbETW998mTIKKEuK4k
         V3avK3EoRsJMymlXhb+L07+fbHTmLLWofQu+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134297; x=1733739097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knJS7mj1YtFquz8cQCj19OIgQjQc2GxbLndLnPuEFF0=;
        b=QRWJFwdmgPjM3eZlStC2n96AosUU6gYgufJKFA5105zixD6rvVCSDTTKoUzRsLBc56
         RyskL4XIPYEuJLY9LNkPN8XBh6fY9OiO0ihokKF1UnKH/zT6lrHN4vsdsK0TAc9De2Sp
         f7b4FkQYXItjN5vyLxgJFRNU+a0DmYF4sOS0oSIowb/dno8PDf1OgGpsiwlC1CwOCBXt
         ODJY6a5NcAfnjsCLs+wRNQkRXz1sleqa1Z6SGhJJGYfe//xwz0vqgpEimzHFTQZS6DT5
         EavTRXQ8xQizaHR7ZhIEfCwH0A8TiujefRXG86fZoqAeJcyKcJDorsyQlffU5zoTQN2G
         LAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsxJhfiE5V5sf3TMonfmadkhCYBoMNgb9kBBhCpiDexNyhbC+Evkkb28s3Rh9O1mngjGD8Gpj+Nxm8Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4OtfV1lAzF/KPwpZ9EUYXHPACRI8sOFjgZgvYVjvIBQ4XD5iX
	3YSI9pMNt4cse+1XGEyZTnyiBQkuotfjLow3mIEbwXLf+8VevmE6kuRchUD0yvXaJD0p2VRyhO4
	=
X-Gm-Gg: ASbGncuCUG88+IptAu8ayjCWe1scPTHJgzOrx9zC4FEVptf+1EDdZ/QSbBiicecFL+M
	/DcTN4yaP1ilJ24QF1W3arwdV4fYe+DHGmv1DTI2yr+117Ejpaxc876aMmcIhp+s3+tVXZBRkXt
	dCRuCNM4HZnzeitDgXrn6tXnt0IKwCHK12SQu+D5Pdz8ZNYXRP1Gu5+hWvyBkasgOivlYgCBHlh
	ht1RVkwLDIvoIyDljU4T4lFVZM3Y3zRR2UfUhBwn/+o4EsK8UQmDGW1B3raULNE0AfShbjISZIz
	m1rcq5V7pwNH
X-Google-Smtp-Source: AGHT+IGEOOYaN+8/l5/2lyK2qCin6Wiy8djEk9lf+HQ4g7eVo/XawEPUMpUzgySSM47kRBouZ3k8Cg==
X-Received: by 2002:a17:903:22cd:b0:215:5437:e9b4 with SMTP id d9443c01a7336-2155437f92cmr153136555ad.54.1733134297392;
        Mon, 02 Dec 2024 02:11:37 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215413d0579sm55819115ad.133.2024.12.02.02.11.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 02:11:35 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so1349749a91.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 02:11:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdUkjNittK/aSr9LMHEEAXKVOmyRGte2SABfeeJT/1JmzarDZg5CtpOHOxZ5qDQRmaoRqrLAlj4TubqA==@vger.kernel.org
X-Received: by 2002:a17:90a:e7cf:b0:2ee:d9f5:cfb4 with SMTP id
 98e67ed59e1d1-2eed9f5dc4emr2028969a91.36.1733134294563; Mon, 02 Dec 2024
 02:11:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com> <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl> <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
 <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
 <20241129220339.GD2652@pendragon.ideasonboard.com> <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com> <CANiDSCuf=YN0=Q+ariHRPUAhacd=s5SFRHsySXWDowaiJxMa3A@mail.gmail.com>
 <20241202083833.GC16635@pendragon.ideasonboard.com>
In-Reply-To: <20241202083833.GC16635@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 11:11:22 +0100
X-Gmail-Original-Message-ID: <CANiDSCuFFrxgDxSAN+aLqSs1v7hLnfhrbsjq8=Qpnk1beHumRw@mail.gmail.com>
Message-ID: <CANiDSCuFFrxgDxSAN+aLqSs1v7hLnfhrbsjq8=Qpnk1beHumRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Dec 2024 at 09:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Dec 02, 2024 at 08:28:48AM +0100, Ricardo Ribalda wrote:
> > On Mon, 2 Dec 2024 at 01:19, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
> > > > On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
> > > > > On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
> > > > > > Before we all go on a well deserved weekend, let me recap what we
> > > > > > know. If I did not get something correctly, let me know.
> > > > > >
> > > > > > 1) Well behaved devices do not allow to set or get an incomplete async
> > > > > > control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
> > > > > > 2) Both Laurent and Ricardo consider that there is a big chance that
> > > > > > some camera modules do not implement this properly. (ref: years of
> > > > > > crying over broken module firmware :) )
> > > > > >
> > > > > > 3) ctrl->handle is designed to point to the fh that originated the
> > > > > > control. So the logic can decide if the originator needs to be
> > > > > > notified or not. (ref: uvc_ctrl_send_event() )
> > > > > > 4) Right now we replace the originator in ctrl->handle for unfinished
> > > > > > async controls.  (ref:
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
> > > > > >
> > > > > > My interpretation is that:
> > > > > > A) We need to change 4). We shall not change the originator of
> > > > > > unfinished ctrl->handle.
> > > > > > B) Well behaved cameras do not need the patch "Do not set an async
> > > > > > control owned by another fh"
> > > > > > C) For badly behaved cameras, it is fine if we slightly break the
> > > > > > v4l2-compliance in corner cases, if we do not break any internal data
> > > > > > structure.
> > > > >
> > > > > The fact that some devices may not implement the documented behaviour
> > > > > correctly may not be a problem. Well-behaved devices will stall, which
> > > > > means we shouldn't query the device while as async update is in
> > > > > progress. Badly-behaved devices, whatever they do when queried, should
> > > > > not cause any issue if we don't query them.
> > > >
> > > > I thought we could detect the stall and return safely. Isn't that the case?
> > >
> > > We could, but if we know the device will stall anyway, is there a reason
> > > not to avoid issuing the request in the first place ?
> >
> > Because there are always going to be devices that do not send the
> > event when the control has finished.
> >
> > It is impossible to know the state of the device: Is the zoom still
> > moving or the device is not compliant?
>
> Another type of broken behaviour would be devices that don't correctly
> handle UVC_GET and UVC_CUR requests while an async update is in
> progress. If you issue those requests, those devices will break. Are
> they more or less important than devices that don't send an event ?
>
> All of those are partly theoretical problems. I'd rather keep it simple
> for now until we get feedback about broken devices.
>
> > > > Why we have not seen issues with this?
> > >
> > > I haven't tested a PTZ device for a very long time, and you would need
> > > to hit a small time window to see the issue.
> >
> > Not that small, some devices take up to 10 seconds to go from the
> > smallest zoom to the biggest zoom.
> > I'd say that v4l2-ctl has a very big chance to hit any error.
> >
> > BTW, homing can take an even longer time.
> >
> > > > > We should not send GET_CUR and SET_CUR requests to the device while an
> > > > > async update is in progress, and use cached values instead. When we
> > > > > receive the async update event, we should clear the cache. This will be
> > > > > the same for both well-behaved and badly-behaved devices, so we can
> > > > > expose the same behaviour towards userspace.
> > > >
> > > > seting ctrl->loaded = 0 when we get an event sounds like a good idea
> > > > and something we can implement right away.
> > > > If I have to resend the set I will add it to the end.
> > > >
> > > > > We possibly also need some kind of timeout mechanism to cope with the
> > > > > async update event not being delivered by the device.
> > > >
> > > > This is the part that worries me the most:
> > > > - timeouts make the code fragile
> > > > - What is a good value for timeout? 1 second, 30, 300? I do not think
> > > > that we can find a value.
> > >
> > > I've been thinking about the implementation of uvc_fh cleanup over the
> > > weekend, and having a timeout would have the nice advantage that we
> > > could reference-count uvc_fh instead of implementing a cleanup that
> > > walks over all controls when closing a file handle. I think it would
> > > make the code simpler, and possibly safer too.
> >
> > The problem with a timeout is:
> > - We do not know what is the right value for the timeout.
> > - We need to have one timeout per control, or implement a timeout
> > dispatcher mechanism, and that is racy by nature
> > - It will require introducing a new locking mechanism to avoid races
> > between the timeout handler and the event completion
>
> Timeouts don't come for free, that's for sure.
>
> > - It introduces a new lifetime in the driver... I'd argue that it is
> > best to have less, not more.
>
> That I disagree with, my experience with V4L2 (as well as with DRM, or
> actually the kernel in general) is that we would be in a much better
> place today if object lifetimes were handled with reference counting
> more widely.
>
> > I do not see many benefits....
>
> The main benefit is simplifying the close() implementation and
> complexity, as well as lowering lock contention (whether the latter
> brings a real advantage in practice, I haven't checked)..
>
> > What we can introduce on top of my set is something like this (just
> > pseudocode, do not scream at me :P)  That code can prevent stalls and
> > will work with misbehaving hardware.... (But I still do not know a
> > good value for timeout) and solve some of the issues that I mention.
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index f0e8a436a306..a55bd4b3ac07 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1132,6 +1132,9 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> >         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> >                 return -EACCES;
> >
> > +       if (ctrl->handle && ( NOW - ctrl->async_start_time ) < TIMEOUT)
> > +               return -EBUSY;
> > +
> >         ret = __uvc_ctrl_load_cur(chain, ctrl);
> >         if (ret < 0)
> >                 return ret;
> > @@ -1591,6 +1594,7 @@ static int uvc_ctrl_get_handle(struct uvc_fh
> > *handle, struct uvc_control *ctrl)
> >                 return -EBUSY;
> >
> >         ctrl->handle = handle;
> > +       ctrl->async_start_time = NOW;
> >         handle->pending_async_ctrls++;
> >         return 0;
> >  }
> > @@ -1982,6 +1986,9 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >                 return -EACCES;
> >
> > +       if (ctrl->handle && ( NOW - ctrl->async_start_time ) < TIMEOUT)
> > +               return -EBUSY;
>
> If I understand you correctly, this is meant to prevent accessing the
> device for an initial TIMEOUT period, based on the knowledge it will
> very likely STALL. After the TIMEOUT, if the async set is still not
> complete, SET_CUR will be issued, and a STALL will likely occur.
>
> If we device to standardize on -EBUSY while the async set is in
> progress, we need to do so before and after the timeout.
> uvc_query_ctrl() will return -EBUSY in case of a STALL if the device
> reports the "Not ready" error. This is what I expect a device to report
> in this case. Of course the UVC specification, in section 2.4.4,
> documents that the device will update the request error code control,
> but doesn't tell which value should be used :-S I suppose we'll handle
> broken devices if the need arise.
>
> > +
> >         /* Clamp out of range values. */
> >         switch (mapping->v4l2_type) {
> >         case V4L2_CTRL_TYPE_INTEGER:
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index e0e4f099a210..5c82fae94dff 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -154,6 +154,8 @@ struct uvc_control {
> >                                  * File handle that initially changed the
> >                                  * async control.
> >                                  */
> > +
> > +       TIME async_start_time;
> >  };
> >
> >
> > In any case. Can we solve this in incremental steps? I think the
> > current patch seems simple and correct. We can introduce the timeout
> > later.
>
> The main reason for a timeout was to replace walking over all controls
> at close() time with reference counting of uvc_fh, which is an
> alternative approach to the current patch. Given that picking a good
> timeout value is difficult, and that the current implementation already
> skips the walk in the most common case when no async set is pending, I
> suppose we could start with that.

Cool. I am going to send a new version of:
https://patchwork.linuxtv.org/project/linux-media/patch/20241129-uvc-fix-async-v4-1-f23784dba80f@chromium.org/

using  uvc_ctrl_get_handle / uvc_ctrl_put_handle ad lockdep annotations.

Hopefully in the future we can get rid of: uvc_ctrl_cleanup_fh()


Thanks!
>
> > > > > Regarding the userspace behaviour during an auto-update, we have
> > > > > multiple options:
> > > > >
> > > > > For control get,
> > > > >
> > > > > - We can return -EBUSY
> > > > > - We can return the old value from the cache
> > > > > - We can return the new value fromt he cache
> > > > >
> > > > > Returning -EBUSY would be simpler to implement.
> > > >
> > > > Not only easy, I think it is the most correct,
> > > >
> > > > > I don't think the behaviour should depend on whether the control is read
> > > > > on the file handle that initiated the async operation or on a different
> > > > > file handle.
> > > > >
> > > > > For control set, I don't think we can do much else than returning
> > > > > -EBUSY, regardless of which file handle the control is set on.
> > > >
> > > > ACK.
> > > >
> > > > > > I will send a new version with my interpretation.
> > > > > >
> > > > > > Thanks for a great discussion
> > > >
> > > > Looking with some perspective... I believe that we should look into
> > > > the "userspace behaviour for auto controls" in a different patchset.
> > > > It is slightly unrelated to this discussion.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

