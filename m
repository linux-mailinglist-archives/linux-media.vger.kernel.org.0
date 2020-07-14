Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F0921F857
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 19:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbgGNRjX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 13:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgGNRjW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 13:39:22 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC44CC061755
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 10:39:22 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id g6so8535317ybo.11
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2020 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=038V87x0NvijYdo71Bgx3S/d5DmmQpMFgI4KR6UKhAo=;
        b=rFj5HYtGzm/8k18kQVPm4w1+T3wtbxt+AhbIaYFOW9P3MQ88kukz95WuGZwv8X+2A5
         k0A1D21iLuUDEBnYN7WaH6t0J4YAR9LAIciQXaevlT6YcEHmVjJfXMeVVsJZeRQp7T9T
         0C3lj8CkZG6npWMprsZYV0EaEao4ZdUJ0RiRFyfagwaZKQRrmy46IJSw03k3Wxj6LB2/
         3NvsX5sq9Dk+F0qQrfI8Vdpcp26SS3JGtkBVNKxrxyZMom7rLH6HC/HhyCjdUxS/zYco
         VZU1zZm2OunuA5NvBQK8CIk9I92OxqOd8XaRnZ3ZyyE+c0sdpVdxNsq+JBuW6V5WjhGz
         xxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=038V87x0NvijYdo71Bgx3S/d5DmmQpMFgI4KR6UKhAo=;
        b=LvDoKI1uo2t1dqGPyvPaTHdRPcAXbcQ7yBlWkf6BBtg7widkTB94KMdxYNYI955R5+
         VzwsacTkdtSzdwaLn+N8nl7fvNLPofSG+HSFIx0tiamqSM26qmVNi6HYXv4ZlCrkdO9f
         x74zxSkWZ1MKo6jso2tNSHwMqnZAdRFWiSOrzJsxg0BgDxBmfScOJhla3eaozEvLoF61
         kRYE3yjt9RUQl/j2dZyf4GZiXPkWvEe9AEMUjMuRuyW43GPzWSPZc6NwIg6lGCY5/bot
         AI8kXPRHdMhAJvE0nH6xP8wodPZ5CknLDXfZT6CDzUNVv/l4pSq1cKjc78sc6vRTAXHc
         j4/w==
X-Gm-Message-State: AOAM531MjnKzDsKowVdUDPB2asRiaaMCJyLjoM5lywKl82Ez9ks+mD6r
        xvkRU3CW+fD97tSU0aDTx6YaFlDXUeYArtYBy5kHfA==
X-Google-Smtp-Source: ABdhPJxgZGsAKhHJS7SEbd7c498Pzk4in1OFuUMsm0lKf4kdWJIr1GE9/HrAP8LqSwGdDr4tPJPxHtRBq9m3D7RNtWs=
X-Received: by 2002:a25:a226:: with SMTP id b35mr9746505ybi.356.1594748361502;
 Tue, 14 Jul 2020 10:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200714063035.8635-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200714063035.8635-1-lukas.bulwahn@gmail.com>
From:   Jeff Chase <jnchase@google.com>
Date:   Tue, 14 Jul 2020 10:39:10 -0700
Message-ID: <CALTkaQ0ur4xVks++7kFowPvLA3b1TAUzt07+uu2T9dPuSuKx4A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify CHRONTEL CH7322 CEC DRIVER section
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(Resending as plain text)

Ack. Thanks.

Jeff


On Mon, Jul 13, 2020 at 11:30 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 7f52faabd2e5 ("media: dt-bindings: Add ch7322 media i2c device")
> slipped in a typo in the CHRONTEL CH7322 CEC DRIVER section.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>     warning: no file matches    F: \
>         Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
>
> Fix the typo to address this warning.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies on next-20200713
>
> Jeff, please ack this patch.
> Hans, please pick this minor non-urgent patch for your -next tree.
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea296f213e45..43661d432b4b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4114,7 +4114,7 @@ M:        Jeff Chase <jnchase@google.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
> -F:     Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
> +F:     Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
>  F:     drivers/media/cec/i2c/ch7322.c
>
>  CIRRUS LOGIC AUDIO CODEC DRIVERS
> --
> 2.17.1
>
