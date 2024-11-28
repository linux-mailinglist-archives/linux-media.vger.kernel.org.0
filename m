Return-Path: <linux-media+bounces-22276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D259DBD84
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 23:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 652892821A3
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DFF1C461F;
	Thu, 28 Nov 2024 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k3vVGdNu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753F1C2439
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832925; cv=none; b=E1MRPbNIJiu5Amq+X+vZxGAhwF5KDgR0JQ6xDeACaLQniIvxpXWDwbuJFHo+KlZsPpylVjNdiW92JawiotLf8paVKoEfBYfuPsCs0lWyeQ49cXJ8Xa9obns9caCK6QzmXyjkw4hl/tHM3+ub/A6Ki9XoffretKJhn3ytlUXp4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832925; c=relaxed/simple;
	bh=8lq5+GM4KnxEtuVXVOGIdvmiEazYybHaFmVLqIFcr8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hClm96fHpiwq/htXe3rAHfu2FaV+JjHqqOS4zJuB0Br2SR/D16bTfs1eWD9w9JZ3d4RvwMXYm4UGb8IRw8fc/4jCiJT8k4Xma4GkAiDEf1fUqf3tb6rnqeE30vBYOBkZa9zK/XPwIFhSHooNafQKubVzNxxeHzT2qwfqL62DY+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k3vVGdNu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21210fe8775so18809095ad.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 14:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732832923; x=1733437723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YHsdk6gFEBYCcBAXe7bD6v4I0e45HlFShaBv7kWeI4=;
        b=k3vVGdNuoXMEPtGeyDj71+UMpjaMVcaBFA2zOlkBqgK6n3R3QRFFnuZpwq9B9M4F6O
         ysY7Qa0ziu1mQNR0/jTynGCGy2DpubmtHKHyqK26nXX+bwRn03wvbx3/1Rwld9cAZsCu
         zQRWNYa8alwUNrYPlpWpUKfGJ6StV+Q50CES8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732832923; x=1733437723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YHsdk6gFEBYCcBAXe7bD6v4I0e45HlFShaBv7kWeI4=;
        b=IeQnR8zHzYU2Uw1gHjUCcoy1N+RfuIwFKVqHmPQV2+FykrIC7Kk1D1P/DQKCdj4Mhh
         qjPSBDTHTQ5kKRsZ4nhZWVCf4aSkzSjMlftCE2aSYweOVSl4HqbCc8Tby0zxqNNwQVGf
         SmoIs4LjN8EfIpCV6XcHKEFgfIHpUVe6UDkU6gni4i4J8zzHA+crLMLIqXFcHxQ0jqUf
         g/PqViKZEbbixj/WlZc9R4gW7e9Dnpsq7C6YbBdoNpXDG2q9HW5djFxHqifX8Jw1VjkF
         wjyuS4D6Aho/AFLosUsuuvIlHJCiApAje9yyts2pH1mve7W2aD2bjQsyt0gs5fQLak3J
         L6Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVa1iYnc9ndFTcyVkxEQ6CjG4kAIumJf7Flz+zthw6YDLlXFPuMdk9+UkqYByAK6/i9vlPWY2cJseZkyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0t0v3hm7s525acuVxdzXS5wVDkGHJjFFKUf5fgD3K0U9eST7J
	6wZvgoiUvIB6NIzcgT9rHY2oIFczlEhWueLE9kqVAScLcnC2ye4E8SDWY8QOiKAsIR5xmkuHK84
	=
X-Gm-Gg: ASbGncvpkfWyqCJh1WiRfMzSAgRDk3b9rU3dlNYZGBThPj3DOhmbCb2RPDLSDvntmHS
	ST2o47/ZBAwg4h6hRV1WbAhhjJrkhuSz40BUJya1fhXI6IncVZbBwEJnvQxIxzaDHEUwF9xWDnn
	Lary4KynvY2UhyEiTbeZWoMqMg228KFChhhnJyB91uZBYzFZ9YGxfkZd3zIzJJ30WsQ62ZIyZA/
	g539T5/Y8l9rRT4fDh//aZe2/Vq0vfiIBkN8Tj+tEJs6D3urjMMms9XSc28gAHHJs0tVGnVTbLD
	GkzLtWNT4e5oRKOm
X-Google-Smtp-Source: AGHT+IHf6hJBxXBt6jU7wzEp0E8//lLI+YwghMPQf257qRHIplXJ6BFjpSWIiaeOp9JYTPADNlGPTw==
X-Received: by 2002:a17:902:cec1:b0:215:307f:99d6 with SMTP id d9443c01a7336-215307f9be8mr29717895ad.15.1732832923310;
        Thu, 28 Nov 2024 14:28:43 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521919f53sm18650955ad.104.2024.11.28.14.28.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 14:28:42 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7251731d2b9so1643757b3a.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 14:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwAXx1TLGtCUJijFeaIbCjXPr/J2ViiSG7yhVmxvjR9K1xxKYpF5FdbwW+a68WJGeeOX0EJS3omQPqEQ==@vger.kernel.org
X-Received: by 2002:a17:90a:9f93:b0:2ea:5658:9ed6 with SMTP id
 98e67ed59e1d1-2ee25b38db4mr7346429a91.12.1732832921898; Thu, 28 Nov 2024
 14:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org> <20241128222232.GF25731@pendragon.ideasonboard.com>
In-Reply-To: <20241128222232.GF25731@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 23:28:29 +0100
X-Gmail-Original-Message-ID: <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
Message-ID: <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 23:22, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> (CC'ing Hans Verkuil)
>
> Thank you for the patch.
>
> On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
> > If a file handle is waiting for a response from an async control, avoid
> > that other file handle operate with it.
> >
> > Without this patch, the first file handle will never get the event
> > associated with that operation, which can lead to endless loops in
> > applications. Eg:
> > If an application A wants to change the zoom and to know when the
> > operation has completed:
> > it will open the video node, subscribe to the zoom event, change the
> > control and wait for zoom to finish.
> > If before the zoom operation finishes, another application B changes
> > the zoom, the first app A will loop forever.
>
> Hans, the V4L2 specification isn't very clear on this. I see pros and
> cons for both behaviours, with a preference for the current behaviour,
> as with this patch the control will remain busy until the file handle is
> closed if the device doesn't send the control event for any reason. What
> do you think ?

Just one small clarification. The same file handler can change the
value of the async control as many times as it wants, even if the
operation has not finished.

It will be other file handles that will get -EBUSY if they try to use
an async control with an unfinished operation started by another fh.

>
> > Cc: stable@vger.kernel.org
> > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b6af4ff92cbd..3f8ae35cb3bc 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >               return -EACCES;
> >
> > +     /* Other file handle is waiting a response from this async control. */
> > +     if (ctrl->handle && ctrl->handle != handle)
> > +             return -EBUSY;
> > +
> >       /* Clamp out of range values. */
> >       switch (mapping->v4l2_type) {
> >       case V4L2_CTRL_TYPE_INTEGER:
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

