Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1877A304B0
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 00:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfE3WSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 18:18:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42993 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfE3WSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 18:18:17 -0400
Received: by mail-lf1-f67.google.com with SMTP id y13so6248192lfh.9
        for <linux-media@vger.kernel.org>; Thu, 30 May 2019 15:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cfZDu0nfyBLTaiN3tKuiZ+GpsXOx+pX9J56Zm8+dWQI=;
        b=aA+kIPnoEuuVQ5S6RGmMjQ/97AKHju7NlTKocTr3RIbGP0r1RPavluWiwolkV0JvOc
         l++KXeFPgKfLbCoKk86SlazPw4kJw/r5b4TV4EmyyT+XE5QIeV2FVDxxH8yEbOePKVXh
         pGYAV17YPe+QZpPSRtG37MOcAJ8YPeBIeYhnx5ot5TBQEYjSxH4vq0H2srV/HzhJamfm
         6WdHof/tSQgZkaXUPcmPuuNNMwxdPUcEOESCCbK1DSWjQtthulGeN5WU8041bKD5jmeu
         YVJoFaChIP/px6HwxJf9mw7/axaNM/fjbCAy47I54Q+nfqePtQUqAsJukVHnM6yvbViT
         HTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cfZDu0nfyBLTaiN3tKuiZ+GpsXOx+pX9J56Zm8+dWQI=;
        b=rAhEZXtjEvibH2rjp2uZxzx8BMjZ3pSO4ZfmqFX4Lg4rlW8G+jL5Xxgsno9JA3uzM/
         jFjvHWDP2gIVaSm9PmeBJ/qyD0tr/sl5Mj7zexoPI2MwOS6FUARtGh9AdzWumOkdMBJb
         9JU1J6cez/xRDWCj7NR+OOTVrdQKs4XC9p5S3uOBv+Nd7b1InMJXnogls4dBxl5vgi6B
         bWqYm8nbgm1R0H5UvF8W+u0w++xpopOLzbdaq8DN449Q8VKbibV8UtOYoo02XsNL/H4g
         fLskDXj7k5msrqa0ZZWdfoTfD52KehKRX/NgeY9TG6yBtKMJ+mAX1ZczHwcRgdrOrDjd
         BJ2w==
X-Gm-Message-State: APjAAAWaJ0YU0O8aEIHBgZPja4CNkuONVKV5mnoqZkqovJVd590IkQYn
        uuUxYG2VRELgN9xGQrUBCKYkM3+ifLEF9LU0U+M=
X-Google-Smtp-Source: APXvYqzz26uIDXMLWWjDb3+Cls1RkOKmckWD1iZJFK421RrAnmovwGPagAufLwszSDogLrYBQrVe0Uq/qyQBi0OnYXY=
X-Received: by 2002:ac2:5383:: with SMTP id g3mr3514931lfh.107.1559254695296;
 Thu, 30 May 2019 15:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca> <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
In-Reply-To: <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 30 May 2019 19:18:06 -0300
Message-ID: <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Robin Gong <yibin.gong@nxp.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sven,

[Addin Robin]

On Thu, May 30, 2019 at 6:34 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:

> Unfortunately I cannot load any imx-sdma firmware on the latest mainline
> kernel. Right after the firmware is loaded, reads seem to get corrupted
> and the whole kernel crashes / hangs.
>
> I am currently bisecting to find the offending commit:
> v.4.20 good
> v5.0 bad

I am not sure I understood the sdma firmware issue correctly.

Please start a new thread in linux-arm-kernel on this topic and also
copy Robin and the folks from
./scripts/get_maintainer.pl -f drivers/dma/imx-sdma.c

Thanks
