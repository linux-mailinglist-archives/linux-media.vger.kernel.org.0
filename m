Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6EEEE7F8
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbfKDTH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:07:28 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45138 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbfKDTH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:07:28 -0500
Received: by mail-pg1-f193.google.com with SMTP id w11so1662582pga.12
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2019 11:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qiT/RTwB3QsCtVvMpBuYQ/1nWBRVJkE25Jq2NSRmXeE=;
        b=KfC9yMEDspWl6sSTz1vNwX9GAo4X42HiPKedR8cXRKXtxfIE9MHoJr0XDEzaey4xs3
         sCx/3ewbV1C68GnicCxPXcQoxSsVUpOm+xU2lZ80y2vAosdKFZ0UDPvJFDqD+Cho1ybk
         gIu3yqX5gH2txu8Wl9Oge6hBigtKUSay8Egun9BolSGc312ntDFbf0gVg0zTAesJjlB9
         8mAijgYpvdHCyZuisjC441KwI5iQlggQ2m+G5sRo/J/jAUCDHyQ9Kozm3wcF++Lji7z4
         ZCUYa7DaL3Z3EaDw5z7xQcSFWNxJM0kDP91pqk1iYmGB/5tE1vPKtNsobE0TgI8h6JgT
         ARkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qiT/RTwB3QsCtVvMpBuYQ/1nWBRVJkE25Jq2NSRmXeE=;
        b=LNKMA02rN5mNfoT92YHdiQ3D1JfeWvTpGJdIZ3Pymw3K3Ohusi+k9kvwxVdM8F1aiu
         3Xze7XLKEPE4Jv9fElshgvUyQ/819w261YAM5K/inUGdL2W8U+PyXvDUL54KEf4C8CqD
         hY8yHY3wHe2Fmq5hIUF1IUlfAT0qFm+L613bW/T1B5HDjlvS4HMmz/MoC5R4Tv+aePvi
         yAXFxUrDzi20k8o9nuISU7czmchOPOd55hCsT1dYL9eUwaNm2N7YM9ah+oN1tWAg3Enl
         cF30EMNgYLcNHMvAmKQkv78LHkc1vqGDIKQNiLhcRiL4ZrO9kajbEjMZkpnY/jYh6e2u
         j00Q==
X-Gm-Message-State: APjAAAXtXp3E+0gUBqdPVk/llpVFJvtR/a444pV9RA0HwwWGY3TjByoF
        V5JW5Qdf97u+cOa3v7XAufuMXM9k7xaOKBbQ6oHgvg==
X-Google-Smtp-Source: APXvYqx3b2lihMeSLiLX2nU4LDfh6brFpn6cqrHskdQOsliW0tCGGF08K592EVZ7tiGoP1zY0FWbF61ZmZK8TZkmt4I=
X-Received: by 2002:a17:90a:1f4b:: with SMTP id y11mr797567pjy.123.1572894447068;
 Mon, 04 Nov 2019 11:07:27 -0800 (PST)
MIME-Version: 1.0
References: <20191024201240.49063-1-natechancellor@gmail.com>
In-Reply-To: <20191024201240.49063-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 4 Nov 2019 11:07:15 -0800
Message-ID: <CAKwvOdm=L5z0Oqqa797Xsxk0M_=on3bEs7SZePZFNY9kLUU1Ug@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-device.h: Explicitly compare grpmask to zero
 in v4l2_device_mask_call_all
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 24, 2019 at 1:17 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building with Clang + -Wtautological-constant-compare, several of
> the ivtv drivers warn along the lines of:
>
>  drivers/media/pci/cx18/cx18-driver.c:1005:21: warning: converting the
>  result of '<<' to a boolean always evaluates to true
>  [-Wtautological-constant-compare]
>                          cx18_call_hw(cx, CX18_HW_GPIO_RESET_CTRL,
>                                          ^
>  drivers/media/pci/cx18/cx18-cards.h:18:37: note: expanded from macro
>  'CX18_HW_GPIO_RESET_CTRL'
>  #define CX18_HW_GPIO_RESET_CTRL         (1 << 6)
>                                            ^
>  1 warning generated.
>
> This is because the shift operation is implicitly converted to a boolean
> in v4l2_device_mask_call_all before being negated. This can be solved by
> just comparing the mask result to 0 explicity so that there is no

s/explicity/explicitly/

Harmless enough change, thanks for the patch, and sorry for taking so
long to review.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> boolean conversion.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/752
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> I am aware that there is suddenly a style mismatch (some macros using
> !(grpmask) and this one using (grpmask) == 0) but I chose to display the
> minimal fix. If you want me to update all the macros to use this style,
> I'd be happy to in a followup patch.
>
> There are 19 of these warnings in the drivers/media/pci folder, which
> can be seen here:
>
> https://github.com/ClangBuiltLinux/linux/issues/488#issuecomment-545218125
>
> This is the simplest fix but if you all prefer an alternative one, I
> would be happy to see/review/test it. The ultimate goal is to get
> -Wtautological-compare enabled because there are several subwarnings
> that would be helpful to have and right now they are all disabled:
>
> https://github.com/ClangBuiltLinux/linux/issues/488
>
>  include/media/v4l2-device.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> index e0b8f2602670..8564b3227887 100644
> --- a/include/media/v4l2-device.h
> +++ b/include/media/v4l2-device.h
> @@ -431,8 +431,8 @@ static inline bool v4l2_device_supports_requests(struct v4l2_device *v4l2_dev)
>                 struct v4l2_subdev *__sd;                               \
>                                                                         \
>                 __v4l2_device_call_subdevs_p(v4l2_dev, __sd,            \
> -                       !(grpmsk) || (__sd->grp_id & (grpmsk)), o, f ,  \
> -                       ##args);                                        \
> +                       (grpmsk) == 0 || (__sd->grp_id & (grpmsk)), o,  \
> +                       f , ##args);                                    \
>         } while (0)
>
>  /**
> --


-- 
Thanks,
~Nick Desaulniers
