Return-Path: <linux-media+bounces-34432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC26AD3701
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14DA9173D13
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2076D299938;
	Tue, 10 Jun 2025 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OIgXp+1M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2D22BDC16
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559075; cv=none; b=JyADaxSHV1el5LVwA4YFX2lsHWQI1z8sUuB2diT1G6HQjqN6RyZuiw1Rsk4GZ6hACo55Q3/c2baHmIdMFTDZ0+dRpWGNeK7u+tfiYoaUmINHSBB6ZHcCvzC2ZfTCMfkNS7N6AfO87rvdTDLBHchxMo/jyBX//Xv77FppCY6wlzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559075; c=relaxed/simple;
	bh=VOzkxpypoaAOmED5Y3QuE5bGmiiKDU7pwO5eKvb2ZuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCYPE6Oa9GkhztaCFeGe6xcKgQz78xmyd0ivPvjXv8/TUKi29ww6zO+K6Q5FwLXOyPG92VdtvPDxl3Gke+o/eKw3XfFMqYI9FSLlhhwpOLx0eK8GB50d7fuIEabbJ40Dd+cffwmFyTi7Ow0CLk+xGKlJ7wF9FzPtChPDnDL0t+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OIgXp+1M; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so5787450e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749559072; x=1750163872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VErfzveBAbUjLmCpN+lf4azG2Ow/Gi7oziw0c95kQ9c=;
        b=OIgXp+1Mnd9NQYfWyxTmTdQJClh+td6hdXfIJP5Bt0OuFPLQWZd+/hGDGOCv0/1lfd
         vypVw4ndP0pit75GyBx4h8ZPSb+ZVciP1sbXIkFd6ECOhNorzAazTyVIuol7JGh/NGEm
         Ywd7hv16ykecWExOyITA1bsbXV9cW2kg6E508=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559072; x=1750163872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VErfzveBAbUjLmCpN+lf4azG2Ow/Gi7oziw0c95kQ9c=;
        b=S1KmBu85cnWUNk2eGqXKkxx9/hkeZdJiHVB6HPSUFqWWdycmXNAAYEULzJmURKP/Nl
         YyI3yq0tfzPGKAlrlU0iYNmleRW8z/dd0j6dCYaZvfB4cd7WUSW49PsE5qjed07anWC5
         cW4Sfg4EB0TadruRCEdJZNLOFAkQ/bR354GGpEOWf+otWz8IIE17ETK/LKIAxhihtRMS
         uK3CoI6uvwtGP6CpWMKmKY2huhkbJ3WMJXMB2f2z5mCDB6HWloaxrviabNjx6paBY/en
         gj++AOQ2rX8827iJEO2rC1dUKxpDldrXBx3nb9irmJ5J5SCYdwg8lRtA4kKmuJiw2MjX
         4u0g==
X-Forwarded-Encrypted: i=1; AJvYcCUuACWoW1RuWJ9sLM3dBeUl9txWz7eHyi29Kced9t2101N2lof6kaGEUHCIXbp9L5O+Vo3uqRMOl9rZBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+eRQ1gmnLRtw4Sh10bPnN2FCP3XDdc3FLzXGA9V1ASKETltf
	Gjtoyw1ccOFDROueKXj1EWh5MTC61g3/Lem/FTqUpHnSSdBOiomlCVNU4JymSWNXOXifAHc5APf
	vZUE=
X-Gm-Gg: ASbGnctgkKcaIWNL1JlkidEoFyg3nVIZV8wCXeUHjFOZnUYFtNwKpml+GvUXfCoT0NM
	p61DOQjZWqMjrH0AXlZAVFPPYjhpm29keQ5HUwUIIKtcpYWtN7h9oQ30jj2yGRxY915iCwCHdnl
	PCDBuLkj18WaQJ7wmJMKdS/X9PlK0gN59BSIqZZz/aBfGboEN9NCFHckvDkM3WPDECwiV0HDZhx
	zjvo/0ALUFotNFBhb9o0Q8SGxzsdRuLyuGmp/VjnwYue2PBXiK6MzsfG6DU5tFuhzaRr3wE3Hdg
	ytS2go4fwHGCG7arxR44Lvl8IlO5Ar36EU7lXqH2NGd3ku7isotDFx0WmbKP4KALgI/ITQoC9u2
	noUrenet6TQ7t9jth04ovdApA/tezRfd28D4=
X-Google-Smtp-Source: AGHT+IGKVr9gkanaiX/XBHmEQRkX5LVDmtMTLUJw7lEh1qGV5v8zYZQ/MKBQ+0thZRneOgTrk2opzg==
X-Received: by 2002:a05:6512:31ce:b0:553:2f25:3b46 with SMTP id 2adb3069b0e04-55366c43d4fmr4275771e87.57.1749559071583;
        Tue, 10 Jun 2025 05:37:51 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677223desm1532599e87.92.2025.06.10.05.37.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:37:50 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so5787407e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzHEJZ3N3K0I3ZrkeF/6U5YyKBBvWbmbo+mcXCP0CsGoNOvP/ff1kXuJRBly4WIXH45gBwdt69IeZ0hg==@vger.kernel.org
X-Received: by 2002:a05:6512:3c8b:b0:553:279b:c55d with SMTP id
 2adb3069b0e04-55366c2ff61mr4456065e87.45.1749559069957; Tue, 10 Jun 2025
 05:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250610123532epcas1p24565e694897b17a36ad04752b7dd8678@epcas1p2.samsung.com>
 <20250610123526.37316-1-yjjuny.lee@samsung.com>
In-Reply-To: <20250610123526.37316-1-yjjuny.lee@samsung.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jun 2025 14:37:37 +0200
X-Gmail-Original-Message-ID: <CANiDSCsTm7-kxS0C6H_JY7NnC3z73Qg9L7d6M37p4Zao1+96EA@mail.gmail.com>
X-Gm-Features: AX0GCFt5eSrh6Ot3mJNfS0FZ18dU3T5t8BB_D6IPh7jhlV2rISHnMB5fsHFWlWU
Message-ID: <CANiDSCsTm7-kxS0C6H_JY7NnC3z73Qg9L7d6M37p4Zao1+96EA@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: uvc: Fix 1-byte out-of-bounds read in uvc_parse_format()
To: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I think you mean v2 not 2/2

On Tue, 10 Jun 2025 at 14:35, Youngjun Lee <yjjuny.lee@samsung.com> wrote:
>
> The buffer length check before calling uvc_parse_format() only ensured
> that the buffer has at least 3 bytes (buflen > 2), buf the function
> accesses buffer[3], requiring at least 4 bytes.
>
> This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.
>
> Fix it by checking that the buffer has at least 4 bytes in
> uvc_parse_format().
>
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68..1100469a83a2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>         u8 ftype;
>         int ret;
>
> +       if (buflen < 4)
> +               return -EINVAL;
> +
>         format->type = buffer[2];
>         format->index = buffer[3];
>         format->frames = frames;
> --
> 2.43.0
>


-- 
Ricardo Ribalda

