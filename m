Return-Path: <linux-media+bounces-29876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E87A83B66
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07E53B9CB9
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 07:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2B91E32C3;
	Thu, 10 Apr 2025 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fzT9jRLI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE43D81
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270381; cv=none; b=dgjOmVtUQkdDo+R0QfLQywQuB0tzCcdmy6/di0hWifX5c8Mm/+yqvMNX4CDHUD60GzPSh4m0B0PTuVgc7/tSTFPcFrywHsg2OHCZxuu2cFJEdXIs5uQaKt7tUrTPtT+nYaHbI4DG/ro2h4KHuST8w7zF44LbtE9qAVt9ALl/WKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270381; c=relaxed/simple;
	bh=6CjFseeH2DarFToT5eJ7QI5asPuFMviEs7rTvbKUuFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mch0trGLOfwel3bsdAmskJbT20zTjicaIfLxQU9hM1A5ucwoZi/Haz521IKikEQlOCTT6s+wN62RX1U3QQXQ3ds8feaXZQG8w4+1jn9IHD0JdsjEzu1cs/lDJdlGK1oADzrs/YWrmpHVv8F4fh8A+KC+bWOL7c9X+lzgSJW20Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fzT9jRLI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b0d638e86so619255e87.1
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 00:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744270377; x=1744875177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+yLHh5FmkVmkTnsYgK3B+fH8RdAQOGeRdPfvltmYXY=;
        b=fzT9jRLIYfVWDMQ/IQobECWU92O0YjZpEDqRrdjtVcww9V9W/rMFMiof7J+Ixo++Uq
         PtPBVlnDPl7knag8Cc9zMD/tkosjTSTXddXxJVOF+r/2O/sFmv2NicgYPBMj5ivRq24S
         QUVIAEIp9Wz0au0Bd7mKR+vlKMsjy+djd8LYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270377; x=1744875177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+yLHh5FmkVmkTnsYgK3B+fH8RdAQOGeRdPfvltmYXY=;
        b=QXqVpmNOJY2Fx5mkkXAoggKuJw8K1/6OlcaqEsS5Bio2TYxoAZs0GW3Y9eQiUCs9PK
         cV0vPoBObQFQBXB7eVXE31RzEBFLpEYrXnK7GfzzpiihgOUkhWfPi9+MKyy4cjPfgTBS
         kh5Duz+P9nbcIC5P3GvnsijUooa4pG7b0XxT15MUuJWTKGY49ZhN8C93Bwzy8WztDaZn
         Xu66VrmynKbsFu+ErR8RbclS6iPfDrBXe2h2oeDDOOs1YyGDK83/YIOSATIJaziPYtDQ
         03YM2qX8VLKTLhJffMlFfHvReJeR2WZUqnxWDcpyoj0Mu4Ty3HQRV3Ag/+QI841oSCLu
         iMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJqk0necikNqyAL3dr6f+NNIY9ZHiKm+36xD1XBlZHHj6FlmQSRaRPE2vUUTSHvWcqBLtb80C/R01F9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZZ4jNvdScuZNfROhsd7cYntLg3/3v7JvByCVPtuttItHyuxB
	ljir/cPSxHXUzDpAeE1aTfDJ7SBRcUH7pDomT2Fj4kAnk3LlGZ72sVP+A67WmxboA3g40f/OgUy
	8GA==
X-Gm-Gg: ASbGncvnueIJ/BrNLp0RbTEzYn5i+l4jOhtLBc4vUG11pdvODFoBHYX1KzBQ3dHNn5w
	1S1U6/H6sZuxjIbW/hvmKO5UV8aKBFnq3hJluJwUl/IElpG8iCCLY5sz6V9C4dBXYJuKIYmbIWV
	02ixhkSA/cm8lxVpWri5qeg3KoNXmM+eOp3RZspOipTMaj/z3BD28R0I4NVC8pvIT7HIWAbWViI
	mRW4vBeOhCJukyBC4VuFCoBUK2xmzsIWjmKCtjBdastQmuurH/LlJKRYtB42AojzyUiSZXm9Tp7
	Ubu0pzOwkDsrkNLT5Pftl+skYLqgr7n3Dk/5B4CELciDA1h6snfJbyPFMMPlBImvw/cYTNpy62A
	gqdk=
X-Google-Smtp-Source: AGHT+IGKBmyde0WI+aH1oQZO32u0BURvmSHL0MiAui5Ms0NlJenb7QcL6dEa9qzWKLuy9+jT8saoWw==
X-Received: by 2002:a05:6512:1149:b0:545:2d80:a47d with SMTP id 2adb3069b0e04-54cb6878b31mr438928e87.44.1744270377421;
        Thu, 10 Apr 2025 00:32:57 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d23880dsm66470e87.79.2025.04.10.00.32.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:32:55 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b0d638e86so619203e87.1
        for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 00:32:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+WGl57y2uM34d4l8iT+02Oo6QiXLz6Mj5+Q91CDLqomkupkSTBQGuCCBTZKAVWkSzjb66WZkIWC9gTw==@vger.kernel.org
X-Received: by 2002:a05:6512:3ba6:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54caf58e5cbmr541322e87.12.1744270375283; Thu, 10 Apr 2025
 00:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org> <c80da442-c35a-4336-9a49-5a6745e4ce6b@redhat.com>
In-Reply-To: <c80da442-c35a-4336-9a49-5a6745e4ce6b@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 10 Apr 2025 09:32:42 +0200
X-Gmail-Original-Message-ID: <CANiDSCsy1TfBCGu4A+pChTE2gzBugCAxZTS_DFNPF83dbTM3QQ@mail.gmail.com>
X-Gm-Features: ATxdqUGjNFk5xKcNAMICFXzYK_FMDHuXKGmeiIWMpujtWvH8WQQw-zaL_0j7pm0
Message-ID: <CANiDSCsy1TfBCGu4A+pChTE2gzBugCAxZTS_DFNPF83dbTM3QQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Rollback non processed entities
 on error
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 15:02, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> > If we wail to commit an entity, we need to restore the
>
> s/wail/fail/
>
> I've fixed this up while merging this series and
> I've pushed the entire series to:
> https://gitlab.freedesktop.org/linux-media/users/uvc/ next now.
>
> Note I had to manually fix some conflicts due to the granular power
> saving series being merged first. I'm pretty sure I got things correct
> but a double check would be appreciated.

I reviewed the merge and I could not find any issue.
Thanks :)

>
> Regards,
>
> Hans
>
>
>
>
> > UVC_CTRL_DATA_BACKUP for the other uncommitted entities. Otherwise the
> > control cache and the device would be out of sync.
> >
> > Cc: stable@kernel.org
> > Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Closes: https://lore.kernel.org/linux-media/fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com/
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++----------
> >  1 file changed, 22 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 7d074686eef4..89b946151b16 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1864,7 +1864,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >       unsigned int processed_ctrls = 0;
> >       struct uvc_control *ctrl;
> >       unsigned int i;
> > -     int ret;
> > +     int ret = 0;
> >
> >       if (entity == NULL)
> >               return 0;
> > @@ -1893,8 +1893,6 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >                               dev->intfnum, ctrl->info.selector,
> >                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> >                               ctrl->info.size);
> > -             else
> > -                     ret = 0;
> >
> >               if (!ret)
> >                       processed_ctrls++;
> > @@ -1906,10 +1904,14 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >
> >               ctrl->dirty = 0;
> >
> > -             if (ret < 0) {
> > +             if (ret < 0 && !rollback) {
> >                       if (err_ctrl)
> >                               *err_ctrl = ctrl;
> > -                     return ret;
> > +                     /*
> > +                      * If we fail to set a control, we need to rollback
> > +                      * the next ones.
> > +                      */
> > +                     rollback = 1;
> >               }
> >
> >               if (!rollback && handle &&
> > @@ -1917,6 +1919,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >                       uvc_ctrl_set_handle(handle, ctrl, handle);
> >       }
> >
> > +     if (ret)
> > +             return ret;
> > +
> >       return processed_ctrls;
> >  }
> >
> > @@ -1947,7 +1952,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >       struct uvc_video_chain *chain = handle->chain;
> >       struct uvc_control *err_ctrl;
> >       struct uvc_entity *entity;
> > -     int ret = 0;
> > +     int ret_out = 0;
> > +     int ret;
> >
> >       /* Find the control. */
> >       list_for_each_entry(entity, &chain->entities, chain) {
> > @@ -1958,17 +1964,23 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >                               ctrls->error_idx =
> >                                       uvc_ctrl_find_ctrl_idx(entity, ctrls,
> >                                                              err_ctrl);
> > -                     goto done;
> > +                     /*
> > +                      * When we fail to commit an entity, we need to
> > +                      * restore the UVC_CTRL_DATA_BACKUP for all the
> > +                      * controls in the other entities, otherwise our cache
> > +                      * and the hardware will be out of sync.
> > +                      */
> > +                     rollback = 1;
> > +
> > +                     ret_out = ret;
> >               } else if (ret > 0 && !rollback) {
> >                       uvc_ctrl_send_events(handle, entity,
> >                                            ctrls->controls, ctrls->count);
> >               }
> >       }
> >
> > -     ret = 0;
> > -done:
> >       mutex_unlock(&chain->ctrl_mutex);
> > -     return ret;
> > +     return ret_out;
> >  }
> >
> >  int uvc_ctrl_get(struct uvc_video_chain *chain,
> >
>


-- 
Ricardo Ribalda

