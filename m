Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5E54DD5C7
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 09:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbiCRIGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 04:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbiCRIGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 04:06:36 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF64220B1B;
        Fri, 18 Mar 2022 01:05:17 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id 10so6302074qtz.11;
        Fri, 18 Mar 2022 01:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wkNvcMCqZ/MJozq7eDdEGExLgcXdX/7/iK9I+erirLo=;
        b=O5NjqS1izjN0fU6v1FRts+34A5MIGpKTExWmYOcJX1L+PBQUakMbXXdOncBd/+fHgD
         ByLLBb0CM0dKU7jP4qT9gaYl9fX3YBux3lj3X1rG3245cv9enUZ27gMIJw2j0yMCpaAE
         XyoasgohVdGlzFNVYFIQwOtY3ykrK86HV9Y00Kf6cASGPMx1RmW1QGyDCm7JHnuPpnp2
         mIIkOZNa1FFvkgKoEOOlKd3vcbOAlP7XLOAEKCD+OJq3+ofK3Cxk1rhX1cwsxSP2k6nd
         TpkSB7r3334U211a/7cJ8xlC+p2vHrGRK1qHV9vq3WAOOkWLVJO2Rk0BpDyMg2wtEfCu
         BuDw==
X-Gm-Message-State: AOAM531Hq3jAvM+4CjjKTAJojFD2ZxHwO30x1vXGEOjcndHrObu05s05
        LCDRfOpKALDzngtNiNudvFtLx5ACFOCAp6U3
X-Google-Smtp-Source: ABdhPJwTngDWRNIu4ss2hElqdg9uRUT2MpTJbvEM+Cy5GLes5g93RiV3lTuv1vUb2yqXOHVei5MPJg==
X-Received: by 2002:ac8:7d52:0:b0:2e1:c6fa:aeac with SMTP id h18-20020ac87d52000000b002e1c6faaeacmr6487742qtb.507.1647590716741;
        Fri, 18 Mar 2022 01:05:16 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id bm21-20020a05620a199500b0067d5e6c7bd8sm3512274qkb.56.2022.03.18.01.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 01:05:16 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id j2so14637224ybu.0;
        Fri, 18 Mar 2022 01:05:16 -0700 (PDT)
X-Received: by 2002:a25:dfd3:0:b0:629:24ff:eab0 with SMTP id
 w202-20020a25dfd3000000b0062924ffeab0mr8490596ybg.613.1647590716151; Fri, 18
 Mar 2022 01:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220317204903.28163-1-laurent.pinchart@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 09:05:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-frw9DNn38qLyogzz_7OnZO1TK3xMrwPYODNCfm=-uA@mail.gmail.com>
Message-ID: <CAMuHMdX-frw9DNn38qLyogzz_7OnZO1TK3xMrwPYODNCfm=-uA@mail.gmail.com>
Subject: Re: [PATCH] media: platform: renesas-ceu: Fix unused variable warning
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 17, 2022 at 10:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The ceu_data_rz variable is unused when CONFIG_OF isn't set. This
> generates a compiler warning. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
