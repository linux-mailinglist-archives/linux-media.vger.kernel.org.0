Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C39519225A
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 13:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfHSL2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 07:28:42 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39495 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbfHSL2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 07:28:41 -0400
Received: by mail-io1-f65.google.com with SMTP id l7so2688861ioj.6
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
        b=VomSogBR+Rjw/zSHOgYzWP0EPLOWDtlkOX71pe6ugmjomlrnQcTpcjmO8sKNJJVF88
         eBBJwuHQMPRsPnPRI1d3VWz79WvjiSugyn9jqibRlINZRgvgDoPjI2EtLD1fnsLV99c2
         ShCoueTKwSrH6XIpq3jwrrr8LQOc+bXuyUl/de11l4GYIgokqYrOeou3Ki93L+WqlQJx
         GBubyAUF11lufOEIB4UNoLNvXP6xnBfxBWyQ5xpZJrGplgu4FdH8bkcGeEjP/ZaKEtLl
         6ea5JCPDW1r6tJ7EqnwrgEoniW2UAOXZ55UlUK2Muaf/SGJ0KQMtvI49SO35Tby1zv3b
         l6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
        b=S0CxTuyZCyRkfnM10I/AflQyvRvvXJQmFUiZKiM06bMIqva6VCWyK6HsaScZNz++JI
         9DuAQJplUKsQTT1MDNU2ZKKj3PnvWsWlMyZetR+DRWW9jxMzkh9Sv3Q0ZuXlkUpxMpyp
         uNg5HbtFDIzaxeEpzmEIoPM2O5xvrXlevrytrpRm7RxCNtXwpUzinc3IkMsQtNHzYOQC
         L6iWO1V4Lcy3klYaD5X+Vn7txpDQo4wm7OawsN4bX6o8h6LTJbBBHI4emo4K8ZbwrC2v
         jA3vmMAWMklUBuyEP/GiURGTT/B5LWkEwTQztCpFkLF3ADWjL+x4fuWm2SzNfF8mEi6I
         fS3A==
X-Gm-Message-State: APjAAAX3FZ3UBY66osvGFchNYJuIRbrDXHoWxl2u9iDX2NZJ90QBGIl5
        kCWKTVPnFXu5UBVX3iBiSqxt40io55JBTn77h/j44g==
X-Google-Smtp-Source: APXvYqws9l57+4N1t5CybQVbaJVVd9Nfbb44LfgnzTxj+oSX0EqosHdKwwu2xUgfJeO4/2mhYPOE0MJ85EFvW0XmVeo=
X-Received: by 2002:a02:ca0c:: with SMTP id i12mr25223915jak.82.1566214120815;
 Mon, 19 Aug 2019 04:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com> <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
In-Reply-To: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Mon, 19 Aug 2019 13:28:29 +0200
Message-ID: <CALFZZQHu1C_8idxkwjBdxpW=y9gKmDnLOeTHZ9iAkNo7YubZHg@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier API
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-samsung-soc@vger.kernel.org,
        David Francis <David.Francis@amd.com>,
        amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        linux-arm-kernel@lists.infradead.org,
        nouveau@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
        Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sean Paul <seanpaul@chromium.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Thomas Lim <Thomas.Lim@amd.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Enrico Weigelt <info@metux.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 19, 2019 at 11:38 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi all,
>
Hi Hans.
> The patches in this series can be applied independently from each other.
>
> If you maintain one of these drivers and you want to merge it for v5.4
> yourself, then please do so and let me know. If you prefer I commit it
> to drm-misc, then please review and (hopefully) Ack the patch.
>
> I would really like to get this in for v5.4 so I can get the userspace
> bits in for v5.4 as well through the media subsystem.
>
> Dariusz, can you post a v7.1 for patch 5/9 fixing the typo?
>
Done.

I think it would be good to test v7 changes to dw-hdmi and tda998x on
a real hardware. Hans, do you think you would be able to test those?

Thank you.
