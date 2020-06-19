Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE84200106
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 06:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgFSESn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 00:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgFSESm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 00:18:42 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA0FC06174E
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 21:18:42 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n24so8741953ejd.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 21:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OBVOSPQebXOCEZo3hJ4byTOYq/vHfy/GXP3b5hiGIao=;
        b=1KoMNID9i/qIh3Pp2XdmcvCSH18XDvfNtdiWM0+kht9s5e8hJa9MY7UlyZ8sidy4Fx
         +GotI2CP+Pyxhhs+ibnSbZTodcTGgdVsnkxERXadXpq6CMh0QByu0zaUAN7Qfxv/707h
         fjAt9/ffbWYxbF30h2vjX6kLcrzmbc/zP9HDxpr+EhIWIhnb7f+5isl7mJjX6a4KcGrQ
         xVtB6eUFIUZUjkfsrACXaRSt1gov9xT9JQG9GdvECDCgWS//vrp9ZFPthh0xaGst1uX3
         qtaJpu6OzNkWKGn26iTf5oGNlKD1L+lfXDxIrLlt1uapoocKK0iQeGVTdsl63AVgKXxR
         RhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBVOSPQebXOCEZo3hJ4byTOYq/vHfy/GXP3b5hiGIao=;
        b=O2WJFHakEnGcNFIWxnv957uV4JARenSMwc5BOCwN/laQEVeskNtXtfMuU9TqUuEqGe
         ZsBXcshBa+KFPNq+ZqwQYWFJZhLi7HnJiK6MuIkWwk93Tx704i932yzxEGEFxImd4oLB
         sPmA01EJynIgdJB+N8zQs5FXsFUj3T5SMipjiNmiNACcNmxxwKc1x/Er+1oQvniFtnLF
         Kcxf2QqCLAPphGuFNO/tDdlRCTXgOlP7h9ASABUCShypUIVsb1pLOSyqNLLDZD0BmEaH
         qialFvcQrKZUOjpiu03T0ITewnnH206gHdpRi1Y6oMna92zhe/G1lrJ4HGcqFtXIMShW
         Nbbg==
X-Gm-Message-State: AOAM533xOCVa01HZ7EdFv3PQ6Hrcg8/oUqXo2LxqeVhVpDM2IN6tDbuR
        BaK6LNAInzXDUNkiq7Vdpx0TTsk+5IaHsb6TgLpx0fqb
X-Google-Smtp-Source: ABdhPJzVzMaTtrKLi3M68XsYicwniNaGPfEUqS33u1DzkyPETCTKJ/izzPXqGjhnCoXVJaRD7JWmC0fkIdyOBezbUuU=
X-Received: by 2002:a17:906:51c9:: with SMTP id v9mr1784899ejk.337.1592540321011;
 Thu, 18 Jun 2020 21:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com> <20200614235944.17716-83-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20200614235944.17716-83-laurent.pinchart@ideasonboard.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 19 Jun 2020 01:18:28 -0300
Message-ID: <CAAEAJfDLv-hx=4JL2=+AgU1c8bcLhNu8_ZGu8cNtkXDVLx8H3A@mail.gmail.com>
Subject: Re: [PATCH v1 082/107] media: ti-vpe: cal: Move CAL I/O accessors to cal.h
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

On Sun, 14 Jun 2020 at 21:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> To prepare for the split of the camerarx code to a separate file, move
> the CAL I/O accessors to cal.h. This requires renaming the accessors
> with a cal_prefix, as the current names are too generic and prone to
> namespace clashes.
>
> The reg_read() and read_write() macros, that cover both CAL and CAMERARX
> register access, are split in two groups of inline functions, one for
> CAL access and one for CAMERARX access.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-video.c |   1 -
>  drivers/media/platform/ti-vpe/cal.c       | 280 ++++++++++------------
>  drivers/media/platform/ti-vpe/cal.h       |  36 +++
>  3 files changed, 168 insertions(+), 149 deletions(-)
>
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 82b32a2f9db5..df472a175e83 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -9,7 +9,6 @@
>   *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   */
>
> -#include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/ioctl.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 0bc02ba52b59..abeded3b5e6c 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -9,11 +9,9 @@
>   *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   */
>
> -#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> -#include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -133,33 +131,6 @@ static const struct cal_data am654_cal_data = {
>   * ------------------------------------------------------------------
>   */
>
> -#define reg_read(dev, offset) ioread32(dev->base + offset)
> -#define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
> -
> -static inline u32 reg_read_field(struct cal_dev *cal, u32 offset, u32 mask)
> -{
> -       return FIELD_GET(mask, reg_read(cal, offset));
> -}
> -
> -static inline void reg_write_field(struct cal_dev *cal, u32 offset, u32 value,
> -                                  u32 mask)
> -{
> -       u32 val = reg_read(cal, offset);
> -
> -       val &= ~mask;
> -       val |= FIELD_PREP(mask, value);
> -       reg_write(cal, offset, val);
> -}
> -
> -static inline void set_field(u32 *valp, u32 field, u32 mask)
> -{
> -       u32 val = *valp;
> -
> -       val &= ~mask;
> -       val |= (field << __ffs(mask)) & mask;
> -       *valp = val;
> -}
> -

Slightly unrelated, have you considered moving all of these to regmap?

Perhaps it will make the code more maintainable.

Regards,
Ezequiel
