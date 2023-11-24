Return-Path: <linux-media+bounces-967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD97F70A6
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 10:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76120281390
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 09:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A85182CE;
	Fri, 24 Nov 2023 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGfH2b52"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B232D73
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 01:58:23 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-77d645c0e06so87440385a.3
        for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 01:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700819902; x=1701424702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lKDs9+RNzkaGONqEPfv8Zgh88yWUl9hGvpYieCjYXUM=;
        b=dGfH2b525mT2WAgecxXDQiPsds+gQKWJSx0RSb9ftIVKPkqf0u89cTKjF6PIARaGn8
         IcOD5Yt2Sva/Nc6UKsHAtpcg0PkJ/bxePB9+T/sXmIwUBpt62ySYpChEWrXG8Sg4RvOw
         HexBefPn816cbHuTe1bNOjPSEHOsbh0+MBhpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819902; x=1701424702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKDs9+RNzkaGONqEPfv8Zgh88yWUl9hGvpYieCjYXUM=;
        b=YapGWXu3bG9pDrhY2muzWCzssyInaxyzyCOLsRl1QC8VENCIO2sPWJFs17R5LGD+gu
         uPCNG7VbRhJkvx7LQGZTn9CNB5CpHHeW9EnHvg1myzvkwx8Gg6SycgFVARNSGqQjM5HQ
         Hm7YeACwFOvsm5QRrPmhqqB//t0fiPJSWcIY4DH44zfBPykgyN/a/uBVi1DLTJVZ7D3X
         CtP/dy2BuffhpBY/bMo7YDSzE+ybU4UkiHSxyv3UZvD0l7CKpVeL2Ozm3kW85GlirN1S
         eUunGDZujvDM5u42bd0bBckOnEoWPFFlj+i+Ytdj7jx68JUmkaM5Baw48LozgMUB0ldO
         3DLA==
X-Gm-Message-State: AOJu0Yw5aqjyMcfHvbZTqKmBsAYN5HooFM7QZ+DJDlCZ+4dYl3HUMj4G
	nAnPYk4vM4Gg4AaIrCKmz6CvrFjlQ7nqcGmv3vZchA==
X-Google-Smtp-Source: AGHT+IFVk6QMh8s6enMwKl9Thf/rGuFQccnLRs1Shth7xuiu9izFSDMRLmcUjLZk+7CE7WG63+HY8Q==
X-Received: by 2002:a05:620a:16a4:b0:77b:d563:1c07 with SMTP id s4-20020a05620a16a400b0077bd5631c07mr1901110qkj.78.1700819901952;
        Fri, 24 Nov 2023 01:58:21 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id d18-20020a05620a141200b0077d6875cb3esm1108736qkj.114.2023.11.24.01.58.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 01:58:18 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-67a0f0e3702so4562456d6.1
        for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 01:58:18 -0800 (PST)
X-Received: by 2002:a0c:e98f:0:b0:658:23a5:e062 with SMTP id
 z15-20020a0ce98f000000b0065823a5e062mr2481527qvn.31.1700819897531; Fri, 24
 Nov 2023 01:58:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231106-uvc-event-v2-1-7d8e36f0df16@chromium.org>
 <ZUjIlq0cxSv9Cut0@valkosipuli.retiisi.eu> <CAN_q1f_HV7Etb9i2c2_c6Trm2hAJUyd068UskJfMvT=OyiKXpA@mail.gmail.com>
 <fe672e31315b8f9c44a693c909d464a299e76093.camel@ndufresne.ca>
 <CAEZL83qR2bDq35yvCV-WvkaL6ZbPvSxQH+j=ViG6Kq8-0Mzq1Q@mail.gmail.com>
 <CANiDSCtDQ9Wg57YzVAJ1o5WQRmy1QPW8td8V2Scc08MmWtOwFg@mail.gmail.com>
 <03ac47742945cc04e4663b87563b47a96ed3ec1f.camel@ndufresne.ca>
 <CANiDSCunRRyod3Rg+L9ZsffOZyC7CKbMVTHX3u-n5iuNyZQk0w@mail.gmail.com>
 <20231109000327.GE21616@pendragon.ideasonboard.com> <CANiDSCuD=Z2FVaSnejCfLnRJXUSE99GQkK=4tRAXBbxpUqEVHg@mail.gmail.com>
 <ded0b788f5896621cffd8f64c679ef375231b6d1.camel@ndufresne.ca>
In-Reply-To: <ded0b788f5896621cffd8f64c679ef375231b6d1.camel@ndufresne.ca>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 24 Nov 2023 10:58:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCsctSyfgXxH3iroJPOE7R_9jB7todiEMBCU_5OG3EOCKQ@mail.gmail.com>
Message-ID: <CANiDSCsctSyfgXxH3iroJPOE7R_9jB7todiEMBCU_5OG3EOCKQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Implement V4L2_EVENT_FRAME_SYNC
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Esker Wong <esker@google.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Esker Wong <esker@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >
> > For bulk devices this is a maximum of 0.05 msec (32KiB/600MBps)
>
> I lack a bit of knowledge on how to scale this to different devices, with
> different speed/framesize. My only bulk device is:
>
> https://inogeni.com/product/4k2usb3/
>
> Which is USB 3.0, and have raw (NV12) resolution from 640x480 (max 60pfs) to 4K
> (max 30fps). What would the error look like with that ?

For bulk devices the maximum delay from packing multiple packets into
a urb is 0.05 msec (32KiB/600MBps)

Laurent's message <20231109000327.GE21616@pendragon.ideasonboard.com>
explains where those numbers come from :).

Regards!

>
> > For 1MiB transfer isoc devices (which is the biggest we have seen),
> > that is 1.8 msec.
> > In both cases, this is smaller than the jitter to process the event
> > itself by userspace.
> >
> > The time from V4L2_EVENT_FRAME_SYNC to DQBUF is around 30 msec.
> >
> > I do not know how much delay is considered acceptable... but if we
> > take the delay argument to the extreme, we could say that
> > V4L2_EVENT_FRAME_SYNC can never be implemented, because the event will
> > always be delayed by something.
>
> We have v4l2_event.timestamp for all events, so the jitter to process the event
> by userpace can be removed reliably already.
>
> Nicolas
>
> p.s. missed it earlier
>
> >
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> >
> >
>


--
Ricardo Ribalda

