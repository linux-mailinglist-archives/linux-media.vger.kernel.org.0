Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3245A3828B5
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 11:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbhEQJsL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 17 May 2021 05:48:11 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:42699 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236047AbhEQJsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 05:48:09 -0400
Received: by mail-ua1-f48.google.com with SMTP id 14so1891835uac.9;
        Mon, 17 May 2021 02:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vxVFPkSBTT2nSQ9FymGm3Wtfy1I8BdGu4qfZpCtcRwU=;
        b=egWhn3aCBtuQOEKQJUjZTJCLR4evZlCK3QaoSfUhxHGzVIRAPi+Jwi1tSQ3sE3FRJk
         UioR+WsuBsn3/PkZEEs9cJayqNFdUdYrEkyZgw0R9MKFpCGv0/oY9Og64HRnndorrQaH
         c3ec38jC4pHTuOl6GBxrnFZrQt/IA3DDvxugXnqJn7kweLsXiQc9QAFiMIFGFHjoc8FG
         f4i3KgZNWKVaJIFdKyBSDPAh3Jt/kfbuA2h/0E5DP/jvTngkYDZ9I0+GphE3+qZLLfY5
         gHgNbEu7XqEwZiYLVbl1hkD//M51YjnxSCBWDw4CvqvVEQ4wnuBHLLwa3+U0Vpf9fAtZ
         neDQ==
X-Gm-Message-State: AOAM532gB0nNHU0brM9tfQYtZOZKN/FQMyRvXTsulvguPp0DiRgRHeT+
        C747eKjZf2B/3pQyRxlSTJ5AsIqPcBAlMeHdy//CiltY
X-Google-Smtp-Source: ABdhPJwmSIIVmVQlAddQPxsF/3ClYHBdR61KRUEjt1oxBGgWXBf208er2gu1KqsCqN9ovfQAmYV5Z3s6z5ouDb0tcMY=
X-Received: by 2002:ab0:59cb:: with SMTP id k11mr38500511uad.100.1621244813318;
 Mon, 17 May 2021 02:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210513124715.598093-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210513124715.598093-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 11:46:41 +0200
Message-ID: <CAMuHMdXQD7sbivduXxh_X=mXkWeq158sgv1FtYZC2N3o28y_kA@mail.gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Enable support for r8a77961
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 13, 2021 at 3:02 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Enable support for M3-W+ (r8a77961).
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: LUU HOAI <hoai.luu.ub@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
