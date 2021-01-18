Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0AA2F9AAB
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 08:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732943AbhARHjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 02:39:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:44698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732932AbhARHjO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 02:39:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A9F222228
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610955510;
        bh=DDynyscYZVUVtAXV53NQJEWwa5ZbVTJGt5KWs6jiOkA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cGc3/DewOzlbK60pFesw2sjl3veD+63zIUTHeQW5ujISiHGxTrp7qiq3Dn2ijIK7p
         xd8jzU8p667CJuDFrJY6uGZhxLrCy0vrIot1TbhUtCpnBIMnIvwrmhlttaUCsDcf3X
         BON8p6oyLx7wk+qcSKomw3q2J9d8IACR+MpAXHUXeSa4IRdPiKzB1O2bdAQqMnq0Fm
         pm8qDIO1IKn+5RB2knx5rwg2GqmxnmvvQEITq3dW06sYBnUoclKRF38QtfWq3A+3BL
         PpwsjDtocGbSJFoAsAYepXJ4BhGlgplxypxXV6XzNixKyQPub04itN2SCSpE6as92m
         vvDT12XV1PnaQ==
Received: by mail-oi1-f171.google.com with SMTP id s75so16841288oih.1
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 23:38:30 -0800 (PST)
X-Gm-Message-State: AOAM530rn5KwCgLd6xE5TyFfZtXW6ASzt+kapm/+dMft227AJ8RMnenL
        WFa5JScIdNG31xs6MzKxrNpguqaNvbwQK8eGwGg=
X-Google-Smtp-Source: ABdhPJzVyv7FNiO8ag7bsR1zR15MpEblMRrZCubo2/E9mKvs8VubaL6tRjOoN0E/MIfJyfs9AwVGAzKhhoyGnF/F7rY=
X-Received: by 2002:aca:e103:: with SMTP id y3mr11821406oig.11.1610955509494;
 Sun, 17 Jan 2021 23:38:29 -0800 (PST)
MIME-Version: 1.0
References: <CAHoAvW8+1jAirPQPQ-WYYD5fyngckrXA+dLTX+H2ysGzOKUZRg@mail.gmail.com>
 <CAHoAvW_Cju=0svzAExJDuXP9NBnz34Lut8M2+Y9RHUtMXfxJqg@mail.gmail.com> <CAHoAvW8k77_ckRdAGGTsu4ALhw4=TUPa27knK3x9zR3bjvjbUw@mail.gmail.com>
In-Reply-To: <CAHoAvW8k77_ckRdAGGTsu4ALhw4=TUPa27knK3x9zR3bjvjbUw@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 18 Jan 2021 08:38:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1du9ypzvLk3yoF3FNX8BSvSDSdXwWEMQzuFsVm96w1nw@mail.gmail.com>
Message-ID: <CAK8P3a1du9ypzvLk3yoF3FNX8BSvSDSdXwWEMQzuFsVm96w1nw@mail.gmail.com>
Subject: Re: [PATCH]media:dvb: add compat_ioctl def for dmx_dvr
To:     root jason <jason.root.w@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 18, 2021 at 7:21 AM root jason <jason.root.w@gmail.com> wrote:
> From: jason.wang <jason.root.w@gmail.com>
>
> add compat_ioctl define for dmx_dvr to handle ioctl when CONFIG_COMPAT is enable.
>
> Signed-off-by: .jason.wang <jason.root.w@gmail.com>
> ---
>  drivers/media/dvb-core/dmxdev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
> index f14a872d1268..4a9e027de827 100644
> --- a/drivers/media/dvb-core/dmxdev.c
> +++ b/drivers/media/dvb-core/dmxdev.c
> @@ -1393,6 +1393,7 @@ static const struct file_operations dvb_dvr_fops = {
>         .read = dvb_dvr_read,
>         .write = dvb_dvr_write,
>         .unlocked_ioctl = dvb_dvr_ioctl,
> +       .compat_ioctl = dvb_dvr_ioctl,
>         .open = dvb_dvr_open,
>         .release = dvb_dvr_release,
>         .poll = dvb_dvr_poll,

This is correct for DMX_SET_BUFFER_SIZE, which takes an integer
argument, but not strictly correct for the other ones that take a pointer
argument and need a compat_ptr() conversion.

You could do it by either passing both the 'unsigned long arg'
and the 'void __user *argp' pointer to dvb_usercopy(), with the
pointer coming from compat_ptr() in case of compat, or you
add something like

         if (in_compat_syscall())
                   arg = compat_ptr(unsigned long arg);

in the function itself. I checked the DVB ioctls to make sure that
no other ioctl commands need any special handling, and found
that DMX_SET_BUFFER_SIZE is the only one.

          Arnd
