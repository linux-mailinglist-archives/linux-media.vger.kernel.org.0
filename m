Return-Path: <linux-media+bounces-58739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC+WMCMb3mmFnAkAu9opvQ
	(envelope-from <linux-media+bounces-58739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:46:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9113F8EE2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AEAB30919D5
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE983D75A6;
	Tue, 14 Apr 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NgyhPu15"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D162119DF6A
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776163244; cv=none; b=iwNE7MeKC4hX5G0XJrPYNyO0DqgZQz+OCN+FHnBZcnLfIS2bhY0u3vq9E4yZ/nzcwEYJGUDFL7e8uRowpS0j2+P3lFUpwWl6CCeGj+0KMMvud4jfXXKwMpy/i3IcWiqR+jRbCmw2a8Vy4rp7u8SI9PAzhPJSXrvJnVPEyXsLMgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776163244; c=relaxed/simple;
	bh=grC/g4ZH4PFK1NAhL5Ld3Spj9tmiHlNgJodsMOhivUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPl3Av56PfUkpXlC7HmpjQMj0mnZP3VakUMFhHLINYEfV2FGOeU1oBn9c2/FE87NAQUN0WxT/Ki9pJFmcxQTxx8aVr8DwykIH5AloUDCI649xMY4e2/oYHw3GB8dHafvADVFt8xfgpuuFj6115iNRWru3uMuA1XroDx7yLAZfQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NgyhPu15; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so793714866b.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776163237; x=1776768037; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HSSXpcMNMpGp9jKohMZiXzdZCQZ5HzhgwQXsH9TGwik=;
        b=NgyhPu15QoiEFTyGVv3TxCIZQUPil2ud2tNYx5o9zNKB6VLGNUNrAB/+NFxAPHAP5O
         CmnX0Ydgs28gjF1WO0K+Eb9TP3Nxn+i+DB34TQzt9mhuPpBv8iwQnLMecSGTnfp5jk+y
         iRWPnScEYCcbu2MV6OftYjfFcMYlhWeFuhJtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776163237; x=1776768037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSSXpcMNMpGp9jKohMZiXzdZCQZ5HzhgwQXsH9TGwik=;
        b=qCX/8TSL1t5Ypw3OjAChXxc4jeIiApThfJwciTPqmeJrTs0nR5yY586SGYrwbio26l
         qrcbcOrjvrvYT7ICGRpeaSfADY4NbHuFmfVUEz2eodipR/2SPHCIOHFrGFqEtl5oDVmL
         J0ISH6O0jd3bzAkfPImDe1YLUsr7gGFmKIyc6cUHbuKlQtA3bvLEqGnpsU0wziQBlh3/
         lZJIXNvZ0y8VIKVTlgI853h9X4/xJrxblxXXOkRGjnrwEIhAt0E05/Iym2mDohSr63v8
         7/Qz1nT7GkOjgUDphxCXg4NXVLoZ8qpefdzG9GyubSRlTN+2i8ApBjdjLEnR2/Zx3k6l
         QRCQ==
X-Gm-Message-State: AOJu0YxILS4K2gYS4TUU92eJtMNSWBE2MFkcR7Toft4cnPQXjVsP81gp
	Aj6aA6jj5FjLQHPpgktAM8oWmcHFRv937nYNPxb4yEFiWp5SXZPKEAUm8P3qjUU9ClSfhh7Inkl
	ANa7aQQ==
X-Gm-Gg: AeBDieu+7xjwvpP5ksmgfJlqL78wICA+DCBeEWyZ6j5QTlaDTfmcF5UHE4vlzbiUppQ
	ffwR+V/bc1RkLG/MiBg1Q9ypsIuWpELjQuWpLqZ8hM7DxmxPPT5pjjFuB9iFtHgPjzUpUxvIStA
	zm8dgJtsp+M6e/s+ZJjN1zA7qRTGGcdodJbwNv1pOBHqNb4b9GmfVTGTt4Uvt9WggGf7VZOig3L
	QfHw3d1mjabzwrcDVrMvUX3AgXu/DUxbDM9iBf/ZM3+P/Bfq3eMV5H3Lycd58DxHYpH/QPu3V+b
	ctqMHH6bS5z7FfelcyBuJPH9sn/pWhHY2dIZ2znL2YJudsmdxKwBpS5ZfBdOb2OvKbVGyVh2OJC
	nUphCY7C8bbWb/zu2xQAhdKa3t67S/jqp09x8myTQTSk83RXYj5j7qwxKwmyO5p7JwFveboFnSS
	z4JSYCYxUS5LNX2EPwqFu3cUw0yroyUo9gwUQRIZ/d+ydNerDMxHg9Tr3y4/IT
X-Received: by 2002:a17:906:f5aa:b0:b9c:b069:8ac3 with SMTP id a640c23a62f3a-b9d724369c0mr925680866b.3.1776163236519;
        Tue, 14 Apr 2026 03:40:36 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7d03sm378874366b.44.2026.04.14.03.40.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:40:35 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9d6c8871c7so793705866b.1
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 03:40:35 -0700 (PDT)
X-Received: by 2002:a17:906:9fcc:b0:b98:6926:13cb with SMTP id
 a640c23a62f3a-b9d724361eamr959556866b.9.1776163234098; Tue, 14 Apr 2026
 03:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-uvc-backport-bpi-v1-1-5b62c6798ccf@chromium.org>
In-Reply-To: <20260323-uvc-backport-bpi-v1-1-5b62c6798ccf@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 14 Apr 2026 12:40:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCvC3KmQKryuAJ=BENo+8eH-VfGKfsWTKLjVBt+UHh34EA@mail.gmail.com>
X-Gm-Features: AQROBzBE8CIyPWh1iBfXYTcJKwcNLn2fmHTe43mUfxh1axMbSzXjnJwpY7ixLDo
Message-ID: <CANiDSCvC3KmQKryuAJ=BENo+8eH-VfGKfsWTKLjVBt+UHh34EA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Undup use uvc_endpoint_max_bpi() code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58739-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1E9113F8EE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear stable



On Mon, 23 Mar 2026 at 14:03, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> [ Upstream commit 5b9c75c794ce041e6e00789efef75d71915c4f4c ]
>
> Replace manual decoding of psize in uvc_parse_streaming(), with the code
> from uvc_endpoint_max_bpi(). It also handles usb3 devices.
>
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> The commit: 9764401bf6f8 ("media: uvcvideo: Fix bandwidth issue for Alcor
> camera"), which has been backported to 5.4+, depends on this patch.
>
> Without it, cameras connected to USB3.0 will stop working properly,
> because the bandwidth quirk will be applied wrongly.
>
> Please help adding this patch to 5.4, 5.10 and 5.15.

Is there any update on this?

Regards!


>
> Thanks!
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 4 +---
>  drivers/media/usb/uvc/uvc_video.c  | 3 +--
>  drivers/media/usb/uvc/uvcvideo.h   | 1 +
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 858fc5b26a5e..4ee187a503b8 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1007,9 +1007,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                                 streaming->header.bEndpointAddress);
>                 if (ep == NULL)
>                         continue;
> -
> -               psize = le16_to_cpu(ep->desc.wMaxPacketSize);
> -               psize = (psize & 0x07ff) * (1 + ((psize >> 11) & 3));
> +               psize = uvc_endpoint_max_bpi(dev->udev, ep);
>                 if (psize > streaming->maxpsize)
>                         streaming->maxpsize = psize;
>         }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f868a13280a1..fb69d534e299 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1797,8 +1797,7 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
>  /*
>   * Compute the maximum number of bytes per interval for an endpoint.
>   */
> -static unsigned int uvc_endpoint_max_bpi(struct usb_device *dev,
> -                                        struct usb_host_endpoint *ep)
> +u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
>  {
>         u16 psize;
>         u16 mult;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 95af1591f105..f5bc9fa2c385 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -920,6 +920,7 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
>  u32 uvc_fraction_to_interval(u32 numerator, u32 denominator);
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>                                             u8 epaddr);
> +u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
>
>  /* Quirks support */
>  void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
>
> ---
> base-commit: 91d48252ad4b17577cf8cc8d3e1353402e4da8f1
> change-id: 20260323-uvc-backport-bpi-68368ef14173
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>


-- 
Ricardo Ribalda

