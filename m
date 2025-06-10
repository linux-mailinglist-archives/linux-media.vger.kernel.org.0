Return-Path: <linux-media+bounces-34438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AEFAD384C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D344417AD44
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C4A2BCF4E;
	Tue, 10 Jun 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BX6rhdSi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A91429DB83
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560323; cv=none; b=lAO5I4O3JPOs6QQeFQ4qnDmpmA9QRzSHfXKs0JYtt4KiST6Akb+AOWZmjiK8nRDNVnnvyM+kqGaZbDvd/Y9s2XhjJX7MQFxyuXuOWdyr6JUIQr9XZj8KwfJOTOC+WPT1Mm9BOFZ5Dqzyj2M0utzhzLXtVpgSmnQcSCDh2a2cjys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560323; c=relaxed/simple;
	bh=fvOlakXshbmzakRbTJCpEkrKBi0FeURoiGYCIMLBZgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5PRGY3vyRQ6ltU1EHrK9CQH9ugkNKou32AvyeBo6cngDZf9c8vIs7IGL9HRREuiULQCcQSd+OdY7Oac1Ny9SxPufP5hbyAFH3W7NQ7uD0w3hcY/hc3aCRtcHAd1ot1YMgW+RcR//55Asb5jZKNhgOcuJKpMatQmgCHoSEFZlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BX6rhdSi; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32adebb15c5so35526591fa.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749560320; x=1750165120; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PuNZG9GzYspsHj115f3YdhRzMM0n4xwJDNOA1CoppcQ=;
        b=BX6rhdSiz6TqasZdVea1F/D4Hffpkv/ZSiZ3b5W0ybu12Z97hHU4EagUSvA+thF8ww
         3ryCDMclcxiyVrLTLtIWlS2+szg0xjPN7FRQlkkVClO5Urqee5LTlSGFjmNh5rvoq6KH
         fL+HFYhlBW5+oiGJMAqp6U4AX3rZaU2uy1zt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560320; x=1750165120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuNZG9GzYspsHj115f3YdhRzMM0n4xwJDNOA1CoppcQ=;
        b=I7ZBCoznX8qA/2AXfxUWE0IAIK7ctNsi/GcTcNA6pZznLyKo7Mq7PlwwjPYlDtYHWg
         PJ1pZpDeMgqZJr8rbjqCaVg24P30ORDBZ5Vbubfh/TSvCc8SbsO5ctThnkSAZmy+y0qL
         vJ9FJcilqyIdLdCfKwEmOLI5Rl8+pAFSA19HWFTZND5XL5GpLijYtd6K77nbXrBRhIWB
         CunnNQMnqYsbi5f0A1jtKACtEvQa25WYBe+lyjp55zUm0K4ADljGwTvEiSy6JRUA6Qqo
         9g0j6QfKy0lSC3O1DZ7rTMTQrW6gjpQwuhF7CSWnRyYJT9hhEiTslk9iXszjA5jh3FA2
         E4uA==
X-Forwarded-Encrypted: i=1; AJvYcCV3aWCUGQtDcyOC/bWp7thti5CuzmBxklCRjTdVtElTtoCq4xUmIOkfZEjJVdaaCSuMvfc0RTzoWpffRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLUzVgrytag0xwQeCcksdIAXGHVgH5kw1JzW/yHQxkg/I7GQ/
	y5dgW3Pf6JvmDqFi7KmCGaFpDP1BYidlGmzXFHqfkEEI5dYrP2Nv0mrlqO892z6eRDFXQxFVjhc
	Oh8U=
X-Gm-Gg: ASbGncvqQk/JcbO4no1k+igxVc0CCcmh3FInGTY4T2FXZw7hjzqHKP7GcFx0L65w0z3
	bX4wGdXq/OhEXB13mJPRLSDWbja8V76ZRRZmc+pl8Mf10U+2xu4bJasiC3qOfY2LDSi96MFs9pu
	MO0x2xkBe4I/WriHE9/cZnNnfxby6VZanPVyTJzV0o56KpJ1njuqExlbMOHPTxhZJf5zI7fJD4W
	rKGqm5QStgZnFnCJbqr/+ftrM1eqYVk33KZjMFnpB6hfWjtKFhOmF6MboyVR8RfEBgOJheLPH/C
	1mGlyBY2cJveaf6TWrMkfD7Ag1YxPy336D24i4iBMwwwBdIO/KOYvSHVfpKlsM7Rnz+3ogO455T
	HwLle+6HgbvLXe41De5Y3KCWJ
X-Google-Smtp-Source: AGHT+IGUgP8lEIKVnSoK4ZlnT3jQPBq2H2YgHyiO3EnwyN6/KqIP+51ZSgGopDoJAHyH50hOhKW6JQ==
X-Received: by 2002:a05:651c:544:b0:32a:6731:7995 with SMTP id 38308e7fff4ca-32adfd5fbaamr45367161fa.38.1749560319568;
        Tue, 10 Jun 2025 05:58:39 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b34e08sm13090071fa.37.2025.06.10.05.58.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:58:39 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55324062ea8so7051342e87.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:58:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUtb4vR+/RscDyZLhPQ/ykh0Ic1dmoSyI7WzD+BTvlTpw8OhdI4EeI+XhEMJkJKoDU7NZ6UNufUbcG9A==@vger.kernel.org
X-Received: by 2002:a05:6512:3ca4:b0:553:2100:69c5 with SMTP id
 2adb3069b0e04-55366c38f13mr4292643e87.56.1749560317177; Tue, 10 Jun 2025
 05:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179@epcas1p1.samsung.com>
 <20250610124107.37360-1-yjjuny.lee@samsung.com>
In-Reply-To: <20250610124107.37360-1-yjjuny.lee@samsung.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jun 2025 14:58:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCsaQCJCzfjjnMvVRAde0ZrMZC753y7m2MPQJuK=dVqQBQ@mail.gmail.com>
X-Gm-Features: AX0GCFujERdSe9Qt4dtGaH_A96BZ3xcvIQGmZPoA67-Hn8NMMl0VJUbIdlsL3To
Message-ID: <CANiDSCsaQCJCzfjjnMvVRAde0ZrMZC753y7m2MPQJuK=dVqQBQ@mail.gmail.com>
Subject: Re: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in uvc_parse_format()
To: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngjun

You still miss the v2 (v3 in this case). and the trailers.

In the future you can use the b4 tool to take care of most of the details.
https://b4.docs.kernel.org/en/latest/contributor/overview.html
It has "dry-run" option that let you review the mails before you send
them to the mailing list

Please do not resubmit a new patch to fix this, only send a new patch
to fix more comments for other people.

Regards!

On Tue, 10 Jun 2025 at 14:41, Youngjun Lee <yjjuny.lee@samsung.com> wrote:
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

