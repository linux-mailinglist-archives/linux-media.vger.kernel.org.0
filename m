Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740742BFF23
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 05:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgKWErq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 23:47:46 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45183 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgKWErq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 23:47:46 -0500
Received: by mail-lf1-f68.google.com with SMTP id z21so21908883lfe.12;
        Sun, 22 Nov 2020 20:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPKKFFttECtrhCNY5oVMatcAdfTTlnNsNes6pooxhN8=;
        b=AYtgLdNIHUUOMX4qY3sqqX7ERuT6JEJceSqzmJJ1/95k6vFS3HpfGn/MiydK0mymyU
         WyujGpaouNbdVeRalvCeVDld8lSd1eW8BGZ1gJH5aeJMJRVa8qRr1Ob8mU2H/ClVjcD8
         MRnduaYtDY+53Axh3Ir4ZipjGI5ccNPIKGoVnWNkPHmzut6NybLQJKUEYPfNg1Y0Jg5s
         CtZIPWxzZkRpvFpO3ic4AhxZKpUTeTjavEoo+WyoR5ZqbIbB00gdQ7bOE95ZRILCdFPB
         2VBxXKJctUPn0pjejpbGrWigoK8/mZCb8YrKUfpyYtziVEoN71gO+vnP8Yp5PXem115k
         2wxQ==
X-Gm-Message-State: AOAM533IMJW6G/9ES6Ep54vu8bvPQV4KbNgR7Uzx8LFqOZqsbWvqnLgD
        Lj16ZHY8tnuTrkK1L3GPdUAcQ/eUg4stcA==
X-Google-Smtp-Source: ABdhPJx578+8Q/xkNyW1vIDXuvs5ZVDTnTgZNRExsmVXLl52xPEFPHW/W/QJM7BVGnbRSb3nXYcVOQ==
X-Received: by 2002:ac2:483b:: with SMTP id 27mr11813195lft.551.1606106864573;
        Sun, 22 Nov 2020 20:47:44 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id m16sm1237091lfa.57.2020.11.22.20.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 20:47:43 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id o24so16564897ljj.6;
        Sun, 22 Nov 2020 20:47:43 -0800 (PST)
X-Received: by 2002:a2e:8546:: with SMTP id u6mr12923580ljj.125.1606106863590;
 Sun, 22 Nov 2020 20:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20201116125617.7597-1-m.cerveny@computer.org> <20201116125617.7597-7-m.cerveny@computer.org>
In-Reply-To: <20201116125617.7597-7-m.cerveny@computer.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 23 Nov 2020 12:47:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v67kS3TfoEv+QsoOawuMOaRU89DY3TvJAruF6Tzryzwv_w@mail.gmail.com>
Message-ID: <CAGb2v67kS3TfoEv+QsoOawuMOaRU89DY3TvJAruF6Tzryzwv_w@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] ARM: dts: sun8i: v3s: Add video engine node
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 8:58 PM Martin Cerveny <m.cerveny@computer.org> wrote:
>
> Allwinner V3S SoC has a video engine.
> Add a node for it.
>
> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
