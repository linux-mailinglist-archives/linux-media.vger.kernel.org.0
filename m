Return-Path: <linux-media+bounces-7191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C187E62C
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 10:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90177281188
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 09:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446B02C6AD;
	Mon, 18 Mar 2024 09:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EXFHnES/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D832DF92
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710755014; cv=none; b=ZAwKl+16aY9bMQwq5B8mmZKvBh6hxQ166GmBECZEiMksmSK0WEmKurCNmXKgpGQzmRcOcVLFPvrPDte/VKF1YjX5g8PHRhMJNmb8ZBeg89kehGQGFIHODYC6DmPoyun36RpL7poHEf2tzzRsgbSwgfYWsj8oNArs37QwTM9Gf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710755014; c=relaxed/simple;
	bh=Vu5TeQIbNnNOvZh5Nl0JoowV+Y2laxCeaTaC2/xQXzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSHvAuYYQU6kFzcLc1cwMK0tIliVJnNbr+I0g7uhhOAhbyVijI0PTR5Bk+svtfqUK9M9utqwZ7jodlHD1nyy6KKu3Hs3sNec8GZ/YIzyPEri6tbyaYj6OsAn6d3+iBk1urcltK2N24P7eZ6N2PnaVp1LSrWVsnqZm+aksLIbbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EXFHnES/; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-42a029c8e62so32056741cf.1
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710755011; x=1711359811; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpMuKFoBUfb/TkstgZdaP/sds2EB+DxUhvcvriLXYFo=;
        b=EXFHnES/ZhNv/0Z/naJBhTSHcbEgNf0cz+yRtY/Bs4tmgyU3+dTd/ktHtphZElrrMN
         ptSWUXqvzYeRDz4x0Kc9ABq2CXJrp3DgF7HYY2RudAhwbZrcTPYNhpc8ebfH2xhBkHHw
         4eiNnZ2PIFk12vEIrDGX3Y8vkOU4eYd1bxiaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710755011; x=1711359811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpMuKFoBUfb/TkstgZdaP/sds2EB+DxUhvcvriLXYFo=;
        b=SCMJCzsXrjchrZctxSOSnbhxFwMAK79mhZEmz8W7jPL1qQ/PMoYk7ZY3hfreRJA5GH
         49vuioYChFi1FIRN/Iq1HJTMdE8pBIwjT+D8PQumpciFUZMfgOs0dblrw//CGwfS/GAJ
         JlQcrBd3vkBtf4F+pANNkgbD8CthN0gM5qZXQNjb7OgOgsxiMGItnWAI2rw4Vf7bfPPY
         TdldUboHfJMuaPi3onJVe9EKPcDPzt9RsjNiB2ozJGgE+LsAGfoUPqRqdXFriwGVhC8p
         Q0+sjonxlwUGicRMRi6eSorokYjs2JE9IXqmeEjrZgLQ3mgyp6xDVDHsp5WQk9tzuBXk
         5g9A==
X-Forwarded-Encrypted: i=1; AJvYcCVY76lCEspZiZw87I+4eqi4DS10zpnFmDX1kdsFcQ0FiKVw4BWkPNcdhuay2rUhqPi5MJllh/+gOpO+mGbT/iYFdzGe6SSETIj8v40=
X-Gm-Message-State: AOJu0YzZqPtsHBeTu+j04ZmkxeNrQ77u3tgPFnhA18lzNLtkbAdrVETr
	MUj4C4C2CVJ/cBY76XIFLBrmc5P8Ct2xvIOWAEu+F0HU51kOH9tkQVhzoknjACfBTd70dUNUhjU
	=
X-Google-Smtp-Source: AGHT+IGWOf+YXU+q0/xOtXFtNMDCOV0ru+1VwObmhOjOHMT7cjzPM3I4Ge/h6x18RANS4YkuimjddA==
X-Received: by 2002:ac8:5a01:0:b0:430:9edc:561b with SMTP id n1-20020ac85a01000000b004309edc561bmr12607934qta.4.1710755011470;
        Mon, 18 Mar 2024 02:43:31 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id ca11-20020a05622a1f0b00b00430bc1186aesm2653796qtb.28.2024.03.18.02.43.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:43:30 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-690cf6ecd3cso26262476d6.2
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 02:43:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOulAyEnp+oPOng6crOI6c98zMQjRQT6dJQpehMyakl2+ioRB+zJl8kQLz3Z3gnBIs3ytVOhH963//2gTHZH7/zgpPaaSfHhspaak=
X-Received: by 2002:a05:6214:2f0d:b0:695:7939:165c with SMTP id
 od13-20020a0562142f0d00b006957939165cmr9069229qvb.52.1710755010398; Mon, 18
 Mar 2024 02:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-uvc-host-video-decode-start-v3-1-40e9b9ced97b@pengutronix.de>
In-Reply-To: <20240221-uvc-host-video-decode-start-v3-1-40e9b9ced97b@pengutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Mar 2024 10:43:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCv13TmKFNKP6khYh7cCv=mOrhVKGJ79H9knYuB6iJKqDA@mail.gmail.com>
Message-ID: <CANiDSCv13TmKFNKP6khYh7cCv=mOrhVKGJ79H9knYuB6iJKqDA@mail.gmail.com>
Subject: Re: [PATCH v3] uvc_video: move clock_decode and stats_decode to the
 end of decode_start
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Mon, 18 Mar 2024 at 10:28, Michael Grzeschik
<m.grzeschik@pengutronix.de> wrote:
>
> When the uvc request will get parsed by uvc_video_decode_start it will
> leave the function with -EAGAIN to be restarted on the next frame. While
> the first wrong parse the statistics will already be updated with
> uvc_video_stats_decode.
>
> One value e.g. is the error_count, which therefor will be incremented
> twice in case the fid has changed on the way. This patch fixes the
> unnecessary extra parsing by moving the decode functions to the
> end of decode_start, when it is save to really parse the data.
nit: safe
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v3:
> - Moved the clock_decode and stat_decode to end of function as suggested by Ricardo Ribalda
> - Link to v2: https://lore.kernel.org/r/20240221-uvc-host-video-decode-start-v2-1-88c6e17e487a@pengutronix.de
>
> Changes in v2:
> - Moved the EAGAIN bailout after the sequence handling as mentioned by Ricardo Ribalda
> - Link to v1: https://lore.kernel.org/r/20240221-uvc-host-video-decode-start-v1-1-228995925c70@pengutronix.de
> ---
>  drivers/media/usb/uvc/uvc_video.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 7cbf4692bd875..7471bff0ca894 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1078,9 +1078,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                         uvc_video_stats_update(stream);
>         }
>
> -       uvc_video_clock_decode(stream, buf, data, len);
> -       uvc_video_stats_decode(stream, data, len);
> -
>         /*
>          * Store the payload FID bit and return immediately when the buffer is
>          * NULL.
> @@ -1147,6 +1144,9 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>                 return -EAGAIN;
>         }
>
> +       uvc_video_clock_decode(stream, buf, data, len);
> +       uvc_video_stats_decode(stream, data, len);
> +
>         stream->last_fid = fid;
>
>         return data[0];
>
> ---
> base-commit: d99e42ce6b8341d3f09e22c6706461ec900fe172
> change-id: 20240221-uvc-host-video-decode-start-af53df5924cd
>
> Best regards,
> --
> Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>


-- 
Ricardo Ribalda

