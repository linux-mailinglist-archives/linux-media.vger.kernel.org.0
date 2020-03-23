Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C2918F525
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgCWM7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:59:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35856 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgCWM7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:59:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id l23so3146683otf.3;
        Mon, 23 Mar 2020 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LcL7NFf1VbOFbGi8gEHkrb48EWgx8x6fvvv1OFivXUI=;
        b=FEEtucAk3US5lzQQfXq0g9jyX12UKe590yUuXn+oZA9WdhZHVlzqMtak6uqDMdgcIR
         mA+OmRqIGjV63PLoKEE+osD/n/MVliMuIoY2nkQMcDkGCVIO/hoFp5JambLzc7RV5qAA
         +IX8cWC5n0FW3zs8GD5N7tG/mzbm0Om8AMbDnRNorV7c80Ht+uH0IoAzsFxfj9tsBNKq
         Xt7RmAG374Cz2fdkzMd32RXxGEfK2rw9Cm8HpLfj46pSevW865k3I7UNgUd7gc7zaSHG
         iFw0PFXPO8uNvIB/11qLJITvhsxg5ZDiEgtoyVWF/BtK2pcw5V+I0vUg+VUOspJAa6WT
         M4Lg==
X-Gm-Message-State: ANhLgQ2kkklA7IIHNdmv6QY2XpN7JUFoEG9lJKNWOWSUI1+OT3MV72Oo
        OpTQ1XMrUjP+TvwxqcBYJNFV9NycMD0uFaX+RAjokKii
X-Google-Smtp-Source: ADFU+vtlscBXntlDAGbV/+TxW4lI+OzrZDwDWjdF9xH8uOdxeSQhyOOvhhe7o5cQXkIKVUyPm1Fkfh8mHO3x96VeB2A=
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr16969045otf.107.1584968377832;
 Mon, 23 Mar 2020 05:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200318172338.20132-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20200318172338.20132-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Mar 2020 13:59:26 +0100
Message-ID: <CAMuHMdXhVpSdZautUc-64fALN+_n-3Vy4iUTU+ODo_1K4OmDwA@mail.gmail.com>
Subject: Re: [PATCH RFC] media: platform: fcp: Set appropriate DMA parameters
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Mar 18, 2020 at 6:23 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Enabling CONFIG_DMA_API_DEBUG=y and CONFIG_DMA_API_DEBUG_SG=y will
> enable extra validation on DMA operations ensuring that the size
> restraints are met.
>
> When using the FCP in conjunction with the VSP1/DU, and display frames,
> the size of the DMA operations is larger than the default maximum
> segment size reported by the DMA core (64K). With the DMA debug enabled,
> this produces a warning such as the following:
>
> "DMA-API: rcar-fcp fea27000.fcp: mapping sg segment longer than device"

... claims to support [len=3145728] [max=65536]

> We have no specific limitation on the segment size which isn't already
> handled by the VSP1/DU which actually handles the DMA allcoations and
> buffer management, so define a maximum segment size of up to 4GB (a 32
> bit mask).

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Fixes: 7b49235e83b2 ("[media] v4l: Add Renesas R-Car FCP driver")
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

The warning is gone, so:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Haven't tested the actual display, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
