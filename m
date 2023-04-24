Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75796ED502
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 21:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbjDXTDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 15:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjDXTDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 15:03:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07AC6591
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 12:03:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4edc114c716so5198314e87.1
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1682362984; x=1684954984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rrKZhdqvsHcL2eE1Tlj0lralBU4//ybz6Asm4M4JWI=;
        b=SK+qS9QUAesvGTF7jMTDUC7mg4nbWlqMJke9j6fyDA+3PtdXd/ga8qtPlqDX/R2sjZ
         zyjWmSlk3lMEWhfjKlSugdY6W9ODIAmtvE6GBWVSUKx1G0LEVuVf04avPwwHmnuWnobn
         pI7NyyXq0CwAplJwiKicO2a9FQAbu75JscuC5s6B/6R0xQCWpfbMGN6hNKypKe+uP/km
         HDJF5OkM/RICdlT5ZJ2kZwZnWxwk2H6KBGGexVcJYAzaEfuQFe1BkkrKzAVpuVesjOBs
         IKob7duyYcYASBQNRcP0c2tOELYLMNY1JYB1dQOjOYh05S/PTBkv1aQ80AbJFi69mv9d
         GVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682362984; x=1684954984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+rrKZhdqvsHcL2eE1Tlj0lralBU4//ybz6Asm4M4JWI=;
        b=b6SEmICBQ4aaRGI+K/3e+zMEWt0ybvhvivFCdfvZ87WvKsUt+YBNiAQnw8YYwdZN6O
         ggCnxGkEU8+/heBIUIGrqZTUP0sAJMWp3ozVwGEuBe7XKgV5doV3l3h/hLa4nQfkbY2U
         Ye+8WueuEh2RONsufG8W+FDRty8keHghCSGov74NCd6mEBPurF/GkqHtanRYX9QYaQxE
         ONzwwxlfJSB6oMjPlSwBGlzFhft9d1zTCiuyt0eWyeB79lT/clwFqcy35tSjMVXIDQRg
         IianrlL34Wlt1CnPHA28iByKShOrp76t9pxgpbd9R6Y07psskW2bAzHXV0GsCRadc5QC
         zxCw==
X-Gm-Message-State: AAQBX9fYmLVFqUjT3G0QcSLc3Q0ivxlZXqjRhFM+Ilzq0xa5tJalLOku
        JAVMIPFUl37lrV6u0Zv4nkbQFQ==
X-Google-Smtp-Source: AKy350bO2hmQmpo9hga9LbnomEMpI+JgAfH7Vq6flRmvl4jiui24eqCScu9P6K83QgJHmvVjNFePxg==
X-Received: by 2002:a19:7403:0:b0:4eb:252e:3ec5 with SMTP id v3-20020a197403000000b004eb252e3ec5mr3252308lfe.14.1682362984089;
        Mon, 24 Apr 2023 12:03:04 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id q22-20020ac246f6000000b004edc4a8bfa3sm1773607lfo.176.2023.04.24.12.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 12:03:03 -0700 (PDT)
Date:   Mon, 24 Apr 2023 21:03:02 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: rcar-csi2: Add support for V4H
Message-ID: <ZEbSZvzzm7qxYkKb@oden.dyn.berto.se>
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
 <7f528964-36ae-71b9-0bd9-5c75b9d89594@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f528964-36ae-71b9-0bd9-5c75b9d89594@xs4all.nl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for looking at this series.

On 2023-04-18 08:45:22 +0200, Hans Verkuil wrote:
> Hi Niklas,
> 
> On 11/02/2023 15:53, Niklas Söderlund wrote:
> > Hello,
> > 
> > This series adds support for Renesas R-Car V4H. The work depends on the 
> > series which adds the compatible value added to the bindings 
> > documentation, posted separately [1].
> > 
> > Patch 1/3 prepares the driver for R-Car Gen4 by creating function 
> > pointers for differences with Gen3. Patch 2/3 prepares for parsing CSI-2 
> > C-PHY properties. Finally patch 3/3 adds V4H support.
> > 
> > Tested on both Gen3 and Gen4 hardware without any regressions. Tested 
> > using both regular capture and v4l-compliance.
> > 
> > 1. [PATCH 0/3] media: dt-bindings: media: Add bindings for video capture on R-Car V4H
> > 
> > Niklas Söderlund (3):
> >   media: rcar-csi2: Prepare for Gen4 support
> >   media: rcar-csi2: Prepare for C-PHY support
> >   media: rcar-csi2: Add support for C-PHY on R-Car V4H
> > 
> >  .../platform/renesas/rcar-vin/rcar-csi2.c     | 394 +++++++++++++++++-
> >  1 file changed, 379 insertions(+), 15 deletions(-)
> > 
> 
> Can you rebase and repost? This series no longer applies.

Sorry it took so long, I have rebased and reposted this series here,

https://patchwork.linuxtv.org/project/linux-media/list/?series=10363

> 
> Thanks!
> 
> 	Hans

-- 
Kind Regards,
Niklas Söderlund
