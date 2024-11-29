Return-Path: <linux-media+bounces-22358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0339DEC08
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD28163441
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 18:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57561A08C5;
	Fri, 29 Nov 2024 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VHbO9arf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175D14F11E
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732904352; cv=none; b=N2Ht7C7W5lrhO5ZU7u/rEuuWh1us6nRyqF0wuydklD7O1fo7DcL/bB4NVm40nboHB9/RrrmjC80ytAQkb0eQDBTkmvBov6b3cWlwUDyb5iiTcskqSkdjdDF/9WdUWIAy47pWqbOOBwNzAmqYqkPbCulYBFkwa6BI8aJUgnnV3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732904352; c=relaxed/simple;
	bh=9oNuwtDLWeDAIgUyuRKygrEyiqT9jynskTsaYOCbcNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIAqcoUrQvViI5X7tt/6olr+4H/jl9Govbvb44Qq1wXLxVxwxKLoRahElah1kClHTb6Iv5xc4DOIvnS1wifrb7lGgua0TPiZs+zQTumqWB9oljxsJdXDXI+iNR10+A9N6+RweyPthC8ZgvMQlYpV/3shKUZ3anOoOnUq6j0IGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VHbO9arf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-720c286bcd6so1862574b3a.3
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 10:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732904350; x=1733509150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PN3EfWs6vxHfOQvNcqaTj9BKkofXEf67LNsJGDX/OqE=;
        b=VHbO9arfHEWXA1Gn94PAJBCEPGMDQ96s5vdPjDESvBG3YA1kBx5CCQVRZi9RywKa3t
         gFys3dbMo/aPkmNBt2mRhghQeyqtP1rZQlyduHRpiCO4GEbQOwl5mzQ9kkJtqNmu9RCK
         o3Y7ynfidtGSPHryHjZP1nGtD/Q2E6zE9LiUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732904350; x=1733509150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN3EfWs6vxHfOQvNcqaTj9BKkofXEf67LNsJGDX/OqE=;
        b=er0urDQxBVRYU0pf5xld1/26AKWC0b2ENXfXoaiNchPCr+jlMkf48fJ/pKvqrD+7vp
         Lv5LtHjTJrBJjTP11SQzFptm2d36+jvemCD06P5DgFFNbfz71yk1Zs11PlDawEEzzTB1
         gghxEqD75U5ooxv3TR7rI8kcASUUe2AZlPrlYHWv9u5ABy2ac0DhQuDYsE42/9BNlFpD
         fCAnXLTVx4Zh3Q8LJZF+LlXHpTtXUPUYZOvO3lKw3lYSN+NNXrFY/WcWfrokEZpLQRDX
         mgx+WqjA2KEVkyUaNWfdlwFDWsieJFLGLf/Q6Rt2xwUUpTxN0suToAU/5erCnVs+q6oC
         vKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQG/Sw3lZNWbG0KwO4y8ckZ/5R5h6q0f6VIq5DigtESyH+CSNUxNxULKEMa6cv9JzpFVoHfIi/2ZBzlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV2XARb5IWy7dWHzbNS/tgAeE80o5uRg3F5mOLpt1HG3DHF7Hf
	iNq9YDRTDRXfovrDfzDEs8s4bsquqa8wkwgi4TZnMO5qP9hQ6V8ie0UNHtCGZh3n4sb/OD89R6s
	=
X-Gm-Gg: ASbGnctTk9s/f7GbHIydBrQmokPWjiksAX3lp4ooHOEp4l31ktqgbE/Yb7IJRjkX8gI
	jeSbui+TiVU87chZop1YDreQiHDubitzSUR+ZjltUh8UQvp8Vb6ewGDa80OVlMMRRAgzYzgojka
	vbKFrxgAqKhnzxSg6KZO4qRsqYKsrICpOadUX4Sx5btnFxcABnIlhnP3zJ55L2u0qKOH8GF75B4
	Fc+uugpUI0grKjnbfEoAR4VVuwC+ciJkrOuwCI5mP+4vEOEBtEx0CkKgnlaCVYNJSu5xZOdR78C
	L/BEKynsNrUXrjlr
X-Google-Smtp-Source: AGHT+IGSd6m1BycwdOybzLQH3ngFvXQkZMMT/a+i6FBjLeeZ7bfsoVtAWCF0aFBHFY/glZigO6gafg==
X-Received: by 2002:a05:6a00:807:b0:71e:52cd:9cd4 with SMTP id d2e1a72fcca58-7253011ef3fmr20074953b3a.20.1732904349986;
        Fri, 29 Nov 2024 10:19:09 -0800 (PST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm3783723b3a.55.2024.11.29.10.19.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 10:19:08 -0800 (PST)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7eae96e6624so1415087a12.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 10:19:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQ3Q0MVniZkCxFj0HvAwaUQurPILDOSwyTFT8EZjS38kRb9zLSxkhv0Y9jMuMsaANie2QlgyBxS9742A==@vger.kernel.org
X-Received: by 2002:a17:90b:184f:b0:2ea:6d3b:1985 with SMTP id
 98e67ed59e1d1-2ee08eb2205mr16640538a91.15.1732904347777; Fri, 29 Nov 2024
 10:19:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129151723.48275-1-xndchn@gmail.com>
In-Reply-To: <20241129151723.48275-1-xndchn@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 19:18:55 +0100
X-Gmail-Original-Message-ID: <CANiDSCsFriCyQuF3aQ+mEeHERcaUPt45ZgVX2Wyfo2T6N3vS3g@mail.gmail.com>
Message-ID: <CANiDSCsFriCyQuF3aQ+mEeHERcaUPt45ZgVX2Wyfo2T6N3vS3g@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Use uvc_query_name in uvc_get_video_ctrl
To: Xiong Nandi <xndchn@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 16:18, Xiong Nandi <xndchn@gmail.com> wrote:
>
> uvc_query_name was introduced to print query name in uvc_query_ctrl.
> So we can also use it in uvc_get_video_ctrl.
>
> Signed-off-by: Xiong Nandi <xndchn@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e00f38dd07d9..93cacd2c8721 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -297,8 +297,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>                 goto out;
>         } else if (ret != size) {
>                 dev_err(&stream->intf->dev,
> -                       "Failed to query (%u) UVC %s control : %d (exp. %u).\n",
> -                       query, probe ? "probe" : "commit", ret, size);
> +                       "Failed to query (%s) UVC %s control : %d (exp. %u).\n",
> +                       uvc_query_name(query), probe ? "probe" : "commit", ret, size);
nit: This is above 80 characters. Please move size to the next line,
aligned to uvc_query_name

With that change:

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

>                 ret = (ret == -EPROTO) ? -EPROTO : -EIO;
>                 goto out;
>         }
> --
> 2.25.1
>
>


-- 
Ricardo Ribalda

