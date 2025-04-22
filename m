Return-Path: <linux-media+bounces-30749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866DBA9786B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B383B0FB4
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10698262FEC;
	Tue, 22 Apr 2025 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OHiHfkOH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7FA262FDA;
	Tue, 22 Apr 2025 21:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356818; cv=none; b=LZnzGW58WrU4fEEXx4KeioZhmpTqhyLcnWpQgbJYP+mUO1Ua2gVWNgKS38qZSUNRLhd/3CgjHva0bQ0hNK7VCKCjO9w2vh1temMk9WhlSgIeY+Cl5vuGv9ch5HQTx67EqBQD11CcPNygQqC8gCpJqP85Vyg9x9BdI2T1Dz+n5jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356818; c=relaxed/simple;
	bh=QUx5dRFG7GpCS+cETcj2dmDnUuhNhvwVSRhpl9TOGUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FReWFKVzRpGnDgWLR+A2AievTZdPsLlkVxSpmIeQT4oCaMBnVN1IHx8wWA3DTdNsJiPSXW8p9stJZNMnqC3aq0CaL06Or5lHrwqZz4iOXchZjP2MVEvOHv88gRbIEBssEttpP7FfzQAI1fT7DfHx9Fg+vg0Dar5ORV7aOgj1cNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OHiHfkOH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7ED2AC;
	Tue, 22 Apr 2025 23:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745356813;
	bh=QUx5dRFG7GpCS+cETcj2dmDnUuhNhvwVSRhpl9TOGUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHiHfkOHZh5uSWDcXdGsStftlZr2cPlX8CJcpZTz2X+d6FgYzcruYL+t0/klHHGHB
	 X1Dj2kKnAPGWJj5nShRxtsRs6YmimCw19D84qryh5RTNU7Fd1j0xk0rDU/VwtB9YRk
	 XwPirfNC4Fjo7GPWQTeNQDsDeq1cUwk1tWF2UQls=
Date: Wed, 23 Apr 2025 00:20:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Rollback non processed entities
 on error
Message-ID: <20250422212011.GP17813@pendragon.ideasonboard.com>
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
 <c80da442-c35a-4336-9a49-5a6745e4ce6b@redhat.com>
 <CANiDSCsy1TfBCGu4A+pChTE2gzBugCAxZTS_DFNPF83dbTM3QQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsy1TfBCGu4A+pChTE2gzBugCAxZTS_DFNPF83dbTM3QQ@mail.gmail.com>

On Thu, Apr 10, 2025 at 09:32:42AM +0200, Ricardo Ribalda wrote:
> On Mon, 7 Apr 2025 at 15:02, Hans de Goede wrote:
> > On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> > > If we wail to commit an entity, we need to restore the
> >
> > s/wail/fail/
> >
> > I've fixed this up while merging this series and
> > I've pushed the entire series to:
> > https://gitlab.freedesktop.org/linux-media/users/uvc/ next now.
> >
> > Note I had to manually fix some conflicts due to the granular power
> > saving series being merged first. I'm pretty sure I got things correct
> > but a double check would be appreciated.
> 
> I reviewed the merge and I could not find any issue.
> Thanks :)

There's a set of small issues that may (or may not, pending discussions)
need to be addressed in each of the three series present in uvc/next.
Most review comments are small and don't require sending a new version,
while others may require respining some of the patches. Let's first
discuss the issues, and we can then check how to minimize the need to
send new versions.

I'll review other pendings series after finalizing these three, as
conflicts are complex enough to handle as-is. In the future, when you
send multiple series that depend on each other, please indicate in what
order they should be merged.

> > > UVC_CTRL_DATA_BACKUP for the other uncommitted entities. Otherwise the
> > > control cache and the device would be out of sync.
> > >
> > > Cc: stable@kernel.org
> > > Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> > > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > > Closes: https://lore.kernel.org/linux-media/fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com/
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++----------
> > >  1 file changed, 22 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 7d074686eef4..89b946151b16 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -1864,7 +1864,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> > >       unsigned int processed_ctrls = 0;
> > >       struct uvc_control *ctrl;
> > >       unsigned int i;
> > > -     int ret;
> > > +     int ret = 0;
> > >
> > >       if (entity == NULL)
> > >               return 0;
> > > @@ -1893,8 +1893,6 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> > >                               dev->intfnum, ctrl->info.selector,
> > >                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > >                               ctrl->info.size);
> > > -             else
> > > -                     ret = 0;
> > >
> > >               if (!ret)
> > >                       processed_ctrls++;
> > > @@ -1906,10 +1904,14 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> > >
> > >               ctrl->dirty = 0;
> > >
> > > -             if (ret < 0) {
> > > +             if (ret < 0 && !rollback) {
> > >                       if (err_ctrl)
> > >                               *err_ctrl = ctrl;
> > > -                     return ret;
> > > +                     /*
> > > +                      * If we fail to set a control, we need to rollback
> > > +                      * the next ones.
> > > +                      */
> > > +                     rollback = 1;
> > >               }
> > >
> > >               if (!rollback && handle &&
> > > @@ -1917,6 +1919,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> > >                       uvc_ctrl_set_handle(handle, ctrl, handle);
> > >       }
> > >
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       return processed_ctrls;
> > >  }
> > >
> > > @@ -1947,7 +1952,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> > >       struct uvc_video_chain *chain = handle->chain;
> > >       struct uvc_control *err_ctrl;
> > >       struct uvc_entity *entity;
> > > -     int ret = 0;
> > > +     int ret_out = 0;
> > > +     int ret;
> > >
> > >       /* Find the control. */
> > >       list_for_each_entry(entity, &chain->entities, chain) {
> > > @@ -1958,17 +1964,23 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> > >                               ctrls->error_idx =
> > >                                       uvc_ctrl_find_ctrl_idx(entity, ctrls,
> > >                                                              err_ctrl);
> > > -                     goto done;
> > > +                     /*
> > > +                      * When we fail to commit an entity, we need to
> > > +                      * restore the UVC_CTRL_DATA_BACKUP for all the
> > > +                      * controls in the other entities, otherwise our cache
> > > +                      * and the hardware will be out of sync.
> > > +                      */
> > > +                     rollback = 1;
> > > +
> > > +                     ret_out = ret;
> > >               } else if (ret > 0 && !rollback) {
> > >                       uvc_ctrl_send_events(handle, entity,
> > >                                            ctrls->controls, ctrls->count);
> > >               }
> > >       }
> > >
> > > -     ret = 0;
> > > -done:
> > >       mutex_unlock(&chain->ctrl_mutex);
> > > -     return ret;
> > > +     return ret_out;
> > >  }
> > >
> > >  int uvc_ctrl_get(struct uvc_video_chain *chain,

-- 
Regards,

Laurent Pinchart

