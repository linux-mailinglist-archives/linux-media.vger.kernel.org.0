Return-Path: <linux-media+bounces-38660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE4B1625C
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 16:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FFA85682FF
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 14:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A9A2D9794;
	Wed, 30 Jul 2025 14:10:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBFF277036;
	Wed, 30 Jul 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753884656; cv=none; b=B5hXT4o+yd3Q5WnZmL7jlZp3HgrFASGiUrGYTBXuYysqnRcuDKB9QYKW9ObLMD+CyAnxZaRM71nL4TjQk8aEkqIo+4ZTrzygsfEql3AWaLGrSfcpHN2mRUxzOpoadssKG+qAwoE0f8c8GokBmYMhHakuzug7DHFHoTVUjblGLxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753884656; c=relaxed/simple;
	bh=5ws017ro45wbenQFBjg0rUTLyw2naT3DUbBsCdHxZ4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsUWVn3oiXVOKAmcXQUIjuPhMGo4EZhNiTgOOJSg4egjGUbjMj+C61+nP1j/GkBo/m80brc6JF914iu3tl1qFxsLKlR6JeXq9NlGlJnQ858to9uOF5C6rvKvz4rWz+Ko9aMOViLl3EbjZCbdbJQyNSfSI9qLSC6WTMCrjNP1Tds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-615da180061so3413277eaf.2;
        Wed, 30 Jul 2025 07:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753884653; x=1754489453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zx3AWQDFRk8H84CG7YO/9K305ZWz0jlqkXOZNrDtzb0=;
        b=VXOfN5QuqsR6BQaT+bQiHSRW2VB6IIfqxnIUfa0XKDLEcM0rqWRn86ZqI8Nqqd809B
         CbkTo5UAbuYi0I+l5CzHlMXYKfZLWXheiy8KEEHJGMn9lbkP5Pqd9ln1Uhc8as8Lpa3P
         b23OSlQMyxUu5Bw3kRCTp6PDWGDTxd/rulUAwk7Ue19d7cJuL45F8f0nO7ZCgtbLFRlB
         j9kaLTaoHJGBEhzCMbT0qzsP6MYleexQHhE0IGoNUBfttJ/y5fNeWAODWaIhr9pT8VvF
         HxZL/q+7Vy+JA7G8tRP2WpQvNFfndlVrM7d7l56deFE3C4WyUdSsYPhjlf1VhVpErYby
         wbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU89Me7+i8d4y4eMPXTGLn5MLqMqnu6Ibq695OpDUkjSZ0P0TDN9RXKDI9SsFsPv6YiGdJMHQw8Wpzf@vger.kernel.org, AJvYcCWUV5KljEDwoFb88UEb8FejN71brXk7gTuojsbpdDtM+E1h4ZtCXshkqikWQV/dowqjcBS2eUAR9sHcoSxF5kncD5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmN7AYTpHrBVDplbNopQMaQZCHo0xomv5sVuF5/EVuprT6+cja
	v6PH21LyWAsCo5RZu6ZMJhZLo28t9eJfEyNtHgzdut6DbOU4F+BWljLhxg5PjwuA
X-Gm-Gg: ASbGncvapEuZhjoUvPplWjmhP4u6afEl6ut1+si64tzzZLe/bxwYlt3++tF1Yx/56jd
	6HrnwmEyQjRmzGqLgTqPQkSm5agIAZCDIiazlq0pZIq5x36QoVqfa+RprW/pAfUml60MF6G3hi4
	hVfs0qo9RskOL4UB9sJOtzuwnA+AT4YmiF5mmV2xV1ohXkRqB4wa1nao3sBNv47sRKEt2FwSyjK
	VXO8ywoPbKDBRpAZM8k5Na14gG9GlSKCJyBk9Q8lXLrucyPj7NhrMq9eEn1brhauB016qWi66lq
	nlFobsnegvBlgEyeFFhHIxaei8pDAQ2FEPtbYNWqGhwg9QcHrfrLTfViNC+pXYsUoOIOTBbrGtm
	29+29HUabeSCBVYTp6Z0PAxTGgBUQ4uJJVmaV4ykwyVd+GXqa/mSCEtfV8KoqMhLmKsRqHzg=
X-Google-Smtp-Source: AGHT+IF1HeIBjum9uEJTREj2nM8F+d2yLSGSA08mR9195zPwTbtmR0hFGASqESBz+Y/5OauT6tzCdg==
X-Received: by 2002:a4a:e90b:0:b0:618:f6cb:3081 with SMTP id 006d021491bc7-6195d44690fmr2218677eaf.5.1753884653168;
        Wed, 30 Jul 2025 07:10:53 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61965bf791asm146184eaf.6.2025.07.30.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:10:51 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6159466e80aso3305294eaf.1;
        Wed, 30 Jul 2025 07:10:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9Ye7PUg21JWWXY8WNd+8yxlbTPeXlV2Al9Gtdu8LgQzEUyz3aNAvgJ19/H4RoVJFxp5zVOYn+8HvDlTIWnhgRvcA=@vger.kernel.org, AJvYcCXs1A07jTw8gvEgYeAnH3bvUsCQb5MdI5tLYw20KXky61bnHu2BylhghGeOVCSQIjc3eZniOqXvRu+J@vger.kernel.org
X-Received: by 2002:a05:6808:1993:b0:40b:1588:e005 with SMTP id
 5614622812f47-4319a080ae1mr2246245b6e.10.1753884650448; Wed, 30 Jul 2025
 07:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com> <20250714-ivc-v4-2-534ea488c738@ideasonboard.com>
In-Reply-To: <20250714-ivc-v4-2-534ea488c738@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 16:10:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhUiPiQsK_gWhb_B9mEhwM-KBg7WMzq3bPBpbzxxWRrw@mail.gmail.com>
X-Gm-Features: Ac12FXzKd0wL5SegKSGvshG5HuXUQoVw7DmvJwil2vl7RK2bGFZ-8Y4uplsYAK4
Message-ID: <CAMuHMdXhUiPiQsK_gWhb_B9mEhwM-KBg7WMzq3bPBpbzxxWRrw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: platform: Add Renesas Input Video Control
 block driver
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Mon, 14 Jul 2025 at 17:19, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Add a driver for the Input Video Control block in an RZ/V2H SoC which
> feeds data into the Arm Mali-C55 ISP.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c

> +static int rzv2h_ivc_get_hardware_resources(struct rzv2h_ivc *ivc,
> +                                           struct platform_device *pdev)
> +{
> +       const char * const resource_names[RZV2H_IVC_NUM_HW_RESOURCES] = {

static

> +               "reg",
> +               "axi",
> +               "isp",
> +       };

> +static int rzv2h_ivc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct rzv2h_ivc *ivc;
> +       int ret;
> +
> +       ivc = devm_kzalloc(dev, sizeof(*ivc), GFP_KERNEL);
> +       if (!ivc)
> +               return -ENOMEM;
> +
> +       ivc->dev = dev;
> +       platform_set_drvdata(pdev, ivc);
> +       mutex_init(&ivc->lock);
> +       spin_lock_init(&ivc->spinlock);
> +
> +       ret = rzv2h_ivc_get_hardware_resources(ivc, pdev);
> +       if (ret)
> +               return ret;
> +
> +       pm_runtime_set_autosuspend_delay(dev, 2000);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_enable(dev);
> +
> +       ivc->irqnum = platform_get_irq(pdev, 0);
> +       if (ivc->irqnum < 0) {
> +               dev_err(dev, "failed to get interrupt\n");

No need to print anything, as platform_get_irq() already calls
dev_err_probe() on failure.

> +               return ret;
> +       }
> +
> +       ret = rzv2h_ivc_initialise_subdevice(ivc);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

