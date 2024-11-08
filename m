Return-Path: <linux-media+bounces-21189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A939C24B1
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 19:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 220AEB2207F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10FE233D8C;
	Fri,  8 Nov 2024 18:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rzx6G/Gl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8810233D6B
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731089631; cv=none; b=lXwNqoRaivxDYtSNq5P/rBjqui+xIowJbB6y/sN+uFCd018OwlGOdiFeTCridb/1ZqWCrkp39MtKh8LI0T4EPQsTJYO8mPMQRzF3d2V656jMFMpoP4oXJBzcwcys7uwkjh9vg36VNqnoMmD9giAGfY9nFGPLPLlpABgzjrXFssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731089631; c=relaxed/simple;
	bh=MnwY2McGCs3rQ1/Yi9ngsRCkV2r7H0egKBqpCm23tIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3uZdq75H3WsayOYazLgYtAVkgV3ttbOk3jZ5MKE8cGOn5s3JutmPCqUvMrCjSRme6bF4fQyd+edOT2aX3Iy/9uMsOXrKHI4AoEB9+Z1W3Ft7bKYkuoLx2p8HhV6N1BTg5fBnRcpJavRWaCWGkSoLX4TfSVUu8OlqSBiCr3uOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rzx6G/Gl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21116b187c4so21797155ad.3
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 10:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731089629; x=1731694429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/S9pEE/bHFNtA6CFpqq+tXjydsCBsA355wpP82Bbeo=;
        b=Rzx6G/Gl9gXjMubLUJ61rLp6TOj2vm6UW8nJrKnGNrOJk6kHn3XI5S1xcmrCKksTK9
         yGubWjUoZy5Uvta07ClS9O6IzaJOoeWyP9nUm7RF14w1DZceNDZ4eRbchvqPw+9GF71j
         N3zC/naihEA4xr2edKA4yobHiKlPCZ4qOfN5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731089629; x=1731694429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/S9pEE/bHFNtA6CFpqq+tXjydsCBsA355wpP82Bbeo=;
        b=Dp5qjqTOvdT2eC6YmkhHjSHvHL+B8ALDTsFMkBxfao3qyEBeHj3Fo3HSL4k8opFUkG
         nleTXUITMRt/Zr2u83Dv5qYh4ueaDZjFO0A/cCIF40hy6IXYmG/8MiClMizKVQTgM5W6
         zfDQSDMj+bnKDSidgJiTuO64qTjd9l5sb5VAAyO1VgUWGngLe6ZwazTQuU+k16Jgz8Oe
         nNqjqXlEjSACvE6kImEq7eysC2Xrsrn5XWiZmOSl1IJT7o/H3nnj46MnyHUAYym9aht/
         VjR76nQzAKc6+zQJSiWnFdgjgA1vPkLTmL8f2Y5V35z7lw9oQpyMqe9sgubz9iprE6zC
         VuLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2EUZM2chlpH9ER0D2cb2/pYA4qDWY7KAnTmk52iv/PoS/QJrJMVWrWYcO/huF4ksVFjK/KOJqzD0EhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYO4Er55HnV9hX4JeQs0LpRd7e3+VeRTvYcSYLcD5DnwQMIEST
	n/FkxsRc+677hsdCXW6U6jyWz+lXoUn+98ws5BdKmu0hNGqK9BzSWSucoAeEHhwuvFU6mwYLIyI
	=
X-Google-Smtp-Source: AGHT+IH7Uy58J6wacYArvnFu2qRmyklIFeuDh63xO/WFudR+rHVhNu67fmeYhdgfcXNcVcuKP0grag==
X-Received: by 2002:a17:902:e743:b0:210:e75e:4649 with SMTP id d9443c01a7336-21183d33ca0mr47168995ad.17.1731089628717;
        Fri, 08 Nov 2024 10:13:48 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc8c35sm33648025ad.56.2024.11.08.10.13.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 10:13:48 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso2065839a91.3
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 10:13:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOQp3+f1vgcXNvGvF4KWCc4MzCkIMpsxS2uooiOIeuAOGzl+Nurj0rX4eA3664PAS+titXnRulyqpdKw==@vger.kernel.org
X-Received: by 2002:a17:90b:3847:b0:2e2:d17e:1ef7 with SMTP id
 98e67ed59e1d1-2e9b16e265emr4804777a91.3.1731089627269; Fri, 08 Nov 2024
 10:13:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108142310.19794-1-isaac.scott@ideasonboard.com>
 <20241108142310.19794-2-isaac.scott@ideasonboard.com> <20241108154236.GA8784@pendragon.ideasonboard.com>
In-Reply-To: <20241108154236.GA8784@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 8 Nov 2024 19:13:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCui+VW8TRHQFj7oDBsUuJ_yYPVpDWKzvgvKNw8PShTkBg@mail.gmail.com>
Message-ID: <CANiDSCui+VW8TRHQFj7oDBsUuJ_yYPVpDWKzvgvKNw8PShTkBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Introduce header length
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Isaac

nit: If you have to redo the set I would recommend to squash this
patch to the next one.


On Fri, 8 Nov 2024 at 16:43, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Isaac,
>
> Thank you for the patch.
>
> On Fri, Nov 08, 2024 at 02:23:08PM +0000, Isaac Scott wrote:
> > The uvc_video_decode_start function returns the first byte of the header,
> > which is in fact the length of the header. Improve readability by using an
> > appropriately named variable.
> >
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index e00f38dd07d9..2fb9f2b59afc 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1117,6 +1117,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >               struct uvc_buffer *buf, const u8 *data, int len)
> >  {
> >       u8 fid;
> > +     u8 header_len = data[0];
>
> Is there a guarantee at this point, before the sanity checks below, that
> len is not zero, that is, that it's safe to read data[0] ?
>
> >
> >       /*
> >        * Sanity checks:
> > @@ -1212,7 +1213,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >
> >       stream->last_fid = fid;
> >
> > -     return data[0];
> > +     return header_len;
> >  }
> >
> >  static inline enum dma_data_direction uvc_stream_dir(
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

