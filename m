Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122C1135391
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 08:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgAIHN5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 02:13:57 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34970 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgAIHN4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 02:13:56 -0500
Received: by mail-oi1-f194.google.com with SMTP id k4so5057456oik.2;
        Wed, 08 Jan 2020 23:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fiAFQtFUwFWdNOhh+Eg7UU9rxYfvjrXKHQ0J5ZCCP5w=;
        b=oH+j2IDm8TIe8TKnEyvwYCKw3+LwczR3mBJig2UALv8he2fPsNghRzlbV2VMdPEZ7j
         fZEilEQ31yNGElzAe8XGp1YtjcEsI9igG/YF9/nFWM3I0e5UWsZaehdCukHKkzIusYBN
         uVP+RgcN/HLaesXVKDg0FkwRyWjAlMDvktCfuAvU1qChE5C0vlZfMjDTGahLIdVjUGA5
         YKztgB7yV8yrewOwXGQ4bJgl3XxlSXJxLyXX8Ykd+vGoMwC5qy7JPEaz7U82gJzHOZsj
         jsejjFUy35zlqrAcbFY+//9mQnR0xZ5sIDVioWwbS1f6j5b0HzYIY1xIB+Xh8DfHs1s4
         sVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fiAFQtFUwFWdNOhh+Eg7UU9rxYfvjrXKHQ0J5ZCCP5w=;
        b=ZXKEStntThU3/byrkB5ydYMQCopnKGXqGFBK9g8FcJcDdO/7e3MmJOETI4WEdw4qKX
         JjFaO2FmmhG2pjAzl7QE93D/KqtyDCnHB86WA3wRNqyWh0BFYYWiNswDIS2V/o7IJ465
         XKQLUX74xCgJHW759LA2AVLDA99ee8eD3Efzf7N2lMO487A42TIoPA45joG9F31kaB+b
         4iszXOc2+F7/SaHlNpTBMmxOW+Zo7G+SIlDujnBU5G80+vEAghjveGfwzAOnToxYYOP0
         HUkAWC+9O5L0sURLwgobtgtod1xjcXYzL8eZD899EYXhGTCO79RCSeplZgP0j0ec9fcD
         +qQQ==
X-Gm-Message-State: APjAAAXv1BmmH48ysLn5NTlJrhYYuld0q3uk0asLnYgrpmu6B0z2aVkH
        xLMRKp932yKpapd/Ss/+X2WPdgkY2kMSzZjfdJ+UKwghE6g=
X-Google-Smtp-Source: APXvYqx00LpWZXNay/Uh1jRjw0RdrMJd2loxMSm7NVNPkkPND61Yt+rAZXlEnUB9Lpmmq61VvKYEVQAX02VzFJCObwo=
X-Received: by 2002:aca:4ad5:: with SMTP id x204mr2021778oia.162.1578554035952;
 Wed, 08 Jan 2020 23:13:55 -0800 (PST)
MIME-Version: 1.0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-6-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-6-git-send-email-Julia.Lawall@inria.fr>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 9 Jan 2020 07:13:30 +0000
Message-ID: <CA+V-a8unNHBPLNH2m8Fw98ASJR5vp64+OZHGq-YYc9=BnonDsA@mail.gmail.com>
Subject: Re: [PATCH 05/16] media: isif: constify copied structure
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 1, 2020 at 8:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> The isif_config_defaults structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>

Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> ---
>  drivers/media/platform/davinci/isif.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/davinci/isif.c b/drivers/media/platform/davinci/isif.c
> index b49378b18e5d..c98edb67cfb2 100644
> --- a/drivers/media/platform/davinci/isif.c
> +++ b/drivers/media/platform/davinci/isif.c
> @@ -29,7 +29,7 @@
>  #include "ccdc_hw_device.h"
>
>  /* Defaults for module configuration parameters */
> -static struct isif_config_params_raw isif_config_defaults = {
> +static const struct isif_config_params_raw isif_config_defaults = {
>         .linearize = {
>                 .en = 0,
>                 .corr_shft = ISIF_NO_SHIFT,
>
