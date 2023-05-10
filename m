Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332026FD852
	for <lists+linux-media@lfdr.de>; Wed, 10 May 2023 09:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236136AbjEJHfM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 10 May 2023 03:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236430AbjEJHep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 May 2023 03:34:45 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36FE7DA2;
        Wed, 10 May 2023 00:34:10 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-559de1d36a9so99707607b3.1;
        Wed, 10 May 2023 00:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683704047; x=1686296047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gkle6MFunZwctXm+NJ0fWmomYZ/EJG5G6Qzbw2JFYGg=;
        b=E2cWdl2pRtNG/GC+cmf/NGbcNfy6IiAzN0n1RbD7ZGHRCAkZ8ThZXSusqeZ3Rvzlfo
         MledGIfYRC4pL0HBl+HeyxJd9x5mEZKTxprlYqLTTa91xDS/fs0eoowOlHbfleZ9Wubu
         6zc8+Onx1rAoKD5gr926mrBAigbrDiwmWDw6A1jmWaweMeeWDQii8mVCzlI3yyaj14Az
         2/uv5tiof5OIWom2Qld2/oL9aWcKY4b7cr+RlRaf3KHtUlT24FpGAzesJHOAj9T/GVzZ
         gp9BxHihGjon/PvYPoG0Y68rIsDCT0+pq+AUZ6zoCk2BAZWlhx6TC9nlQgN1mw/m50m6
         z6/g==
X-Gm-Message-State: AC+VfDzQgkUptaH0lguQuMHeLihfgkdHR6HrBKK80pnZ7Vage3+i//ZH
        nvAyn3ffziZiLvKE/ZC2/N4fsgOEBGHk+A==
X-Google-Smtp-Source: ACHHUZ5MUgZ0Sql8Z/SQAaPBGHEkM961+t2oFpUnOa9UbQzaJeeYevnBCtzq0dEWq4z+c1jHAGLHJQ==
X-Received: by 2002:a0d:ff81:0:b0:55d:de9e:d913 with SMTP id p123-20020a0dff81000000b0055dde9ed913mr14430198ywf.42.1683704047207;
        Wed, 10 May 2023 00:34:07 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id q6-20020a0de706000000b0055a07e36659sm3843518ywe.145.2023.05.10.00.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:34:07 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-559e53d1195so99712137b3.2;
        Wed, 10 May 2023 00:34:06 -0700 (PDT)
X-Received: by 2002:a81:6d48:0:b0:55a:881d:e744 with SMTP id
 i69-20020a816d48000000b0055a881de744mr19194874ywc.47.1683704046354; Wed, 10
 May 2023 00:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230509190031.769298-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 May 2023 09:33:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYY-xMZEF-Nzi=c3R+Cq+ysrdZ0cP10GLg6A_uJ7ukRA@mail.gmail.com>
Message-ID: <CAMuHMdVYY-xMZEF-Nzi=c3R+Cq+ysrdZ0cP10GLg6A_uJ7ukRA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: maxim,max96712: Require setting
 bus-type property
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 9, 2023 at 9:03 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The MAX96712 can support both a CSI-2 C-PHY and D-PHY bus. The initial
> staging driver however only supported D-PHY and the bus-type property
> was left optional.
>
> In preparation for adding C-PHY support to the staging driver make the
> bus-type property mandatory as it is needed to select the correct PHY
> mode. Without the bus-type property present, the driver falls-back to
> D-PHY mode, so the change is functionally backward compatible with old
> DTS files lacking the property.
>
> The only in-tree DTS file (renesas/r8a779a0-falcon-csi-dsi.dtsi) that
> lacked the property uses D-PHY and have been updated.

has

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Use symbolic names in comments for the bus-type properties.
> - Improve the commit message.
> - Rebased to v6.4-rc1.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
