Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D421A4D0E5E
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 04:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244692AbiCHDf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 22:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243305AbiCHDf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 22:35:56 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD4333343
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 19:35:00 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2dc585dbb02so124012827b3.13
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 19:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z8YcLICd5ozOotLHacoo6o3IiMpV2MGmEAAbrOhugvs=;
        b=E6bg8mbI/8B/nte9RAMX4UNf4tzDxc/13fNgc1359WYoXXBJhgU2AHy1Mt5dmk6ORV
         CZqWREQJdED5OsAd1DZ5/pahBNk2JABS9Dh5CDvx+PAQ8JdyJhk49uVPPEfmAN7yJXCJ
         c2j5jsDZP/cEoE98KPj9mxU6rGVBeWLoquYAV9n43PFXgnhSgCkJbC7W3YPSDcuIijDH
         n5NAn/WZzemkI56p7sfCBO8NUhxjIpU3oAIgcx+Cfc0TSYTGFA/z2gUua5zY3viHPNv/
         rGeXmQiR54M2xlSvwsF78wCgbiI7GqLOZe3cwDcI94mif1dFm24jA4du/mAtKFu6LnkV
         MDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z8YcLICd5ozOotLHacoo6o3IiMpV2MGmEAAbrOhugvs=;
        b=3YNOagGRPhMCQ6gNOSX/KenzLNtoxkIGAUwDbmQp7XlB0slZlWORdUiBgZtEjy5LWI
         MZWS9KxGrk3ZkREibe0xKB1ebI535VNgetAySODYyE9NdaRrXoJ0Ui9S7B1XKXgVS+aC
         vREs+RXL9eyL8Ob3+uB4HU6JwJaXgbZeY1WOqSYVVKDaia+PmmJwz24JevTQuepnonyM
         1H7r53Z4IZXiTogLgG09+QLnQ/uReu6lrBXt0b1HFH4wvFwdN50oMv2LpXn9IHIaFQRz
         NLYN0W4TEKa5FEuzKuXq7tR7kwKwHMS8qHzwo6NOQuoPI1LqbFn+W7QvJO2DbrL7Yw4C
         NfCA==
X-Gm-Message-State: AOAM5334FAcrfb3D2GpZ35RUO06/DGTlkGbyX+eQiNLrxgdfw9cNhFMf
        pb5ZdOC9l1ND8AWWNG4HBdA6iIwjh+nhCGlFL8arcV1v0RE=
X-Google-Smtp-Source: ABdhPJzo2dG+eNHZZX2iQtBwAtX7u8Wf3lG3tlRUrepurBhu4QFhvCI+Dq6HKWsqieO1b+2teU4IBJik9JBgYFkNdXU=
X-Received: by 2002:a0d:f844:0:b0:2db:972c:56e0 with SMTP id
 i65-20020a0df844000000b002db972c56e0mr11333696ywf.126.1646710498872; Mon, 07
 Mar 2022 19:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20220302211100.65264-1-paul.kocialkowski@bootlin.com>
 <20220302211100.65264-2-paul.kocialkowski@bootlin.com> <YiaTfsMDs7RGob2N@robh.at.kernel.org>
In-Reply-To: <YiaTfsMDs7RGob2N@robh.at.kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 7 Mar 2022 19:34:22 -0800
Message-ID: <CAGETcx9u9RO_5nSp+=qgwDGY=jL_Q1hAcj+RfVN=q-H_8iuT4w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/8] of: Mark interconnects property supplier as optional
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 7, 2022 at 3:21 PM Rob Herring <robh@kernel.org> wrote:
>
> +Saravana
>
> On Wed, Mar 02, 2022 at 10:10:53PM +0100, Paul Kocialkowski wrote:
> > In order to set their correct DMA address offset, some devices rely on
> > the device-tree interconnects property which identifies an
> > interconnect node that provides a dma-ranges property that can be used
> > to set said offset.
> >
> > Since that logic is all handled by the generic openfirmware and driver
> > code, the device-tree description could be enough to properly set
> > the offset.
> >
> > However the interconnects property is currently not marked as
> > optional, which implies that a driver for the corresponding node
> > must be loaded as a requirement. When no such driver exists, this
> > results in an endless EPROBE_DEFER which gets propagated to the
> > calling driver. This ends up in the driver never loading.
> >
> > Marking the interconnects property as optional makes it possible
> > to load the driver in that situation, since the EPROBE_DEFER return
> > code will no longer be propagated to the driver.
> >
> > There might however be undesirable consequences with this change,
> > which I do not fully grasp at this point.

Temporary NACK till I get a bit more time to take a closer look. I
really don't like the idea of making interconnects optional. IOMMUs
and DMAs were exceptions. Also, we kinda discuss similar issues in
LPC. We had some consensus on how to handle these and I noted them all
down with a lot of details -- let me go take a look at those notes
again and see if I can send a more generic patch.

Paul,

Can you point to the DTS (not DTSI) file that corresponds to this?
Also, if it's a builtin kernel, I'd recommend setting
deferred_probe_timeout=1 and that should take care of it too.

-Saravana

> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/of/property.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index 8e90071de6ed..ef7c56b510e8 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -1365,7 +1365,7 @@ static struct device_node *parse_interrupts(struct device_node *np,
> >
> >  static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_clocks, },
> > -     { .parse_prop = parse_interconnects, },
> > +     { .parse_prop = parse_interconnects, .optional = true,},
> >       { .parse_prop = parse_iommus, .optional = true, },
> >       { .parse_prop = parse_iommu_maps, .optional = true, },
> >       { .parse_prop = parse_mboxes, },
> > --
> > 2.35.1
> >
> >
