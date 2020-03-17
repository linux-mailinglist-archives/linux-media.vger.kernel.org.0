Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1194D187EF6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 11:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgCQK5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 06:57:32 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:38593 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgCQK5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 06:57:30 -0400
Received: by mail-ed1-f48.google.com with SMTP id h5so25826363edn.5
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQfER8B4qtqmMh0NuKS647yxwy4gMAfjJIBVIPI37DE=;
        b=VbrRPZazQVfmbWF9YeloGgmrQrF1BNjPMZVvJe3oij/XGfzNcPBdeJYwztkas3IHjR
         b3NGShrioyMFQuje5QQ5JOHKPS3gK8BFom9W4rTLQka95PI/qUSmblvaKjy5iTpWVnEX
         GQW7LtfAZfqv+rbuK5ZqhZhMzjL7mpZnhoOo9v5DVJV5yrhvBje2npLfvNeqO5KlfUBE
         Yp1Tgs4fq1lViN6WJcLU1Ks5Izh+9eDDowXw1IhV5yL2ZJQVOMoVVy0AHlvIZVt57mAX
         F/RivvpM48QAndTumMvwAck/JRk2jW5+orynYSllwh5sdmLTgEpkli8TKyqOHXWY0bei
         8hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQfER8B4qtqmMh0NuKS647yxwy4gMAfjJIBVIPI37DE=;
        b=KVILJ9t/SYlX+8lxLdvb5tbn3jUM41QNWDYsLQnq/i6iGVAK9ukKm85wc6Dgj/Lu7K
         AfDnFOG1oRAcHuBaKDv7CBE9oZiHSqqQVxb5MG5PaxFt2b0t1iJItR5frRsPg6wHExNq
         5HApK2TGBEVqSHNWxUbmLi+lQAPConC/SQLo1q+Ky1goZ9gT1kjCZWMT9Qgtb3e5b9Ij
         SPo0Q2+xbV2ylGxBIDLTvRBfhmsKmRTvZBfGhTBxbUw3eFAlhFhJ6sKbpBHPD04uoZON
         I/tZ92FWMfA1l0FX0rR5N57uaPJh+wXk5HOYunPbxC3ayKSqc1oUKy6aHOCL+duZs4D/
         +75w==
X-Gm-Message-State: ANhLgQ3Dom1nwrb6lTyGbTRVaRz1Iak2CJfipB6vvKkvxTQV33OwPHT0
        vt956QRvCzfavDEUJZwXPth+WmpPEBqHnnxx0iie8A==
X-Google-Smtp-Source: ADFU+vu4zV4E2dYpqW3tRTRAx2wSY0lo/5w1u/cD1MZUvtjTojGjVAoF8zz+fT0r20NQQoGgSvkGds/OdlEHQHE9HDw=
X-Received: by 2002:aa7:d551:: with SMTP id u17mr4675006edr.69.1584442648998;
 Tue, 17 Mar 2020 03:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <d0510b81-9ae1-9b6f-02c5-f4eb08e67bfa@ti.com>
In-Reply-To: <d0510b81-9ae1-9b6f-02c5-f4eb08e67bfa@ti.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 17 Mar 2020 12:01:05 +0100
Message-ID: <CAMZdPi9GxD6WXtwf3mMBqbJMJjoyccS5fRPp7P2hngRaCxV=dg@mail.gmail.com>
Subject: Re: OV5640 CSI2 problems
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 13 Mar 2020 at 12:15, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi all,
>
> I've been testing and debugging OV5640 with TI's DRA76 and AM65 platforms, which have the CAL IP for
> MIPI CSI2 RX.
>
> The most clear problem is that 1280x720@30 doesn't work at all, but with all resolutions I can see
> occasional PHY errors reported when starting the streaming.
>
> The OV5640 spec lists the video timings, but I haven't been able to figure out what exactly they
> mean, as e.g. the vsync time doesn't seem to match the other times according to my calculations.
>
> In any case, I was poking here and there, and noticed that if I use the htot value from the spec
> (2844), instead of the current value (1896 for most resolutions), 1280x720 works, and the PHY errors
> are gone.
>
> Testing more, I found out that the smaller the htot, the more unreliable the RX becomes, and going
> down from 2844, somewhere around 2400 I start to see errors.
>
> I'm not that much familiar with CSI-2, and very little with OV5640. Does anyone have a clue about
> what I'm observing here? Does 1280x720@30 work on other platforms with CSI2? Where do the current
> OV5640 video timings come from?

On my side, It works at least with dragonboard-410c (Qualcomm APQ8016).

Regards,
Loic
