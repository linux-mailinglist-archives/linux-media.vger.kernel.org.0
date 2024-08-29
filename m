Return-Path: <linux-media+bounces-17093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 910ED963CC3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3C881C208F8
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9F0186E21;
	Thu, 29 Aug 2024 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUb2x5Pg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A531741D5;
	Thu, 29 Aug 2024 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724916362; cv=none; b=tKScy8Fo+P0t7UJo+Zway7NwG1CI8hhy23ZeuxkYaeYgO0KxRr0BEV3ww9PEOZj3XAU9NNmFwTGkaMKiGyx8OuGKD/q9YJ2vWMmqHT5XDjx7xqn+hqYoKibL+8EyOGr5eSchEP/uvb8R5hdYUUAQOlpO1k99q4S/3rMgFUgbXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724916362; c=relaxed/simple;
	bh=7k6bU+JmoKUqy6RRJyf1DT8wbe5mou33C8K6Zwo3ANc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZx729oe9ValOPC5pWBtCmS7Sn4sIRAVwN0izJPm9xGDt5/fjMM0PIH0ldil0xslCp/GM8aBqmqGFIuZgB8a//W9dXW1+fqhPbIfEPzLKbMIDKS1eMrk7XastvbPtNaC9YNnvyhU+Vzieo4kXeWbHroImNWVGVVLHfmXp2t1bhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUb2x5Pg; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-498f08339c6so154025137.2;
        Thu, 29 Aug 2024 00:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724916359; x=1725521159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC0bD2p/acD0u+cas37HVlFefS9txRQ5BwvW279eo8E=;
        b=bUb2x5Pg+KEw7BAbvZ4LGxGMNGO8dFzyHKTSRR/pc5tXRvd57oa1/wwf7TX/CeRT/W
         m0QDi7EEBcVWttyC/Kab93NBfRV+iCZewbELTp/otZhR4VVVJk+vIxDDQbvbWvyQUz8l
         I6eINw7PG63YPqmL9QMompxZlINjbRY2J77UtbiLKQPM5XJ1gzgvioA0DRImJfE6V/d2
         fvr0M5kjuWLevq997efPVyyaGaM319Ne2K5BXgtuj/csmNwSsBLTl5w6Gvp+pLuqJTDk
         NYeWYqJrZgsUUufQo/uHTyi/M4eINK0CRG4VxG9ljqFPU4/Ql1DItBAmO3HNPiGVeqF+
         8kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724916359; x=1725521159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC0bD2p/acD0u+cas37HVlFefS9txRQ5BwvW279eo8E=;
        b=K+yxlCzzB/T9CJb7ZxmpgwM+ccXPp7Cu5VZYhY7JO/IzuDetvQqe4XNaa0EkYcOqA5
         GNQL+JV2oqVMTITfCQ0BqTiCrD92Cq2ojLFF+4fZ13/VeYTg0DCluvrDvnIan7a3LUUS
         DxSkRFizqLCLDWwmFZAHwjxhUeP+Dmwf2X466fy8sGF2f9QPn/Ce/B0hNzJr9RLDtqjP
         o00OztPs6pPeP5+suXgde9L1fq9M6Kxz8tGoI6Y60vrgXVv8OX+kl8SPEHqY36vxOFiB
         zlVd/4zc80xbllVnncs8+3brzmRrovNCLLdZjlWK3a4UL7Sg2YnkKvmlfSlX7YMYGhjs
         vX7w==
X-Forwarded-Encrypted: i=1; AJvYcCWbxqGQ0Cbq/DDm6Wquvd82DAgrVgpsDg6d2qAXVGTOM/ssWgYMTchHBZ/Zf+0luLYJf19V0rpAjAX7nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGORMrf905y03ZkIEcrGMe2tsTHb9utVmEAK+YA8cR5dEQAA27
	wDmX/ASiAL1fysjto6cDCb0RYwjw1JVBC7QmA8QqO6/DqAT4e0DVtVBRHHYi5sedv/xmGaHLQcO
	74qNeNx/S0xUSIy2owTOlnRBO1FY=
X-Google-Smtp-Source: AGHT+IEsl1OCz3QZe7vLXevmkJrWzSANS7fAytAKWsty9XQ96ut2/HxfdhWRf0ZZY6asdT1rOHVHuKP8M0aj502P/Hs=
X-Received: by 2002:a05:6102:c93:b0:497:6b92:d925 with SMTP id
 ada2fe7eead31-49a5af83a3dmr1719292137.30.1724916359260; Thu, 29 Aug 2024
 00:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <485324508040defc0ba0fb211a6596dc65f2d994.1723190258.git.hverkuil-cisco@xs4all.nl>
 <CAPybu_2UFq6Rnyi+wPEGtXYLW5gF9a6yKiOBZwN95XymAxkxjQ@mail.gmail.com> <d78f8808-2583-4a73-952a-8dfdcdf9b6e0@xs4all.nl>
In-Reply-To: <d78f8808-2583-4a73-952a-8dfdcdf9b6e0@xs4all.nl>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 29 Aug 2024 09:25:42 +0200
Message-ID: <CAPybu_1DG9be7fKBiLYtrPfYayeFYmw2nAeoRb7rjA+oHduuHg@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: videodev2.h: add V4L2_CAP_EDID
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-input@vger.kernel.org, 
	Erling Ljunggren <hljunggr@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 9:11=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 28/08/2024 14:51, Ricardo Ribalda Delgado wrote:
> > Hi Hans
> >
> > On Fri, Aug 9, 2024 at 10:14=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs=
4all.nl> wrote:
> >>
> >> From: Erling Ljunggren <hljunggr@cisco.com>
> >>
> >> Add capability flag to indicate that the device is an EDID-only device=
.
> >>
> >> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  include/uapi/linux/videodev2.h | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/video=
dev2.h
> >> index 4e91362da6da..987c821aed79 100644
> >> --- a/include/uapi/linux/videodev2.h
> >> +++ b/include/uapi/linux/videodev2.h
> >> @@ -502,6 +502,7 @@ struct v4l2_capability {
> >>  #define V4L2_CAP_META_CAPTURE          0x00800000  /* Is a metadata c=
apture device */
> >>
> >>  #define V4L2_CAP_READWRITE              0x01000000  /* read/write sys=
temcalls */
> >> +#define V4L2_CAP_EDID                  0x02000000  /* Is an EDID-only=
 device */
> >
> > Would it make sense to add a check for "EDID-only", I mean, if the
> > driver sets this cap, then it should not set V4L2_CAP_STREAMING or othe=
rs.
> >
> > The test could be in the core or even in v4l2-compliance.
>
> Good point. It is easy to add this to v4l2-compliance.
>
> I noticed that the v4l2 core doesn't check for invalid caps combinations.=
 It is
> left to v4l2-compliance to check that. So I think I'll keep the check the=
re.

cool! Thanks

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>


>
> Regards,
>
>         Hans
>
> >
> > Regards!
> >
> >
> >>  #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O =
ioctls */
> >>  #define V4L2_CAP_META_OUTPUT           0x08000000  /* Is a metadata o=
utput device */
> >>
> >> --
> >> 2.43.0
> >>
> >>
> >
> >
> > --
> > Ricardo Ribalda
> >
>


--=20
Ricardo Ribalda

