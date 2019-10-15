Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49CC0D79FA
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 17:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfJOPlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 11:41:18 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33041 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbfJOPlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 11:41:18 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so20781604ljd.0
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMWKz/BfAU6PVQfo5cMiSTWQTQfgI9yVir3z3+W/plE=;
        b=fo3SJrLJ32Hewy7Iv1+qfy5weVC8rqu9JEV7qY1ZxcpDbKfakYt8Tqql9QLtLlT27C
         p6G4qcqK5P44tdTsM0XzU4OCZauIkC4oQo5aq0OvhCTze7tyEcJTsjjKOG4ny67aVEi3
         krsY5vjKn13q3Yp32KDcoBdLZn5v4t7nFQ/S+7w3RccN9tsMJZ8RpmzuDR1LRhslGEWf
         9/ZLiDEaq6hvCOD131V2d87FBquJv9Mft8NWpax40YxllK2woTMdwDkZatrYPiLFX8q4
         kpDjnsmkfO+SZODLm8pU6abh16ZD687myTiT+RM7Qu1Tukxraq7wzUnjAeh1fL/vBBRh
         N5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMWKz/BfAU6PVQfo5cMiSTWQTQfgI9yVir3z3+W/plE=;
        b=KLeH7ZBuLw/1inZdrd+ZL8gZpujZ6pG+BYWbTLLrNNakzWNfN6YafVhSY3KilFLnEK
         IUqqIHAX7uYdKoTxxQZ4AWPJN7gPBOM71ptbzIcNMvSFIMnHYdxokcp2xKUUodZ4Uecs
         bFFzijBE1UYb5R91bkn+xAkl/gdRlhyDd0XFMo19PuoarlEw/W67IRUPElOdh6NLLHe2
         ZrI+GaWcs89UZMYFiWfKHJk3s0Uz4OqC9ckEKYuqa6vK1nEcf302puQsOnnkF85N0s+o
         BNKRJTTnjH9dbk4Y1ppKuHK97tF+IVgiU906O62TToop52XcdJXdcfRgATD+kMNW01bU
         R3tA==
X-Gm-Message-State: APjAAAXhk6Y/Sng494O/bwemP7Be/FepXgBb8LLcYIR1RBoOL6Nu5agN
        9ZnN6Ju1FP4UJhuAgs4EmpgpEa6TvTfHaBt8ncfoX2ZdOjQ=
X-Google-Smtp-Source: APXvYqweuNVDxIyqVYeLkPg5t6QOdNAsoPyuuR37u9WRtUMvaLOERiyHPcHu3aJcLtMx0q724gMBj1zAcIlV5LH/llE=
X-Received: by 2002:a2e:b4d5:: with SMTP id r21mr22328221ljm.149.1571154076047;
 Tue, 15 Oct 2019 08:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191014135424.7000-1-festevam@gmail.com> <20191014135424.7000-3-festevam@gmail.com>
 <dd72d8a5-3067-b640-12b6-052d3ecf57ca@gmail.com> <CAOMZO5BCkrdm=nibu1W0pLMKor1A__G2AkuBxJEQ6D9LSqxmTw@mail.gmail.com>
In-Reply-To: <CAOMZO5BCkrdm=nibu1W0pLMKor1A__G2AkuBxJEQ6D9LSqxmTw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Oct 2019 12:41:12 -0300
Message-ID: <CAOMZO5BSrHpy1hkNzDthd2Dbr0konoMbESmJwjNfpZvU5mDTgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: imx.rst: Provide instructions for the
 i.MX6DL sabreauto
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 15, 2019 at 11:27 AM Fabio Estevam <festevam@gmail.com> wrote:

> Yes, I can add it.
>
> What is the video device node for "ipu1_ic_prpvf capture" on the imx6q
> sabreauto?

I managed to get access to a imx6q-sabreauto and it's /dev/video2.

Will send a new patch series soon.

Thanks
