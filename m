Return-Path: <linux-media+bounces-27842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31DA56D39
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 17:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E3677A977E
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 16:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4044F226D16;
	Fri,  7 Mar 2025 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oBn8lLzC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD899221577
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363841; cv=none; b=dT8H/3CJHVgNR9+dWk0dWYxO+rn7Bcf/H94hLdgREYC7tkjlGBEu4f7E0iGUMnoVlL0A7QfD7Ar09oLRs8+9N43PJN9qcw2/hQXMXhisez67BX3U01Vq53oKuGNxRY5OlGVgoUN4hlVPw04l/OTsLqY6bjNQ2Yb3IZBovK/FyDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363841; c=relaxed/simple;
	bh=v/nq6HBZ2lU9Xc1u8ZCgXjk0gRvXn4xSypXmjssXxpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rq1kGRUDxXmySpOC2c4QSKCeodh/rjQQLATIUecx43yr+opTB//L1Ffq/cog4O9PxkXeFXh1ChSzPvAOYPmJ8IicHbyRE87W0R6956M5uo+/A0vPxy7JAbq3co8GGGB0eDm+UqY9YIUvf1zPhuGFV0pFtgjKA1VLpOTP7KmzT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oBn8lLzC; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3061513d353so22064651fa.2
        for <linux-media@vger.kernel.org>; Fri, 07 Mar 2025 08:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741363836; x=1741968636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6NHyRlIoZDrEU0qlwqQjUZyDB0+knmZI3hR4ckIPm4=;
        b=oBn8lLzC3+sXWLAzHZcLvK8Y/SNRvLoLt1t5Nw7dGLwdu8MSZIlcM33WI/Vj8x3JyF
         ne/A5yGosBgg9BAjWCh1nOfoi8XCT9QANBizgY1dron7xELzrImgHT93O8+EUvJY+OwE
         I02gRbaKwcImFC1urKWHpzSOVsvaF4LlzO3uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363836; x=1741968636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6NHyRlIoZDrEU0qlwqQjUZyDB0+knmZI3hR4ckIPm4=;
        b=PhIMbdDxHPK8rncYcq53bY3/PVVC8ORKzJQvv2YX/FWWskjRgCLkY6JaFlk3Plog5d
         1uHs7MOJAfZhGa5Ky5/mZHLIPURnD+DWk3h+ICOgWrL6X+78LJUtrLsodwXkJ4b73STA
         urHyI+QL62siQ8h1fhkZReBFA1es1mXx7dDDKN7u4KztkXfvrug5s8hUz4gvwVz2T72s
         Cgitj+wTcsDLpAjjou004tLLMPsYEuk+z9xVCe25wY+JGKWkZMEsoUcbFMYEp+0eGt41
         ash0nrw9zgItOGarxXBdN29I887FVPVVqnlarjKEMWAcUUYE7k8O0R91/2jGTHXGbzw0
         MkMw==
X-Forwarded-Encrypted: i=1; AJvYcCWuLDfFNBqnMe8Ry132/OyMjLYaAw7TQF1B7g5wdOZ5B4ruuOBjm5H9yztUo3fGoQYIHvjvqHutAGVj5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrpuwP/cAs3kxhrvPG9NBU7GnpdxqrOiA6FRAguUMW2WlNX+V4
	QDnkzB159i4ZWUtwp9z8dZS4mpBtF+nj+KIUxQ2TVoz5qYUtLoZkc6mn5yVjuz4outMG1WEvw5e
	MIA==
X-Gm-Gg: ASbGnctkHourMHsNnq4+A0xL0jzyykZlqxGAcUwGDHTHz0t9cjrPAv2u0TDdFzTzwSd
	HLkatjHbhBeyXbN6xDIlRQc8WO+A+0+q08vc/jie9eZIScbCcZKuTK7ujXlQWsguy+qNMV1gB2U
	JIsWVodJP0MJiQ8rBSqFgPdI/7I8QoagJfoF3syHCXvquGzPTJWF6XAZH8tHKNnQcYf/5KYkThY
	8iWb0yRx3+s6E1GQi77FpkqGHzQeHP+7VY4Go9btZMQZ0I+Um5k/YTnP4p+EZp/oeonq7Kv8bks
	ZMqbXnUPwW9Kf4zzyIipVzpJ7JwVjkkpXWJMUZk7o1d+V7UNwn4QzIBmG33QQHQ8uU6KTZkyJ4E
	9rLGOpc2e
X-Google-Smtp-Source: AGHT+IFJ5K9rGc6vEco0YD6wC6sDd0RQWyk1rqKSERsaKV9dVPa/wTC1kkI5qX8F6szqlexl7L/pxw==
X-Received: by 2002:a05:651c:553:b0:30b:b204:6b98 with SMTP id 38308e7fff4ca-30bf4518937mr18064621fa.12.1741363836516;
        Fri, 07 Mar 2025 08:10:36 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c8731sm5890191fa.82.2025.03.07.08.10.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:10:35 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5495888f12eso2487655e87.0
        for <linux-media@vger.kernel.org>; Fri, 07 Mar 2025 08:10:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWG+r34D5vy3ezdUZiHiBO8o3UN2mAsPG6Z/zMAPtql3e0FUhey6YXFKpfY0urnNfcVK+1vZ6AJo3eVA==@vger.kernel.org
X-Received: by 2002:a05:6512:2342:b0:549:8fd0:b44c with SMTP id
 2adb3069b0e04-54990ec5bbfmr1722953e87.49.1741363835007; Fri, 07 Mar 2025
 08:10:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-uvc-eprobedefer-v2-0-be7c987cc3ca@chromium.org> <20250303-uvc-eprobedefer-v2-2-be7c987cc3ca@chromium.org>
In-Reply-To: <20250303-uvc-eprobedefer-v2-2-be7c987cc3ca@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Mar 2025 08:10:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wc8MZJCMa0oVz+2ANcZa7FMzkgyKj44PtASJCWbjA4jw@mail.gmail.com>
X-Gm-Features: AQ5f1JrYE6wNhWN1IQoJ4WiDPzV24CvveUbAD2Aadpoa94lyFox1wzlIVOJObxM
Message-ID: <CAD=FV=Wc8MZJCMa0oVz+2ANcZa7FMzkgyKj44PtASJCWbjA4jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 3, 2025 at 11:07=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Use the dev_err_probe() helper for devm_gpiod_get_optional(), like we do
> with gpiod_to_irq()
>
> That eventually calls device_set_deferred_probe_reason() which can be
> helpful for tracking down problems.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

NOTE: If it were up to me, I would have also changed the caller of
uvc_gpio_parse() to no longer print an error message in the case of
errors. After your patch here all causes of errors in uvc_gpio_parse()
will have already printed something, so the extra print is not
terribly useful and just clutters the code and logs. That being said,
it's not a huge deal and I'm happy to let owners of this code indicate
what they like. :-)

-Doug

