Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A895924529B
	for <lists+linux-media@lfdr.de>; Sat, 15 Aug 2020 23:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgHOVxZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Aug 2020 17:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbgHOVwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Aug 2020 17:52:43 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB28C08E81C;
        Sat, 15 Aug 2020 03:35:04 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x2so6587041ybf.12;
        Sat, 15 Aug 2020 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FdBEk/PFONKRBL3ptMIHWrtdhPvwvR5FjJYMrVCgHg=;
        b=W0+BYyOkemwI7h+hvaQAo9s1FdDmpB1n0aNtcGAEnmapUJuIHMqNKh1Gel888k+TBR
         2rJRGW/9mDlu1hhxgiKEEQIj54ljTE2rlP6NpfoSJfDFo5URkupbE+RayKBnPF2Ui1CO
         qhL3AFYQRU/OF7JheALPd9Xma4NxeJ7UQ35Xszq0opOlLLCDCryugaoLMyN6c8BSTJ/I
         0GO0bJin77B3ez6SH1jCcUBFaavqNClT/nMnhuFG9bzl8nYX/+2JLdeUEOfhV3AfM1Ka
         sTSJa8KrMmB86rmTT6dwUqw+ab6HYYxc78Vp2bhz+FWvAaegeWHjWLXI6i4isi5xTuZ5
         orcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FdBEk/PFONKRBL3ptMIHWrtdhPvwvR5FjJYMrVCgHg=;
        b=Z/Uix5qVrF/lUlxst9LAudbpTaaSmAHsemZVUKFXzSEs1NJnTLl8u0wnqFULyPNk1h
         aQ2fjJmaaXFbAyHW8Q4B+2p4pp65uA/FL9C6cFHK95UpnJUca/fj4mxY+5zmjuBc+nQi
         gQv96ERrp9JRjFyZmo0kN3TcUoPgLdNu9ID0/iKMnZZ0seyxEN9zSw/7g2BcBm9mAoIz
         o0r55GKR08oN460ufAVtpOn9NZ2Lq7RMKY0fDvdkJ/UEugGxHFzdAYgGJWDVWAvCXiQX
         tLwKgFXUiZtVIrZno6Z0ns/Qb0CXhRsQetSe7rxqBk6hbxUCqkN0WfLkTbJrWVffxLrU
         p7Xw==
X-Gm-Message-State: AOAM532nyelMvqRTYjfaA+71jw77kVn7IMbgUU3L9YSllxTBl51xYo7K
        GeSz4BJ1+TiirMaaX1xw+zNdnwDp8enGzT/He5E=
X-Google-Smtp-Source: ABdhPJz73oqfRaOfnalXbIezKUlfuEnoM5U/cUCYFspm9g39RLuwP9rmVKplgEBHzq46yz+aGDTTKBATvPsaKi73+34=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr8401661ybp.25.1597487699922;
 Sat, 15 Aug 2020 03:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596454753-13612-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1596454753-13612-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 15 Aug 2020 11:34:33 +0100
Message-ID: <CA+V-a8sjxL-rbYAti8Djj2ch2+Zf+88_wNjbZHzKVBB66aZJ0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: ov772x: Document endpoint properties
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Aug 3, 2020 at 12:39 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> Document endpoint properties required for parallel interface
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/media/i2c/ov772x.txt     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
I see you already have a patch for YAML conversion for OV772x binding
[1], if you plan to post a v2 would you be OK to pick these changes as
part of your conversion changes ?

[1] https://www.spinics.net/lists/linux-media/msg173201.html

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> index 0b3ede5b8e6a..1f4153484717 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> @@ -21,6 +21,22 @@ subnode for its digital output video port, in accordance with the video
>  interface bindings defined in Documentation/devicetree/bindings/media/
>  video-interfaces.txt.
>
> +Endpoint node required properties for parallel connection are:
> +- remote-endpoint: a phandle to the bus receiver's endpoint node.
> +- bus-width: shall be set to <8> for 8 bits parallel bus
> +            or <10> for 10 bits parallel bus
> +- data-shift: shall be set to <2> for 8 bits parallel bus
> +             (lines 9:2 are used) or <0> for 10 bits parallel bus
> +- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> +               (Not required for bus-type equal 6)
> +- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> +               (Not required for bus-type equal 6)
> +- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> +              signal. (Not required for bus-type equal 6)
> +- bus-type: data bus type. Possible values are:
> +           5 - Parallel
> +           6 - Bt.656
> +
>  Example:
>
>  &i2c0 {
> --
> 2.17.1
>
