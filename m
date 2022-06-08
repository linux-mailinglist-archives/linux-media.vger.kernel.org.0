Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07902543BBD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 20:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbiFHSuK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 8 Jun 2022 14:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiFHSuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 14:50:06 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DBD392124;
        Wed,  8 Jun 2022 11:50:05 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id x16so12297324qtw.12;
        Wed, 08 Jun 2022 11:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=87dKZyu49pNfiTi55nRqzPD+LGTaoXWj5k4medJa6XY=;
        b=QvpqOe9+9uFWuuWBFb0hstXPjxy7e2weJmxOck4B6Xipwlv+urweRJ5ePq57B7P0+R
         wKldZfF/efrxgrrNR5IBeC+yePfLM3v5OzUYVVXW1emQ6+82TQjiSCTxXtuEnKyOpNAc
         p+H5W+Kti5fVUrv5pzwbVGYlQaTcChgKttq/sPROpYb+TRkAJWsm3I0hWX3mwURsl3b+
         8iei/4cp8xBCqY5olo/NFGaP2+ywMB/eVAkquGHUiIW0HFi8pBxZiRiTFVfcr+NaHgnh
         0CVgjSP0JfhGHXh8k4C6EylA7+kW/fm6jsyDD0Qm+09nI8e1tEvRAgBNxKzXBaemvIGJ
         Uc1w==
X-Gm-Message-State: AOAM5339bIO62HwUa8LdmTA9UwzRbduPeQyvQJU38TGC8Kg6+9auw5Kx
        KcSpraijpTkllV1/QrISU4rwtaEHj1/igg==
X-Google-Smtp-Source: ABdhPJyRiWn6qb4xdiBcqn9qB4zL2eyMwO+ch3rJfV7nYyjnh14bUBCuHIALR+QlFJClqiIi3p+U/g==
X-Received: by 2002:a05:622a:551:b0:2f3:d590:9a5e with SMTP id m17-20020a05622a055100b002f3d5909a5emr28278890qtx.165.1654714203862;
        Wed, 08 Jun 2022 11:50:03 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id o185-20020a375ac2000000b006a36b0d7f27sm16212619qkb.76.2022.06.08.11.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 11:50:03 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id r3so3847404ybr.6;
        Wed, 08 Jun 2022 11:50:03 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr36609031ybb.202.1654714203287; Wed, 08
 Jun 2022 11:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220608174446.994823-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20220608174446.994823-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jun 2022 20:49:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2opOfAB_-komWksw-gjB8HJq9tfMAt03qoSkOpjDKKA@mail.gmail.com>
Message-ID: <CAMuHMdU2opOfAB_-komWksw-gjB8HJq9tfMAt03qoSkOpjDKKA@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Fix channel routing for Ebisu
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URI_HEX autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Jun 8, 2022 at 7:45 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When converting to full Virtual Channel routing an error crept into the
> routing table for Ebisu (r8a77990). The routing information is used at
> probe time preventing rcar-vin from probing correctly on this SoC, solve
> by correcting the routing table.

You may want to list the actual error messages, e.g.
  - rcar-csi2: probe of feaa0000.csi2 failed with error -22
  - rcar-vin: probe of e6ef5000.video failed with error -22

> Fixes: 3e52419ec04f9769 ("media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Please replace by:
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
