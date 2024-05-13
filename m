Return-Path: <linux-media+bounces-11424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B98C4470
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 17:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94E8D1F21503
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FA215442B;
	Mon, 13 May 2024 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="bxowhpyo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C6179A3
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715614861; cv=none; b=kQ13fBhrDX/d/Bbb2l6WVVwFtji8a+WFWADDLxdk5gwgdytwPcQTqvyMpiHvtFuo0fVEg9C3l5xQjrkQ+oeiJYtDsQFvMZSHV/8/qT2cB0wF5VAtZGEQDGCGekl88JkGmhKjHG5eXDDCHJ8EyCYQT0T15GcrHYCfotix6zPass0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715614861; c=relaxed/simple;
	bh=wHKEZbQUZVYxYt3LAKyPkvpG0nPT3mqW10hZPgBROjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvTQwnAG8YCsuhxc7cN7xA0qPTRaPbT4E6USaf93ZWWTIEhahcS60NGs+YQ0scrNCyI1Cny0/x8A9Bu3UcqsQtfh/48mzo44koIPgy3REOiK4/awPmBwsJY0zUbnLrSFh4QabsdmiPaW7K2CSK3MbkagMVCHJlUxDPTh0qj7oVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bxowhpyo; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de462979e00so4824842276.3
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1715614858; x=1716219658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TY58HYrJhzATwEHDXuxnZ28lxXbALZKK2NoSFF7u4PA=;
        b=bxowhpyo+tda3jH1zDxBtmo03ZZ3cUtAfEFLEJsBfZMBiRENy7ymXjMfZvrWzMYk7s
         /DOkJV/JJmTjkQcBKAv8Tw4hOaYvjcZhQzRA4ZD62dU1gQlQePGLYEqKhAc7fO3UPGT+
         95sYgclo5zKQKDt2+wF4lhO8f/g8i/fVUSibV2WqJFDWvlNJrC5Mbm6PPN2Lmzv36Ba6
         7aEtyZKejv7DA6DI9OxC/G5+ds6HKlssHiSdScuQqHDETOkN7jUAE4nzUOQuH7SOSvAy
         uAm++sQvLfbUJmikijj/efET4kFF+EYpCUjSUZdGMerGZc4dVeydd4D2vZZSaLJ76e4G
         hHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715614858; x=1716219658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TY58HYrJhzATwEHDXuxnZ28lxXbALZKK2NoSFF7u4PA=;
        b=tArEpJ1h8LOWB04gEBjSv61pmluECGmhaFHI5XsJUjgOy1rV+t4gJO2kCPLwo2Sypk
         RVfEz0tglGdaa2wq503NTgQONs1CEIysFYom/aQre6nxD9L18CS7+EqOjDIhbi8bgIwb
         XzGaRwwHv9IqOT8i3tWaRu9EBHTCWemPPt8L8717Sf8FZZ6EzctlIVhM/Dd6w2mOd7gT
         XfXbLjfMg2FoqivIVNyix9VLRivrOxn5Mwlu8mHbrG3mcm0s1HbrXF8TFtzH0SH/JnC6
         v2WR7QZy7uHAjhre211/8P2dWO6s9DXxwYuKUtXr1q22EtQPEDfPjy5eMRHqbX4W75hx
         VvxA==
X-Gm-Message-State: AOJu0YxxYD3wT37aL5DzWaKyXv8bN4GFEEw67aWJPaEPMcp0n5nDeuqQ
	JIp3PjA8oyl25frZlM/zjDja+5BsCtimKfKb7mnk38KhYBhZVQqXlHCH3iYoeitTDYeIZN0R35H
	UKb0RfDmIdAdwZEYW6vRUIdWjWxSkRCJZvHI0vtYL0/UEu7n9
X-Google-Smtp-Source: AGHT+IHlL8c+5L/bAQh8FhUSxSnvyWaR0kwDWSZfsIwO939jo7OrUdxLwUlr7VGvpGJPpXmIQ7sYOcV99mkkDbKaLiw=
X-Received: by 2002:a5b:5cc:0:b0:dbd:be40:2191 with SMTP id
 3f1490d57ef6-dee4f3a9dc0mr8631869276.42.1715614858426; Mon, 13 May 2024
 08:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240512222104.24646-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240512222104.24646-1-laurent.pinchart@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 13 May 2024 16:40:39 +0100
Message-ID: <CAPY8ntABWEkp43eE1C9U3a0fLMzXa+vT=wKN39QTBo8W+fTEHQ@mail.gmail.com>
Subject: Re: [PATCH] media: bcm2835-unicam: Depend on COMMON_CLK
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Sun, 12 May 2024 at 23:21, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The bcm2835-unicam driver calls the clk_set_min_rate() function, which
> is declared but not implemented on platforms that don't provide
> COMMON_CLK. This causes linkage failures with some configurations.
>
> Fix it by depending on COMMON_CLK. This only slightly restricts
> compilation testing, but not usage of the driver as all platforms on
> which the hardware can be found provide COMMON_CLK.
>
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405112243.2MLRT7li-lkp@intel.com/
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'd looked at that test robot failure this morning.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/platform/broadcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
> index cc2c9afcc948..32b76ebfcd9a 100644
> --- a/drivers/media/platform/broadcom/Kconfig
> +++ b/drivers/media/platform/broadcom/Kconfig
> @@ -3,7 +3,7 @@
>  config VIDEO_BCM2835_UNICAM
>         tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
>         depends on ARCH_BCM2835 || COMPILE_TEST
> -       depends on PM
> +       depends on COMMON_CLK && PM
>         depends on VIDEO_DEV
>         select MEDIA_CONTROLLER
>         select V4L2_FWNODE
>
> base-commit: eba63df7eb1f95df6bfb67722a35372b6994928d
> --
> Regards,
>
> Laurent Pinchart
>

