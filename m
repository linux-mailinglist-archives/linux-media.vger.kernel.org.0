Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108AB4896BD
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 11:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244248AbiAJKvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 05:51:13 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:36384 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244239AbiAJKvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 05:51:02 -0500
Received: by mail-ua1-f49.google.com with SMTP id r15so22642855uao.3;
        Mon, 10 Jan 2022 02:51:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7lKB7LPyy07fwqNZkXQvWdDl8rNbAh7GVFzkcYGJL+4=;
        b=mQsTZmFZMJkGpHWM/8TRQT2yiMq2Cn9i8F40fUl/frZX3ciRsn7jtZudPEa8br4RDC
         0IpyAiJIsZ2G9jxb/A5t4RVDutrI92gGzjvHPD4Aeq4kbio26BIONjzOq4m9E2WuYwvy
         eVkfl8+mHzayxmiEtnCs+sqqhDjwsWROApCBC+gjXW7p8Ion678Lk8RfNKghjFTeZHK7
         VGeeVq54sovTKoaRlttYDyLbT3ajDTmspwzKVNtY6IqqqGNn7cuIUJRn386DnoIQ60OY
         NxYtE0oZQh+MiBNry28fsnon3Dq0murYNlA/MR5vZURqpmkY8P41anwk+0zP352sKjAb
         QriQ==
X-Gm-Message-State: AOAM531RHmJ5DwKHUyUcy1otdJ4nNzX3KdjC2SzoKZZ3m+9Wh/lVy7kD
        s9PyPze+pHDiNvl0gkzPFG6eGuOQP0NGvg==
X-Google-Smtp-Source: ABdhPJxSxprVygfc8AWWx8au9xHjS4fasIuLCIrGmc582S07e1DSVdbNzW75hhRoFjYLv1Yd3iOxOA==
X-Received: by 2002:a05:6102:304f:: with SMTP id w15mr24355992vsa.82.1641811860809;
        Mon, 10 Jan 2022 02:51:00 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id s12sm3904796vsj.26.2022.01.10.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 02:51:00 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id b77so7809946vka.11;
        Mon, 10 Jan 2022 02:51:00 -0800 (PST)
X-Received: by 2002:a1f:384b:: with SMTP id f72mr807514vka.0.1641811860022;
 Mon, 10 Jan 2022 02:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20220102224803.27463-1-laurent.pinchart+renesas@ideasonboard.com> <164116567398.210256.8635439327374336545@Monstersaurus>
In-Reply-To: <164116567398.210256.8635439327374336545@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 11:50:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_D2Dn0q9y4T=nOe7j1C+EECg=xg_VSvmpgrL-svoD4w@mail.gmail.com>
Message-ID: <CAMuHMdX_D2Dn0q9y4T=nOe7j1C+EECg=xg_VSvmpgrL-svoD4w@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: max9271: Add header include guards to max9271.h
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, Jan 3, 2022 at 8:48 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> I wonder if we'll ever #pragma once outside of /tools/testing/selftests.

Probably not anytime soon
https://lore.kernel.org/all/CAHk-=wi13+FLcRo4zmnRUmmY=AAns-Yd5NR_mVdcAd6ZrPq2fA@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
