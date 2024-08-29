Return-Path: <linux-media+bounces-17094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF23963CD7
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF444B23CC0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9E917333D;
	Thu, 29 Aug 2024 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOc8zDJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC5715DBC1;
	Thu, 29 Aug 2024 07:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916480; cv=none; b=VNED2wl0yT/ufzJHNDCAGGT68UT+reeUcypvk9eS6fgFnm7KxADNNSSjiZfoS7vdJaXpipl+Q6VWwhD3ePty6SXSkVfUwtfxyYlegxXjJQ5PorO0bBgI5NdrPFRiqVjyBZawXBFI/CbzNED7gZVGchzte/Ty79h3kKnIozoOeoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916480; c=relaxed/simple;
	bh=joWCvkxZ3auopsvm3Eu4KjvSI6vm+wRLZxew9+GtHYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNW3n5GVJsgvHFN6qoCvXhsp31LooGc5MkASCRNR6UfNegbUuwh2746AR1gAbUKKE3DN+RvmQKA7vmxt/pI/jwPO/kgEfKCoMvZbL/ZIojDNY2MOVHL9oma5xA4i8Uu3P68mW2EiPhVi6s+ntsiqDRTDPmNJLSIR5Q3C0hZwl+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOc8zDJ9; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4fead6effe9so131229e0c.2;
        Thu, 29 Aug 2024 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724916478; x=1725521278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKM3gZ9ROdj98aY4JHlpNqjUP3F93IoGq/pntthm/+0=;
        b=mOc8zDJ95EWFNZQgTu0YP9vOHM9Na54rWpWCSjyX9I7SeXsMBkmBEYazX4YibS71db
         voXiu6i5kVVNCEd8ISHoQ3P4/qXvCH8VjLYWIG2fSK8+ydQsObqTZsfcCAP2qq4qmiGd
         tkQBpm5hva1uW1iCFSgXfEUcfmIR4jJ+QdAqvhA4iE2jQEfBP3vKLSz484VwlOwXccfX
         Yy9cLzGq01Ft32K4A84qWZWj/gJZJ2FHKJNuSbJKiu3G2a93ogvN0qf6wVa0dV+LOcsu
         h+BlQEvBBGcc0wIy7sr5Blp85xrozLGltWzmfRu6jfNCvXhR2e8znIxVUnokc9+n3YLf
         yOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724916478; x=1725521278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKM3gZ9ROdj98aY4JHlpNqjUP3F93IoGq/pntthm/+0=;
        b=Z6qWhZraDyGfibRBAijrs3jepHnM5y0LTvYq+DcDio3oF/pHv9mt/mkTL/V7UR33sZ
         yi3GVm+p8vVe1KBhyEza0ICbWsX7873+cXWBEM0t6ZO2A/zfU4uj6wWQW2W23C8vuvrS
         OrLVi9zA4gUgl+k7ftlXAj1oasQ305UcD8DCHB6zcZOs0arDh7d3ugvwmk7Ay3h6pA0g
         F1y+NMFDdQARNzpgjfUnQdWhu2JTtaes1ZjWx5ocAWx+Po2tDJ9wUacys5Lmg8tRtGpL
         aSCCNeeRRe5XDJiU9Wm6LjNqGIlzkJhD062E2OM8tsh6ejbX3XbhmPDVi3W6sW847yoV
         Ecpw==
X-Forwarded-Encrypted: i=1; AJvYcCUYP+jjiUMyYWDjXn4Lr8WtNCmlpPz5qwpBJE5a9KhdGWbYBqPR+nnGYwaZUNTR9iJgV+nd00I598X5S7Q=@vger.kernel.org, AJvYcCV3KSpsOdtysHocXBBREbIkJPFCzuwl9xgtBwZvsqJe+xBwADYS59ZfbN3zxKdiRCR90DRmbuX+iXPr8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YySdv3EPvdNDvR2gR2kwvdBQFBnCvl74j3pHlXvD9KVC9ejhnO6
	VwCw3FAcqxJZLzlLGD1pMPjBDG5LaaeMe3raZuWDu9pecI/ZFpYRPubF+X5sQ7bjRBhMNZ5T3Tc
	vmHW1Wj31UUJTE+Vzy3astDO86vjpX/1E/x4=
X-Google-Smtp-Source: AGHT+IGccSUUU7J7j1AwiF1myvo/6aKPFZElQ+PzbCYfDRXgtCGsf7OvPP9ZB5Pwih1rcFyP8Aq2c+xYT6OfRF/w3gg=
X-Received: by 2002:a05:6122:d09:b0:4f5:1a43:de48 with SMTP id
 71dfb90a1353d-4fff18f7073mr2054945e0c.14.1724916478047; Thu, 29 Aug 2024
 00:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <f88991fc4c197ef0e32f05b2f509980183aef012.1723190258.git.hverkuil-cisco@xs4all.nl>
 <20240828123825.vnp4gqvyy7ohrhgw@basti-XPS-13-9310>
In-Reply-To: <20240828123825.vnp4gqvyy7ohrhgw@basti-XPS-13-9310>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 29 Aug 2024 09:27:41 +0200
Message-ID: <CAPybu_3_dX9SuNNBoVbatHvivhnr=0-vFbPz+BdjHkYMNwMMJg@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: v4l2-dev: handle V4L2_CAP_EDID
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-input@vger.kernel.org, Erling Ljunggren <hljunggr@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:38=E2=80=AFPM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Hello,
>
> On 09.08.2024 09:57, Hans Verkuil wrote:
> >From: Erling Ljunggren <hljunggr@cisco.com>
> >
> >When the V4L2_CAP_EDID capability flag is set,
> >ioctls for enum inputs/outputs and get/set edid are automatically set.
> >
> >Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> >Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Regards,
> Sebastian
> >---
> > drivers/media/v4l2-core/v4l2-dev.c | 15 +++++++++++++++
> > 1 file changed, 15 insertions(+)
> >
> >diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-cor=
e/v4l2-dev.c
> >index be2ba7ca5de2..570ba00e00b3 100644
> >--- a/drivers/media/v4l2-core/v4l2-dev.c
> >+++ b/drivers/media/v4l2-core/v4l2-dev.c
> >@@ -557,6 +557,7 @@ static void determine_valid_ioctls(struct video_devi=
ce *vdev)
> >       bool is_tx =3D vdev->vfl_dir !=3D VFL_DIR_RX;
> >       bool is_io_mc =3D vdev->device_caps & V4L2_CAP_IO_MC;
> >       bool has_streaming =3D vdev->device_caps & V4L2_CAP_STREAMING;
> >+      bool is_edid =3D  vdev->device_caps & V4L2_CAP_EDID;
> >
> >       bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
> >
> >@@ -784,6 +785,20 @@ static void determine_valid_ioctls(struct video_dev=
ice *vdev)
> >               SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
> >               SET_VALID_IOCTL(ops, VIDIOC_S_HW_FREQ_SEEK, vidioc_s_hw_f=
req_seek);
> >       }
> >+      if (is_edid) {
> >+              SET_VALID_IOCTL(ops, VIDIOC_G_EDID, vidioc_g_edid);
> >+              if (is_tx) {
> >+                      SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_ou=
tput);
> >+                      SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_ou=
tput);
> >+                      SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_en=
um_output);
> >+              }
> >+              if (is_rx) {
> >+                      SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enu=
m_input);
> >+                      SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_inp=
ut);
> >+                      SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_inp=
ut);
> >+                      SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid=
);
> >+              }
> >+      }
> >
> >       bitmap_andnot(vdev->valid_ioctls, valid_ioctls, vdev->valid_ioctl=
s,
> >                       BASE_VIDIOC_PRIVATE);
> >--
> >2.43.0
> >
> >
>


--=20
Ricardo Ribalda

