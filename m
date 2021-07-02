Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919633BA4A5
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 22:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbhGBUZs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 16:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhGBUZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 16:25:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40298C061762
        for <linux-media@vger.kernel.org>; Fri,  2 Jul 2021 13:23:15 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a15so20161802lfr.6
        for <linux-media@vger.kernel.org>; Fri, 02 Jul 2021 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=phystech-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=YS7Rh7bjOGjf3GzbkGuMZZqduHpV/ZItv36o34+uxXQ=;
        b=URbyxG7Joz/rVUHzhPvmmIZ5C77NVhMjqmoxjqEbCAfbJ7+Py2lYdDaQ2km8wcPrAr
         mGnMbqoXv9MpvRXKAV4SCMWYyFsj+UjsN0hktMR+E8RoJ20E5WmEALnI6Z5ZblNBPeJ1
         dsjlrGx3wGG+aZL6gyybLP7REh0Gm8XCgvD1HQj7zbVimeiZ3y2PCfLdOZjzv7MKD6VA
         fB7Bfht/TAXGm2kgZd9GTZAgPKC40M+CsW/Pa2NcsfRzc17Xb45w0IfVqPIUnM0yEbBk
         vuTmFzu6DJF3zlUeDHU+aWcYxP+5lkUvwcIj3fVO0rHtlvDd7q43HOv4q0ffAFAgIWs9
         zMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=YS7Rh7bjOGjf3GzbkGuMZZqduHpV/ZItv36o34+uxXQ=;
        b=Ixr+4TVFWnoMZEHgsFy27OWOQBSI4M08Vwe2R70yiVOlSdFMNTQcE2muDqff80jJvg
         G2OFeVDIDiz02GurvDm0FXSodrxaRPoudmvyF9U6o1/pIaWoWG5AB1fq0BDqO0Yb9LyU
         cMwtv+r0940rE96/m4q+q7Iw45hZ7FK/yqqtDIBfG6eW6P5tpTmot2xmaxMula/lAv/t
         ufp7iqsBXU/RD3YmJCHdOoetcfTT7U6h4nPIB3sghwwF71S4XU5Qcs2/ZX9aZ1vUISkk
         d63M7j681ZQdhVxIDCLJDttH5T8p8Z8+Tlwskmvo8GkO821WojFxrfnEOaP/NrA6Tn4Z
         b8xw==
X-Gm-Message-State: AOAM5312vPMxiWoEjscXLBqVBvkFAfrTi8a6vMRj1LwH2f28CRVkgitu
        UKkaaTjhDrjg5g45uW6/1G66iA==
X-Google-Smtp-Source: ABdhPJyAnONSruQCpJ77tfZgLVDFMcoJBz/dX6KycdmqQHOmvUz/HM0dEDf5d6/1kvt34oxf4TphzA==
X-Received: by 2002:a05:6512:1188:: with SMTP id g8mr1032423lfr.114.1625257392632;
        Fri, 02 Jul 2021 13:23:12 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:4d3d:fdb7:f150:ee77:eba5])
        by smtp.gmail.com with ESMTPSA id m1sm453543ljb.138.2021.07.02.13.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 13:23:12 -0700 (PDT)
Date:   Fri, 2 Jul 2021 23:23:05 +0300
From:   Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Sean Young <sean@mess.org>, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
        jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Subject: Re: [PATCH 2/2] media: rc: introduce Meson IR blaster driver
Message-ID: <20210702232305.5060a04b@192.168.1.3>
In-Reply-To: <CAFBinCA+zud1THT6z2QsGCqXMT-3nqN_S4nR0FhaDGhcKzoe-Q@mail.gmail.com>
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
        <20210701215132.16317-3-viktor.prutyanov@phystech.edu>
        <20210701224646.GA18540@gofer.mess.org>
        <CAFBinCA+zud1THT6z2QsGCqXMT-3nqN_S4nR0FhaDGhcKzoe-Q@mail.gmail.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Fri, 2 Jul 2021 18:15:18 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Sean,
> 
> On Fri, Jul 2, 2021 at 12:46 AM Sean Young <sean@mess.org> wrote:
> >
> > Hi Viktor,
> >
> > Thank you for your driver. Is there a datasheet available for this
> > hardware?
> The public S905X datasheet [0] (starting at page 515) and the public
> S905D3 datasheet [1] (starting at page 1105) document the registers.
> If Viktor has additional or better information then it would be great
> if he could share it with us.

I can add that descriptions of A311D and T950D4 blasters are the same
as S905D3, including 0xFF800000 base address.
The A311D public datasheet doesn't say anything about IR blaster, but
it is still present on this SoC.

Best regards,
Viktor Prutyanov
